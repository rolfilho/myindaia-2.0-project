object frm_monta_adm: Tfrm_monta_adm
  Left = 173
  Top = 108
  Width = 640
  Height = 480
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Montagem de Movimentos Administrativos'
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
    Left = 4
    Top = 0
    Width = 625
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 340
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
    object btn_salvar: TSpeedButton
      Left = 9
      Top = 12
      Width = 25
      Height = 25
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
      Left = 39
      Top = 12
      Width = 25
      Height = 25
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
    object btn_montar: TSpeedButton
      Left = 71
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Montar Pagamentos'
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
      OnClick = btn_montarClick
    end
    object btn_desmarca_todas: TSpeedButton
      Left = 135
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Desmarcar Todas'
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
      Left = 160
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Marcar Todas'
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
      Left = 103
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Cancelar Conta Cont'#225'bil'
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
    object dbnvgAdm: TDBNavigator
      Left = 213
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_monta_adm.ds_grd_adm
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
      BeforeAction = dbnvgAdmBeforeAction
    end
  end
  object pgctrl_monta_adm: TPageControl
    Left = 0
    Top = 52
    Width = 631
    Height = 383
    ActivePage = ts_favorecido
    HotTrack = True
    TabOrder = 1
    OnChange = pgctrl_monta_admChange
    object ts_favorecido: TTabSheet
      Caption = 'Por Favorecido'
      object lbl_banco: TLabel
        Left = 309
        Top = 37
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
        Left = 580
        Top = 49
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
        OnClick = btn_co_bancoClick
      end
      object lbl_favorecido: TLabel
        Left = 3
        Top = 37
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
        Left = 275
        Top = 49
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
        OnClick = btn_co_favorecidoClick
      end
      object btn_co_unid_neg: TSpeedButton
        Left = 276
        Top = 13
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
        OnClick = btn_co_unid_negClick
      end
      object Label3: TLabel
        Left = 5
        Top = 0
        Width = 117
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidade de Neg'#243'cio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dt_termino: TLabel
        Left = 386
        Top = -1
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
      object lbl_dt_inicio: TLabel
        Left = 309
        Top = -1
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
      object lbl_total: TLabel
        Left = 7
        Top = 336
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
        Top = 336
        Width = 98
        Height = 13
        Alignment = taRightJustify
        DataField = 'VL_TOTAL'
        DataSource = datm_monta_adm.ds_soma_adm
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_tot_selecionado: TLabel
        Left = 201
        Top = 336
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
        Left = 385
        Top = 336
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
      object msk_cd_banco: TMaskEdit
        Left = 308
        Top = 50
        Width = 38
        Height = 21
        EditMask = '999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 6
        OnEnter = msk_cd_bancoEnter
        OnExit = msk_cd_bancoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_banco: TEdit
        Left = 349
        Top = 50
        Width = 227
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 7
      end
      object msk_cd_favorecido: TMaskEdit
        Left = 3
        Top = 50
        Width = 38
        Height = 21
        EditMask = '99999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 5
        OnEnter = msk_cd_favorecidoEnter
        OnExit = msk_cd_favorecidoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_favorecido: TEdit
        Left = 44
        Top = 50
        Width = 227
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 8
      end
      object msk_cd_unid_neg: TMaskEdit
        Left = 4
        Top = 14
        Width = 25
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
        OnEnter = msk_cd_unid_negEnter
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_unid_neg: TEdit
        Left = 34
        Top = 14
        Width = 236
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 9
      end
      object msk_dt_inicio: TMaskEdit
        Left = 309
        Top = 15
        Width = 73
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
        OnEnter = msk_dt_inicioEnter
        OnExit = msk_dt_inicioExit
      end
      object msk_dt_termino: TMaskEdit
        Left = 386
        Top = 15
        Width = 73
        Height = 21
        EditMask = '!99/99/9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 2
        Text = '  /  /    '
        OnEnter = msk_dt_terminoEnter
        OnExit = msk_dt_terminoExit
      end
      object pgctrl_monta_adm2: TPageControl
        Left = 1
        Top = 73
        Width = 623
        Height = 258
        ActivePage = ts_lista
        TabOrder = 10
        OnChange = pgctrl_monta_adm2Change
        object ts_lista: TTabSheet
          Caption = '   Lista   '
          object dbgrdMontaAdm: TDBGrid
            Left = -1
            Top = 2
            Width = 614
            Height = 227
            DataSource = datm_monta_adm.ds_grd_adm
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWhite
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnCellClick = dbgrdMontaAdmCellClick
            OnKeyDown = dbgrdMontaAdmKeyDown
            OnKeyUp = dbgrdMontaAdmKeyUp
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_CT_CONTABIL'
                Title.Color = clBlack
                Width = 94
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookContaContabil'
                Title.Caption = 'Conta Cont'#225'bil'
                Title.Color = clBlack
                Width = 199
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_LANCTO'
                Title.Alignment = taCenter
                Title.Color = clBlack
                Width = 102
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookStatus'
                Title.Color = clBlack
                Width = 183
                Visible = True
              end>
          end
        end
        object ts_adm: TTabSheet
          Caption = 'Movimentos'
          object pnl_por_favorecido: TPanel
            Left = 1
            Top = 1
            Width = 612
            Height = 228
            BevelOuter = bvLowered
            TabOrder = 0
            object lbl_valor2: TLabel
              Left = 8
              Top = 110
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
            object lbl_status2: TLabel
              Left = 401
              Top = 74
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
            object lbl_dt_vencto: TLabel
              Left = 109
              Top = 39
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dt. Vencto'
              FocusControl = dbedt_dt_vencto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_dt_lancto: TLabel
              Left = 6
              Top = 39
              Width = 61
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dt. Lancto'
              FocusControl = dbedt_dt_lancto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_acesso: TLabel
              Left = 7
              Top = 2
              Width = 42
              Height = 13
              Caption = 'Acesso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_aux: TLabel
              Left = 56
              Top = 2
              Width = 22
              Height = 13
              Caption = 'Aux'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_ct_contabil: TLabel
              Left = 89
              Top = 2
              Width = 84
              Height = 13
              Alignment = taRightJustify
              Caption = 'Conta Cont'#225'bil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_ct_contabil: TSpeedButton
              Left = 481
              Top = 15
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
              OnClick = btn_co_ct_contabilClick
            end
            object lbl_dt_pagto: TLabel
              Left = 214
              Top = 39
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
            object lbl_historico: TLabel
              Left = 7
              Top = 74
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hist'#243'rico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_historico: TSpeedButton
              Left = 364
              Top = 87
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
              OnClick = btn_co_historicoClick
            end
            object lbl_desconto: TLabel
              Left = 120
              Top = 110
              Width = 88
              Height = 13
              Caption = 'Valor Desconto'
              FocusControl = dbedt_vl_desconto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_perc_desconto: TLabel
              Left = 242
              Top = 110
              Width = 68
              Height = 13
              Alignment = taRightJustify
              Caption = '% Desconto'
              FocusControl = dbedt_vl_perc_desconto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_vl_total: TLabel
              Left = 369
              Top = 110
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
            object lbl_nr_lancamento: TLabel
              Left = 531
              Top = 2
              Width = 58
              Height = 13
              Caption = 'N'#186' Lancto'
              FocusControl = dbedt_nr_lancamento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_vl_pagto: TDBEdit
              Left = 6
              Top = 123
              Width = 101
              Height = 21
              DataField = 'VL_LANCTO'
              DataSource = datm_monta_adm.ds_monta_adm
              TabOrder = 6
              OnChange = dbedt_cd_acessoChange
              OnEnter = dbedt_vl_pagtoEnter
              OnExit = dbedt_vl_pagtoExit
            end
            object dbedt_dt_vencto: TDBEdit
              Left = 109
              Top = 52
              Width = 99
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'DT_VENCTO'
              DataSource = datm_monta_adm.ds_monta_adm
              ReadOnly = True
              TabOrder = 9
            end
            object dbedt_cd_status2: TDBEdit
              Left = 401
              Top = 88
              Width = 203
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookStatus'
              DataSource = datm_monta_adm.ds_monta_adm
              ReadOnly = True
              TabOrder = 10
            end
            object dbedt_dt_lancto: TDBEdit
              Left = 6
              Top = 52
              Width = 99
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'DT_LANCTO'
              DataSource = datm_monta_adm.ds_monta_adm
              ReadOnly = True
              TabOrder = 11
            end
            object dbrdgrp_natureza: TDBRadioGroup
              Left = 317
              Top = 39
              Width = 138
              Height = 35
              Caption = 'Natureza'
              Columns = 2
              DataField = 'TP_NATUREZA'
              DataSource = datm_monta_adm.ds_monta_adm
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Cr'#233'dito'
                'D'#233'bito')
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              Values.Strings = (
                'C'
                'D')
              OnChange = dbedt_cd_acessoChange
            end
            object dbedt_cd_acesso: TDBEdit
              Left = 7
              Top = 16
              Width = 32
              Height = 21
              DataField = 'CD_ACESSO'
              DataSource = datm_monta_adm.ds_monta_adm
              TabOrder = 0
              OnChange = dbedt_cd_acessoChange
              OnEnter = dbedt_cd_acessoEnter
              OnExit = dbedt_cd_acessoExit
            end
            object dbedt_cd_aux: TDBEdit
              Left = 55
              Top = 16
              Width = 32
              Height = 21
              DataField = 'CD_AUX'
              DataSource = datm_monta_adm.ds_monta_adm
              TabOrder = 1
              OnChange = dbedt_cd_acessoChange
              OnEnter = dbedt_cd_auxEnter
              OnExit = dbedt_cd_auxExit
            end
            object dbedt_cd_ct_contabil: TDBEdit
              Left = 89
              Top = 16
              Width = 73
              Height = 21
              DataField = 'CD_CT_CONTABIL'
              DataSource = datm_monta_adm.ds_monta_adm
              TabOrder = 2
              OnChange = dbedt_cd_acessoChange
              OnExit = dbedt_cd_ct_contabilExit
              OnKeyDown = msk_cd_unid_negKeyDown
            end
            object dbedt_nm_ct_contabil: TDBEdit
              Left = 166
              Top = 16
              Width = 311
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookCtContabil'
              DataSource = datm_monta_adm.ds_monta_adm
              ReadOnly = True
              TabOrder = 12
            end
            object dbedt_dt_pagto: TDBEdit
              Left = 214
              Top = 52
              Width = 99
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'DT_PAGTO'
              DataSource = datm_monta_adm.ds_monta_adm
              ReadOnly = True
              TabOrder = 13
            end
            object dbedt_cd_historico: TDBEdit
              Left = 7
              Top = 88
              Width = 47
              Height = 21
              DataField = 'CD_HISTORICO'
              DataSource = datm_monta_adm.ds_monta_adm
              TabOrder = 5
              OnChange = dbedt_cd_acessoChange
              OnExit = dbedt_cd_historicoExit
              OnKeyDown = msk_cd_unid_negKeyDown
            end
            object dbedt_nm_historico: TDBEdit
              Left = 56
              Top = 88
              Width = 304
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookHistorico'
              DataSource = datm_monta_adm.ds_monta_adm
              ReadOnly = True
              TabOrder = 14
            end
            object dbedt_vl_desconto: TDBEdit
              Left = 120
              Top = 123
              Width = 101
              Height = 21
              DataField = 'VL_DESCONTO'
              DataSource = datm_monta_adm.ds_monta_adm
              TabOrder = 7
              OnChange = dbedt_cd_acessoChange
              OnEnter = dbedt_vl_descontoEnter
              OnExit = dbedt_vl_descontoExit
            end
            object dbedt_vl_perc_desconto: TDBEdit
              Left = 242
              Top = 123
              Width = 101
              Height = 21
              DataField = 'VL_PERC_DESCONTO'
              DataSource = datm_monta_adm.ds_monta_adm
              TabOrder = 8
              OnChange = dbedt_cd_acessoChange
              OnEnter = dbedt_vl_perc_descontoEnter
              OnExit = dbedt_vl_perc_descontoExit
            end
            object dbedt_vl_total: TDBEdit
              Left = 369
              Top = 123
              Width = 101
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CalcVlTotal'
              DataSource = datm_monta_adm.ds_monta_adm
              ReadOnly = True
              TabOrder = 15
            end
            object dbm_tx_historico: TDBMemo
              Left = 6
              Top = 147
              Width = 599
              Height = 78
              DataField = 'TX_HISTORICO'
              DataSource = datm_monta_adm.ds_monta_adm
              TabOrder = 16
              OnChange = dbedt_cd_acessoChange
            end
            object dbedt_nr_lancamento: TDBEdit
              Left = 531
              Top = 16
              Width = 40
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NR_LANCAMENTO'
              DataSource = datm_monta_adm.ds_monta_adm
              ReadOnly = True
              TabOrder = 17
            end
            object dbrdgrp_tp_lancamento: TDBRadioGroup
              Left = 466
              Top = 40
              Width = 138
              Height = 32
              Caption = 'Lan'#231'amento'
              Columns = 2
              DataField = 'TP_LANCAMENTO'
              DataSource = datm_monta_adm.ds_monta_adm
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Cheque'
                'Nota')
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
              Values.Strings = (
                'C'
                'D')
              OnChange = dbedt_cd_acessoChange
            end
          end
        end
      end
      object pnl_natureza: TPanel
        Left = 466
        Top = 0
        Width = 76
        Height = 45
        BevelInner = bvLowered
        TabOrder = 3
        object rbtn_debito: TRadioButton
          Left = 4
          Top = 22
          Width = 68
          Height = 18
          Caption = 'D'#233'bito'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          TabStop = True
          OnClick = rbtn_debitoClick
        end
        object rbtn_credito: TRadioButton
          Left = 4
          Top = 6
          Width = 68
          Height = 17
          Caption = 'Cr'#233'dito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = rbtn_creditoClick
        end
      end
      object pnl_lancamento: TPanel
        Left = 546
        Top = 0
        Width = 76
        Height = 45
        BevelInner = bvLowered
        TabOrder = 4
        object rbtn_nota: TRadioButton
          Left = 4
          Top = 22
          Width = 68
          Height = 18
          Caption = 'Nota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = rbtn_notaClick
        end
        object rbtn_cheque: TRadioButton
          Left = 4
          Top = 6
          Width = 68
          Height = 17
          Caption = 'Cheque'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = rbtn_chequeClick
        end
      end
    end
    object ts_pagto: TTabSheet
      Caption = 'Pagamentos'
      object lbl_pagto: TLabel
        Left = 316
        Top = 2
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
      object Label1: TLabel
        Left = 1
        Top = 2
        Width = 117
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidade de Neg'#243'cio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_unid_neg_pagto: TSpeedButton
        Left = 276
        Top = 15
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
        OnClick = btn_co_unid_neg_pagtoClick
      end
      object dbgrdRefPagtos: TDBGrid
        Left = 1
        Top = 44
        Width = 624
        Height = 94
        DataSource = datm_monta_adm.ds_ref_pagto
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
            FieldName = 'NR_REF'
            Title.Caption = 'Lote'
            Title.Color = clBlack
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_LANCTO'
            Title.Color = clBlack
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookBanco'
            Title.Color = clBlack
            Width = 157
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
          end>
      end
      object dbgrdRefPagtosItens: TDBGrid
        Left = 1
        Top = 143
        Width = 624
        Height = 207
        DataSource = datm_monta_adm.ds_ref_pagto_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_CT_CONTABIL'
            Title.Color = clBlack
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookContaContabil'
            Title.Color = clBlack
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_LANCTO'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookStatus'
            Title.Color = clBlack
            Width = 181
            Visible = True
          end>
      end
      object msk_dt_pagto: TMaskEdit
        Left = 316
        Top = 16
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
        TabOrder = 1
        Text = '  /  /    '
        OnEnter = msk_dt_pagtoEnter
        OnExit = msk_dt_pagtoExit
      end
      object msk_cd_unid_neg_pagto: TMaskEdit
        Left = 1
        Top = 16
        Width = 25
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
        OnEnter = msk_cd_unid_neg_pagtoEnter
        OnExit = msk_cd_unid_neg_pagtoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_unid_neg_pagto: TEdit
        Left = 30
        Top = 16
        Width = 240
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 4
      end
    end
    object ts_recebto: TTabSheet
      Caption = 'Recebimentos'
      object Label2: TLabel
        Left = 316
        Top = 2
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
      object Label4: TLabel
        Left = 1
        Top = 2
        Width = 117
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidade de Neg'#243'cio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_unid_neg_recebto: TSpeedButton
        Left = 276
        Top = 16
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
        OnClick = btn_co_unid_neg_recebtoClick
      end
      object msk_dt_recebto: TMaskEdit
        Left = 316
        Top = 16
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
        TabOrder = 1
        Text = '  /  /    '
        OnEnter = msk_dt_recebtoEnter
        OnExit = msk_dt_recebtoExit
      end
      object dbgrdRefRecebto: TDBGrid
        Left = 1
        Top = 44
        Width = 624
        Height = 94
        DataSource = datm_monta_adm.ds_ref_recebto
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
            FieldName = 'NR_REF'
            Title.Caption = 'Lote'
            Title.Color = clBlack
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_LANCTO'
            Title.Color = clBlack
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookBanco'
            Title.Color = clBlack
            Width = 157
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
          end>
      end
      object dbgrdRefRecebtosItens: TDBGrid
        Left = 1
        Top = 142
        Width = 624
        Height = 207
        DataSource = datm_monta_adm.ds_ref_recebto_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_CT_CONTABIL'
            Title.Color = clBlack
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookContaContabil'
            Title.Color = clBlack
            Width = 198
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_LANCTO'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookStatus'
            Title.Color = clBlack
            Width = 181
            Visible = True
          end>
      end
      object msk_cd_unid_neg_recebto: TMaskEdit
        Left = 1
        Top = 16
        Width = 25
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
        OnEnter = msk_cd_unid_neg_recebtoEnter
        OnExit = msk_cd_unid_neg_recebtoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_unid_neg_recebto: TEdit
        Left = 30
        Top = 16
        Width = 240
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 4
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 513
    Top = 4
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
      OnClick = btn_montarClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
