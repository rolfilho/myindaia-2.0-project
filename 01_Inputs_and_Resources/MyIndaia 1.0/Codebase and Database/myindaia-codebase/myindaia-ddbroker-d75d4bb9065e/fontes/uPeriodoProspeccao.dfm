object FrmPeriodoProspeccao: TFrmPeriodoProspeccao
  Left = 365
  Top = 196
  BorderStyle = bsDialog
  Caption = 'Prospec'#231#227'o'
  ClientHeight = 144
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_a: TLabel
    Left = 128
    Top = 45
    Width = 8
    Height = 13
    Caption = 'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object msk_dt_inicio: TDateTimePicker
    Left = 21
    Top = 41
    Width = 94
    Height = 21
    Date = 37431.000000000000000000
    Time = 37431.000000000000000000
    TabOrder = 0
  end
  object msk_dt_fim: TDateTimePicker
    Left = 148
    Top = 41
    Width = 94
    Height = 21
    Date = 37431.000000000000000000
    Time = 37431.000000000000000000
    TabOrder = 1
  end
  object btn_iniciar: TButton
    Left = 80
    Top = 103
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    Default = True
    TabOrder = 2
    OnClick = btn_iniciarClick
  end
  object btn_fechar: TButton
    Left = 171
    Top = 103
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Fechar'
    ModalResult = 2
    TabOrder = 3
  end
end
