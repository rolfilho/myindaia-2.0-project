object frm_integracao_LI: Tfrm_integracao_LI
  Left = 273
  Top = 218
  Width = 413
  Height = 269
  Caption = 'Integra'#231#227'o da LI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = 0
    Top = 0
    Width = 405
    Height = 223
    Align = alClient
  end
  object Label1: TLabel
    Left = 28
    Top = 12
    Width = 345
    Height = 37
    AutoSize = False
    Caption = 
      'Esta rotina atualiza as LI registradas do sistema orientador loc' +
      'al para o Banco de Dados do DDBroker.'
    WordWrap = True
  end
  object Bevel2: TBevel
    Left = 20
    Top = 48
    Width = 365
    Height = 13
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 32
    Top = 60
    Width = 78
    Height = 13
    Caption = 'LI registradas'
  end
  object Label5: TLabel
    Left = 52
    Top = 76
    Width = 77
    Height = 13
    Caption = '.Atualiza'#231#245'es'
  end
  object Label7: TLabel
    Left = 52
    Top = 92
    Width = 60
    Height = 13
    Caption = '.Inser'#231#245'es'
  end
  object Label3: TLabel
    Left = 32
    Top = 112
    Width = 62
    Height = 13
    Caption = 'Itens da LI'
  end
  object Label4: TLabel
    Left = 32
    Top = 136
    Width = 86
    Height = 13
    Caption = 'Destaque NCM'
  end
  object lbl_q_li: TLabel
    Left = 128
    Top = 60
    Width = 98
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object lbl_q_li_a: TLabel
    Left = 128
    Top = 76
    Width = 98
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object lbl_q_li_i: TLabel
    Left = 128
    Top = 92
    Width = 98
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object lbl_q_itens: TLabel
    Left = 128
    Top = 112
    Width = 98
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object lbl_q_dest_ncm: TLabel
    Left = 128
    Top = 136
    Width = 98
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object Bevel1: TBevel
    Left = 20
    Top = 160
    Width = 365
    Height = 13
    Shape = bsTopLine
  end
  object Mensagem: TStatusBar
    Left = 0
    Top = 223
    Width = 405
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object btn_iniciar: TButton
    Left = 110
    Top = 180
    Width = 75
    Height = 25
    Caption = '&Iniciar'
    Default = True
    TabOrder = 1
    OnClick = btn_iniciarClick
  end
  object btn_fechar: TButton
    Left = 218
    Top = 180
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Fechar'
    ModalResult = 2
    TabOrder = 2
    OnClick = btn_fecharClick
  end
end
