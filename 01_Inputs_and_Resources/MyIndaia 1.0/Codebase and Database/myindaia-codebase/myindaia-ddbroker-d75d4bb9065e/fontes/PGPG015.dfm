object frm_pesq_pagto: Tfrm_pesq_pagto
  Left = 307
  Top = 202
  Width = 750
  Height = 550
  Caption = 'Pesquisa de Pagamentos'
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
  object bvl1: TBevel
    Left = 0
    Top = 49
    Width = 742
    Height = 5
    Align = alTop
    Shape = bsSpacer
  end
  object pnl_pesq_pagto: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 688
      Top = 2
      Width = 45
      Height = 45
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
    object btn_pesquisa: TSpeedButton
      Left = 9
      Top = 2
      Width = 45
      Height = 45
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
      OnClick = btn_pesquisaClick
    end
    object shpNav: TShape
      Left = 563
      Top = 11
      Width = 102
      Height = 27
      Pen.Color = clGray
    end
    object dbnvg: TDBNavigator
      Left = 564
      Top = 12
      Width = 100
      Height = 25
      DataSource = datm_pesq_pagto.ds_pesq
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
    end
  end
  object pgctrl_pesq_pagto: TPageControl
    Left = 0
    Top = 54
    Width = 742
    Height = 450
    ActivePage = ts_filtros
    Align = alClient
    HotTrack = True
    TabOrder = 1
    OnChange = pgctrl_pesq_pagtoChange
    OnChanging = pgctrl_pesq_pagtoChanging
    object ts_filtros: TTabSheet
      Caption = 'Filtros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object lbl_item: TLabel
        Left = 2
        Top = 180
        Width = 25
        Height = 13
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item: TSpeedButton
        Left = 348
        Top = 193
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
        OnClick = btn_co_itemClick
      end
      object lbl_favorecido: TLabel
        Left = 2
        Top = 218
        Width = 64
        Height = 13
        Caption = 'Favorecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_favorecido: TSpeedButton
        Left = 348
        Top = 232
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
        OnClick = btn_co_favorecidoClick
      end
      object btn_co_usuario: TSpeedButton
        Left = 348
        Top = 157
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
        OnClick = btn_co_usuarioClick
      end
      object lbl_dt_inicio: TLabel
        Left = 2
        Top = 1
        Width = 34
        Height = 13
        Caption = 'In'#237'cio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dt_termino: TLabel
        Left = 102
        Top = 1
        Width = 46
        Height = 13
        Caption = 'T'#233'rmino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_usuario: TLabel
        Left = 2
        Top = 144
        Width = 44
        Height = 13
        Caption = 'Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_nr_processo: TLabel
        Left = 2
        Top = 107
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
      object lbl_unid_neg: TLabel
        Left = 2
        Top = 37
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
        Left = 348
        Top = 49
        Width = 25
        Height = 23
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
        OnClick = btn_co_unid_negClick
      end
      object lbl_produto: TLabel
        Left = 2
        Top = 72
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
      object btn_co_produto: TSpeedButton
        Left = 348
        Top = 84
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
        OnClick = btn_co_produtoClick
      end
      object lbl_status: TLabel
        Left = 2
        Top = 330
        Width = 122
        Height = 13
        Alignment = taRightJustify
        Caption = 'Status da Solicita'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_tp_destino: TLabel
        Left = 2
        Top = 366
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo de Destino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_vl_pagto: TLabel
        Left = 2
        Top = 292
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
      object lbl_nr_docto: TLabel
        Left = 112
        Top = 292
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'N'#186' Docto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_processo: TSpeedButton
        Left = 110
        Top = 120
        Width = 25
        Height = 23
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
      object lbl_calculo: TLabel
        Left = 2
        Top = 255
        Width = 90
        Height = 13
        Caption = 'Tipo de C'#225'lculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_calculo: TSpeedButton
        Left = 348
        Top = 269
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
        OnClick = btn_co_calculoClick
      end
      object msk_cd_item: TMaskEdit
        Left = 2
        Top = 194
        Width = 46
        Height = 21
        EditMask = '!999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 6
        OnChange = btn_co_itemClick
        OnExit = msk_cd_itemExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_item: TEdit
        Left = 50
        Top = 194
        Width = 295
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
        TabOrder = 13
      end
      object msk_cd_favorecido: TMaskEdit
        Left = 2
        Top = 232
        Width = 46
        Height = 21
        EditMask = '!99999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 7
        OnChange = btn_co_favorecidoClick
        OnExit = msk_cd_favorecidoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_favorecido: TEdit
        Left = 50
        Top = 232
        Width = 295
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
        TabOrder = 14
      end
      object msk_dt_inicio: TMaskEdit
        Left = 2
        Top = 15
        Width = 90
        Height = 21
        EditMask = '!99/99/9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Text = '  /  /    '
        OnExit = msk_dt_inicioExit
      end
      object msk_dt_termino: TMaskEdit
        Left = 102
        Top = 15
        Width = 92
        Height = 21
        EditMask = '!99/99/9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Text = '  /  /    '
        OnEnter = msk_dt_terminoEnter
        OnExit = msk_dt_terminoExit
      end
      object edt_nm_usuario: TEdit
        Left = 50
        Top = 158
        Width = 295
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
      object msk_nr_processo: TMaskEdit
        Left = 2
        Top = 121
        Width = 106
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnExit = msk_nr_processoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_unid_neg: TMaskEdit
        Left = 2
        Top = 50
        Width = 46
        Height = 21
        EditMask = '!99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 2
        ParentFont = False
        TabOrder = 2
        OnChange = btn_co_unid_negClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_unid_neg: TEdit
        Left = 50
        Top = 50
        Width = 295
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
        TabOrder = 16
      end
      object msk_cd_produto: TMaskEdit
        Left = 2
        Top = 85
        Width = 46
        Height = 21
        EditMask = '!99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 2
        ParentFont = False
        TabOrder = 3
        OnChange = btn_co_produtoClick
        OnExit = msk_cd_produtoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_produto: TEdit
        Left = 50
        Top = 85
        Width = 295
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
        TabOrder = 17
      end
      object dblckbox_cd_status: TDBLookupComboBox
        Left = 2
        Top = 344
        Width = 189
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'CODIGO'
        ListField = 'DESCRICAO'
        ListSource = datm_pesq_pagto.ds_status_solic_pagto
        ParentFont = False
        TabOrder = 11
        OnClick = dblckbox_cd_statusClick
      end
      object dblckpbox_tp_destino: TDBLookupComboBox
        Left = 2
        Top = 380
        Width = 189
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'CD_TP_DESTINO'
        ListField = 'NM_TP_DESTINO'
        ListSource = datm_pesq_pagto.ds_tp_destino
        ParentFont = False
        TabOrder = 12
        OnClick = dblckpbox_tp_destinoClick
      end
      object msk_vl_pagto: TMaskEdit
        Left = 2
        Top = 306
        Width = 101
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnExit = msk_vl_pagtoExit
      end
      object msk_nr_docto: TMaskEdit
        Left = 111
        Top = 306
        Width = 101
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object msk_cd_usuario: TMaskEdit
        Left = 2
        Top = 158
        Width = 46
        Height = 21
        EditMask = '9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        TabOrder = 5
        OnChange = btn_co_usuarioClick
        OnExit = msk_cd_usuarioExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_calculo: TMaskEdit
        Left = 2
        Top = 270
        Width = 46
        Height = 21
        EditMask = '!999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 8
        OnChange = btn_co_calculoClick
        OnExit = msk_cd_calculoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_calculo: TEdit
        Left = 50
        Top = 270
        Width = 295
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
        TabOrder = 18
      end
    end
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object dbg_lib_proc: TDBGrid
        Left = 0
        Top = 53
        Width = 734
        Height = 243
        Align = alClient
        DataSource = datm_pesq_pagto.ds_pesq
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CalcNrProcesso'
            Title.Alignment = taCenter
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
            FieldName = 'LookItem'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 330
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_PAGTO'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end>
      end
      object pnl_pagtos: TPanel
        Left = 0
        Top = 296
        Width = 734
        Height = 126
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 6
          Top = 5
          Width = 25
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_item: TLabel
          Left = 320
          Top = 5
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor'
          FocusControl = dbedt_vl_pagto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 468
          Top = 5
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_dt_pagto: TLabel
          Left = 320
          Top = 40
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Pagto'
          FocusControl = dbedt_dt_pagto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_calculo2: TLabel
          Left = 468
          Top = 40
          Width = 90
          Height = 13
          Caption = 'Tipo de C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 6
          Top = 78
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo de Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_usuario_solic: TLabel
          Left = 468
          Top = 78
          Width = 108
          Height = 13
          Caption = 'Usu'#225'rio Solicitante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lnl_nr_docto: TLabel
          Left = 322
          Top = 78
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#186' Docto'
          FocusControl = dbedt_nr_docto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 6
          Top = 40
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
        object dbedt_vl_pagto: TDBEdit
          Left = 320
          Top = 19
          Width = 132
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_PAGTO'
          DataSource = datm_pesq_pagto.ds_pesq
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_nm_item: TDBEdit
          Left = 42
          Top = 19
          Width = 265
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookItem'
          DataSource = datm_pesq_pagto.ds_pesq
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_cd_item: TDBEdit
          Left = 6
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_ITEM'
          DataSource = datm_pesq_pagto.ds_pesq
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_dt_pagto: TDBEdit
          Left = 320
          Top = 55
          Width = 132
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_PAGTO'
          DataSource = datm_pesq_pagto.ds_pesq
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_cd_calculo: TDBEdit
          Left = 468
          Top = 55
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_CALCULO'
          DataSource = datm_pesq_pagto.ds_pesq
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_nm_calculo: TDBEdit
          Left = 504
          Top = 55
          Width = 226
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCalculo'
          DataSource = datm_pesq_pagto.ds_pesq
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_tp_destino: TDBEdit
          Left = 6
          Top = 92
          Width = 300
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookTpDestino'
          DataSource = datm_pesq_pagto.ds_pesq
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_cd_status: TDBEdit
          Left = 468
          Top = 18
          Width = 261
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookStatus'
          DataSource = datm_pesq_pagto.ds_pesq
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_usuario: TDBEdit
          Left = 468
          Top = 92
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_USUARIO_SOLIC'
          DataSource = datm_pesq_pagto.ds_pesq
          MaxLength = 3
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_nm_usuario: TDBEdit
          Left = 504
          Top = 92
          Width = 226
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUsuarioSolic'
          DataSource = datm_pesq_pagto.ds_pesq
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_nr_docto: TDBEdit
          Left = 320
          Top = 92
          Width = 133
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_DOCTO'
          DataSource = datm_pesq_pagto.ds_pesq
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_cd_favorecido: TDBEdit
          Left = 6
          Top = 55
          Width = 44
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_FAVORECIDO'
          DataSource = datm_pesq_pagto.ds_pesq
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_nm_favorecido: TDBEdit
          Left = 52
          Top = 55
          Width = 255
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookFavorecido'
          DataSource = datm_pesq_pagto.ds_pesq
          ReadOnly = True
          TabOrder = 12
        end
      end
      object pnlTop: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 53
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 3
        TabOrder = 2
        object shpColor: TShape
          Left = 3
          Top = 3
          Width = 728
          Height = 47
          Align = alClient
          Pen.Color = clGray
        end
        object Label12: TLabel
          Left = 7
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
          Transparent = True
        end
        object Label13: TLabel
          Left = 319
          Top = 6
          Width = 45
          Height = 13
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 8
          Top = 21
          Width = 40
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'CD_UNID_NEG'
          DataSource = datm_pesq_pagto.ds_pesq
          TabOrder = 0
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 50
          Top = 21
          Width = 260
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'NM_UNID_NEG'
          DataSource = datm_pesq_pagto.ds_pesq
          TabOrder = 1
        end
        object dbedt_cd_produto: TDBEdit
          Left = 319
          Top = 21
          Width = 41
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'CD_PRODUTO'
          DataSource = datm_pesq_pagto.ds_pesq
          TabOrder = 2
        end
        object dbedt_nm_produto: TDBEdit
          Left = 362
          Top = 21
          Width = 260
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'NM_PRODUTO'
          DataSource = datm_pesq_pagto.ds_pesq
          TabOrder = 3
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 540
    Top = 4
    object mi_manut_proc: TMenuItem
      Caption = '&Pesquisar'
      OnClick = btn_pesquisaClick
    end
    object mi_sair: TMenuItem
      Caption = '&Sair'
      OnClick = btn_sairClick
    end
  end
end
