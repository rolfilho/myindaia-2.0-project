object frmPreferencia: TfrmPreferencia
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Prefer'#234'ncias'
  ClientHeight = 427
  ClientWidth = 354
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
    Top = 392
    Width = 354
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      354
      35)
    object BitBtn1: TBitBtn
      Left = 187
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 269
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
    Width = 354
    Height = 392
    ActivePage = tsGR
    Align = alClient
    TabOrder = 1
    object tsGR: TTabSheet
      ImageIndex = 1
      DesignSize = (
        346
        364)
      object Label1: TLabel
        Left = 11
        Top = 259
        Width = 18
        Height = 13
        Caption = 'FTP'
      end
      object Label2: TLabel
        Left = 7
        Top = 130
        Width = 28
        Height = 13
        Caption = 'Inicio '
      end
      object Label3: TLabel
        Left = 82
        Top = 130
        Width = 16
        Height = 13
        Caption = 'Fim'
      end
      object lblEmailValidacao: TLabeledEdit
        Left = 7
        Top = 200
        Width = 259
        Height = 21
        EditLabel.Width = 83
        EditLabel.Height = 13
        EditLabel.Caption = 'E-mail - Valida'#231#227'o'
        TabOrder = 1
      end
      object leIntevalo: TLabeledEdit
        Left = 183
        Top = 146
        Width = 97
        Height = 21
        EditLabel.Width = 100
        EditLabel.Height = 13
        EditLabel.Caption = 'Intervalo Integra'#231#227'o'
        TabOrder = 0
      end
      object lbledtEndereco: TLabeledEdit
        Left = 7
        Top = 256
        Width = 178
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o'
        TabOrder = 2
      end
      object lbledtPorta: TLabeledEdit
        Left = 203
        Top = 256
        Width = 43
        Height = 21
        EditLabel.Width = 26
        EditLabel.Height = 13
        EditLabel.Caption = 'Porta'
        TabOrder = 3
      end
      object lbledtUsuario: TLabeledEdit
        Left = 7
        Top = 296
        Width = 120
        Height = 21
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'Usu'#225'rio'
        TabOrder = 4
      end
      object lbledtSenha: TLabeledEdit
        Left = 148
        Top = 296
        Width = 98
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Senha'
        TabOrder = 5
      end
      object lbledtPastaDownload: TLabeledEdit
        Left = 7
        Top = 339
        Width = 118
        Height = 21
        EditLabel.Width = 77
        EditLabel.Height = 13
        EditLabel.Caption = 'Pasta Download'
        TabOrder = 6
      end
      object lbledtPastaUpload: TLabeledEdit
        Left = 148
        Top = 339
        Width = 118
        Height = 21
        EditLabel.Width = 63
        EditLabel.Height = 13
        EditLabel.Caption = 'Pasta Upload'
        TabOrder = 7
      end
      object chbIntegracao: TCheckBox
        Left = 7
        Top = 13
        Width = 82
        Height = 18
        Anchors = [akTop]
        Caption = 'Integra'#231#227'o'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object chbRetornoExpo: TCheckBox
        Left = 91
        Top = 13
        Width = 118
        Height = 18
        Anchors = [akTop]
        Caption = 'Retorno Exporta'#231#227'o'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
      object chbRetornoImpo: TCheckBox
        Left = 221
        Top = 13
        Width = 120
        Height = 18
        Anchors = [akTop]
        Caption = 'Retorno Importa'#231#227'o'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object leInicio: TMaskEdit
        Left = 7
        Top = 146
        Width = 48
        Height = 21
        EditMask = '!90:00;1;_'
        MaxLength = 5
        TabOrder = 11
        Text = '  :  '
      end
      object leFim: TMaskEdit
        Left = 82
        Top = 146
        Width = 48
        Height = 21
        EditMask = '!90:00;1;_'
        MaxLength = 5
        TabOrder = 12
        Text = '  :  '
      end
      object chbIntegracaoImpo: TCheckBox
        Left = 7
        Top = 41
        Width = 103
        Height = 18
        Anchors = [akTop]
        Caption = 'Integra'#231#227'o IMPO'
        Checked = True
        State = cbChecked
        TabOrder = 13
      end
      object chbIntegracaoExpo: TCheckBox
        Left = 123
        Top = 42
        Width = 106
        Height = 18
        Anchors = [akTop]
        Caption = 'Integra'#231#227'o EXPO'
        Checked = True
        State = cbChecked
        TabOrder = 14
      end
      object chbMoverArquivosErroImpo: TCheckBox
        Left = 7
        Top = 75
        Width = 186
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = 'Mover arquivos com erro - Impo'
        TabOrder = 15
      end
      object chbMoverArquivosErroExpo: TCheckBox
        Left = 7
        Top = 101
        Width = 178
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = 'Mover arquivos com erro - Expo'
        TabOrder = 16
      end
    end
  end
end
