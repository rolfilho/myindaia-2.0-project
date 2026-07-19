object frm_exp_impressao: Tfrm_exp_impressao
  Left = 237
  Top = 158
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o do Processo de Exporta'#231#227'o'
  ClientHeight = 408
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SrcLabel: TLabel
    Left = 39
    Top = 124
    Width = 145
    Height = 16
    AutoSize = False
    Caption = 'Lista de Origem:'
  end
  object DstLabel: TLabel
    Left = 223
    Top = 124
    Width = 145
    Height = 16
    AutoSize = False
    Caption = 'Lista de Destino:'
  end
  object IncludeBtn: TSpeedButton
    Left = 180
    Top = 172
    Width = 24
    Height = 24
    Caption = '>'
    OnClick = IncludeBtnClick
  end
  object IncAllBtn: TSpeedButton
    Left = 180
    Top = 204
    Width = 24
    Height = 24
    Caption = '>>'
    OnClick = IncAllBtnClick
  end
  object ExcludeBtn: TSpeedButton
    Left = 180
    Top = 236
    Width = 24
    Height = 24
    Caption = '<'
    Enabled = False
    OnClick = ExcludeBtnClick
  end
  object ExAllBtn: TSpeedButton
    Left = 180
    Top = 268
    Width = 24
    Height = 24
    Caption = '<<'
    Enabled = False
    OnClick = ExcAllBtnClick
  end
  object Label5: TLabel
    Left = 13
    Top = 44
    Width = 40
    Height = 13
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_cliente: TSpeedButton
    Left = 415
    Top = 56
    Width = 23
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
    OnClick = btn_co_clienteClick
  end
  object Label1: TLabel
    Left = 13
    Top = 82
    Width = 53
    Height = 13
    Caption = 'Processo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 41
    Top = 140
    Width = 93
    Height = 17
    AutoSize = False
    Caption = 'Processo'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 225
    Top = 140
    Width = 93
    Height = 17
    AutoSize = False
    Caption = 'Processo'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lbl_cd_unid_neg: TLabel
    Left = 13
    Top = 6
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = 'Unidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_unid_neg: TSpeedButton
    Left = 263
    Top = 18
    Width = 25
    Height = 23
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
    OnClick = btn_co_unid_negClick
  end
  object OKBtn: TButton
    Left = 114
    Top = 356
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 6
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 210
    Top = 356
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 7
  end
  object SrcList: TListBox
    Left = 39
    Top = 157
    Width = 122
    Height = 169
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 14
    MultiSelect = True
    ParentFont = False
    Sorted = True
    TabOrder = 4
  end
  object DstList: TListBox
    Left = 223
    Top = 156
    Width = 122
    Height = 169
    TabStop = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 14
    MultiSelect = True
    ParentFont = False
    TabOrder = 5
  end
  object msk_cd_cliente: TMaskEdit
    Left = 13
    Top = 57
    Width = 52
    Height = 21
    EditMask = '99999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 0
    OnChange = msk_cd_clienteChange
    OnExit = msk_cd_clienteExit
    OnKeyDown = msk_cd_clienteKeyDown
  end
  object edt_nm_cliente: TEdit
    Left = 69
    Top = 57
    Width = 340
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 3
  end
  object msk_nr_processo: TMaskEdit
    Left = 13
    Top = 95
    Width = 116
    Height = 21
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 18
    ParentFont = False
    TabOrder = 1
    OnChange = msk_nr_processoChange
    OnEnter = msk_nr_processoEnter
    OnKeyDown = msk_nr_processoKeyDown
  end
  object BitBtn1: TBitBtn
    Left = 136
    Top = 94
    Width = 24
    Height = 24
    Caption = '>'
    Enabled = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object msk_cd_unid_neg: TMaskEdit
    Left = 13
    Top = 19
    Width = 30
    Height = 21
    EditMask = '!99;0; '
    MaxLength = 2
    TabOrder = 8
    Text = 'msk cd unid neg'
    OnExit = msk_cd_unid_negExit
    OnKeyDown = msk_cd_clienteKeyDown
  end
  object edt_nm_unid_neg: TEdit
    Left = 48
    Top = 19
    Width = 209
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 9
  end
  object Crp_EXP: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 344
    Top = 64
  end
end
