object frm_monta_pagto: Tfrm_monta_pagto
  Left = 196
  Top = 136
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Montagem de Pagamentos'
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
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 46
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 699
      Top = 4
      Width = 36
      Height = 38
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
    object btn_salvar: TSpeedButton
      Left = 5
      Top = 4
      Width = 36
      Height = 38
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 41
      Top = 4
      Width = 36
      Height = 38
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancelarClick
    end
    object btnMontagem: TSpeedButton
      Left = 77
      Top = 4
      Width = 36
      Height = 38
      Hint = 'Montar Pagamentos'
      Enabled = False
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
      OnClick = btnMontagemClick
    end
    object btn_desmarca_todas: TSpeedButton
      Left = 159
      Top = 4
      Width = 36
      Height = 38
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
      Left = 195
      Top = 4
      Width = 36
      Height = 38
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
    object btn_canc_lanc: TSpeedButton
      Left = 119
      Top = 3
      Width = 35
      Height = 38
      Hint = 'Cancelar Item'
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
      OnClick = btn_canc_lancClick
    end
    object dbnvg: TDBNavigator
      Left = 605
      Top = 12
      Width = 84
      Height = 20
      DataSource = datm_monta_pagto.ds_grd_pagto
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      BeforeAction = dbnvgBeforeAction
    end
  end
  object pgctrl_monta_pagto: TPageControl
    Left = 0
    Top = 46
    Width = 742
    Height = 458
    ActivePage = ts_processo
    Align = alClient
    HotTrack = True
    TabOrder = 1
    OnChange = pgctrl_monta_pagtoChange
    OnChanging = pgctrl_monta_pagtoChanging
    object ts_datapagto: TTabSheet
      Caption = 'Por data de pagamento'
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 734
        Height = 430
        Align = alClient
      end
      object Label6: TLabel
        Left = 227
        Top = 12
        Width = 112
        Height = 13
        Caption = 'Data de pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 10
        Top = 12
        Width = 62
        Height = 13
        Caption = 'Unid. Neg.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_unid_neg_data: TSpeedButton
        Left = 189
        Top = 24
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
        OnClick = btn_co_unid_neg_dataClick
      end
      object msk_dt_pagamento: TMaskEdit
        Left = 228
        Top = 25
        Width = 78
        Height = 21
        Hint = 'Informe a data de pagamento'
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = '  /  /    '
        OnEnter = msk_dt_pagamentoEnter
        OnExit = msk_dt_pagamentoExit
      end
      object dbgrd_DataPagto: TDBGrid
        Left = 12
        Top = 55
        Width = 713
        Height = 365
        DataSource = datm_monta_pagto.dsgridPagtoData_
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'Look_Favorecido'
            Title.Caption = 'Favorecido'
            Title.Color = clBlack
            Width = 158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calcNrProcesso'
            Title.Caption = 'Nr. processo'
            Title.Color = clBlack
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_Item'
            Title.Caption = 'Item'
            Title.Color = clBlack
            Width = 142
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_PAGTO'
            Title.Caption = 'Valor'
            Title.Color = clBlack
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Title.Caption = 'Vl. Recebido'
            Title.Color = clBlack
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_TpDestino'
            Title.Caption = 'Tipo destino'
            Title.Color = clBlack
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_Status'
            Title.Caption = 'Status'
            Title.Color = clBlack
            Width = 66
            Visible = True
          end>
      end
      object edt_nm_unid_neg_data: TEdit
        Left = 44
        Top = 25
        Width = 144
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 3
      end
      object msk_cd_unid_neg_data: TMaskEdit
        Left = 11
        Top = 25
        Width = 34
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
        OnEnter = msk_cd_unid_neg_dataEnter
        OnExit = msk_cd_unid_neg_dataExit
        OnKeyDown = dbedt_cd_bancoKeyDown
      end
    end
    object ts_favorecido: TTabSheet
      Caption = 'Por Favorecido'
      object Shape1: TShape
        Left = 3
        Top = 280
        Width = 727
        Height = 21
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lbl_favorecido: TLabel
        Left = 11
        Top = 48
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
      object btn_co_favorecido: TSpeedButton
        Left = 283
        Top = 60
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
        OnClick = btn_co_favorecidoClick
      end
      object lbl_banco: TLabel
        Left = 325
        Top = 48
        Width = 37
        Height = 13
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_banco2: TSpeedButton
        Left = 591
        Top = 60
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
        OnClick = btn_co_banco2Click
      end
      object lbl_total: TLabel
        Left = 9
        Top = 284
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
      object lbl_tot_selecionado: TLabel
        Left = 233
        Top = 284
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
      object lbl_unid_neg_fav: TLabel
        Left = 11
        Top = 8
        Width = 62
        Height = 13
        Caption = 'Unid. Neg.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_unid_neg_fav: TSpeedButton
        Left = 186
        Top = 20
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
        OnClick = btn_co_unid_neg_favClick
      end
      object lbl_usuario: TLabel
        Left = 443
        Top = 8
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
      object btn_co_usuario: TSpeedButton
        Left = 626
        Top = 20
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
      object lbl_produto_fav: TLabel
        Left = 227
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
      object btn_co_produto_fav: TSpeedButton
        Left = 402
        Top = 20
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
        OnClick = btn_co_produto_favClick
      end
      object dbtxt_vl_total: TDBText
        Left = 68
        Top = 284
        Width = 98
        Height = 13
        Alignment = taRightJustify
        DataField = 'VL_TOTAL'
        DataSource = datm_monta_pagto.ds_soma_fav
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_vl_tot_selec: TLabel
        Left = 417
        Top = 284
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 634
        Top = 48
        Width = 45
        Height = 13
        Caption = 'N'#186' DOC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_nm_favorecido: TEdit
        Left = 52
        Top = 61
        Width = 230
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 5
      end
      object dbgrdMontaFav: TDBGrid
        Left = 3
        Top = 97
        Width = 727
        Height = 179
        DataSource = datm_monta_pagto.ds_grd_fav
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnCellClick = dbgrdMontaFavCellClick
        OnDblClick = dbgrdMontaFavDblClick
        OnKeyDown = dbgrdMontaFavKeyDown
        OnKeyUp = dbgrdMontaFavKeyUp
        Columns = <
          item
            Expanded = False
            FieldName = 'calcMontar'
            Font.Charset = SYMBOL_CHARSET
            Font.Color = clTeal
            Font.Height = -12
            Font.Name = 'Wingdings'
            Font.Style = [fsBold]
            Title.Caption = 'Selec.'
            Title.Color = clBlack
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookItem'
            Title.Color = clBlack
            Width = 156
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_PAGTO'
            Title.Color = clBlack
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Title.Color = clBlack
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookStatus'
            Title.Color = clBlack
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookTpDestino'
            Title.Color = clBlack
            Width = 132
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CalcNrProcesso'
            Title.Color = clBlack
            Width = 112
            Visible = True
          end>
      end
      object pnl_por_favorecido: TPanel
        Left = 0
        Top = 306
        Width = 734
        Height = 124
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 7
        object lbl_item2: TLabel
          Left = 23
          Top = 19
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
        object lbl_valor2: TLabel
          Left = 23
          Top = 66
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor'
          FocusControl = dbedt_vl_pagto_fav
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_item2: TSpeedButton
          Left = 272
          Top = 32
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
        object lbl_dt_pagto2: TLabel
          Left = 420
          Top = 19
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Pagto'
          FocusControl = dbedt_dt_pagto2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nr_docto2: TLabel
          Left = 555
          Top = 66
          Width = 53
          Height = 13
          Caption = 'N'#186' Docto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_processo2: TLabel
          Left = 315
          Top = 19
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#186' Processo'
          FocusControl = dbedt_nr_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 138
          Top = 66
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Desconto'
          FocusControl = dbedt_vl_desc_fav
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 254
          Top = 66
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = '% Desconto'
          FocusControl = dbedt_vl_perc_desc_fav
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 371
          Top = 66
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Total'
          FocusControl = dbedt_vl_total2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 489
          Top = 66
          Width = 51
          Height = 13
          Caption = 'N'#186' Lanc.'
          FocusControl = dbedt_nr_lanc2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_dt_solic_fav: TLabel
          Left = 513
          Top = 19
          Width = 50
          Height = 13
          Caption = 'Dt. Solic'
          FocusControl = dbedt_dt_solic_pagto_fav
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_pagto_fav: TDBEdit
          Left = 23
          Top = 80
          Width = 101
          Height = 21
          DataField = 'VL_PAGTO'
          DataSource = datm_monta_pagto.ds_solic_fav
          TabOrder = 1
          OnChange = dbedt_cd_item2Change
          OnEnter = dbedt_vl_pagto_favEnter
          OnExit = dbedt_vl_pagto_favExit
        end
        object dbedt_nm_item2: TDBEdit
          Left = 60
          Top = 33
          Width = 211
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookItem'
          DataSource = datm_monta_pagto.ds_solic_fav
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_dt_pagto2: TDBEdit
          Left = 420
          Top = 33
          Width = 76
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_PAGTO'
          DataSource = datm_monta_pagto.ds_solic_fav
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_nr_docto2: TDBEdit
          Left = 555
          Top = 80
          Width = 78
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_DOCTO'
          DataSource = datm_monta_pagto.ds_solic_fav
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_cd_item2Change
          OnExit = dbedt_cd_calculoExit
          OnKeyDown = dbedt_cd_bancoKeyDown
        end
        object dbedt_nr_processo: TDBEdit
          Left = 315
          Top = 33
          Width = 87
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CalcNrProcesso'
          DataSource = datm_monta_pagto.ds_solic_fav
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_vl_desc_fav: TDBEdit
          Left = 138
          Top = 80
          Width = 101
          Height = 21
          DataField = 'VL_DESCONTO'
          DataSource = datm_monta_pagto.ds_solic_fav
          TabOrder = 2
          OnChange = dbedt_cd_item2Change
          OnEnter = dbedt_vl_desc_favEnter
          OnExit = dbedt_vl_desc_favExit
        end
        object dbedt_vl_perc_desc_fav: TDBEdit
          Left = 254
          Top = 80
          Width = 101
          Height = 21
          DataField = 'VL_PERC_DESCONTO'
          DataSource = datm_monta_pagto.ds_solic_fav
          TabOrder = 3
          OnChange = dbedt_cd_item2Change
          OnEnter = dbedt_vl_perc_desc_favEnter
          OnExit = dbedt_vl_perc_desc_favExit
        end
        object dbedt_vl_total2: TDBEdit
          Left = 371
          Top = 80
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CalcVlTotal'
          DataSource = datm_monta_pagto.ds_solic_fav
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_nr_lanc2: TDBEdit
          Left = 489
          Top = 80
          Width = 49
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_LANCAMENTO'
          DataSource = datm_monta_pagto.ds_solic_fav
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_dt_solic_pagto_fav: TDBEdit
          Left = 513
          Top = 33
          Width = 76
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_SOLIC_PAGTO'
          DataSource = datm_monta_pagto.ds_solic_fav
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_cd_item2: TDBEdit
          Left = 23
          Top = 33
          Width = 38
          Height = 21
          DataField = 'CD_ITEM'
          DataSource = datm_monta_pagto.ds_solic_fav
          TabOrder = 0
          OnChange = dbedt_cd_item2Change
          OnExit = dbedt_cd_itemExit
          OnKeyDown = dbedt_cd_bancoKeyDown
        end
      end
      object edt_nm_banco: TEdit
        Left = 363
        Top = 61
        Width = 227
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 8
      end
      object edt_nm_unid_neg_fav: TEdit
        Left = 45
        Top = 21
        Width = 140
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 9
      end
      object edt_nm_usuario: TEdit
        Left = 485
        Top = 21
        Width = 140
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 10
      end
      object edt_nm_produto_fav: TEdit
        Left = 259
        Top = 21
        Width = 142
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 11
      end
      object msk_cd_unid_neg_fav: TMaskEdit
        Left = 11
        Top = 21
        Width = 35
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
        OnEnter = msk_cd_unid_neg_favEnter
        OnExit = msk_cd_unid_neg_favExit
        OnKeyDown = dbedt_cd_bancoKeyDown
      end
      object msk_cd_favorecido: TMaskEdit
        Left = 11
        Top = 61
        Width = 42
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
        OnEnter = msk_cd_favorecidoEnter
        OnExit = msk_cd_favorecidoExit
        OnKeyDown = dbedt_cd_bancoKeyDown
      end
      object msk_cd_produto_fav: TMaskEdit
        Left = 227
        Top = 21
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
        TabOrder = 1
        OnEnter = msk_cd_produto_favEnter
        OnExit = msk_cd_produto_favExit
        OnKeyDown = dbedt_cd_bancoKeyDown
      end
      object msk_cd_usuario: TMaskEdit
        Left = 443
        Top = 21
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
        TabOrder = 2
        OnEnter = msk_cd_usuarioEnter
        OnExit = msk_cd_usuarioExit
        OnKeyDown = dbedt_cd_bancoKeyDown
      end
      object msk_cd_banco: TMaskEdit
        Left = 325
        Top = 61
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
        TabOrder = 4
        OnEnter = msk_cd_bancoEnter
        OnExit = msk_cd_bancoExit
        OnKeyDown = dbedt_cd_bancoKeyDown
      end
      object msk_nr_doc: TMaskEdit
        Left = 633
        Top = 61
        Width = 64
        Height = 21
        Enabled = False
        EditMask = '999999;0; '
        MaxLength = 6
        TabOrder = 12
      end
    end
    object ts_processo: TTabSheet
      Caption = 'Por Processo'
      object Shape2: TShape
        Left = 3
        Top = 229
        Width = 727
        Height = 21
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lbl_unid_neg: TLabel
        Left = 8
        Top = 5
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
      object lbl_produto: TLabel
        Left = 261
        Top = 5
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
      object btn_co_unid_neg_proc: TSpeedButton
        Left = 221
        Top = 18
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
        OnClick = btn_co_unid_neg_procClick
      end
      object btn_co_produto: TSpeedButton
        Left = 479
        Top = 18
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
      object lbl_processo: TLabel
        Left = 519
        Top = 5
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_processo2: TSpeedButton
        Left = 630
        Top = 18
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
        OnClick = btn_co_processo2Click
      end
      object lbl_cliente: TLabel
        Left = 8
        Top = 47
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_servico: TLabel
        Left = 261
        Top = 47
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 232
        Top = 234
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
      object lbl_vl_tot_selec_proc: TLabel
        Left = 416
        Top = 234
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 8
        Top = 234
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
      object dbedt_vl_tot_selec_proc: TDBText
        Left = 67
        Top = 234
        Width = 98
        Height = 13
        Alignment = taRightJustify
        DataField = 'VL_TOTAL'
        DataSource = datm_monta_pagto.ds_soma_proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_nm_unid_neg_proc: TEdit
        Left = 36
        Top = 19
        Width = 184
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 1
      end
      object edt_nm_produto: TEdit
        Left = 293
        Top = 19
        Width = 184
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 3
      end
      object msk_nr_processo: TMaskEdit
        Left = 519
        Top = 19
        Width = 110
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 18
        ParentFont = False
        TabOrder = 4
        OnEnter = msk_nr_processoEnter
        OnExit = msk_nr_processoExit
        OnKeyDown = dbedt_cd_bancoKeyDown
      end
      object edt_nm_cliente: TEdit
        Left = 52
        Top = 61
        Width = 193
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 6
      end
      object edt_nm_servico: TEdit
        Left = 293
        Top = 61
        Width = 184
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 8
      end
      object dbgrdMontaPagto: TDBGrid
        Left = 2
        Top = 92
        Width = 727
        Height = 133
        DataSource = datm_monta_pagto.ds_grd_pagto
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnCellClick = dbgrdMontaPagtoCellClick
        OnDblClick = dbgrdMontaPagtoDblClick
        OnKeyDown = dbgrdMontaPagtoKeyDown
        OnKeyUp = dbgrdMontaPagtoKeyUp
        Columns = <
          item
            Expanded = False
            FieldName = 'calcMontar'
            Font.Charset = SYMBOL_CHARSET
            Font.Color = clTeal
            Font.Height = -12
            Font.Name = 'Wingdings'
            Font.Style = [fsBold]
            Title.Caption = 'Selec.'
            Title.Color = clBlack
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookItem'
            Title.Color = clBlack
            Width = 156
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_PAGTO'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 86
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookFavorecido'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 177
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookStatus'
            Title.Color = clBlack
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookTpDestino'
            Title.Color = clBlack
            Width = 64
            Visible = True
          end>
      end
      object pnl_por_processo: TPanel
        Left = 0
        Top = 254
        Width = 734
        Height = 176
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 10
        object lbl_item: TLabel
          Left = 12
          Top = 7
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
          Left = 12
          Top = 132
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor'
          FocusControl = dbedt_vl_pagto_proc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_status: TLabel
          Left = 296
          Top = 7
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
        object btn_co_item: TSpeedButton
          Left = 255
          Top = 18
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
        object lbl_banco2: TLabel
          Left = 295
          Top = 89
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_banco: TSpeedButton
          Left = 542
          Top = 100
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
        object lbl_favorecido2: TLabel
          Left = 12
          Top = 89
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
        object btn_co_favorecido2: TSpeedButton
          Left = 255
          Top = 100
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
          OnClick = btn_co_favorecido2Click
        end
        object lbl_tp_destino: TLabel
          Left = 12
          Top = 48
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
        object lbl_dt_pagto: TLabel
          Left = 177
          Top = 48
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
        object lbl_nr_docto: TLabel
          Left = 295
          Top = 48
          Width = 53
          Height = 13
          Caption = 'N'#186' Docto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_desconto: TLabel
          Left = 127
          Top = 132
          Width = 88
          Height = 13
          Caption = 'Valor Desconto'
          FocusControl = dbedt_vl_desc_proc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_perc_desconto: TLabel
          Left = 243
          Top = 132
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = '% Desconto'
          FocusControl = dbedt_vl_perc_desc_proc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_total: TLabel
          Left = 360
          Top = 132
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Total'
          FocusControl = dbedt_vl_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 476
          Top = 132
          Width = 51
          Height = 13
          Caption = 'N'#186' Lanc.'
          FocusControl = dbedt_nr_lanc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 390
          Top = 48
          Width = 50
          Height = 13
          Caption = 'Dt. Solic'
          FocusControl = dbedt_dt_solic_pagto_proc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 583
          Top = 87
          Width = 45
          Height = 13
          Caption = 'N'#186' DOC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_pagto_proc: TDBEdit
          Left = 12
          Top = 145
          Width = 101
          Height = 21
          DataField = 'VL_PAGTO'
          DataSource = datm_monta_pagto.ds_solic_pagto
          TabOrder = 3
          OnChange = dbedt_cd_itemChange
          OnEnter = dbedt_vl_pagto_procEnter
          OnExit = dbedt_vl_pagto_procExit
        end
        object dbedt_nm_item: TDBEdit
          Left = 49
          Top = 19
          Width = 205
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookItem'
          DataSource = datm_monta_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_nm_banco: TDBEdit
          Left = 331
          Top = 101
          Width = 210
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_monta_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_nm_favorecido: TDBEdit
          Left = 56
          Top = 101
          Width = 198
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookFavorecido'
          DataSource = datm_monta_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_cd_status: TDBEdit
          Left = 296
          Top = 19
          Width = 240
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookStatus'
          DataSource = datm_monta_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_tp_destino: TDBEdit
          Left = 12
          Top = 61
          Width = 148
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookTpDestino'
          DataSource = datm_monta_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 10
          OnChange = dbedt_cd_itemChange
        end
        object dbedt_dt_pagto: TDBEdit
          Left = 177
          Top = 61
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_PAGTO'
          DataSource = datm_monta_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 11
          OnChange = dbedt_cd_itemChange
        end
        object dbedt_cd_calculo: TDBEdit
          Left = 295
          Top = 61
          Width = 78
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_DOCTO'
          DataSource = datm_monta_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 12
          OnChange = dbedt_cd_itemChange
          OnExit = dbedt_cd_calculoExit
          OnKeyDown = dbedt_cd_bancoKeyDown
        end
        object dbedt_vl_desc_proc: TDBEdit
          Left = 127
          Top = 145
          Width = 101
          Height = 21
          DataField = 'VL_DESCONTO'
          DataSource = datm_monta_pagto.ds_solic_pagto
          TabOrder = 4
          OnChange = dbedt_cd_itemChange
          OnEnter = dbedt_vl_desc_procEnter
          OnExit = dbedt_vl_desc_procExit
        end
        object dbedt_vl_perc_desc_proc: TDBEdit
          Left = 243
          Top = 145
          Width = 101
          Height = 21
          DataField = 'VL_PERC_DESCONTO'
          DataSource = datm_monta_pagto.ds_solic_pagto
          TabOrder = 5
          OnChange = dbedt_cd_itemChange
          OnEnter = dbedt_vl_perc_desc_procEnter
          OnExit = dbedt_vl_perc_desc_procExit
        end
        object dbedt_vl_total: TDBEdit
          Left = 360
          Top = 145
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CalcVlTotal'
          DataSource = datm_monta_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_nr_lanc: TDBEdit
          Left = 476
          Top = 145
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_LANCAMENTO'
          DataSource = datm_monta_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_dt_solic_pagto_proc: TDBEdit
          Left = 390
          Top = 61
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_SOLIC_PAGTO'
          DataSource = datm_monta_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 15
          OnChange = dbedt_cd_itemChange
        end
        object dbedt_cd_item: TDBEdit
          Left = 12
          Top = 19
          Width = 38
          Height = 21
          DataField = 'CD_ITEM'
          DataSource = datm_monta_pagto.ds_solic_pagto
          TabOrder = 0
          OnChange = dbedt_cd_itemChange
          OnExit = dbedt_cd_itemExit
          OnKeyDown = dbedt_cd_bancoKeyDown
        end
        object dbedt_cd_favorecido: TDBEdit
          Left = 12
          Top = 101
          Width = 45
          Height = 21
          DataField = 'CD_FAVORECIDO'
          DataSource = datm_monta_pagto.ds_solic_pagto
          TabOrder = 1
          OnChange = dbedt_cd_itemChange
          OnExit = dbedt_cd_favorecidoExit
          OnKeyDown = dbedt_cd_bancoKeyDown
        end
        object dbedt_cd_banco: TDBEdit
          Left = 295
          Top = 101
          Width = 37
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_monta_pagto.ds_solic_pagto
          TabOrder = 2
          OnChange = dbedt_cd_itemChange
          OnExit = dbedt_cd_bancoExit
          OnKeyDown = dbedt_cd_bancoKeyDown
        end
        object msk_nr_doc_proc: TMaskEdit
          Left = 583
          Top = 100
          Width = 64
          Height = 21
          Enabled = False
          EditMask = '999999;0; '
          MaxLength = 6
          TabOrder = 16
        end
      end
      object msk_cd_unid_neg_proc: TMaskEdit
        Left = 8
        Top = 19
        Width = 29
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
        OnEnter = msk_cd_unid_neg_procEnter
        OnExit = msk_cd_unid_neg_procExit
        OnKeyDown = dbedt_cd_bancoKeyDown
      end
      object edt_cd_cliente: TEdit
        Left = 8
        Top = 61
        Width = 45
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 5
      end
      object msk_cd_produto: TMaskEdit
        Left = 261
        Top = 19
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
        TabOrder = 2
        OnEnter = msk_cd_produtoEnter
        OnExit = msk_cd_produtoExit
        OnKeyDown = dbedt_cd_bancoKeyDown
      end
      object edt_cd_servico: TEdit
        Left = 261
        Top = 61
        Width = 33
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 7
      end
    end
    object ts_ref: TTabSheet
      Caption = 'Pagamentos'
      object Shape3: TShape
        Left = 0
        Top = 0
        Width = 734
        Height = 61
        Align = alTop
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lbl_pagto: TLabel
        Left = 326
        Top = 14
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 14
        Top = 13
        Width = 62
        Height = 13
        Caption = 'Unid. Neg.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_unid_neg_pagto: TSpeedButton
        Left = 288
        Top = 25
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
        OnClick = btn_co_unid_neg_pagtoClick
      end
      object dbgrdRef: TDBGrid
        Left = 0
        Top = 61
        Width = 734
        Height = 162
        Align = alClient
        DataSource = datm_monta_pagto.ds_ref
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_REF'
            Title.Caption = 'Lote'
            Title.Color = clBlack
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_PAGTO'
            Title.Color = clBlack
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookBanco'
            Title.Color = clBlack
            Width = 151
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookFavorecido'
            Title.Color = clBlack
            Width = 219
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_DOCTO'
            Title.Color = clBlack
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookStatusCheque'
            Title.Color = clBlack
            Visible = True
          end>
      end
      object dbgrdRefItens: TDBGrid
        Left = 0
        Top = 223
        Width = 734
        Height = 207
        Align = alBottom
        DataSource = datm_monta_pagto.ds_ref_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDblClick = dbgrdRefItensDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'calcMONTAR'
            Font.Charset = SYMBOL_CHARSET
            Font.Color = clTeal
            Font.Height = -12
            Font.Name = 'Wingdings'
            Font.Style = [fsBold]
            Title.Caption = 'Selec.'
            Title.Color = clBlack
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CalcNrProcesso'
            Title.Color = clBlack
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_LANCAMENTO'
            Title.Color = clBlack
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookItem'
            Title.Color = clBlack
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_PAGTO'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookStatus'
            Title.Color = clBlack
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookTpDestino'
            Title.Color = clBlack
            Width = 131
            Visible = True
          end>
      end
      object msk_dt_pagto: TMaskEdit
        Left = 327
        Top = 26
        Width = 96
        Height = 21
        EditMask = '!99/99/0000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Text = '  /  /    '
        OnEnter = msk_dt_pagtoEnter
        OnExit = msk_dt_pagtoExit
      end
      object edt_nm_unid_neg_pagto: TEdit
        Left = 54
        Top = 26
        Width = 233
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 4
      end
      object msk_cd_unid_neg_pagto: TMaskEdit
        Left = 15
        Top = 26
        Width = 40
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
        OnEnter = msk_cd_unid_neg_pagtoEnter
        OnExit = msk_cd_unid_neg_pagtoExit
        OnKeyDown = dbedt_cd_bancoKeyDown
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 513
    Top = 220
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      OnClick = btn_cancelarClick
    end
    object mi_montar: TMenuItem
      Caption = '&Montar'
      Enabled = False
      OnClick = btnMontagemClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
    object mi_canc_lanc: TMenuItem
      Caption = 'Ca&ncelar Item'
      Enabled = False
      OnClick = btn_canc_lancClick
    end
    object mi_desmarca: TMenuItem
      Caption = '&Desmarca'
      Visible = False
      OnClick = btn_desmarca_todasClick
    end
    object mi_marca: TMenuItem
      Caption = 'M&arca'
      OnClick = btn_marca_todasClick
    end
  end
end
