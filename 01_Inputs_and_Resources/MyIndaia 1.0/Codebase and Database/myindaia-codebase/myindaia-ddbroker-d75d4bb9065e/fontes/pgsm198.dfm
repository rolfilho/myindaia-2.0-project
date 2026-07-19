object frm_retorno_fi: Tfrm_retorno_fi
  Left = 234
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Retorno de Processos de Exportação'
  ClientHeight = 434
  ClientWidth = 495
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_retorno: TPanel
    Left = 5
    Top = 0
    Width = 484
    Height = 453
    BevelOuter = bvLowered
    TabOrder = 0
    object lbl_cd_unid_neg: TLabel
      Left = 13
      Top = 14
      Width = 48
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 159
      Top = 26
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
      OnClick = btn_co_unid_negClick
    end
    object Label5: TLabel
      Left = 204
      Top = 14
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
      Left = 451
      Top = 27
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
    object Label3: TLabel
      Left = 40
      Top = 73
      Width = 142
      Height = 17
      Alignment = taCenter
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
    object IncludeBtn: TSpeedButton
      Left = 215
      Top = 137
      Width = 24
      Height = 24
      Caption = '>'
      OnClick = IncludeBtnClick
    end
    object IncAllBtn: TSpeedButton
      Left = 215
      Top = 169
      Width = 24
      Height = 24
      Caption = '>>'
      OnClick = IncAllBtnClick
    end
    object ExcludeBtn: TSpeedButton
      Left = 215
      Top = 201
      Width = 24
      Height = 24
      Caption = '<'
      Enabled = False
      OnClick = ExcludeBtnClick
    end
    object ExAllBtn: TSpeedButton
      Left = 215
      Top = 233
      Width = 24
      Height = 24
      Caption = '<<'
      Enabled = False
      OnClick = ExcAllBtnClick
    end
    object Label4: TLabel
      Left = 279
      Top = 73
      Width = 142
      Height = 17
      Alignment = taCenter
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
    object msk_cd_unid_neg: TMaskEdit
      Left = 13
      Top = 27
      Width = 22
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
      OnChange = msk_cd_unid_negChange
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_clienteKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 37
      Top = 27
      Width = 120
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 6
    end
    object edt_nm_cliente: TEdit
      Left = 256
      Top = 27
      Width = 194
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 7
    end
    object msk_cd_cliente: TMaskEdit
      Left = 204
      Top = 27
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
      TabOrder = 1
      OnExit = msk_cd_clienteExit
      OnKeyDown = msk_cd_clienteKeyDown
    end
    object SrcList: TListBox
      Left = 39
      Top = 90
      Width = 144
      Height = 298
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 14
      MultiSelect = True
      ParentFont = False
      Sorted = True
      TabOrder = 2
    end
    object DstList: TListBox
      Left = 278
      Top = 90
      Width = 144
      Height = 298
      TabStop = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 14
      MultiSelect = True
      ParentFont = False
      TabOrder = 3
    end
    object OKBtn: TButton
      Left = 146
      Top = 404
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 4
      OnClick = OKBtnClick
    end
    object CancelBtn: TButton
      Left = 242
      Top = 404
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 5
    end
  end
end
