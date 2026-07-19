object frmRelatoriosNestleConfigEmail: TfrmRelatoriosNestleConfigEmail
  Left = 329
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Email - Nestl'#233
  ClientHeight = 595
  ClientWidth = 564
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDadosEmail: TPanel
    Left = 0
    Top = 0
    Width = 564
    Height = 595
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 564
      Width = 564
      Height = 31
      Align = alBottom
      Anchors = [akLeft, akRight]
      TabOrder = 0
      DesignSize = (
        564
        31)
      object rbPDF: TRadioButton
        Left = 259
        Top = 7
        Width = 62
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'PDF'
        Checked = True
        TabOrder = 0
        TabStop = True
        Visible = False
      end
      object rbWord: TRadioButton
        Left = 321
        Top = 7
        Width = 60
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Word'
        TabOrder = 1
        Visible = False
      end
      object btnEnviar: TBitBtn
        Left = 397
        Top = 3
        Width = 118
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Enviar'
        TabOrder = 2
        OnClick = btnEnviarClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777000000070000000000077777000000070FFFFFFFFF0777770000000700F
          FFFFF00000000000000070F0FFFFF0FF77770000000070FF0FFF00B800870000
          000070F0F000F0F07F0700000000700F7F7F70B07B070000000070F7F7F7F0F0
          7F0700000000770F7F7F70B07B07000000007770F7F7F0F07F07000000007777
          0F7F00B07BFB000000007777700070008800000000007777777777707F077000
          0000777777777778007770000000777777777777777770000000777777777777
          777770000000}
      end
      object btnSair: TBitBtn
        Left = 518
        Top = 3
        Width = 39
        Height = 25
        Anchors = [akTop, akRight]
        ModalResult = 2
        TabOrder = 3
        OnClick = btnSairClick
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
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 429
      Width = 564
      Height = 135
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object gbAnexar: TGroupBox
        Left = 0
        Top = 0
        Width = 564
        Height = 135
        Align = alClient
        Caption = 'Outros anexos'
        TabOrder = 0
        DesignSize = (
          564
          135)
        object btn4: TSpeedButton
          Left = 525
          Top = 21
          Width = 33
          Height = 21
          Anchors = [akTop, akRight]
          Flat = True
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000666666666666666666666666666666666666000066666666FFF666666666
            666666FFF666666600006666666844F66666666666666888F666666600006666
            666844F66666666666666888F666666600006666666844F66666666666666888
            F666666600006666FFF644FFFFF6666666FFF888FFFFF6660000666844444444
            44F66666688888888888F666000066684444444444F66666688888888888F666
            000066688888446888666666688888888888666600006666666844F666666666
            66666888F666666600006666666844F66666666666666888F666666600006666
            666844F66666666666666888F666666600006666666888666666666666666888
            6666666600006666666666666666666666666666666666660000666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000}
          NumGlyphs = 2
          OnClick = btn4Click
        end
        object btn5: TSpeedButton
          Left = 525
          Top = 52
          Width = 33
          Height = 21
          Anchors = [akTop, akRight]
          Flat = True
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000666666666666666666666666666666666666000066666666666666666666
            6666666666666666000066666666666666666666666666666666666600006666
            6666666666666666666666666666666600006666666666666666666666666666
            6666666600006666FFFFFFFFFFF6666666FFFFFFFFFFF6660000666800000000
            00F66666687777777777F666000066680000000000F66666687777777777F666
            0000666888888888886666666888888888886666000066666666666666666666
            6666666666666666000066666666666666666666666666666666666600006666
            6666666666666666666666666666666600006666666666666666666666666666
            6666666600006666666666666666666666666666666666660000666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000}
          NumGlyphs = 2
          OnClick = btn5Click
        end
        object btn3: TSpeedButton
          Left = 492
          Top = 21
          Width = 25
          Height = 21
          Anchors = [akTop, akRight]
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF05740BFF00FFFF00FFFF00FFFEFEFEFEFEFEFEFEFEFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFF00FFFF00FF2BACD8
            35B3DC23A9D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0574
            0B5BE78C05740BFF00FFFF00FF808080808080808080FEFEFEFEFEFEFEFEFEFE
            FEFEFEFEFEFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FF42B4DC
            AFF6FC86EFFA49C2E449C2E449C2E434B4DD24AAD7FF00FFFF00FF05740B50D7
            7A45D26C31C14F05740BFF00FF808080FEFEFEFF00FF80808080808080808080
            8080808080FEFEFEFEFEFE808080FEFEFEFF00FFFF00FF808080FF00FF26A8D6
            A6E9F59EFFFF97FCFF99FBFF95F7FF8DF2FE83EAFA49C2E449C2E43AB8DF168C
            2330C14C169824FF00FFFF00FF808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF808080808080808080808080FEFEFE808080FEFEFEFF00FF31B1DB
            23A9D7ABFEFF90F8FF91F6FF90F5FF8FF5FF8FF4FF90F4FF95F6FF75DDF50C81
            161AAF2C088310FF00FFFF00FF808080808080FEFEFEFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFE808080FF00FFFF00FF47BEE1
            23A9D7AAF0FA91FAFF91F6FF90F5FF8EF4FF8DF2FE8BF1FE8CF1FF77DFF60C90
            170EA01AFF00FFFF00FFFF00FF808080808080FEFEFEFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF808080808080FEFEFEFF00FFFF00FF4CC0E2
            7BE5F423A9D79EFEFF8DF7FF8EF6FF8CF4FF8DF2FE8BF1FE8CF1FF0A89120EA1
            1A08810FFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
            00FFFEFEFEFEFEFEFEFEFE808080FEFEFE808080FEFEFEFF00FFFF00FF4BBFE1
            93F9FD23A9D7A8E9F5A8F0FAA4F1FBA1F7FF05710A09790F0B89160A8C13067A
            0D58CDEAFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFEFEFEFEFEFEFE
            FEFE808080808080808080808080808080808080FF00FFFEFEFEFF00FF4CC0E2
            9DFEFFB7818323A9D723A9D723A9D723A9D7AFF2FB6BD7ED88F2FF6CD9F381E9
            FB80EAFA1FA8D6FF00FFFF00FF808080FEFEFE80808080808080808080808080
            8080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFF00FF4CC0E2
            9AFCFFBA8E85FEFEFEFEFEFEF7E6D0F7E6D023A9D79FE3F4A7EDFA94E1F4A2EC
            FAADF6FF47BCE0FF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
            00FF808080FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE808080FEFEFEFF00FF50C2E3
            9BFDFFCB9A82FEFEFEFEFEFEFEFEFEF7E6D0F7E6D029A9D423A9D723A9D723A9
            D74BB8DE34AFDAFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
            00FFFF00FF808080808080808080808080808080808080FF00FFFF00FF52BFE1
            A4FFFFDCA887FEFEFEFEFEFEFEFEFEFEFEFEFAEBDBAED3D5F2E6CAB78183FF00
            FFFF00FFFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
            00FFFF00FFFF00FFFEFEFE808080FEFEFEFF00FFFF00FFFF00FFFF00FF25A8D6
            23A9D7DCA887FEFEFEFEFEFEFEFEFEFEFEFEFBF2E79E8891B78183B78183FF00
            FFFF00FFFF00FFFF00FFFF00FF808080808080808080FEFEFEFF00FFFF00FFFF
            00FFFF00FF808080808080808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFE3B18EFEFEFEFEFEFEFEFEFEFEFEFEF8F3EFB78183DFA262DA9062FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFF00FFFF00FFFF
            00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFEDBD92FEFEFEFEFEFEFEFEFEFEFEFEF5F3F5B78183DA9C7DFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFEFEFEFEFEFEFE
            FEFEFEFEFE808080808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFEDBD92DCA887DCA887DCA887DCA887DCA887B78183FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80808080808080808080808080
            8080808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          NumGlyphs = 2
          OnClick = btn3Click
        end
        object lbl17: TLabel
          Left = 23
          Top = 31
          Width = 44
          Height = 13
          Caption = 'Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 10
          Top = 117
          Width = 241
          Height = 13
          Caption = 'O documento atual ser'#225' anexado automaticamente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7105644
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lstArquivos: TListBox
          Left = 10
          Top = 51
          Width = 509
          Height = 63
          Anchors = [akLeft, akTop, akRight]
          Columns = 1
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 0
        end
        object edtCaminho: TMaskEdit
          Left = 10
          Top = 21
          Width = 477
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 564
      Height = 183
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        564
        183)
      object Label5: TLabel
        Left = 14
        Top = 6
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
        Left = 113
        Top = 143
        Width = 44
        Height = 13
        Hint = 'Subject of this message'
        Caption = 'Assunto :'
        ParentShowHint = False
        ShowHint = True
      end
      object Label6: TLabel
        Left = 99
        Top = 7
        Width = 58
        Height = 13
        Hint = 'cc: name(s), comma delimited'
        Caption = 'Remetente :'
        ParentShowHint = False
        ShowHint = True
      end
      object Label8: TLabel
        Left = 129
        Top = 31
        Width = 28
        Height = 13
        Hint = 'Recipient'#39's name(s), comma delimited'
        Caption = 'Para :'
        ParentShowHint = False
        ShowHint = True
      end
      object Shape1: TShape
        Left = 89
        Top = 26
        Width = 70
        Height = 23
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape2: TShape
        Left = 89
        Top = 2
        Width = 70
        Height = 23
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape3: TShape
        Left = 89
        Top = 138
        Width = 70
        Height = 23
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape4: TShape
        Left = 3
        Top = 2
        Width = 81
        Height = 72
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object edtRemetente: TEdit
        Left = 163
        Top = 2
        Width = 361
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Color = clBtnFace
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object edtAssunto: TMemo
        Left = 163
        Top = 138
        Width = 361
        Height = 46
        Align = alCustom
        Anchors = [akLeft, akTop, akRight]
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object edtNovoEmail: TEdit
        Left = 163
        Top = 29
        Width = 361
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object dbgEmailsProcesso: TDBGrid
        Left = 162
        Top = 50
        Width = 361
        Height = 86
        Anchors = [akLeft, akTop, akRight]
        DataSource = dsEmailDest
        Options = [dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_EMAIL'
            Title.Caption = 'Emails'
            Width = 330
            Visible = True
          end>
      end
      object btnRemove: TBitBtn
        Left = 525
        Top = 53
        Width = 23
        Height = 22
        Anchors = [akTop, akRight]
        TabOrder = 4
        OnClick = btnRemoveClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000666666666666666666666666666666666666000066666666666666666666
          6666666666666666000066666666666666666666666666666666666600006666
          6666666666666666666666666666666600006666666666666666666666666666
          6666666600006666FFFFFFFFFFF6666666FFFFFFFFFFF6660000666822222222
          22F66666687777777777F666000066682222222222F66666687777777777F666
          0000666888888888886666666888888888886666000066666666666666666666
          6666666666666666000066666666666666666666666666666666666600006666
          6666666666666666666666666666666600006666666666666666666666666666
          6666666600006666666666666666666666666666666666660000666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000}
        NumGlyphs = 2
      end
      object btnAdd: TBitBtn
        Left = 525
        Top = 30
        Width = 22
        Height = 22
        Anchors = [akTop, akRight]
        TabOrder = 5
        OnClick = btnAddClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000666666666666666666666666666666666666000066666666FFF666666666
          666666FFF666666600006666666822F66666666666666877F666666600006666
          666822F66666666666666877F666666600006666666822F66666666666666877
          F666666600006666FFF622FFFFF6666666FFF777FFFFF6660000666822222222
          22F66666687777777777F666000066682222222222F66666687777777777F666
          000066688888226888666666688888777888666600006666666822F666666666
          66666877F666666600006666666822F66666666666666877F666666600006666
          666822F66666666666666877F666666600006666666888666666666666666888
          6666666600006666666666666666666666666666666666660000666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000}
        NumGlyphs = 2
      end
      object edtDestino: TEdit
        Left = 163
        Top = 113
        Width = 361
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        Visible = False
        OnChange = edtDestinoChange
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 183
      Width = 564
      Height = 246
      Align = alClient
      Caption = 'Corpo'
      TabOrder = 3
      object mmCorpoEmail: TMemo
        Left = 2
        Top = 15
        Width = 560
        Height = 229
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 349
    Top = 396
  end
  object cdsEmailDest: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 54
    Top = 199
    object cdsEmailDestNM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Size = 100
    end
  end
  object dsEmailDest: TDataSource
    DataSet = cdsEmailDest
    Left = 49
    Top = 256
  end
end
