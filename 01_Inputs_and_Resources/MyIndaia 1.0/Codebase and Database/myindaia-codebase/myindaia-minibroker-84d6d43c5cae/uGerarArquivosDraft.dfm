inherited frmGerarArquivosDraft: TfrmGerarArquivosDraft
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Selecione o Layout do Arquivo'
  ClientHeight = 322
  ClientWidth = 375
  WindowState = wsNormal
  ExplicitWidth = 381
  ExplicitHeight = 350
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 4
    Width = 375
    Height = 69
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object rgPadraoInttra: TRadioButton
      Left = 16
      Top = 27
      Width = 137
      Height = 17
      Caption = 'Padr'#227'o Inttra'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
  end
  object pnlEmail: TPanel
    Left = 0
    Top = 73
    Width = 375
    Height = 206
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 31
      Top = 20
      Width = 31
      Height = 16
      Caption = 'Para:'
    end
    object Label2: TLabel
      Left = 40
      Top = 64
      Width = 21
      Height = 16
      Caption = 'CC:'
    end
    object Label3: TLabel
      Left = 10
      Top = 92
      Width = 50
      Height = 16
      Caption = 'Assunto:'
    end
    object Label4: TLabel
      Left = 22
      Top = 113
      Width = 39
      Height = 16
      Caption = 'Corpo:'
    end
    object mmCorpo: TMemo
      Left = 9
      Top = 131
      Width = 469
      Height = 71
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object edtAssunto: TEdit
      Left = 78
      Top = 84
      Width = 400
      Height = 24
      TabOrder = 2
    end
    object edtCopia: TEdit
      Left = 78
      Top = 56
      Width = 400
      Height = 24
      TabOrder = 1
    end
    object edtPara: TEdit
      Left = 78
      Top = 12
      Width = 400
      Height = 24
      TabOrder = 0
    end
    object chbCopiarUsuario: TCheckBox
      Left = 320
      Top = 37
      Width = 163
      Height = 17
      Caption = 'Me copiar neste e-mail'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 279
    Width = 375
    Height = 43
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      375
      43)
    object btnVisualizar: TBitBtn
      Left = 287
      Top = 8
      Width = 75
      Height = 27
      Anchors = [akRight]
      Caption = 'Gerar'
      TabOrder = 2
      OnClick = btnVisualizarClick
    end
    object btnEnviarEmail: TBitBtn
      Left = -105
      Top = 8
      Width = 115
      Height = 27
      Anchors = [akRight]
      Caption = 'Enviar por e-mail'
      TabOrder = 0
      OnClick = btnEnviarEmailClick
    end
    object btnEnviarDigitalizacao: TBitBtn
      Left = 16
      Top = 6
      Width = 155
      Height = 27
      Anchors = [akRight]
      Caption = 'Enviar para Digitaliza'#231#227'o'
      Enabled = False
      TabOrder = 1
      Visible = False
      OnClick = btnEnviarDigitalizacaoClick
    end
    object Button1: TButton
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Caption = 'teste'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object pnlStyle2: TPanel
    Left = 0
    Top = 0
    Width = 375
    Height = 4
    Align = alTop
    BevelOuter = bvNone
    Color = 16758122
    ParentBackground = False
    TabOrder = 3
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivo de Texto (*.txt)|*.txt'
    Title = 'Numer'#225'rio - Arquivo txt'
    Left = 168
    Top = 128
  end
end
