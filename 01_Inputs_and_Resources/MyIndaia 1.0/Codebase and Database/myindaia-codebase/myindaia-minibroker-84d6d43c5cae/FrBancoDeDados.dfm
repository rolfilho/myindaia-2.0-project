inherited formFrBancoDados: TformFrBancoDados
  BorderStyle = bsDialog
  Caption = 'Banco de Dados'
  ClientHeight = 137
  ClientWidth = 345
  OnShow = FormShow
  ExplicitWidth = 351
  ExplicitHeight = 166
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 44
    Height = 13
    Caption = 'Servidor:'
  end
  object Label2: TLabel
    Left = 176
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Banco:'
  end
  object Label3: TLabel
    Left = 176
    Top = 48
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object Label4: TLabel
    Left = 8
    Top = 48
    Width = 40
    Height = 13
    Caption = 'Usu'#225'rio:'
  end
  object edtServidor: TEdit
    Left = 8
    Top = 23
    Width = 161
    Height = 21
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 96
    Width = 345
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitLeft = 312
    ExplicitTop = 168
    ExplicitWidth = 185
    object Button1: TButton
      Left = 262
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 182
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 102
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Testar'
      TabOrder = 0
      OnClick = Button3Click
    end
  end
  object edtBanco: TEdit
    Left = 176
    Top = 23
    Width = 161
    Height = 21
    TabOrder = 1
  end
  object edtSenha: TEdit
    Left = 176
    Top = 63
    Width = 161
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
  end
  object edtUsuario: TEdit
    Left = 8
    Top = 63
    Width = 161
    Height = 21
    TabOrder = 2
  end
end
