object frmMain: TfrmMain
  Left = 463
  Top = 0
  Caption = 'Baixa Autom'#225'tica Wallet'
  ClientHeight = 229
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 474
    Height = 31
    Align = alTop
    TabOrder = 0
    DesignSize = (
      474
      31)
    object btnProcessar: TBitBtn
      Left = 8
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Processar'
      TabOrder = 0
      OnClick = btnProcessarClick
    end
    object btnPreferencias: TBitBtn
      Left = 385
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Preferencias'
      TabOrder = 1
      OnClick = btnPreferenciasClick
    end
    object chbNumerarios: TCheckBox
      Left = 127
      Top = 6
      Width = 97
      Height = 17
      Caption = 'Numer'#225'rios'
      TabOrder = 2
    end
    object chbPagamentos: TCheckBox
      Left = 215
      Top = 6
      Width = 97
      Height = 17
      Caption = 'Pagamentos'
      TabOrder = 3
    end
  end
  object Memo: TMemo
    Left = 0
    Top = 31
    Width = 474
    Height = 179
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    OnChange = MemoChange
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 210
    Width = 474
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
      end
      item
        Width = 50
      end>
  end
  object tmrIntegracao: TTimer
    Enabled = False
    OnTimer = tmrIntegracaoTimer
    Left = 48
    Top = 79
  end
  object HTTPRIO1: THTTPRIO
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = [wnoSOAP12]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 320
    Top = 136
  end
end
