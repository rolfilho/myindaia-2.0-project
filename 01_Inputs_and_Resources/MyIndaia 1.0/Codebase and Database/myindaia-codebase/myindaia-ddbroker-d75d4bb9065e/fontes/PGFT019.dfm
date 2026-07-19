object frm_sel_unid_cli: Tfrm_sel_unid_cli
  Left = 269
  Top = 152
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 393
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_cd_unid_neg: TLabel
    Left = 21
    Top = 16
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
    Left = 167
    Top = 28
    Width = 23
    Height = 22
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
    OnClick = btn_cd_unid_negClick
  end
  object lbl_cd_cliente: TLabel
    Left = 21
    Top = 58
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
    Left = 410
    Top = 70
    Width = 25
    Height = 22
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
    OnClick = btn_co_clienteClick
  end
  object lbl_periodo: TLabel
    Left = 21
    Top = 98
    Width = 120
    Height = 13
    Caption = 'Selecione o per'#237'odo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_a: TLabel
    Left = 128
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
    Left = 21
    Top = 169
    Width = 35
    Height = 13
    Caption = 'Grupo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object btn_co_grupo: TSpeedButton
    Left = 298
    Top = 184
    Width = 25
    Height = 22
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
    Visible = False
    OnClick = btn_co_grupoClick
  end
  object lbl_relatorio: TLabel
    Left = 246
    Top = 98
    Width = 52
    Height = 13
    Caption = 'Relat'#243'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object btn_co_area: TSpeedButton
    Left = 299
    Top = 224
    Width = 25
    Height = 22
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
    Visible = False
    OnClick = btn_co_areaClick
  end
  object lblArea: TLabel
    Left = 21
    Top = 212
    Width = 27
    Height = 13
    Caption = #193'rea'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lbl_grupo_area: TLabel
    Left = 334
    Top = 192
    Width = 65
    Height = 13
    Caption = 'Grupo '#193'rea'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lbl_lead_time: TLabel
    Left = 339
    Top = 257
    Width = 60
    Height = 13
    Caption = 'Lead Time'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lbl_produto: TLabel
    Left = 21
    Top = 250
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
    Visible = False
  end
  object btn_co_produto: TSpeedButton
    Left = 308
    Top = 262
    Width = 25
    Height = 22
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
    Visible = False
    OnClick = btn_co_produtoClick
  end
  object lbl_selec: TLabel
    Left = 22
    Top = 103
    Width = 71
    Height = 13
    Caption = 'Selecionado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lbl_via_transp: TLabel
    Left = 23
    Top = 140
    Width = 84
    Height = 13
    Caption = 'Via Transporte'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object btn_co_via_transp: TSpeedButton
    Left = 300
    Top = 154
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
    Visible = False
    OnClick = btn_co_via_transpClick
  end
  object msk_cd_unid_neg: TMaskEdit
    Left = 21
    Top = 29
    Width = 23
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
    Top = 29
    Width = 121
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 10
  end
  object edt_nm_cliente: TEdit
    Left = 64
    Top = 70
    Width = 345
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 11
  end
  object msk_cd_cliente: TMaskEdit
    Left = 21
    Top = 70
    Width = 43
    Height = 21
    EditMask = '99999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 2
    OnChange = msk_cd_clienteChange
    OnExit = msk_cd_clienteExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_grupo: TEdit
    Left = 56
    Top = 184
    Width = 241
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 9
    Visible = False
  end
  object msk_cd_grupo: TMaskEdit
    Left = 21
    Top = 184
    Width = 35
    Height = 21
    EditMask = '999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 1
    Visible = False
    OnChange = msk_cd_grupoChange
    OnExit = msk_cd_grupoExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object btn_iniciar: TButton
    Left = 144
    Top = 179
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    Default = True
    TabOrder = 7
    OnClick = btn_iniciarClick
  end
  object btn_fechar: TButton
    Left = 244
    Top = 179
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Fechar'
    ModalResult = 2
    TabOrder = 8
    OnClick = btn_fecharClick
  end
  object msk_nr_relatorio: TMaskEdit
    Left = 246
    Top = 113
    Width = 73
    Height = 21
    MaxLength = 6
    TabOrder = 5
    Visible = False
  end
  object msk_cd_area: TMaskEdit
    Left = 21
    Top = 224
    Width = 36
    Height = 21
    EditMask = '99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnChange = msk_cd_grupoChange
    OnExit = msk_cd_areaExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_area: TEdit
    Left = 57
    Top = 224
    Width = 241
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 14
    Visible = False
  end
  object msk_dt_inicio: TDateTimePicker
    Left = 21
    Top = 113
    Width = 94
    Height = 21
    Date = 37431.000000000000000000
    Time = 37431.000000000000000000
    TabOrder = 12
  end
  object msk_dt_fim: TDateTimePicker
    Left = 148
    Top = 113
    Width = 94
    Height = 21
    Date = 37431.000000000000000000
    Time = 37431.000000000000000000
    TabOrder = 13
  end
  object chk_arquivo: TCheckBox
    Left = 336
    Top = 174
    Width = 89
    Height = 17
    Caption = 'Em Arquivo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Visible = False
  end
  object ppView: TppViewer
    Left = 456
    Top = 96
    Width = 25
    Height = 25
    PageColor = clWindow
    Visible = False
    ZoomPercentage = 100
    ZoomSetting = zsWholePage
  end
  object Button1: TButton
    Left = 440
    Top = 128
    Width = 57
    Height = 25
    Caption = 'Button1'
    TabOrder = 17
    Visible = False
    OnClick = Button1Click
  end
  object msk_cd_grupo_area: TMaskEdit
    Left = 334
    Top = 226
    Width = 32
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    Visible = False
    OnChange = msk_cd_grupoChange
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object chk_grafico: TCheckBox
    Left = 445
    Top = 274
    Width = 64
    Height = 17
    Caption = 'Gr'#225'fico'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 19
    Visible = False
  end
  object cbo_lead_time: TComboBox
    Left = 339
    Top = 272
    Width = 104
    Height = 21
    ItemHeight = 13
    TabOrder = 20
    Text = 'cbo_lead_time'
    Visible = False
  end
  object msk_cd_produto: TMaskEdit
    Left = 21
    Top = 263
    Width = 31
    Height = 21
    EditMask = '99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 21
    Visible = False
    OnExit = msk_cd_produtoExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_produto: TEdit
    Left = 52
    Top = 263
    Width = 255
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 22
    Visible = False
  end
  object rdg_tp_processo: TRadioGroup
    Left = 21
    Top = 292
    Width = 241
    Height = 94
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Processos Pagos'
      'Processos Desembara'#231'ados'
      'Processos Pagos e Desembara'#231'ados')
    ParentFont = False
    TabOrder = 23
    Visible = False
  end
  object chk_completo: TCheckBox
    Left = 280
    Top = 298
    Width = 73
    Height = 17
    Caption = 'Completo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 24
    Visible = False
  end
  object chk_dias_uteis: TCheckBox
    Left = 280
    Top = 327
    Width = 81
    Height = 17
    Caption = 'Dias '#250'teis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 25
    Visible = False
  end
  object rdg_tipo: TRadioGroup
    Left = 342
    Top = 293
    Width = 160
    Height = 93
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Desembara'#231'o'
      'Fretes Internacionais'
      'Todos')
    ParentFont = False
    TabOrder = 26
    Visible = False
  end
  object cbb_Selec: TComboBox
    Left = 22
    Top = 116
    Width = 104
    Height = 21
    ItemHeight = 13
    ItemIndex = 2
    TabOrder = 27
    Text = 'Ambos'
    Visible = False
    Items.Strings = (
      'Sim'
      'N'#227'o'
      'Ambos')
  end
  object msk_cd_via_transp: TMaskEdit
    Left = 22
    Top = 154
    Width = 33
    Height = 21
    EditMask = '99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnExit = msk_cd_via_transpExit
  end
  object edt_nm_via_transp: TEdit
    Left = 58
    Top = 154
    Width = 241
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 15
    Visible = False
  end
  object crp_afaturar: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 288
    Top = 12
  end
end
