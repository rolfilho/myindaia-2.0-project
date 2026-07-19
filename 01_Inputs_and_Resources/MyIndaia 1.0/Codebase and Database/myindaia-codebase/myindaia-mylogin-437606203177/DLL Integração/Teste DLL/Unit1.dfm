object Form1: TForm1
  Left = 343
  Top = 105
  Caption = 'Form1'
  ClientHeight = 442
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 68
    Height = 13
    Caption = 'LoginName:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 32
    Width = 59
    Height = 13
    Caption = 'Password:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 48
    Width = 60
    Height = 13
    Caption = 'UserCode:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 64
    Width = 63
    Height = 13
    Caption = 'UserName:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 80
    Width = 61
    Height = 13
    Caption = 'UserEmail:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 24
    Top = 96
    Width = 67
    Height = 13
    Caption = 'CargoCode:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 24
    Top = 112
    Width = 70
    Height = 13
    Caption = 'CargoName:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblLoginName: TLabel
    Left = 104
    Top = 16
    Width = 3
    Height = 13
    Caption = '-'
  end
  object lblPassword: TLabel
    Left = 104
    Top = 32
    Width = 3
    Height = 13
    Caption = '-'
  end
  object lblUserCode: TLabel
    Left = 104
    Top = 48
    Width = 3
    Height = 13
    Caption = '-'
  end
  object lblUserName: TLabel
    Left = 104
    Top = 64
    Width = 3
    Height = 13
    Caption = '-'
  end
  object lblUserEmail: TLabel
    Left = 104
    Top = 80
    Width = 3
    Height = 13
    Caption = '-'
  end
  object lblCargoCode: TLabel
    Left = 104
    Top = 96
    Width = 3
    Height = 13
    Caption = '-'
  end
  object lblCargoName: TLabel
    Left = 104
    Top = 112
    Width = 3
    Height = 13
    Caption = '-'
  end
  object Edit1: TEdit
    Left = 24
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    OnKeyPress = Edit1KeyPress
  end
end
