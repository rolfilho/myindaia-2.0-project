object frmEnviaEmail: TfrmEnviaEmail
  Left = 244
  Top = 135
  BorderStyle = bsNone
  BorderWidth = 2
  Caption = 'Op'#231#245'es de Impress'#227'o'
  ClientHeight = 305
  ClientWidth = 645
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_main: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 305
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    Color = clWhite
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object pnl_mail: TPanel
      Left = 3
      Top = 31
      Width = 639
      Height = 196
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 1
      object Shape10: TShape
        Left = 99
        Top = 42
        Width = 95
        Height = 21
        Brush.Style = bsClear
        Pen.Color = clWhite
      end
      object Shape9: TShape
        Left = 99
        Top = 18
        Width = 95
        Height = 21
        Brush.Style = bsClear
        Pen.Color = clWhite
      end
      object Shape4: TShape
        Left = 15
        Top = 17
        Width = 82
        Height = 71
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label2: TLabel
        Left = 29
        Top = 22
        Width = 53
        Height = 54
        Alignment = taCenter
        Caption = #353
        Color = clWindow
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -53
        Font.Name = 'Webdings'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
      object Label7: TLabel
        Left = 146
        Top = 70
        Width = 44
        Height = 13
        Hint = 'Subject of this message'
        Caption = 'Assunto :'
        ParentShowHint = False
        ShowHint = True
      end
      object Label6: TLabel
        Left = 170
        Top = 46
        Width = 20
        Height = 13
        Hint = 'cc: name(s), comma delimited'
        Caption = 'CC :'
        ParentShowHint = False
        ShowHint = True
      end
      object Label5: TLabel
        Left = 162
        Top = 22
        Width = 28
        Height = 13
        Hint = 'Recipient'#39's name(s), comma delimited'
        Caption = 'Para :'
        ParentShowHint = False
        ShowHint = True
      end
      object Shape1: TShape
        Left = 98
        Top = 17
        Width = 97
        Height = 23
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape2: TShape
        Left = 98
        Top = 41
        Width = 97
        Height = 23
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape3: TShape
        Left = 98
        Top = 65
        Width = 97
        Height = 23
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape8: TShape
        Left = 495
        Top = 17
        Width = 131
        Height = 22
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object btnPara: TSpeedButton
        Left = 101
        Top = 19
        Width = 92
        Height = 19
        Flat = True
        OnClick = btnParaClick
      end
      object btnCC: TSpeedButton
        Left = 101
        Top = 43
        Width = 92
        Height = 19
        Flat = True
        OnClick = btnCCClick
      end
      object LstFiles: TListBox
        Left = 14
        Top = 156
        Width = 612
        Height = 34
        Color = 15987699
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 5
      end
      object reMensagem: TRichEdit
        Left = 13
        Top = 92
        Width = 615
        Height = 63
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelKind = bkFlat
        Ctl3D = False
        Lines.Strings = (
          '')
        ParentCtl3D = False
        TabOrder = 4
      end
      object edtPara: TEdit
        Left = 196
        Top = 17
        Width = 296
        Height = 23
        AutoSize = False
        Ctl3D = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = edtParaChange
      end
      object edtCC: TEdit
        Left = 196
        Top = 41
        Width = 296
        Height = 23
        AutoSize = False
        Ctl3D = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnChange = edtCCChange
      end
      object edtAssunto: TEdit
        Left = 196
        Top = 65
        Width = 296
        Height = 23
        AutoSize = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object chkCopyMe: TCheckBox
        Left = 500
        Top = 20
        Width = 123
        Height = 17
        Caption = 'me copiar neste email'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 3
      Top = 240
      Width = 639
      Height = 42
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 2
      object btnEnviar: TSpeedButton
        Left = 433
        Top = 7
        Width = 99
        Height = 28
        Caption = 'Enviar...'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        OnClick = btnEnviarClick
      end
      object btnSair: TSpeedButton
        Left = 533
        Top = 7
        Width = 99
        Height = 28
        Caption = 'Sair'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
          0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
          0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
          0333337F777FFFFF7F3333000000000003333377777777777333}
        NumGlyphs = 2
        OnClick = btnSairClick
      end
    end
    object Panel3: TPanel
      Left = 3
      Top = 3
      Width = 639
      Height = 28
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label9: TLabel
        Left = 9
        Top = 8
        Width = 166
        Height = 13
        Caption = 'Envio de e-mail - [ myIndai'#225' ]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel4: TPanel
      Left = 3
      Top = 282
      Width = 639
      Height = 20
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 3
      object lblStatus: TLabel
        Left = 5
        Top = 4
        Width = 572
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object ppDesigner: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 424
    Top = 336
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 27
    Top = 186
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atNone
    Left = 243
    Top = 143
  end
  object qryConfigMail: TADOQuery
    Connection = dtmMyIndaiaDigitalizacao.Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM VW_CONFIG_MAIL')
    Left = 435
    Top = 143
    object qryConfigMailNM_HOST: TStringField
      FieldName = 'NM_HOST'
      Size = 100
    end
    object qryConfigMailNR_PORTA: TIntegerField
      FieldName = 'NR_PORTA'
    end
    object qryConfigMailNM_LOGIN: TStringField
      FieldName = 'NM_LOGIN'
      Size = 100
    end
    object qryConfigMailNM_SENHA: TStringField
      FieldName = 'NM_SENHA'
      Size = 100
    end
  end
end
