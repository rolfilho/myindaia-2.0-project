object frm_profit_maritimo: Tfrm_profit_maritimo
  Left = 0
  Top = 0
  Width = 1024
  Height = 740
  Caption = 'Pr'#233'-Alerta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object painel_inclusao: TPanel
    Left = 24
    Top = 187
    Width = 575
    Height = 433
    BevelInner = bvLowered
    TabOrder = 2
    Visible = False
    object shp1: TShape
      Left = 12
      Top = 243
      Width = 551
      Height = 100
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp5: TShape
      Left = 334
      Top = 251
      Width = 134
      Height = 16
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object shp4: TShape
      Left = 193
      Top = 251
      Width = 137
      Height = 16
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object shp3: TShape
      Left = 20
      Top = 251
      Width = 137
      Height = 16
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object shp2: TShape
      Left = 12
      Top = 109
      Width = 551
      Height = 131
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label122: TLabel
      Left = 11
      Top = 350
      Width = 71
      Height = 13
      Caption = 'Tipo do Master'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label123: TLabel
      Left = 191
      Top = 350
      Width = 46
      Height = 13
      Caption = 'Nr Master'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 11
      Top = 28
      Width = 40
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 285
      Top = 28
      Width = 37
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 22
      Top = 156
      Width = 39
      Height = 13
      Caption = 'Armador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 305
      Top = 119
      Width = 36
      Height = 13
      Caption = 'Destino'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lb_agente: TLabel
      Left = 306
      Top = 157
      Width = 34
      Height = 13
      Caption = 'Agente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 22
      Top = 116
      Width = 33
      Height = 13
      Caption = 'Origem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 22
      Top = 252
      Width = 49
      Height = 13
      Caption = 'Processos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label17: TLabel
      Left = 195
      Top = 252
      Width = 36
      Height = 13
      Caption = 'Houses'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object btn_co_orig: TSpeedButton
      Left = 267
      Top = 129
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
      OnClick = btn_co_origClick
    end
    object btn_co_dest: TSpeedButton
      Left = 526
      Top = 131
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
      OnClick = btn_co_destClick
    end
    object btn_co_armador: TSpeedButton
      Left = 267
      Top = 169
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
      OnClick = btn_co_armadorClick
    end
    object btn_co_ag: TSpeedButton
      Left = 527
      Top = 170
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
      OnClick = btn_co_agClick
    end
    object IncludeBtn: TSpeedButton
      Left = 163
      Top = 276
      Width = 24
      Height = 24
      Caption = '>'
      Flat = True
      OnClick = IncludeBtnClick
    end
    object ExcludeBtn: TSpeedButton
      Left = 163
      Top = 303
      Width = 24
      Height = 24
      Caption = '<'
      Enabled = False
      Flat = True
      OnClick = ExcludeBtnClick
    end
    object lb_house: TLabel
      Left = 336
      Top = 252
      Width = 50
      Height = 13
      Caption = 'Nr Houses'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label20: TLabel
      Left = 22
      Top = 195
      Width = 33
      Height = 13
      Caption = 'Moeda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btn_co_moeda: TSpeedButton
      Left = 267
      Top = 208
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
      OnClick = btn_co_moedaClick
    end
    object lbl_nr_processo: TLabel
      Left = 12
      Top = 66
      Width = 85
      Height = 13
      Caption = 'Processo Base'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_processo: TSpeedButton
      Left = 106
      Top = 78
      Width = 24
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
      OnClick = btn_co_processoClick
    end
    object ComboBox_tp_master: TComboBox
      Left = 12
      Top = 364
      Width = 170
      Height = 21
      ItemHeight = 13
      TabOrder = 9
      OnChange = ComboBox_tp_masterChange
      Items.Strings = (
        'Direto'
        'Consolidado')
    end
    object msk_master: TMaskEdit
      Left = 191
      Top = 364
      Width = 170
      Height = 21
      MaxLength = 14
      TabOrder = 10
    end
    object Panel23: TPanel
      Left = 2
      Top = 2
      Width = 571
      Height = 18
      Align = alTop
      BevelOuter = bvNone
      Color = clActiveCaption
      TabOrder = 11
      object Label125: TLabel
        Left = 3
        Top = 2
        Width = 49
        Height = 13
        Caption = 'Inclus'#227'o'
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 552
        Top = -1
        Width = 18
        Height = 16
        Caption = '[x]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btn_cancelaClick
      end
    end
    object edt_nm_unid: TEdit
      Left = 12
      Top = 41
      Width = 263
      Height = 19
      TabStop = False
      Color = clMenu
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 12
    end
    object edt_nm_prod: TEdit
      Left = 286
      Top = 41
      Width = 278
      Height = 19
      TabStop = False
      Color = clMenu
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 13
    end
    object edt_nm_origem: TEdit
      Left = 55
      Top = 129
      Width = 211
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 15
    end
    object edt_nm_destino: TEdit
      Left = 338
      Top = 132
      Width = 187
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 16
    end
    object edt_nm_armador: TEdit
      Left = 55
      Top = 169
      Width = 211
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 17
    end
    object edt_nm_agente: TEdit
      Left = 339
      Top = 170
      Width = 187
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 18
    end
    object Lis_proc: TListBox
      Left = 20
      Top = 265
      Width = 137
      Height = 70
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 6
    end
    object Lis_house: TListBox
      Left = 193
      Top = 265
      Width = 137
      Height = 70
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 7
    end
    object grdRef: TStringGrid
      Left = 334
      Top = 265
      Width = 134
      Height = 70
      ColCount = 2
      DefaultColWidth = 130
      DefaultRowHeight = 13
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
      ScrollBars = ssVertical
      TabOrder = 8
      OnKeyDown = grdRefKeyDown
      OnSetEditText = grdRefSetEditText
    end
    object edt_nm_moeda: TEdit
      Left = 55
      Top = 208
      Width = 211
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 19
    end
    object pnl1: TPanel
      Left = 2
      Top = 395
      Width = 571
      Height = 36
      Align = alBottom
      BevelOuter = bvNone
      Color = clSilver
      TabOrder = 20
      object btn_inclusao: TButton
        Left = 439
        Top = 6
        Width = 63
        Height = 25
        Caption = 'OK'
        TabOrder = 0
        OnClick = btn_inclusaoClick
      end
      object btn_cancela: TButton
        Left = 503
        Top = 6
        Width = 63
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = btn_cancelaClick
      end
    end
    object msk_cd_destino: TMaskEdit
      Left = 305
      Top = 132
      Width = 34
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 2
      OnChange = btn_co_destClick
      OnExit = msk_cd_destinoExit
      OnKeyDown = dbedt_cd_agente_diretoKeyDown
    end
    object msk_cd_origem: TMaskEdit
      Left = 22
      Top = 129
      Width = 34
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 1
      OnChange = btn_co_origClick
      OnExit = msk_cd_origemExit
      OnKeyDown = dbedt_cd_agente_diretoKeyDown
    end
    object msk_cd_agente: TMaskEdit
      Left = 306
      Top = 170
      Width = 34
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 4
      OnChange = btn_co_agClick
      OnExit = msk_cd_agenteExit
      OnKeyDown = dbedt_cd_agente_diretoKeyDown
    end
    object msk_cd_moeda: TMaskEdit
      Left = 22
      Top = 208
      Width = 34
      Height = 21
      EditMask = '999;0; '
      MaxLength = 3
      TabOrder = 5
      OnChange = btn_co_moeda_conClick
      OnExit = msk_cd_moedaExit
      OnKeyDown = dbedt_cd_agente_diretoKeyDown
    end
    object msk_cd_armador: TMaskEdit
      Left = 22
      Top = 169
      Width = 34
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 3
      OnChange = btn_co_armadorClick
      OnExit = msk_cd_armadorExit
      OnKeyDown = dbedt_cd_agente_diretoKeyDown
    end
    object msk_nr_processo: TMaskEdit
      Left = 12
      Top = 79
      Width = 93
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 0
      OnEnter = msk_nr_processoEnter
      OnExit = msk_nr_processoExit
    end
    object chkProcessos: TCheckBox
      Left = 135
      Top = 79
      Width = 124
      Height = 17
      Caption = #218'ltimos Processos'
      Checked = True
      State = cbChecked
      TabOrder = 14
    end
  end
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 48
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      1016
      48)
    object btn_sair: TSpeedButton
      Left = 673
      Top = 3
      Width = 38
      Height = 41
      Hint = 'Sair'
      Anchors = [akTop, akRight]
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
    object btn_salvar: TSpeedButton
      Left = 44
      Top = 3
      Width = 40
      Height = 41
      Hint = 'Salvar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 84
      Top = 3
      Width = 40
      Height = 41
      Hint = 'Cancelar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = btn_cancelarClick
    end
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 3
      Width = 40
      Height = 41
      Hint = 'Incluir'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_incluirClick
    end
    object btn_pesq: TSpeedButton
      Left = 136
      Top = 3
      Width = 38
      Height = 41
      Hint = 'Pesquisar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
        BB0BBBBBBBBBBBBBBF8FBBBBBBBBBBBBB000BBBBBBBBBBBBF888BBBBBBBBBBBB
        000BBBBBBBBBBBBF888BBBBBBBBBBBB000BBBBBBBBBBBBF888BBBBBBBBBBBB00
        0BBBBBBBBFFFBF888BBBBBB80008BB80BBBBBBBF8883F888BBBBBB08888800BB
        BBBBBB887778888BBBBBB08FFFFF80BBBBBBB8F7777778FBBBBB88FFFFFFF88B
        BBBBB8777777783FBBBB08FFFFFFF80BBBBB8F777777778FBBBB08FFFFFFF80B
        BBBB8F777777778FBBBB08FFFFFFF80BBBBB83F77777778BBBBB88FFFFFFF88B
        BBBBB8F7777778FBBBBBB08FFFFF80BBBBBBB83FF777F8BBBBBBBB0888880BBB
        BBBBBB883FF88BBBBBBBBBB80008BBBBBBBBBBBB888BBBBBBBBB}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_pesqClick
    end
    object btn_calculo: TSpeedButton
      Left = 224
      Top = 3
      Width = 38
      Height = 41
      Hint = 'C'#225'lculo do Profit'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337444444444
        73333337777777773F333348888888884333337F3F3F3FFF7F33334848489998
        4333337F737377737F333348888888884333337F3F3F3F3F7F33334848484848
        4333337F737373737F333348888888884333337F3F3F3F3F7F33334848484848
        4333337F737373737F333348888888884333337F3F3F3F3F7F33334848484848
        4333337F737373737F333348888888884333337F3FFFFFFF7F33334844444448
        4333337F7777777F7F333348444E4E484333337F7FFFFF7F7F33334844444448
        4333337F777777737F333348888888884333337F333333337F33334888888888
        43333373FFFFFFFF733333744444444473333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_calculoClick
    end
    object btn_tarifa_master: TSpeedButton
      Left = 186
      Top = 3
      Width = 38
      Height = 41
      Hint = 'Busca das tarifas do Master'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_tarifa_masterClick
    end
    object btn_finaliza_proc: TSpeedButton
      Left = 262
      Top = 3
      Width = 38
      Height = 41
      Hint = 'Finaliza Consolidada'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
        000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
        99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
        0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
        FFFF3333337F337F333333333307B70FFFFF33333373FF733F333333333000FF
        0FFF3333333777337FF3333333333FF000FF33FFFFF3333777FF300000333300
        000F377777F33377777F30EEE0333000000037F337F33777777730EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F3333777F3300000333330
        00FF3777773333F77733333333333000033F3333333337777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_finaliza_procClick
    end
    object btn_imprimir: TSpeedButton
      Left = 407
      Top = 3
      Width = 38
      Height = 41
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
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
      OnClick = btn_lista_relClick
    end
    object btn_lista_rel: TSpeedButton
      Left = 445
      Top = 3
      Width = 11
      Height = 41
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337F33333333333333033333333333333373F333333333333000333
        33333333337F7F33333333333300033333333333337373F33333333330000033
        3333333337FFFFF3333333333000003333333333373337333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_lista_relClick
    end
    object Label1: TLabel
      Left = 719
      Top = 5
      Width = 56
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 855
      Top = 5
      Width = 37
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Ordem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_solinum: TSpeedButton
      Left = 314
      Top = 3
      Width = 40
      Height = 41
      Hint = 'Solicita'#231#227'o de Numer'#225'rio - <Ctrl+F4>'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
        0008200000000000000880FFFFFFFFFFFF082088888888888808C0FFFFF00FFF
        FF082088888778888808C0FFF000000FFF082088877777788808C0FF0FF00FF0
        FF082088788778878808C0FF0FF00FF0FF082088788778878808C0FFFFF00FF0
        FF082088888778878808C0FF00000000FF082088777777778808C0FF0FF00FFF
        FF082088788778888808C0FF0FF00FFFFF082088788778888808C0FF0FF00FF0
        FF082088788778878808C0FFF000000FFF082088877777788808C0FFFFF00FFF
        FF082088888778888808C0FFFFFFFFFFFF082088888888888808C00000000000
        00082000000000000008CCCCCCCCCCCCCC882222222222222288}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_solinumClick
    end
    object btn_pagto: TSpeedButton
      Left = 354
      Top = 3
      Width = 40
      Height = 41
      Hint = 'Pagamentos <CTRL+F7>'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
        555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
        05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
        FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
        FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
        FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
        05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
        555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
        9055575757575757775505050505055505557575757575557555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
    object edt_chave: TEdit
      Left = 720
      Top = 19
      Width = 129
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 856
      Top = 19
      Width = 153
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 1
      TabStop = False
      OnChange = cb_ordemChange
    end
  end
  object pgctrl_aviso_cheg: TPageControl
    Left = 0
    Top = 48
    Width = 1016
    Height = 646
    ActivePage = ts_houses
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_aviso_chegChange
    OnChanging = pgctrl_aviso_chegChanging
    object ts_pesquisa: TTabSheet
      Caption = 'Lista'
      ImageIndex = 4
      object DBGrid10: TDBGrid
        Left = 0
        Top = 89
        Width = 1008
        Height = 529
        Align = alClient
        DataSource = datm_profit_maritimo.ds_pes_cliente
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid10DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_MASTER'
            Title.Caption = 'Master'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_HOUSE'
            Title.Caption = 'House'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_processo'
            Title.Caption = 'Processo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_CLIENTE'
            Title.Caption = 'C'#243'd.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CLIENTE'
            Title.Caption = 'Cliente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 222
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SIGLA_ORIGEM'
            Title.Caption = 'Origem'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SIGLA_DESTINO'
            Title.Caption = 'Destino'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 51
            Visible = True
          end>
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 89
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label5: TLabel
          Left = 9
          Top = 8
          Width = 52
          Height = 13
          Caption = 'Unidade '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 284
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
        object Label8: TLabel
          Left = 372
          Top = 45
          Width = 44
          Height = 13
          Caption = 'Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_unid_pesq: TSpeedButton
          Left = 250
          Top = 21
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
          OnClick = btn_co_unid_pesqClick
        end
        object btn_co_prod_pesq: TSpeedButton
          Left = 524
          Top = 21
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
          OnClick = btn_co_prod_pesqClick
        end
        object btn_co_destino_pesq: TSpeedButton
          Left = 699
          Top = 58
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
          OnClick = btn_co_destino_pesqClick
        end
        object Label9: TLabel
          Left = 9
          Top = 45
          Width = 40
          Height = 13
          Caption = 'Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_origem_pesq: TSpeedButton
          Left = 337
          Top = 58
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
          OnClick = btn_co_origem_pesqClick
        end
        object edt_nm_unid_pesq: TEdit
          Left = 53
          Top = 21
          Width = 196
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 1
        end
        object edt_nm_prod_pesq: TEdit
          Left = 327
          Top = 21
          Width = 196
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 3
        end
        object edt_nm_destino_pesq: TEdit
          Left = 415
          Top = 58
          Width = 283
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 8
        end
        object edt_nm_origem_pesq: TEdit
          Left = 53
          Top = 58
          Width = 283
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 6
        end
        object msk_origem_pesq: TMaskEdit
          Left = 10
          Top = 58
          Width = 44
          Height = 21
          EditMask = '9999;0; '
          MaxLength = 4
          TabOrder = 5
          OnChange = btn_co_origem_pesqClick
          OnExit = msk_origem_pesqExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object msk_unid_pesq: TMaskEdit
          Left = 10
          Top = 21
          Width = 44
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 0
          OnChange = btn_co_unid_pesqClick
          OnExit = msk_unid_pesqExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object msk_prod_pesq: TMaskEdit
          Left = 284
          Top = 21
          Width = 44
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 2
          OnChange = btn_co_prod_pesqClick
          OnExit = msk_prod_pesqExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object msk_destino_pesq: TMaskEdit
          Left = 372
          Top = 58
          Width = 44
          Height = 21
          EditMask = '9999;0; '
          MaxLength = 4
          TabOrder = 7
          OnChange = btn_co_destino_pesqClick
          OnExit = msk_destino_pesqExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object chkApenasAbertos: TCheckBox
          Left = 561
          Top = 23
          Width = 168
          Height = 17
          TabStop = False
          Caption = 'N'#227'o transferidos p/ o account'
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = chkApenasAbertosClick
        end
      end
    end
    object ts_master: TTabSheet
      Caption = 'Master'
      ImageIndex = 3
      DesignSize = (
        1008
        618)
      object shp13: TShape
        Left = 498
        Top = 8
        Width = 221
        Height = 34
        Brush.Style = bsClear
        Pen.Color = clSilver
      end
      object Shape5: TShape
        Left = 285
        Top = 8
        Width = 214
        Height = 34
        Brush.Style = bsClear
        Pen.Color = clSilver
      end
      object shp15: TShape
        Left = 152
        Top = 8
        Width = 134
        Height = 34
        Brush.Style = bsClear
        Pen.Color = clSilver
      end
      object shp14: TShape
        Left = 13
        Top = 8
        Width = 140
        Height = 34
        Brush.Style = bsClear
        Pen.Color = clSilver
      end
      object shp16: TShape
        Left = 13
        Top = 42
        Width = 341
        Height = 34
        Brush.Style = bsClear
        Pen.Color = clSilver
      end
      object shp17: TShape
        Left = 11
        Top = 6
        Width = 710
        Height = 72
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape4: TShape
        Left = 353
        Top = 42
        Width = 366
        Height = 34
        Brush.Style = bsClear
        Pen.Color = clSilver
      end
      object Label54: TLabel
        Left = 359
        Top = 45
        Width = 47
        Height = 13
        Caption = 'Armador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label47: TLabel
        Left = 10
        Top = 122
        Width = 59
        Height = 13
        Caption = 'Tipo Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label56: TLabel
        Left = 290
        Top = 13
        Width = 40
        Height = 13
        Caption = 'Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label57: TLabel
        Left = 503
        Top = 14
        Width = 44
        Height = 13
        Caption = 'Destino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label59: TLabel
        Left = 455
        Top = 84
        Width = 35
        Height = 13
        Caption = 'Sa'#237'da'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label60: TLabel
        Left = 181
        Top = 84
        Width = 59
        Height = 13
        Caption = 'Nr Viagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label64: TLabel
        Left = 547
        Top = 84
        Width = 85
        Height = 13
        Caption = 'Prev. Chegada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label31: TLabel
        Left = 637
        Top = 84
        Width = 51
        Height = 13
        Caption = 'Chegada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label43: TLabel
        Left = 421
        Top = 122
        Width = 127
        Height = 13
        Caption = 'Armaz'#233'm de Descarga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_descarga: TSpeedButton
        Left = 696
        Top = 135
        Width = 25
        Height = 20
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
        OnClick = btn_co_descargaClick
      end
      object Label45: TLabel
        Left = 132
        Top = 122
        Width = 131
        Height = 13
        Caption = 'Armaz'#233'm de Atraca'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_atracacao: TSpeedButton
        Left = 383
        Top = 135
        Width = 25
        Height = 20
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
        OnClick = btn_co_atracacaoClick
      end
      object btn_co_notificador: TSpeedButton
        Left = 154
        Top = 136
        Width = 25
        Height = 20
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
        OnClick = btn_co_notificadorClick
      end
      object Label49: TLabel
        Left = 11
        Top = 84
        Width = 34
        Height = 13
        Caption = 'Navio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_veiculo: TSpeedButton
        Left = 147
        Top = 97
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
        OnClick = btn_co_veiculoClick
      end
      object lbl7: TLabel
        Left = 364
        Top = 84
        Width = 70
        Height = 13
        Caption = 'Data Master'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn1: TSpeedButton
        Left = 219
        Top = 97
        Width = 24
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
        OnClick = btn1Click
      end
      object Label44: TLabel
        Left = 18
        Top = 13
        Width = 39
        Height = 13
        Caption = 'Master'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label30: TLabel
        Left = 157
        Top = 13
        Width = 48
        Height = 13
        Caption = 'Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label52: TLabel
        Left = 19
        Top = 45
        Width = 41
        Height = 13
        Caption = 'Agente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label132: TLabel
        Left = 252
        Top = 84
        Width = 92
        Height = 13
        Caption = 'Viagem Armador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 11
        Top = 160
        Width = 711
        Height = 56
        Caption = 'Transbordo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 23
        object Label55: TLabel
          Left = 234
          Top = 13
          Width = 31
          Height = 13
          Caption = 'Porto'
        end
        object Label61: TLabel
          Left = 612
          Top = 13
          Width = 28
          Height = 13
          Caption = 'Data'
        end
        object Label62: TLabel
          Left = 488
          Top = 13
          Width = 60
          Height = 13
          Caption = 'N'#186' Viagem'
        end
        object btn_co_porto_conso: TSpeedButton
          Left = 452
          Top = 26
          Width = 25
          Height = 20
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
          OnClick = btn_co_porto_consoClick
        end
        object Label63: TLabel
          Left = 7
          Top = 13
          Width = 34
          Height = 13
          Caption = 'Navio'
        end
        object btn_co_navio_transp_conso: TSpeedButton
          Left = 199
          Top = 26
          Width = 25
          Height = 20
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
          OnClick = btn_co_navio_transp_consoClick
        end
        object dbedt_nm_porto_transp: TDBEdit
          Left = 274
          Top = 26
          Width = 177
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_PORTO_TRANSB'
          DataSource = datm_profit_maritimo.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nm_veic_trans: TDBEdit
          Left = 46
          Top = 26
          Width = 152
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_VEICULO_TRANSB'
          DataSource = datm_profit_maritimo.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_veic_transb: TDBEdit
          Left = 8
          Top = 26
          Width = 39
          Height = 21
          DataField = 'CD_VEIC_TRANSBORDO'
          DataSource = datm_profit_maritimo.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_cd_agente_diretoChange
          OnExit = dbedt_cd_veic_transbExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
        object dbedt_nr_viagem_transb: TDBEdit
          Left = 488
          Top = 26
          Width = 113
          Height = 21
          DataField = 'NR_VIAGEM_TRANSBORDO'
          DataSource = datm_profit_maritimo.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = dbedt_cd_agente_diretoChange
        end
        object dbedt_dt_transb: TDBEdit
          Left = 612
          Top = 26
          Width = 90
          Height = 21
          DataField = 'DT_TRANSBORDO'
          DataSource = datm_profit_maritimo.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnChange = dbedt_cd_agente_diretoChange
        end
        object dbedt_cd_porto_transp: TDBEdit
          Left = 235
          Top = 26
          Width = 40
          Height = 21
          DataField = 'CD_PORTO_TRANSBORDO'
          DataSource = datm_profit_maritimo.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_cd_agente_diretoChange
          OnExit = dbedt_cd_porto_transpExit
          OnKeyDown = dbedt_cd_agente_diretoKeyDown
        end
      end
      object Panel25: TPanel
        Left = 12
        Top = 225
        Width = 710
        Height = 381
        Anchors = [akLeft, akTop, akBottom]
        BevelOuter = bvNone
        BorderWidth = 4
        TabOrder = 24
        DesignSize = (
          710
          381)
        object shp19: TShape
          Left = 0
          Top = 0
          Width = 710
          Height = 381
          Anchors = [akLeft, akTop, akBottom]
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object shp20: TShape
          Left = 4
          Top = 4
          Width = 702
          Height = 20
          Align = alTop
          Brush.Color = clSilver
          Pen.Style = psClear
        end
        object shp21: TShape
          Left = 2
          Top = 2
          Width = 706
          Height = 19
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object lbl16: TLabel
          Left = 4
          Top = 232
          Width = 702
          Height = 13
          Align = alTop
          Caption = 'Despesas do Master / Tabela de Frete'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object shp18: TShape
          Left = 4
          Top = 230
          Width = 702
          Height = 2
          Align = alTop
          Brush.Style = bsClear
          Pen.Style = psClear
        end
        object lbl17: TLabel
          Left = 6
          Top = 6
          Width = 315
          Height = 13
          Caption = 'Demonstrativo de Custo ( Container e Tabela de Frete )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object pnl_master_fcl: TPanel
          Left = 4
          Top = 72
          Width = 702
          Height = 79
          Align = alTop
          BevelOuter = bvNone
          Caption = 'pnl_master_fcl'
          TabOrder = 1
          object dbgrid_master_fcl: TDBGrid
            Left = 0
            Top = 0
            Width = 702
            Height = 79
            Align = alClient
            Ctl3D = False
            DataSource = datm_profit_maritimo.ds_master_carga
            Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnColExit = dbgrid_master_fclColExit
            OnDblClick = dbgrid_containerDblClick
            OnKeyDown = dbgrid_master_fclKeyDown
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TP_CNTR'
                Title.Caption = 'C'#243'd.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 32
                Visible = True
              end
              item
                Color = 16773087
                Expanded = False
                FieldName = 'calcNomeCNTR'
                Title.Caption = 'Contanier'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 256
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'QTDE'
                Title.Caption = 'Qtde'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 78
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PESO_TON'
                Title.Caption = 'Peso (Ton)'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 119
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'VL_COMPRA'
                Title.Caption = 'Valor Compra'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 115
                Visible = True
              end>
          end
        end
        object Panel11: TPanel
          Left = 4
          Top = 24
          Width = 702
          Height = 48
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lb_tt_master_frete: TLabel
            Left = 476
            Top = 5
            Width = 63
            Height = 13
            Caption = 'Total Frete'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label71: TLabel
            Left = 394
            Top = 5
            Width = 34
            Height = 13
            Caption = 'Tarifa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 302
            Top = 5
            Width = 75
            Height = 13
            Caption = 'Peso Taxado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label53: TLabel
            Left = 81
            Top = 5
            Width = 107
            Height = 13
            Caption = 'Tipo de Estufagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label58: TLabel
            Left = 4
            Top = 5
            Width = 39
            Height = 13
            Caption = 'Moeda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 209
            Top = 5
            Width = 28
            Height = 13
            Caption = 'Qtde'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_tarifa_master_conso: TDBEdit
            Left = 396
            Top = 18
            Width = 72
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'TARIFA_CUSTO'
            DataSource = datm_profit_maritimo.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            OnChange = dbedt_termo_diretoChange
          end
          object dbedt_tt_frete_master_conso: TDBEdit
            Left = 478
            Top = 18
            Width = 85
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'TT_FRETE_MASTER'
            DataSource = datm_profit_maritimo.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            OnChange = dbedt_termo_diretoChange
          end
          object DBEdit5: TDBEdit
            Left = 303
            Top = 18
            Width = 82
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CHARG_MASTER'
            DataSource = datm_profit_maritimo.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            OnChange = dbedt_cd_agente_diretoChange
          end
          object rxc_tp_estufagem_master: TRxDBComboBox
            Left = 83
            Top = 18
            Width = 117
            Height = 21
            Style = csDropDownList
            Ctl3D = True
            DataField = 'TP_ESTUFAGEM'
            DataSource = datm_profit_maritimo.ds_master
            Enabled = False
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'LCL'
              'FCL')
            ParentCtl3D = False
            TabOrder = 1
            Values.Strings = (
              '0'
              '1')
            OnChange = rxc_tp_estufagem_masterChange
          end
          object DBEdit39: TDBEdit
            Left = 5
            Top = 18
            Width = 68
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'AP_MOEDA'
            DataSource = datm_profit_maritimo.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnChange = dbedt_cd_agente_diretoChange
          end
          object DBEdit18: TDBEdit
            Left = 210
            Top = 18
            Width = 82
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'VOL_MASTER'
            DataSource = datm_profit_maritimo.ds_master
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            OnChange = dbedt_cd_agente_diretoChange
          end
        end
        object dbgrid_despesa_master: TDBGrid
          Left = 4
          Top = 245
          Width = 702
          Height = 132
          Hint = 
            '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em azul abem Consultas' +
            ' OnLine'#13#10'*Ctrl + Delete exclui registro'
          Align = alClient
          Ctl3D = False
          DataSource = datm_profit_maritimo.ds_despesa_master
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColExit = dbgrid_despesa_houseColExit
          OnDblClick = dbgrid_despesa_houseDblClick
          OnKeyDown = dbgrid_despesa_houseKeyDown
          OnKeyUp = dbgrid_despesa_masterKeyUp
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CD_ITEM'
              Title.Caption = 'C'#243'd.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'calcItem'
              Title.Caption = 'Descri'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 108
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CD_MOEDA'
              Title.Caption = 'C'#243'd.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 29
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'calcMoeda'
              Title.Caption = 'Moeda'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 103
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Look_origem_desp'
              Title.Caption = 'Origem'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 78
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Look_resp_pagto'
              Title.Caption = 'Resp. Pagto'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 82
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Look_base_calc'
              Title.Caption = 'Tipo Base'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 75
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'VL_BASE_DESPESA'
              Title.Caption = 'Valor Base'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 74
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'VL_COMPRA_AG'
              Title.Caption = 'Valor Compra'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_CUSTO_EST'
              ReadOnly = True
              Title.Caption = 'Valor Convertido'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = False
            end>
        end
        object pnl_master_lcl: TPanel
          Left = 4
          Top = 151
          Width = 702
          Height = 79
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object dbgrid_master_lcl: TDBGrid
            Left = 0
            Top = 0
            Width = 702
            Height = 79
            Hint = '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Ctrl + Delete exclui registro'
            Align = alClient
            Ctl3D = False
            DataSource = datm_profit_maritimo.ds_master_carga
            Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'QTDE'
                Title.Caption = 'Qtde'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 57
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PESO_TON'
                Title.Caption = 'Peso Bruto (TON)'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 136
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PESO_VOLUMETRICO'
                Title.Caption = 'Cubagem (M3)'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 150
                Visible = True
              end>
          end
        end
      end
      object dbedt_nm_agente_conso: TDBEdit
        Left = 58
        Top = 58
        Width = 215
        Height = 14
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'NM_AGENTE'
        DataSource = datm_profit_maritimo.ds_master
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object dbedt_nm_armador: TDBEdit
        Left = 398
        Top = 58
        Width = 215
        Height = 14
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'NM_ARMADOR'
        DataSource = datm_profit_maritimo.ds_master
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object dbedt_nm_origem_conso: TDBEdit
        Left = 330
        Top = 25
        Width = 129
        Height = 13
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'NM_PORTO'
        DataSource = datm_profit_maritimo.ds_master
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedt_nm_destino_conso: TDBEdit
        Left = 541
        Top = 25
        Width = 133
        Height = 13
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'NM_PORTO_1'
        DataSource = datm_profit_maritimo.ds_master
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object dbedt_nm_descarga: TDBEdit
        Left = 460
        Top = 135
        Width = 235
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_DESCARGA'
        DataSource = datm_profit_maritimo.ds_master
        ReadOnly = True
        TabOrder = 22
      end
      object dbedt_nm_atracacao: TDBEdit
        Left = 169
        Top = 135
        Width = 213
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_ATRACACAO'
        DataSource = datm_profit_maritimo.ds_master
        ReadOnly = True
        TabOrder = 20
      end
      object dbedt_nm_veiculo: TDBEdit
        Left = 49
        Top = 97
        Width = 97
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_VEICULO'
        DataSource = datm_profit_maritimo.ds_master
        ReadOnly = True
        TabOrder = 11
      end
      object dbedt_nr_voo_conso: TDBEdit
        Left = 181
        Top = 97
        Width = 37
        Height = 21
        DataField = 'NR_VOO'
        DataSource = datm_profit_maritimo.ds_master
        TabOrder = 12
        OnChange = dbedt_nr_voo_consoChange
      end
      object dblookp_tp_frete_master: TDBLookupComboBox
        Left = 11
        Top = 135
        Width = 110
        Height = 21
        DataField = 'Look_nm_frete_master'
        DataSource = datm_profit_maritimo.ds_master
        ListField = 'CODIGO'
        TabOrder = 18
      end
      object dbedt_dt_saida_conso: TDBEdit
        Left = 456
        Top = 97
        Width = 83
        Height = 21
        DataField = 'DT_EMBARQUE'
        DataSource = datm_profit_maritimo.ds_master
        TabOrder = 15
        OnChange = dbedt_cd_agente_diretoChange
        OnExit = dbedt_dt_saida_consoExit
      end
      object dbedt_dt_cheg_conso: TDBEdit
        Left = 547
        Top = 97
        Width = 83
        Height = 21
        DataField = 'DT_PREV_CHEGADA'
        DataSource = datm_profit_maritimo.ds_master
        TabOrder = 16
        OnChange = dbedt_cd_agente_diretoChange
      end
      object dbedt_dt_chegada: TDBEdit
        Left = 638
        Top = 97
        Width = 83
        Height = 21
        DataField = 'DT_CHEGADA'
        DataSource = datm_profit_maritimo.ds_master
        TabOrder = 17
        OnChange = dbedt_cd_agente_diretoChange
        OnExit = dbedt_dt_chegadaExit
      end
      object dbedt_cd_descarga: TDBEdit
        Left = 420
        Top = 135
        Width = 41
        Height = 21
        DataField = 'CD_ARMAZEM_DESCARGA'
        DataSource = datm_profit_maritimo.ds_master
        TabOrder = 21
        OnChange = dbedt_cd_agente_diretoChange
        OnExit = dbedt_cd_descargaExit
        OnKeyDown = dbedt_cd_agente_diretoKeyDown
      end
      object dbedt_cd_origem_conso: TDBEdit
        Left = 290
        Top = 25
        Width = 39
        Height = 13
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'CD_ORIGEM'
        DataSource = datm_profit_maritimo.ds_master
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnChange = dbedt_cd_agente_diretoChange
        OnKeyDown = dbedt_cd_agente_diretoKeyDown
      end
      object dbedt_cd_agente_conso: TDBEdit
        Left = 18
        Top = 58
        Width = 37
        Height = 14
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'CD_AGENTE'
        DataSource = datm_profit_maritimo.ds_master
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        OnChange = dbedt_cd_agente_diretoChange
        OnKeyDown = dbedt_cd_agente_diretoKeyDown
      end
      object dbedt_cd_armador: TDBEdit
        Left = 358
        Top = 58
        Width = 36
        Height = 14
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'CD_ARMADOR'
        DataSource = datm_profit_maritimo.ds_master
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        OnChange = dbedt_cd_agente_diretoChange
        OnKeyDown = dbedt_cd_agente_diretoKeyDown
      end
      object dbedt_cd_destino_conso: TDBEdit
        Left = 503
        Top = 25
        Width = 37
        Height = 13
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'CD_DESTINO'
        DataSource = datm_profit_maritimo.ds_master
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnChange = dbedt_cd_agente_diretoChange
        OnKeyDown = dbedt_cd_agente_diretoKeyDown
      end
      object dbedt_cd_atracacao: TDBEdit
        Left = 131
        Top = 135
        Width = 39
        Height = 21
        DataField = 'CD_ARMAZEM_ATRACACAO'
        DataSource = datm_profit_maritimo.ds_master
        TabOrder = 19
        OnChange = dbedt_cd_agente_diretoChange
        OnExit = dbedt_cd_atracacaoExit
        OnKeyDown = dbedt_cd_agente_diretoKeyDown
      end
      object dbedt_cd_veiculo: TDBEdit
        Left = 11
        Top = 97
        Width = 39
        Height = 21
        DataField = 'CD_VEICULO'
        DataSource = datm_profit_maritimo.ds_master
        TabOrder = 10
        OnChange = dbedt_cd_agente_diretoChange
        OnExit = dbedt_cd_veiculoExit
        OnKeyDown = dbedt_cd_agente_diretoKeyDown
      end
      object dbedtDtMaster: TDBEdit
        Left = 365
        Top = 97
        Width = 83
        Height = 21
        DataField = 'DT_MASTER'
        DataSource = datm_profit_maritimo.ds_master
        TabOrder = 14
        OnChange = dbedt_cd_agente_diretoChange
        OnExit = dbedtDtMasterExit
      end
      object DBEdit13: TDBEdit
        Left = 18
        Top = 26
        Width = 129
        Height = 12
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'NR_MASTER'
        DataSource = datm_profit_maritimo.ds_master
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit55: TDBEdit
        Left = 157
        Top = 26
        Width = 123
        Height = 12
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'CD_MASTER'
        DataSource = datm_profit_maritimo.ds_master
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object edtViagemArmador: TEdit
        Left = 252
        Top = 97
        Width = 104
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 13
      end
    end
    object ts_houses: TTabSheet
      Caption = 'Houses'
      ImageIndex = 11
      object pgctrl_houses: TPageControl
        Left = 0
        Top = 0
        Width = 1008
        Height = 618
        ActivePage = ts_custo_brasil
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_housesChange
        OnChanging = pgctrl_aviso_chegChanging
        object ts_lista_houses: TTabSheet
          Caption = 'Lista'
          object DBGrid9: TDBGrid
            Left = 0
            Top = 53
            Width = 1000
            Height = 537
            Align = alClient
            DataSource = datm_profit_maritimo.ds_house
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NR_HOUSE'
                Title.Caption = 'House'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calc_processo'
                Title.Caption = 'Processo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 134
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_CLIENTE'
                Title.Caption = 'C'#243'd.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_EMPRESA'
                Title.Caption = 'Cliente'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 192
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_RECEBIMENTO'
                Title.Caption = 'Recebimento'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 91
                Visible = True
              end>
          end
          object Panel28: TPanel
            Left = 0
            Top = 0
            Width = 1000
            Height = 53
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label183: TLabel
              Left = 485
              Top = 8
              Width = 39
              Height = 13
              Caption = 'Master'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label27: TLabel
              Left = 11
              Top = 8
              Width = 117
              Height = 13
              Caption = 'Unidade de Neg'#243'cio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label77: TLabel
              Left = 251
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
            object DBEdit6: TDBEdit
              Left = 486
              Top = 22
              Width = 140
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NR_MASTER'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit24: TDBEdit
              Left = 275
              Top = 22
              Width = 199
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_PRODUTO'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit25: TDBEdit
              Left = 39
              Top = 22
              Width = 201
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_UNID_NEG'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit7: TDBEdit
              Left = 12
              Top = 22
              Width = 28
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_UNID_NEG'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit23: TDBEdit
              Left = 252
              Top = 22
              Width = 24
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_PRODUTO'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 2
            end
          end
          object pnl_incl_processo: TPanel
            Left = 214
            Top = 118
            Width = 293
            Height = 148
            BevelInner = bvLowered
            TabOrder = 2
            Visible = False
            object SpeedButton1: TSpeedButton
              Left = 122
              Top = 43
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
              OnClick = SpeedButton1Click
            end
            object Label97: TLabel
              Left = 22
              Top = 30
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
            object Label102: TLabel
              Left = 163
              Top = 30
              Width = 55
              Height = 13
              Caption = 'N'#186' House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel1: TBevel
              Left = 14
              Top = 98
              Width = 266
              Height = 2
            end
            object Button1: TButton
              Left = 157
              Top = 109
              Width = 61
              Height = 26
              Caption = 'Incluir'
              TabOrder = 2
              OnClick = Button1Click
            end
            object Button2: TButton
              Left = 219
              Top = 109
              Width = 61
              Height = 26
              Caption = 'Cancelar'
              TabOrder = 3
              OnClick = Button2Click
            end
            object msk_processo: TMaskEdit
              Left = 23
              Top = 44
              Width = 98
              Height = 21
              TabOrder = 0
              OnExit = msk_processoExit
            end
            object msk_nr_house: TMaskEdit
              Left = 164
              Top = 44
              Width = 104
              Height = 21
              TabOrder = 1
            end
          end
        end
        object ts_dados_basicos2: TTabSheet
          Caption = 'Dados B'#225'sicos'
          ImageIndex = 2
          object Panel13: TPanel
            Left = 0
            Top = 0
            Width = 1000
            Height = 590
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 0
            DesignSize = (
              1000
              590)
            object Label78: TLabel
              Left = 356
              Top = 102
              Width = 61
              Height = 13
              Caption = 'Comiss'#225'ria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_desp_conso: TSpeedButton
              Left = 684
              Top = 115
              Width = 25
              Height = 20
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
              OnClick = btn_co_desp_consoClick
            end
            object Label79: TLabel
              Left = 514
              Top = 13
              Width = 50
              Height = 13
              Caption = 'Incoterm'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label80: TLabel
              Left = 591
              Top = 13
              Width = 59
              Height = 13
              Caption = 'Tipo Frete'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label92: TLabel
              Left = 18
              Top = 58
              Width = 61
              Height = 13
              Caption = 'Importador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label93: TLabel
              Left = 356
              Top = 58
              Width = 62
              Height = 13
              Caption = 'Exportador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_exp_conso: TSpeedButton
              Left = 684
              Top = 71
              Width = 25
              Height = 20
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
              OnClick = btn_co_exp_consoClick
            end
            object Label73: TLabel
              Left = 380
              Top = 13
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
            object btn_co_instr_conso: TSpeedButton
              Left = 478
              Top = 26
              Width = 25
              Height = 20
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
              OnClick = btn_co_instr_consoClick
            end
            object Label189: TLabel
              Left = 17
              Top = 13
              Width = 37
              Height = 13
              Caption = 'House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label191: TLabel
              Left = 18
              Top = 102
              Width = 39
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_moeda_con: TSpeedButton
              Left = 321
              Top = 115
              Width = 25
              Height = 20
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
              OnClick = btn_co_moeda_conClick
            end
            object Label68: TLabel
              Left = 285
              Top = 13
              Width = 75
              Height = 13
              Caption = 'Recebimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label41: TLabel
              Left = 317
              Top = 145
              Width = 81
              Height = 13
              Caption = 'Prev.Chegada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label42: TLabel
              Left = 317
              Top = 188
              Width = 78
              Height = 13
              Caption = 'Cheg. Efetiva'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label51: TLabel
              Left = 18
              Top = 188
              Width = 127
              Height = 13
              Caption = 'Armaz'#233'm de Descarga'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label94: TLabel
              Left = 17
              Top = 145
              Width = 44
              Height = 13
              Caption = 'Destino'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label25: TLabel
              Left = 440
              Top = 141
              Width = 102
              Height = 13
              Caption = 'Ref.Cliente / Item'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Shape9: TShape
              Left = 441
              Top = 154
              Width = 268
              Height = 75
              Brush.Style = bsClear
              Pen.Color = clGray
            end
            object lbl19: TLabel
              Left = 147
              Top = 13
              Width = 86
              Height = 13
              Caption = 'Data do House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_nm_desp_conso: TDBEdit
              Left = 401
              Top = 115
              Width = 282
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_COMISSARIA'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 13
            end
            object dbedt_nm_cliente_conso: TDBEdit
              Left = 63
              Top = 71
              Width = 283
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_EMPRESA'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 7
            end
            object dbedt_nm_exp_conso: TDBEdit
              Left = 401
              Top = 71
              Width = 282
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_EMP_EST'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 9
            end
            object msk_proc_conso: TMaskEdit
              Left = 381
              Top = 26
              Width = 96
              Height = 21
              Color = clMenu
              ReadOnly = True
              TabOrder = 3
              OnChange = msk_proc_diretoChange
              OnEnter = msk_proc_diretoEnter
              OnExit = msk_proc_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_nm_moeda_con: TDBEdit
              Left = 60
              Top = 115
              Width = 260
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_MOEDA'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 11
            end
            object dbedt_nr_house_conso: TDBEdit
              Left = 18
              Top = 26
              Width = 119
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NR_HOUSE'
              DataSource = datm_profit_maritimo.ds_house
              ReadOnly = True
              TabOrder = 0
              OnChange = dbedt_instr_direto1Change
              OnExit = dbedt_nr_house_consoExit
            end
            object dbedt_cd_exp_conso: TDBEdit
              Left = 357
              Top = 71
              Width = 45
              Height = 21
              DataField = 'CD_EMP_EST'
              DataSource = datm_profit_maritimo.ds_processo
              TabOrder = 8
              OnChange = btn_co_exp_consoClick
              OnExit = dbedt_cd_exp_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_moeda_conso: TDBEdit
              Left = 18
              Top = 115
              Width = 43
              Height = 21
              Color = clMenu
              DataField = 'CD_MOEDA_FRETE'
              DataSource = datm_profit_maritimo.ds_processo
              TabOrder = 10
              OnChange = btn_co_moeda_conClick
              OnExit = dbedt_moeda_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_cd_desp_conso: TDBEdit
              Left = 357
              Top = 115
              Width = 45
              Height = 21
              DataField = 'CD_DESPACHANTE'
              DataSource = datm_profit_maritimo.ds_processo
              TabOrder = 12
              OnChange = btn_co_desp_consoClick
              OnExit = dbedt_cd_desp_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dblook_incoterm: TDBLookupComboBox
              Left = 514
              Top = 26
              Width = 69
              Height = 21
              DataField = 'Look_nm_incoterm'
              DataSource = datm_profit_maritimo.ds_processo
              ListField = 'CODIGO'
              TabOrder = 4
              OnClick = dblook_incotermClick
            end
            object dblook_tp_house_conso: TDBLookupComboBox
              Left = 592
              Top = 26
              Width = 117
              Height = 21
              Color = clMenu
              DataField = 'Look_nm_tp_frete'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 5
              OnClick = dbedt_cd_exp_diretoChange
            end
            object DBEdit47: TDBEdit
              Left = 286
              Top = 26
              Width = 85
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'DT_RECEBIMENTO'
              DataSource = datm_profit_maritimo.ds_house
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit14: TDBEdit
              Left = 318
              Top = 158
              Width = 113
              Height = 21
              Color = clMenu
              DataField = 'DT_PREV_CHEGADA'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 17
              OnChange = dbedt_cd_agente_diretoChange
            end
            object DBEdit15: TDBEdit
              Left = 318
              Top = 201
              Width = 113
              Height = 21
              Color = clMenu
              DataField = 'DT_CHEGADA'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 20
              OnChange = dbedt_cd_agente_diretoChange
              OnExit = dbedt_dt_chegadaExit
            end
            object DBEdit32: TDBEdit
              Left = 58
              Top = 201
              Width = 250
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_DESCARGA'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 19
            end
            object DBEdit38: TDBEdit
              Left = 54
              Top = 158
              Width = 254
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_PORTO_1'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 16
            end
            object DBEdit33: TDBEdit
              Left = 18
              Top = 158
              Width = 37
              Height = 21
              Color = clMenu
              DataField = 'CD_DESTINO'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 15
              OnChange = dbedt_cd_agente_diretoChange
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbedt_cd_cliente_conso: TDBEdit
              Left = 18
              Top = 71
              Width = 46
              Height = 21
              Color = clMenu
              DataField = 'CD_CLIENTE'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 6
            end
            object DBEdit27: TDBEdit
              Left = 18
              Top = 201
              Width = 41
              Height = 21
              Color = clMenu
              DataField = 'CD_ARMAZEM_DESCARGA'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 18
              OnChange = dbedt_cd_agente_diretoChange
              OnExit = dbedt_cd_descargaExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object pnl6: TPanel
              Left = 18
              Top = 240
              Width = 691
              Height = 273
              Anchors = [akLeft, akTop, akBottom]
              BevelInner = bvLowered
              BevelOuter = bvLowered
              BorderWidth = 5
              TabOrder = 21
              object pnl_lcl: TPanel
                Left = 7
                Top = 56
                Width = 677
                Height = 71
                Align = alTop
                TabOrder = 1
                object dbgrid_lcl: TDBGrid
                  Left = 1
                  Top = 1
                  Width = 675
                  Height = 69
                  Align = alClient
                  DataSource = datm_profit_maritimo.ds_processo_carga
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnColExit = dbgrid_lclColExit
                  OnDblClick = dbgrid_lclDblClick
                  OnKeyDown = dbgrid_lclKeyDown
                  Columns = <
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TP_EMBALAGEM'
                      Title.Caption = 'C'#243'd.'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Color = 16776176
                      Expanded = False
                      FieldName = 'calcEmbalagem'
                      Title.Caption = 'Tipo da Embalagem'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 129
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'QTDE'
                      Title.Caption = 'Qtde'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'PESO_TON'
                      Title.Caption = 'Peso Bruto (TON)'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 136
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'PESO_VOLUMETRICO'
                      Title.Caption = 'Cubagem (M3)'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 94
                      Visible = True
                    end>
                end
              end
              object Panel6: TPanel
                Left = 7
                Top = 7
                Width = 677
                Height = 49
                Align = alTop
                TabOrder = 0
                object lb_tarifa_conso: TLabel
                  Left = 382
                  Top = 6
                  Width = 34
                  Height = 13
                  Caption = 'Tarifa'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label36: TLabel
                  Left = 134
                  Top = 6
                  Width = 97
                  Height = 13
                  Caption = 'Peso Bruto (Ton)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label37: TLabel
                  Left = 507
                  Top = 6
                  Width = 63
                  Height = 13
                  Caption = 'Total Frete'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label38: TLabel
                  Left = 6
                  Top = 6
                  Width = 107
                  Height = 13
                  Caption = 'Tipo de Estufagem'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label112: TLabel
                  Left = 259
                  Top = 6
                  Width = 78
                  Height = 13
                  Caption = 'Cubagem(M3)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object dbedt_charg_conso: TDBEdit
                  Left = 135
                  Top = 19
                  Width = 103
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'VL_PESO_BRUTO'
                  DataSource = datm_profit_maritimo.ds_processo
                  ReadOnly = True
                  TabOrder = 1
                  OnChange = dbedt_cd_exp_diretoChange
                end
                object dbedt_tarifa_conso: TDBEdit
                  Left = 384
                  Top = 19
                  Width = 102
                  Height = 21
                  DataField = 'VL_TARIFA_FRETE'
                  DataSource = datm_profit_maritimo.ds_processo
                  TabOrder = 3
                  OnChange = dbedt_cd_exp_diretoChange
                end
                object dbedt_tt_frete_conso: TDBEdit
                  Left = 509
                  Top = 19
                  Width = 103
                  Height = 21
                  DataField = 'VL_FRETE'
                  DataSource = datm_profit_maritimo.ds_processo
                  TabOrder = 4
                  OnChange = dbedt_cd_exp_diretoChange
                end
                object rxcombo_tp_estufagem: TRxDBComboBox
                  Left = 8
                  Top = 19
                  Width = 105
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TP_ESTUFAGEM'
                  DataSource = datm_profit_maritimo.ds_processo
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'LCL'
                    'FCL'
                    'Break Bulk')
                  ReadOnly = True
                  TabOrder = 0
                  Values.Strings = (
                    '0'
                    '1'
                    '2')
                  OnChange = rxcombo_tp_estufagemChange
                end
                object DBEdit54: TDBEdit
                  Left = 260
                  Top = 19
                  Width = 103
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'CUBAGEM'
                  DataSource = datm_profit_maritimo.ds_processo
                  ReadOnly = True
                  TabOrder = 2
                  OnChange = dbedt_cd_exp_diretoChange
                end
              end
              object Panel15: TPanel
                Left = 7
                Top = 201
                Width = 677
                Height = 65
                Align = alBottom
                TabOrder = 3
                object Label21: TLabel
                  Left = 522
                  Top = 15
                  Width = 88
                  Height = 13
                  Caption = 'Total do House'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label22: TLabel
                  Left = 376
                  Top = 15
                  Width = 139
                  Height = 13
                  Caption = 'Total das Other Charges'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBEdit2: TDBEdit
                  Left = 377
                  Top = 28
                  Width = 137
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'VL_OTHER_CHARGE'
                  DataSource = datm_profit_maritimo.ds_processo
                  ReadOnly = True
                  TabOrder = 1
                end
                object DBEdit3: TDBEdit
                  Left = 524
                  Top = 28
                  Width = 137
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'VL_HOUSE'
                  DataSource = datm_profit_maritimo.ds_processo
                  ReadOnly = True
                  TabOrder = 2
                end
                object GroupBox7: TGroupBox
                  Left = 8
                  Top = 4
                  Width = 353
                  Height = 52
                  Caption = 'Mercadoria'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  object btn_co_merc_conso: TSpeedButton
                    Left = 153
                    Top = 20
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
                    OnClick = btn_co_merc_consoClick
                  end
                  object lbl2: TLabel
                    Left = 14
                    Top = 23
                    Width = 39
                    Height = 13
                    Caption = 'Moeda'
                  end
                  object lbl3: TLabel
                    Left = 190
                    Top = 23
                    Width = 30
                    Height = 13
                    Caption = 'Valor'
                  end
                  object dbedt_vl_merc_conso: TDBEdit
                    Left = 224
                    Top = 20
                    Width = 113
                    Height = 21
                    DataField = 'VL_MERCADORIA'
                    DataSource = datm_profit_maritimo.ds_processo
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 2
                    OnChange = dbedt_cd_exp_diretoChange
                  end
                  object dbedt_nm_moeda_mle_conso: TDBEdit
                    Left = 91
                    Top = 20
                    Width = 61
                    Height = 21
                    TabStop = False
                    Color = clMenu
                    DataField = 'AP_MOEDA_MLE'
                    DataSource = datm_profit_maritimo.ds_processo
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 1
                  end
                  object dbedt_cd_moeda_mle_conso: TDBEdit
                    Left = 58
                    Top = 20
                    Width = 34
                    Height = 21
                    DataField = 'CD_MOEDA_MLE'
                    DataSource = datm_profit_maritimo.ds_processo
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnChange = dbedt_cd_exp_diretoChange
                    OnExit = dbedt_cd_moeda_mle_consoExit
                    OnKeyDown = dbedt_cd_agente_diretoKeyDown
                  end
                end
              end
              object pnl_fcl: TPanel
                Left = 7
                Top = 127
                Width = 677
                Height = 74
                Align = alClient
                TabOrder = 2
                object dbgrid_container: TDBGrid
                  Left = 1
                  Top = 1
                  Width = 675
                  Height = 72
                  Hint = 
                    '*Campos me amarelo s'#227'o edit'#225'veis'#13#10'*Campo em azul chama consulta ' +
                    'On-line'#13#10'*Ctrl + Delete exclui registro'
                  Align = alClient
                  DataSource = datm_profit_maritimo.ds_proc_cntr
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnColExit = dbgrid_containerColExit
                  OnDblClick = dbgrid_containerDblClick
                  OnKeyDown = dbgrid_containerKeyDown
                  Columns = <
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'NR_CNTR'
                      Title.Caption = 'Nr Contanier'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 111
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TP_CNTR'
                      Title.Caption = 'C'#243'd.'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 33
                      Visible = True
                    end
                    item
                      Color = 16773087
                      Expanded = False
                      FieldName = 'calcNomeCNTR'
                      Title.Caption = 'Contanier'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 123
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'VL_PESO_TON'
                      Title.Caption = 'Peso Bruto (Ton)'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 104
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'VL_CUBAGEM'
                      Title.Caption = 'Cubagem(M3)'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 91
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'VL_VENDA'
                      Title.Caption = 'Venda'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'NR_LACRE'
                      Title.Caption = 'Lacre'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 76
                      Visible = True
                    end>
                end
              end
            end
            object dbedtDtConhec: TDBEdit
              Left = 148
              Top = 26
              Width = 128
              Height = 21
              DataField = 'DT_CONHECIMENTO'
              DataSource = datm_profit_maritimo.ds_processo
              TabOrder = 1
              OnChange = btn_co_exp_consoClick
              OnExit = dbedt_cd_exp_consoExit
              OnKeyDown = dbedt_cd_agente_diretoKeyDown
            end
            object dbgrdRefCli: TDBGrid
              Left = 443
              Top = 156
              Width = 264
              Height = 70
              Ctl3D = False
              DataSource = datm_profit_maritimo.dsRefCli
              Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 14
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CD_REFERENCIA'
                  Width = 175
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NR_ITEM_PO'
                  Width = 50
                  Visible = True
                end>
            end
          end
        end
        object ts_custo_brasil: TTabSheet
          BorderWidth = 2
          Caption = 'Valores do House'
          ImageIndex = 5
          object shp7: TShape
            Left = 0
            Top = 161
            Width = 996
            Height = 20
            Align = alTop
            Brush.Color = clSilver
            Pen.Color = clGray
          end
          object Label19: TLabel
            Left = 5
            Top = 165
            Width = 257
            Height = 13
            Caption = 'Valor Brasil / Outras Despesas / Reembolsos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object shp9: TShape
            Left = 0
            Top = 181
            Width = 996
            Height = 1
            Align = alTop
            Brush.Style = bsClear
            Pen.Style = psClear
          end
          object shp11: TShape
            Left = 0
            Top = 182
            Width = 996
            Height = 1
            Align = alTop
            Brush.Style = bsClear
            Pen.Style = psClear
          end
          object shp12: TShape
            Left = 0
            Top = 183
            Width = 996
            Height = -1
            Align = alTop
            Brush.Style = bsClear
            Pen.Style = psClear
          end
          object Shape10: TShape
            Left = 0
            Top = 0
            Width = 996
            Height = 20
            Align = alTop
            Brush.Color = clSilver
            Pen.Color = clGray
          end
          object Label134: TLabel
            Left = 5
            Top = 4
            Width = 199
            Height = 13
            Caption = 'Verifica'#231#227'o e Composi'#231#227'o do Frete'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object dbgrid_vl_brasil: TDBGrid
            Left = 0
            Top = 182
            Width = 996
            Height = 404
            Hint = 
              '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em azul abrem consulta' +
              ' OnLine'#13#10'*Ctrl + Delete exclui registro'
            Align = alClient
            Ctl3D = False
            DataSource = datm_profit_maritimo.ds_vl_brasil
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnColExit = dbgrid_vl_brasilColExit
            OnDblClick = dbgrid_vl_brasilDblClick
            OnKeyDown = dbgrid_vl_brasilKeyDown
            OnKeyUp = dbgrid_vl_brasilKeyUp
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CD_ITEM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'C'#243'd.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 24
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'calcItem'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Descri'#231#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 126
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CD_MOEDA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'C'#243'd'
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'calcMoedaCompra'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Moeda de Compra'
                Width = 104
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VL_COMPRA_AG'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Compra'
                Width = 58
                Visible = True
              end
              item
                Color = clSilver
                Expanded = False
                FieldName = 'VL_CUSTO_EST'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Convertido'
                Width = 55
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'Look_ReceitaAgente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Devolver'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CD_MOEDA_VENDA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'C'#243'd'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'calcMoeda'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Moeda de Venda'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 107
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'Look_tp_base'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Tipo Base'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 93
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VL_BASE_CLI'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Valor Base'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 58
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VL_VENDA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Venda'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 58
                Visible = True
              end
              item
                Color = clSilver
                Expanded = False
                FieldName = 'VL_VENDA_EST'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Convertido'
                Width = 55
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'Look_in_profit'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Profit'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'Look_nm_repassa'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Cobrar do '
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'in_notificacao'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Title.Caption = 'Notif'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 27
                Visible = True
              end>
          end
          object pnl7: TPanel
            Left = 0
            Top = 20
            Width = 996
            Height = 141
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              996
              141)
            object Shape12: TShape
              Left = 13
              Top = 60
              Width = 969
              Height = 63
              Anchors = [akLeft, akTop, akRight]
              Brush.Style = bsClear
              Pen.Color = clGray
            end
            object Shape11: TShape
              Left = 13
              Top = 18
              Width = 129
              Height = 29
              Brush.Style = bsClear
              Pen.Color = clGray
            end
            object shp10: TShape
              Left = 151
              Top = 18
              Width = 129
              Height = 29
              Brush.Style = bsClear
              Pen.Color = clGray
            end
            object Label136: TLabel
              Left = 28
              Top = 72
              Width = 87
              Height = 13
              Caption = 'Moeda da Compra'
            end
            object Label137: TLabel
              Left = 164
              Top = 72
              Width = 78
              Height = 13
              Caption = 'Valor de Compra'
            end
            object Label140: TLabel
              Left = 252
              Top = 72
              Width = 73
              Height = 13
              Caption = 'Valor de Venda'
            end
            object Label144: TLabel
              Left = 18
              Top = 10
              Width = 116
              Height = 13
              Caption = 'Tipo de Frete do Master '
              Transparent = False
            end
            object Label145: TLabel
              Left = 156
              Top = 10
              Width = 115
              Height = 13
              Caption = 'Tipo de Frete do House '
              Transparent = False
            end
            object lblTipoFreteM: TLabel
              Left = 21
              Top = 29
              Width = 113
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '< tipo do frete >'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblTipoFreteH: TLabel
              Left = 159
              Top = 29
              Width = 113
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '< tipo do frete >'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Edit3: TDBEdit
              Left = 28
              Top = 86
              Width = 134
              Height = 21
              AutoSize = False
              BevelInner = bvLowered
              BevelOuter = bvNone
              BevelKind = bkSoft
              Color = clBtnFace
              Ctl3D = False
              DataField = 'calcMoedaCompra'
              DataSource = datm_profit_maritimo.dsFrete
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 1
            end
            object Edit4: TDBEdit
              Left = 164
              Top = 86
              Width = 86
              Height = 21
              AutoSize = False
              BevelInner = bvLowered
              BevelOuter = bvNone
              BevelKind = bkSoft
              Color = clBtnFace
              Ctl3D = False
              DataField = 'VL_COMPRA_AG'
              DataSource = datm_profit_maritimo.dsFrete
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 2
            end
            object Edit6: TDBEdit
              Left = 252
              Top = 86
              Width = 86
              Height = 21
              AutoSize = False
              BevelInner = bvLowered
              BevelOuter = bvNone
              BevelKind = bkSoft
              Color = clBtnFace
              Ctl3D = False
              DataField = 'VL_VENDA'
              DataSource = datm_profit_maritimo.dsFrete
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 3
            end
            object nbTipoFrete: TNotebook
              Left = 292
              Top = 8
              Width = 690
              Height = 44
              Anchors = [akLeft, akTop, akRight]
              PageIndex = 1
              TabOrder = 0
              object TPage
                Left = 0
                Top = 0
                Caption = 'MPHP'
                object Shape14: TShape
                  Left = 0
                  Top = 0
                  Width = 690
                  Height = 44
                  Align = alClient
                  Brush.Style = bsClear
                  Pen.Color = clGray
                end
                object Label157: TLabel
                  Left = 9
                  Top = 8
                  Width = 217
                  Height = 13
                  Caption = 'Master : PrePaid   /   House : PrePaid'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label161: TLabel
                  Left = 9
                  Top = 24
                  Width = 435
                  Height = 13
                  Caption = 
                    'Neste caso, o frete n'#227'o ser'#225' cobrado do cliente e nem devolvido ' +
                    'ao agente.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = 'MPHC'
                object Shape15: TShape
                  Left = 0
                  Top = 0
                  Width = 690
                  Height = 44
                  Align = alClient
                  Brush.Style = bsClear
                  Pen.Color = clGray
                end
                object Label150: TLabel
                  Left = 9
                  Top = 24
                  Width = 527
                  Height = 13
                  Caption = 
                    'O frete ser'#225' cobrado do cliente, pago ao agente e n'#227'o ir'#225' para o' +
                    's pagamentos operacionais.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label151: TLabel
                  Left = 9
                  Top = 8
                  Width = 212
                  Height = 13
                  Caption = 'Master : PrePaid   /   House : Collect'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = 'MCHP'
                object Shape16: TShape
                  Left = 0
                  Top = 0
                  Width = 690
                  Height = 44
                  Align = alClient
                  Brush.Style = bsClear
                  Pen.Color = clGray
                end
                object Label162: TLabel
                  Left = 9
                  Top = 8
                  Width = 212
                  Height = 13
                  Caption = 'Master : Collect   /   House : PrePaid'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label163: TLabel
                  Left = 9
                  Top = 24
                  Width = 453
                  Height = 13
                  Caption = 
                    'N'#227'o cobraremos o cliente, mas cobraremos do agente e pagaremos a' +
                    'o armador.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
              object TPage
                Left = 0
                Top = 0
                Caption = 'MCHC'
                object Shape13: TShape
                  Left = 0
                  Top = 0
                  Width = 690
                  Height = 44
                  Align = alClient
                  Brush.Style = bsClear
                  Pen.Color = clGray
                end
                object Label152: TLabel
                  Left = 9
                  Top = 8
                  Width = 207
                  Height = 13
                  Caption = 'Master : Collect   /   House : Collect'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label156: TLabel
                  Left = 9
                  Top = 24
                  Width = 516
                  Height = 13
                  Caption = 
                    'O frete ser'#225' cobrado do cliente, pago ao armador e a parte do pr' +
                    'ofit do agente paga a ele.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
            end
          end
        end
        object ts_calc_profit: TTabSheet
          Caption = 'C'#225'lculo Profit'
          ImageIndex = 7
          object Shape18: TShape
            Left = 8
            Top = 248
            Width = 780
            Height = 185
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Shape20: TShape
            Left = 16
            Top = 337
            Width = 293
            Height = 16
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Shape19: TShape
            Left = 16
            Top = 255
            Width = 764
            Height = 16
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object shp6: TShape
            Left = 8
            Top = 85
            Width = 780
            Height = 140
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Shape1: TShape
            Left = 636
            Top = 97
            Width = 147
            Height = 123
          end
          object lbl18: TLabel
            Left = 212
            Top = 145
            Width = 13
            Height = 24
            Caption = '='
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label18: TLabel
            Left = 425
            Top = 145
            Width = 13
            Height = 24
            Caption = '+'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label39: TLabel
            Left = 619
            Top = 145
            Width = 13
            Height = 24
            Caption = '='
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Shape3: TShape
            Left = 8
            Top = 66
            Width = 780
            Height = 18
            Brush.Color = 16772573
          end
          object Label46: TLabel
            Left = 12
            Top = 69
            Width = 94
            Height = 13
            Caption = 'Valores do Frete'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Shape17: TShape
            Left = 8
            Top = 229
            Width = 780
            Height = 18
            Brush.Color = 16772573
          end
          object Label135: TLabel
            Left = 12
            Top = 232
            Width = 142
            Height = 13
            Caption = 'Outros Valores do House'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label23: TLabel
            Left = 19
            Top = 257
            Width = 84
            Height = 13
            Caption = 'Valor no rateio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label143: TLabel
            Left = 19
            Top = 339
            Width = 123
            Height = 13
            Caption = 'Valores fora do rateio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Shape21: TShape
            Left = 316
            Top = 342
            Width = 471
            Height = 91
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Panel24: TPanel
            Left = 16
            Top = 354
            Width = 293
            Height = 70
            BevelOuter = bvNone
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 15
            object Label167: TLabel
              Left = 17
              Top = 17
              Width = 80
              Height = 13
              Caption = 'Receita Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label173: TLabel
              Left = 151
              Top = 17
              Width = 85
              Height = 13
              Caption = 'Despesa Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label117: TLabel
              Left = 114
              Top = 17
              Width = 10
              Height = 13
              Caption = 'D'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label120: TLabel
              Left = 249
              Top = 17
              Width = 9
              Height = 13
              Caption = 'E'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Shape23: TShape
              Left = 0
              Top = 0
              Width = 293
              Height = 70
              Brush.Style = bsClear
              Pen.Color = clGray
            end
            object dbedt_profit_extra: TDBEdit
              Left = 18
              Top = 31
              Width = 119
              Height = 19
              TabStop = False
              Color = clMenu
              Ctl3D = False
              DataField = 'VL_VENDA_BRASIL'
              DataSource = datm_profit_maritimo.ds_processo
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 0
              OnChange = dbedt_profit_extraChange
            end
            object dbedt_profit_liquido: TDBEdit
              Left = 152
              Top = 31
              Width = 119
              Height = 19
              TabStop = False
              Color = clMenu
              Ctl3D = False
              DataField = 'VL_DESP_BRASIL'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              OnChange = dbedt_profit_extraChange
            end
          end
          object Panel27: TPanel
            Left = 0
            Top = 0
            Width = 1000
            Height = 54
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label148: TLabel
              Left = 12
              Top = 8
              Width = 37
              Height = 13
              Caption = 'House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label108: TLabel
              Left = 148
              Top = 8
              Width = 39
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit17: TDBEdit
              Left = 13
              Top = 22
              Width = 121
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NR_HOUSE'
              DataSource = datm_profit_maritimo.ds_house
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit31: TDBEdit
              Left = 149
              Top = 22
              Width = 90
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'AP_MOEDA'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object GroupBox6: TGroupBox
            Left = 13
            Top = 104
            Width = 98
            Height = 116
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 8
            object Label158: TLabel
              Left = 6
              Top = 77
              Width = 66
              Height = 13
              Caption = 'Total Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label159: TLabel
              Left = 7
              Top = 43
              Width = 76
              Height = 13
              Caption = 'Other Charge'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label160: TLabel
              Left = 6
              Top = 9
              Width = 66
              Height = 13
              Caption = 'Frete Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_tt_house_custo: TDBEdit
              Left = 7
              Top = 90
              Width = 84
              Height = 19
              TabStop = False
              Color = clWhite
              DataField = 'VL_TT_CUSTO'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_frete_custo: TDBEdit
              Left = 7
              Top = 22
              Width = 84
              Height = 19
              TabStop = False
              Color = clMenu
              DataField = 'VL_RATEIO'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object dbedt_other_charge_custo: TDBEdit
              Left = 7
              Top = 56
              Width = 84
              Height = 19
              TabStop = False
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE_CUSTO'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object GroupBox5: TGroupBox
            Left = 112
            Top = 104
            Width = 99
            Height = 116
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 9
            object Label153: TLabel
              Left = 7
              Top = 77
              Width = 70
              Height = 13
              Caption = 'Total Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label154: TLabel
              Left = 7
              Top = 43
              Width = 76
              Height = 13
              Caption = 'Other Charge'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label155: TLabel
              Left = 7
              Top = 9
              Width = 70
              Height = 13
              Caption = 'Frete Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_tt_house_calc_prof: TDBEdit
              Left = 8
              Top = 90
              Width = 84
              Height = 19
              TabStop = False
              Color = clWhite
              DataField = 'VL_TT_VENDA'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_frete_venda: TDBEdit
              Left = 8
              Top = 22
              Width = 84
              Height = 19
              TabStop = False
              Color = clMenu
              DataField = 'VL_FRETE'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object dbedt_other_charge: TDBEdit
              Left = 8
              Top = 56
              Width = 84
              Height = 19
              TabStop = False
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object Panel4: TPanel
            Left = 440
            Top = 97
            Width = 177
            Height = 54
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 6
            object Label166: TLabel
              Left = 89
              Top = 14
              Width = 50
              Height = 13
              Caption = 'Despesa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label29: TLabel
              Left = 4
              Top = 14
              Width = 45
              Height = 13
              Caption = 'Receita'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl10: TLabel
              Left = 55
              Top = 14
              Width = 16
              Height = 13
              Caption = 'A1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl11: TLabel
              Left = 145
              Top = 14
              Width = 16
              Height = 13
              Caption = 'A2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_profit_total: TDBEdit
              Left = 90
              Top = 27
              Width = 79
              Height = 19
              TabStop = False
              Color = clMenu
              DataField = 'VL_DESP_MASTER'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit19: TDBEdit
              Left = 5
              Top = 27
              Width = 79
              Height = 19
              TabStop = False
              Color = clMenu
              DataField = 'VL_REC_BR'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
          end
          object Panel31: TPanel
            Left = 227
            Top = 107
            Width = 196
            Height = 113
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 10
            object Label168: TLabel
              Left = 9
              Top = 18
              Width = 64
              Height = 13
              Caption = 'Profit Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label170: TLabel
              Left = 8
              Top = 70
              Width = 66
              Height = 13
              Caption = 'Profit Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label169: TLabel
              Left = 102
              Top = 70
              Width = 75
              Height = 13
              Caption = 'Profit Agente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl8: TLabel
              Left = 77
              Top = 70
              Width = 9
              Height = 13
              Caption = 'A'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl9: TLabel
              Left = 180
              Top = 70
              Width = 9
              Height = 13
              Caption = 'B'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_profit_house: TDBEdit
              Left = 9
              Top = 33
              Width = 64
              Height = 19
              TabStop = False
              Color = clMenu
              DataField = 'VL_PROFIT_HOUSE'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_profit_brasil: TDBEdit
              Left = 8
              Top = 84
              Width = 84
              Height = 19
              TabStop = False
              Color = clWhite
              DataField = 'VL_PROFIT_BRASIL'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_profit_agente: TDBEdit
              Left = 102
              Top = 84
              Width = 84
              Height = 19
              TabStop = False
              Color = clWhite
              DataField = 'VL_PROFIT_AGENTE'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 3
            end
            object pnl4: TPanel
              Left = 81
              Top = 12
              Width = 103
              Height = 44
              BevelOuter = bvNone
              BorderStyle = bsSingle
              Color = clSilver
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
              object lbl_divisao: TLabel
                Left = 9
                Top = 6
                Width = 92
                Height = 13
                Caption = 'Percent Brasil : '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbedt_perc_brasil: TDBEdit
                Left = 24
                Top = 22
                Width = 41
                Height = 16
                TabStop = False
                BorderStyle = bsNone
                DataField = 'VL_DIVISAO'
                DataSource = datm_profit_maritimo.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = True
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
          end
          object pnl2: TPanel
            Left = 112
            Top = 90
            Width = 99
            Height = 20
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 2
            object lbl4: TLabel
              Left = 5
              Top = 3
              Width = 37
              Height = 13
              Caption = 'Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
          end
          object pnl3: TPanel
            Left = 13
            Top = 90
            Width = 98
            Height = 20
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 1
            object lbl5: TLabel
              Left = 4
              Top = 3
              Width = 33
              Height = 13
              Caption = 'Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
          end
          object Panel17: TPanel
            Left = 440
            Top = 166
            Width = 177
            Height = 54
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 12
            object Label118: TLabel
              Left = 89
              Top = 14
              Width = 50
              Height = 13
              Caption = 'Despesa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label119: TLabel
              Left = 4
              Top = 14
              Width = 45
              Height = 13
              Caption = 'Receita'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label26: TLabel
              Left = 144
              Top = 14
              Width = 16
              Height = 13
              Caption = 'B2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label28: TLabel
              Left = 54
              Top = 14
              Width = 16
              Height = 13
              Caption = 'B1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit58: TDBEdit
              Left = 90
              Top = 27
              Width = 79
              Height = 19
              TabStop = False
              Color = clMenu
              DataField = 'VL_DESP_AG'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit59: TDBEdit
              Left = 5
              Top = 27
              Width = 79
              Height = 19
              TabStop = False
              Color = clMenu
              DataField = 'VL_REC_AG'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object pnl5: TPanel
            Left = 227
            Top = 90
            Width = 196
            Height = 20
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 3
            object lbl6: TLabel
              Left = 3
              Top = 2
              Width = 95
              Height = 13
              Caption = 'C'#225'lculo do Profit'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object rxdbcombo_tp_divisao: TRxDBComboBox
              Left = 104
              Top = -1
              Width = 92
              Height = 21
              Style = csDropDownList
              DataField = 'TP_DIVISAO'
              DataSource = datm_profit_maritimo.ds_processo
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Valor Fixo'
                'Porcetagem')
              TabOrder = 0
              Values.Strings = (
                '0'
                '1')
              OnChange = rxdbcombo_tp_divisaoChange
            end
          end
          object Panel5: TPanel
            Left = 642
            Top = 103
            Width = 135
            Height = 111
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Color = 16776176
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 7
            object Label35: TLabel
              Left = 12
              Top = 17
              Width = 32
              Height = 13
              Caption = 'Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label72: TLabel
              Left = 12
              Top = 64
              Width = 41
              Height = 13
              Caption = 'Agente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl12: TLabel
              Left = 48
              Top = 16
              Width = 58
              Height = 13
              Caption = 'A+(A1-A2)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl13: TLabel
              Left = 57
              Top = 63
              Width = 58
              Height = 13
              Caption = 'B+(B1-B2)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label133: TLabel
              Left = 114
              Top = 16
              Width = 9
              Height = 13
              Caption = 'C'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit26: TDBEdit
              Left = 12
              Top = 30
              Width = 110
              Height = 19
              TabStop = False
              Color = clWhite
              DataField = 'VL_TT_PROF_BR'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit28: TDBEdit
              Left = 12
              Top = 77
              Width = 110
              Height = 19
              TabStop = False
              Color = clWhite
              DataField = 'VL_TT_PROF_AG'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object Panel18: TPanel
            Left = 639
            Top = 90
            Width = 87
            Height = 18
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Color = clGray
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 5
            object Label124: TLabel
              Left = 3
              Top = 1
              Width = 64
              Height = 13
              Caption = 'Profit Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
          end
          object Panel20: TPanel
            Left = 443
            Top = 90
            Width = 93
            Height = 18
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 4
            object Label129: TLabel
              Left = 3
              Top = 1
              Width = 71
              Height = 13
              Caption = 'Extras Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
          end
          object Panel21: TPanel
            Left = 443
            Top = 159
            Width = 100
            Height = 18
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 11
            object Label130: TLabel
              Left = 3
              Top = 1
              Width = 80
              Height = 13
              Caption = 'Extras Agente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
          end
          object dbgrid_despesa_house: TDBGrid
            Left = 16
            Top = 272
            Width = 764
            Height = 63
            Hint = 
              '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em azul abrem consulta' +
              ' OnLine'#13#10'*Ctrl + Delete exclui registro'
            Color = clWhite
            Ctl3D = False
            DataSource = datm_profit_maritimo.ds_despesa_house
            Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 13
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnColExit = dbgrid_despesa_houseColExit
            OnDblClick = dbgrid_despesa_houseDblClick
            OnKeyDown = dbgrid_despesa_houseKeyDown
            OnKeyUp = dbgrid_despesa_houseKeyUp
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_ITEM'
                Title.Caption = 'C'#243'd'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 24
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calcItem'
                Title.Caption = 'Descri'#231#227'o'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 238
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_MOEDA'
                Title.Caption = 'Cod.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calcMoeda'
                Title.Caption = 'Moeda de Custo'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 194
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'look_nm_tp_base'
                Title.Caption = 'Tipo Base'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 104
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_BASE_AG'
                Title.Caption = 'Valor Base'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 82
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_COMPRA_AG'
                Title.Caption = 'Compra'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 72
                Visible = True
              end>
          end
          object Panel3: TPanel
            Left = 317
            Top = 343
            Width = 477
            Height = 109
            BevelOuter = bvNone
            TabOrder = 14
            object Shape22: TShape
              Left = 7
              Top = 27
              Width = 464
              Height = 63
              Brush.Color = clInfoBk
            end
            object Shape8: TShape
              Left = 12
              Top = 33
              Width = 241
              Height = 51
            end
            object Shape7: TShape
              Left = 22
              Top = 56
              Width = 101
              Height = 19
            end
            object Shape6: TShape
              Left = 7
              Top = 8
              Width = 464
              Height = 18
              Brush.Color = 16772573
            end
            object Label48: TLabel
              Left = 10
              Top = 11
              Width = 209
              Height = 13
              Caption = 'Lucro Indai'#225' / Resultado Final Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label82: TLabel
              Left = 272
              Top = 48
              Width = 13
              Height = 24
              Caption = '='
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -19
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label74: TLabel
              Left = 144
              Top = 42
              Width = 66
              Height = 13
              Caption = 'Profit Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label76: TLabel
              Left = 22
              Top = 42
              Width = 101
              Height = 13
              Caption = 'Valores do House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label131: TLabel
              Left = 25
              Top = 58
              Width = 97
              Height = 13
              AutoSize = False
              Caption = '0,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label146: TLabel
              Left = 128
              Top = 53
              Width = 13
              Height = 24
              Caption = '+'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -19
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Panel10: TPanel
              Left = 299
              Top = 38
              Width = 165
              Height = 45
              BevelOuter = bvNone
              BorderStyle = bsSingle
              Color = clWhite
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
              object DBEdit29: TDBEdit
                Left = 8
                Top = 17
                Width = 147
                Height = 19
                TabStop = False
                Color = clWhite
                DataField = 'VL_PROFIT_LIQUIDO'
                DataSource = datm_profit_maritimo.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
            object DBEdit8: TDBEdit
              Left = 145
              Top = 56
              Width = 97
              Height = 19
              TabStop = False
              AutoSize = False
              Color = clWhite
              Ctl3D = False
              DataField = 'VL_TT_PROF_BR'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object Panel8: TPanel
              Left = 302
              Top = 34
              Width = 153
              Height = 17
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
              object shp8: TShape
                Left = 0
                Top = 0
                Width = 153
                Height = 17
                Align = alClient
                Brush.Color = 16772573
              end
              object Label50: TLabel
                Left = 3
                Top = 2
                Width = 76
                Height = 13
                Caption = 'Profit Liquido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object lbl14: TLabel
                Left = 81
                Top = 2
                Width = 69
                Height = 13
                Caption = 'C + ( D - E )'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
            end
          end
        end
      end
    end
    object ts_direto: TTabSheet
      Caption = 'Direto'
      ImageIndex = 4
      object pgctrl_house_direto: TPageControl
        Left = 0
        Top = 0
        Width = 1008
        Height = 618
        ActivePage = ts_direto_dados_basicos
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_housesChange
        OnChanging = pgctrl_aviso_chegChanging
        object ts_direto_dados_basicos: TTabSheet
          Caption = 'Dados B'#225'sicos'
          object Label69: TLabel
            Left = 357
            Top = 69
            Width = 47
            Height = 13
            Caption = 'Armador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label75: TLabel
            Left = 357
            Top = 112
            Width = 44
            Height = 13
            Caption = 'Destino'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label81: TLabel
            Left = 15
            Top = 111
            Width = 40
            Height = 13
            Caption = 'Origem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label83: TLabel
            Left = 357
            Top = 207
            Width = 131
            Height = 13
            Caption = 'Armaz'#233'm de Atraca'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_atra_direto: TSpeedButton
            Left = 668
            Top = 220
            Width = 25
            Height = 20
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
            OnClick = btn_co_atracacaoClick
          end
          object Label84: TLabel
            Left = 15
            Top = 254
            Width = 127
            Height = 13
            Caption = 'Armaz'#233'm de Descarga'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label85: TLabel
            Left = 357
            Top = 256
            Width = 34
            Height = 13
            Caption = 'Navio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_veic_direto: TSpeedButton
            Left = 668
            Top = 271
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
            OnClick = btn_co_veiculoClick
          end
          object Label86: TLabel
            Left = 171
            Top = 303
            Width = 59
            Height = 13
            Caption = 'Nr Viagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label88: TLabel
            Left = 541
            Top = 303
            Width = 35
            Height = 13
            Caption = 'Sa'#237'da'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label89: TLabel
            Left = 357
            Top = 343
            Width = 85
            Height = 13
            Caption = 'Prev. Chegada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label90: TLabel
            Left = 541
            Top = 343
            Width = 95
            Height = 13
            Caption = 'Chegada Efetiva'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 15
            Top = 159
            Width = 62
            Height = 13
            Caption = 'Exportador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label32: TLabel
            Left = 357
            Top = 159
            Width = 61
            Height = 13
            Caption = 'Comiss'#225'ria'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label33: TLabel
            Left = 15
            Top = 303
            Width = 50
            Height = 13
            Caption = 'Incoterm'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label34: TLabel
            Left = 87
            Top = 303
            Width = 59
            Height = 13
            Caption = 'Tipo Frete'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_exp_direto: TSpeedButton
            Left = 316
            Top = 173
            Width = 25
            Height = 20
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
            OnClick = btn_co_exp_consoClick
          end
          object btn_co_desp_direto: TSpeedButton
            Left = 668
            Top = 174
            Width = 25
            Height = 20
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
            OnClick = btn_co_desp_consoClick
          end
          object btn_co_desc_direto: TSpeedButton
            Left = 316
            Top = 269
            Width = 25
            Height = 20
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
            OnClick = btn_co_descargaClick
          end
          object Label7: TLabel
            Left = 15
            Top = 67
            Width = 61
            Height = 13
            Caption = 'Importador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label87: TLabel
            Left = 167
            Top = 348
            Width = 75
            Height = 13
            Caption = 'Recebimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label70: TLabel
            Left = 15
            Top = 348
            Width = 64
            Height = 13
            Caption = 'Ref.Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl15: TLabel
            Left = 357
            Top = 303
            Width = 88
            Height = 13
            Caption = 'Data do Master'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 1000
            Height = 55
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label65: TLabel
              Left = 10
              Top = 9
              Width = 39
              Height = 13
              Caption = 'Master'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label66: TLabel
              Left = 125
              Top = 9
              Width = 99
              Height = 13
              Caption = 'Unidade Neg'#243'cio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label67: TLabel
              Left = 355
              Top = 9
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
            object Label3: TLabel
              Left = 590
              Top = 9
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
            object DBEdit40: TDBEdit
              Left = 11
              Top = 23
              Width = 104
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NR_MASTER'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit41: TDBEdit
              Left = 126
              Top = 23
              Width = 25
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_UNID_NEG'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit42: TDBEdit
              Left = 151
              Top = 23
              Width = 193
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_UNID_NEG'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit43: TDBEdit
              Left = 382
              Top = 23
              Width = 199
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_PRODUTO'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 5
            end
            object DBEdit44: TDBEdit
              Left = 356
              Top = 23
              Width = 26
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_PRODUTO'
              DataSource = datm_profit_maritimo.ds_master
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit1: TDBEdit
              Left = 591
              Top = 22
              Width = 107
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'calc_processo'
              DataSource = datm_profit_maritimo.ds_house
              ReadOnly = True
              TabOrder = 0
            end
          end
          object DBEdit48: TDBEdit
            Left = 398
            Top = 83
            Width = 295
            Height = 21
            Color = clMenu
            DataField = 'NM_ARMADOR'
            DataSource = datm_profit_maritimo.ds_master
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit50: TDBEdit
            Left = 391
            Top = 125
            Width = 302
            Height = 21
            Color = clMenu
            DataField = 'NM_PORTO_1'
            DataSource = datm_profit_maritimo.ds_master
            ReadOnly = True
            TabOrder = 8
          end
          object DBEdit51: TDBEdit
            Left = 55
            Top = 125
            Width = 287
            Height = 21
            Color = clMenu
            DataField = 'NM_PORTO'
            DataSource = datm_profit_maritimo.ds_master
            ReadOnly = True
            TabOrder = 6
          end
          object DBEdit52: TDBEdit
            Left = 15
            Top = 125
            Width = 41
            Height = 21
            Color = clMenu
            DataField = 'CD_ORIGEM'
            DataSource = datm_profit_maritimo.ds_master
            ReadOnly = True
            TabOrder = 5
            OnChange = dbedt_cd_agente_diretoChange
            OnKeyDown = dbedt_cd_agente_diretoKeyDown
          end
          object dbedt_nm_atrac_direto: TDBEdit
            Left = 394
            Top = 220
            Width = 273
            Height = 21
            Color = clMenu
            DataField = 'NM_ATRACACAO'
            DataSource = datm_profit_maritimo.ds_master
            ReadOnly = True
            TabOrder = 14
          end
          object dbedt_nm_desc_direto: TDBEdit
            Left = 53
            Top = 268
            Width = 262
            Height = 21
            Color = clMenu
            DataField = 'NM_DESCARGA'
            DataSource = datm_profit_maritimo.ds_master
            ReadOnly = True
            TabOrder = 16
          end
          object dbedt_nm_veic_direto: TDBEdit
            Left = 398
            Top = 270
            Width = 269
            Height = 21
            Color = clMenu
            DataField = 'NM_VEICULO'
            DataSource = datm_profit_maritimo.ds_master
            ReadOnly = True
            TabOrder = 18
          end
          object dbedt_nm_exp_direto: TDBEdit
            Left = 57
            Top = 172
            Width = 258
            Height = 21
            Color = clMenu
            DataField = 'NM_EMP_EST'
            DataSource = datm_profit_maritimo.ds_processo
            ReadOnly = True
            TabOrder = 10
          end
          object dbedt_nm_despachante_direto: TDBEdit
            Left = 400
            Top = 173
            Width = 267
            Height = 21
            Color = clMenu
            DataField = 'NM_COMISSARIA'
            DataSource = datm_profit_maritimo.ds_processo
            ReadOnly = True
            TabOrder = 12
          end
          object DBEdit12: TDBEdit
            Left = 57
            Top = 80
            Width = 285
            Height = 21
            Color = clMenu
            DataField = 'NM_EMPRESA'
            DataSource = datm_profit_maritimo.ds_processo
            ReadOnly = True
            TabOrder = 2
          end
          object dbedt_cd_exp_direto: TDBEdit
            Left = 15
            Top = 172
            Width = 43
            Height = 21
            DataField = 'CD_EMP_EST'
            DataSource = datm_profit_maritimo.ds_processo
            TabOrder = 9
            OnChange = btn_co_exp_consoClick
            OnExit = dbedt_cd_exp_diretoExit
            OnKeyDown = dbedt_cd_agente_diretoKeyDown
          end
          object dbedt_cd_despachante_direto: TDBEdit
            Left = 357
            Top = 173
            Width = 44
            Height = 21
            DataField = 'CD_DESPACHANTE'
            DataSource = datm_profit_maritimo.ds_processo
            TabOrder = 11
            OnChange = btn_co_desp_consoClick
            OnExit = dbedt_cd_despachante_diretoExit
            OnKeyDown = dbedt_cd_agente_diretoKeyDown
          end
          object dbedt_cd_atrac_direto: TDBEdit
            Left = 357
            Top = 220
            Width = 38
            Height = 21
            DataField = 'CD_ARMAZEM_ATRACACAO'
            DataSource = datm_profit_maritimo.ds_master
            TabOrder = 13
            OnChange = dbedt_cd_agente_diretoChange
            OnExit = dbedt_cd_atrac_diretoExit
            OnKeyDown = dbedt_cd_agente_diretoKeyDown
          end
          object dbedt_cd_desc_direto: TDBEdit
            Left = 15
            Top = 268
            Width = 39
            Height = 21
            DataField = 'CD_ARMAZEM_DESCARGA'
            DataSource = datm_profit_maritimo.ds_master
            TabOrder = 15
            OnChange = dbedt_cd_agente_diretoChange
            OnExit = dbedt_cd_desc_diretoExit
            OnKeyDown = dbedt_cd_agente_diretoKeyDown
          end
          object dbedt_cd_veic_direto: TDBEdit
            Left = 357
            Top = 270
            Width = 42
            Height = 21
            DataField = 'CD_VEICULO'
            DataSource = datm_profit_maritimo.ds_master
            TabOrder = 17
            OnChange = dbedt_cd_agente_diretoChange
            OnExit = dbedt_cd_veic_diretoExit
            OnKeyDown = dbedt_cd_agente_diretoKeyDown
          end
          object dblook_incoterm_direto: TDBLookupComboBox
            Left = 15
            Top = 316
            Width = 57
            Height = 21
            DataField = 'Look_nm_incoterm'
            DataSource = datm_profit_maritimo.ds_processo
            ListField = 'CODIGO'
            TabOrder = 19
            OnClick = dblook_incoterm_diretoClick
          end
          object dblook_tp_frete_direto: TDBLookupComboBox
            Left = 87
            Top = 316
            Width = 70
            Height = 21
            Color = clMenu
            DataField = 'Look_nm_tp_frete'
            DataSource = datm_profit_maritimo.ds_processo
            ListField = 'CODIGO'
            ReadOnly = True
            TabOrder = 20
            OnClick = dbedt_cd_exp_diretoChange
          end
          object DBEdit61: TDBEdit
            Left = 171
            Top = 316
            Width = 161
            Height = 21
            DataField = 'NR_VOO'
            DataSource = datm_profit_maritimo.ds_master
            TabOrder = 21
            OnChange = dbedt_cd_agente_diretoChange
          end
          object DBEdit62: TDBEdit
            Left = 541
            Top = 316
            Width = 122
            Height = 21
            DataField = 'DT_EMBARQUE'
            DataSource = datm_profit_maritimo.ds_master
            TabOrder = 23
            OnChange = dbedt_cd_agente_diretoChange
            OnExit = DBEdit62Exit
          end
          object DBEdit63: TDBEdit
            Left = 357
            Top = 356
            Width = 122
            Height = 21
            DataField = 'DT_PREV_CHEGADA'
            DataSource = datm_profit_maritimo.ds_master
            TabOrder = 24
            OnChange = dbedt_cd_agente_diretoChange
          end
          object DBEdit64: TDBEdit
            Left = 541
            Top = 356
            Width = 122
            Height = 21
            DataField = 'DT_CHEGADA'
            DataSource = datm_profit_maritimo.ds_master
            TabOrder = 25
            OnChange = dbedt_cd_agente_diretoChange
            OnExit = dbedt_dt_chegadaExit
          end
          object DBEdit30: TDBEdit
            Left = 167
            Top = 361
            Width = 81
            Height = 21
            Color = clMenu
            DataField = 'DT_RECEBIMENTO'
            DataSource = datm_profit_maritimo.ds_house
            ReadOnly = True
            TabOrder = 27
          end
          object DBEdit53: TDBEdit
            Left = 15
            Top = 361
            Width = 126
            Height = 21
            Color = clMenu
            DataField = 'REF_CLIENTE'
            DataSource = datm_profit_maritimo.ds_processo
            ReadOnly = True
            TabOrder = 26
            OnChange = dbedt_cd_exp_diretoChange
            OnExit = dbedt_cd_exp_consoExit
            OnKeyDown = dbedt_cd_agente_diretoKeyDown
          end
          object DBEdit49: TDBEdit
            Left = 357
            Top = 125
            Width = 35
            Height = 21
            Color = clMenu
            DataField = 'CD_DESTINO'
            DataSource = datm_profit_maritimo.ds_master
            ReadOnly = True
            TabOrder = 7
            OnChange = dbedt_cd_agente_diretoChange
            OnKeyDown = dbedt_cd_agente_diretoKeyDown
          end
          object DBEdit11: TDBEdit
            Left = 15
            Top = 80
            Width = 43
            Height = 21
            Color = clMenu
            DataField = 'CD_CLIENTE'
            DataSource = datm_profit_maritimo.ds_processo
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_cd_arm_direto: TDBEdit
            Left = 357
            Top = 83
            Width = 42
            Height = 21
            Color = clMenu
            DataField = 'CD_ARMADOR'
            DataSource = datm_profit_maritimo.ds_master
            ReadOnly = True
            TabOrder = 3
            OnChange = dbedt_cd_agente_diretoChange
            OnKeyDown = dbedt_cd_agente_diretoKeyDown
          end
          object dbedtMasterDireto: TDBEdit
            Left = 357
            Top = 316
            Width = 122
            Height = 21
            DataField = 'DT_MASTER'
            DataSource = datm_profit_maritimo.ds_master
            TabOrder = 22
            OnChange = dbedt_cd_agente_diretoChange
            OnExit = dbedtMasterDiretoExit
          end
        end
        object ts_direto_comp: TTabSheet
          Caption = 'Composi'#231#227'o do Frete'
          ImageIndex = 1
          object Label101: TLabel
            Left = 0
            Top = 369
            Width = 1000
            Height = 13
            Align = alBottom
            Caption = 'Others Charges'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object pnl_fcl_direto: TPanel
            Left = 0
            Top = 56
            Width = 1000
            Height = 313
            Align = alClient
            TabOrder = 1
            object dbgrid_cntr_direto: TDBGrid
              Left = 1
              Top = 1
              Width = 998
              Height = 311
              Align = alClient
              DataSource = datm_profit_maritimo.ds_proc_cntr
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnColExit = dbgrid_containerColExit
              OnDblClick = dbgrid_containerDblClick
              OnKeyDown = dbgrid_containerKeyDown
              Columns = <
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'NR_CNTR'
                  Title.Caption = 'Numero do Contanier'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 133
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TP_CNTR'
                  Title.Caption = 'C'#243'd.'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Color = 16776176
                  Expanded = False
                  FieldName = 'calcNomeCNTR'
                  Title.Caption = 'Contanier'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 208
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'VL_PESO_TON'
                  Title.Caption = 'Peso Bruto (Ton)'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 134
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'VL_VENDA'
                  Title.Caption = 'Venda'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'NR_LACRE'
                  Title.Caption = 'Lacre'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end>
            end
          end
          object pnl_lcl_direto: TPanel
            Left = 0
            Top = 56
            Width = 1000
            Height = 313
            Align = alClient
            TabOrder = 2
            object dbgrid_lcl_direto: TDBGrid
              Left = 1
              Top = 1
              Width = 998
              Height = 311
              Align = alClient
              DataSource = datm_profit_maritimo.ds_processo_carga
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnColExit = dbgrid_lclColExit
              OnDblClick = dbgrid_lclDblClick
              OnKeyDown = dbgrid_lclKeyDown
              Columns = <
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TP_EMBALAGEM'
                  Title.Caption = 'C'#243'd.'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Color = 16776176
                  Expanded = False
                  FieldName = 'calcEmbalagem'
                  Title.Caption = 'Tipo da Embalagem'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 129
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'QTDE'
                  Title.Caption = 'Qtde'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'PESO_TON'
                  Title.Caption = 'Peso Bruto (TON)'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 136
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'PESO_VOLUMETRICO'
                  Title.Caption = 'Cubagem (M3)'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 101
                  Visible = True
                end>
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 1000
            Height = 56
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object lb_tarifa_direto: TLabel
              Left = 253
              Top = 11
              Width = 34
              Height = 13
              Caption = 'Tarifa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label98: TLabel
              Left = 136
              Top = 11
              Width = 97
              Height = 13
              Caption = 'Peso Bruto (Ton)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label99: TLabel
              Left = 371
              Top = 11
              Width = 63
              Height = 13
              Caption = 'Total Frete'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label100: TLabel
              Left = 11
              Top = 11
              Width = 107
              Height = 13
              Caption = 'Tipo de Estufagem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_charg_direto: TDBEdit
              Left = 136
              Top = 25
              Width = 103
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CHARGEABLE'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 1
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_tarifa_direto: TDBEdit
              Left = 254
              Top = 25
              Width = 102
              Height = 21
              DataField = 'VL_TARIFA_FRETE'
              DataSource = datm_profit_maritimo.ds_processo
              TabOrder = 2
              Visible = False
              OnChange = dbedt_cd_exp_diretoChange
            end
            object dbedt_tt_frete_direto: TDBEdit
              Left = 372
              Top = 25
              Width = 103
              Height = 21
              DataField = 'VL_FRETE'
              DataSource = datm_profit_maritimo.ds_processo
              TabOrder = 3
              OnChange = dbedt_cd_exp_diretoChange
            end
            object rxcombo_tp_estufagem_direto: TRxDBComboBox
              Left = 12
              Top = 25
              Width = 109
              Height = 21
              Style = csDropDownList
              DataField = 'TP_ESTUFAGEM'
              DataSource = datm_profit_maritimo.ds_processo
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'LCL'
                'FCL'
                'Break Bulk')
              TabOrder = 0
              Values.Strings = (
                '0'
                '1'
                '2')
              OnChange = rxcombo_tp_estufagem_diretoChange
            end
          end
          object dbgrid_other_direto: TDBGrid
            Left = 0
            Top = 382
            Width = 1000
            Height = 135
            Align = alBottom
            DataSource = datm_calc_profit.ds_other_charges
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnColExit = dbgrid_other_chargeColExit
            OnDblClick = dbgrid_other_chargeDblClick
            OnEnter = dbgrid_other_chargeEnter
            OnKeyDown = dbgrid_other_chargeKeyDown
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CD_ITEM'
                Title.Caption = 'C'#243'd.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'calcItem'
                Title.Caption = 'Descri'#231#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 208
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'Look_nm_tp_calc'
                Title.Caption = 'Tipo Base'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 96
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VL_BASE_CLI'
                Title.Caption = 'Valor Base'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 67
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VL_VENDA'
                Title.Caption = 'Venda'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 79
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'in_notificao'
                ReadOnly = True
                Title.Caption = 'Notificado'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 74
                Visible = True
              end>
          end
          object Panel16: TPanel
            Left = 0
            Top = 517
            Width = 1000
            Height = 73
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 4
            object Label103: TLabel
              Left = 540
              Top = 19
              Width = 84
              Height = 13
              Caption = 'Total Other Ch'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label104: TLabel
              Left = 633
              Top = 19
              Width = 70
              Height = 13
              Caption = 'Total House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object checkbox_in_comissao: TDBRadioGroup
              Left = 10
              Top = 7
              Width = 119
              Height = 57
              Caption = 'Origem Comiss'#227'o'
              DataField = 'IN_COMISSAO'
              DataSource = datm_profit_maritimo.ds_master
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Armador'
                'Agente')
              ParentFont = False
              TabOrder = 0
              Values.Strings = (
                '0'
                '1')
              OnChange = checkbox_in_comissaoChange
            end
            object pnl_ag_comissao: TPanel
              Left = 133
              Top = 12
              Width = 186
              Height = 52
              BevelInner = bvRaised
              BevelOuter = bvLowered
              TabOrder = 2
              Visible = False
              object Label40: TLabel
                Left = 9
                Top = 7
                Width = 41
                Height = 13
                Caption = 'Agente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object btn_co_ag_comissao: TSpeedButton
                Left = 153
                Top = 21
                Width = 24
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
                OnClick = btn_co_ag_comissaoClick
              end
              object dbedt_nm_ag_comissao: TDBEdit
                Left = 43
                Top = 21
                Width = 109
                Height = 21
                TabStop = False
                Color = clMenu
                DataField = 'AGENTE_COMISSAO'
                DataSource = datm_profit_maritimo.ds_master
                ReadOnly = True
                TabOrder = 1
              end
              object dbedt_cd_ag_comissao: TDBEdit
                Left = 9
                Top = 21
                Width = 35
                Height = 21
                DataField = 'CD_AG_COMISSAO'
                DataSource = datm_profit_maritimo.ds_master
                TabOrder = 0
                OnChange = dbedt_cd_agente_diretoChange
                OnExit = dbedt_cd_ag_comissaoExit
                OnKeyDown = dbedt_cd_agente_diretoKeyDown
              end
            end
            object DBEdit73: TDBEdit
              Left = 542
              Top = 34
              Width = 85
              Height = 21
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit74: TDBEdit
              Left = 635
              Top = 34
              Width = 80
              Height = 21
              Color = clMenu
              DataField = 'VL_HOUSE'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 4
            end
            object GroupBox4: TGroupBox
              Left = 323
              Top = 7
              Width = 209
              Height = 57
              Caption = 'Mercadoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object btn_co_merc: TSpeedButton
                Left = 96
                Top = 25
                Width = 24
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
                OnClick = btn_co_mercClick
              end
              object DBEdit72: TDBEdit
                Left = 129
                Top = 25
                Width = 70
                Height = 21
                DataField = 'VL_MERCADORIA'
                DataSource = datm_profit_maritimo.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                OnChange = dbedt_cd_exp_diretoChange
              end
              object dbedt_nm_moeda_mle_direto: TDBEdit
                Left = 43
                Top = 25
                Width = 52
                Height = 21
                TabStop = False
                Color = clMenu
                DataField = 'AP_MOEDA_MLE'
                DataSource = datm_profit_maritimo.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object dbedt_cd_moeda_mle_direto: TDBEdit
                Left = 10
                Top = 25
                Width = 34
                Height = 21
                DataField = 'CD_MOEDA_MLE'
                DataSource = datm_profit_maritimo.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = dbedt_cd_exp_diretoChange
                OnExit = dbedt_cd_moeda_mle_diretoExit
                OnKeyDown = dbedt_cd_agente_diretoKeyDown
              end
            end
          end
        end
        object ts_direto_brasil: TTabSheet
          Caption = 'Custo no Brasil'
          ImageIndex = 2
          object Label105: TLabel
            Left = 0
            Top = 0
            Width = 108
            Height = 13
            Align = alTop
            Caption = 'Despesa do House'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label106: TLabel
            Left = 0
            Top = 179
            Width = 78
            Height = 13
            Align = alTop
            Caption = 'Valores Brasil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbgrid_desp_direto: TDBGrid
            Left = 0
            Top = 13
            Width = 1000
            Height = 166
            Hint = 
              '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em azul abrem Consulta' +
              's OnLine'#13#10'*Ctrl + Delete exclui registro'
            Align = alTop
            DataSource = datm_profit_maritimo.ds_despesa_house
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnColExit = dbgrid_despesa_houseColExit
            OnDblClick = dbgrid_despesa_houseDblClick
            OnKeyDown = dbgrid_despesa_houseKeyDown
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CD_ITEM'
                Title.Caption = 'C'#243'd'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 27
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'calcItem'
                Title.Caption = 'Descri'#231#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 151
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CD_MOEDA'
                Title.Caption = 'Cod.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 34
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'calcMoeda'
                Title.Caption = 'Moeda'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 184
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'look_nm_tp_base'
                Title.Caption = 'Tipo Base'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 100
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VL_BASE_AG'
                Title.Caption = 'Valor Base'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VL_COMPRA_AG'
                Title.Caption = 'Valor'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_CUSTO-es'
                ReadOnly = True
                Title.Caption = 'Valor Convertido'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = False
              end>
          end
          object dbgrid_vl_direto: TDBGrid
            Left = 0
            Top = 192
            Width = 1000
            Height = 398
            Hint = '*Campos em amarelo s'#227'o edit'#225'veis'
            Align = alClient
            DataSource = datm_profit_maritimo.ds_vl_brasil
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnColExit = dbgrid_vl_brasilColExit
            OnDblClick = dbgrid_vl_brasilDblClick
            OnKeyDown = dbgrid_vl_brasilKeyDown
            OnKeyUp = dbgrid_vl_diretoKeyUp
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CD_ITEM'
                Title.Caption = 'C'#243'd.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 32
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'calcItem'
                Title.Caption = 'Descri'#231#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 145
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CD_MOEDA_VENDA'
                Title.Caption = 'C'#243'd.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 36
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'calcMoeda'
                Title.Caption = 'Moeda'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 163
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'Look_tp_base'
                Title.Caption = 'Tipo Base'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 73
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VL_BASE_CLI'
                Title.Caption = 'Valor Base'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 69
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VL_VENDA'
                Title.Caption = 'Venda'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 50
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VL_VENDA_EST'
                ReadOnly = True
                Title.Caption = 'Valor Convertido'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'in_notificacao'
                ReadOnly = True
                Title.Caption = 'Notificado'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end>
          end
        end
        object ts_direto_calc_profit: TTabSheet
          Caption = 'Calculo Profit'
          ImageIndex = 3
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 1000
            Height = 57
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label107: TLabel
              Left = 12
              Top = 10
              Width = 37
              Height = 13
              Caption = 'House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label91: TLabel
              Left = 146
              Top = 11
              Width = 39
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit75: TDBEdit
              Left = 13
              Top = 24
              Width = 121
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NR_HOUSE'
              DataSource = datm_profit_maritimo.ds_house
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit10: TDBEdit
              Left = 147
              Top = 24
              Width = 90
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'AP_MOEDA'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object GroupBox2: TGroupBox
            Left = 14
            Top = 68
            Width = 146
            Height = 159
            Caption = 'Valor Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label109: TLabel
              Left = 18
              Top = 106
              Width = 70
              Height = 13
              Caption = 'Total Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label110: TLabel
              Left = 18
              Top = 65
              Width = 76
              Height = 13
              Caption = 'Other Charge'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label111: TLabel
              Left = 18
              Top = 25
              Width = 70
              Height = 13
              Caption = 'Frete Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit76: TDBEdit
              Left = 18
              Top = 120
              Width = 109
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_TT_VENDA'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit78: TDBEdit
              Left = 18
              Top = 38
              Width = 109
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_FRETE'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit79: TDBEdit
              Left = 18
              Top = 79
              Width = 109
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object GroupBox3: TGroupBox
            Left = 171
            Top = 68
            Width = 146
            Height = 159
            Caption = 'Valor Custo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object Label113: TLabel
              Left = 18
              Top = 106
              Width = 66
              Height = 13
              Caption = 'Total Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label114: TLabel
              Left = 18
              Top = 65
              Width = 76
              Height = 13
              Caption = 'Other Charge'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label115: TLabel
              Left = 18
              Top = 25
              Width = 66
              Height = 13
              Caption = 'Frete Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit80: TDBEdit
              Left = 18
              Top = 120
              Width = 110
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_TT_CUSTO'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_profit_direto: TDBEdit
              Left = 18
              Top = 38
              Width = 110
              Height = 21
              DataField = 'VL_RATEIO'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = dbedt_cd_exp_diretoChange
            end
            object DBEdit83: TDBEdit
              Left = 18
              Top = 79
              Width = 110
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_OTHER_CHARGE_CUSTO'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object Panel14: TPanel
            Left = 328
            Top = 73
            Width = 386
            Height = 153
            Color = clSilver
            TabOrder = 3
            object Label121: TLabel
              Left = 183
              Top = 19
              Width = 66
              Height = 13
              Caption = 'Profit Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label126: TLabel
              Left = 19
              Top = 100
              Width = 76
              Height = 13
              Caption = 'Profit Liquido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label127: TLabel
              Left = 19
              Top = 18
              Width = 71
              Height = 13
              Caption = 'Profit House'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label95: TLabel
              Left = 19
              Top = 59
              Width = 113
              Height = 13
              Caption = 'Valor Receita Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label96: TLabel
              Left = 183
              Top = 59
              Width = 118
              Height = 13
              Caption = 'Valor Despesa Brasil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit85: TDBEdit
              Left = 183
              Top = 32
              Width = 149
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_PROFIT_BRASIL'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit90: TDBEdit
              Left = 19
              Top = 112
              Width = 149
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_PROFIT_LIQUIDO'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit91: TDBEdit
              Left = 19
              Top = 32
              Width = 149
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_PROFIT_HOUSE'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit45: TDBEdit
              Left = 19
              Top = 72
              Width = 149
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_VENDA_BRASIL'
              DataSource = datm_profit_maritimo.ds_processo
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit46: TDBEdit
              Left = 183
              Top = 72
              Width = 149
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_DESP_BRASIL'
              DataSource = datm_profit_maritimo.ds_processo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
      end
    end
    object ts_obs: TTabSheet
      Caption = 'Observa'#231#227'o'
      ImageIndex = 5
      object DBM_texto: TDBMemo
        Left = 0
        Top = 0
        Width = 1008
        Height = 618
        Align = alClient
        DataField = 'TEXTO'
        DataSource = datm_profit_maritimo.ds_master
        TabOrder = 0
        OnChange = dbedt_cd_agente_diretoChange
        OnEnter = DBM_textoEnter
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 896
    Top = 441
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      OnClick = btn_incluirClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_pesquisa: TMenuItem
      Caption = '&Pesquisar'
      OnClick = btn_pesqClick
    end
    object mi_tarifa_master: TMenuItem
      Caption = '&Buscar Tarifa Master'
      Enabled = False
      OnClick = btn_tarifa_masterClick
    end
    object mi_calculo: TMenuItem
      Caption = 'Calculo Pro&fit'
      Enabled = False
      OnClick = btn_calculoClick
    end
    object mi_final_conso: TMenuItem
      Caption = '&Finaliza Consolidada'
      Enabled = False
      OnClick = btn_finaliza_procClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object popmenu_lista_rel: TPopupMenu
    Left = 896
    Top = 387
    object mi_pre_alerta_cli: TMenuItem
      Caption = 'Pr'#233' - Alerta'
      OnClick = mi_pre_alerta_cliClick
    end
    object mi_notificacao: TMenuItem
      Caption = 'Instru'#231#227'o de Embarque'
      OnClick = mi_notificacaoClick
    end
    object miPrevCheg: TMenuItem
      Caption = 'Aviso de Chegada'
      OnClick = miPrevChegClick
    end
  end
  object pp_pre_alerta: TppReport
    AutoStop = False
    DataPipeline = ppPrevChegIM
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBroker\avisoPrevChegIM.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 927
    Top = 600
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppPrevChegIM'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 150813
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Style = bsClear
        Pen.Color = clGray
        Pen.Width = 2
        mmHeight = 21431
        mmLeft = 529
        mmTop = 124884
        mmWidth = 196321
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 
          'NOTIFICA'#199#195'O DE VALORES DEVER'#193' SER SOLICITADO SOMENTE AP'#211'S 24HS D' +
          'A ATRACA'#199#195'O DO NAVIO, NO SEGUINTE E-MAIL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 4233
        mmTop = 130969
        mmWidth = 190500
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = '>> IMPORTANTE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 4233
        mmTop = 127794
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'fi@myindaia.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 9525
        mmTop = 140229
        mmWidth = 34925
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Brush.Style = bsClear
        Pen.Color = clGray
        Pen.Width = 2
        mmHeight = 82021
        mmLeft = 529
        mmTop = 42069
        mmWidth = 196586
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Para:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 2646
        mmTop = 25400
        mmWidth = 8424
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Att.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 2646
        mmTop = 29104
        mmWidth = 6985
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Ref.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 2646
        mmTop = 32808
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 2646
        mmTop = 36513
        mmWidth = 8636
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 12435
        mmTop = 36513
        mmWidth = 156898
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Ref.: AVISO DE PREVIS'#195'O DE CHEGADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 43921
        mmWidth = 194469
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 
          'Referente ao embarque mar'#237'timo abaixo mencionado, informamos a '#250 +
          'ltima posi'#231#227'o  do navio com a sua previs'#227'o de atraca'#231#227'o.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 50006
        mmWidth = 165365
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Navio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 55827
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Shipper:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 63236
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Porto de Origem:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 70644
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'HBL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 81756
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Prev. de Chegada:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 78052
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Porto de Destino:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 74348
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Armador:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 111125
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Data do Master:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 107421
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Master:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 103717
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Volume:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 96573
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Peso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 92869
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Cont'#226'iner:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 89165
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Terminal Atraca'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 114829
        mmWidth = 35190
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOME_NAVIO'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 55827
        mmWidth = 156898
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME_SHIPER'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 63236
        mmWidth = 156898
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'LOCAL_DESTINO'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 74348
        mmWidth = 156898
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'LOCAL_ORIGEM'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 70644
        mmWidth = 156898
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NR_HOUSE'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 81756
        mmWidth = 156898
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DT_PREV_CHEGADA'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 78052
        mmWidth = 156898
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DT_MASTER'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 107421
        mmWidth = 156898
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'ARMADOR'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 111125
        mmWidth = 156898
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'NR_MASTER'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 103717
        mmWidth = 156898
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'calcVolume'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 96573
        mmWidth = 156898
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'calcPeso'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 92869
        mmWidth = 156898
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'calcCNTR'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 89165
        mmWidth = 156898
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'NM_ATRACACAO'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 114829
        mmWidth = 156898
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'NR_PROCESSO'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 12435
        mmTop = 32808
        mmWidth = 156898
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Departamento de Importa'#231#227'o Mar'#237'tima'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 12435
        mmTop = 29104
        mmWidth = 156898
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Viagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 59531
        mmWidth = 35190
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'NR_VIAGEM'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 59531
        mmWidth = 156898
        BandType = 0
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Picture.Data = {
          0954474946496D616765143B000047494638396101035200F70000FFFFFFFFFF
          F7F7FFFFFFFFEFF7FFF7F7FFEDEFFFFFEEFFF7FFF7FFE6FFFFFFF7F7DAFFFFF7
          F7F7F7F7EEF7F6FFF0F7FFFFF5EEEFF8F4E6F8FFDBF7FFDAF6F8E6F3F6EEEFFF
          EFEDF8DCF0F6CEF3F9E7E7E7E7E4F9C5EFF7DAE8F1E5E5EFCEE6F2DBE0E3C4E6
          F0B4E9F3D9DBF0DED8FAC6E0EFC8DBE6D6D7E0D6D6D8BFDCEAB3DFF0B1DEE8C9
          D9DEBBD5E0A5D9E8CFCBE2C4CFD7B2D4E3BFCFDFCCCCCC9DD7E3B5CED3BDCDD2
          A4CEE1C5C4D6C1C2DE97CEDFB5C5CF99CCCCACC5D38BCDDCBCBED59EC7DBBEBD
          CF91C8D4ACBECCB6B7CCA0BBD1A8B7BF90BAD481BFCFB1AFDE7CBEDC9AB5C4AE
          ADD7B0ABC97EBAC3ACA9BE72B8C6A5A7CDA9A8B07CB1CE61B6E064B5D172B1D0
          8FAAC05AB5D6A1A3BC50B9D15BB3DF9FA1B690A6B44FB5E06BAEC174AABE82A6
          B57FA6C066ABCF63ABC659ADD29E99B79999CC9D9AAF5BAAC4959AB750ABD16A
          A5BE99999963A6BB52ABB95AA8BC829DAD4FA8C69294AC4FA6B78D8CB67394B0
          6699998090A65A9AB88F89AD8D8A9F7B8E9E7091A75995AB84869D8584A48486
          938582AD6C87987585907C7FAA7D7D975587A562829A747A947A78866D7A9356
          7F95617C914D7C986F71A4756F9575718867758563709C2A7BAD6C6B8D626F78
          536F9064698F566E83546D796666664B6A8263637F476A925664764B63765C5B
          8540648560588B5A586E5857793B607657558454566D3B5B7A42586E4D527249
          545C2F56765349881D598434536A4F47784B48594B45674C4186344969474553
          2E4B5D44436B294A69464358483C88483F7645444A1A4A7B473D79194A722F45
          530F4B7C1B486C104A7231435A423A690F4A6942377B4336854137732042681A
          42743A3B5A1B427C10437211436A18426A0F437A1F3E590941693A316A3A2E7A
          3333661C38543033521C384B333333372B730E396417366434304B342D591036
          5B1D323F1131671033482C28632D286A07355A10335229295B2B28532A294800
          33662428580631502A28332A2543112A491A283D202252082A4C05295A202140
          21204A0D2840211F2A07223D1C1B3D191A2E081E300A1B2719182021F9040007
          0000002C00000000010352000008FF0001081C4850A08083020A1624C0906180
          870F154A9C48B1A2C58B18336ADCC8B1A34782ED428A1C49B2A4C9932853AA5C
          C9B2A5CB973063CA9C49B3A6CD9B313FEADCC9B3A7CF9F40830ADD08B12082A3
          43932A5DCAD423CEA750A34A9D4AB5AAD5AB369B6ADDCAB5ABD7A004108A1500
          F1A859B35FD3AA5D3B11ABDBB770E3CA9D4B3725DBBB78F3EACD083140D8B107
          158ADD4BB8F0CFBA88132B5ECC38B1E1C790230FEDDB9760DFB106322794CCB9
          F3C0C6A0438B1E4D1AA5E7D3A8530BA40CA1E840050A1AFE1DACBA76DED2B873
          EBDE6DD5B6EFDF791908670091B644D80A802BF7CABBB9F3E7D04F2E9F4E3D29
          03C006264CC810E283F6070F109AFF855DBDFCD0E8E8D3AB176DBEBD7B8D080F
          1C9C100208122850BE7C41C25F870B15194C900042EF15F8D17A0826A8A05B06
          36E820000264668009477C91471A69ACA1E1866FBC91C6174E08B102070B18F0
          E089142DA8E28A2CCE84E28BD50510E10A60B89106165AE48845193C8E31461A
          700409871B6428414308140C98505F0534E91A8CD3B528E594548E0465504F16
          94E5953B292040064EC05105166BE458061956F8A0C30D37B8408310FC81C146
          1E79B081040D240E38DC0003508650005A72E959958416AAA0A088A2C6500B79
          54B1C5A358A431850A134820610298629A410A401C61059D70408127A6080DC7
          000107A41AD16AABE6B5255394B5FFCAD7AB3D196AEBADCF25BA14ADBAC26700
          10706081851754489AC1660DF03900430619B0C002DC0101461E7EB821840825
          4A9819431114D067AC69C52A2E654A8DCB2BABE30285EBBAEC92D6EBBB8F0990
          8010197AE1451963A82000020A40E0AFBF322294C00209307440072614C1861F
          A1E24970660020471EBA807A65EEC5150BF5ADB8155DAC6EBB20878C186795B9
          CAEBB9F06624AF0E370A9B06121308801C9F3266B65D082288900105A91E9440
          062B20E1861F5FE8C04102E009971C000EA0CBC0570D44DDC075638527807028
          7FE48071C43590B14419533D9C404FF324F2D9683368B1AC14817B97DB5AB29D
          32473392212C166420B180CC5E5EFF1A820E534CA1DF175020E1030D3A138C29
          073A80D1471F4B7C1021810445BD74577C4208D8602507659C400D5144F55804
          99BA53DAA8A70E5557E45E047752ADC71DFB40B3CFBD51581958D1321C4E9428
          DC4199B9F0451A3CF258AF171A5621440C1D3CE0EC02311C6147267D5C714518
          D85FD185111130FB55711F74217E1757882186F82C0090F546171841BEF5F06F
          FF00715F2B540117E3E71F8811649BADFAFF008409EBD64731B96109659D939D
          ED7692001D90810A5420C317329099A31C04036C0896BD8855051EC9410E18A2
          13188E7003123DEB08F4A0873B56C8C27E80A20264A99F56C6D6057DA430852B
          C4473FA490141064431FE860A13BFFE2D18F4F584D8600281B1FF0C14474E883
          1CF8F04730827098005AF18AD299615FCA76018138C00302F180039A5636AC35
          4029C2C948D914B246859C11005E232097C402110384000C8FA2821B44600006
          C006010230011BD290232F6CE14C5010820E80D0A929B8E10D74A0C37EB03505
          742CE392CB18C630A2810E3E1CC4805A89501FE8118D5246E319CF08C7346090
          14194C6319D180862CA1B18C787892721281C1345EB90C680C231CF868C40792
          D8C60361F198C7EC0AFD4677823D9082082F7801114881861320C0015D2CA65A
          9AC6C6A73D8D9B4C23631A6B673BCA18200140488321D3208404780B02023101
          18AA60AF2D7C480449D28C00E8E3FF021F7C616870F08123A8814A6644831808
          0DC71588E9BDAD8CB169120045387CE10B8412031AE180450724B2B91826105D
          025842389EE10B6998541ACC40C74201309B81500D039C60874581110E72D821
          6681A91532771A40651264037BF8C63BE6108840ECC1107BE0872EF690CD3426
          F127DAB44CAC8A0911A78E200B667882569FB001B291736E1069000132130232
          94810A65982001A2769D0FB0A10CF6C2DB0AB2D5D008FD4C053A80821B5E6151
          4DA2F219D01003050C4000A74E049418010C5A30000B6F30E319C7882C30D091
          09037CB2209BA3DFAB8AD3877030E3B38F7DC639D021036216246A0789033922
          7B0C4E4EA30B12120CDF38C2D3DAFFAA2E2D63FCC12CF8A1872CC0E30F86B047
          130CC10F59BCA08B5B6963BA0612C7376EC00CA5B80738AA010E70DCA3142FE8
          9F1C05E5A708E9200F2ED341020E1080A82D0009EABCD71828A82D6661260340
          00C65F81018C6880966834A0C05164632AE1286B0012830D12D5873140B12018
          CBF82C318E418CC9DEB2C05B346C41F864004DE8231CE1408786D1818F608031
          6A10F92F006C200F7C90E3C4E428C610C8363683E494B6B68DF1D992FB90A759
          A0139560421D72B00A7E18E20FFB98450EEAF0834E44C2024D01A744401C8034
          76AD624F98853AD4518D6A20431958AE46287E6096ED72F73202A0C014EC8637
          110C68001148800BD2F0A82D8C41FF720891CD59901203584A03A19A6446373C
          A10227DC210C29B0D4B61AF25F9AD16EB902613243C642000018411B09563031
          BA118E2578545C0D251B1D8B43E003ECA008A01E82A845BD030640A0D0CA120E
          0C8C20EA1A0CC108231008722813BA8EC8F8D6204BCB1FD6710F5CE420075998
          03118800882C9080C7F6B0C71C9832460078E00539F8C10B36F050D34AC4037A
          90AE327E410B64208316B470C52FEE110B227013B1B6BB9C1DDFBA8535288182
          7C3A4006905086478D21069B6169ADF9459E2E60C3BECC982534A871084CC5A0
          463E60AF650F9DB107C010301F6D963E11C20772441AB4D1C046690140B32C19
          40022097C003C076E8CF31576A04FF5096C4B565228208B82FB58631AE676EAB
          A614F305CD983238A2B08A55E498099528C52A98A08E66644317B1F6C9160982
          834E80C318C600C72C2A9105310AE402CFCEC21EE6D0841754621ED5E83632AC
          016E7157231DE5B8C728BABA408D30C0003720C31AB620071A148C21065001BB
          D37084090C44368D16486B04C0077460BC94C4A08627022D010E54C10F763842
          0C52908212C0000463344009AE30884C80A21171A881A0AFD697311EC4044BE0
          432632D1083C0CE1E18D4087268761525F742317C304B3003A50832EF4A111AB
          0F3E1EE230041684A7BF0FA9800996BF7CCAA7A0051568C8A03F5E822584A10F
          9CE0C425B2DF073B5CA10582EE23FFD6FC127899D3FCFC54EA4AA3F7708F74A4
          031367980738F6518842EC63CA5108C594D5B1EC24A29B234D8303B3700FE680
          0CDC708053A60B4FE0014D270BA4D00910D809B1D00ED6600DC9900CBB800CAE
          F0088F700DD78065CA100B1B80146D7711C9210147C0665B40062A60000F854E
          64E606FAD26580D710099009E7005A06E50BD1100E8C803D22C0019E400DDDD0
          0D9AB40CD3A00D8320001FD007D3400F1B860EF4E083262000151031B0617A26
          B008B9008551880EA0D00309200AE1604A26954AA92001EAF34612D00276000B
          D880432B9461F15087D8300DA0300496751069D405DAA00DD3100CC1900BB9B0
          4BFCC31082F60171C009D3100E42FFB442E71089E7100EA96007C77210B01173
          1B817E9C38251F11711331000DF000A5900ED7300F825008EDE07EA9A80ED625
          0882205DEAD0094DA3721BA14D65E3001B100AFBC00DBB708117880CBC000EDF
          600BF0200B5D874D0EF003AE600E18E86DAE100B90400275500ED69081B15009
          1680644F558215F17619300569502C53C00162410150308E7400331D25000DC1
          58DDA083A5E40DB9D0033C70076E3005CC300E01374BE1400F621002A9E00E65
          180DF4455FDD700EA66002061001C521003DD00AF4D00DD1E00C16E90CD1E00D
          F4900B53E00B02070D28850E8D80895E520178B00CEE700EB3445FA5347BD150
          84F4A00D7CA086497410833091DDFF800DE1204BE8A00D32E08E1190194B3090
          EED00DD04091A6140D158550D0700EEEB0907C088A17D18954B9229F088A0FC1
          4DC9120023D00CF3F0956A8009F7D00EF40708FB700FF78009738096F7D00C49
          97390C376051F554179008E0600ECE980CB46081BBA00CC6200B96F00F917016
          1E5009CA7081D6208CD2A80739100BE57081BF600C75E08D6A04001120002190
          8E559007EC28000D20002A400672400570000409A0190A111626900BD170529F
          D583A9800109B0024E700815A9839F050D87D00A2AE90B24E59BF3850F4B1801
          C40491D3E00EF4250D14557BD1300CDE804ABEC05AC7200D93150704D101A030
          9124F50CC07094E7E00D18265FDBFF3959F1B0524F23019CD00DC2200C07595F
          1A251B5D2085ED090CDDE0853B695117050DF4000A181095FFD7165519A008D2
          1303E6553536028060080A2A035990088560084D40040E6A086A900389600880
          0008D4A61373D904EB700DDFC60BB130A2BC1075EB200B68900F8A30100E0008
          567681B4700DA7F00490A0077AA00ECAB00BD6C00BBCC06547F19F0B642A0920
          026655057C370107D0240BE0026560A46CB002A4321143F06F277590DD700948
          031E71C00E27459D7FF50CD4700CB2249ED0C99DD3000BFDF93B32700BE8000C
          08B59EEB490D92F80C17B96091250DC3800E3D30100F2009FA70719FD50D9558
          0476D00AD400A7C2F00C799A0A57FFF8341F900B878AA8A25559101104E23051
          A1F50CDD300D88B0044B7009E1300CB3A449D3400E2B463108607E02BAAAB9D2
          11D5E63A4561017BA00719CAA0F55708394004B71A053280077390A05DA56495
          E952633302A8A00EBF600DAE700675500995600CDF000FFFB00D96B00D3CF434
          4D0075BF980CD5500A39E0002F0009B3000EBF7081A7A0A1C24A9913A1590910
          9AF59607A6992A07A0667940066FF00521B02F08D024CCF23471E059AEF959E1
          D00757E3AFE7F057F89978D410A60455A6A0050DB70002701401E8297BC3F0A6
          EC190EB730085D8008059994B9B90C2630103D004418360E284B0FA650029B51
          04DE60907D150E225B932D300D0FFF3B4BE760079E19001AC00AFD80B2E3C00E
          DDE00EE8606907D101A9100EDD294B09D507FE57A053C9AA52EB1C1E91AE1321
          1B4CD39568D90E67100A5F390FF5370FED700FA150086C890B233016AF433186
          551444000E5876653E3A07DFC00FFFF00ED31A08C4090023500AD550AE19580D
          4D30103F600C55860CD998749AA5AE87051169460363F0286E205EF23A2F4202
          06212010FC2A168DD00D012BB057E08E61D108F5C00C7E059DB2E408D572087F
          859BB424B19F5904E760849A7452E1900B7A0800123008E8207091D60DAD8001
          EA13529C80088D8008C88B088C5003FA0600AB19AA17CB94DE505A61B10486F7
          59B3D79496C627202009C79BBC88FF90095DC0874FD307EE100DACB59EE78008
          A4F7102FA611531BBFBBE111C8C54D5BF3BE2C3A1016500AEA708AB0780FD7D0
          0EB0380F015C7F22D109DCD811B9B81A6F940386BB0BBB600EDA4802CDC00FF9
          70C1FFB0091A404C7AD00CB400C1BB500D75C04D276008A5800BB8F00BA78006
          71791138300789100A321C0A73B08012F1C273100438B0C33CDCC33BCC057330
          07380000415CC4417C02177101465CC45C511C03C332C24207F9555E0E40013E
          400664102AE6F82F101351CFD9BA9FB50C7B8A77A6700EC0894AF4E50E623001
          37801FBE400DB81970B920B132D208C8399F9345B002307243D0A6C0809BE370
          094D03010450012CC77208D10397FF44A69BB40CA5751085075AD91B0EF8962C
          000031988510D97109E7000CAC8550E7100724A913F25BCAA5D11138705419BA
          CA7FD0CAADBCCAB06C0663B407F6000EE5700A51B00EEBB00F809008FBB00EE9
          907FEEB70E7F70106800CBB00C8BCA0CCB45A55C0F810016E098B4900CD6600C
          660009168CC19B2005691404B3A00CD30CC1A34002021104BD000FF0A00E225A
          09483C7E88A5C401DC0ED720C3AB3012EC5C105C10134F0000A1800B24510917
          310724810BA130400190190B700337A20574C00309401E0B4003E0F506509001
          B00101A9020020500BCBF0A50609BC25C05200D001B9D00D644A5FE7900B29E0
          2C2B3005AD00703A080DC10B288FFF6AD2F4050D9F458F231B35005003D3A094
          BEA083E350088207015623001A60034B70057630088BF0D48B200A2F6B902C19
          0EA220BC119209E8909406190EC15BB0A3B37B3B703D7C00D5C84B51A82459D0
          50B482773AA6FCD6A0D11116400AFC600F6C79D7788D96E9300FC6106B28A00B
          FD7B0D5CC00AAB80094DD0049DB00AB8C004B8908048EC01DFA0CB79FDB55F89
          96C9C60F9BC0465E0409200AC1D4956C78FB0E6DA00111E10095F0B7206C0C4F
          804D52B00DBD400AEB000FA8B0652E259527E0CFEDB00A54341017F004F1DC0E
          5CC074B90D08459C082341DC419C08FE3CC40261DC2301461581DB219108E1F2
          10E0A16684A4056F0004FA4AB140FF1049EB384C96499C3BB04B3AA849E1C009
          1280103BF06F30DD8FA2E0042AB03729B00CDEA04991B59EDDC009F303007D3C
          A6DDF9599465227C22002D800DCC7091CEF0589586855E82014B6009AA700B18
          560F16EE0DDE80B2802AE097801012000B9EF59A4AE90EEA7D35C4F900351007
          A0000BCB2089923885DD405176BA49D3C0BCEAE3D632110A4F000330F00489F0
          DB38B10A80F01642FE0441E0128960C4A19018426E13345CDCCD710D7300E44F
          51E4479E151DE10181300BA5100A5D2EC3A5700A621E0AA7E0E567070E4D7010
          7A300FE5500E393002677006B99A055DF703D9906C7AC0344D600FEA600CA5F0
          E77F2EE6821E0AABD009A4C00A81FF700173E9004FF0A2C9800CC6B00E76DB0B
          6D4060804204C6F00B20CC0BB8B0078A30038AF00E8AD00B17AC0B4DD0345229
          102710CFAB805C057101D2DD7F008003EDC0DC0241EB2281CFED80C40221D023
          41DD14F1042421EB063D1070070739220740F0006BD50006C0036F9023561002
          84D568FE564A92FC4B88B087007005BD8BD30F4B0D79F04FE29502538D78A0AC
          B309D105EE70C6CF20E078C052FE0200D6CB0C26B5E001170E351043100987D8
          800EF1A8E0CE300EA8044B5F9AA7047B992660DFC3F0A5C0400F8B70100A9F09
          D880B224A59C25250D9108D415254BCE090BE2ED3FFA7C02F5DC0EEC3CE450C1
          4A4B8E15ABB06CC2EE12D7000027FF20158970012A21DDEDA0F2370146548E12
          1EA818CBE6EB51D1F200F0F235D111E5E56C4410054CD0F44EDFF44910F54970
          0AE5300FA5D0451B8009A390046AF003B8C0CB86106439A006D36409DB18CDFD
          7B0A4FBFF649C0F44CF00448266105E101AB500DCF180B9DF00DDF6004A99AF4
          1600099A0EC1B4800B66400A8AA00152A00896F00EF970B7FB6CE9050AEB2171
          0DAEAE10B81E12CC4DEB0571F9EDB0F99D3F1002FDDB944F11AB00E4C4DEC4B1
          22002B90216E760414D0240570002B3006F652052E801037D9F01E1D0EB01578
          BCBBB40F0B0C39E306792004606094A6045A0D2E108360C667085AD8B004C4F4
          348597F128C50CD4700B232B1057FF100EDDF0EE144551E3A04A84D80AB3079D
          CCB00CD16F9902E0B249299EE8D005065102AAF0A7025F84A19A0BE6EFEECD19
          0EA0409300A100C04082050D1E04D04EE142860D1926BA708D61A8500E2D5EB4
          B80A10468E1D2F860230C763430030469E6C97C843458C41122ED48892238C97
          1EE75C60295367C76B7324EEF40852245086088D126C108081854EFB9AA54B77
          0DEA35AAD7CA95339735DD9E81167ECCE21728CB3E4080D44579646F168E0B0E
          1CD4990755EEDCAA50C1EDEBB4C1C1518268D42143564D900545AC50EC4D0AE0
          452C64BB1C57AB74A28D1445BD36BDFBF7EFDD3B457B037CE6BB512120BE0072
          E21AE8618E411C450BAA2E2872A8FFC2D5085BCF6E57BBF46EDE063FFF8610C0
          80882A72AAE47192E140010206545459B3C64D8C04092E79EBF64CFB3360D1C2
          F5104000C0034EE1801D63969E59B4561C168880024714356AD0862DC3BF0C5B
          8B81023475F325C000D3F3660901046000800A5409C71769D463861D53283890
          855CD879451A0DA501E69C56BA18A285108098269A68B4F3859965A691010002
          0408231C134D540F1B220692E0127D7261C6191FF1C3669121762881034F00DC
          4EBB70063910B4DE10022A089318C20517A2AEC4B221A1742A294B862AC1ED22
          004EF0D2229A4EA2E9A732D76473CB2C9F44AA81814EE8241B3BABC2F31A65B8
          C9AA9D669E38F08240BE81878B44FF0CF9031233D669668F071E10200BABCCA9
          A69A3CAB02C79866B2E96484DD186060834AAA516614122C18010D45A4706B2F
          3DAAA12519C794C902802036C9271FCD7A7927D74D34E02DA2854E28ED098688
          B5CDB5A344C2619585AEB900A150A065483738AF1DE8B7000AFA8D80174370E2
          8D2AE0988203030C4890032BE420830C21566805C00D39EC661913C203608354
          BA39E6180D5544871309CE0D418857A8D98EC66872E9A03F50C241713B66BCB9
          E25C030058029D6888E19846761039178044E871501814CF112585030FCC7846
          ED8699E6960F5C340091739EE198635FBC2906D921E831513B6060D6C6400106
          C2009665D283A66968BAE9A2C96DFFB1250828183CE0081740E6C8A91D5C2A49
          29118A28B272158A9C6DE79A4AAC5C28913900613B6DB7E166E81AB7B9C66895
          B7130989CAADBB2669CA8BC09C03ED2FDF5653218A1622BC929FBA7C76ED87DE
          8E5B6FBA2F3A13A669DDEE3A7398E698236EAFC14E241185CCB61B6F862C175D
          A1B9E35E9C71D00D97BB1DCB134F1DEC85DCC412DB019202F582209EC8220A26
          8E3F3E0AE59938C31875D4C9E689BD00182110528C7821082248D9038495D1C8
          E61A4ACF50BE7CF3A3C8E28920F602D5496E3F630081C58C3943FE447098837B
          0FF23D45195A1C4386A9A4B00D56F0EA1FB6A8CC3FF2C18A04ED2608CA3ACA05
          AA6594D62CA434CC32D642AC35A7FF94D4243754A39AB644281C747D86024EA0
          031554A8020304000204C8800FD290863180A115379B9734BA910A0C10404E32
          584634FA250C61A8281E7F004003925282548CC347FDEA17354421018268A241
          2982503810318173C90016E60106319CC68C7A5C2135CDF0063034040CED7403
          08028840823A500B740C6318DB19063640510100044002A2E8063004C9465F9C
          4315FB03C020CEC1C69C1D2360161B081EB4811F68E48C18DD18C24014201010
          7A1025AB8181E41A328713840222C60A854B60B01A2E54225A8928DB134EB00A
          5C3C612068AB44102A91CA0CAA446C41B880E96C273C537A4034540A02204251
          9BD990D29417C8A04320E79055A8FF669900E0024C3C9008575E000630580517
          A2B5916B9CE00495A8040C82104E00783394B604002E75C9CBB405819B27B800
          ED1892B944108B0B5C2065DF7A12AD6F26E21AC3BBA6E952591256F6139B0025
          D6500E7ACF7C326E9EC36B873801209A6A728D955EE3C2402AF1CF76FE24114F
          B866347977256CFD464E0351842C6441CB2AD5B4A6E000C7F3D6F187FDB54A03
          07D200B006320243D84921E558054D71B18A59307516B3B04520DC1280A44CED
          7DBF410002CCD00C229020074C00442974D109E9458117B44046AC7E51070BB4
          41112890022B58A108526CC3571A709F5166B30ADEA8A91214842042980580B8
          A1C620A6DBDF043BB9D8829C8B00FF9F1100058400873294610C2E6861000430
          011D7C210D5B280325A8C10E68F8423BE77044029408802284C38EC3D050D3C8
          B1843E0E600026A8457602E4B47330490059E5431DB7C3C6363A420C7DF86234
          06090CFB0C231C9904400FA6A15B6AE8AC1B62589909AE138DF4E42C1AE820C4
          720A80815C549218C700868FEA9109066CAB11EEC8D07A4C140E5170F15C5D98
          4689A261DA670CA31BB9A009A81A0842A05C832604119EB3F8F613D2A0AD9DA1
          5885E9422ACC76A0742199FBAB9A44821A0A7B40582ED91DE070718163926628
          0B1E4D3C2D32CD8678209AB664898B537CCCD554843439190A8B310C000DB723
          14A2414D341BE239904C095A1254FF88E764B910605A102711F631E48EAC3820
          03208319D6206D4CA310192B04C649DEF20745F3402F1356717D7B13D5061C01
          18B0621DF780739CEDA18E79D4B91DE5A0CA3C56F104BD00A0814911C006CE10
          8BB8444521FDD8479C156D0F7B74E20416C8565EFBA82D04EF8114B838051346
          718D3390A0128F78042FFC87D65F302111DF78072B6670022904A10DB2C81529
          A6579A9C806437B506AC05F9325821C333351DF4E006190BC2956D52019B9D6C
          1ACAE0062048400007384002560085CA52210F07A34677DCD10701D816007670
          4777A2115B68A0A3064D02C010B0316E0DCD081D71180802D24D8E8D593267E7
          E8063AD011484BDAC71BCB60C140FF8620DC003D2340DD680522E2D08756004D
          3D392B771700C09C16784343E7550F3BF0D0470164E21C0392AF891C61073B64
          021BE1488F83A4D1DF7080225A7E66EC9570F1E339D0046B27109C9BC6442529
          0BAE1D99C3B943423A41D3D1041089634848D5E4A6A09F394C0A6131E3C21C65
          63F17528BCABF1079FD03A1DBFA4E919E19BCFF75913DE792E73D740F30759B2
          F3DDA5DD73A70BBB42BE3EC18AFC15D7192472DAD3160A9AB064A544592CA806
          024D3DD4C1F08747FC24AC421575AC8314882C880648718F3B5F251D98A8831A
          10BFF9266C60205395F467AA0A80E939C010E0A8C62FAA318A0D2C061CCA80FD
          2F643F8A52D82333F9E8852214B1FF8D77F0FE1B9D80F4ADDB2EFC33274BD7CB
          6A070E0652D8822076208A1D76F48DED0003489B0CC671831338509D041840B2
          6E480315B6400961506319E830E3670C70898F639169B9F8C0B912D485780043
          40BEE8C6C48C40FA0B08000397083741DA0E0171AE65480568102462F005FB60
          0F0C00000130815C702D3B6286EDE8867008077A4087FCE8AE8EC18621589925
          A80707C9191FE906DADA16442099FBCB1977380774888778488556582E410A87
          4620880123B03281B176FA26182016618A3A5B52300AFBB99788BA239C88BE09
          85973B012E40BAB7D339770242915931B1D3B2AEE91290B83215CBC2B4412417
          73309FCB9C24BC8627109EB83313FFB273BB9AC81C90F0801FF4B0315CC2D938
          3B34B427C84942B5E3430B9A92BC1B8AC8F0002EF8B2287BBA9D602C011B8827
          C004412884428084425884472C8453880AC65B074578B98270804898B3C5BB86
          5178044A244548348383F88D8368AF11B29566C8146348020B800470E0054848
          0241700563D0C57DC8955CC98C5FCC876FF88639C081209037BEC035E28B32E3
          83BA5D4BBE45640878C21ABE793E0D8ABE6B34363F6380E1A8023A1817377081
          0540170690B62F900315A2835778C116692FF272876EE8066FC0C070D0075898
          80EE3B1049D0877038877E94917A88867B41906D0C014EA08770302F62602E68
          70876958023BD8C779C4407AB884FF8B399738D8C7D71A060464AE7E443F3B38
          C879EC067770071B589945D0877118877E3C8771A8077468916D49815C0048EE
          121085F40E7AE0841BC885909C477DC0C16B5C1390283231113B2E6C0732BB30
          24249321E3B1B6130DB5E182FD1132256CBB1CC3C22B6C08AA580DDD813A329B
          C37212B2AC539C80C29A76E83AA86BCA68F4C23DB44A435CCAB8844BADBC4AB9
          2442A89B12B61BA52DEBCAA2203340F41A5BF9C2B9EC9DC5FA8D04C101B0D807
          75B807466334CA5B08385384FD69A001DBA66FB88774A8B33A4BB4384BB47DD0
          85174045AB3208E1398C8148900D58057858875960822430065CD08311389542
          88054840856FE0077EE8455DE9C5FFDF03846630064868821F6882404003C813
          A985302C5AB34666444B6754BE9262CE81D888E90CB66BBCC6C34C1003C80024
          80832A480338D08109184803E0002450362518835710050C308008000010D084
          54B0CFFB04855BE083EA38900A9004553085FBCC855610054770B604210068FB
          8041280674204992448769E0841610003EA8050035850C35055880375031000C
          E8836988C11125C973880651280201E8820BC5D00C0585806B8007580455B04F
          0DDD504D008124620001A88154D0B707855074E05009F80055685153000558A8
          15A1DC89A75389762016A4C34B87F03030714AB93333A26B1B33CB09B413BB90
          F24A13C352299526B15326A45408FF0E4BD320884323E4C3AE219629954B62E1
          3AC1714BC00433B944BBB50C9C3A94CB69821C3A7588AC43D3C01426C0244BB2
          FC3BA0602C6D019513F80352400552E8844F20055228854C2D05525004228896
          047100AAA2AA04F18026E8844ED0D44D3D55543D55434016F1E08D1378AA2778
          811770000BD80040200578E0075D980552780104C8815020013328851C380122
          980348D8147870567B58877550075E7085AB781E70C80678E80C83C08DBE5A08
          5F638DC03A88C11A08DC00A66BB0B56AD432ED1C366F792C6D49001D70832AA8
          0237400273C9AAC8BA0130C80315A2021110C7E0B9800BA8808235D84779D700
          A8000A6058866D813000D873A12AFF25120F0778812EE8838C1D843890818B69
          A78135D89075D703310019B8023E40593E18843E088318304F016800820DD982
          EDB6A4F08082C5000C985902180008808003C1802540D94148D93818820E3890
          4799599AD54EA0281C2A598976F8AB6C5208AA905386200D0F681D7E12CC34F5
          9A0B584B18A05AAAB51D2B5CC21390888342B3A97D1629F5D286080289C027B6
          21A5B6119641E5CB9FB8862E0300ACF909AE554A2BE95B2DCBCAB72C3B3734B3
          6B0053E6F4433FCD53B43C4B50729DAEF59AC19C5BDA085B36940D2B5C0562F1
          3BBD033CC6B2ADAAD22C01B0805B3DDD56495DF669AFACA2B401B38047791406
          2858B7B080E013301DBCAAA1FA86FF7DC0296308854A28855800842C90057EF8
          0654088439C881117000266886B5508C1CA80470A80433F883A7E2055EE0066E
          000CC0C0055440034F3108A54CCAD2384B85D8C4703D3EBD7AC6C15B3A7255D7
          0F62D7C572D784752100903628488371210315809407008003289834588332F8
          02210881A32108582D080510A19521591E70031AC8807351A2D1E50BC1E30BC8
          92E09519088B31806E1B80A350A2976A606E6980DF4161A3B85F07AEDFAAD909
          9558A539501FC3B9895522441F73890B089DBAA15C908A9620A88890D261616A
          C213A839B2F500D598CA4384086F52A6BE1D8A1C9E831D76089AA04218889634
          C5271B86010DB332D0011D2BB989FF3139A90B002817FB095B3A8175D22822CE
          288632943966E3760A935008295B291D97506230E3022BE19B385C85331C6380
          E2613C16643F1E0A9A08E490BA631F560823BE62D39983FD3901D3C1852F7E82
          30F69A33E6828A00894C1E313E5E0D224E0497508D34334CDBFA9DD21500013E
          88D29BB401D341D9253DD4EC0F095E61DB92B4489B9A17C085ABB88A76A886AB
          C0040B780158CB075D4005545003122001638885117881503805EB7D8111D800
          48A89464006770460657D0E3A3881B6A3C8A6842E783A8A066443EECD4BB6BE0
          AB8280BE18869395796102F0D917F24E24708376210320C88004F01601480015
          B082197203308801F80C0F771D21FF6DB9DF0688000A08833C808215480001D8
          A4541C4D11BA2AF7F96001F88D95090057B62D02008140A08987CEE7FB958240
          C85198CBE5CF73801990696D498A0680617695398A705BA066939E7802A4136A
          2A899D8B40D7D67996A3060AB3111DBB8181B1218DAC44D7696908B3C188AB5E
          1DC0F19299539399F36A99D06A8BE06A8E806A94586A3691A661A3AA01288008
          88E93FF883F5F10CD2438340D0EB20582D2BD33D4338144340943FD03DBC9293
          41A4EB3FB81190FEE88198E67BC00A6EB0066B40AB6A50030408825C4185D313
          0C26E00541D02AD48304AF32040B4802D8DB8570FE0557188526A8E98320DB76
          50CE83409BBD3D8A768ECE777E8DFF8600D7ECB4E76B3C90088800A590801B60
          036593832FA001F3B4980C30EE3C184F28B0E0119660DF10A1949636F04B0321
          70C08170576056C42789E8F176A974F387A8F9E00318E90AB00442809458CEE5
          1D20840A381023D806930CEE03118F0F6E5AB6F6EF86C8A5AAFCEF01B7C6C479
          3B0247F00457F005D74E7745057B803334400A0068827570D67DF8AB02489048
          E08768D5CC79781E469385E0738026483475D807450080E1666C82F0E8170007
          C82E07C94E066B480665888526E8C47F988551803D65F80565288424A85E48D8
          E6200882479B046E086757C004239F35A348468420DBDE360821BBA0F725080A
          6B4E195ED7DF662C83EE3E170A8EFFE1500239D0022D800321D8BE9079801090
          213AA0833780821B80CF7301E190F6D96D9C0032D0022CC8832B1060B790D8CF
          1859FEDE8D0CF6E511FA60E1B60171E8820458024B00854530491620844FE083
          2EA80116C8841E90F44CF8044580810A00857E588438F8001320849C8D034DD0
          8436E8800718024BB0F51D60E0E85B7036F91AF3DD75B63E700FE0D35F27F662
          37768FB8C6060201578C0AE56300DB62804E50079C2A8752B800AAD20059D887
          79B833AA808A75B08748700B00B08052500789508752906560E60B0B081DA830
          07D9FB055A50865940852CC0015D680657400670B6065728844AB08766E80443
          40055B40854A680248F01F578885FF52909EE9F1E8D2341C8880ED6FCDF28558
          DF83D80897D8ED492ECD7A06F3C5921AA538170AD8D779350E1DC8008E3EB609
          70012598A134608329008210A80EEA060057969A3D1F181D880E6BBB013C3F90
          4DFAEE5D3E1084E869EBF660934E451B90872568017CD0865BC0875B300049F0
          875BB8857E188416E8873888017A48854B888741F8806050FB60680123C00713
          88837ED08660F0873898005508864C100750A022263DF69D38C375FAFB35E19B
          D940437D1AFCC457FC04675707F80170800A5CF00001230023B08AABA01410F8
          0C1050844EA88453C033AAA88444B0045F7B8273276663205F38718011E00248
          E8048A1805DA438548D803559905FF5EF07764D85E78D88CDD84D66640275D8C
          854840031498B4162FCD63BA064008021CC0012E401B5C8067767E02DA392964
          29081CD83ADB91A582A8086821080FC08163F2FEEA1FF9C00395039180127002
          37A8AC32B0029559FFCD72812900683860032110012E2AF992078800110418B8
          B166CB9631603E0810C080810200062602A848E022818A1A015CDCE87163C390
          02020468C000000C7143C2E8BB2161D0340CC1384D58816E500B7C7162A01325
          6A991D0171B0A5A060E08AB8108DA685A0D067C9844BB732DD9AD6E123D6AC1F
          DB71EDEAF52BD8B062C7922D6BF62CDAB46A139DF000E304175C6AE7D2AD6BF7
          2EDEBC75B5F2CD7A52CDBC6BED42FF3900F09041A7C0CAAA996B478423010792
          CFA4E38A493266001648DDBB86AC5ABA6C3FFAF275B061448E1C2F82B4BD8002
          4D2763C892D136668F1FBF7FF6667D6B562A87A0557F826C40008024F200A43D
          005A05F65AA520A4C786DAFAB5BA461CED006D9C339634F8F0E2B38AAC608002
          902F70AAA471E32343C3870626D02023470B1C385F90B8082141A400171550C0
          01092470441954209407100918C60002084C6440450A288011561D8DA7514832
          6853C415F80041012231C1024B0C40D0D3470CF1C41195288EE4020B06616013
          C3203D14A1CD0799E4F2C10783145183368DC471CB2D1F6CC8975E4D3AF92494
          514A3925955556B9A4560D001049FF60F324E200012705B14E3BD7D411CB35F7
          EC61D84680DCA38E3A866C741211EBACD38C20BCA4B30E174B0EF0675F0E6451
          0D37B429734A259D34338B1E829C524D281B58600196599D8003A61E54BA6945
          385CC029A8A162255204114C14021279A451851C55C430C1010D0C4040021CE8
          C05E1A64C0E1061847DC10C204124C38D1020BB800C518086D51051B4A0260A1
          64143DABC000CA7D841C9622EDE04F1729E0A3CD34F8A862001EE8D0330C3A76
          D4E04F1C296893CB25E88C7B853EDAF8B3C410FEB0D0453FD804C36D0DE236A2
          0D8FA2566425C2092BBC30C30D3B4C97C10504F04029E9EC890647003850C93D
          E0C442825CF7445298460F7462E7FF3A7354D480720EA0626728249C02A72199
          8157C09F39577492465A02C0853AC8EC920C37A330D144259008A20C2FC6C4BC
          33CF064B3D35D55593476A041719B0C00D5FA4A185166F40B14202184D94C1B1
          5FB84106DB6458A1841034AC30B7082EF8A07615CA6E91470C068479D2031818
          101F03D5568D110884D42041179948B2080C0F2C91C915574CD3480573C02041
          1C8B780E83001EF061C91F15C060890718E02189247B6080C11F961082071F57
          19FC30EEB9EBBE3BEFBD77252A72231863713636B0490438F3CCA3860098BC89
          CA062B6B360B9CEAFC403800446493CD3ACC8772CF3D9F58D090B57C2587ED47
          3CBF20DB6CBBFC12CB19A398A38CFF32EF77123DFA56EBBF3FFF9C867418030C
          C0011FA4E13E69488310389080F84864022938827AD2A0A0355030576D234319
          CA50052C78A18369B841020EA3B11DD84058062815691E8295F3B130000F0190
          482C218F4670021F5DD0C84904804300E8F038C8891A0F070220A9F9AE88463C
          221293F89D509144003FB84639CAD10C1084A412F348072E46F00040A8031CCD
          18C14646D00C755C431D26D888053AC1955590E00195B0D817C9079E16B2AC7C
          1AD9402C0A65286530417EB4F9CC9A18401220F6AF90863CA447426221053464
          012B70C201C720491D70C06F04B090001210021D40410E725803D8B020CA0C96
          41591CF40216E000C2031CC03002FF18411CAEA0C009F90505548461480850AA
          0060E4222C14C9614E40084D68620E15D0C8451C700210F8902439CB19005FD8
          100DA0200244542236B3A9CD6D5289894D544339B8618E52500A003F00473BB0
          28084184229DD6AB90027030462C92A08700084236A2680C3DE8211616B39E1C
          39153592000010E548C62E90810C5E3C4219D64886355C118B26B0694E1A391F
          2233AA51AB31A02113B88118D890AC347C81061970100F09B2000ED80D57075C
          551514B4AC0D8AD20D2B9808461AD2833E38E106277D404376080010D862130F
          00C05179383E165C4500420C4952FDA2C2860C2EA81AA9802C5091B58DD4B17C
          2ADC481BDE31836B72B3AC663D2BFF5AC132B547CC831BED30444812B18F6AA4
          097C9D4913C634F28475240F13D1AB88033AD19976A8631FD54B9319EC2935E5
          BC8017D5D8454291C10D3D26E31795F86B453D82D18D72B6B3A21240068EC0B6
          0CA6010A2635D0094B65800464600542000318DCE086036670B4ED1102051CC2
          8001F19003B1750312545055187AA0750FE8C0036060830A080006C1A85D0704
          2001180C4106181040073A00031854200220B080729D8ADD1EF4E00313A9800C
          76C0020948800F7C606F7A97FB800A64D7062C98100876B083E8F2C11F3B206B
          5A032CE001FB4E6A16280538C0A18E2C34447B09F66233229CE07B54A2302799
          43C728BC11227C034EE0D04584B7FF07A791E9CF015CB8863268411B6E3C3419
          AEE04513228400827AB6C636DED0220900200530A0400B108112D84685329496
          069504202FA58B8112DC40085070031CC8A036374CC105B98508B50610C00920
          61557000430B7089DD4FE0E1039F504536E451BB4FE8A318C590440524218E62
          6863102F518536E4910513A80214E29007211EB003374FE3163DA88026F0810F
          71F061028D68C404F8200E4567A2034308862AE2118F2508A00BC10886364031
          8138E0C378B72330AA53AD6A846D2A391519C137F6010F788C26029BB007F8F4
          F0825D07618CF740C50358C68048EC037C8104C0053A31EB7DCC61042F18C10F
          74B10F7BC8C202249BDA491C0089FF74CC06A2E640062D626188E24488C6373E
          37BA37F410AD39D2096BAB02ABD2E003112CA021167A0050A93A810C70A0DF1C
          C8C0041608208C24C005182C0319C09081130EB22120D046263E408E6274C1CF
          325882363811871AA4801C9C008228BC518244E3E116AA68813860D1854FC8E3
          0345C88523EC800E3CE484134B50852A3E60F20C04E3165740443F8A50847E80
          A20BC5A84502E2300D3B5C821E40E8023EFE7BEA5553BDEA568758A5F2778248
          70DD1060D48022B81E093002760F895284064812813954A2ED38700049401089
          4E4462DC1AB1C01FDAAE880B10D2C0419885328426D96AC4223A173577BA13AF
          F8AC20476B689B021C34E8C92A20FF6105131033E671D98006244005921CB21B
          1A74494C62F7169708419D01B00471C8C000C50883015250037298E2129E4845
          092C31AE16F400E57850BD365AB0845CF8C4454588470C00F001A8C002141FC0
          C60D63808F2BF4401B3200C0208A818141D44214AD40C70D58626A515DBDFCE6
          3FBF5738E56ACCB07FF316E5196630A4B1F97FA430ECBFBF64A6F6C38AE40013
          4C8BC529948221E0C0CEB8DAE21D20027E4443B0960B58C1BBE90A1C40810B9C
          9481100E211D462F5D4403108001A80019500115608142C0870A15C609405C09
          884326188011C8030C608036680228C0420DA8E0155C422A60C027B082B00080
          0CF40321088538B4002790C315F4FF013EE0410DF44326C401CE7D4031A84207
          64432D84C120F403BEF403E8484230C0A02A14C125E8430F909AD4911FFA9D21
          1AA69AFAED1F603980530D52B625C7B595840BD15F459484CF54C4A7D45FD5FC
          10CF900020004213BC80A414A001262022226048CCC70D4C011BC0541AD00119
          1CC10A50A0052E9202341E464000046492C161014250811BF48D480C55304842
          07888324088014BC03E8C89038C4410510823604833834820058022B309700D8
          8038040200A0C1379800C669039EE1C1035882382C231E4CC02AE08204E0813C
          4CA3141A8138C0000028822DCCA238609A4A74013F8C5FA8A4213996E359AD61
          F95CDB71B89F21E68F61B4507200FF1000745500A8A3FE25471E32DE2126223F
          A25B72E8DBB1E48728ADC10141810E3485C0D91B265E48060A0097A581287941
          42204142C6070CB0407251915B0C4407A8574354800D8424739DC0098484E978
          800080800D980A0B0C010BC00015998E7D4DC44B0AC003B040484697761D1308
          A040E884A409B00006E497354D9D391E25521A91FEB08C5091063C3EA5B5F08C
          3B820A72D4D1059EC466F5A356DED8F9680D6BA94097A501291119194C810EA8
          C0490D0BE64D80C1918116E80D18E4D692840448908662F15078DCE52125255F
          F6A5EEA41BDC05C09F98DB53165256DEE1616EA562669448B0D0801048816480
          0A00811594C11A88121690A51520FF810EAC00072C808184A6814C40081C811B
          C0DB5B2A0B1B848055D965298A0A46B01078881980F9A56DDE663725DE54D6D8
          6E2EA66FD6D86B5ED4631680D6AC96AD58417E48D258EAC7174C0112080110DC
          80740A011248922885120761811BA44063229E02B6A637C1A38DE1267996E793
          285E6FFEA67AAEA7219DCF22260005C400127C01DB60A62845D24BE527087A01
          D868011680601980016B86846CB227A89827822628D6A55B7A1AA8833EE81C79
          270EFD52046CDE014C004B2167E4250808DAA78776107FFA2708A6415C76E73E
          42E87828A88AAEE812A1A88BBE288C7AC49F14A703F180135841DB6490DE280B
          88A2121548D2280E4E83C6E874B0F1A8911A299126A992B267CE5CC4224A0007
          DC0012400119BC94248D81878AA024B1C10D2C80016059442C698A1E29992AA8
          989E299A22E23F2EE284ACD40AE800124C8123B2019DE6C7AEB0C11450226AA5
          E98694A99F9A279F06AAA0262055AD167C7E400AC4C00D0001A346A7674EC084
          8C84840EEA46FCA9A5DE26A566AAA6765672E8D2701184685620800CE9A05EAA
          A9F2E5A6A6AAAAF64F26624BE6816733AD6AA59E2AAD96A3ACDE2AAEE6EAB9D5
          2AAFA2A1AEFE2AB006EBFEF42AB19A9FB01E2BB2266B9F162BB3529DB23E2BB4
          462B00342BB5AAA1B45E2BB6E66AB56EAB80656BB6722BB886ABB88E2BB50604
          003B}
        mmHeight = 21960
        mmLeft = 265
        mmTop = 0
        mmWidth = 196850
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'NOME_EMPRESA'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 12435
        mmTop = 25400
        mmWidth = 156898
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Consignat'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 66940
        mmWidth = 35190
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'NOME_EMPRESA'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 66940
        mmWidth = 156898
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Deposit'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 118798
        mmWidth = 35190
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'NM_DESCARGA'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 118798
        mmWidth = 156898
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'Data do HBL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 85461
        mmWidth = 35190
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'DT_CONHECIMENTO'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 85461
        mmWidth = 156898
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Cubagem:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 100277
        mmWidth = 35190
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'calcDims'
        DataPipeline = ppPrevChegIM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevChegIM'
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 100277
        mmWidth = 156898
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDesigner: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pp_pre_alerta
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 863
    Top = 600
  end
  object qryPrevChegIM: TQuery
    AutoCalcFields = False
    OnCalcFields = qryPrevChegIMCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT (SELECT EN.NM_EMPRESA FROM TEMPRESA_NAC EN (NOLOCK) WHERE' +
        ' EN.CD_EMPRESA = P.CD_CLIENTE) AS NOME_EMPRESA,'
      '       SUBSTRING(P.NR_PROCESSO, 5, 14) AS NR_PROCESSO,'
      
        '       (SELECT EMB.NM_EMBARCACAO FROM TEMBARCACAO EMB (NOLOCK) W' +
        'HERE EMB.CD_EMBARCACAO = M.CD_VEICULO) AS NOME_NAVIO,'
      '       M.NR_VIAGEM_ARMADOR AS NR_VIAGEM,'
      
        '       (SELECT ES.NM_EMPRESA FROM TEMPRESA_EST ES (NOLOCK) WHERE' +
        ' ES.CD_EMPRESA = P.CD_EMP_EST) AS NOME_SHIPER,'
      
        '       (SELECT P1.NM_PORTO FROM TPORTO P1 (NOLOCK) WHERE P1.CD_P' +
        'ORTO = M.CD_ORIGEM) AS LOCAL_ORIGEM,'
      
        '       (SELECT P2.NM_PORTO FROM TPORTO P2 (NOLOCK) WHERE P2.CD_P' +
        'ORTO = M.CD_DESTINO) AS LOCAL_DESTINO,'
      '       M.DT_PREV_CHEGADA, M.DT_MASTER,'
      '       H.NR_HOUSE,'
      '       M.NR_MASTER,'
      '       P.DT_CONHECIMENTO,'
      
        '       (SELECT TI.DESCRICAO FROM TTRANSPORTADOR_ITL TI (NOLOCK) ' +
        'WHERE TI.CODIGO = M.CD_ARMADOR) AS ARMADOR,'
      
        '       (SELECT A.NM_ARMAZEM  FROM TARMAZEM A  (NOLOCK) WHERE A.C' +
        'D_ARMAZEM = M.CD_ARMAZEM_ATRACACAO) AS NM_ATRACACAO,'
      
        '       (SELECT A2.NM_ARMAZEM FROM TARMAZEM A2 (NOLOCK) WHERE A2.' +
        'CD_ARMAZEM = M.CD_ARMAZEM_DESCARGA) AS NM_DESCARGA'
      'FROM TPROCESSO P (NOLOCK)'
      'INNER JOIN THOUSE H (NOLOCK) ON H.NR_PROCESSO = P.NR_PROCESSO'
      'INNER JOIN TMASTER M (NOLOCK) ON M.CD_MASTER = H.CD_MASTER'
      'WHERE P.NR_PROCESSO = :nr_processo')
    Left = 927
    Top = 553
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_processo'
        ParamType = ptInput
      end>
    object qryPrevChegIMNOME_EMPRESA: TStringField
      FieldName = 'NOME_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qryPrevChegIMNOME_NAVIO: TStringField
      FieldName = 'NOME_NAVIO'
      FixedChar = True
      Size = 40
    end
    object qryPrevChegIMNOME_SHIPER: TStringField
      FieldName = 'NOME_SHIPER'
      FixedChar = True
      Size = 60
    end
    object qryPrevChegIMLOCAL_ORIGEM: TStringField
      FieldName = 'LOCAL_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qryPrevChegIMLOCAL_DESTINO: TStringField
      FieldName = 'LOCAL_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qryPrevChegIMDT_PREV_CHEGADA: TDateTimeField
      FieldName = 'DT_PREV_CHEGADA'
    end
    object qryPrevChegIMNR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      FixedChar = True
      Size = 15
    end
    object qryPrevChegIMNR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 25
    end
    object qryPrevChegIMARMADOR: TStringField
      FieldName = 'ARMADOR'
      FixedChar = True
      Size = 60
    end
    object qryPrevChegIMNM_ATRACACAO: TStringField
      FieldName = 'NM_ATRACACAO'
      FixedChar = True
      Size = 50
    end
    object qryPrevChegIMcalcCNTR: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCNTR'
      Size = 255
      Calculated = True
    end
    object qryPrevChegIMcalcPeso: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcPeso'
      Size = 50
      Calculated = True
    end
    object qryPrevChegIMcalcVolume: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcVolume'
      Size = 255
      Calculated = True
    end
    object qryPrevChegIMDT_MASTER: TDateTimeField
      FieldName = 'DT_MASTER'
    end
    object qryPrevChegIMNM_DESCARGA: TStringField
      FieldName = 'NM_DESCARGA'
      FixedChar = True
      Size = 50
    end
    object qryPrevChegIMNR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      FixedChar = True
      Size = 15
    end
    object qryPrevChegIMDT_CONHECIMENTO: TDateTimeField
      FieldName = 'DT_CONHECIMENTO'
    end
    object qryPrevChegIMcalcDims: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'calcDims'
      Size = 15
      Calculated = True
    end
    object qryPrevChegIMNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 14
    end
  end
  object dsPrevChegIM: TDataSource
    DataSet = qryPrevChegIM
    Left = 895
    Top = 503
  end
  object ppPrevChegIM: TppDBPipeline
    DataSource = dsPrevChegIM
    UserName = '_BDEPrevCheg'
    Left = 863
    Top = 553
    object ppPrevChegIMppField1: TppField
      FieldAlias = 'NOME_EMPRESA'
      FieldName = 'NOME_EMPRESA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppPrevChegIMppField3: TppField
      FieldAlias = 'NOME_NAVIO'
      FieldName = 'NOME_NAVIO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 1
    end
    object ppPrevChegIMppField4: TppField
      FieldAlias = 'NOME_SHIPER'
      FieldName = 'NOME_SHIPER'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppPrevChegIMppField5: TppField
      FieldAlias = 'LOCAL_ORIGEM'
      FieldName = 'LOCAL_ORIGEM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppPrevChegIMppField6: TppField
      FieldAlias = 'LOCAL_DESTINO'
      FieldName = 'LOCAL_DESTINO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppPrevChegIMppField7: TppField
      FieldAlias = 'DT_PREV_CHEGADA'
      FieldName = 'DT_PREV_CHEGADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppPrevChegIMppField8: TppField
      FieldAlias = 'NR_HOUSE'
      FieldName = 'NR_HOUSE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object ppPrevChegIMppField9: TppField
      FieldAlias = 'NR_MASTER'
      FieldName = 'NR_MASTER'
      FieldLength = 25
      DisplayWidth = 25
      Position = 7
    end
    object ppPrevChegIMppField10: TppField
      FieldAlias = 'ARMADOR'
      FieldName = 'ARMADOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object ppPrevChegIMppField11: TppField
      FieldAlias = 'NM_ATRACACAO'
      FieldName = 'NM_ATRACACAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 9
    end
    object ppPrevChegIMppField12: TppField
      FieldAlias = 'calcCNTR'
      FieldName = 'calcCNTR'
      FieldLength = 255
      DisplayWidth = 255
      Position = 10
    end
    object ppPrevChegIMppField13: TppField
      FieldAlias = 'calcPeso'
      FieldName = 'calcPeso'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object ppPrevChegIMppField14: TppField
      FieldAlias = 'calcVolume'
      FieldName = 'calcVolume'
      FieldLength = 255
      DisplayWidth = 255
      Position = 12
    end
    object ppPrevChegIMppField15: TppField
      FieldAlias = 'DT_MASTER'
      FieldName = 'DT_MASTER'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object ppPrevChegIMppField16: TppField
      FieldAlias = 'NM_DESCARGA'
      FieldName = 'NM_DESCARGA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 14
    end
    object ppPrevChegIMppField17: TppField
      FieldAlias = 'NR_VIAGEM'
      FieldName = 'NR_VIAGEM'
      FieldLength = 15
      DisplayWidth = 15
      Position = 15
    end
    object ppPrevChegIMppField18: TppField
      FieldAlias = 'DT_CONHECIMENTO'
      FieldName = 'DT_CONHECIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 16
    end
    object ppPrevChegIMppField19: TppField
      FieldAlias = 'calcDims'
      FieldName = 'calcDims'
      FieldLength = 50
      DisplayWidth = 50
      Position = 17
    end
    object ppPrevChegIMppField2: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 14
      DisplayWidth = 14
      Position = 18
    end
  end
end
