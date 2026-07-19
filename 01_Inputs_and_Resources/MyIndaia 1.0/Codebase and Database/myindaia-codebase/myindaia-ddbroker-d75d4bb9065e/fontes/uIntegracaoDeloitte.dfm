object Form1: TForm1
  Left = 301
  Top = 278
  Width = 411
  Height = 272
  Caption = 'myIndai'#225' -> Deloitte'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 403
    Height = 245
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object Shape1: TShape
      Left = 10
      Top = 10
      Width = 383
      Height = 25
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label1: TLabel
      Left = 16
      Top = 15
      Width = 304
      Height = 16
      Caption = 'Arquivos de Integra'#231#227'o myIndai'#225' -> Deloitte'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object SpeedButton1: TSpeedButton
      Left = 300
      Top = 206
      Width = 93
      Height = 28
      Caption = '&Emitir Fatura'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object Shape2: TShape
      Left = 10
      Top = 36
      Width = 383
      Height = 165
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 353
      Top = 66
      Width = 25
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
    end
    object Label2: TLabel
      Left = 24
      Top = 52
      Width = 35
      Height = 13
      Caption = 'Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 100
      Width = 167
      Height = 13
      Caption = 'Email que receber'#225' o arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 148
      Width = 315
      Height = 13
      Caption = 'M'#234's ( as DIs registradas nesse m'#234's entram no arquivo )'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 24
      Top = 114
      Width = 281
      Height = 21
      TabOrder = 0
    end
    object SpinEdit1: TSpinEdit
      Left = 24
      Top = 162
      Width = 41
      Height = 22
      MaxValue = 12
      MinValue = 1
      TabOrder = 1
      Value = 0
    end
    object Edit3: TEdit
      Left = 64
      Top = 66
      Width = 288
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object Edit2: TEdit
      Left = 24
      Top = 66
      Width = 41
      Height = 21
      TabOrder = 2
    end
  end
end
