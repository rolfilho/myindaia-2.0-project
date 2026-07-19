object frm_recalc_proc: Tfrm_recalc_proc
  Left = 186
  Top = 133
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Recalculo de Processos'
  ClientHeight = 316
  ClientWidth = 362
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SrcLabel: TLabel
    Left = 16
    Top = 64
    Width = 145
    Height = 16
    AutoSize = False
    Caption = 'Lista de Origem:'
  end
  object DstLabel: TLabel
    Left = 200
    Top = 64
    Width = 145
    Height = 16
    AutoSize = False
    Caption = 'Lista de Destino:'
  end
  object IncludeBtn: TSpeedButton
    Left = 168
    Top = 112
    Width = 24
    Height = 24
    Caption = '>'
    OnClick = IncludeBtnClick
  end
  object IncAllBtn: TSpeedButton
    Left = 168
    Top = 144
    Width = 24
    Height = 24
    Caption = '>>'
    OnClick = IncAllBtnClick
  end
  object ExcludeBtn: TSpeedButton
    Left = 168
    Top = 176
    Width = 24
    Height = 24
    Caption = '<'
    Enabled = False
    OnClick = ExcludeBtnClick
  end
  object ExAllBtn: TSpeedButton
    Left = 168
    Top = 208
    Width = 24
    Height = 24
    Caption = '<<'
    Enabled = False
    OnClick = ExcAllBtnClick
  end
  object lbl_unidade2: TLabel
    Left = 16
    Top = 8
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
  object btn_co_unidade2: TSpeedButton
    Left = 296
    Top = 24
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
    OnClick = btn_co_unidade2Click
  end
  object OKBtn: TButton
    Left = 103
    Top = 284
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 2
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 183
    Top = 284
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = CancelBtnClick
  end
  object SrcList: TListBox
    Left = 16
    Top = 80
    Width = 144
    Height = 185
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 0
  end
  object DstList: TListBox
    Left = 200
    Top = 80
    Width = 144
    Height = 185
    TabStop = False
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 1
  end
  object mskedt_cd_unid_neg: TMaskEdit
    Left = 16
    Top = 24
    Width = 33
    Height = 21
    EditMask = '99;1;_'
    MaxLength = 2
    TabOrder = 4
    Text = '  '
    OnExit = mskedt_cd_unid_negExit
  end
  object edt_nm_unid_neg: TEdit
    Left = 52
    Top = 24
    Width = 237
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 5
  end
end
