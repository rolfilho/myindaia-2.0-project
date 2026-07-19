object FormPreferencias: TFormPreferencias
  Left = 0
  Top = 0
  Caption = 'Prefer'#234'ncias'
  ClientHeight = 180
  ClientWidth = 380
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
    Top = 139
    Width = 380
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      380
      41)
    object Button1: TButton
      Left = 298
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 209
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 380
    Height = 139
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Banco de Dados'
      object leSenha: TLabeledEdit
        Left = 135
        Top = 71
        Width = 121
        Height = 21
        EditLabel.Width = 34
        EditLabel.Height = 13
        EditLabel.Caption = 'Senha:'
        PasswordChar = '*'
        TabOrder = 3
      end
      object leBanco: TLabeledEdit
        Left = 160
        Top = 24
        Width = 175
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Banco:'
        TabOrder = 1
      end
      object leServidor: TLabeledEdit
        Left = 8
        Top = 24
        Width = 146
        Height = 21
        EditLabel.Width = 107
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o do Servidor:'
        TabOrder = 0
      end
      object leUsuario: TLabeledEdit
        Left = 8
        Top = 71
        Width = 121
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'Usu'#225'rio:'
        TabOrder = 2
      end
      object btTestarGR: TBitBtn
        Left = 262
        Top = 69
        Width = 75
        Height = 25
        Caption = 'Testar'
        TabOrder = 4
        OnClick = btTestarGRClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Gerais'
      ImageIndex = 1
      object leLocalArquivosTaxaCambio: TLabeledEdit
        Left = 8
        Top = 24
        Width = 358
        Height = 21
        EditLabel.Width = 235
        EditLabel.Height = 13
        EditLabel.Caption = 'Local de leitura dos arquivos de Taxa de C'#226'mbio:'
        TabOrder = 0
      end
      object leLocalArquivosAliquota: TLabeledEdit
        Left = 8
        Top = 64
        Width = 358
        Height = 21
        EditLabel.Width = 197
        EditLabel.Height = 13
        EditLabel.Caption = 'Local de leitura dos arquivos de Aliquota:'
        TabOrder = 1
      end
    end
  end
end
