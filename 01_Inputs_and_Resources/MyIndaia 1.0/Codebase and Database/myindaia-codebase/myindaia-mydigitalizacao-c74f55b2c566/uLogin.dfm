object frmDigitalizacaoLogin: TfrmDigitalizacaoLogin
  Left = 192
  Top = 103
  BorderStyle = bsDialog
  Caption = 'myDigitaliza'#231#227'o Login'
  ClientHeight = 96
  ClientWidth = 185
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 36
    Height = 13
    Caption = 'Login:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 34
    Width = 41
    Height = 13
    Caption = 'Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtLogin: TEdit
    Left = 56
    Top = 6
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = edtLoginChange
    OnKeyPress = edtLoginKeyPress
  end
  object edtSenha: TEdit
    Left = 56
    Top = 30
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnChange = edtLoginChange
    OnKeyPress = edtLoginKeyPress
  end
  object btnOk: TBitBtn
    Left = 16
    Top = 64
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    TabOrder = 2
    OnClick = btnOkClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnCancelar: TBitBtn
    Left = 96
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    Kind = bkCancel
  end
end
