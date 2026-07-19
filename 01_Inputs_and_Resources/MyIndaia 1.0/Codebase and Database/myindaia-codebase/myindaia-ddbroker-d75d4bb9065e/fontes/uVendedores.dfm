object frm_vendedores: Tfrm_vendedores
  Left = 181
  Top = 126
  Width = 750
  Height = 550
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Vendedores'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = menu_cadastro
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_vendedores: TPageControl
    Left = 0
    Top = 52
    Width = 742
    Height = 452
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_vendedoresChange
    OnChanging = pgctrl_vendedoresChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_vendedores: TDBGrid
        Left = 0
        Top = 54
        Width = 734
        Height = 370
        Align = alClient
        DataSource = datm_vendedores.ds_vendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBackground
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_vendedoresDblClick
        OnKeyPress = dbg_vendedoresKeyPress
        Columns = <
          item
            Color = clWhite
            Expanded = False
            FieldName = 'CD_VENDEDOR'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Title.Color = clWindowText
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_VENDEDOR'
            Title.Caption = 'Nome'
            Title.Color = clWindowText
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindow
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 500
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 54
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object btn_co_unid_neg: TSpeedButton
          Left = 494
          Top = 22
          Width = 24
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
        object Label55: TLabel
          Left = 6
          Top = 10
          Width = 55
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
        object edt_nm_unid_neg: TEdit
          Left = 36
          Top = 23
          Width = 457
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 0
        end
        object msk_cd_unid_neg: TMaskEdit
          Left = 7
          Top = 23
          Width = 30
          Height = 21
          EditMask = '99;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 1
          OnChange = btn_co_unid_negClick
          OnExit = msk_cd_unid_negExit
          OnKeyDown = dbedt_cd_cidadeKeyDown
        end
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados B'#225'sicos'
      object pnl_ag: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 424
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label3: TLabel
          Left = 18
          Top = 15
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 64
          Top = 15
          Width = 39
          Height = 13
          AutoSize = False
          Caption = 'Nome'
          FocusControl = dbedt_nm_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 304
          Top = 94
          Width = 50
          Height = 13
          AutoSize = False
          Caption = 'Cidade'
          FocusControl = dbedt_cd_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 168
          Top = 133
          Width = 42
          Height = 13
          AutoSize = False
          Caption = 'Pa'#237's'
          FocusControl = dbedt_cd_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 73
          Top = 133
          Width = 29
          Height = 13
          AutoSize = False
          Caption = 'CEP'
          FocusControl = dbedt_cd_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 19
          Top = 133
          Width = 18
          Height = 13
          AutoSize = False
          Caption = 'UF'
          FocusControl = dbedt_cd_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_cidade: TSpeedButton
          Left = 691
          Top = 107
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
          OnClick = btn_co_cidadeClick
        end
        object Label15: TLabel
          Left = 594
          Top = 133
          Width = 51
          Height = 13
          Caption = 'Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 19
          Top = 172
          Width = 36
          Height = 13
          Caption = 'E-Mail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 293
          Top = 172
          Width = 66
          Height = 13
          Caption = 'Home Page'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 19
          Top = 55
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Endere'#231'o'
          FocusControl = dbedt_ds_endereco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 455
          Top = 55
          Width = 76
          Height = 13
          Caption = 'Complemento'
          FocusControl = dbedt_nr_complem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 19
          Top = 94
          Width = 39
          Height = 13
          AutoSize = False
          Caption = 'Bairro'
          FocusControl = dbedt_nm_bairro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_pais: TSpeedButton
          Left = 558
          Top = 146
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
          OnClick = btn_co_paisClick
        end
        object btn_co_uni_neg: TSpeedButton
          Left = 690
          Top = 29
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
          OnClick = btn_co_uni_negClick
        end
        object Label54: TLabel
          Left = 378
          Top = 16
          Width = 121
          Height = 13
          AutoSize = False
          Caption = 'Unidade de Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_vendedor: TDBEdit
          Left = 19
          Top = 29
          Width = 45
          Height = 21
          TabStop = False
          DataField = 'CD_VENDEDOR'
          DataSource = datm_vendedores.ds_vendedor
          ParentColor = True
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nm_vendedor: TDBEdit
          Tag = 666
          Left = 64
          Top = 29
          Width = 305
          Height = 21
          DataField = 'NM_VENDEDOR'
          DataSource = datm_vendedores.ds_vendedor
          TabOrder = 1
          OnChange = dbedt_nm_vendedorChange
        end
        object dbedt_look_nm_pais: TDBEdit
          Tag = 666
          Left = 199
          Top = 147
          Width = 358
          Height = 21
          TabStop = False
          DataField = 'look_nm_pais'
          DataSource = datm_vendedores.ds_vendedor
          Enabled = False
          ParentColor = True
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_nr_cep: TDBEdit
          Left = 73
          Top = 147
          Width = 65
          Height = 21
          DataField = 'NR_CEP'
          DataSource = datm_vendedores.ds_vendedor
          TabOrder = 8
          OnChange = dbedt_nm_vendedorChange
        end
        object dbedt_look_nm_cidade: TDBEdit
          Tag = 666
          Left = 338
          Top = 108
          Width = 353
          Height = 21
          TabStop = False
          DataField = 'look_nm_cidade'
          DataSource = datm_vendedores.ds_vendedor
          Enabled = False
          ParentColor = True
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_nm_uf: TDBEdit
          Left = 19
          Top = 147
          Width = 29
          Height = 21
          DataField = 'NM_UF'
          DataSource = datm_vendedores.ds_vendedor
          TabOrder = 7
          OnChange = dbedt_nm_vendedorChange
        end
        object dbedt_nr_fax: TDBEdit
          Left = 595
          Top = 147
          Width = 121
          Height = 21
          DataField = 'NR_FAX'
          DataSource = datm_vendedores.ds_vendedor
          TabOrder = 11
          OnChange = dbedt_nm_vendedorChange
        end
        object dbedt_ds_email: TDBEdit
          Left = 19
          Top = 186
          Width = 263
          Height = 21
          DataField = 'DS_EMAIL'
          DataSource = datm_vendedores.ds_vendedor
          TabOrder = 12
          OnChange = dbedt_nm_vendedorChange
        end
        object dbedt_ds_homepage: TDBEdit
          Left = 293
          Top = 186
          Width = 423
          Height = 21
          DataField = 'DS_HOMEPAGE'
          DataSource = datm_vendedores.ds_vendedor
          TabOrder = 13
          OnChange = dbedt_nm_vendedorChange
        end
        object dbedt_ds_endereco: TDBEdit
          Left = 19
          Top = 69
          Width = 421
          Height = 21
          DataField = 'DS_ENDERECO'
          DataSource = datm_vendedores.ds_vendedor
          TabOrder = 2
          OnChange = dbedt_nm_vendedorChange
        end
        object dbedt_nr_complem: TDBEdit
          Left = 455
          Top = 69
          Width = 181
          Height = 21
          DataField = 'NR_COMPLEM'
          DataSource = datm_vendedores.ds_vendedor
          TabOrder = 3
          OnChange = dbedt_nm_vendedorChange
        end
        object dbedt_nm_bairro: TDBEdit
          Left = 19
          Top = 108
          Width = 266
          Height = 21
          DataField = 'NM_BAIRRO'
          DataSource = datm_vendedores.ds_vendedor
          TabOrder = 4
          OnChange = dbedt_nm_vendedorChange
        end
        object dbedt_cd_pais: TDBEdit
          Tag = 666
          Left = 168
          Top = 147
          Width = 32
          Height = 21
          DataField = 'CD_PAIS'
          DataSource = datm_vendedores.ds_vendedor
          TabOrder = 9
          OnChange = btn_co_paisClick
          OnExit = dbedt_cd_paisExit
          OnKeyDown = dbedt_cd_paisKeyDown
        end
        object dbedt_nm_unid_neg: TDBEdit
          Tag = 666
          Left = 411
          Top = 29
          Width = 278
          Height = 21
          DataField = 'NM_UNID_NEG'
          DataSource = datm_vendedores.ds_vendedor
          Enabled = False
          ParentColor = True
          ReadOnly = True
          TabOrder = 14
          OnChange = dbedt_nm_vendedorChange
        end
        object dbedt_cd_unid_neg: TDBEdit
          Tag = 666
          Left = 379
          Top = 29
          Width = 33
          Height = 21
          TabStop = False
          DataField = 'CD_UNID_NEG'
          DataSource = datm_vendedores.ds_vendedor
          TabOrder = 15
          OnChange = btn_co_uni_negClick
          OnExit = dbedt_cd_unid_negExit
          OnKeyDown = dbedt_cd_paisKeyDown
        end
        object GroupBox1: TGroupBox
          Left = 19
          Top = 221
          Width = 698
          Height = 187
          Caption = ' Comiss'#227'o '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
          object Label46: TLabel
            Left = 17
            Top = 28
            Width = 179
            Height = 13
            Caption = 'Forma de C'#225'lculo Import. A'#233'rea'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label47: TLabel
            Left = 17
            Top = 58
            Width = 195
            Height = 13
            Caption = 'Forma de C'#225'lculo Import. Mar'#237'tima'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label48: TLabel
            Left = 17
            Top = 91
            Width = 180
            Height = 13
            Caption = 'Forma de C'#225'lculo Export. A'#233'rea'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label49: TLabel
            Left = 17
            Top = 124
            Width = 196
            Height = 13
            Caption = 'Forma de C'#225'lculo Export. Mar'#237'tima'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label50: TLabel
            Left = 418
            Top = 31
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label51: TLabel
            Left = 418
            Top = 124
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label52: TLabel
            Left = 418
            Top = 90
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label53: TLabel
            Left = 418
            Top = 60
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 17
            Top = 155
            Width = 180
            Height = 13
            Caption = 'Forma de C'#225'lculo Desembara'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 418
            Top = 155
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEdit15: TDBEdit
            Left = 453
            Top = 23
            Width = 136
            Height = 21
            DataField = 'VL_CALC_IMP_AEREA'
            DataSource = datm_vendedores.ds_vendedor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = dbedt_nm_vendedorChange
          end
          object DBEdit16: TDBEdit
            Left = 453
            Top = 53
            Width = 136
            Height = 21
            DataField = 'VL_CALC_IMP_MARITIMA'
            DataSource = datm_vendedores.ds_vendedor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnChange = dbedt_nm_vendedorChange
          end
          object DBEdit17: TDBEdit
            Left = 453
            Top = 84
            Width = 136
            Height = 21
            DataField = 'VL_CALC_EXP_AEREA'
            DataSource = datm_vendedores.ds_vendedor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnChange = dbedt_nm_vendedorChange
          end
          object DBEdit18: TDBEdit
            Left = 453
            Top = 117
            Width = 136
            Height = 21
            DataField = 'VL_CALC_EXP_MARITIMA'
            DataSource = datm_vendedores.ds_vendedor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnChange = dbedt_nm_vendedorChange
          end
          object DBLookupComboBox5: TDBLookupComboBox
            Left = 231
            Top = 23
            Width = 145
            Height = 21
            DataField = 'Look_nm_tp_imp_aere'
            DataSource = datm_vendedores.ds_vendedor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = dbedt_nm_vendedorChange
          end
          object DBLookupComboBox6: TDBLookupComboBox
            Left = 231
            Top = 55
            Width = 145
            Height = 21
            DataField = 'Look_nm_tp_imp_marit'
            DataSource = datm_vendedores.ds_vendedor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = dbedt_nm_vendedorChange
          end
          object DBLookupComboBox7: TDBLookupComboBox
            Left = 231
            Top = 86
            Width = 145
            Height = 21
            DataField = 'Look_nm_tp_exp_aerea'
            DataSource = datm_vendedores.ds_vendedor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = dbedt_nm_vendedorChange
          end
          object DBLookupComboBox8: TDBLookupComboBox
            Left = 231
            Top = 117
            Width = 145
            Height = 21
            DataField = 'Look_nm_tp_exp_marit'
            DataSource = datm_vendedores.ds_vendedor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            OnClick = dbedt_nm_vendedorChange
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 231
            Top = 148
            Width = 145
            Height = 21
            DataField = 'Look_nm_tp_desembaraco'
            DataSource = datm_vendedores.ds_vendedor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            OnClick = dbedt_nm_vendedorChange
          end
          object DBEdit1: TDBEdit
            Left = 453
            Top = 148
            Width = 136
            Height = 21
            DataField = 'VL_CALC_DESEMBARACO'
            DataSource = datm_vendedores.ds_vendedor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            OnChange = dbedt_nm_vendedorChange
          end
        end
        object dbedt_cd_cidade: TDBEdit
          Tag = 666
          Left = 304
          Top = 108
          Width = 35
          Height = 21
          DataField = 'CD_CIDADE'
          DataSource = datm_vendedores.ds_vendedor
          TabOrder = 5
          OnChange = dbedt_nm_vendedorChange
          OnExit = dbedt_cd_cidadeExit
          OnKeyDown = dbedt_cd_cidadeKeyDown
        end
      end
    end
    object ts_contato: TTabSheet
      BorderWidth = 4
      Caption = 'Contato'
      ImageIndex = 2
      object dbg_contato: TDBGrid
        Left = 0
        Top = 0
        Width = 726
        Height = 270
        Align = alClient
        DataSource = datm_vendedores.ds_contato
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_contatoDblClick
        OnKeyPress = dbg_contatoKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_VENDEDOR'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo Vendedor'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindow
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CD_CONTATO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CONTATO'
            Title.Caption = 'Nome'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindow
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 500
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 270
        Width = 726
        Height = 146
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'Panel2'
        TabOrder = 1
        object Label24: TLabel
          Left = 52
          Top = 7
          Width = 33
          Height = 13
          Caption = 'Nome'
          FocusControl = dbedt_nm_contato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 0
          Top = 7
          Width = 40
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_contato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 0
          Top = 48
          Width = 51
          Height = 13
          Caption = 'Telefone'
          FocusControl = dbedt_nr_fone_contato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 115
          Top = 48
          Width = 36
          Height = 13
          Caption = 'E-Mail'
          FocusControl = dbedt_ds_email_contato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 0
          Top = 88
          Width = 34
          Height = 13
          Caption = 'Cargo'
          FocusControl = dbedt_ds_cargo_contato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 238
          Top = 88
          Width = 80
          Height = 13
          Caption = 'Departamento'
          FocusControl = dbedt_ds_depto_contato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nm_contato: TDBEdit
          Tag = 666
          Left = 52
          Top = 20
          Width = 418
          Height = 21
          DataField = 'NM_CONTATO'
          TabOrder = 0
          OnChange = dbedt_cd_contatoChange
        end
        object dbedt_cd_contato: TDBEdit
          Left = 0
          Top = 20
          Width = 39
          Height = 21
          Color = clMenu
          DataField = 'CD_CONTATO'
          ReadOnly = True
          TabOrder = 1
          OnChange = dbedt_cd_contatoChange
        end
        object dbedt_nr_fone_contato: TDBEdit
          Left = 0
          Top = 61
          Width = 99
          Height = 21
          DataField = 'NR_FONE_CONTATO'
          TabOrder = 2
          OnChange = dbedt_cd_contatoChange
        end
        object dbedt_ds_email_contato: TDBEdit
          Left = 115
          Top = 61
          Width = 355
          Height = 21
          DataField = 'DS_EMAIL_CONTATO'
          TabOrder = 3
          OnChange = dbedt_cd_contatoChange
        end
        object dbedt_ds_cargo_contato: TDBEdit
          Left = 0
          Top = 101
          Width = 219
          Height = 21
          DataField = 'DS_CARGO_CONTATO'
          TabOrder = 4
          OnChange = dbedt_cd_contatoChange
        end
        object dbedt_ds_depto_contato: TDBEdit
          Left = 238
          Top = 101
          Width = 232
          Height = 21
          DataField = 'DS_DEPTO_CONTATO'
          TabOrder = 5
          OnChange = dbedt_cd_contatoChange
        end
      end
    end
  end
  object pnl_btn_ag: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 52
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      742
      52)
    object btn_incluir: TSpeedButton
      Left = 3
      Top = 3
      Width = 41
      Height = 46
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
      OnClick = mi_incluirClick
    end
    object btn_excluir: TSpeedButton
      Left = 126
      Top = 3
      Width = 41
      Height = 46
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
      OnClick = mi_excluirClick
    end
    object btn_sair: TSpeedButton
      Left = 386
      Top = 3
      Width = 41
      Height = 46
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
      OnClick = mi_sairClick
    end
    object btn_salvar: TSpeedButton
      Left = 44
      Top = 3
      Width = 41
      Height = 46
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
      OnClick = mi_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 85
      Top = 3
      Width = 41
      Height = 46
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
      OnClick = mi_cancelarClick
    end
    object dbnvg: TDBNavigator
      Left = 276
      Top = 14
      Width = 100
      Height = 23
      DataSource = datm_vendedores.ds_vendedor
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
      BeforeAction = dbnvgBeforeAction
    end
    object pnl_pesquisa: TPanel
      Left = 431
      Top = 2
      Width = 309
      Height = 48
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
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
        TabOrder = 0
        OnChange = edt_chaveChange
        OnKeyDown = edt_chaveKeyDown
      end
      object cb_ordem: TComboBox
        Left = 148
        Top = 20
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 572
    Top = 376
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      Hint = ' '
      OnClick = mi_incluirClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = mi_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      OnClick = mi_cancelarClick
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Enabled = False
      Hint = ' '
      OnClick = mi_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = mi_sairClick
    end
  end
end
