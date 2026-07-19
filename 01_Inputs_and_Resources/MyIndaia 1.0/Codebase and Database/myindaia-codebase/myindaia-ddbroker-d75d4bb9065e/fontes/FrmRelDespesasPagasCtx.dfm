object FormRelDepesasPagasCtx: TFormRelDepesasPagasCtx
  Left = 223
  Top = 152
  BorderStyle = bsDialog
  Caption = 'Despesas Pagas'
  ClientHeight = 230
  ClientWidth = 328
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
  object lbl_produto: TLabel
    Left = 8
    Top = 8
    Width = 45
    Height = 13
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_produto: TSpeedButton
    Left = 295
    Top = 24
    Width = 23
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
    OnClick = btn_co_produtoClick
  end
  object Label1: TLabel
    Left = 8
    Top = 97
    Width = 46
    Height = 13
    Caption = 'Per'#237'odo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 81
    Top = 117
    Width = 8
    Height = 13
    Caption = 'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblGrupo: TLabel
    Left = 7
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
  object btn_co_grupo: TSpeedButton
    Left = 295
    Top = 67
    Width = 23
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
    OnClick = btn_co_grupoClick
  end
  object Label3: TLabel
    Left = 7
    Top = 143
    Width = 25
    Height = 13
    Caption = 'Item'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 295
    Top = 158
    Width = 23
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
    OnClick = SpeedButton1Click
  end
  object edt_nm_produto: TEdit
    Left = 45
    Top = 24
    Width = 250
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 4
  end
  object msk_cd_produto: TMaskEdit
    Left = 8
    Top = 24
    Width = 34
    Height = 21
    EditMask = '99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 0
    OnExit = msk_cd_produtoExit
  end
  object mskDataregistroIni: TMaskEdit
    Left = 8
    Top = 113
    Width = 67
    Height = 21
    CharCase = ecUpperCase
    EditMask = '!99/99/0000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 2
    Text = '  /  /    '
  end
  object mskDataregistroFin: TMaskEdit
    Left = 96
    Top = 113
    Width = 67
    Height = 21
    CharCase = ecUpperCase
    EditMask = '!99/99/0000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 3
    Text = '  /  /    '
  end
  object msk_cd_grupo: TMaskEdit
    Left = 8
    Top = 68
    Width = 33
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = msk_cd_grupoChange
  end
  object edt_nm_grupo: TEdit
    Left = 43
    Top = 68
    Width = 250
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 5
  end
  object Panel1: TPanel
    Left = 0
    Top = 189
    Width = 328
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    DesignSize = (
      328
      41)
    object BitBtn1: TBitBtn
      Left = 241
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&OK'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 161
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancela'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object mskItem: TMaskEdit
    Left = 8
    Top = 159
    Width = 33
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnChange = SpeedButton1Click
  end
  object edtItem: TEdit
    Left = 43
    Top = 159
    Width = 250
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 8
  end
end
