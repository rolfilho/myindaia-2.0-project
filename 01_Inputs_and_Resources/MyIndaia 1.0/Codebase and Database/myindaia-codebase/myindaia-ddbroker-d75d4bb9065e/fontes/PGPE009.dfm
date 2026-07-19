object frm_pe_duplica: Tfrm_pe_duplica
  Left = 242
  Top = 228
  Width = 360
  Height = 221
  Caption = 'Duplicação do PE'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_duplica: TPanel
    Left = 4
    Top = 4
    Width = 345
    Height = 185
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 0
    object lbl_processo: TLabel
      Left = 24
      Top = 32
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
      Left = 24
      Top = 72
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
      Left = 257
      Top = 27
      Width = 25
      Height = 21
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
    object edt_novo_processo: TEdit
      Left = 133
      Top = 70
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edt_novo_processoChange
      OnExit = edt_novo_processoExit
    end
    object btn_ok: TBitBtn
      Left = 64
      Top = 147
      Width = 81
      Height = 25
      Caption = '&Ok'
      Enabled = False
      TabOrder = 1
      Kind = bkOK
    end
    object btn_cancela: TBitBtn
      Left = 200
      Top = 147
      Width = 83
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
      Kind = bkAbort
    end
    object msk_nr_processo: TMaskEdit
      Left = 133
      Top = 27
      Width = 121
      Height = 21
      TabOrder = 3
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_nr_processoKeyDown
    end
  end
end
