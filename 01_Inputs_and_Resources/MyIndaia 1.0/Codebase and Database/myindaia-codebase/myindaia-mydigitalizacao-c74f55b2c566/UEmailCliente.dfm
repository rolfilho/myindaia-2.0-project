object frmEmailCliente: TfrmEmailCliente
  Left = 321
  Top = 152
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Email Cliente'
  ClientHeight = 246
  ClientWidth = 514
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
  object pnlDadosEmail: TPanel
    Left = 0
    Top = 0
    Width = 514
    Height = 246
    Align = alClient
    TabOrder = 0
    object Shape4: TShape
      Left = 12
      Top = 5
      Width = 74
      Height = 71
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label5: TLabel
      Left = 23
      Top = 11
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
      Top = 82
      Width = 44
      Height = 13
      Hint = 'Subject of this message'
      Caption = 'Assunto :'
      ParentShowHint = False
      ShowHint = True
    end
    object Label6: TLabel
      Left = 139
      Top = 58
      Width = 18
      Height = 13
      Hint = 'cc: name(s), comma delimited'
      Caption = 'cc :'
      ParentShowHint = False
      ShowHint = True
    end
    object Label8: TLabel
      Left = 129
      Top = 34
      Width = 28
      Height = 13
      Hint = 'Recipient'#39's name(s), comma delimited'
      Caption = 'Para :'
      ParentShowHint = False
      ShowHint = True
    end
    object Shape1: TShape
      Left = 89
      Top = 29
      Width = 70
      Height = 23
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Shape2: TShape
      Left = 89
      Top = 53
      Width = 70
      Height = 23
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Shape3: TShape
      Left = 89
      Top = 77
      Width = 70
      Height = 23
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label9: TLabel
      Left = 12
      Top = 88
      Width = 31
      Height = 13
      Caption = 'Corpo:'
    end
    object Shape5: TShape
      Left = 89
      Top = 5
      Width = 70
      Height = 23
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label1: TLabel
      Left = 137
      Top = 10
      Width = 20
      Height = 13
      Hint = 'Recipient'#39's name(s), comma delimited'
      Caption = 'De :'
      ParentShowHint = False
      ShowHint = True
    end
    object edtPara: TEdit
      Left = 162
      Top = 29
      Width = 338
      Height = 23
      AutoSize = False
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object edtCC: TEdit
      Left = 162
      Top = 53
      Width = 338
      Height = 23
      AutoSize = False
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object edtAssunto: TEdit
      Left = 162
      Top = 77
      Width = 338
      Height = 23
      AutoSize = False
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object Panel1: TPanel
      Left = 1
      Top = 214
      Width = 512
      Height = 31
      Align = alBottom
      Anchors = [akLeft, akRight]
      TabOrder = 3
      DesignSize = (
        512
        31)
      object SpeedButton8: TSpeedButton
        Left = 260
        Top = 3
        Width = 118
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Enviar'
        Flat = True
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
        Layout = blGlyphRight
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton8Click
      end
      object SpeedButton6: TSpeedButton
        Left = 388
        Top = 3
        Width = 118
        Height = 25
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
        OnClick = SpeedButton6Click
      end
    end
    object mmCorpoEmail: TMemo
      Left = 12
      Top = 103
      Width = 489
      Height = 66
      Enabled = False
      MaxLength = 152
      TabOrder = 4
    end
    object edtRemetente: TEdit
      Left = 162
      Top = 5
      Width = 338
      Height = 23
      AutoSize = False
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object LstFiles: TListBox
      Left = 12
      Top = 175
      Width = 487
      Height = 34
      Align = alCustom
      Color = 15987699
      Ctl3D = False
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 6
    end
  end
end
