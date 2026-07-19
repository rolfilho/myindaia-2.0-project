object frmProcessaSDA: TfrmProcessaSDA
  Left = 154
  Top = 113
  ActiveControl = btnParametros
  BorderStyle = bsSingle
  Caption = 'Processa SDA'
  ClientHeight = 394
  ClientWidth = 764
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
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 764
    Height = 375
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 762
      Height = 76
      Align = alTop
      TabOrder = 0
      object btnParametros: TButton
        Left = 672
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Par'#226'metros'
        TabOrder = 0
        OnClick = btnParametrosClick
      end
      object btnGerarXMLSTS: TButton
        Left = 13
        Top = 6
        Width = 140
        Height = 25
        Caption = '    Gerar XML STS'
        TabOrder = 1
        OnClick = btnGerarXMLSTSClick
      end
      object btnTransmitirArquivosSTS: TButton
        Left = 165
        Top = 6
        Width = 140
        Height = 25
        Caption = '      Transmitir XML STS'
        TabOrder = 2
        OnClick = btnTransmitirArquivosSTSClick
      end
      object chbGerarArquivoSTS: TCheckBox
        Left = 20
        Top = 10
        Width = 16
        Height = 17
        TabOrder = 3
      end
      object chbTransmissaoSTS: TCheckBox
        Left = 172
        Top = 10
        Width = 16
        Height = 17
        TabOrder = 4
      end
      object btnBaixarGuiaSTS: TButton
        Left = 316
        Top = 6
        Width = 140
        Height = 25
        Caption = '      Baixar Guia STS'
        TabOrder = 5
        OnClick = btnBaixarGuiaSTSClick
      end
      object chbBaixarGuiaSTS: TCheckBox
        Left = 323
        Top = 10
        Width = 16
        Height = 17
        TabOrder = 6
      end
      object btnProcessarBrokerSTS: TButton
        Left = 467
        Top = 6
        Width = 170
        Height = 25
        Caption = '      Digitalizar / Lan'#231'ar Pgmto STS'
        TabOrder = 7
        OnClick = btnProcessarBrokerSTSClick
      end
      object chbProcessarBrokerSTS: TCheckBox
        Left = 474
        Top = 10
        Width = 16
        Height = 17
        TabOrder = 8
      end
      object btnGerarXMLRJ: TButton
        Left = 13
        Top = 43
        Width = 140
        Height = 25
        Caption = '    Gerar XML RJ'
        TabOrder = 9
        OnClick = btnGerarXMLRJClick
      end
      object chbGerarArquivoRJ: TCheckBox
        Left = 20
        Top = 47
        Width = 16
        Height = 17
        TabOrder = 10
      end
      object btnTransmitirArquivosRJ: TButton
        Left = 165
        Top = 43
        Width = 140
        Height = 25
        Caption = '      Transmitir XML RJ'
        TabOrder = 11
        OnClick = btnTransmitirArquivosRJClick
      end
      object chbTransmissaoRJ: TCheckBox
        Left = 172
        Top = 47
        Width = 16
        Height = 17
        TabOrder = 12
      end
      object btnBaixarGuiaRJ: TButton
        Left = 316
        Top = 43
        Width = 140
        Height = 25
        Caption = '      Baixar Guia RJ'
        TabOrder = 13
        OnClick = btnBaixarGuiaRJClick
      end
      object chbBaixarGuiaRJ: TCheckBox
        Left = 323
        Top = 47
        Width = 16
        Height = 17
        TabOrder = 14
      end
      object btnProcessarBrokerRJ: TButton
        Left = 467
        Top = 43
        Width = 170
        Height = 25
        Caption = '      Digitalizar / Lan'#231'ar Pgmto RJ'
        TabOrder = 15
        OnClick = btnProcessarBrokerRJClick
      end
      object chbProcessarBrokerRJ: TCheckBox
        Left = 474
        Top = 47
        Width = 16
        Height = 17
        TabOrder = 16
      end
      object BitBtn1: TBitBtn
        Left = 672
        Top = 45
        Width = 75
        Height = 25
        Caption = 'teste qry'
        TabOrder = 17
        Visible = False
        OnClick = BitBtn1Click
      end
    end
    object Memo: TMemo
      Left = 1
      Top = 77
      Width = 762
      Height = 297
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 1
      OnChange = MemoChange
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 375
    Width = 764
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
  object tmrIntegracao: TTimer
    Enabled = False
    OnTimer = tmrIntegracaoTimer
    Left = 32
    Top = 224
  end
  object tmrErroWeb: TTimer
    OnTimer = tmrErroWebTimer
    Left = 32
    Top = 152
  end
end
