object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TM - Token'
  ClientHeight = 344
  ClientWidth = 1004
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button3: TButton
    Left = 8
    Top = 303
    Width = 75
    Height = 25
    Caption = 'Get Token'
    TabOrder = 0
    OnClick = Button3Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1004
    Height = 209
    Align = alTop
    BorderWidth = 8
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitWidth = 805
    object DBGrid1: TDBGrid
      Left = 9
      Top = 9
      Width = 986
      Height = 191
      Align = alClient
      DataSource = dsUsuarios
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Memo1: TMemo
    Left = 8
    Top = 215
    Width = 988
    Height = 82
    TabOrder = 2
  end
  object TM: TFDConnection
    Params.Strings = (
      'Database=TM'
      'User_Name=SA'
      'Password=123'
      'Server=INDAIA10'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 456
    Top = 24
  end
  object QryUsuarios: TFDQuery
    Active = True
    Connection = TM
    SQL.Strings = (
      
        'SELECT U.ID, U.NM_USUARIO, U.EMAIL, U.USERNAME, T.NR_CNPJ CNPJ_T' +
        ', T.NM_TRANSPORTADORA, D.NR_CNPJ CNPJ_D, D.NM_DESPACHANTE  FROM ' +
        'USUARIOS U'
      'LEFT JOIN TRANSPORTADORAS T ON T.ID=U.ID_TRANSPORTADORA'
      'LEFT JOIN DESPACHANTES D ON D.ID=U.ID_DESPACHANTE')
    Left = 520
    Top = 24
    object QryUsuariosID: TFDAutoIncField
      DisplayLabel = 'Id'
      DisplayWidth = 3
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryUsuariosNM_USUARIO: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 10
      FieldName = 'NM_USUARIO'
      Origin = 'NM_USUARIO'
      Size = 50
    end
    object QryUsuariosEMAIL: TWideStringField
      DisplayLabel = 'Email'
      DisplayWidth = 30
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 100
    end
    object QryUsuariosUSERNAME: TWideStringField
      DisplayLabel = 'Login'
      DisplayWidth = 15
      FieldName = 'USERNAME'
      Origin = 'USERNAME'
      Required = True
      Size = 50
    end
    object QryUsuariosCNPJ_T: TWideStringField
      DisplayLabel = 'CNPJ Transportadora'
      FieldName = 'CNPJ_T'
      Origin = 'CNPJ_T'
      FixedChar = True
      Size = 14
    end
    object QryUsuariosNM_TRANSPORTADORA: TWideStringField
      DisplayLabel = 'Transportadora'
      DisplayWidth = 30
      FieldName = 'NM_TRANSPORTADORA'
      Origin = 'NM_TRANSPORTADORA'
      Size = 100
    end
    object QryUsuariosCNPJ_D: TWideStringField
      DisplayLabel = 'CNPJ Despachante'
      FieldName = 'CNPJ_D'
      Origin = 'CNPJ_D'
      FixedChar = True
      Size = 14
    end
    object QryUsuariosNM_DESPACHANTE: TWideStringField
      DisplayLabel = 'Despachante'
      DisplayWidth = 30
      FieldName = 'NM_DESPACHANTE'
      Origin = 'NM_DESPACHANTE'
      Size = 100
    end
  end
  object dsUsuarios: TDataSource
    DataSet = QryUsuarios
    Left = 584
    Top = 24
  end
end
