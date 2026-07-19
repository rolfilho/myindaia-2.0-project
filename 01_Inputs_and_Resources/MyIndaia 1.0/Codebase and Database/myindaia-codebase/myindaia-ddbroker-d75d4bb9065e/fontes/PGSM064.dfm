object frm_amz: Tfrm_amz
  Left = 267
  Top = 143
  Width = 750
  Height = 550
  BorderIcons = [biSystemMenu]
  Caption = 'Armaz'#233'm'
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
  object pgctrl_amz: TPageControl
    Left = 0
    Top = 50
    Width = 734
    Height = 442
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_amzChange
    OnChanging = pgctrl_amzChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_amz: TDBGrid
        Left = 0
        Top = 0
        Width = 726
        Height = 414
        Align = alClient
        DataSource = datm_amz.ds_amz
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_amzDblClick
        OnKeyPress = dbg_amzKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_ARMAZEM'
            Title.Caption = 'C'#243'digo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ARMAZEM'
            Title.Caption = 'Descri'#231#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 380
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_SIGLA'
            Title.Caption = 'Sigla'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 147
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'look_ativo'
            Title.Caption = 'Ativo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 74
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados B'#225'sicos'
      object pnl_amz: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 414
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label3: TLabel
          Left = 20
          Top = 18
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_amz
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 108
          Top = 18
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Descri'#231#227'o'
          FocusControl = dbedt_nm_amz
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ativo: TLabel
          Left = 580
          Top = 18
          Width = 30
          Height = 13
          Caption = 'Ativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 389
          Top = 18
          Width = 46
          Height = 13
          AutoSize = False
          Caption = 'Sigla'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 20
          Top = 135
          Width = 81
          Height = 13
          AutoSize = False
          Caption = 'C'#243'd. Setor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 20
          Top = 96
          Width = 79
          Height = 13
          AutoSize = False
          Caption = 'C'#243'd. Recinto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 20
          Top = 56
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'C'#243'd. URF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 20
          Top = 176
          Width = 88
          Height = 13
          AutoSize = False
          Caption = 'C'#243'd. Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 20
          Top = 215
          Width = 97
          Height = 13
          AutoSize = False
          Caption = 'Margem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 161
          Top = 216
          Width = 89
          Height = 13
          AutoSize = False
          Caption = 'Tipo de Taxa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_setor: TSpeedButton
          Left = 621
          Top = 147
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
          OnClick = btn_co_setorClick
        end
        object btn_co_recinto: TSpeedButton
          Left = 621
          Top = 108
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
          OnClick = btn_co_recintoClick
        end
        object btn_co_unidade: TSpeedButton
          Left = 621
          Top = 188
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
          OnClick = btn_co_unidadeClick
        end
        object btn_co_urf: TSpeedButton
          Left = 621
          Top = 68
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
          OnClick = btn_co_urfClick
        end
        object Label11: TLabel
          Left = 376
          Top = 216
          Width = 97
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_local_desp: TLabel
          Left = 20
          Top = 258
          Width = 172
          Height = 13
          Caption = 'Local de Despacho Aduaneiro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_uf: TLabel
          Left = 317
          Top = 258
          Width = 17
          Height = 13
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_taxa: TLabel
          Left = 376
          Top = 258
          Width = 73
          Height = 13
          AutoSize = False
          Caption = 'Taxa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object btn_co_taxa: TSpeedButton
          Left = 629
          Top = 271
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
          Visible = False
          OnClick = btn_co_taxaClick
        end
        object Label34: TLabel
          Left = 20
          Top = 301
          Width = 55
          Height = 13
          Caption = 'Endere'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 338
          Top = 302
          Width = 40
          Height = 13
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_cidade: TSpeedButton
          Left = 553
          Top = 315
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
        object Label36: TLabel
          Left = 20
          Top = 346
          Width = 90
          Height = 13
          Caption = 'Contato (e-mail)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 338
          Top = 346
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
        object Label38: TLabel
          Left = 434
          Top = 346
          Width = 21
          Height = 13
          Caption = 'Fax'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 529
          Top = 345
          Width = 32
          Height = 13
          Caption = 'CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nm_amz: TDBEdit
          Left = 108
          Top = 31
          Width = 277
          Height = 21
          DataField = 'NM_ARMAZEM'
          DataSource = datm_amz.ds_amz
          TabOrder = 0
          OnChange = dbedt_nm_amzChange
        end
        object dblkpcbox_ativo_amz: TDBLookupComboBox
          Left = 580
          Top = 32
          Width = 66
          Height = 21
          DataField = 'look_ativo'
          DataSource = datm_amz.ds_amz
          DropDownRows = 3
          TabOrder = 3
          OnClick = dbedt_nm_amzChange
        end
        object dbedt_nm_sigla: TDBEdit
          Left = 389
          Top = 31
          Width = 90
          Height = 21
          DataField = 'NM_SIGLA'
          DataSource = datm_amz.ds_amz
          TabOrder = 1
          OnChange = dbedt_nm_amzChange
        end
        object dblkpcbox_nm_setor: TEdit
          Left = 108
          Top = 148
          Width = 512
          Height = 21
          TabStop = False
          ParentColor = True
          ReadOnly = True
          TabOrder = 22
        end
        object dblkpcbox_nm_urf: TEdit
          Left = 108
          Top = 69
          Width = 512
          Height = 21
          TabStop = False
          ParentColor = True
          ReadOnly = True
          TabOrder = 20
        end
        object dblkpcbox_nm_recinto: TEdit
          Left = 108
          Top = 109
          Width = 512
          Height = 21
          TabStop = False
          ParentColor = True
          ReadOnly = True
          TabOrder = 21
        end
        object dblkpcbox_nm_unidade: TEdit
          Left = 108
          Top = 189
          Width = 512
          Height = 21
          TabStop = False
          ParentColor = True
          ReadOnly = True
          TabOrder = 23
        end
        object dblkpcbox_margem: TDBLookupComboBox
          Left = 20
          Top = 228
          Width = 135
          Height = 21
          DataField = 'look_margem'
          DataSource = datm_amz.ds_amz
          DropDownRows = 3
          ListFieldIndex = 1
          TabOrder = 8
          OnClick = dbedt_nm_amzChange
        end
        object dblkpcbox_tp_taxa: TDBLookupComboBox
          Left = 162
          Top = 228
          Width = 133
          Height = 21
          DataField = 'look_tp_taxa'
          DataSource = datm_amz.ds_amz
          ListFieldIndex = 1
          TabOrder = 9
          OnClick = dbedt_nm_amzChange
        end
        object Panel2: TPanel
          Left = 307
          Top = 222
          Width = 289
          Height = 27
          BevelInner = bvLowered
          Caption = 'Panel2'
          TabOrder = 10
          object dbchkbox_estocagem: TDBCheckBox
            Left = 7
            Top = 5
            Width = 88
            Height = 17
            Caption = 'Estocagem'
            DataField = 'IN_ESTOCAGEM'
            DataSource = datm_amz.ds_amz
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbedt_nm_amzChange
          end
          object dbchkbox_atracacao: TDBCheckBox
            Left = 105
            Top = 5
            Width = 82
            Height = 17
            Caption = 'Atraca'#231#227'o'
            DataField = 'IN_ATRACACAO'
            DataSource = datm_amz.ds_amz
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbedt_nm_amzChange
          end
          object dbchkbox_descarga: TDBCheckBox
            Left = 205
            Top = 5
            Width = 79
            Height = 17
            Caption = 'Descarga'
            DataField = 'IN_DESCARGA'
            DataSource = datm_amz.ds_amz
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbedt_nm_amzChange
          end
        end
        object dbedt_nm_sigla_compl: TDBEdit
          Left = 485
          Top = 31
          Width = 90
          Height = 21
          DataField = 'NM_SIGLA_CONT'
          DataSource = datm_amz.ds_amz
          TabOrder = 2
          OnChange = dbedt_nm_amzChange
        end
        object dbedt_nm_local_desp: TDBEdit
          Left = 20
          Top = 272
          Width = 290
          Height = 21
          DataField = 'NM_LOCAL_DESP'
          DataSource = datm_amz.ds_amz
          TabOrder = 11
          OnChange = dbedt_nm_amzChange
        end
        object dbedt_cd_uf: TDBEdit
          Left = 317
          Top = 272
          Width = 54
          Height = 21
          DataField = 'CD_UF'
          DataSource = datm_amz.ds_amz
          TabOrder = 12
          OnChange = dbedt_nm_amzChange
        end
        object dbedt_nm_taxa: TEdit
          Left = 423
          Top = 272
          Width = 205
          Height = 21
          TabStop = False
          ParentColor = True
          ReadOnly = True
          TabOrder = 25
          Visible = False
        end
        object dbedt_cd_taxa: TDBEdit
          Left = 377
          Top = 272
          Width = 47
          Height = 21
          DataField = 'CD_TAXA'
          DataSource = datm_amz.ds_amz
          TabOrder = 13
          Visible = False
          OnChange = dbedt_nm_amzChange
          OnExit = dbedt_cd_taxaExit
          OnKeyDown = dbedt_cd_urfKeyDown
        end
        object dbedt_cd_amz: TDBEdit
          Left = 20
          Top = 31
          Width = 77
          Height = 21
          TabStop = False
          DataField = 'CD_ARMAZEM'
          DataSource = datm_amz.ds_amz
          ParentColor = True
          ReadOnly = True
          TabOrder = 24
        end
        object dbedt_cd_setor: TDBEdit
          Left = 20
          Top = 148
          Width = 89
          Height = 21
          DataField = 'CD_SETOR'
          DataSource = datm_amz.ds_amz
          TabOrder = 6
          OnChange = btn_co_setorClick
          OnExit = dbedt_cd_setorExit
          OnKeyDown = dbedt_cd_urfKeyDown
        end
        object dbedt_cd_urf: TDBEdit
          Left = 20
          Top = 69
          Width = 89
          Height = 21
          DataField = 'CD_URF'
          DataSource = datm_amz.ds_amz
          TabOrder = 4
          OnChange = btn_co_urfClick
          OnExit = dbedt_cd_urfExit
          OnKeyDown = dbedt_cd_urfKeyDown
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 20
          Top = 189
          Width = 89
          Height = 21
          DataField = 'CD_UNID_NEG'
          DataSource = datm_amz.ds_amz
          TabOrder = 7
          OnChange = btn_co_unidadeClick
          OnExit = dbedt_cd_unid_negExit
          OnKeyDown = dbedt_cd_urfKeyDown
        end
        object dbedt_cd_recinto: TDBEdit
          Left = 20
          Top = 109
          Width = 89
          Height = 21
          DataField = 'CD_RECINTO'
          DataSource = datm_amz.ds_amz
          TabOrder = 5
          OnChange = btn_co_recintoClick
          OnExit = dbedt_cd_recintoExit
          OnKeyDown = dbedt_cd_urfKeyDown
        end
        object DBEdit1: TDBEdit
          Left = 20
          Top = 316
          Width = 312
          Height = 21
          DataField = 'END_ARMAZEM'
          DataSource = datm_amz.ds_amz
          TabOrder = 14
          OnChange = dbedt_nm_amzChange
        end
        object dbedt_nm_cidade: TEdit
          Left = 381
          Top = 316
          Width = 171
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 26
        end
        object DBEdit4: TDBEdit
          Left = 20
          Top = 360
          Width = 312
          Height = 21
          DataField = 'NM_CONTATO'
          DataSource = datm_amz.ds_amz
          TabOrder = 16
          OnChange = dbedt_nm_amzChange
        end
        object DBEdit5: TDBEdit
          Left = 338
          Top = 360
          Width = 91
          Height = 21
          DataField = 'NR_TELEFONE'
          DataSource = datm_amz.ds_amz
          TabOrder = 17
          OnChange = dbedt_nm_amzChange
        end
        object DBEdit6: TDBEdit
          Left = 434
          Top = 360
          Width = 91
          Height = 21
          DataField = 'NR_FAX'
          DataSource = datm_amz.ds_amz
          TabOrder = 18
          OnChange = dbedt_nm_amzChange
        end
        object dbedt_cnpj_amz: TDBEdit
          Left = 529
          Top = 360
          Width = 126
          Height = 21
          DataField = 'CGC_ARMAZEM'
          DataSource = datm_amz.ds_amz
          TabOrder = 19
          OnChange = dbedt_nm_amzChange
        end
        object dbedt_cd_cidade: TDBEdit
          Left = 338
          Top = 316
          Width = 44
          Height = 21
          DataField = 'CD_CIDADE'
          DataSource = datm_amz.ds_amz
          TabOrder = 15
          OnChange = btn_co_cidadeClick
          OnKeyDown = dbedt_cd_urfKeyDown
        end
      end
    end
    object ts_tabela: TTabSheet
      Caption = '&Tabela'
      ImageIndex = 2
      TabVisible = False
      object pgctrl_tab: TPageControl
        Left = 0
        Top = 0
        Width = 726
        Height = 414
        ActivePage = ts_lista_tab
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_tabChange
        OnChanging = pgctrl_amzChanging
        object ts_lista_tab: TTabSheet
          Caption = 'Lista'
          object TLabel
            Left = 8
            Top = 8
            Width = 3
            Height = 13
          end
          object Label12: TLabel
            Left = 8
            Top = 1
            Width = 81
            Height = 13
            Caption = 'C'#243'd. Armaz'#233'm'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label26: TLabel
            Left = 144
            Top = 1
            Width = 87
            Height = 13
            Caption = 'Nome Armaz'#233'm'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBGrid1: TDBGrid
            Left = 6
            Top = 49
            Width = 707
            Height = 336
            DataSource = datm_amz.ds_arm_tabela
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
                FieldName = 'CD_TABELA'
                Title.Caption = 'C'#243'd. Tabela'
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
                FieldName = 'NM_TABELA'
                Title.Caption = 'Descri'#231'ao'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = True
              end>
          end
          object dbedt_cd_amz2: TDBEdit
            Left = 8
            Top = 17
            Width = 113
            Height = 21
            Color = clBtnFace
            DataField = 'CD_ARMAZEM'
            DataSource = datm_amz.ds_amz
            Enabled = False
            TabOrder = 1
          end
          object dbedt_nm_amz2: TDBEdit
            Left = 144
            Top = 17
            Width = 241
            Height = 21
            Color = clBtnFace
            DataField = 'NM_ARMAZEM'
            DataSource = datm_amz.ds_amz
            Enabled = False
            TabOrder = 2
          end
        end
        object ts_dados_basicos_tab: TTabSheet
          Caption = 'Dados B'#225'sicos'
          object Label13: TLabel
            Left = 103
            Top = 50
            Width = 58
            Height = 13
            Caption = 'Descri'#231#227'o'
            FocusControl = dbedt_nm_tab
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 376
            Top = 48
            Width = 41
            Height = 13
            Caption = 'Padr'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 5
            Top = 2
            Width = 51
            Height = 13
            Caption = 'Armaz'#233'm'
            FocusControl = dbedt_cd_amz3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 5
            Top = 50
            Width = 66
            Height = 13
            Caption = 'C'#243'd.Tabela'
            FocusControl = dbedt_cd_tab
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label30: TLabel
            Left = 103
            Top = 2
            Width = 87
            Height = 13
            Caption = 'Nome Armaz'#233'm'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label32: TLabel
            Left = 434
            Top = 48
            Width = 30
            Height = 13
            Caption = 'Ativo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label40: TLabel
            Left = 491
            Top = 48
            Width = 53
            Height = 13
            Caption = 'Tipo Cntr'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object BtnTpCntr: TSpeedButton
            Left = 670
            Top = 63
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
            OnClick = BtnTpCntrClick
          end
          object Label41: TLabel
            Left = 300
            Top = 114
            Width = 75
            Height = 13
            Caption = 'Valor M'#237'nimo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_nm_tab: TDBEdit
            Left = 103
            Top = 64
            Width = 266
            Height = 21
            DataField = 'NM_TABELA'
            DataSource = datm_amz.ds_arm_tabela
            TabOrder = 0
          end
          object dbedt_cd_amz3: TDBEdit
            Left = 5
            Top = 18
            Width = 92
            Height = 21
            Color = clBtnFace
            DataField = 'CD_ARMAZEM'
            DataSource = datm_amz.ds_amz
            Enabled = False
            TabOrder = 6
          end
          object dbedt_cd_tab: TDBEdit
            Left = 5
            Top = 64
            Width = 92
            Height = 21
            Color = clBtnFace
            DataField = 'CD_TABELA'
            DataSource = datm_amz.ds_arm_tabela
            Enabled = False
            TabOrder = 8
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 434
            Top = 64
            Width = 49
            Height = 21
            DataField = 'LookAtivo'
            DataSource = datm_amz.ds_arm_tabela
            TabOrder = 2
          end
          object dbck_in_sabdom: TDBCheckBox
            Left = 5
            Top = 171
            Width = 217
            Height = 17
            Caption = 'Incluir S'#225'bados e Domingos'
            DataField = 'IN_SABDOM'
            DataSource = datm_amz.ds_arm_tabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbck_in_feriado: TDBCheckBox
            Left = 5
            Top = 195
            Width = 113
            Height = 17
            Caption = 'Incluir Feriados'
            DataField = 'IN_FERIADO'
            DataSource = datm_amz.ds_arm_tabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbedt_nm_amz3: TDBEdit
            Left = 103
            Top = 18
            Width = 241
            Height = 21
            Color = clBtnFace
            DataField = 'NM_ARMAZEM'
            DataSource = datm_amz.ds_amz
            Enabled = False
            TabOrder = 7
          end
          object DBLookupComboBox2: TDBLookupComboBox
            Left = 376
            Top = 64
            Width = 49
            Height = 21
            DataField = 'lookPadrao'
            DataSource = datm_amz.ds_arm_tabela
            TabOrder = 1
          end
          object GroupBox1: TGroupBox
            Left = 5
            Top = 93
            Width = 284
            Height = 64
            Caption = 'Vig'#234'ncia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            object Label31: TLabel
              Left = 13
              Top = 18
              Width = 66
              Height = 13
              Caption = 'Data Inicial'
              FocusControl = dbedt_cd_tab
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label33: TLabel
              Left = 149
              Top = 18
              Width = 59
              Height = 13
              Caption = 'Data Final'
              FocusControl = dbedt_cd_tab
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_dt_emissao_li: TDBDateEdit
              Left = 13
              Top = 35
              Width = 114
              Height = 21
              DataField = 'DT_VIGENCIA_INI'
              DataSource = datm_amz.ds_arm_tabela
              NumGlyphs = 2
              TabOrder = 0
            end
            object DBDateEdit1: TDBDateEdit
              Left = 149
              Top = 35
              Width = 114
              Height = 21
              DataField = 'DT_VIGENCIA_FIM'
              DataSource = datm_amz.ds_arm_tabela
              NumGlyphs = 2
              TabOrder = 1
            end
          end
          object EditTpCntr: TDBEdit
            Left = 492
            Top = 64
            Width = 33
            Height = 21
            DataField = 'TP_CNTR'
            DataSource = datm_amz.ds_arm_tabela
            TabOrder = 3
            OnChange = BtnTpCntrClick
            OnKeyDown = dbedt_cd_urfKeyDown
          end
          object EditNmTpCntr: TEdit
            Left = 536
            Top = 64
            Width = 132
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 11
          end
          object DBEdit3: TDBEdit
            Left = 300
            Top = 130
            Width = 108
            Height = 21
            DataField = 'VL_MINIMO'
            DataSource = datm_amz.ds_arm_tabela
            TabOrder = 5
            OnKeyDown = dbedt_cd_urfKeyDown
          end
        end
        object ts_periodo: TTabSheet
          Caption = 'Per'#237'odo'
          object Label22: TLabel
            Left = 2
            Top = 3
            Width = 77
            Height = 13
            Caption = 'C'#243'd.Armaz'#233'm'
            FocusControl = dbedt_cd_amz4
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 2
            Top = 43
            Width = 66
            Height = 13
            Caption = 'C'#243'd.Tabela'
            FocusControl = dbedt_cd_tab2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label28: TLabel
            Left = 85
            Top = 3
            Width = 87
            Height = 13
            Caption = 'Nome Armaz'#233'm'
            FocusControl = dbedt_cd_amz4
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label29: TLabel
            Left = 85
            Top = 43
            Width = 76
            Height = 13
            Caption = 'Nome Tabela'
            FocusControl = dbedt_cd_tab2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_cd_amz4: TDBEdit
            Left = 2
            Top = 18
            Width = 73
            Height = 21
            Color = clBtnFace
            DataField = 'CD_ARMAZEM'
            DataSource = datm_amz.ds_amz
            Enabled = False
            TabOrder = 0
          end
          object DBGrid2: TDBGrid
            Left = 2
            Top = 88
            Width = 722
            Height = 169
            DataSource = datm_amz.ds_arm_tab_periodo
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnKeyPress = dbg_amzKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'NR_PERIODO'
                Title.Caption = 'Per'#237'odo'
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
                FieldName = 'QT_DIAS'
                Title.Caption = 'Qtd. Dias'
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
                FieldName = 'VL_PERCENTUAL'
                Title.Caption = 'Valor Percentual'
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
                FieldName = 'VL_TX_ADICIONAL'
                Title.Caption = 'Valor Taxa Adicional'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = True
              end>
          end
          object dbedt_cd_tab2: TDBEdit
            Left = 2
            Top = 59
            Width = 76
            Height = 21
            Color = clBtnFace
            DataField = 'CD_TABELA'
            DataSource = datm_amz.ds_arm_tabela
            Enabled = False
            TabOrder = 3
          end
          object dbedt_nm_amz4: TDBEdit
            Left = 85
            Top = 18
            Width = 294
            Height = 21
            Color = clBtnFace
            DataField = 'NM_ARMAZEM'
            DataSource = datm_amz.ds_amz
            Enabled = False
            TabOrder = 1
          end
          object dbedt_nm_tab2: TDBEdit
            Left = 85
            Top = 59
            Width = 293
            Height = 21
            Color = clBtnFace
            DataField = 'NM_TABELA'
            DataSource = datm_amz.ds_arm_tabela
            Enabled = False
            TabOrder = 4
          end
          object PnlDados: TPanel
            Left = 2
            Top = 264
            Width = 722
            Height = 65
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 5
            object Nr_periodo: TLabel
              Left = 12
              Top = 14
              Width = 68
              Height = 13
              Caption = 'Nr'#186' Per'#237'odo'
              FocusControl = dbed_nr_periodo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label23: TLabel
              Left = 97
              Top = 14
              Width = 50
              Height = 13
              Caption = 'Qtd.Dias'
              FocusControl = dbed_qt_dias
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label24: TLabel
              Left = 174
              Top = 14
              Width = 62
              Height = 13
              Caption = 'Percentual'
              FocusControl = dbed_percentual
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label25: TLabel
              Left = 260
              Top = 14
              Width = 85
              Height = 13
              Caption = 'Taxa Adicional'
              FocusControl = dbed_percentual
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbed_nr_periodo: TDBEdit
              Left = 12
              Top = 30
              Width = 64
              Height = 21
              Color = clBtnFace
              DataField = 'NR_PERIODO'
              DataSource = datm_amz.ds_arm_tab_periodo
              Enabled = False
              TabOrder = 0
            end
            object dbed_qt_dias: TDBEdit
              Left = 97
              Top = 30
              Width = 64
              Height = 21
              DataField = 'QT_DIAS'
              DataSource = datm_amz.ds_arm_tab_periodo
              TabOrder = 1
            end
            object dbed_percentual: TDBEdit
              Left = 174
              Top = 30
              Width = 64
              Height = 21
              DataField = 'VL_PERCENTUAL'
              DataSource = datm_amz.ds_arm_tab_periodo
              TabOrder = 2
            end
            object dbed_tx_adicional: TDBEdit
              Left = 260
              Top = 30
              Width = 64
              Height = 21
              DataField = 'VL_TX_ADICIONAL'
              DataSource = datm_amz.ds_arm_tab_periodo
              TabOrder = 3
            end
          end
        end
      end
    end
    object ts_despesas: TTabSheet
      Caption = 'Configura'#231#227'o das Despesas'
      ImageIndex = 3
      object pgctrl_despesas: TPageControl
        Left = 0
        Top = 0
        Width = 726
        Height = 414
        ActivePage = tsTabelas
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_despesasChange
        OnChanging = pgctrl_despesasChanging
        object tsTabelas: TTabSheet
          Caption = 'Tabelas'
          ImageIndex = 2
          object shp1: TShape
            Left = 5
            Top = 6
            Width = 709
            Height = 51
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object lbl2: TLabel
            Left = 13
            Top = 16
            Width = 43
            Height = 13
            Caption = 'Armaz'#233'm'
          end
          object edtCdArmazem: TEdit
            Left = 12
            Top = 29
            Width = 101
            Height = 19
            BevelInner = bvLowered
            BevelKind = bkSoft
            BevelOuter = bvNone
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object edtNmArmazem: TEdit
            Left = 112
            Top = 29
            Width = 590
            Height = 19
            BevelInner = bvLowered
            BevelKind = bkSoft
            BevelOuter = bvNone
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = True
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object dbgrdTabelas: TDBGrid
            Left = 5
            Top = 64
            Width = 702
            Height = 317
            DataSource = dsTabelas
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = pmAtivo
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
                FieldName = 'CD_TABELA'
                Title.Caption = 'C'#243'digo'
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TX_DESCRICAO_TABELA'
                Title.Caption = 'Identifica'#231#227'o da Tabela'
                Width = 356
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_VALIDADE'
                Title.Caption = 'Validade'
                Width = 79
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calcUsuario'
                Title.Caption = 'Autorizada e Finalizada por:'
                Width = 138
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calcAtivo'
                Font.Charset = SYMBOL_CHARSET
                Font.Color = clGreen
                Font.Height = -13
                Font.Name = 'Wingdings'
                Font.Style = [fsBold]
                Title.Caption = 'Ativo'
                Visible = True
              end>
          end
          object pnlDadosTabelas: TPanel
            Left = 151
            Top = 141
            Width = 441
            Height = 143
            BevelInner = bvLowered
            TabOrder = 3
            Visible = False
            object shp8: TShape
              Left = 6
              Top = 6
              Width = 429
              Height = 24
              Brush.Style = bsClear
              Pen.Color = clGray
            end
            object lbl9: TLabel
              Left = 12
              Top = 13
              Width = 248
              Height = 13
              Caption = 'Inclus'#227'o de nova tabela para este armaz'#233'm'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object shp9: TShape
              Left = 6
              Top = 31
              Width = 429
              Height = 106
              Brush.Style = bsClear
              Pen.Color = clGray
            end
            object lbl15: TLabel
              Left = 21
              Top = 46
              Width = 99
              Height = 13
              Caption = 'Descri'#231#227'o da Tabela'
              FocusControl = dbedtDescTabela
            end
            object lbl16: TLabel
              Left = 21
              Top = 86
              Width = 41
              Height = 13
              Caption = 'Validade'
              FocusControl = dbedtDtValidade
            end
            object dbedtDescTabela: TDBEdit
              Tag = 666
              Left = 21
              Top = 59
              Width = 396
              Height = 21
              DataField = 'TX_DESCRICAO_TABELA'
              DataSource = dsTabelas
              TabOrder = 0
            end
            object dbedtDtValidade: TDBEdit
              Tag = 666
              Left = 21
              Top = 99
              Width = 84
              Height = 21
              DataField = 'DT_VALIDADE'
              DataSource = dsTabelas
              TabOrder = 1
              OnExit = dbedtDtValidadeExit
            end
          end
        end
        object ts_despesas_lista: TTabSheet
          Caption = 'Listagem das Despesas'
          object shp7: TShape
            Left = 8
            Top = 6
            Width = 705
            Height = 20
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object lbl1: TLabel
            Left = 13
            Top = 10
            Width = 112
            Height = 13
            Caption = 'Listagem das Despesas'
          end
          object dbgrdDespesas: TDBGrid
            Left = 8
            Top = 28
            Width = 703
            Height = 352
            DataSource = dsDespesasBasicas
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete]
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
                FieldName = 'NM_ITEM'
                Title.Caption = 'Item'
                Width = 201
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TX_DESCRICAO_DESPESA'
                Title.Caption = 'Descri'#231#227'o da Despesa'
                Width = 262
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TX_VALOR_LIMITE'
                Title.Caption = 'Valor Limite'
                Width = 89
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TX_PERIODO'
                Title.Caption = 'Per'#237'odo'
                Width = 46
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_MARGEM'
                Title.Caption = 'Margem'
                Width = 72
                Visible = True
              end>
          end
        end
        object ts_despesas_config: TTabSheet
          Caption = 'Configura'#231#227'o / Valores / Per'#237'odos'
          ImageIndex = 1
          object shp2: TShape
            Left = 8
            Top = 6
            Width = 707
            Height = 376
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object shp4: TShape
            Left = 16
            Top = 63
            Width = 693
            Height = 186
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object shp6: TShape
            Left = 225
            Top = 132
            Width = 156
            Height = 22
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object shp5: TShape
            Left = 33
            Top = 129
            Width = 152
            Height = 22
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object shp3: TShape
            Left = 16
            Top = 14
            Width = 693
            Height = 48
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object lbl4: TLabel
            Left = 33
            Top = 76
            Width = 20
            Height = 13
            Caption = 'Item'
            FocusControl = dbedtCdItem
            Transparent = True
          end
          object lbl6: TLabel
            Left = 225
            Top = 119
            Width = 75
            Height = 13
            Caption = 'Limitar por Valor'
            FocusControl = edt_valor_inicial
            Transparent = True
          end
          object lbl8: TLabel
            Left = 415
            Top = 119
            Width = 62
            Height = 13
            Caption = 'Qtde de Dias'
            FocusControl = dbedtQtdDias
            Transparent = True
          end
          object lbl10: TLabel
            Left = 32
            Top = 326
            Width = 67
            Height = 13
            Caption = 'Valor Principal'
            FocusControl = dbedtValorPrincipal
          end
          object lbl11: TLabel
            Left = 184
            Top = 326
            Width = 132
            Height = 13
            Caption = 'M'#237'nimo para Containers 20"'
            FocusControl = dbedtCntr20
          end
          object lbl12: TLabel
            Left = 336
            Top = 326
            Width = 132
            Height = 13
            Caption = 'M'#237'nimo para Containers 40"'
            FocusControl = dbedtCntr40
          end
          object lbl3: TLabel
            Left = 26
            Top = 21
            Width = 108
            Height = 13
            Caption = 'Descri'#231#227'o da Despesa'
            FocusControl = dbedtDescDesp
            Transparent = True
          end
          object lbl5: TLabel
            Left = 33
            Top = 116
            Width = 38
            Height = 13
            Caption = 'Per'#237'odo'
            FocusControl = edt_periodo
            Transparent = True
          end
          object btnCoItem: TSpeedButton
            Left = 666
            Top = 88
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
            OnClick = btnCoItemClick
          end
          object img2: TImage
            Left = 382
            Top = 132
            Width = 19
            Height = 20
            Hint = 
              'Nesse campo voc'#234' limita per'#237'odos pelo valor do CIF.'#13#10'Se quiser p' +
              'or exemplo, limitar para CIF entre'#13#10'0 e 5000, preencha o primeir' +
              'o campo com " 0 " e o '#13#10'segundo com " 5000 ".'#13#10'Se quiser limitar' +
              ' um segundo per'#237'odo para maior'#13#10'de 5000, coloque " 5000 " e " ..' +
              '. ".'#13#10'Se n'#227'o desejar limitar, deixe os dois campos em branco.'
            Center = True
            ParentShowHint = False
            Picture.Data = {
              07544269746D6170F6000000424DF60000000000000076000000280000000F00
              000010000000010004000000000080000000C40E0000C40E0000100000000000
              0000000000000000800000800000008080008000000080008000808000007F7F
              7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF0033333CCCCC333330CCCCCC808CCCCCC000888807088880000F0770F7F077
              0F0070FFFFF7FFFFF07070FFFB99FBFFF07030FFBF99BFBFF030370BFBF7FBFB
              0730370FBF98BFBF07303B0BFB990BFB03303FB000B99000B3303BFBFBFB99FB
              F3303FBF99BF99BFB33033FB99FB99FB3330333FB9999FB333303333FBFBFB33
              3330}
            ShowHint = True
            Transparent = True
          end
          object img1: TImage
            Left = 187
            Top = 129
            Width = 19
            Height = 20
            Hint = 
              'Nesse campo '#233' colocado o per'#237'odo para esses valores. '#13#10'Caso voc'#234 +
              ' queira colocar esses valor para o per'#237'odo 1, 2 ou 3 em diante, ' +
              #13#10'basta clicar em " em diante ".'#13#10
            Center = True
            ParentShowHint = False
            Picture.Data = {
              07544269746D6170F6000000424DF60000000000000076000000280000000F00
              000010000000010004000000000080000000C40E0000C40E0000100000000000
              0000000000000000800000800000008080008000000080008000808000007F7F
              7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF0033333CCCCC333330CCCCCC808CCCCCC000888807088880000F0770F7F077
              0F0070FFFFF7FFFFF07070FFFB99FBFFF07030FFBF99BFBFF030370BFBF7FBFB
              0730370FBF98BFBF07303B0BFB990BFB03303FB000B99000B3303BFBFBFB99FB
              F3303FBF99BF99BFB33033FB99FB99FB3330333FB9999FB333303333FBFBFB33
              3330}
            ShowHint = True
            Transparent = True
            OnClick = img1Click
          end
          object lbl7: TLabel
            Left = 295
            Top = 137
            Width = 15
            Height = 13
            Caption = 'at'#233
            FocusControl = edt_valor_inicial
            Transparent = True
          end
          object edt_valor_inicial: TEdit
            Left = 225
            Top = 132
            Width = 59
            Height = 21
            TabOrder = 4
            OnChange = dbedtDescDespChange
            OnEnter = edt_periodoEnter
            OnExit = edt_valor_inicialExit
          end
          object dbedtQtdDias: TDBEdit
            Tag = 666
            Left = 415
            Top = 132
            Width = 65
            Height = 21
            DataField = 'QT_DIAS'
            DataSource = dsDespesasBasicas
            TabOrder = 6
            OnChange = dbedtDescDespChange
          end
          object dbedtValorPrincipal: TDBEdit
            Tag = 666
            Left = 32
            Top = 339
            Width = 134
            Height = 21
            DataField = 'VL_PRINCIPAL'
            DataSource = dsDespesasBasicas
            TabOrder = 11
            OnChange = dbedtDescDespChange
          end
          object dbedtCntr20: TDBEdit
            Tag = 666
            Left = 184
            Top = 339
            Width = 134
            Height = 21
            DataField = 'VL_MINIMO_20'
            DataSource = dsDespesasBasicas
            TabOrder = 12
            OnChange = dbedtDescDespChange
          end
          object dbedtCntr40: TDBEdit
            Tag = 666
            Left = 336
            Top = 339
            Width = 134
            Height = 21
            DataField = 'VL_MINIMO_40'
            DataSource = dsDespesasBasicas
            TabOrder = 13
            OnChange = dbedtDescDespChange
          end
          object dbedtDescDesp: TDBEdit
            Tag = 666
            Left = 25
            Top = 34
            Width = 676
            Height = 22
            AutoSize = False
            BevelInner = bvLowered
            BevelOuter = bvNone
            BevelKind = bkFlat
            Color = clWhite
            Ctl3D = False
            DataField = 'TX_DESCRICAO_DESPESA'
            DataSource = dsDespesasBasicas
            ParentCtl3D = False
            TabOrder = 0
            OnChange = dbedtDescDespChange
          end
          object edt_periodo: TEdit
            Tag = 666
            Left = 33
            Top = 129
            Width = 56
            Height = 21
            TabOrder = 2
            OnChange = dbedtDescDespChange
            OnEnter = edt_periodoEnter
            OnExit = edt_periodoExit
          end
          object edtNmItem: TEdit
            Left = 75
            Top = 89
            Width = 590
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 15
          end
          object dbedtCdItem: TDBEdit
            Tag = 666
            Left = 33
            Top = 89
            Width = 43
            Height = 21
            DataField = 'CD_ITEM'
            DataSource = dsDespesasBasicas
            TabOrder = 1
            OnChange = btnCoItemClick
            OnExit = dbedtCdItemExit
            OnKeyDown = dbedt_cd_urfKeyDown
          end
          object dbrgrpMargem: TDBRadioGroup
            Left = 442
            Top = 164
            Width = 222
            Height = 68
            Caption = 'Margem'
            Columns = 2
            DataField = 'IN_MARGEM'
            DataSource = dsDespesasBasicas
            Items.Strings = (
              'Mesma margem'
              'Entre margens'
              'Indiferente')
            TabOrder = 14
            Values.Strings = (
              'M'
              'E'
              'I')
          end
          object dbrgrpCalculo: TDBRadioGroup
            Left = 32
            Top = 262
            Width = 153
            Height = 49
            Caption = 'Tipo de Calculo'
            Columns = 2
            DataField = 'TX_TIPO_CALCULO'
            DataSource = dsDespesasBasicas
            Items.Strings = (
              '% CIF'
              'FIXO')
            TabOrder = 10
            Values.Strings = (
              '%CIF'
              'FIXO')
            OnChange = dbedtDescDespChange
          end
          object chk_emdiante: TCheckBox
            Left = 108
            Top = 132
            Width = 69
            Height = 17
            Caption = 'em diante'
            TabOrder = 3
          end
          object edt_valor_final: TEdit
            Left = 321
            Top = 132
            Width = 59
            Height = 21
            TabOrder = 5
            OnChange = dbedtDescDespChange
            OnEnter = edt_periodoEnter
            OnExit = edt_valor_finalExit
          end
          object dbrgrpCalcular: TDBRadioGroup
            Left = 33
            Top = 164
            Width = 106
            Height = 68
            Caption = 'Calcular'
            DataField = 'IN_POR_DIA'
            DataSource = dsDespesasBasicas
            Items.Strings = (
              'Por Per'#237'odo'
              'Por Registro')
            TabOrder = 7
            Values.Strings = (
              '0'
              '1')
            OnChange = dbrgrpCalcularChange
          end
          object dbrgrpDespesa: TDBRadioGroup
            Left = 146
            Top = 164
            Width = 106
            Height = 68
            Caption = 'Despesa para'
            DataField = 'TP_REGISTRO'
            DataSource = dsDespesasBasicas
            Items.Strings = (
              'Cont'#226'iner'
              'Carga Solta')
            TabOrder = 8
            Values.Strings = (
              'CO'
              'CS')
            OnChange = dbedtDescDespChange
          end
          object dbrgrpTpTamanho: TDBRadioGroup
            Left = 260
            Top = 164
            Width = 173
            Height = 68
            Caption = 'Tamanho CNTR'
            Columns = 2
            DataField = 'TP_TAMANHO'
            DataSource = dsDespesasBasicas
            Items.Strings = (
              'Cntr 20'#39
              'Cntr 40'#39
              'Ambos')
            TabOrder = 9
            Values.Strings = (
              '2'
              '4'
              'A')
          end
        end
      end
    end
  end
  object pnl_btn_amz: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 50
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      734
      50)
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 4
      Width = 38
      Height = 42
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
    object btn_excluir: TSpeedButton
      Left = 118
      Top = 4
      Width = 38
      Height = 42
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
    object btn_sair: TSpeedButton
      Left = 393
      Top = 4
      Width = 38
      Height = 42
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
      Left = 42
      Top = 4
      Width = 38
      Height = 42
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
      Left = 80
      Top = 4
      Width = 38
      Height = 42
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
    object dbnvg: TDBNavigator
      Left = 288
      Top = 13
      Width = 92
      Height = 23
      DataSource = datm_amz.ds_amz
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 427
      Top = 2
      Width = 305
      Height = 46
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 9
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
        Left = 145
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
        Left = 9
        Top = 18
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
        OnKeyDown = edt_chaveKeyDown
      end
      object cb_ordem: TComboBox
        Left = 145
        Top = 18
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
    Left = 196
    Top = 4
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
      Hint = ' '
      OnClick = btn_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object dsDespesasBasicas: TDataSource
    DataSet = qryDespesasBasicas
    OnDataChange = dsDespesasBasicasDataChange
    Left = 678
    Top = 149
  end
  object qryDespesasBasicas: TQuery
    CachedUpdates = True
    AfterPost = qryDespesasBasicasAfterPost
    AfterDelete = qryDespesasBasicasAfterDelete
    AfterScroll = qryDespesasBasicasAfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = dsTabelas
    SQL.Strings = (
      'SELECT     *'
      'FROM         TARMAZEM_DESPESAS_BASICAS ADB INNER JOIN'
      
        '                      TITEM IT ON ADB.CD_ITEM = IT.CD_ITEM LEFT ' +
        'OUTER JOIN'
      '                      TMARGEM MA ON ADB.CD_MARGEM = MA.CD_MARGEM'
      'WHERE     (ADB.CD_ARMAZEM = :CD_ARMAZEM)'
      'AND (ADB.CD_TABELA = :CD_TABELA)')
    UpdateObject = updDespesasBasicas
    Left = 679
    Top = 204
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
        Size = 5
      end
      item
        DataType = ftInteger
        Name = 'CD_TABELA'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryDespesasBasicasCD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      FixedChar = True
      Size = 4
    end
    object qryDespesasBasicasCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryDespesasBasicasCD_DESPESA_BASICA: TIntegerField
      FieldName = 'CD_DESPESA_BASICA'
    end
    object qryDespesasBasicasTX_VALOR_LIMITE: TStringField
      FieldName = 'TX_VALOR_LIMITE'
      FixedChar = True
    end
    object qryDespesasBasicasCD_MARGEM: TStringField
      FieldName = 'CD_MARGEM'
      FixedChar = True
      Size = 1
    end
    object qryDespesasBasicasQT_DIAS: TIntegerField
      FieldName = 'QT_DIAS'
    end
    object qryDespesasBasicasTX_TIPO_CALCULO: TStringField
      FieldName = 'TX_TIPO_CALCULO'
      FixedChar = True
      Size = 10
    end
    object qryDespesasBasicasVL_DESP_CIF: TStringField
      FieldName = 'VL_DESP_CIF'
      FixedChar = True
      Size = 50
    end
    object qryDespesasBasicasVL_DESP_VALOR: TStringField
      FieldName = 'VL_DESP_VALOR'
      FixedChar = True
      Size = 50
    end
    object qryDespesasBasicasTX_DESCRICAO_DESPESA: TStringField
      FieldName = 'TX_DESCRICAO_DESPESA'
      FixedChar = True
      Size = 200
    end
    object qryDespesasBasicasTX_PERIODO: TStringField
      FieldName = 'TX_PERIODO'
      FixedChar = True
      Size = 10
    end
    object qryDespesasBasicasNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qryDespesasBasicasNM_MARGEM: TStringField
      FieldName = 'NM_MARGEM'
      FixedChar = True
      Size = 8
    end
    object qryDespesasBasicasCD_TABELA: TIntegerField
      FieldName = 'CD_TABELA'
    end
    object qryDespesasBasicasIN_POR_DIA: TStringField
      FieldName = 'IN_POR_DIA'
      FixedChar = True
      Size = 1
    end
    object qryDespesasBasicasTP_REGISTRO: TStringField
      FieldName = 'TP_REGISTRO'
      FixedChar = True
      Size = 2
    end
    object qryDespesasBasicasTP_TAMANHO: TStringField
      FieldName = 'TP_TAMANHO'
      FixedChar = True
      Size = 1
    end
    object qryDespesasBasicasVL_PRINCIPAL: TFloatField
      FieldName = 'VL_PRINCIPAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryDespesasBasicasVL_MINIMO_20: TFloatField
      FieldName = 'VL_MINIMO_20'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryDespesasBasicasVL_MINIMO_40: TFloatField
      FieldName = 'VL_MINIMO_40'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryDespesasBasicasIN_MARGEM: TStringField
      FieldName = 'IN_MARGEM'
      FixedChar = True
      Size = 1
    end
  end
  object updDespesasBasicas: TUpdateSQL
    ModifySQL.Strings = (
      'update TARMAZEM_DESPESAS_BASICAS'
      'set'
      '  CD_ARMAZEM = :CD_ARMAZEM,'
      '  CD_ITEM = :CD_ITEM,'
      '  CD_DESPESA_BASICA = :CD_DESPESA_BASICA,'
      '  TX_DESCRICAO_DESPESA = :TX_DESCRICAO_DESPESA,'
      '  TX_VALOR_LIMITE = :TX_VALOR_LIMITE,'
      '  CD_MARGEM = :CD_MARGEM,'
      '  TX_PERIODO = :TX_PERIODO,'
      '  QT_DIAS = :QT_DIAS,'
      '  TX_TIPO_CALCULO = :TX_TIPO_CALCULO,'
      '  VL_PRINCIPAL = :VL_PRINCIPAL,'
      '  VL_MINIMO_20 = :VL_MINIMO_20,'
      '  VL_MINIMO_40 = :VL_MINIMO_40,'
      '  VL_DESP_CIF = :VL_DESP_CIF,'
      '  VL_DESP_VALOR = :VL_DESP_VALOR,'
      '  CD_TABELA = :CD_TABELA,'
      '  IN_POR_DIA = :IN_POR_DIA,'
      '  TP_REGISTRO = :TP_REGISTRO,'
      '  TP_TAMANHO = :TP_TAMANHO,'
      '  IN_MARGEM = :IN_MARGEM'
      'where'
      '  CD_ARMAZEM = :OLD_CD_ARMAZEM and'
      '  CD_DESPESA_BASICA = :OLD_CD_DESPESA_BASICA and'
      '  CD_TABELA = :OLD_CD_TABELA')
    InsertSQL.Strings = (
      'insert into TARMAZEM_DESPESAS_BASICAS'
      
        '  (CD_ARMAZEM, CD_ITEM, CD_DESPESA_BASICA, TX_DESCRICAO_DESPESA,' +
        ' TX_VALOR_LIMITE, '
      
        '   CD_MARGEM, TX_PERIODO, QT_DIAS, TX_TIPO_CALCULO, VL_PRINCIPAL' +
        ', VL_MINIMO_20, '
      
        '   VL_MINIMO_40, VL_DESP_CIF, VL_DESP_VALOR, CD_TABELA, IN_POR_D' +
        'IA, TP_REGISTRO, '
      '   TP_TAMANHO, IN_MARGEM)'
      'values'
      
        '  (:CD_ARMAZEM, :CD_ITEM, :CD_DESPESA_BASICA, :TX_DESCRICAO_DESP' +
        'ESA, :TX_VALOR_LIMITE, '
      
        '   :CD_MARGEM, :TX_PERIODO, :QT_DIAS, :TX_TIPO_CALCULO, :VL_PRIN' +
        'CIPAL, '
      
        '   :VL_MINIMO_20, :VL_MINIMO_40, :VL_DESP_CIF, :VL_DESP_VALOR, :' +
        'CD_TABELA, '
      '   :IN_POR_DIA, :TP_REGISTRO, :TP_TAMANHO, :IN_MARGEM)')
    DeleteSQL.Strings = (
      'delete from TARMAZEM_DESPESAS_BASICAS'
      'where'
      '  CD_ARMAZEM = :OLD_CD_ARMAZEM and'
      '  CD_DESPESA_BASICA = :OLD_CD_DESPESA_BASICA and'
      '  CD_TABELA = :OLD_CD_TABELA')
    Left = 680
    Top = 263
  end
  object dsTabelas: TDataSource
    DataSet = qryTabelas
    Left = 677
    Top = 371
  end
  object qryTabelas: TQuery
    AfterPost = qryDespesasBasicasAfterPost
    AfterDelete = qryDespesasBasicasAfterDelete
    AfterScroll = qryDespesasBasicasAfterScroll
    OnCalcFields = qryTabelasCalcFields
    DatabaseName = 'DBBROKER'
    DataSource = datm_amz.ds_amz
    RequestLive = True
    SQL.Strings = (
      'SELECT     *'
      'FROM         TARMAZEM_TABELAS_BASICAS'
      'WHERE     (CD_ARMAZEM = :CD_ARMAZEM)')
    Left = 678
    Top = 319
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
        Size = 5
      end>
    object qryTabelasCD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_BASICAS.CD_ARMAZEM'
      FixedChar = True
      Size = 4
    end
    object qryTabelasCD_TABELA: TIntegerField
      FieldName = 'CD_TABELA'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_BASICAS.CD_TABELA'
    end
    object qryTabelasDT_VALIDADE: TDateTimeField
      FieldName = 'DT_VALIDADE'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_BASICAS.DT_VALIDADE'
      EditMask = '99/99/9999;1;_'
    end
    object qryTabelasTX_DESCRICAO_TABELA: TStringField
      FieldName = 'TX_DESCRICAO_TABELA'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_BASICAS.TX_DESCRICAO_TABELA'
      FixedChar = True
      Size = 100
    end
    object qryTabelasIN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_BASICAS.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qryTabelascalcAtivo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcAtivo'
      Size = 1
      Calculated = True
    end
    object qryTabelasCD_USUARIO_ATIVACAO: TStringField
      FieldName = 'CD_USUARIO_ATIVACAO'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_BASICAS.CD_USUARIO_ATIVACAO'
      FixedChar = True
      Size = 4
    end
    object qryTabelascalcUsuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcUsuario'
      Size = 100
      Calculated = True
    end
  end
  object pmAtivo: TPopupMenu
    Left = 686
    Top = 79
    object mi_ativar: TMenuItem
      Caption = 'Ativar esta tabela'
      OnClick = mi_ativarClick
    end
    object DesativarestaTabela1: TMenuItem
      Caption = 'Desativar esta Tabela'
      OnClick = DesativarestaTabela1Click
    end
  end
end
