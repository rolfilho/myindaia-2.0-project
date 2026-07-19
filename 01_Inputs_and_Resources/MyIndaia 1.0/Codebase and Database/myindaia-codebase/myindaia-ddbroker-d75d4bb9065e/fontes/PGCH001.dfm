object frm_solic_ch: Tfrm_solic_ch
  Left = 65
  Top = 61
  Width = 640
  Height = 480
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Solicitação de Cheque'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_solic_ch: TPageControl
    Left = 0
    Top = 52
    Width = 629
    Height = 380
    ActivePage = ts_lista
    TabOrder = 0
    OnChange = pgctrl_solic_chChange
    OnChanging = pgctrl_solic_chChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbgrdSolicCheque: TDBGrid
        Left = 0
        Top = 8
        Width = 621
        Height = 337
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Alignment = taCenter
            FieldName = 'NR_SOLIC_CH'
            Title.Alignment = taCenter
            Title.Color = clBlack
          end
          item
            FieldName = 'LookFavorecido'
            Title.Color = clBlack
            Width = 182
          end
          item
            FieldName = 'LookBanco'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 163
          end
          item
            FieldName = 'VL_SOLIC_CH'
            Title.Alignment = taCenter
            Title.Color = clBlack
          end
          item
            FieldName = 'LookStSolicCheque'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 130
          end>
      end
    end
    object ts_solic_ch: TTabSheet
      Caption = 'Solicitação'
      object pnl_solic_ch: TPanel
        Left = 0
        Top = 3
        Width = 619
        Height = 79
        BevelOuter = bvLowered
        TabOrder = 0
        object lbl_nr_solic_ch: TLabel
          Left = 8
          Top = 3
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nº Solic.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_dt_solic_ch: TLabel
          Left = 67
          Top = 3
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
        object lbl_hm_solic_ch: TLabel
          Left = 152
          Top = 3
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_solic_ch: TLabel
          Left = 205
          Top = 3
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor'
          FocusControl = dbedt_vl_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nr_cheque: TLabel
          Left = 313
          Top = 3
          Width = 62
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cheque Nº'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_status_cheque: TLabel
          Left = 433
          Top = 3
          Width = 122
          Height = 13
          Caption = 'Status da Solicitação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_banco: TLabel
          Left = 8
          Top = 41
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
        object lbl_favorecido: TLabel
          Left = 313
          Top = 41
          Width = 129
          Height = 13
          Caption = 'Favorecido do Cheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_banco: TSpeedButton
          Left = 283
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
          OnClick = btn_co_bancoClick
        end
        object btn_co_favorecido: TSpeedButton
          Left = 577
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
          OnClick = btn_co_favorecidoClick
        end
        object dbedt_nr_solic_ch: TDBEdit
          Left = 8
          Top = 19
          Width = 41
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_CH'
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_dt_solic_ch: TDBEdit
          Left = 67
          Top = 19
          Width = 82
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_SOLIC_CH'
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_hm_solic_ch: TDBEdit
          Left = 152
          Top = 19
          Width = 41
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'HM_SOLIC_CH'
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_vl_solic_ch: TDBEdit
          Left = 205
          Top = 19
          Width = 104
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_SOLIC_CH'
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nr_cheque: TDBEdit
          Left = 313
          Top = 19
          Width = 104
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_CHEQUE'
          ReadOnly = True
          TabOrder = 4
        end
        object dblckbox_status_solic_ch: TDBLookupComboBox
          Left = 433
          Top = 19
          Width = 169
          Height = 21
          DataField = 'CD_STATUS_SOLIC_CH'
          Enabled = False
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_cd_banco: TDBEdit
          Left = 8
          Top = 55
          Width = 34
          Height = 21
          DataField = 'CD_BANCO'
          MaxLength = 3
          TabOrder = 6
          OnChange = dbedt_cd_bancoChange
          OnExit = dbedt_cd_bancoExit
          OnKeyDown = dbedt_cd_bancoKeyDown
        end
        object dbedt_nm_banco: TDBEdit
          Left = 45
          Top = 55
          Width = 235
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_favorecido: TDBEdit
          Left = 313
          Top = 55
          Width = 44
          Height = 21
          DataField = 'CD_FAVORECIDO'
          MaxLength = 5
          TabOrder = 8
          OnChange = dbedt_cd_bancoChange
          OnExit = dbedt_cd_favorecidoExit
          OnKeyDown = dbedt_cd_bancoKeyDown
        end
        object dbedt_nm_favorecido: TDBEdit
          Left = 361
          Top = 55
          Width = 214
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookFavorecido'
          ReadOnly = True
          TabOrder = 9
        end
      end
      object pnl_solic_ch_itens: TPanel
        Left = 1
        Top = 84
        Width = 619
        Height = 268
        BevelOuter = bvLowered
        TabOrder = 1
        object pgctrl_solic_ch_itens: TPageControl
          Left = 4
          Top = 2
          Width = 610
          Height = 263
          ActivePage = ts_lista2
          TabOrder = 0
          OnChange = pgctrl_solic_chChange
          OnChanging = pgctrl_solic_chChanging
          object ts_lista2: TTabSheet
            Caption = '    Lista    '
            object dbg_contatos: TDBGrid
              Left = 0
              Top = 0
              Width = 605
              Height = 233
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  FieldName = 'NR_LANCAMENTO'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                end
                item
                  FieldName = 'CalcNrProcesso'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 73
                end
                item
                  FieldName = 'LookCli'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 182
                end
                item
                  FieldName = 'LookItem'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 142
                end
                item
                  FieldName = 'Calc_VL_CH_ITEM'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Valor'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                end
                item
                  FieldName = 'LookStSolicChItens'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                end>
            end
          end
          object ts_solic_ch_itens: TTabSheet
            Caption = 'Discriminação'
            object lbl_unid_neg: TLabel
              Left = 4
              Top = 45
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
              Left = 305
              Top = 45
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
            object lbl_processo: TLabel
              Left = 4
              Top = 80
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
              Left = 139
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
            object lbl_servico: TLabel
              Left = 372
              Top = 80
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serviço'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_item: TLabel
              Left = 4
              Top = 116
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
              Left = 4
              Top = 154
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor'
              FocusControl = dbedt_vl_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_vl_ir: TLabel
              Left = 115
              Top = 154
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
            object lbl_vl_assist: TLabel
              Left = 305
              Top = 192
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
            object lbl_despachante: TLabel
              Left = 4
              Top = 192
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
            object Label1: TLabel
              Left = 372
              Top = 115
              Width = 138
              Height = 13
              Alignment = taRightJustify
              Caption = 'Status da Discriminação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_lancamento: TLabel
              Left = 4
              Top = 4
              Width = 70
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lançamento'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object btn_co_despachante: TSpeedButton
              Left = 273
              Top = 206
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
              OnClick = btn_co_despachanteClick
            end
            object btn_co_item: TSpeedButton
              Left = 273
              Top = 130
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
              OnClick = btn_co_itemClick
            end
            object btn_co_unid_neg: TSpeedButton
              Left = 273
              Top = 57
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
            object btn_co_produto: TSpeedButton
              Left = 568
              Top = 57
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
            object btn_co_processo: TSpeedButton
              Left = 110
              Top = 93
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
              OnClick = btn_co_processoClick
            end
            object Label2: TLabel
              Left = 304
              Top = 7
              Width = 65
              Height = 13
              Caption = 'Fornecedor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_fornecedor: TSpeedButton
              Left = 568
              Top = 21
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
              OnClick = btn_co_fornecedorClick
            end
            object lbl_restirui: TLabel
              Left = 307
              Top = 115
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
            object edt_nm_unid_neg: TEdit
              Left = 32
              Top = 58
              Width = 238
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 9
            end
            object edt_nm_produto: TEdit
              Left = 338
              Top = 58
              Width = 228
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 10
            end
            object msk_cd_produto: TMaskEdit
              Left = 305
              Top = 58
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
              TabOrder = 1
              OnChange = msk_cd_unid_negChange
              OnExit = msk_cd_produtoExit
              OnKeyDown = dbedt_cd_bancoKeyDown
            end
            object edt_cd_cliente: TEdit
              Left = 139
              Top = 94
              Width = 41
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 11
            end
            object edt_nm_cliente: TEdit
              Left = 183
              Top = 94
              Width = 186
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 12
            end
            object edt_cd_servico: TEdit
              Left = 372
              Top = 94
              Width = 29
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 13
            end
            object edt_nm_servico: TEdit
              Left = 407
              Top = 94
              Width = 187
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 14
            end
            object dbedt_vl_item: TDBEdit
              Left = 4
              Top = 170
              Width = 101
              Height = 21
              DataField = 'VL_ITEM'
              TabOrder = 5
              OnChange = msk_cd_unid_negChange
            end
            object dbedt_vl_ir: TDBEdit
              Left = 115
              Top = 170
              Width = 101
              Height = 21
              DataField = 'VL_IR'
              TabOrder = 6
              OnChange = msk_cd_unid_negChange
            end
            object dbedt_vl_assist: TDBEdit
              Left = 305
              Top = 207
              Width = 101
              Height = 21
              DataField = 'VL_ASSIST'
              TabOrder = 8
              OnChange = msk_cd_unid_negChange
            end
            object dbedt_cd_item: TDBEdit
              Left = 4
              Top = 131
              Width = 33
              Height = 21
              DataField = 'CD_ITEM'
              MaxLength = 3
              TabOrder = 3
              OnChange = msk_cd_unid_negChange
              OnExit = dbedt_cd_itemExit
              OnKeyDown = dbedt_cd_bancoKeyDown
            end
            object dbedt_nm_item: TDBEdit
              Left = 41
              Top = 131
              Width = 229
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookItem'
              ReadOnly = True
              TabOrder = 15
            end
            object dbedt_cd_despachante: TDBEdit
              Left = 4
              Top = 207
              Width = 33
              Height = 21
              DataField = 'CD_DESPACHANTE'
              MaxLength = 3
              TabOrder = 7
              OnChange = msk_cd_unid_negChange
              OnExit = dbedt_cd_despachanteExit
              OnKeyDown = dbedt_cd_bancoKeyDown
            end
            object dbedt_nm_despachante: TDBEdit
              Left = 42
              Top = 207
              Width = 228
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookDespachante'
              ReadOnly = True
              TabOrder = 16
            end
            object msk_nr_processo: TMaskEdit
              Left = 4
              Top = 93
              Width = 102
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 18
              ParentFont = False
              TabOrder = 2
              OnChange = msk_cd_unid_negChange
              OnExit = msk_nr_processoExit
              OnKeyDown = dbedt_cd_bancoKeyDown
            end
            object dblckbox_st_solic_ch_itens: TDBLookupComboBox
              Left = 372
              Top = 130
              Width = 169
              Height = 21
              DataField = 'CD_STATUS'
              Enabled = False
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO'
              TabOrder = 17
            end
            object dbedt_nr_lancamento: TDBEdit
              Left = 4
              Top = 22
              Width = 33
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NR_LANCAMENTO'
              MaxLength = 3
              ReadOnly = True
              TabOrder = 18
              OnChange = msk_cd_unid_negChange
              OnExit = dbedt_cd_despachanteExit
            end
            object msk_cd_unid_neg: TMaskEdit
              Left = 4
              Top = 58
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
              OnChange = msk_cd_unid_negChange
              OnExit = msk_cd_unid_negExit
              OnKeyDown = dbedt_cd_bancoKeyDown
            end
            object dbedt_cd_fornecedor: TDBEdit
              Left = 304
              Top = 22
              Width = 44
              Height = 21
              DataField = 'CD_FORNECEDOR'
              MaxLength = 5
              TabOrder = 19
              OnChange = msk_cd_unid_negChange
              OnExit = dbedt_cd_fornecedorExit
              OnKeyDown = dbedt_cd_bancoKeyDown
            end
            object dbedt_nm_fornecedor: TDBEdit
              Left = 352
              Top = 22
              Width = 214
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookFornecedor'
              ReadOnly = True
              TabOrder = 20
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 307
              Top = 130
              Width = 61
              Height = 21
              DataField = 'IN_RESTITUI'
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              TabOrder = 4
            end
          end
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 1
    object btn_incluir: TSpeedButton
      Left = 8
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Incluir'
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
      Left = 38
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
      Left = 68
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
    object btn_canc_solic_ch: TSpeedButton
      Left = 156
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Cancelar Solicitação'
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
      OnClick = btn_canc_solic_chClick
    end
    object dbnvg: TDBNavigator
      Left = 213
      Top = 12
      Width = 104
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Próximo'
        'Último')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      BeforeAction = dbnvgBeforeAction
      OnClick = dbnvgClick
    end
  end
  object menu_cadastro: TMainMenu
    Left = 513
    Top = 4
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
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
    object mi_can_solic_ch: TMenuItem
      Caption = 'Cancelar S&olicitação'
      OnClick = btn_canc_solic_chClick
    end
    object mi_gerar: TMenuItem
      Caption = '&Gerar Solicitação'
      object mi_gerar_devolucao: TMenuItem
        Caption = '&Devolução de Numerário'
        OnClick = mi_gerar_devolucaoClick
      end
      object mi_liq: TMenuItem
        Caption = '&Liquidações'
        OnClick = mi_liqClick
      end
      object mi_receb: TMenuItem
        Caption = '&Recebimento de Numerário'
        OnClick = mi_recebClick
      end
      object mi_sda: TMenuItem
        Caption = '&SDA'
        OnClick = mi_sdaClick
      end
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
