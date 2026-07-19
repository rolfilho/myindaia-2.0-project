object frm_ent_ch_br: Tfrm_ent_ch_br
  Left = 181
  Top = 100
  Width = 640
  Height = 480
  Caption = 'Entrega / Baixa de Cheque em Branco'
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
  object pgctrl_ent_ch_br: TPageControl
    Left = 0
    Top = 49
    Width = 632
    Height = 383
    ActivePage = ts_lista
    TabOrder = 0
    OnChange = pgctrl_ent_ch_brChange
    OnChanging = pgctrl_ent_ch_brChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_ent_ch_br: TDBGrid
        Left = 8
        Top = 11
        Width = 607
        Height = 337
        DataSource = datm_ent_ch_br.ds_ch_br_rel
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
            FieldName = 'look_ap_unid_neg'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 92
          end
          item
            FieldName = 'look_nm_produto'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 93
          end
          item
            FieldName = 'look_ap_usuario'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 81
          end
          item
            FieldName = 'CD_BANCO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'look_ap_banco'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 100
          end
          item
            FieldName = 'NR_CHEQUE'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'DT_ENTREGA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados Básicos'
      object TPanel
        Left = 6
        Top = 7
        Width = 612
        Height = 341
        BevelOuter = bvLowered
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label4: TLabel
          Left = 19
          Top = 217
          Width = 65
          Height = 13
          Caption = 'Nr. Cheque'
          FocusControl = dbedt_nr_cheque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 18
          Top = 176
          Width = 64
          Height = 13
          Caption = 'Favorecido'
          FocusControl = dbedt_cd_favor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 223
          Top = 217
          Width = 45
          Height = 13
          Caption = 'Entrega'
          FocusControl = dbedt_dt_entrega
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 17
          Top = 16
          Width = 88
          Height = 13
          AutoSize = False
          Caption = 'Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 17
          Top = 56
          Width = 88
          Height = 13
          AutoSize = False
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 17
          Top = 95
          Width = 88
          Height = 13
          AutoSize = False
          Caption = 'Usuário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 18
          Top = 135
          Width = 88
          Height = 13
          AutoSize = False
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_usuario: TSpeedButton
          Left = 424
          Top = 107
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
          OnClick = btn_co_usuarioClick
        end
        object btn_co_produto: TSpeedButton
          Left = 424
          Top = 68
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
          OnClick = btn_co_produtoClick
        end
        object btn_co_banco: TSpeedButton
          Left = 424
          Top = 148
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
          OnClick = btn_co_bancoClick
        end
        object btn_co_unid_neg: TSpeedButton
          Left = 424
          Top = 28
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
        object btn_co_favor: TSpeedButton
          Left = 424
          Top = 187
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
          OnClick = btn_co_favorClick
        end
        object Label11: TLabel
          Left = 123
          Top = 217
          Width = 64
          Height = 13
          Caption = 'Pagamento'
          FocusControl = dbedt_dt_pagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nr_cheque: TDBEdit
          Left = 17
          Top = 231
          Width = 79
          Height = 21
          DataField = 'NR_CHEQUE'
          DataSource = datm_ent_ch_br.ds_ch_br
          ReadOnly = True
          TabOrder = 5
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_nr_chequeExit
        end
        object dbedt_cd_favor: TDBEdit
          Left = 17
          Top = 190
          Width = 46
          Height = 21
          DataField = 'CD_FAVORECIDO'
          DataSource = datm_ent_ch_br.ds_ch_br
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_cd_favorExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_dt_entrega: TDBEdit
          Left = 223
          Top = 231
          Width = 75
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'DT_ENTREGA'
          DataSource = datm_ent_ch_br.ds_ch_br
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 17
          Top = 29
          Width = 31
          Height = 21
          DataField = 'CD_UNID_NEG'
          DataSource = datm_ent_ch_br.ds_ch_br
          ReadOnly = True
          TabOrder = 0
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_cd_unid_negExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_look_nm_unid_neg: TDBEdit
          Left = 55
          Top = 29
          Width = 361
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'look_nm_unid_neg'
          DataSource = datm_ent_ch_br.ds_ch_br
          TabOrder = 8
        end
        object dbedt_cd_produto: TDBEdit
          Left = 17
          Top = 69
          Width = 31
          Height = 21
          DataField = 'CD_PRODUTO'
          DataSource = datm_ent_ch_br.ds_ch_br
          ReadOnly = True
          TabOrder = 1
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_cd_produtoExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_look_nm_produto: TDBEdit
          Left = 55
          Top = 69
          Width = 361
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'look_nm_produto'
          DataSource = datm_ent_ch_br.ds_ch_br
          TabOrder = 9
        end
        object dbedt_cd_usuario: TDBEdit
          Left = 17
          Top = 108
          Width = 47
          Height = 21
          DataField = 'CD_USUARIO'
          DataSource = datm_ent_ch_br.ds_ch_br
          ReadOnly = True
          TabOrder = 2
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_cd_usuarioExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_look_ap_usuario: TDBEdit
          Left = 71
          Top = 108
          Width = 345
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'look_ap_usuario'
          DataSource = datm_ent_ch_br.ds_ch_br
          TabOrder = 10
        end
        object dbedt_cd_banco: TDBEdit
          Left = 17
          Top = 148
          Width = 47
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_ent_ch_br.ds_ch_br
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_cd_bancoExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_look_ap_banco: TDBEdit
          Left = 71
          Top = 148
          Width = 345
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'look_ap_banco'
          DataSource = datm_ent_ch_br.ds_ch_br
          TabOrder = 11
        end
        object dbedt_look_ap_favor: TDBEdit
          Left = 71
          Top = 190
          Width = 345
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'look_ap_favor'
          DataSource = datm_ent_ch_br.ds_ch_br
          TabOrder = 12
        end
        object dbedt_dt_pagamento: TDBEdit
          Left = 123
          Top = 231
          Width = 75
          Height = 21
          Color = clSilver
          DataField = 'DT_PAGAMENTO'
          DataSource = datm_ent_ch_br.ds_ch_br
          ReadOnly = True
          TabOrder = 6
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_dt_pagamentoExit
        end
      end
    end
    object ts_comp: TTabSheet
      Caption = 'Composição'
      object pgctrl_comp: TPageControl
        Left = 0
        Top = 0
        Width = 624
        Height = 355
        ActivePage = ts_lista_comp
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_ent_ch_brChange
        OnChanging = pgctrl_ent_ch_brChanging
        object ts_lista_comp: TTabSheet
          Caption = 'List&a'
          object Label27: TLabel
            Left = 7
            Top = 4
            Width = 88
            Height = 13
            AutoSize = False
            Caption = 'Banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label29: TLabel
            Left = 407
            Top = 4
            Width = 65
            Height = 13
            Caption = 'Nr. Cheque'
            FocusControl = dbedt_nr_cheque2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 7
            Top = 41
            Width = 64
            Height = 13
            Caption = 'Favorecido'
            FocusControl = dbedt_cd_fav
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBGrid1: TDBGrid
            Left = 6
            Top = 89
            Width = 604
            Height = 232
            DataSource = datm_ent_ch_br.ds_ch_br_it
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
                FieldName = 'nr_processo_calc'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
              end
              item
                FieldName = 'CD_ITEM'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 59
              end
              item
                FieldName = 'VL_ITEM'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
              end
              item
                FieldName = 'VL_IR'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
              end
              item
                FieldName = 'CD_DESPACHANTE'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 120
              end
              item
                FieldName = 'VL_ASSIST'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 78
              end
              item
                FieldName = 'VL_BONIFICACAO'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 73
              end>
          end
          object dbedt_cd_banco2: TDBEdit
            Left = 7
            Top = 17
            Width = 45
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'CD_BANCO'
            DataSource = datm_ent_ch_br.ds_ch_br
            TabOrder = 1
            OnChange = dbedt_cd_unid_negChange
            OnExit = dbedt_cd_bancoExit
          end
          object dbedt_look_ap_banco2: TDBEdit
            Left = 57
            Top = 17
            Width = 327
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'look_ap_banco'
            DataSource = datm_ent_ch_br.ds_ch_br
            TabOrder = 2
          end
          object dbedt_nr_cheque2: TDBEdit
            Left = 407
            Top = 17
            Width = 64
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'NR_CHEQUE'
            DataSource = datm_ent_ch_br.ds_ch_br
            TabOrder = 3
          end
          object dbedt_cd_fav: TDBEdit
            Left = 6
            Top = 55
            Width = 46
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_FAVORECIDO'
            DataSource = datm_ent_ch_br.ds_ch_br
            TabOrder = 4
            OnChange = dbedt_cd_unid_negChange
            OnExit = dbedt_cd_favorExit
          end
          object dbedt_nm_fav: TDBEdit
            Left = 57
            Top = 55
            Width = 327
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'look_ap_favor'
            DataSource = datm_ent_ch_br.ds_ch_br
            TabOrder = 5
          end
        end
        object ts_dados_basicos_comp: TTabSheet
          Caption = 'Dados &Básicos'
          object Label15: TLabel
            Left = 43
            Top = 71
            Width = 65
            Height = 13
            Caption = 'Nr. Cheque'
            FocusControl = dbedt_nr_cheque3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 152
            Top = 70
            Width = 70
            Height = 13
            Caption = 'Nr Processo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 43
            Top = 112
            Width = 25
            Height = 13
            Caption = 'Item'
            FocusControl = dbedt_cd_item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 43
            Top = 151
            Width = 58
            Height = 13
            Caption = 'Valor Item'
            FocusControl = dbedt_vl_item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 151
            Top = 152
            Width = 14
            Height = 13
            Caption = 'IR'
            FocusControl = dbedt_vl_ir
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 43
            Top = 194
            Width = 76
            Height = 13
            Caption = 'Despachante'
            FocusControl = dbedt_cd_desp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label22: TLabel
            Left = 43
            Top = 235
            Width = 86
            Height = 13
            Caption = 'Contrib. Assist.'
            FocusControl = dbedt_vl_assist
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 44
            Top = 30
            Width = 88
            Height = 13
            AutoSize = False
            Caption = 'Banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_item: TSpeedButton
            Left = 448
            Top = 124
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
            OnClick = btn_co_itemClick
          end
          object btn_cd_desp: TSpeedButton
            Left = 449
            Top = 207
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
            OnClick = btn_cd_despClick
          end
          object btn_co_processo: TSpeedButton
            Left = 252
            Top = 83
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
          object dbedt_nr_cheque3: TDBEdit
            Left = 43
            Top = 84
            Width = 81
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'NR_CHEQUE'
            DataSource = datm_ent_ch_br.ds_ch_br
            ReadOnly = True
            TabOrder = 6
          end
          object dbedt_cd_item: TDBEdit
            Left = 43
            Top = 125
            Width = 38
            Height = 21
            DataField = 'CD_ITEM'
            DataSource = datm_ent_ch_br.ds_ch_br_it
            ReadOnly = True
            TabOrder = 1
            OnChange = dbedt_cd_itemChange
            OnExit = dbedt_cd_itemExit
            OnKeyDown = dbedt_cd_unid_negKeyDown
          end
          object dbedt_vl_item: TDBEdit
            Left = 43
            Top = 164
            Width = 80
            Height = 21
            DataField = 'VL_ITEM'
            DataSource = datm_ent_ch_br.ds_ch_br_it
            TabOrder = 2
            OnChange = dbedt_cd_itemChange
          end
          object dbedt_vl_ir: TDBEdit
            Left = 151
            Top = 165
            Width = 79
            Height = 21
            DataField = 'VL_IR'
            DataSource = datm_ent_ch_br.ds_ch_br_it
            TabOrder = 3
            OnChange = dbedt_cd_itemChange
          end
          object dbedt_cd_desp: TDBEdit
            Left = 43
            Top = 207
            Width = 38
            Height = 21
            DataField = 'CD_DESPACHANTE'
            DataSource = datm_ent_ch_br.ds_ch_br_it
            TabOrder = 4
            OnChange = dbedt_cd_itemChange
            OnExit = dbedt_cd_despExit
            OnKeyDown = dbedt_cd_unid_negKeyDown
          end
          object dbedt_vl_assist: TDBEdit
            Left = 43
            Top = 248
            Width = 80
            Height = 21
            DataField = 'VL_ASSIST'
            DataSource = datm_ent_ch_br.ds_ch_br_it
            TabOrder = 5
            OnClick = dbedt_cd_itemChange
          end
          object dbedt_cd_banco3: TDBEdit
            Left = 44
            Top = 43
            Width = 53
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'CD_BANCO'
            DataSource = datm_ent_ch_br.ds_ch_br
            ReadOnly = True
            TabOrder = 7
            OnChange = dbedt_cd_unid_negChange
            OnExit = dbedt_cd_bancoExit
          end
          object dbedt_look_ap_banco3: TDBEdit
            Left = 104
            Top = 43
            Width = 338
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'look_ap_banco'
            DataSource = datm_ent_ch_br.ds_ch_br
            TabOrder = 8
          end
          object dbedt_look_nm_item: TDBEdit
            Left = 88
            Top = 125
            Width = 352
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'look_nm_item'
            DataSource = datm_ent_ch_br.ds_ch_br_it
            TabOrder = 9
          end
          object dbedt_look_ap_desp: TDBEdit
            Left = 88
            Top = 208
            Width = 353
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'look_ap_desp'
            DataSource = datm_ent_ch_br.ds_ch_br_it
            TabOrder = 10
          end
          object mskedt_nr_processo: TMaskEdit
            Left = 152
            Top = 84
            Width = 97
            Height = 21
            CharCase = ecUpperCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 18
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnChange = mskedt_nr_processoChange
            OnExit = mskedt_nr_processoExit
            OnKeyDown = dbedt_cd_unid_negKeyDown
          end
        end
      end
    end
  end
  object TPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 1
    object btn_incluir: TSpeedButton
      Left = 8
      Top = 12
      Width = 25
      Height = 25
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
      Left = 287
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
      Left = 35
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
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 62
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Cancelar Operação'
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
    object btn_excluir: TSpeedButton
      Left = 90
      Top = 12
      Width = 25
      Height = 25
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
    object btn_baixar_ch: TSpeedButton
      Left = 145
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Baixar Cheque'
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
      OnClick = btn_baixar_chClick
    end
    object btn_cancelar_ch: TSpeedButton
      Left = 117
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Cancelar Lançamento'
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
      OnClick = btn_cancelar_chClick
    end
    object dbnvg: TDBNavigator
      Left = 176
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_unidade.ds_unid_neg
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Próxima'
        'Última')
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 320
    Top = 0
    Width = 309
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
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
    end
    object Label2: TLabel
      Left = 148
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
    end
    object edt_chave: TEdit
      Left = 12
      Top = 20
      Width = 129
      Height = 21
      TabStop = False
      TabOrder = 0
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 148
      Top = 20
      Width = 153
      Height = 21
      TabStop = False
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnClick = cb_ordemClick
    end
  end
  object menu_cadastro: TMainMenu
    Left = 532
    Top = 108
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
      Caption = '&Cancelar Op.'
      Enabled = False
      OnClick = btn_cancelarClick
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Enabled = False
      OnClick = btn_excluirClick
    end
    object mi_cancelar_ch: TMenuItem
      Caption = 'Cancelar C&heque'
      Enabled = False
      OnClick = btn_cancelar_chClick
    end
    object mi_baixar_ch: TMenuItem
      Caption = '&Baixar'
      Enabled = False
      OnClick = btn_baixar_chClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
