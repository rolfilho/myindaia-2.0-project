object frm_Integracao_Risc: Tfrm_Integracao_Risc
  Left = 224
  Top = 125
  Width = 411
  Height = 239
  BorderIcons = [biSystemMenu]
  Caption = 'Integração com RISC'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 403
    Height = 193
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel1: TBevel
      Left = 20
      Top = 112
      Width = 365
      Height = 13
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 24
      Top = 28
      Width = 357
      Height = 37
      AutoSize = False
      Caption = 
        'Esta rotina seleciona os processos de DI que foram alterados des' +
        'de a última integração com o RISC gerando o arquivo EXPORT.TXT'
      WordWrap = True
    end
  end
  object Mensagem: TStatusBar
    Left = 0
    Top = 193
    Width = 403
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object btn_iniciar: TButton
    Left = 110
    Top = 140
    Width = 75
    Height = 25
    Caption = '&Iniciar'
    Default = True
    TabOrder = 2
    OnClick = btn_iniciarClick
  end
  object btn_fechar: TButton
    Left = 218
    Top = 140
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Fechar'
    ModalResult = 2
    TabOrder = 3
    OnClick = btn_fecharClick
  end
end
