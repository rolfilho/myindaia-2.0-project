object frm_po_impressao: Tfrm_po_impressao
  Left = 237
  Top = 158
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o de PO'
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
    Left = 66
    Top = 120
    Width = 145
    Height = 16
    AutoSize = False
    Caption = 'Lista de Origem:'
  end
  object DstLabel: TLabel
    Left = 250
    Top = 120
    Width = 145
    Height = 16
    AutoSize = False
    Caption = 'Lista de Destino:'
  end
  object IncludeBtn: TSpeedButton
    Left = 207
    Top = 168
    Width = 24
    Height = 24
    Caption = '>'
    OnClick = IncludeBtnClick
  end
  object IncAllBtn: TSpeedButton
    Left = 207
    Top = 200
    Width = 24
    Height = 24
    Caption = '>>'
    OnClick = IncAllBtnClick
  end
  object ExcludeBtn: TSpeedButton
    Left = 207
    Top = 232
    Width = 24
    Height = 24
    Caption = '<'
    Enabled = False
    OnClick = ExcludeBtnClick
  end
  object ExAllBtn: TSpeedButton
    Left = 207
    Top = 264
    Width = 24
    Height = 24
    Caption = '<<'
    Enabled = False
    OnClick = ExcAllBtnClick
  end
  object Label5: TLabel
    Left = 13
    Top = 9
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
    Top = 21
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
    Top = 49
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
    Left = 68
    Top = 136
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
    Left = 252
    Top = 136
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
  object OKBtn: TButton
    Left = 145
    Top = 356
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 6
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 241
    Top = 356
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 7
  end
  object SrcList: TListBox
    Left = 66
    Top = 153
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
    Left = 250
    Top = 152
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
    Top = 22
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
    Top = 22
    Width = 340
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 3
  end
  object msk_nr_processo: TMaskEdit
    Left = 13
    Top = 62
    Width = 84
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
  end
  object BitBtn1: TBitBtn
    Left = 104
    Top = 61
    Width = 24
    Height = 24
    Caption = '>'
    Enabled = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Crp_PO: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 344
    Top = 64
  end
end
