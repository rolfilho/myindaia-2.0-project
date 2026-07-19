object frm_sel_unid_prod_cli_arm: Tfrm_sel_unid_prod_cli_arm
  Left = 200
  Top = 108
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relatório de Cliente x Armazém'
  ClientHeight = 375
  ClientWidth = 455
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_cd_unid_neg: TLabel
    Left = 16
    Top = 17
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
  object btn_cd_unid_neg: TSpeedButton
    Left = 405
    Top = 32
    Width = 26
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
    OnClick = btn_cd_unid_negClick
  end
  object lbl_cd_cliente: TLabel
    Left = 16
    Top = 137
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
    Left = 405
    Top = 149
    Width = 25
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
  object lblGrupo: TLabel
    Left = 16
    Top = 97
    Width = 39
    Height = 13
    Caption = 'Grupo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_grupo: TSpeedButton
    Left = 405
    Top = 109
    Width = 25
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
    OnClick = btn_co_grupoClick
  end
  object lbl_produto: TLabel
    Left = 16
    Top = 58
    Width = 45
    Height = 13
    Alignment = taRightJustify
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_produto: TSpeedButton
    Left = 405
    Top = 70
    Width = 25
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
    OnClick = btn_co_produtoClick
  end
  object lbl_arm: TLabel
    Left = 16
    Top = 180
    Width = 51
    Height = 13
    Caption = 'Armazém'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_arm: TSpeedButton
    Left = 405
    Top = 194
    Width = 26
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
    OnClick = btn_co_armClick
  end
  object Label5: TLabel
    Left = 16
    Top = 228
    Width = 44
    Height = 13
    Caption = 'Serviço'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_servico: TSpeedButton
    Left = 405
    Top = 242
    Width = 25
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
    OnClick = btn_co_servicoClick
  end
  object lbl_periodo: TLabel
    Left = 16
    Top = 274
    Width = 120
    Height = 13
    Caption = 'Selecione o período:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_a: TLabel
    Left = 121
    Top = 293
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
  object msk_cd_unid_neg: TMaskEdit
    Left = 16
    Top = 33
    Width = 26
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
    OnExit = msk_cd_unid_negExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_unid_neg: TEdit
    Left = 45
    Top = 33
    Width = 358
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 8
  end
  object OKBtn: TButton
    Left = 138
    Top = 341
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    TabOrder = 6
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 218
    Top = 341
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    TabOrder = 7
    OnClick = CancelBtnClick
  end
  object edt_nm_cliente: TEdit
    Left = 60
    Top = 150
    Width = 343
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 9
  end
  object msk_cd_cliente: TMaskEdit
    Left = 16
    Top = 150
    Width = 39
    Height = 21
    EditMask = '99999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 3
    OnChange = msk_cd_clienteChange
    OnExit = msk_cd_clienteExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_grupo: TEdit
    Left = 60
    Top = 110
    Width = 343
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 10
  end
  object msk_cd_grupo: TMaskEdit
    Left = 16
    Top = 110
    Width = 39
    Height = 21
    EditMask = '999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 2
    OnChange = msk_cd_grupoChange
    OnExit = msk_cd_grupoExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object msk_cd_produto: TMaskEdit
    Left = 16
    Top = 71
    Width = 26
    Height = 21
    EditMask = '99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 1
    OnExit = msk_cd_produtoExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_produto: TEdit
    Left = 45
    Top = 71
    Width = 358
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 11
  end
  object msk_cd_arm: TMaskEdit
    Left = 16
    Top = 194
    Width = 39
    Height = 21
    EditMask = '9999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    TabOrder = 4
    OnExit = msk_cd_armExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_arm: TEdit
    Left = 60
    Top = 194
    Width = 343
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 13
  end
  object msk_cd_servico: TMaskEdit
    Left = 16
    Top = 242
    Width = 39
    Height = 21
    EditMask = '!999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 5
    OnExit = msk_cd_servicoExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_servico: TEdit
    Left = 58
    Top = 242
    Width = 345
    Height = 21
    TabStop = False
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 15
  end
  object msk_dt_inicio: TDateTimePicker
    Left = 16
    Top = 289
    Width = 94
    Height = 21
    CalAlignment = dtaLeft
    Date = 37431.000000000000000000
    Time = 37431.000000000000000000
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
  end
  object msk_dt_fim: TDateTimePicker
    Left = 140
    Top = 289
    Width = 94
    Height = 21
    CalAlignment = dtaLeft
    Date = 37431.000000000000000000
    Time = 37431.000000000000000000
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
  end
  object crp_relat: TCrpe
    WindowShowPrintSetupBtn = True
    PrintFileType = Excel5
    PrintFileName = 'C:\DDBroker\CRGI010.XLS'
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 353
    Top = 279
  end
end
