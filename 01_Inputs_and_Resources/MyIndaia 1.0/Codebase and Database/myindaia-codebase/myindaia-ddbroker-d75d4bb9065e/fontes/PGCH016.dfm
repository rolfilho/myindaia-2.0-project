object frm_cheque_avulso: Tfrm_cheque_avulso
  Left = 190
  Top = 238
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o de Cheque Avulso'
  ClientHeight = 434
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_financeiro: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 47
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 40
      Top = 10
      Width = 25
      Height = 25
      Hint = 'Sair'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_sairClick
    end
    object btn_imprimir: TSpeedButton
      Left = 10
      Top = 10
      Width = 25
      Height = 25
      Hint = 'Sair'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_imprimirClick
    end
  end
  object pnl_emissao: TPanel
    Left = 0
    Top = 49
    Width = 631
    Height = 361
    BevelOuter = bvLowered
    Locked = True
    TabOrder = 1
    object lbl_banco_fatur: TLabel
      Left = 18
      Top = 22
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Banco'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_cd_banco: TSpeedButton
      Left = 400
      Top = 36
      Width = 24
      Height = 22
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
      OnClick = btn_cd_bancoClick
    end
    object lbl_favorecido: TLabel
      Left = 18
      Top = 65
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Favorecido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_favorecido: TSpeedButton
      Left = 400
      Top = 79
      Width = 24
      Height = 22
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
      OnClick = btn_co_favorecidoClick
    end
    object Label1: TLabel
      Left = 18
      Top = 108
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 18
      Top = 148
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Local'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 18
      Top = 188
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_valor: TEdit
      Left = 18
      Top = 122
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnEnter = edt_valorEnter
      OnExit = edt_valorExit
    end
    object edt_local: TEdit
      Left = 18
      Top = 162
      Width = 183
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 3
    end
    object edt_nm_banco: TEdit
      Left = 55
      Top = 36
      Width = 338
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
    end
    object msk_cd_banco: TMaskEdit
      Left = 18
      Top = 36
      Width = 31
      Height = 21
      EditMask = '!999;1;_'
      MaxLength = 3
      TabOrder = 0
      Text = '   '
      OnExit = msk_cd_bancoExit
      OnKeyDown = msk_cd_bancoKeyDown
    end
    object edt_nm_favorecido: TEdit
      Left = 73
      Top = 79
      Width = 320
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 6
    end
    object msk_cd_favorecido: TMaskEdit
      Left = 18
      Top = 79
      Width = 47
      Height = 21
      EditMask = '!99999;1;_'
      MaxLength = 5
      TabOrder = 1
      Text = '     '
      OnExit = msk_cd_favorecidoExit
      OnKeyDown = msk_cd_bancoKeyDown
    end
    object msk_data: TDateTimePicker
      Left = 18
      Top = 203
      Width = 89
      Height = 21
      Date = 37431.000000000000000000
      Time = 37431.000000000000000000
      TabOrder = 5
    end
  end
  object Mensagem: TStatusBar
    Left = 0
    Top = 415
    Width = 632
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object menu_cadastro: TMainMenu
    Left = 569
    Top = 4
    object mi_imprime: TMenuItem
      Caption = '&Imprimir'
      OnClick = btn_imprimirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = mi_sairClick
    end
  end
end
