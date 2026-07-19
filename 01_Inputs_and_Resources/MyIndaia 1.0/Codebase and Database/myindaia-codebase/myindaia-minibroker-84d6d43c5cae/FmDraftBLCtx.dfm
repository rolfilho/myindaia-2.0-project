inherited frmDraftBlCtx: TfrmDraftBlCtx
  Caption = 'Draft'
  ClientHeight = 176
  ClientWidth = 427
  ExplicitWidth = 433
  ExplicitHeight = 204
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Top = 135
    Width = 427
    ExplicitTop = 196
    ExplicitWidth = 427
    inherited btnCancela: TSpeedButton
      Left = 251
      ExplicitLeft = 155
    end
    inherited btnOk: TButton
      Left = 339
      ExplicitLeft = 339
    end
  end
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 135
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 196
    object Label1: TLabel
      Left = 16
      Top = 14
      Width = 120
      Height = 16
      Caption = 'Origem dos dados:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNrAmend: TLabel
      Left = 272
      Top = 91
      Width = 61
      Height = 16
      Caption = 'Nr. Vers'#227'o'
    end
    object rgCopiarProcesso: TRadioButton
      Left = 16
      Top = 56
      Width = 162
      Height = 17
      Caption = 'Copiar do Processo'
      Color = clWhite
      ParentColor = False
      TabOrder = 0
      OnClick = rgCopiarProcessoClick
    end
    object rgCopiarAmend: TRadioButton
      Left = 272
      Top = 56
      Width = 137
      Height = 17
      Caption = 'Copiar da Vers'#227'o'
      Color = clWhite
      ParentColor = False
      TabOrder = 1
    end
    object edtNrAmend: TEdit
      Left = 335
      Top = 83
      Width = 48
      Height = 24
      NumbersOnly = True
      TabOrder = 2
    end
    object rgIdiomaMerc: TRadioGroup
      Left = 16
      Top = 112
      Width = 209
      Height = 72
      Caption = 'Idioma (Descri'#231#227'o da mercadoria)'
      Color = clWhite
      Items.Strings = (
        'Ingles'
        'Espanhol'
        'Portugues')
      ParentBackground = False
      ParentColor = False
      TabOrder = 3
      Visible = False
    end
  end
end
