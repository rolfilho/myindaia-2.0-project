object frm_sda_pesq: Tfrm_sda_pesq
  Left = 502
  Top = 252
  Width = 1048
  Height = 574
  Caption = 'SDA - Pesquisa'
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
  object pnl_pesq_pagto: TPanel
    Left = 0
    Top = 0
    Width = 1032
    Height = 49
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 184
      Top = 12
      Width = 25
      Height = 25
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
      Left = 17
      Top = 12
      Width = 25
      Height = 25
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
    object dbnvg: TDBNavigator
      Left = 60
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_sda_pesq.ds_pesq
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
  object pgctrl_pesq_sda: TPageControl
    Left = 0
    Top = 49
    Width = 1032
    Height = 467
    ActivePage = ts_lista
    Align = alClient
    HotTrack = True
    TabOrder = 1
    OnChange = pgctrl_pesq_sdaChange
    OnChanging = pgctrl_pesq_sdaChanging
    object ts_filtros: TTabSheet
      Caption = 'Filtros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object lbl_item: TLabel
        Left = 150
        Top = 41
        Width = 76
        Height = 13
        Caption = 'Despachante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_desp: TSpeedButton
        Left = 428
        Top = 54
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
        OnClick = btn_co_despClick
      end
      object btn_co_distribuidor: TSpeedButton
        Left = 291
        Top = 300
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
        OnClick = btn_co_distribuidorClick
      end
      object lbl_usuario: TLabel
        Left = 6
        Top = 287
        Width = 65
        Height = 13
        Caption = 'Distribuidor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_nr_processo: TLabel
        Left = 5
        Top = 40
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
        Left = 5
        Top = -1
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
        Left = 283
        Top = 11
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
      object lbl_produto: TLabel
        Left = 319
        Top = -1
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
        Left = 593
        Top = 11
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
      object lbl_status: TLabel
        Left = 460
        Top = 42
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
      object lbl_vl_sda: TLabel
        Left = 5
        Top = 100
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
      object btn_co_processo: TSpeedButton
        Left = 118
        Top = 53
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
        OnClick = btn_co_processoClick
      end
      object Bevel1: TBevel
        Left = 5
        Top = 88
        Width = 624
        Height = 7
        Shape = bsTopLine
      end
      object Bevel2: TBevel
        Left = -2
        Top = 147
        Width = 624
        Height = 7
        Shape = bsTopLine
      end
      object Label6: TLabel
        Left = 5
        Top = 151
        Width = 38
        Height = 13
        Caption = 'Datas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 5
        Top = 168
        Width = 68
        Height = 13
        Caption = 'Distribui'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 253
        Top = 168
        Width = 95
        Height = 13
        Caption = 'Emiss'#227'o da Guia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 5
        Top = 208
        Width = 64
        Height = 13
        Caption = 'Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 253
        Top = 208
        Width = 81
        Height = 13
        Caption = 'Cancelamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel3: TBevel
        Left = 0
        Top = 260
        Width = 624
        Height = 7
        Shape = bsTopLine
      end
      object Label11: TLabel
        Left = 6
        Top = 271
        Width = 54
        Height = 13
        Caption = 'Usu'#225'rios:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 6
        Top = 323
        Width = 44
        Height = 13
        Caption = 'Emissor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_emissor: TSpeedButton
        Left = 291
        Top = 336
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
        OnClick = btn_co_emissorClick
      end
      object Label15: TLabel
        Left = 6
        Top = 360
        Width = 65
        Height = 13
        Caption = 'Cancelador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_cancelador: TSpeedButton
        Left = 291
        Top = 373
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
        OnClick = btn_co_canceladorClick
      end
      object msk_cd_desp: TMaskEdit
        Left = 150
        Top = 55
        Width = 41
        Height = 21
        EditMask = '!999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 3
        OnExit = msk_cd_despExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_desp: TEdit
        Left = 192
        Top = 55
        Width = 233
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
      object edt_nm_distribuidor: TEdit
        Left = 51
        Top = 301
        Width = 233
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
      object msk_nr_processo: TMaskEdit
        Left = 5
        Top = 54
        Width = 106
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnExit = msk_nr_processoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_unid_neg: TMaskEdit
        Left = 5
        Top = 12
        Width = 33
        Height = 21
        EditMask = '!99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
        Left = 47
        Top = 12
        Width = 233
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
        TabOrder = 19
      end
      object msk_cd_produto: TMaskEdit
        Left = 319
        Top = 12
        Width = 33
        Height = 21
        EditMask = '!99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
        Left = 356
        Top = 12
        Width = 233
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
        TabOrder = 20
      end
      object dblckpbox_status_sda: TDBLookupComboBox
        Left = 460
        Top = 56
        Width = 154
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'CD_STATUS_SDA'
        ListField = 'NM_STATUS_SDA'
        ListSource = datm_sda_pesq.ds_status_sda
        ParentFont = False
        TabOrder = 4
        OnClick = dblckpbox_status_sdaClick
      end
      object msk_vl_sda: TMaskEdit
        Left = 5
        Top = 114
        Width = 101
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnExit = msk_vl_sdaExit
      end
      object msk_cd_distribuidor: TMaskEdit
        Left = 6
        Top = 301
        Width = 43
        Height = 21
        EditMask = '9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        TabOrder = 14
        OnExit = msk_cd_distribuidorExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_dt_ini_distr: TDateEdit
        Left = 5
        Top = 184
        Width = 90
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 6
      end
      object msk_dt_fim_distr: TDateEdit
        Left = 102
        Top = 184
        Width = 90
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 7
      end
      object msk_dt_ini_emis: TDateEdit
        Left = 253
        Top = 184
        Width = 90
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 8
      end
      object msk_dt_fim_emis: TDateEdit
        Left = 350
        Top = 184
        Width = 90
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 9
      end
      object msk_dt_ini_pagto: TDateEdit
        Left = 5
        Top = 224
        Width = 90
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 10
      end
      object msk_dt_fim_pagto: TDateEdit
        Left = 102
        Top = 224
        Width = 90
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 11
      end
      object msk_dt_ini_cancel: TDateEdit
        Left = 253
        Top = 224
        Width = 90
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 12
      end
      object msk_dt_fim_cancel: TDateEdit
        Left = 350
        Top = 224
        Width = 90
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 13
      end
      object msk_cd_emissor: TMaskEdit
        Left = 6
        Top = 337
        Width = 43
        Height = 21
        EditMask = '9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        TabOrder = 15
        OnExit = msk_cd_emissorExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_emissor: TEdit
        Left = 51
        Top = 337
        Width = 233
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
        TabOrder = 21
      end
      object msk_cd_cancelador: TMaskEdit
        Left = 6
        Top = 374
        Width = 43
        Height = 21
        EditMask = '9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        TabOrder = 16
        OnExit = msk_cd_canceladorExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_cancelador: TEdit
        Left = 51
        Top = 374
        Width = 233
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
        TabOrder = 22
      end
    end
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object pnl_pagtos: TPanel
        Left = 0
        Top = 289
        Width = 1024
        Height = 150
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        object lbl_usuario_solic: TLabel
          Left = 6
          Top = 104
          Width = 65
          Height = 13
          Caption = 'Distribuidor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 127
          Top = 58
          Width = 68
          Height = 13
          Caption = 'Dt. Emiss'#227'o'
          FocusControl = dbedt_dt_emissao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 246
          Top = 58
          Width = 102
          Height = 13
          Caption = 'Dt. Cancelamento'
          FocusControl = dbedt_dt_cancelamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 380
          Top = 58
          Width = 55
          Height = 13
          Caption = 'Dt. Pagto'
          FocusControl = dbedt_dt_pagto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_dt_pagto: TLabel
          Left = 6
          Top = 58
          Width = 89
          Height = 13
          Caption = 'Dt. Distribui'#231#227'o'
          FocusControl = dbedt_dt_distribuicao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 246
          Top = 104
          Width = 44
          Height = 13
          Caption = 'Emissor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 504
          Top = 103
          Width = 65
          Height = 13
          Caption = 'Cancelador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 319
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
        object Label12: TLabel
          Left = 7
          Top = 9
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
        object dbedt_cd_distribuidor: TDBEdit
          Left = 6
          Top = 118
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_DISTRIBUIDOR'
          DataSource = datm_sda_pesq.ds_pesq
          MaxLength = 3
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nm_distribuidor: TDBEdit
          Left = 42
          Top = 118
          Width = 195
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_DISTRIBUIDOR'
          DataSource = datm_sda_pesq.ds_pesq
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_dt_emissao: TDBEdit
          Left = 127
          Top = 73
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_EMISSAO'
          DataSource = datm_sda_pesq.ds_pesq
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_dt_cancelamento: TDBEdit
          Left = 246
          Top = 73
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_CANCEL'
          DataSource = datm_sda_pesq.ds_pesq
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_dt_pagto: TDBEdit
          Left = 380
          Top = 73
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_PAGTO'
          DataSource = datm_sda_pesq.ds_pesq
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_dt_distribuicao: TDBEdit
          Left = 6
          Top = 73
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_DISTRIBUICAO'
          DataSource = datm_sda_pesq.ds_pesq
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_cd_emissor: TDBEdit
          Left = 246
          Top = 118
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_EMISSOR'
          DataSource = datm_sda_pesq.ds_pesq
          MaxLength = 3
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_dt_emissor: TDBEdit
          Left = 282
          Top = 118
          Width = 195
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_EMISSOR'
          DataSource = datm_sda_pesq.ds_pesq
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_cancelador: TDBEdit
          Left = 504
          Top = 118
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_CANCELADOR'
          DataSource = datm_sda_pesq.ds_pesq
          MaxLength = 3
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_nm_cancelador: TDBEdit
          Left = 540
          Top = 118
          Width = 195
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_CANCELADOR'
          DataSource = datm_sda_pesq.ds_pesq
          ReadOnly = True
          TabOrder = 9
        end
        object btnExcel: TBitBtn
          Left = 693
          Top = 12
          Width = 95
          Height = 25
          Caption = 'Gerar Excel'
          TabOrder = 10
          OnClick = btnExcelClick
          Glyph.Data = {
            4E010000424D4E01000000000000760000002800000012000000120000000100
            040000000000D800000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777770000007777777777777777770000007777777777770007770000007444
            4400000006007700000074FFFF08880600080700000074F008000060EE070700
            000074FFFFF8060EE0047700000074F0088060EE00F47700000074FFFF060EE0
            00747700000074F00800EE0EE0047700000074FFFF0EE0F0EE047700000074F0
            080000F000047700000074FFFFFFFFFFFFF47700000074444444444444447700
            000074F444F444F444F477000000744444444444444477000000777777777777
            777777000000777777777777777777000000}
        end
        object dbedt_nm_produto: TDBEdit
          Left = 362
          Top = 24
          Width = 260
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_PRODUTO'
          DataSource = datm_sda_pesq.ds_pesq
          TabOrder = 11
        end
        object dbedt_cd_produto: TDBEdit
          Left = 319
          Top = 24
          Width = 41
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_PRODUTO'
          DataSource = datm_sda_pesq.ds_pesq
          TabOrder = 12
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 50
          Top = 24
          Width = 260
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_UNID_NEG'
          DataSource = datm_sda_pesq.ds_pesq
          TabOrder = 13
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 8
          Top = 24
          Width = 40
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_UNID_NEG'
          DataSource = datm_sda_pesq.ds_pesq
          TabOrder = 14
        end
      end
      object cxGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 1024
        Height = 289
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        LockedStateImageOptions.AssignedValues = [lsiavFont, lsiavColor]
        LockedStateImageOptions.Font.Charset = DEFAULT_CHARSET
        LockedStateImageOptions.Font.Color = clWindowText
        LockedStateImageOptions.Font.Height = -11
        LockedStateImageOptions.Font.Name = 'MS Sans Serif'
        LockedStateImageOptions.Font.Style = []
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        object cxGridDBTableView1: TcxGridDBTableView
          DataController.DataSource = datm_sda_pesq.ds_pesq
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 30
          OnCustomDrawIndicatorCell = cxGridDBTableView1CustomDrawIndicatorCell
          object cxGridDBTableView1NM_EMPRESA: TcxGridDBColumn
            Caption = 'Cliente'
            DataBinding.FieldName = 'NM_EMPRESA'
            Width = 200
          end
          object cxGridDBTableView1NR_PROCESSO: TcxGridDBColumn
            Caption = 'N'#176' Processo'
            DataBinding.FieldName = 'NR_PROCESSO'
          end
          object cxGridDBTableView1NM_DESPACHANTE: TcxGridDBColumn
            DataBinding.FieldName = 'NM_DESPACHANTE'
            Width = 242
          end
          object cxGridDBTableView1VL_SDA: TcxGridDBColumn
            DataBinding.FieldName = 'VL_SDA'
          end
          object cxGridDBTableView1NM_STATUS_SDA: TcxGridDBColumn
            DataBinding.FieldName = 'NM_STATUS_SDA'
          end
          object cxGridDBTableView1DT_DISTRIBUICAO: TcxGridDBColumn
            DataBinding.FieldName = 'DT_DISTRIBUICAO'
          end
          object cxGridDBTableView1DT_EMISSAO: TcxGridDBColumn
            DataBinding.FieldName = 'DT_EMISSAO'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
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
  object SaveDialog: TSaveDialog
    DefaultExt = '*.csv'
    Filter = 'Arquivo CSV (*.csv)|*.csv'
    Title = 'Salvar como'
    Left = 868
    Top = 257
  end
end
