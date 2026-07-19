object frm_moeda: Tfrm_moeda
  Left = 170
  Top = 124
  Width = 750
  Height = 550
  Caption = 'Tabela de Moedas'
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
  object pgctrl_moeda: TPageControl
    Left = 0
    Top = 49
    Width = 742
    Height = 455
    ActivePage = ts_dados_basicos
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_moedaChange
    OnChanging = pgctrl_moedaChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 427
        Align = alClient
        DataSource = datm_moeda.ds_moeda
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_cadastroDblClick
        OnKeyPress = dbg_cadastroKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_MOEDA'
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
            FieldName = 'NM_MOEDA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 246
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_MOEDA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookAtivo'
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
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 427
        Align = alClient
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_cd_moeda: TLabel
          Left = 21
          Top = 24
          Width = 40
          Height = 13
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nm_moeda: TLabel
          Left = 66
          Top = 24
          Width = 58
          Height = 13
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblAtivo: TLabel
          Left = 434
          Top = 25
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
        object lbl_via_transp_siscomex: TLabel
          Left = 102
          Top = 76
          Width = 94
          Height = 13
          Caption = 'C'#243'd. SISCOMEX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_scx: TSpeedButton
          Left = 375
          Top = 90
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
          OnClick = btn_co_moeda_scxClick
        end
        object lbl_sigla: TLabel
          Left = 21
          Top = 76
          Width = 29
          Height = 13
          Caption = 'Sigla'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nm_moeda: TDBEdit
          Left = 66
          Top = 38
          Width = 345
          Height = 21
          DataField = 'NM_MOEDA'
          DataSource = datm_moeda.ds_moeda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = dbedt_nm_moedaChange
        end
        object dblkpcbox_ativo: TDBLookupComboBox
          Left = 434
          Top = 38
          Width = 50
          Height = 21
          DataField = 'IN_ATIVO'
          DataSource = datm_moeda.ds_moeda
          DropDownRows = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_moeda.ds_yesno
          ParentFont = False
          TabOrder = 2
          OnClick = dbedt_nm_moedaChange
        end
        object dbedt_nm_moeda_scx: TDBEdit
          Left = 146
          Top = 90
          Width = 228
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookScx'
          DataSource = datm_moeda.ds_moeda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_ap_moeda: TDBEdit
          Left = 21
          Top = 90
          Width = 58
          Height = 21
          DataField = 'AP_MOEDA'
          DataSource = datm_moeda.ds_moeda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = dbedt_nm_moedaChange
        end
        object PageControl1: TPageControl
          Left = 21
          Top = 136
          Width = 580
          Height = 192
          ActivePage = tbsht_port
          TabOrder = 6
          object tbsht_port: TTabSheet
            Caption = 'Portugu'#234's'
            object Panel2: TPanel
              Left = 0
              Top = 0
              Width = 572
              Height = 164
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label3: TLabel
                Left = 29
                Top = 24
                Width = 89
                Height = 13
                Caption = 'Moeda Singular'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label4: TLabel
                Left = 256
                Top = 24
                Width = 75
                Height = 13
                Caption = 'Moeda Plural'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label5: TLabel
                Left = 29
                Top = 91
                Width = 98
                Height = 13
                Caption = 'Centavo Singular'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label6: TLabel
                Left = 256
                Top = 91
                Width = 84
                Height = 13
                Caption = 'Centavo Plural'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbedt_nm_moeda_sing: TDBEdit
                Left = 29
                Top = 40
                Width = 172
                Height = 21
                DataField = 'NM_MOEDA_SING'
                DataSource = datm_moeda.ds_moeda
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 30
                ParentFont = False
                TabOrder = 0
                OnChange = dbedt_nm_moedaChange
              end
              object dbedt_nm_moeda_plural: TDBEdit
                Left = 256
                Top = 40
                Width = 172
                Height = 21
                DataField = 'NM_MOEDA_PLURAL'
                DataSource = datm_moeda.ds_moeda
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 30
                ParentFont = False
                TabOrder = 1
                OnChange = dbedt_nm_moedaChange
              end
              object dbedt_nm_cent_sing: TDBEdit
                Left = 29
                Top = 107
                Width = 172
                Height = 21
                DataField = 'NM_CENTAVOS_SING'
                DataSource = datm_moeda.ds_moeda
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 30
                ParentFont = False
                TabOrder = 2
                OnChange = dbedt_nm_moedaChange
              end
              object dbedt_nm_cent_plural: TDBEdit
                Left = 256
                Top = 107
                Width = 172
                Height = 21
                DataField = 'NM_CENTAVOS_PLURAL'
                DataSource = datm_moeda.ds_moeda
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 30
                ParentFont = False
                TabOrder = 3
                OnChange = dbedt_nm_moedaChange
              end
            end
          end
          object tbsht_ingles: TTabSheet
            Caption = 'Ingl'#234's'
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 572
              Height = 164
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label7: TLabel
                Left = 29
                Top = 24
                Width = 89
                Height = 13
                Caption = 'Moeda Singular'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label8: TLabel
                Left = 29
                Top = 91
                Width = 98
                Height = 13
                Caption = 'Centavo Singular'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label9: TLabel
                Left = 256
                Top = 91
                Width = 84
                Height = 13
                Caption = 'Centavo Plural'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label10: TLabel
                Left = 256
                Top = 24
                Width = 75
                Height = 13
                Caption = 'Moeda Plural'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbedt_nm_moeda_sing_ing: TDBEdit
                Left = 29
                Top = 40
                Width = 172
                Height = 21
                DataField = 'NM_MOEDA_SING_ING'
                DataSource = datm_moeda.ds_moeda
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 30
                ParentFont = False
                TabOrder = 0
                OnChange = dbedt_nm_moedaChange
              end
              object dbedt_nm_cent_sing_ing: TDBEdit
                Left = 29
                Top = 107
                Width = 172
                Height = 21
                DataField = 'NM_CENTAVOS_SING_ING'
                DataSource = datm_moeda.ds_moeda
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 30
                ParentFont = False
                TabOrder = 2
                OnChange = dbedt_nm_moedaChange
              end
              object dbedt_nm_cent_plural_ing: TDBEdit
                Left = 256
                Top = 107
                Width = 172
                Height = 21
                DataField = 'NM_CENTAVOS_PLURAL_ING'
                DataSource = datm_moeda.ds_moeda
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 30
                ParentFont = False
                TabOrder = 3
                OnChange = dbedt_nm_moedaChange
              end
              object dbedt_nm_moeda_plural_ing: TDBEdit
                Left = 256
                Top = 40
                Width = 172
                Height = 21
                DataField = 'NM_MOEDA_PLURAL_ING'
                DataSource = datm_moeda.ds_moeda
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 30
                ParentFont = False
                TabOrder = 1
                OnChange = dbedt_nm_moedaChange
              end
            end
          end
          object tbsht_espanhol: TTabSheet
            Caption = 'Espanhol'
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 572
              Height = 164
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label11: TLabel
                Left = 29
                Top = 24
                Width = 89
                Height = 13
                Caption = 'Moeda Singular'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label12: TLabel
                Left = 29
                Top = 91
                Width = 98
                Height = 13
                Caption = 'Centavo Singular'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label13: TLabel
                Left = 256
                Top = 91
                Width = 84
                Height = 13
                Caption = 'Centavo Plural'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label14: TLabel
                Left = 256
                Top = 24
                Width = 75
                Height = 13
                Caption = 'Moeda Plural'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbedt_nm_moeda_sing_esp: TDBEdit
                Left = 29
                Top = 40
                Width = 172
                Height = 21
                DataField = 'NM_MOEDA_SING_ESP'
                DataSource = datm_moeda.ds_moeda
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 30
                ParentFont = False
                TabOrder = 0
                OnChange = dbedt_nm_moedaChange
              end
              object dbedt_nm_cent_sing_esp: TDBEdit
                Left = 29
                Top = 107
                Width = 172
                Height = 21
                DataField = 'NM_CENTAVOS_SING_ESP'
                DataSource = datm_moeda.ds_moeda
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 30
                ParentFont = False
                TabOrder = 2
                OnChange = dbedt_nm_moedaChange
              end
              object dbedt_nm_cent_plural_esp: TDBEdit
                Left = 256
                Top = 107
                Width = 172
                Height = 21
                DataField = 'NM_CENTAVOS_PLURAL_ESP'
                DataSource = datm_moeda.ds_moeda
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 30
                ParentFont = False
                TabOrder = 3
                OnChange = dbedt_nm_moedaChange
              end
              object dbedt_nm_moeda_plural_esp: TDBEdit
                Left = 256
                Top = 40
                Width = 172
                Height = 21
                DataField = 'NM_MOEDA_PLURAL_ESP'
                DataSource = datm_moeda.ds_moeda
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 30
                ParentFont = False
                TabOrder = 1
                OnChange = dbedt_nm_moedaChange
              end
            end
          end
        end
        object dbedt_cd_moeda_scx: TDBEdit
          Left = 102
          Top = 90
          Width = 45
          Height = 21
          DataField = 'CD_MOEDA_SCX'
          DataSource = datm_moeda.ds_moeda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = dbedt_nm_moedaChange
          OnExit = dbedt_cd_moeda_scxExit
          OnKeyDown = dbedt_cd_moeda_scxKeyDown
        end
        object dbedt_cd_moeda: TDBEdit
          Left = 21
          Top = 38
          Width = 46
          Height = 21
          Color = clWhite
          DataField = 'CD_MOEDA'
          DataSource = datm_moeda.ds_moeda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_nm_moedaChange
          OnExit = dbedt_cd_moedaExit
        end
      end
    end
    object ts_taxa_cambio: TTabSheet
      Caption = 'Taxas de C'#226'mbio'
      object pgctrl_taxa_cambio: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 427
        ActivePage = ts_dados_basicos2
        Align = alClient
        HotTrack = True
        TabOrder = 0
        OnChange = pgctrl_moedaChange
        OnChanging = pgctrl_moedaChanging
        object ts_lista2: TTabSheet
          Caption = '    Lista    '
          object lbl_moeda: TLabel
            Left = 8
            Top = 8
            Width = 39
            Height = 13
            Caption = 'Moeda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbg_contatos: TDBGrid
            Left = 0
            Top = 53
            Width = 726
            Height = 346
            Align = alBottom
            DataSource = datm_moeda.ds_taxa_cambio
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
                Alignment = taCenter
                Expanded = False
                FieldName = 'DT_INICIO_VIGENCIA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'DT_TERMINO_VIGENCIA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
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
                FieldName = 'TX_CAMBIO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end>
          end
          object dbedt_nm_moeda2: TDBEdit
            Left = 46
            Top = 23
            Width = 289
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NM_MOEDA'
            DataSource = datm_moeda.ds_moeda
            ReadOnly = True
            TabOrder = 2
          end
          object dbedt_cd_moeda2: TDBEdit
            Left = 8
            Top = 23
            Width = 39
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_MOEDA'
            DataSource = datm_moeda.ds_moeda
            ReadOnly = True
            TabOrder = 1
          end
        end
        object ts_dados_basicos2: TTabSheet
          Caption = '   Dados B'#225'sicos   '
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 399
            Align = alClient
            BevelOuter = bvLowered
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object lbl_dt_inicio_vig: TLabel
              Left = 8
              Top = 62
              Width = 105
              Height = 13
              Caption = 'In'#237'cio da Vig'#234'ncia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_dt_termino_vig: TLabel
              Left = 151
              Top = 62
              Width = 117
              Height = 13
              Caption = 'T'#233'rmino da Vig'#234'ncia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_tx_cambio: TLabel
              Left = 8
              Top = 105
              Width = 92
              Height = 13
              Caption = 'Taxa de C'#226'mbio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_moeda2: TLabel
              Left = 8
              Top = 8
              Width = 39
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_dt_inicio_vig: TDBEdit
              Left = 8
              Top = 75
              Width = 104
              Height = 21
              DataField = 'DT_INICIO_VIGENCIA'
              DataSource = datm_moeda.ds_taxa_cambio
              TabOrder = 2
              OnChange = dbedt_dt_inicio_vigChange
              OnExit = dbedt_dt_inicio_vigExit
            end
            object dbedt_dt_termino_vig: TDBEdit
              Left = 152
              Top = 75
              Width = 104
              Height = 21
              DataField = 'DT_TERMINO_VIGENCIA'
              DataSource = datm_moeda.ds_taxa_cambio
              TabOrder = 3
              OnChange = dbedt_dt_inicio_vigChange
              OnExit = dbedt_dt_termino_vigExit
            end
            object dbedt_tx_cambio: TDBEdit
              Left = 8
              Top = 118
              Width = 104
              Height = 21
              DataField = 'TX_CAMBIO'
              DataSource = datm_moeda.ds_taxa_cambio
              TabOrder = 4
              OnChange = dbedt_dt_inicio_vigChange
              OnExit = dbedt_tx_cambioExit
            end
            object dbedt_nm_moeda3: TDBEdit
              Left = 46
              Top = 23
              Width = 289
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookMoeda'
              DataSource = datm_moeda.ds_taxa_cambio
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_cd_moeda3: TDBEdit
              Left = 8
              Top = 23
              Width = 39
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_MOEDA'
              DataSource = datm_moeda.ds_taxa_cambio
              ReadOnly = True
              TabOrder = 0
            end
          end
        end
      end
    end
    object ts_taxa_frete: TTabSheet
      Caption = 'Taxas de Frete'
      ImageIndex = 3
      object pgctrlTaxaFrete: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 427
        ActivePage = tsDadosBasicosFrete
        Align = alClient
        HotTrack = True
        TabOrder = 0
        object tsListaFrete: TTabSheet
          Caption = '    Lista    '
          object lbl1: TLabel
            Left = 8
            Top = 8
            Width = 39
            Height = 13
            Caption = 'Moeda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbgrd1: TDBGrid
            Left = 0
            Top = 54
            Width = 726
            Height = 345
            Align = alBottom
            DataSource = datm_moeda.dsTaxaFrete
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'DT_INICIO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'In'#237'cio Vig'#234'ncia'
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
                FieldName = 'VL_COMPRA'
                Title.Caption = 'Taxa Oficial'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 122
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_TAXA_UTIL'
                Title.Caption = '% Prote'#231#227'o Cambial'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 121
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_TAXA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Taxa Indai'#225
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 116
                Visible = True
              end>
          end
          object dbedt2: TDBEdit
            Left = 46
            Top = 23
            Width = 289
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NM_MOEDA'
            DataSource = datm_moeda.ds_moeda
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt1: TDBEdit
            Left = 8
            Top = 23
            Width = 39
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_MOEDA'
            DataSource = datm_moeda.ds_moeda
            ReadOnly = True
            TabOrder = 0
          end
        end
        object tsDadosBasicosFrete: TTabSheet
          Caption = '   Dados B'#225'sicos   '
          object pnl1: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 399
            Align = alClient
            BevelOuter = bvLowered
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object shp1: TShape
              Left = 16
              Top = 120
              Width = 416
              Height = 65
              Brush.Style = bsClear
              Pen.Color = clGray
            end
            object Shape1: TShape
              Left = 296
              Top = 126
              Width = 130
              Height = 53
              Brush.Color = clInfoBk
              Pen.Color = clGray
            end
            object lbl2: TLabel
              Left = 16
              Top = 69
              Width = 50
              Height = 13
              Caption = 'Vig'#234'ncia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl3: TLabel
              Left = 159
              Top = 69
              Width = 117
              Height = 13
              Caption = 'T'#233'rmino da Vig'#234'ncia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object lbl4: TLabel
              Left = 307
              Top = 135
              Width = 68
              Height = 13
              Caption = 'Taxa Indai'#225
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbl5: TLabel
              Left = 16
              Top = 16
              Width = 39
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 34
              Top = 135
              Width = 69
              Height = 13
              Caption = 'Taxa Oficial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label16: TLabel
              Left = 170
              Top = 135
              Width = 113
              Height = 13
              Caption = '% Prote'#231#227'o Cambial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt3: TDBEdit
              Left = 16
              Top = 83
              Width = 104
              Height = 21
              DataField = 'DT_INICIO'
              DataSource = datm_moeda.dsTaxaFrete
              TabOrder = 2
              OnChange = dbedt3Change
              OnEnter = dbedt3Enter
              OnExit = dbedt3Exit
            end
            object dbedt4: TDBEdit
              Left = 160
              Top = 83
              Width = 104
              Height = 21
              DataField = 'DT_FIM'
              DataSource = datm_moeda.dsTaxaFrete
              TabOrder = 3
              Visible = False
              OnChange = dbedt3Change
              OnExit = dbedt4Exit
            end
            object dbedt5: TDBEdit
              Left = 308
              Top = 149
              Width = 107
              Height = 21
              DataField = 'VL_TAXA'
              DataSource = datm_moeda.dsTaxaFrete
              TabOrder = 6
              OnChange = dbedt3Change
              OnExit = dbedt_tx_cambioExit
            end
            object dbedt7: TDBEdit
              Left = 54
              Top = 30
              Width = 289
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_MOEDA'
              DataSource = datm_moeda.ds_moeda
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt6: TDBEdit
              Left = 16
              Top = 30
              Width = 39
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_MOEDA'
              DataSource = datm_moeda.ds_moeda
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit1: TDBEdit
              Left = 34
              Top = 149
              Width = 104
              Height = 21
              DataField = 'VL_COMPRA'
              DataSource = datm_moeda.dsTaxaFrete
              TabOrder = 4
              OnChange = dbedt3Change
              OnExit = DBEdit2Exit
            end
            object DBEdit2: TDBEdit
              Left = 170
              Top = 149
              Width = 104
              Height = 21
              DataField = 'VL_TAXA_UTIL'
              DataSource = datm_moeda.dsTaxaFrete
              TabOrder = 5
              OnChange = dbedt3Change
              OnExit = DBEdit2Exit
            end
          end
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 4
      Width = 38
      Height = 41
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
      Height = 41
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
      Left = 397
      Top = 4
      Width = 38
      Height = 41
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
      Left = 42
      Top = 4
      Width = 38
      Height = 41
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
      Left = 80
      Top = 4
      Width = 38
      Height = 41
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
    object dbnvg: TDBNavigator
      Left = 260
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_moeda.ds_moeda
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object pnl_pesquisa: TPanel
      Left = 438
      Top = 2
      Width = 302
      Height = 45
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 6
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
        Left = 142
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
        Left = 7
        Top = 18
        Width = 129
        Height = 21
        TabStop = False
        TabOrder = 0
        OnChange = edt_chaveChange
        OnKeyDown = edt_chaveKeyDown
      end
      object cb_ordem: TComboBox
        Left = 143
        Top = 18
        Width = 153
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
    Left = 627
    Top = 260
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
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
