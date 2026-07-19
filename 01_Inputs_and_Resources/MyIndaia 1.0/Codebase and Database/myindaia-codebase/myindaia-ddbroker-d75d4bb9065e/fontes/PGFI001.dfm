object frm_financeiro: Tfrm_financeiro
  Left = 133
  Top = 119
  Width = 750
  Height = 619
  Caption = 'Financeiro - Lan'#231'amentos'
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_financeiro: TPageControl
    Left = 0
    Top = 92
    Width = 742
    Height = 481
    ActivePage = ts_contabil
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_financeiroChange
    OnChanging = pgctrl_financeiroChanging
    object ts_contabil: TTabSheet
      Caption = 'Administrativo'
      object pgctrl_contabil: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 453
        ActivePage = ts_dados_contabil
        Align = alClient
        HotTrack = True
        TabOrder = 0
        OnChange = pgctrl_financeiroChange
        OnChanging = pgctrl_financeiroChanging
        object ts_lista_contabil: TTabSheet
          Caption = '    &Lista    '
          object dbg_contabil: TDBGrid
            Left = 0
            Top = 0
            Width = 726
            Height = 425
            Align = alClient
            Color = clWhite
            DataSource = datm_financeiro.ds_caixa_contabil
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
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
                FieldName = 'NR_LANCAMENTO'
                Title.Caption = 'Lan'#231'.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 57
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_CT_CONTABIL'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 86
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookCtContabil'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_LANCAMENTO'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookTpNatContabil'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookCanceladoContabil'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end>
          end
        end
        object ts_dados_contabil: TTabSheet
          Caption = '   &Dados B'#225'sicos   '
          object pnl_caixa_contabil: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 425
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 0
            object lbl_nr_lanc_contabil: TLabel
              Left = 492
              Top = 4
              Width = 70
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lan'#231'amento'
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object lbl_ct_contabil: TLabel
              Left = 92
              Top = 43
              Width = 82
              Height = 13
              Caption = 'Contra Partida'
              FocusControl = dbedt_nm_ct_contabil2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_ct_contabil: TSpeedButton
              Left = 447
              Top = 55
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
              OnClick = btn_co_ct_contabilClick
            end
            object btn_co_historico: TSpeedButton
              Left = 447
              Top = 89
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
              OnClick = btn_co_historicoClick
            end
            object lbl_historico_contabil: TLabel
              Left = 9
              Top = 78
              Width = 51
              Height = 13
              Caption = 'Hist'#243'rico'
              FocusControl = dbedt_nm_historico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_vl_lanc_contabil: TLabel
              Left = 9
              Top = 169
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor'
              FocusControl = dbedt_vl_lanc_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_cd_ct_custo: TLabel
              Left = 505
              Top = 220
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
              FocusControl = dbedt_nm_ct_custo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object btn_co_ct_custo: TSpeedButton
              Left = 671
              Top = 233
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
              OnClick = btn_co_ct_custoClick
            end
            object btn_co_banco_contabil: TSpeedButton
              Left = 447
              Top = 238
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
              OnClick = btn_co_banco_contabilClick
            end
            object lbl_banco_contabil: TLabel
              Left = 177
              Top = 224
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
            object lbl_nr_cheque_contabil: TLabel
              Left = 177
              Top = 267
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Docto N'#186
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 9
              Top = 5
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
            object btn_co_cont_fav: TSpeedButton
              Left = 447
              Top = 19
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
              OnClick = btn_co_cont_favClick
            end
            object Label8: TLabel
              Left = 86
              Top = 169
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'IR-Fonte'
              FocusControl = dbedt_vl_ir_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_canc_cont: TLabel
              Left = 489
              Top = 59
              Width = 94
              Height = 17
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'CANCELADO'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object lbl_acesso: TLabel
              Left = 9
              Top = 43
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
              Left = 58
              Top = 43
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
            object Label13: TLabel
              Left = 521
              Top = 169
              Width = 98
              Height = 13
              Caption = 'Data Concilia'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 177
              Top = 169
              Width = 30
              Height = 13
              Caption = 'INSS'
              FocusControl = DBEdit1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 263
              Top = 169
              Width = 72
              Height = 13
              Caption = 'PIS/COFINS'
              FocusControl = DBEdit2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label16: TLabel
              Left = 352
              Top = 169
              Width = 21
              Height = 13
              Caption = 'ISS'
              FocusControl = DBEdit3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_contabiliza: TLabel
              Left = 443
              Top = 169
              Width = 63
              Height = 13
              Caption = 'Contabiliza'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label25: TLabel
              Left = 177
              Top = 309
              Width = 38
              Height = 13
              Caption = 'Rateio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_rateio: TSpeedButton
              Left = 447
              Top = 322
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
              OnClick = btn_rateioClick
            end
            object dbedt_nr_lanc_contabil: TDBEdit
              Left = 492
              Top = 19
              Width = 68
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NR_LANCAMENTO'
              DataSource = datm_financeiro.ds_caixa_contabil
              MaxLength = 3
              ReadOnly = True
              TabOrder = 20
            end
            object dbedt_cd_ct_contabil: TDBEdit
              Left = 94
              Top = 56
              Width = 89
              Height = 21
              DataField = 'CD_CT_CONTABIL'
              DataSource = datm_financeiro.ds_caixa_contabil
              TabOrder = 3
              OnChange = dbedt_cd_ct_contabilChange
              OnExit = dbedt_cd_ct_contabilExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object dbedt_nm_ct_contabil2: TDBEdit
              Left = 586
              Top = 32
              Width = 256
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookCtContabil'
              DataSource = datm_financeiro.ds_caixa_contabil
              ReadOnly = True
              TabOrder = 21
              Visible = False
            end
            object dbedt_nm_historico: TDBEdit
              Left = 92
              Top = 90
              Width = 352
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookHistorico'
              DataSource = datm_financeiro.ds_caixa_contabil
              ReadOnly = True
              TabOrder = 22
            end
            object dbedt_cd_historico: TDBEdit
              Left = 9
              Top = 90
              Width = 79
              Height = 21
              DataField = 'CD_HISTORICO'
              DataSource = datm_financeiro.ds_caixa_contabil
              TabOrder = 5
              OnChange = dbedt_cd_ct_contabilChange
              OnExit = dbedt_cd_historicoExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object dbedt_vl_lanc_contabil: TDBEdit
              Left = 9
              Top = 182
              Width = 75
              Height = 21
              DataField = 'VL_LANCAMENTO'
              DataSource = datm_financeiro.ds_caixa_contabil
              TabOrder = 7
              OnChange = dbedt_cd_ct_contabilChange
            end
            object dbrdgrp_natureza: TDBRadioGroup
              Left = 489
              Top = 81
              Width = 181
              Height = 35
              Caption = 'Natureza'
              Columns = 2
              DataField = 'TP_NATUREZA'
              DataSource = datm_financeiro.ds_caixa_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Cr'#233'dito'
                'D'#233'bito')
              ParentFont = False
              TabOrder = 6
              Values.Strings = (
                'C'
                'D')
              OnChange = dbrdgrp_naturezaChange
            end
            object dbedt_cd_ct_custo: TDBEdit
              Left = 505
              Top = 234
              Width = 32
              Height = 21
              DataField = 'CD_CT_CUSTO'
              DataSource = datm_financeiro.ds_caixa_contabil
              TabOrder = 18
              Visible = False
              OnChange = btn_co_ct_custoClick
              OnExit = dbedt_cd_ct_custoExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object dbedt_nm_ct_custo: TDBEdit
              Left = 539
              Top = 234
              Width = 134
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookCtCusto'
              DataSource = datm_financeiro.ds_caixa_contabil
              ReadOnly = True
              TabOrder = 23
              Visible = False
            end
            object dbedt_nm_banco_contabil: TDBEdit
              Left = 214
              Top = 239
              Width = 231
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookBancoContabil'
              DataSource = datm_financeiro.ds_caixa_contabil
              ReadOnly = True
              TabOrder = 24
            end
            object dbedt_cd_banco_contabil: TDBEdit
              Left = 177
              Top = 239
              Width = 36
              Height = 21
              DataField = 'CD_BANCO'
              DataSource = datm_financeiro.ds_caixa_contabil
              TabOrder = 15
              OnChange = dbedt_cd_ct_contabilChange
              OnExit = dbedt_cd_banco_contabilExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object dbedt_nr_cheque_contabil: TDBEdit
              Left = 177
              Top = 281
              Width = 104
              Height = 21
              DataField = 'NR_CHEQUE'
              DataSource = datm_financeiro.ds_caixa_contabil
              TabOrder = 16
              OnChange = dbedt_cd_ct_contabilChange
            end
            object dbrdgrp_forma_pagto_contabil: TDBRadioGroup
              Left = 11
              Top = 224
              Width = 155
              Height = 120
              Caption = '&Forma de Pagamento'
              DataField = 'TP_PAGAMENTO'
              DataSource = datm_financeiro.ds_caixa_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Dinheiro'
                'Cheque'
                'TED'
                'DOC / D'#233'bito Conta')
              ParentFont = False
              TabOrder = 14
              Values.Strings = (
                '$'
                'C'
                'T'
                'D')
              OnChange = dbrdgrp_forma_pagto_contabilChange
            end
            object dbedt_nm_favor_contabil: TDBEdit
              Left = 57
              Top = 19
              Width = 387
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookFavorContabil'
              DataSource = datm_financeiro.ds_caixa_contabil
              ReadOnly = True
              TabOrder = 25
            end
            object dbedt_vl_ir_contabil: TDBEdit
              Left = 86
              Top = 182
              Width = 87
              Height = 21
              DataField = 'VL_IR'
              DataSource = datm_financeiro.ds_caixa_contabil
              TabOrder = 8
              OnChange = dbedt_cd_favorecidoChange
            end
            object dbedt_cd_favor_contabil: TDBEdit
              Left = 9
              Top = 19
              Width = 46
              Height = 21
              DataField = 'CD_FAVORECIDO'
              DataSource = datm_financeiro.ds_caixa_contabil
              TabOrder = 0
              OnChange = dbedt_cd_ct_contabilChange
              OnExit = dbedt_cd_favor_contabilExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object dbedt_cd_acesso: TDBEdit
              Left = 9
              Top = 56
              Width = 32
              Height = 21
              DataField = 'CD_ACESSO'
              DataSource = datm_financeiro.ds_caixa_contabil
              TabOrder = 1
              OnEnter = dbedt_cd_acessoEnter
              OnExit = dbedt_cd_acessoExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object dbedt_cd_aux: TDBEdit
              Left = 57
              Top = 56
              Width = 32
              Height = 21
              DataField = 'CD_AUX'
              DataSource = datm_financeiro.ds_caixa_contabil
              TabOrder = 2
              OnEnter = dbedt_cd_auxEnter
              OnExit = dbedt_cd_auxExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object DBEdit1: TDBEdit
              Left = 175
              Top = 182
              Width = 87
              Height = 21
              DataField = 'VL_INSS'
              DataSource = datm_financeiro.ds_caixa_contabil
              TabOrder = 9
              OnChange = dbedt_cd_favorecidoChange
            end
            object DBEdit2: TDBEdit
              Left = 263
              Top = 182
              Width = 87
              Height = 21
              DataField = 'VL_PISCOFINS'
              DataSource = datm_financeiro.ds_caixa_contabil
              TabOrder = 10
              OnChange = dbedt_cd_favorecidoChange
            end
            object DBEdit3: TDBEdit
              Left = 353
              Top = 182
              Width = 87
              Height = 21
              DataField = 'VL_ISS'
              DataSource = datm_financeiro.ds_caixa_contabil
              TabOrder = 11
              OnChange = dbedt_cd_favorecidoChange
            end
            object dblckpbox_in_contabiliza: TDBLookupComboBox
              Left = 443
              Top = 182
              Width = 50
              Height = 21
              DataField = 'IN_CONTABILIZA'
              DataSource = datm_financeiro.ds_caixa_contabil
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListFieldIndex = 1
              ListSource = datm_financeiro.ds_yesno
              TabOrder = 12
              OnClick = dbedt_cd_ct_contabilChange
            end
            object dbedt_dt_vencimento: TDBDateEdit
              Left = 521
              Top = 182
              Width = 90
              Height = 21
              DataField = 'DT_CONCILIACAO'
              DataSource = datm_financeiro.ds_caixa_contabil
              NumGlyphs = 2
              TabOrder = 13
              OnChange = dbedt_cd_ct_contabilChange
            end
            object dbedt_nm_rateio: TEdit
              Left = 219
              Top = 323
              Width = 225
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 19
            end
            object dbedt_cd_rateio: TDBEdit
              Left = 177
              Top = 323
              Width = 41
              Height = 21
              DataField = 'CD_RATEIO'
              DataSource = datm_financeiro.ds_caixa_contabil
              Enabled = False
              TabOrder = 17
              OnChange = btn_rateioClick
              OnExit = dbedt_cd_rateioExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object dbm_nm_hist_contabil: TDBMemo
              Left = 91
              Top = 113
              Width = 352
              Height = 49
              AutoDisplay = False
              DataField = 'NM_HISTORICO'
              DataSource = datm_financeiro.ds_caixa_contabil
              MaxLength = 180
              TabOrder = 26
              OnChange = dbedt_cd_ct_contabilChange
            end
            object dbedt_nm_ct_contabil: TEdit
              Left = 187
              Top = 56
              Width = 256
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 4
            end
          end
        end
        object ts_distr_gerencial: TTabSheet
          Caption = 'Distribui'#231#227'o &Gerencial'
          TabVisible = False
          object pnl_distr_gerencial: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 425
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 0
            object lbl_ct_gerencial: TLabel
              Left = 292
              Top = 10
              Width = 92
              Height = 13
              Caption = 'Conta Gerencial'
              FocusControl = dbedt_nm_ct_gerencial
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel
              Left = 292
              Top = 52
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor'
              FocusControl = dbedt_vl_distr
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_ct_gerencial: TSpeedButton
              Left = 572
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
              OnClick = btn_co_ct_gerencialClick
            end
            object Label9: TLabel
              Left = 292
              Top = 223
              Width = 121
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor do Lan'#231'amento'
              FocusControl = dbedt_vl_lanc_cont
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbgrd_distr_gerencial: TDBGrid
              Left = 2
              Top = 2
              Width = 279
              Height = 421
              Align = alLeft
              Color = clWhite
              DataSource = datm_financeiro.ds_caixa_contabil_distr
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
              ReadOnly = True
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'LookCtDistrGerencial'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 161
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_DISTRIBUICAO'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end>
            end
            object dbedt_cd_ct_gerencial: TDBEdit
              Left = 292
              Top = 25
              Width = 33
              Height = 21
              DataField = 'CD_CT_GERENCIAL'
              DataSource = datm_financeiro.ds_caixa_contabil_distr
              TabOrder = 0
              OnChange = dbedt_cd_ct_gerencialChange
              OnExit = dbedt_cd_ct_gerencialExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object dbedt_nm_ct_gerencial: TDBEdit
              Left = 328
              Top = 25
              Width = 241
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookCtDistrGerencial'
              DataSource = datm_financeiro.ds_caixa_contabil_distr
              ReadOnly = True
              TabOrder = 3
            end
            object dbedt_vl_distr: TDBEdit
              Left = 292
              Top = 65
              Width = 101
              Height = 21
              DataField = 'VL_DISTRIBUICAO'
              DataSource = datm_financeiro.ds_caixa_contabil_distr
              TabOrder = 1
              OnChange = dbedt_cd_ct_gerencialChange
            end
            object dbedt_vl_lanc_cont: TDBEdit
              Left = 292
              Top = 236
              Width = 101
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_LANCAMENTO'
              DataSource = datm_financeiro.ds_caixa_contabil
              ReadOnly = True
              TabOrder = 4
              OnChange = dbedt_cd_ct_contabilChange
            end
          end
        end
      end
    end
    object ts_fatur: TTabSheet
      Caption = '&Faturamento'
      object pgctrl_fatur: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 453
        ActivePage = ts_dados_fatur
        Align = alClient
        HotTrack = True
        TabOrder = 0
        OnChange = pgctrl_financeiroChange
        OnChanging = pgctrl_financeiroChanging
        object ts_lista_fatur: TTabSheet
          Caption = '    &Lista    '
          object dbg_fatur: TDBGrid
            Left = 0
            Top = 0
            Width = 726
            Height = 425
            Align = alClient
            Color = clWhite
            DataSource = datm_financeiro.ds_caixa_fatur
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
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
                FieldName = 'NR_LANCAMENTO'
                Title.Caption = 'Lan'#231'.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 54
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookFavorecido'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 219
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CalcNrProcesso'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 84
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calc_nm_item'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 153
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_LANCAMENTO'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 74
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookCanceladoFatur'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end>
          end
        end
        object ts_dados_fatur: TTabSheet
          Caption = '   &Dados B'#225'sicos   '
          object pnl_caixa_fatur: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 425
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 0
            object lbl_nr_lanc_fatur: TLabel
              Left = 646
              Top = 8
              Width = 70
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lan'#231'amento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_favorecido: TLabel
              Left = 8
              Top = 4
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
            object btn_co_fat_fav: TSpeedButton
              Left = 580
              Top = 19
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
              OnClick = btn_co_fat_favClick
            end
            object btn_co_produto: TSpeedButton
              Left = 580
              Top = 55
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
            object lbl_produto: TLabel
              Left = 289
              Top = 43
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
            object btn_co_unid_neg: TSpeedButton
              Left = 256
              Top = 54
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
            object Label1: TLabel
              Left = 8
              Top = 41
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
            object lbl_processo: TLabel
              Left = 8
              Top = 76
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
            object lbl_cliente: TLabel
              Left = 290
              Top = 80
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
            object btn_co_processo: TSpeedButton
              Left = 115
              Top = 89
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
            object lbl_item: TLabel
              Left = 8
              Top = 118
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
            object btn_co_item: TSpeedButton
              Left = 256
              Top = 130
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
            object lbl_vl_lanc_fatur: TLabel
              Left = 8
              Top = 153
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor'
              FocusControl = dbedt_vl_lanc_fatur
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_vl_ir: TLabel
              Left = 129
              Top = 153
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'IR-Fonte'
              FocusControl = dbedt_vl_ir
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_despachante: TLabel
              Left = 8
              Top = 190
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = 'Despachante'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_despachante: TSpeedButton
              Left = 256
              Top = 204
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
              OnClick = btn_co_despachanteClick
            end
            object lbl_vl_assist: TLabel
              Left = 293
              Top = 190
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'C.Assist.'
              FocusControl = dbedt_vl_assist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_banco_fatur: TLabel
              Left = 167
              Top = 238
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
            object lbl_nr_cheque_fatur: TLabel
              Left = 489
              Top = 238
              Width = 102
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cheque/DOC  N'#186' '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_banco_fatur: TSpeedButton
              Left = 450
              Top = 250
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
              OnClick = btn_co_banco_faturClick
            end
            object lbl_canc_fat: TLabel
              Left = 621
              Top = 56
              Width = 92
              Height = 16
              Alignment = taRightJustify
              Caption = 'CANCELADO'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label10: TLabel
              Left = 286
              Top = 116
              Width = 79
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Complemento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblAtivo: TLabel
              Left = 558
              Top = 116
              Width = 44
              Height = 13
              Caption = 'Restitui'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 167
              Top = 280
              Width = 82
              Height = 13
              Caption = 'Contra Partida'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_ct_contabilF: TSpeedButton
              Left = 450
              Top = 293
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
              OnClick = btn_co_ct_contabilFClick
            end
            object lbl1: TLabel
              Left = 399
              Top = 191
              Width = 92
              Height = 13
              Alignment = taRightJustify
              Caption = 'Centro de Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object btn_co_ct_custo_fat: TSpeedButton
              Left = 682
              Top = 205
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
              OnClick = btn_co_ct_custo_fatClick
            end
            object Label12: TLabel
              Left = 489
              Top = 280
              Width = 98
              Height = 13
              Caption = 'Data Concilia'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 167
              Top = 325
              Width = 38
              Height = 13
              Caption = 'Rateio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_rateioFat: TSpeedButton
              Left = 450
              Top = 338
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
              OnClick = btn_rateioFatClick
            end
            object dbedt_nr_lanc_fatur: TDBEdit
              Left = 683
              Top = 23
              Width = 33
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NR_LANCAMENTO'
              DataSource = datm_financeiro.ds_caixa_fatur
              MaxLength = 3
              ReadOnly = True
              TabOrder = 18
            end
            object dbedt_cd_favorecido: TDBEdit
              Left = 8
              Top = 18
              Width = 44
              Height = 21
              DataField = 'CD_FAVORECIDO'
              DataSource = datm_financeiro.ds_caixa_fatur
              TabOrder = 0
              OnChange = dbedt_cd_favorecidoChange
              OnExit = dbedt_cd_favorecidoExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object dbedt_nm_favorecido: TDBEdit
              Left = 52
              Top = 18
              Width = 525
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookFavorecido'
              DataSource = datm_financeiro.ds_caixa_fatur
              ReadOnly = True
              TabOrder = 19
            end
            object edt_nm_produto: TEdit
              Left = 318
              Top = 56
              Width = 261
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 20
            end
            object msk_cd_produto: TMaskEdit
              Left = 289
              Top = 56
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
              TabOrder = 2
              OnChange = btn_co_produtoClick
              OnExit = msk_cd_produtoExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object edt_nm_unid_neg: TEdit
              Left = 40
              Top = 54
              Width = 215
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 21
            end
            object msk_cd_unid_neg: TMaskEdit
              Left = 8
              Top = 54
              Width = 30
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
              OnChange = btn_co_unid_negClick
              OnExit = msk_cd_unid_negExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object msk_nr_processo: TMaskEdit
              Left = 8
              Top = 90
              Width = 102
              Height = 21
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 18
              ParentFont = False
              TabOrder = 3
              OnChange = dbedt_cd_favorecidoChange
              OnExit = msk_nr_processoExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object edt_cd_cliente: TEdit
              Left = 290
              Top = 94
              Width = 43
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 22
            end
            object edt_nm_cliente: TEdit
              Left = 334
              Top = 94
              Width = 270
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 23
            end
            object dbedt_cd_item: TDBEdit
              Left = 8
              Top = 131
              Width = 33
              Height = 21
              DataField = 'CD_ITEM'
              DataSource = datm_financeiro.ds_caixa_fatur
              TabOrder = 4
              OnChange = dbedt_cd_favorecidoChange
              OnExit = dbedt_cd_itemExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object dbedt_nm_item: TDBEdit
              Left = 43
              Top = 131
              Width = 210
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookItem'
              DataSource = datm_financeiro.ds_caixa_fatur
              ReadOnly = True
              TabOrder = 24
            end
            object dbedt_nm_hist_fatur: TDBEdit
              Left = 288
              Top = 132
              Width = 264
              Height = 21
              DataField = 'NM_HISTORICO'
              DataSource = datm_financeiro.ds_caixa_fatur
              MaxLength = 30
              TabOrder = 5
              OnChange = dbedt_cd_favorecidoChange
            end
            object dbedt_vl_lanc_fatur: TDBEdit
              Left = 8
              Top = 166
              Width = 112
              Height = 21
              DataField = 'VL_LANCAMENTO'
              DataSource = datm_financeiro.ds_caixa_fatur
              TabOrder = 7
              OnChange = dbedt_cd_favorecidoChange
            end
            object dbedt_vl_ir: TDBEdit
              Left = 126
              Top = 166
              Width = 128
              Height = 21
              DataField = 'VL_IR'
              DataSource = datm_financeiro.ds_caixa_fatur
              TabOrder = 8
              OnChange = dbedt_cd_favorecidoChange
            end
            object dbedt_cd_despachante: TDBEdit
              Left = 8
              Top = 205
              Width = 33
              Height = 21
              DataField = 'CD_DESPACHANTE'
              DataSource = datm_financeiro.ds_caixa_fatur
              TabOrder = 9
              OnChange = dbedt_cd_favorecidoChange
              OnExit = dbedt_cd_despachanteExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object dbedt_nm_despachante: TDBEdit
              Left = 43
              Top = 205
              Width = 210
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookDesp'
              DataSource = datm_financeiro.ds_caixa_fatur
              ReadOnly = True
              TabOrder = 25
            end
            object dbedt_vl_assist: TDBEdit
              Left = 293
              Top = 205
              Width = 82
              Height = 21
              DataField = 'VL_ASSIST'
              DataSource = datm_financeiro.ds_caixa_fatur
              TabOrder = 10
              OnChange = dbedt_cd_favorecidoChange
            end
            object dbrdgrp_forma_pagto_fatur: TDBRadioGroup
              Left = 8
              Top = 241
              Width = 153
              Height = 119
              Caption = '&Forma de Pagamento'
              DataField = 'TP_PAGAMENTO'
              DataSource = datm_financeiro.ds_caixa_fatur
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Dinheiro'
                'Cheque'
                'TED'
                'DOC / D'#233'bito Conta'
                'L&&P'
                'Outros')
              ParentFont = False
              TabOrder = 11
              Values.Strings = (
                '$'
                'C'
                'T'
                'D'
                'L'
                'O')
              OnChange = dbrdgrp_forma_pagto_faturChange
            end
            object dbedt_cd_banco_fatur: TDBEdit
              Left = 167
              Top = 251
              Width = 36
              Height = 21
              DataField = 'CD_BANCO'
              DataSource = datm_financeiro.ds_caixa_fatur
              TabOrder = 12
              OnChange = dbedt_cd_favorecidoChange
              OnExit = dbedt_cd_banco_faturExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object dbedt_nm_banco_fatur: TDBEdit
              Left = 205
              Top = 251
              Width = 244
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookBancoFatur'
              DataSource = datm_financeiro.ds_caixa_fatur
              ReadOnly = True
              TabOrder = 26
            end
            object dbedt_nr_cheque_fatur: TDBEdit
              Left = 489
              Top = 251
              Width = 104
              Height = 21
              DataField = 'NR_CHEQUE'
              DataSource = datm_financeiro.ds_caixa_fatur
              TabOrder = 13
              OnChange = dbedt_cd_favorecidoChange
            end
            object dblkpcbox_restitui: TDBLookupComboBox
              Left = 558
              Top = 132
              Width = 50
              Height = 21
              DataField = 'IN_RESTITUI'
              DataSource = datm_financeiro.ds_caixa_fatur
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_financeiro.ds_yesno
              TabOrder = 6
              OnClick = dblkpcbox_restituiClick
            end
            object dbedt_cd_ct_contabilF: TDBEdit
              Left = 167
              Top = 294
              Width = 88
              Height = 21
              DataField = 'CD_CT_CONTABIL'
              DataSource = datm_financeiro.ds_caixa_fatur
              TabOrder = 14
              OnChange = btn_co_ct_contabilFClick
              OnExit = dbedt_cd_ct_contabilFExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object dbedt_cd_ct_custo_fat: TDBEdit
              Left = 399
              Top = 206
              Width = 41
              Height = 21
              DataField = 'CD_CT_CUSTO'
              DataSource = datm_financeiro.ds_caixa_fatur
              TabOrder = 17
              Visible = False
              OnChange = dbedt_cd_ct_custo_fatChange
              OnExit = dbedt_cd_ct_custo_fatExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object dbedt_nm_ct_custo_fat: TDBEdit
              Left = 440
              Top = 206
              Width = 241
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookCtCustoFat'
              DataSource = datm_financeiro.ds_caixa_fatur
              ReadOnly = True
              TabOrder = 27
              Visible = False
            end
            object dbedt_dt_vencimento_Fat: TDBDateEdit
              Left = 489
              Top = 294
              Width = 104
              Height = 21
              DataField = 'DT_CONCILIACAO'
              DataSource = datm_financeiro.ds_caixa_fatur
              NumGlyphs = 2
              TabOrder = 15
              OnChange = dbedt_cd_favorecidoChange
            end
            object dbedt_nm_rateioFat: TEdit
              Left = 211
              Top = 339
              Width = 238
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 28
            end
            object dbedt_cd_rateioFat: TDBEdit
              Left = 167
              Top = 339
              Width = 41
              Height = 21
              DataField = 'CD_RATEIO'
              DataSource = datm_financeiro.ds_caixa_fatur
              TabOrder = 16
              OnChange = btn_rateioFatClick
              OnExit = dbedt_cd_rateioFatExit
              OnKeyDown = dbedt_cd_favor_contabilKeyDown
            end
            object dbedt_nm_ct_contabilF: TEdit
              Left = 259
              Top = 294
              Width = 189
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 29
            end
          end
        end
      end
    end
    object ts_saldos: TTabSheet
      Caption = '      &Saldos      '
      TabVisible = False
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 453
        Align = alClient
        Color = clWhite
        DataSource = datm_financeiro.ds_caixa_saldos
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
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
            FieldName = 'CD_CT_CAIXA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookCtCaixa'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 151
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_SALDO_ANT'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_TOT_CRE'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_TOT_DEB'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CalcSaldoTotal'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 91
            Visible = True
          end>
      end
    end
  end
  object pnl_filtros: TPanel
    Left = 0
    Top = 47
    Width = 742
    Height = 45
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object lbl_unid_neg: TLabel
      Left = 4
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
    object btn_co_unid_neg_caixa: TSpeedButton
      Left = 239
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
      OnClick = btn_co_unid_neg_caixaClick
    end
    object lbl_dt_solic_ch: TLabel
      Left = 286
      Top = 5
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_coligada: TLabel
      Left = 403
      Top = 4
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coligada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_coligada: TSpeedButton
      Left = 637
      Top = 16
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
      OnClick = btn_co_coligadaClick
    end
    object msk_cd_unid_neg_caixa: TMaskEdit
      Left = 4
      Top = 18
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
      OnChange = btn_co_unid_neg_caixaClick
      OnEnter = msk_cd_unid_neg_caixaEnter
      OnExit = msk_cd_unid_neg_caixaExit
      OnKeyDown = dbedt_cd_favor_contabilKeyDown
    end
    object edt_nm_unid_neg_caixa: TEdit
      Left = 39
      Top = 18
      Width = 200
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object msk_dt_movimento: TMaskEdit
      Left = 286
      Top = 18
      Width = 99
      Height = 21
      EditMask = '00/00/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = '  /  /    '
      OnEnter = msk_dt_movimentoEnter
      OnExit = msk_dt_movimentoExit
    end
    object msk_cd_coligada: TMaskEdit
      Left = 403
      Top = 17
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
      TabOrder = 3
      OnChange = btn_co_coligadaClick
      OnEnter = msk_cd_coligadaEnter
      OnExit = msk_cd_coligadaExit
      OnKeyDown = dbedt_cd_favor_contabilKeyDown
    end
    object edt_nm_coligada: TEdit
      Left = 438
      Top = 17
      Width = 200
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
    end
  end
  object pnl_financeiro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      742
      47)
    object btn_incluir: TSpeedButton
      Left = 2
      Top = 4
      Width = 38
      Height = 38
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
    object btn_sair: TSpeedButton
      Left = 392
      Top = 4
      Width = 38
      Height = 38
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
      Left = 40
      Top = 4
      Width = 38
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
      Left = 78
      Top = 4
      Width = 38
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
    object btn_canc_lanc: TSpeedButton
      Left = 157
      Top = 4
      Width = 38
      Height = 38
      Hint = 'Cancelar Lan'#231'amento'
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
    object btn_excluir: TSpeedButton
      Left = 116
      Top = 4
      Width = 38
      Height = 38
      Hint = 'Excluir'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_excluirClick
    end
    object btn_fechar: TSpeedButton
      Left = 195
      Top = 4
      Width = 38
      Height = 38
      Hint = 'Fechar Movimento'
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
      OnClick = btn_fecharClick
    end
    object shp2: TShape
      Left = 263
      Top = 9
      Width = 102
      Height = 27
      Pen.Color = clGray
    end
    object dbnvg: TDBNavigator
      Left = 264
      Top = 10
      Width = 100
      Height = 25
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
    end
    object pnl_pesquisa: TPanel
      Left = 433
      Top = 2
      Width = 307
      Height = 43
      Align = alRight
      BevelOuter = bvNone
      BevelWidth = 2
      BorderWidth = 2
      TabOrder = 1
      object shp1: TShape
        Left = 2
        Top = 2
        Width = 303
        Height = 39
        Align = alClient
        Pen.Color = clGray
      end
      object Label5: TLabel
        Left = 12
        Top = 5
        Width = 56
        Height = 13
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label6: TLabel
        Left = 144
        Top = 5
        Width = 37
        Height = 13
        Caption = 'Ordem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object edt_chave: TEdit
        Left = 12
        Top = 17
        Width = 129
        Height = 21
        TabStop = False
        TabOrder = 0
        OnChange = edt_chaveChange
      end
      object cb_ordem: TComboBox
        Left = 145
        Top = 17
        Width = 156
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        TabStop = False
        OnClick = cb_ordemClick
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 655
    Top = 452
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      Hint = ' '
      OnClick = btn_incluirClick
    end
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
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Enabled = False
      OnClick = btn_excluirClick
    end
    object mi_canc_financ: TMenuItem
      Caption = 'Cancelar &Lan'#231'amento'
      Enabled = False
      OnClick = btn_canc_lancClick
    end
    object mi_movimento: TMenuItem
      Caption = '&Movimento'
      object mi_fechar: TMenuItem
        Caption = '&Fechar'
        OnClick = btn_fecharClick
      end
      object mi_reabrir: TMenuItem
        Caption = '&Reabrir'
        OnClick = mi_reabrirClick
      end
    end
    object mi_importar: TMenuItem
      Caption = '&Distribuir'
      object mi_imp_cheque: TMenuItem
        Caption = '&Cheques Emitidos'
      end
      object mi_deb_conta: TMenuItem
        Caption = '&D'#233'bitos em Conta'
      end
      object mi_ch_branco: TMenuItem
        Caption = 'Cheque em &Branco'
        OnClick = mi_ch_brancoClick
      end
      object mi_numerario: TMenuItem
        Caption = '&Numer'#225'rio'
        Visible = False
        OnClick = mi_numerarioClick
      end
      object mi_liquidacao: TMenuItem
        Caption = '&Liquida'#231#245'es'
      end
      object mi_imp_pag_autonomos: TMenuItem
        Caption = '&Pagamento de Aut'#244'nomos'
        OnClick = mi_imp_pag_autonomosClick
      end
      object mi_ctaapagar: TMenuItem
        Caption = 'Con&tas a Pagar'
        OnClick = mi_ctaapagarClick
      end
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
