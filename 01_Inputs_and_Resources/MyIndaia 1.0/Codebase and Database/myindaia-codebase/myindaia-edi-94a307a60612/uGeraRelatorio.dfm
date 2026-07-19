object frmGeraRelatorio: TfrmGeraRelatorio
  Left = 385
  Top = 219
  BorderStyle = bsDialog
  Caption = 'Gerar Relat'#243'rio'
  ClientHeight = 403
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 206
    Width = 568
    Height = 150
    Caption = ' Usu'#225'rios'
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object lblSearch: TLabel
      Left = 32
      Top = 127
      Width = 44
      Height = 13
      Caption = 'lblSearch'
    end
    object clbDestinatarios: TCheckListBox
      Left = 32
      Top = 24
      Width = 505
      Height = 97
      ItemHeight = 13
      TabOrder = 0
      OnKeyPress = clbDestinatariosKeyPress
    end
  end
  object btnCancelar: TBitBtn
    Left = 352
    Top = 362
    Width = 113
    Height = 30
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object btnGerar: TBitBtn
    Left = 471
    Top = 362
    Width = 113
    Height = 30
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
    OnClick = btnGerarClick
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 22
    Width = 568
    Height = 178
    Caption = ' Relat'#243'rio'
    TabOrder = 3
    object Edit1: TEdit
      Left = 32
      Top = 21
      Width = 417
      Height = 21
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 32
      Top = 56
      Width = 505
      Height = 104
      DataSource = dsRelatorios
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object Button1: TButton
      Left = 462
      Top = 19
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object qryRelatorios: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      'SELECT *'
      'FROM TRELATORIOS_MAIL_AUT'
      'WHERE IN_ATIVO = '#39'1'#39
      'ORDER BY NM_RELATORIO')
    Left = 324
    Top = 51
    object qryRelatoriosCD_RELATORIO: TStringField
      FieldName = 'CD_RELATORIO'
      Origin = 'BROKER.TRELATORIOS_MAIL_AUT.CD_RELATORIO'
      FixedChar = True
      Size = 5
    end
    object qryRelatoriosNM_RELATORIO: TStringField
      FieldName = 'NM_RELATORIO'
      Origin = 'BROKER.TRELATORIOS_MAIL_AUT.NM_RELATORIO'
      FixedChar = True
      Size = 100
    end
    object qryRelatoriosTX_RELATORIO: TStringField
      FieldName = 'TX_RELATORIO'
      Origin = 'BROKER.TRELATORIOS_MAIL_AUT.TX_RELATORIO'
      FixedChar = True
      Size = 255
    end
    object qryRelatoriosTX_MODELO: TStringField
      FieldName = 'TX_MODELO'
      Origin = 'BROKER.TRELATORIOS_MAIL_AUT.TX_MODELO'
      FixedChar = True
      Size = 200
    end
    object qryRelatoriosCD_TIPO_RELATORIO: TStringField
      FieldName = 'CD_TIPO_RELATORIO'
      Origin = 'BROKER.TRELATORIOS_MAIL_AUT.CD_TIPO_RELATORIO'
      FixedChar = True
      Size = 3
    end
    object qryRelatoriosTX_CONFIGURACAO: TMemoField
      FieldName = 'TX_CONFIGURACAO'
      Origin = 'BROKER.TRELATORIOS_MAIL_AUT.TX_CONFIGURACAO'
      BlobType = ftMemo
    end
    object qryRelatoriosIN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'BROKER.TRELATORIOS_MAIL_AUT.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qryRelatoriosIN_FIMDESEMANA: TStringField
      FieldName = 'IN_FIMDESEMANA'
      Origin = 'BROKER.TRELATORIOS_MAIL_AUT.IN_FIMDESEMANA'
      FixedChar = True
      Size = 1
    end
    object qryRelatoriosTP_IDIOMA: TStringField
      FieldName = 'TP_IDIOMA'
      Origin = 'BROKER.TRELATORIOS_MAIL_AUT.TP_IDIOMA'
      FixedChar = True
      Size = 1
    end
    object qryRelatoriosCD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'BROKER.TRELATORIOS_MAIL_AUT.CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qryRelatoriosVARIAVEL_CARTAS_CONFIG: TStringField
      FieldName = 'VARIAVEL_CARTAS_CONFIG'
      Origin = 'BROKER.TRELATORIOS_MAIL_AUT.VARIAVEL_CARTAS_CONFIG'
      FixedChar = True
      Size = 200
    end
  end
  object dsRelatorios: TDataSource
    DataSet = qryRelatorios
    Left = 324
    Top = 80
  end
  object qryUsuarios: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO, AP_USUARIO, NM_EMAIL'
      'FROM TUSUARIO'
      'WHERE IN_ATIVO = '#39'1'#39
      '  AND ISNULL(NM_EMAIL, '#39#39') <> '#39#39
      '  AND CD_CARGO = '#39'001'#39
      'ORDER BY NM_USUARIO')
    Left = 380
    Top = 51
    object qryUsuariosCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'BROKER.TUSUARIO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryUsuariosNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'BROKER.TUSUARIO.NM_USUARIO'
      FixedChar = True
      Size = 50
    end
    object qryUsuariosAP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Origin = 'BROKER.TUSUARIO.AP_USUARIO'
      FixedChar = True
      Size = 15
    end
    object qryUsuariosNM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Origin = 'BROKER.TUSUARIO.NM_EMAIL'
      FixedChar = True
      Size = 255
    end
  end
end
