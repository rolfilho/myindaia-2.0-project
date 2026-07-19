object frmDefaultLogin: TfrmDefaultLogin
  Left = 233
  Top = 82
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 95
  ClientWidth = 184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Login:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 38
    Height = 13
    Caption = 'Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtLogin: TEdit
    Left = 56
    Top = 5
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = edtLoginKeyPress
  end
  object edtSenha: TEdit
    Left = 56
    Top = 29
    Width = 121
    Height = 21
    MaxLength = 16
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = edtLoginKeyPress
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 64
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
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
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancelar: TBitBtn
    Left = 102
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object Con: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=SA;Initial Catalog=BROKER;Data Source=INDAIA10'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 8
  end
  object qryUsuario: TADOQuery
    Connection = Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'NM_LOGIN'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = 'sa'
      end>
    SQL.Strings = (
      'SELECT U.CD_USUARIO,'
      '       U.NM_USUARIO,'
      '       U.NM_EMAIL,'
      '       U.CD_CARGO,'
      '       U.IN_ATIVO,'
      '       C.NM_CARGO,'
      '       U.QT_SENHA_INCORRETA, '
      
        '       ISNULL((SELECT TOP 1 QT_SENHA_ERRADA FROM TPARAMETROS (NO' +
        'LOCK)),5) AS QT_SENHA_ERRADA_PARAM'
      'FROM TUSUARIO U (NOLOCK)'
      'INNER '
      'JOIN TCARGO   C (NOLOCK) ON C.CD_CARGO = U.CD_CARGO'
      'WHERE U.AP_USUARIO = :NM_LOGIN')
    Left = 112
    Top = 8
    object qryUsuarioCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryUsuarioNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
    object qryUsuarioNM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Size = 2000
    end
    object qryUsuarioCD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      FixedChar = True
      Size = 3
    end
    object qryUsuarioIN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qryUsuarioNM_CARGO: TStringField
      FieldName = 'NM_CARGO'
      FixedChar = True
      Size = 40
    end
    object qryUsuarioQT_SENHA_INCORRETA: TIntegerField
      FieldName = 'QT_SENHA_INCORRETA'
    end
    object qryUsuarioQT_SENHA_ERRADA_PARAM: TIntegerField
      FieldName = 'QT_SENHA_ERRADA_PARAM'
      ReadOnly = True
    end
  end
end
