object frmPreferencia: TfrmPreferencia
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Prefer'#234'ncias'
  ClientHeight = 287
  ClientWidth = 479
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
    Top = 252
    Width = 479
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      479
      35)
    object BitBtn1: TBitBtn
      Left = 312
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 394
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
    Width = 479
    Height = 252
    ActivePage = tsGR
    Align = alClient
    TabOrder = 1
    object tsGR: TTabSheet
      ImageIndex = 1
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
      object Label1: TLabel
        Left = 7
        Top = 114
        Width = 65
        Height = 13
        Caption = 'SDA Santos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 7
        Top = 168
        Width = 106
        Height = 13
        Caption = 'SDA Rio de Janeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEmailValidacao: TLabeledEdit
        Left = 7
        Top = 77
        Width = 259
        Height = 21
        EditLabel.Width = 83
        EditLabel.Height = 13
        EditLabel.Caption = 'E-mail - Valida'#231#227'o'
        TabOrder = 1
      end
      object leIntevalo: TLabeledEdit
        Left = 169
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
        TabOrder = 2
        Text = '  :  '
      end
      object leFim: TMaskEdit
        Left = 82
        Top = 26
        Width = 48
        Height = 21
        EditMask = '!90:00;1;_'
        MaxLength = 5
        TabOrder = 3
        Text = '  :  '
      end
      object chbGerarArquivoSTS: TCheckBox
        Left = 7
        Top = 133
        Width = 82
        Height = 18
        Caption = 'Gerar Arquivo'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object chbProcessaBrokerSTS: TCheckBox
        Left = 304
        Top = 133
        Width = 156
        Height = 18
        Caption = 'Digitalizar/Lan'#231'ar Pagamento'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object chbTransmitirArquivoSTS: TCheckBox
        Left = 107
        Top = 133
        Width = 109
        Height = 18
        Caption = 'Transmitir Arquivo'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object chbBaixarGuiaSTS: TCheckBox
        Left = 222
        Top = 133
        Width = 78
        Height = 18
        Caption = 'Baixar Guia'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object chbGerarArquivoRJ: TCheckBox
        Left = 7
        Top = 189
        Width = 82
        Height = 18
        Caption = 'Gerar Arquivo'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object chbProcessaBrokerRJ: TCheckBox
        Left = 304
        Top = 189
        Width = 156
        Height = 18
        Caption = 'Digitalizar/Lan'#231'ar Pagamento'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
      object chbTransmitirArquivoRJ: TCheckBox
        Left = 107
        Top = 189
        Width = 109
        Height = 18
        Caption = 'Transmitir Arquivo'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object chbBaixarGuiaRJ: TCheckBox
        Left = 222
        Top = 189
        Width = 78
        Height = 18
        Caption = 'Baixar Guia'
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
    end
  end
end
