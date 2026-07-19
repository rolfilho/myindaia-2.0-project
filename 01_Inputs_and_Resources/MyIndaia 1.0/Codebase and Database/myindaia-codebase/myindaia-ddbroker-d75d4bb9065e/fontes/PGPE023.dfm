object frm_exp_duplica: Tfrm_exp_duplica
  Left = 242
  Top = 228
  AutoScroll = False
  Caption = 'Duplica'#231#227'o do Processo de Exporta'#231#227'o'
  ClientHeight = 155
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_duplica: TPanel
    Left = 0
    Top = 41
    Width = 325
    Height = 72
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object lbl_processo: TLabel
      Left = 22
      Top = 19
      Width = 86
      Height = 13
      Caption = 'Processo Atual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 22
      Top = 43
      Width = 87
      Height = 13
      Caption = 'Processo Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_nr_processo: TSpeedButton
      Left = 255
      Top = 14
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
      OnClick = btn_nr_processoClick
    end
    object btn_co_proc_new: TSpeedButton
      Left = 255
      Top = 43
      Width = 25
      Height = 19
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
      OnClick = btn_co_proc_newClick
    end
    object edt_novo_processo: TEdit
      Left = 131
      Top = 41
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edt_novo_processoChange
      OnExit = edt_novo_processoExit
      OnKeyDown = msk_nr_processoKeyDown
    end
    object msk_nr_processo: TMaskEdit
      Left = 131
      Top = 14
      Width = 121
      Height = 21
      MaxLength = 18
      TabOrder = 1
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_nr_processoKeyDown
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 325
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Duplica'#231#227'o do Processo de Exporta'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 113
    Width = 325
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object btn_ok: TBitBtn
      Left = 144
      Top = 9
      Width = 81
      Height = 25
      Caption = '&Ok'
      Enabled = False
      TabOrder = 0
      Kind = bkOK
    end
    object btn_cancela: TBitBtn
      Left = 232
      Top = 9
      Width = 83
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      Kind = bkAbort
    end
  end
end
