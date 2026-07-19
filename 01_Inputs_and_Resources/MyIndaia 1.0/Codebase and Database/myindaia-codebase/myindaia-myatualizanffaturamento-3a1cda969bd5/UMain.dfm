object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Atualiza NF Faturamento'
  ClientHeight = 319
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      457
      41)
    object btnProcessar: TBitBtn
      Left = 8
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Processar'
      TabOrder = 0
      OnClick = btnProcessarClick
    end
    object btnPreferencias: TBitBtn
      Left = 368
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Preferencias'
      TabOrder = 1
      OnClick = btnPreferenciasClick
    end
  end
  object Memo: TMemo
    Left = 0
    Top = 41
    Width = 457
    Height = 259
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 1
    OnChange = MemoChange
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 300
    Width = 457
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
    Left = 48
    Top = 79
  end
end
