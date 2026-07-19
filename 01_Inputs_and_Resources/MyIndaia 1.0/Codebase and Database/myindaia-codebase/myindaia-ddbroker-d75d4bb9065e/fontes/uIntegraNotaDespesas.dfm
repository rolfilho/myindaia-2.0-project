object frmIntegraNotaDespesas: TfrmIntegraNotaDespesas
  Left = 494
  Top = 221
  BorderStyle = bsDialog
  Caption = 'Despesas'
  ClientHeight = 136
  ClientWidth = 184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_despesas: TLabel
    Left = 8
    Top = 8
    Width = 81
    Height = 13
    Caption = 'Outras Despesas'
  end
  object lbl_multa_li: TLabel
    Left = 9
    Top = 53
    Width = 53
    Height = 13
    Caption = 'Multa de LI'
  end
  object Label9: TLabel
    Left = 97
    Top = 53
    Width = 75
    Height = 13
    Caption = 'ICMS Complem.'
  end
  object ceOutrasDespesas: TCurrencyEdit
    Left = 8
    Top = 24
    Width = 168
    Height = 21
    AutoSize = False
    DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    TabOrder = 0
  end
  object ceMultaLI: TCurrencyEdit
    Left = 8
    Top = 68
    Width = 80
    Height = 21
    AutoSize = False
    DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    TabOrder = 1
    OnChange = ceMultaLIChange
  end
  object ceICMSComplementar: TCurrencyEdit
    Left = 96
    Top = 68
    Width = 80
    Height = 21
    AutoSize = False
    DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    TabOrder = 2
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
  object btnCancelar: TBitBtn
    Left = 96
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    Kind = bkCancel
  end
end
