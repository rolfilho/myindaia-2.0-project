object frm_liq: Tfrm_liq
  Left = 296
  Top = 160
  Width = 750
  Height = 550
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Liquida'#231#227'o de Saldos'
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvl1: TBevel
    Left = 0
    Top = 136
    Width = 742
    Height = 9
    Align = alTop
    Shape = bsSpacer
  end
  object bvl2: TBevel
    Left = 0
    Top = 47
    Width = 742
    Height = 9
    Align = alTop
    Shape = bsSpacer
  end
  object pnl_filtros: TPanel
    Left = 0
    Top = 56
    Width = 742
    Height = 80
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object lbl_produto: TLabel
      Left = 6
      Top = 39
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
    object btn_co_produto: TSpeedButton
      Left = 153
      Top = 51
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
    object lbl_unid_neg: TLabel
      Left = 6
      Top = 5
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
    object btn_co_unid_neg: TSpeedButton
      Left = 153
      Top = 17
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
      OnClick = btn_co_unid_negClick
    end
    object lbl_cliente: TLabel
      Left = 191
      Top = 39
      Width = 32
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btn_co_cliente: TSpeedButton
      Left = 436
      Top = 52
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
    object lbl_grupo: TLabel
      Left = 191
      Top = 5
      Width = 29
      Height = 13
      Caption = 'Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btn_co_grupo: TSpeedButton
      Left = 435
      Top = 17
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
      OnClick = btn_co_grupoClick
    end
    object lbl_relatorio: TLabel
      Left = 477
      Top = 5
      Width = 98
      Height = 13
      Caption = 'Relat'#243'rio Reembolso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl_traco: TLabel
      Left = 556
      Top = 22
      Width = 5
      Height = 13
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl_vl_relatorio: TLabel
      Left = 477
      Top = 39
      Width = 46
      Height = 13
      Caption = 'Total Rel.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object msk_cd_produto: TMaskEdit
      Left = 6
      Top = 52
      Width = 24
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
      OnChange = btn_co_produtoClick
      OnEnter = msk_cd_produtoEnter
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 31
      Top = 52
      Width = 122
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 6
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 6
      Top = 18
      Width = 24
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
      OnChange = btn_co_unid_negClick
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 31
      Top = 18
      Width = 122
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 7
    end
    object edt_nm_cliente: TEdit
      Left = 231
      Top = 52
      Width = 204
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 8
    end
    object msk_cd_cliente: TMaskEdit
      Left = 191
      Top = 52
      Width = 40
      Height = 21
      Color = clWhite
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
      OnEnter = msk_cd_clienteEnter
      OnExit = msk_cd_clienteExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_grupo: TEdit
      Left = 232
      Top = 18
      Width = 202
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 9
    end
    object msk_cd_grupo: TMaskEdit
      Left = 191
      Top = 18
      Width = 40
      Height = 21
      Color = clWhite
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
      OnEnter = msk_cd_grupoEnter
      OnExit = msk_cd_grupoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_nr_relatorio: TMaskEdit
      Left = 477
      Top = 18
      Width = 77
      Height = 21
      EditMask = '999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 4
      OnEnter = msk_nr_relatorioEnter
      OnExit = msk_nr_relatorioExit
    end
    object msk_nr_ano: TMaskEdit
      Left = 563
      Top = 18
      Width = 77
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
      OnEnter = msk_nr_anoEnter
      OnExit = msk_nr_anoExit
    end
    object edt_vl_relatorio: TEdit
      Left = 477
      Top = 52
      Width = 77
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 10
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      742
      47)
    object shp2: TShape
      Left = 470
      Top = 4
      Width = 263
      Height = 39
      Anchors = [akTop, akRight]
      Pen.Color = clGray
    end
    object btn_sair: TSpeedButton
      Left = 424
      Top = 4
      Width = 40
      Height = 40
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
    object btn_cancelamento: TSpeedButton
      Left = 43
      Top = 3
      Width = 40
      Height = 40
      Hint = 'Cancelamento'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancelamentoClick
    end
    object btn_imp_recibo: TSpeedButton
      Left = 83
      Top = 3
      Width = 40
      Height = 40
      Hint = 'Imprimir recibo'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      OnClick = btn_imp_reciboClick
    end
    object btn_liq: TSpeedButton
      Left = 3
      Top = 3
      Width = 40
      Height = 40
      Hint = 'Liquidar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_liqClick
    end
    object btn_desmarca_todas: TSpeedButton
      Left = 157
      Top = 3
      Width = 40
      Height = 40
      Hint = 'Desmarcar Todas'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
        33333333373F33333333333330B03333333333337F7F33333333333330F03333
        333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
        333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
        333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
        3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
        33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
        33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
        03333337777777F7F33333330000000003333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_desmarca_todasClick
    end
    object btn_marca_todas: TSpeedButton
      Left = 197
      Top = 3
      Width = 40
      Height = 40
      Hint = 'Marcar Todas'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_marca_todasClick
    end
    object lbl_pesquisa: TLabel
      Left = 474
      Top = 6
      Width = 46
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lbl_ordem_pesquisa: TLabel
      Left = 611
      Top = 6
      Width = 31
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Ordem'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object shp1: TShape
      Left = 307
      Top = 9
      Width = 108
      Height = 28
      Anchors = [akTop, akRight]
      Pen.Color = clGray
    end
    object dbnvg: TDBNavigator
      Left = 309
      Top = 10
      Width = 104
      Height = 25
      DataSource = datm_liq.ds_fs_fatura
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object edt_pesquisa: TEdit
      Left = 475
      Top = 19
      Width = 132
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      OnChange = edt_pesquisaChange
    end
    object cb_ordem: TComboBox
      Left = 612
      Top = 19
      Width = 115
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 1
      OnClick = cb_ordemClick
      Items.Strings = (
        'Data de Fatura'
        'Nr da Nota'
        'Nr da Solicita'#231#227'o'
        'Nr do Processo')
    end
  end
  object pgctrl_geral: TPageControl
    Left = 0
    Top = 145
    Width = 742
    Height = 359
    ActivePage = ts_pendentes
    Align = alClient
    HotTrack = True
    TabOrder = 2
    OnChange = pgctrl_geralChange
    OnChanging = pgctrl_geralChanging
    object ts_pendentes: TTabSheet
      Caption = 'Saldos Pendentes'
      object bvl4: TBevel
        Left = 0
        Top = 301
        Width = 734
        Height = 5
        Align = alBottom
        Shape = bsSpacer
      end
      object bvl5: TBevel
        Left = 0
        Top = 98
        Width = 734
        Height = 5
        Align = alTop
        Shape = bsSpacer
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 98
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object lbl_banco: TLabel
          Left = 351
          Top = 9
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btn_co_banco: TSpeedButton
          Left = 701
          Top = 21
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
          OnClick = btn_co_bancoClick
        end
        object lbl_dt_liq: TLabel
          Left = 210
          Top = 46
          Width = 43
          Height = 13
          Caption = 'Data Liq.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object lbl_processo: TLabel
          Left = 209
          Top = 9
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = 'Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btn_co_processo: TSpeedButton
          Left = 312
          Top = 22
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
          OnClick = btn_co_processoClick
        end
        object lbl_vl_liq: TLabel
          Left = 351
          Top = 48
          Width = 44
          Height = 13
          Caption = 'Valor Liq.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btn_zera_liq: TSpeedButton
          Left = 445
          Top = 58
          Width = 31
          Height = 26
          Hint = 'Zerar Liquida'#231#227'o'
          Caption = '0,00'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_zera_liqClick
        end
        object rdgrp_forma_pagto: TRadioGroup
          Left = 6
          Top = 12
          Width = 193
          Height = 84
          Caption = '&Forma da Liquida'#231#227'o'
          Columns = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            'Dinheiro'
            'Cheque'
            'TED'
            'DOC/D. Cta.'
            'L&&P'
            'PIS/COFINS'
            'IRRF')
          ParentFont = False
          TabOrder = 0
          OnClick = rdgrp_forma_pagtoClick
        end
        object edt_nm_banco: TEdit
          Left = 385
          Top = 22
          Width = 314
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 5
        end
        object msk_cd_banco: TMaskEdit
          Left = 351
          Top = 22
          Width = 34
          Height = 21
          EditMask = '999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 3
          OnChange = btn_co_bancoClick
          OnExit = msk_cd_bancoExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object msk_dt_liq: TMaskEdit
          Left = 210
          Top = 61
          Width = 99
          Height = 21
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 2
          Text = '  /  /    '
          OnExit = msk_dt_liqExit
        end
        object edt_vl_liq: TEdit
          Left = 351
          Top = 61
          Width = 88
          Height = 21
          TabOrder = 4
          OnExit = edt_vl_liqExit
        end
        object msk_nr_processo: TMaskEdit
          Left = 209
          Top = 22
          Width = 102
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          MaxLength = 18
          TabOrder = 1
          OnExit = msk_nr_processoExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object Panel2: TPanel
          Left = 100
          Top = 26
          Width = 2
          Height = 65
          Caption = 'Panel2'
          TabOrder = 6
        end
      end
      object dbgrd_pendentes: TDBGrid
        Left = 0
        Top = 103
        Width = 734
        Height = 198
        Align = alClient
        DataSource = datm_liq.ds_fs_fatura
        Enabled = False
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgrd_pendentesCellClick
        OnKeyDown = dbgrd_pendentesKeyDown
        OnKeyUp = dbgrd_pendentesKeyUp
        Columns = <
          item
            Expanded = False
            FieldName = 'DT_FATURA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TP_TIPO_FAT'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_NOTA_FATURA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CalcNrSolicitacao'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_FATURA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_PROCESSO_CALC'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_FATURA_PROC'
            Title.Caption = 'Vl. Fatura Processo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_LIQUIDACAO_PROC'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 104
            Visible = True
          end>
      end
      object pnlTotal1: TPanel
        Left = 0
        Top = 306
        Width = 734
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 2
        object lbl_total: TLabel
          Left = 7
          Top = 7
          Width = 57
          Height = 13
          Caption = 'TOTAL:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbtxt_vl_total: TDBText
          Left = 66
          Top = 6
          Width = 98
          Height = 17
          Alignment = taRightJustify
          DataField = 'VL_TOTAL'
          DataSource = datm_liq.ds_soma_pend
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_tot_selecionado: TLabel
          Left = 218
          Top = 7
          Width = 148
          Height = 13
          Caption = 'TOTAL SELECIONADO:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_tot_selec: TLabel
          Left = 437
          Top = 7
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object ts_liquidacao: TTabSheet
      Caption = 'Liquida'#231#245'es'
      object Label5: TLabel
        Left = 7
        Top = 267
        Width = 57
        Height = 13
        Caption = 'TOTAL:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 66
        Top = 267
        Width = 98
        Height = 17
        Alignment = taRightJustify
        DataField = 'VL_TOTAL'
        DataSource = datm_liq.ds_soma_pend
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 218
        Top = 267
        Width = 148
        Height = 13
        Caption = 'TOTAL SELECIONADO:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 437
        Top = 267
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pgctrl_liq: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 331
        ActivePage = ts_lista
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_liqChange
        object ts_lista: TTabSheet
          Caption = 'Lista'
          object bvl6: TBevel
            Left = 0
            Top = 89
            Width = 726
            Height = 6
            Align = alTop
            Shape = bsSpacer
          end
          object bvl7: TBevel
            Left = 0
            Top = 270
            Width = 726
            Height = 8
            Align = alBottom
            Shape = bsSpacer
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 89
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object lbl_dt_solic_ch: TLabel
              Left = 132
              Top = 3
              Width = 23
              Height = 13
              Alignment = taRightJustify
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lbl_processo2: TLabel
              Left = 310
              Top = 3
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Processo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_co_processo2: TSpeedButton
              Left = 398
              Top = 15
              Width = 25
              Height = 22
              Enabled = False
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
              OnClick = btn_co_processo2Click
            end
            object Label29: TLabel
              Left = 132
              Top = 38
              Width = 98
              Height = 13
              Caption = 'Relat'#243'rio Reembolso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label30: TLabel
              Left = 213
              Top = 55
              Width = 5
              Height = 13
              Caption = '/'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label31: TLabel
              Left = 310
              Top = 38
              Width = 46
              Height = 13
              Caption = 'Total Rel.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label27: TLabel
              Left = 430
              Top = 3
              Width = 29
              Height = 13
              Caption = 'Grupo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_co_grupo2: TSpeedButton
              Left = 674
              Top = 15
              Width = 27
              Height = 22
              Enabled = False
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
              OnClick = btn_co_grupo2Click
            end
            object Label28: TLabel
              Left = 430
              Top = 38
              Width = 32
              Height = 13
              Caption = 'Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_co_cliente2: TSpeedButton
              Left = 674
              Top = 50
              Width = 27
              Height = 22
              Enabled = False
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
              OnClick = btn_co_cliente2Click
            end
            object msk_dt_liquidacao: TMaskEdit
              Left = 132
              Top = 16
              Width = 73
              Height = 21
              EditMask = '00/00/0000;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 1
              Text = '  /  /    '
              OnExit = msk_dt_liquidacaoExit
            end
            object msk_nr_processo2: TMaskEdit
              Left = 309
              Top = 16
              Width = 87
              Height = 21
              TabStop = False
              CharCase = ecUpperCase
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 18
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              OnExit = msk_nr_processo2Exit
              OnKeyDown = msk_cd_unid_negKeyDown
            end
            object rdgrp_liq: TRadioGroup
              Left = 6
              Top = 8
              Width = 122
              Height = 67
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemIndex = 0
              Items.Strings = (
                'Data'
                'Processo'
                'Reembolso')
              ParentFont = False
              TabOrder = 0
              OnClick = rdgrp_liqClick
              OnExit = rdgrp_liqExit
            end
            object msk_nr_relatorio2: TMaskEdit
              Left = 132
              Top = 51
              Width = 77
              Height = 21
              Color = clMenu
              EditMask = '999;0; '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 3
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
              OnEnter = msk_nr_relatorio2Enter
              OnExit = msk_nr_relatorio2Exit
            end
            object msk_nr_ano2: TMaskEdit
              Left = 226
              Top = 51
              Width = 77
              Height = 21
              Color = clMenu
              EditMask = '9999;0; '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 4
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
              OnEnter = msk_nr_ano2Enter
              OnExit = msk_nr_ano2Exit
            end
            object edt_vl_relatorio2: TEdit
              Left = 309
              Top = 51
              Width = 86
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 7
            end
            object msk_cd_grupo2: TMaskEdit
              Left = 430
              Top = 16
              Width = 39
              Height = 21
              Color = clMenu
              EditMask = '999;0; '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 3
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              OnChange = msk_cd_grupo2Change
              OnEnter = msk_cd_grupo2Enter
              OnExit = msk_cd_grupo2Exit
              OnKeyDown = msk_cd_unid_negKeyDown
            end
            object edt_nm_grupo2: TEdit
              Left = 470
              Top = 16
              Width = 201
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 8
            end
            object msk_cd_cliente2: TMaskEdit
              Left = 430
              Top = 51
              Width = 39
              Height = 21
              Color = clMenu
              EditMask = '99999;0; '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 5
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
              OnChange = msk_cd_cliente2Change
              OnEnter = msk_cd_cliente2Enter
              OnExit = msk_cd_cliente2Exit
              OnKeyDown = msk_cd_unid_negKeyDown
            end
            object edt_nm_cliente2: TEdit
              Left = 470
              Top = 51
              Width = 201
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 9
            end
          end
          object dbgrd_liq: TDBGrid
            Left = 0
            Top = 95
            Width = 726
            Height = 175
            Align = alClient
            DataSource = datm_liq.ds_liquidacao
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
                FieldName = 'CalcProcesso'
                Title.Caption = 'Processo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 68
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_LIQUIDACAO'
                Title.Caption = 'Nr Liquid.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_LIQUIDACAO'
                Title.Caption = 'Data Liquid.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CalcNrSolicFat'
                Title.Caption = 'Nr Solic. Fat.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TP_LIQUIDACAO'
                Title.Caption = 'R/P'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_LIQUIDACAO'
                Title.Caption = 'Vl. Liquida'#231#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 105
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calcCancelado'
                Font.Charset = SYMBOL_CHARSET
                Font.Color = clTeal
                Font.Height = -13
                Font.Name = 'Wingdings'
                Font.Style = [fsBold]
                Title.Caption = 'Cancelado?'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 67
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calcUsuario'
                Title.Caption = 'Usu'#225'rio'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 134
                Visible = True
              end>
          end
          object pnlTotal2: TPanel
            Left = 0
            Top = 278
            Width = 726
            Height = 25
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object Label32: TLabel
              Left = 266
              Top = 9
              Width = 57
              Height = 13
              Caption = 'TOTAL:   '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbtxt_tot_liq: TDBText
              Left = 357
              Top = 8
              Width = 98
              Height = 17
              Alignment = taRightJustify
              DataField = 'VL_TOTAL'
              DataSource = datm_liq.ds_soma_liq
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object ts_dados_basicos: TTabSheet
          Caption = 'Dados B'#225'sicos'
          object Label7: TLabel
            Left = 248
            Top = 0
            Width = 44
            Height = 13
            Caption = 'Processo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 248
            Top = 36
            Width = 52
            Height = 13
            Caption = 'Liquida'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 512
            Top = 2
            Width = 36
            Height = 13
            Caption = 'Usu'#225'rio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 8
            Top = 117
            Width = 101
            Height = 13
            Caption = 'Forma de Pagamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 8
            Top = 151
            Width = 31
            Height = 13
            Caption = 'Banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label12: TLabel
            Left = 8
            Top = 0
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
          object Label13: TLabel
            Left = 8
            Top = 36
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
          object Label14: TLabel
            Left = 248
            Top = 75
            Width = 114
            Height = 13
            Caption = 'Nr Solicita'#231#227'o da Fatura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label15: TLabel
            Left = 248
            Top = 116
            Width = 91
            Height = 13
            Caption = 'Tipo de Liquida'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label17: TLabel
            Left = 80
            Top = 193
            Width = 54
            Height = 13
            Caption = 'Cancelador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label18: TLabel
            Left = 8
            Top = 233
            Width = 109
            Height = 13
            Caption = 'Data do Cancelamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label20: TLabel
            Left = 379
            Top = 150
            Width = 106
            Height = 13
            Caption = 'Data de Transfer'#234'ncia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label21: TLabel
            Left = 247
            Top = 232
            Width = 37
            Height = 13
            Caption = 'Cheque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label22: TLabel
            Left = 248
            Top = 196
            Width = 133
            Height = 13
            Caption = 'Data Solicita'#231#227'o do Cheque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label23: TLabel
            Left = 375
            Top = 232
            Width = 136
            Height = 13
            Caption = 'Nr de Solicita'#231#227'o do Cheque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label24: TLabel
            Left = 379
            Top = 116
            Width = 94
            Height = 13
            Caption = 'Valor da Liquida'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 8
            Top = 74
            Width = 32
            Height = 13
            Caption = 'Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbl1: TLabel
            Left = 274
            Top = 165
            Width = 53
            Height = 13
            Caption = 'Transferido'
          end
          object lbl2: TLabel
            Left = 24
            Top = 209
            Width = 51
            Height = 13
            Caption = 'Cancelado'
          end
          object dbchkTransferido: TDBCheckBox
            Left = 251
            Top = 164
            Width = 24
            Height = 17
            DataField = 'IN_TRANSFERIDO'
            DataSource = datm_liq.ds_liquidacao
            Enabled = False
            TabOrder = 23
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbedt_nr_processo: TDBEdit
            Left = 248
            Top = 16
            Width = 161
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CalcProcesso'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_nr_liquidacao: TDBEdit
            Left = 248
            Top = 52
            Width = 65
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NR_LIQUIDACAO'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_dt_liquidacao: TDBEdit
            Left = 315
            Top = 52
            Width = 94
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'DT_LIQUIDACAO'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 2
          end
          object dbedt_cd_usuario: TDBEdit
            Left = 512
            Top = 16
            Width = 33
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_USUARIO'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 3
          end
          object dbedt_nm_usuario: TDBEdit
            Left = 548
            Top = 16
            Width = 168
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'calcUsuario'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 4
          end
          object dbedt_nm_forma_pagto: TDBEdit
            Left = 8
            Top = 131
            Width = 221
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'calcFormaPagto'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 5
          end
          object dbedt_cd_banco: TDBEdit
            Left = 8
            Top = 165
            Width = 41
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_BANCO'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 6
          end
          object dbedt_nm_banco: TDBEdit
            Left = 51
            Top = 165
            Width = 178
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'calcBanco'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 7
          end
          object dbedt_cd_unid_neg: TDBEdit
            Left = 8
            Top = 13
            Width = 44
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_UNID_NEG'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 8
          end
          object dbedt_nm_unid_neg: TDBEdit
            Left = 52
            Top = 13
            Width = 176
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'calcUnid'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 9
          end
          object dbedt_cd_produto: TDBEdit
            Left = 8
            Top = 50
            Width = 44
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_PRODUTO'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 10
          end
          object dbedt_nm_produto: TDBEdit
            Left = 53
            Top = 50
            Width = 176
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'calcProduto'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 11
          end
          object dbedt_nr_solic_fat: TDBEdit
            Left = 248
            Top = 89
            Width = 161
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CalcNrSolicFat'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 12
          end
          object dbedt_nm_tp_liquidacao: TDBEdit
            Left = 248
            Top = 130
            Width = 121
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'calcTpLiquidacao'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 13
          end
          object dbedt_nm_cancelador: TDBEdit
            Left = 80
            Top = 207
            Width = 149
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'calcCancelador'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 14
          end
          object dbedt_dt_cancelamento: TDBEdit
            Left = 8
            Top = 247
            Width = 220
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'DT_CANCELAMENTO'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 15
          end
          object dbedt_dt_transferencia: TDBEdit
            Left = 379
            Top = 164
            Width = 121
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'DT_TRANSFERENCIA'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 16
          end
          object dbedt_nr_cheque: TDBEdit
            Left = 248
            Top = 247
            Width = 122
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'calcCheque'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 17
          end
          object dbedt_dt_solic_ch: TDBEdit
            Left = 248
            Top = 210
            Width = 121
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'DT_SOLIC_CH'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 18
          end
          object dbedt_nr_solic_ch: TDBEdit
            Left = 375
            Top = 246
            Width = 121
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NR_SOLIC_CH'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 19
          end
          object dbedt_vl_liquidacao: TDBEdit
            Left = 379
            Top = 130
            Width = 121
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'VL_LIQUIDACAO'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 20
          end
          object dbedt_cd_cliente: TDBEdit
            Left = 8
            Top = 88
            Width = 44
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'calcCdCliente'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 21
          end
          object dbedt_nm_cliente: TDBEdit
            Left = 53
            Top = 88
            Width = 176
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'calcNmCliente'
            DataSource = datm_liq.ds_liquidacao
            ReadOnly = True
            TabOrder = 22
          end
          object dbchkCancelado: TDBCheckBox
            Left = 6
            Top = 206
            Width = 18
            Height = 17
            DataField = 'IN_CANCELADO'
            DataSource = datm_liq.ds_liquidacao
            Enabled = False
            TabOrder = 24
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object ts_fat_notas: TTabSheet
          Caption = 'Faturas/Notas'
          object bvl3: TBevel
            Left = 0
            Top = 41
            Width = 726
            Height = 7
            Align = alTop
            Shape = bsSpacer
          end
          object dbgrd_fat_notas: TDBGrid
            Left = 0
            Top = 48
            Width = 726
            Height = 255
            Align = alClient
            DataSource = datm_liq.ds_fat_notas
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
                FieldName = 'CalcProcesso'
                Title.Caption = 'Processo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 68
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CalcNrSolicFat'
                Title.Caption = 'Nr Solic. Fat.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 97
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TP_LIQUIDACAO'
                Title.Caption = 'R/P'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 52
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_LIQUIDACAO'
                Title.Caption = 'Vl. Liquida'#231#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 105
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calcCancelado'
                Font.Charset = SYMBOL_CHARSET
                Font.Color = clTeal
                Font.Height = -13
                Font.Name = 'Wingdings'
                Font.Style = [fsBold]
                Title.Caption = 'Cancelado?'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 63
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calcUsuario'
                Title.Caption = 'Usu'#225'rio'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 168
                Visible = True
              end>
          end
          object pnlFatura1: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label1: TLabel
              Left = 8
              Top = 0
              Width = 44
              Height = 13
              Caption = 'Processo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Left = 144
              Top = 0
              Width = 52
              Height = 13
              Caption = 'Liquida'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label4: TLabel
              Left = 310
              Top = 0
              Width = 94
              Height = 13
              Caption = 'Valor da Liquida'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbedt_nr_processo2: TDBEdit
              Left = 8
              Top = 14
              Width = 129
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NR_PROCESSO'
              DataSource = datm_liq.ds_liquidacao
              ReadOnly = True
              TabOrder = 0
            end
            object dbedt_nr_liquidacao2: TDBEdit
              Left = 144
              Top = 14
              Width = 65
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NR_LIQUIDACAO'
              DataSource = datm_liq.ds_liquidacao
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_dt_liquidacao2: TDBEdit
              Left = 211
              Top = 14
              Width = 94
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'DT_LIQUIDACAO'
              DataSource = datm_liq.ds_liquidacao
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_vl_liquidacao2: TDBEdit
              Left = 310
              Top = 14
              Width = 121
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_LIQUIDACAO'
              DataSource = datm_liq.ds_liquidacao
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 619
    Top = 94
    object mi_liq: TMenuItem
      Caption = '&Liquidar'
      OnClick = btn_liqClick
    end
    object mi_cancelamento: TMenuItem
      Caption = '&Cancelamento'
      Enabled = False
      OnClick = btn_cancelamentoClick
    end
    object mi_desmarca: TMenuItem
      Caption = '&Desmarca'
      Visible = False
      OnClick = btn_desmarca_todasClick
    end
    object mi_marca: TMenuItem
      Caption = '&Marca'
      OnClick = btn_marca_todasClick
    end
    object mi_imp_recibo: TMenuItem
      Caption = 'Imprimir Reci&bo'
      OnClick = btn_imp_reciboClick
    end
    object Sair1: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
