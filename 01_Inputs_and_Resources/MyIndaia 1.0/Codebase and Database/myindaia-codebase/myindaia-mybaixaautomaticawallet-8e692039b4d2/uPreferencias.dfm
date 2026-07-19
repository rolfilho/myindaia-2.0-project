object frmPreferencia: TfrmPreferencia
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Prefer'#234'ncias'
  ClientHeight = 177
  ClientWidth = 317
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 142
    Width = 317
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 132
    DesignSize = (
      317
      35)
    object BitBtn1: TBitBtn
      Left = 150
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 232
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      TabOrder = 1
      OnClick = BitBtn3Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 317
    Height = 142
    ActivePage = tsGR
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 132
    object tsGR: TTabSheet
      ImageIndex = 1
      ExplicitHeight = 104
      object Label2: TLabel
        Left = 7
        Top = 10
        Width = 28
        Height = 13
        Caption = 'Inicio '
      end
      object Label3: TLabel
        Left = 82
        Top = 10
        Width = 16
        Height = 13
        Caption = 'Fim'
      end
      object leIntevalo: TLabeledEdit
        Left = 183
        Top = 26
        Width = 97
        Height = 21
        EditLabel.Width = 100
        EditLabel.Height = 13
        EditLabel.Caption = 'Intervalo Integra'#231#227'o'
        TabOrder = 0
      end
      object leInicio: TMaskEdit
        Left = 7
        Top = 26
        Width = 48
        Height = 21
        EditMask = '!90:00;1;_'
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object leFim: TMaskEdit
        Left = 82
        Top = 26
        Width = 48
        Height = 21
        EditMask = '!90:00;1;_'
        MaxLength = 5
        TabOrder = 2
        Text = '  :  '
      end
      object chbNumerarios: TCheckBox
        Left = 7
        Top = 71
        Width = 97
        Height = 17
        Caption = 'Numer'#225'rios'
        TabOrder = 3
      end
      object chbPagamentos: TCheckBox
        Left = 167
        Top = 71
        Width = 97
        Height = 17
        Caption = 'Pagamentos'
        TabOrder = 4
      end
    end
  end
end
