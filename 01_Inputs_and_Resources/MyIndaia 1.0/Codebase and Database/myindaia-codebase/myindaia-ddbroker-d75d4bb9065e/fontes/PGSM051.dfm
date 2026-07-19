object frm_transp_rod: Tfrm_transp_rod
  Left = 359
  Top = 109
  Width = 750
  Height = 550
  Caption = 'Cadastro de Transportadores Rodovi'#225'rio'
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
  object pgctrl_transp_rod: TPageControl
    Left = 0
    Top = 47
    Width = 742
    Height = 457
    ActivePage = ts_dados_basicos
    Align = alClient
    HotTrack = True
    MultiLine = True
    TabOrder = 0
    OnChange = pgctrl_transp_rodChange
    OnChanging = pgctrl_transp_rodChanging
    object ts_lista: TTabSheet
      Caption = ' &Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        DataSource = datm_transp_rod.ds_transp_rod
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
            FieldName = 'CD_TRANSP_ROD'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_TRANSP_ROD'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 363
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_TRANSP_ROD'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookTranspAtivo'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 44
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados B'#225'sicos'
      object TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 429
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
        object lbl_cd_transp_rod: TLabel
          Left = 21
          Top = 20
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
        object lbl_nm_transp_rod: TLabel
          Left = 72
          Top = 20
          Width = 33
          Height = 13
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblAtivo: TLabel
          Left = 432
          Top = 20
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
        object lbl_ap_transp_rod: TLabel
          Left = 21
          Top = 72
          Width = 92
          Height = 13
          Caption = 'Nome Resumido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cnpj_transp_rod: TLabel
          Left = 173
          Top = 72
          Width = 52
          Height = 13
          Caption = 'C.N.P.J. '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 21
          Top = 280
          Width = 233
          Height = 13
          Caption = 'Endere'#231'o de correio eletr'#244'nico  ( e-mail )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 21
          Top = 128
          Width = 55
          Height = 13
          Caption = 'Endere'#231'o'
        end
        object Label6: TLabel
          Left = 21
          Top = 184
          Width = 40
          Height = 13
          Caption = 'Cidade'
        end
        object Label7: TLabel
          Left = 384
          Top = 184
          Width = 17
          Height = 13
          Caption = 'UF'
        end
        object Label9: TLabel
          Left = 452
          Top = 72
          Width = 106
          Height = 13
          Caption = 'Inscri'#231#227'o Estadual'
          FocusControl = dbedt_ie_transp_rod
        end
        object Label10: TLabel
          Left = 317
          Top = 72
          Width = 40
          Height = 13
          Caption = 'C.P.F. '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_fabr_pais_origem: TLabel
          Left = 21
          Top = 233
          Width = 27
          Height = 13
          Caption = 'Pa'#237's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_pais: TSpeedButton
          Left = 343
          Top = 250
          Width = 25
          Height = 21
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
        object dbedt_nm_transp_rod: TDBEdit
          Left = 72
          Top = 38
          Width = 353
          Height = 21
          DataField = 'NM_TRANSP_ROD'
          DataSource = datm_transp_rod.ds_transp_rod
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_nm_transp_rodChange
          OnExit = dbedt_nm_transp_rodExit
        end
        object dblkpcbox_ativo: TDBLookupComboBox
          Left = 432
          Top = 38
          Width = 50
          Height = 21
          DataField = 'IN_ATIVO'
          DataSource = datm_transp_rod.ds_transp_rod
          DropDownRows = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_transp_rod.ds_yesno
          ParentFont = False
          TabOrder = 1
          OnClick = dbedt_nm_transp_rodChange
        end
        object dbedt_ap_transp_rod: TDBEdit
          Left = 21
          Top = 90
          Width = 142
          Height = 21
          DataField = 'AP_TRANSP_ROD'
          DataSource = datm_transp_rod.ds_transp_rod
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_nm_transp_rodChange
          OnExit = dbedt_nm_transp_rodExit
        end
        object dbedt_cd_transp_rod: TDBEdit
          Left = 21
          Top = 38
          Width = 42
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_TRANSP_ROD'
          DataSource = datm_transp_rod.ds_transp_rod
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_cnpj_transp_rod: TDBEdit
          Left = 173
          Top = 90
          Width = 142
          Height = 21
          DataField = 'CNPJ_TRANSP_ROD'
          DataSource = datm_transp_rod.ds_transp_rod
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = dbedt_nm_transp_rodChange
          OnExit = dbedt_nm_transp_rodExit
        end
        object dbedt_end_transp_rod: TDBEdit
          Left = 21
          Top = 146
          Width = 404
          Height = 21
          DataField = 'END_TRANSP_ROD'
          DataSource = datm_transp_rod.ds_transp_rod
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnChange = dbedt_nm_transp_rodChange
          OnExit = dbedt_nm_transp_rodExit
        end
        object dbedt_end_cidade: TDBEdit
          Left = 21
          Top = 202
          Width = 356
          Height = 21
          DataField = 'END_CIDADE'
          DataSource = datm_transp_rod.ds_transp_rod
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnChange = dbedt_nm_transp_rodChange
          OnExit = dbedt_nm_transp_rodExit
        end
        object dbedt_end_uf: TDBEdit
          Left = 384
          Top = 202
          Width = 40
          Height = 21
          CharCase = ecUpperCase
          DataField = 'END_UF'
          DataSource = datm_transp_rod.ds_transp_rod
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnChange = dbedt_nm_transp_rodChange
          OnExit = dbedt_nm_transp_rodExit
        end
        object dbedt_ie_transp_rod: TDBEdit
          Left = 452
          Top = 90
          Width = 124
          Height = 21
          DataField = 'IE_TRANSP_ROD'
          DataSource = datm_transp_rod.ds_transp_rod
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnChange = dbedt_nm_transp_rodChange
          OnExit = dbedt_nm_transp_rodExit
        end
        object dbedt_cpf_transp_rod: TDBEdit
          Left = 317
          Top = 90
          Width = 130
          Height = 21
          DataField = 'CPF_TRANSP_ROD'
          DataSource = datm_transp_rod.ds_transp_rod
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = dbedt_nm_transp_rodChange
          OnExit = dbedt_nm_transp_rodExit
        end
        object dbedt_cd_pais: TDBEdit
          Left = 21
          Top = 250
          Width = 37
          Height = 21
          DataField = 'CD_PAIS_TRANSP'
          DataSource = datm_transp_rod.ds_transp_rod
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 9
          OnChange = dbedt_nm_transp_rodChange
          OnExit = dbedt_cd_paisExit
          OnKeyDown = dbedt_cd_paisKeyDown
        end
        object dbedt_nm_pais: TDBEdit
          Left = 62
          Top = 250
          Width = 278
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookPais'
          DataSource = datm_transp_rod.ds_transp_rod
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object dbmmoNM_EMAIL: TDBMemo
          Left = 19
          Top = 299
          Width = 558
          Height = 23
          DataField = 'NM_EMAIL'
          DataSource = datm_transp_rod.ds_transp_rod
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2000
          ParentFont = False
          TabOrder = 12
          WordWrap = False
          OnChange = dbedt_nm_transp_rodChange
        end
      end
    end
    object ts_taxa: TTabSheet
      Caption = '&Taxas'
      object pgctrl_taxa: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        ActivePage = ts_dados_basicos2
        Align = alClient
        TabOrder = 0
        object ts_lista2: TTabSheet
          Caption = ' L&ista'
          object lbl_transp_rod: TLabel
            Left = 8
            Top = 8
            Width = 145
            Height = 13
            Caption = 'Transportador Rodovi'#225'rio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbg_cad_transp_rod: TDBGrid
            Left = 1
            Top = 56
            Width = 718
            Height = 341
            DataSource = datm_transp_rod.ds_taxa
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = dbg_cad_transp_rodDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_TAXA'
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
                FieldName = 'NM_TAXA'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 257
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookTaxaAtivo'
                Title.Alignment = taCenter
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end>
          end
          object dbedt_cd_transp_rod2: TDBEdit
            Left = 8
            Top = 26
            Width = 41
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_TRANSP_ROD'
            DataSource = datm_transp_rod.ds_transp_rod
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_nm_transp_rod2: TDBEdit
            Left = 53
            Top = 26
            Width = 404
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NM_TRANSP_ROD'
            DataSource = datm_transp_rod.ds_transp_rod
            ReadOnly = True
            TabOrder = 2
          end
        end
        object ts_dados_basicos2: TTabSheet
          Caption = 'D&ados B'#225'sicos'
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 401
            Align = alClient
            BevelOuter = bvLowered
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object lbl_transp_rod2: TLabel
              Left = 20
              Top = 6
              Width = 145
              Height = 13
              Caption = 'Transportador Rodovi'#225'rio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_cd_taxa: TLabel
              Left = 20
              Top = 50
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
            object lbl_nm_taxa: TLabel
              Left = 66
              Top = 50
              Width = 33
              Height = 13
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 411
              Top = 50
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
            object lbl_me: TLabel
              Left = 20
              Top = 96
              Width = 165
              Height = 13
              Caption = 'Valores p/ Margem Esquerda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_md: TLabel
              Left = 308
              Top = 96
              Width = 149
              Height = 13
              Caption = 'Valores p/ Margem Direita'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_cd_transp_rod3: TDBEdit
              Left = 20
              Top = 24
              Width = 33
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_TRANSP_ROD'
              DataSource = datm_transp_rod.ds_taxa
              ReadOnly = True
              TabOrder = 4
            end
            object dbedt_nm_transp_rod3: TDBEdit
              Left = 57
              Top = 24
              Width = 345
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookTranspRod'
              DataSource = datm_transp_rod.ds_taxa
              ReadOnly = True
              TabOrder = 5
            end
            object dbedt_cd_taxa: TDBEdit
              Left = 20
              Top = 68
              Width = 33
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_TAXA'
              DataSource = datm_transp_rod.ds_taxa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 4
              ParentFont = False
              TabOrder = 6
            end
            object dbedt_nm_taxa: TDBEdit
              Left = 57
              Top = 68
              Width = 345
              Height = 21
              DataField = 'NM_TAXA'
              DataSource = datm_transp_rod.ds_taxa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = dbedt_nm_taxaChange
              OnExit = dbedt_nm_transp_rodExit
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 411
              Top = 68
              Width = 50
              Height = 21
              DataField = 'IN_ATIVO'
              DataSource = datm_transp_rod.ds_taxa
              DropDownRows = 3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_transp_rod.ds_yesno
              ParentFont = False
              TabOrder = 1
              OnClick = dbedt_nm_taxaChange
            end
            object Panel2: TPanel
              Left = 20
              Top = 112
              Width = 281
              Height = 188
              BevelInner = bvLowered
              BevelOuter = bvNone
              TabOrder = 2
              object lbl_vl_cntr_20_me: TLabel
                Left = 21
                Top = 7
                Width = 76
                Height = 13
                Caption = 'Container 20'#39
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbl_vl_cntr_40_me: TLabel
                Left = 21
                Top = 66
                Width = 76
                Height = 13
                Caption = 'Container 40'#39
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbl_vl_cntr_20_me_RORO: TLabel
                Left = 157
                Top = 7
                Width = 80
                Height = 26
                Caption = 'Container 20'#39' c/ RO-RO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object lbl_vl_cntr_40_me_RORO: TLabel
                Left = 157
                Top = 66
                Width = 80
                Height = 26
                Caption = 'Container 40'#39' c/ RO-RO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object lbl_vl_c_solta_me: TLabel
                Left = 21
                Top = 125
                Width = 67
                Height = 13
                Caption = 'Carga Solta'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object lbl_vl_c_solta_me_RORO: TLabel
                Left = 157
                Top = 125
                Width = 71
                Height = 26
                Caption = 'Carga Solta c/ RO-RO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object dbedt_vl_cntr_20_me: TDBEdit
                Left = 21
                Top = 35
                Width = 73
                Height = 21
                DataField = 'VL_CNTR_20_ME'
                DataSource = datm_transp_rod.ds_taxa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 15
                ParentFont = False
                TabOrder = 0
                OnChange = dbedt_nm_taxaChange
              end
              object dbedt_vl_cntr_40_me: TDBEdit
                Left = 21
                Top = 96
                Width = 73
                Height = 21
                DataField = 'VL_CNTR_40_ME'
                DataSource = datm_transp_rod.ds_taxa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 15
                ParentFont = False
                TabOrder = 2
                OnChange = dbedt_nm_taxaChange
              end
              object dbedt_vl_cntr_20_me_RORO: TDBEdit
                Left = 157
                Top = 35
                Width = 73
                Height = 21
                DataField = 'VL_CNTR_20_ME_RORO'
                DataSource = datm_transp_rod.ds_taxa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 15
                ParentFont = False
                TabOrder = 1
                OnChange = dbedt_nm_taxaChange
              end
              object dbedt_vl_cntr_40_me_RORO: TDBEdit
                Left = 157
                Top = 96
                Width = 73
                Height = 21
                DataField = 'VL_CNTR_40_ME_RORO'
                DataSource = datm_transp_rod.ds_taxa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 15
                ParentFont = False
                TabOrder = 3
                OnChange = dbedt_nm_taxaChange
              end
              object dbedt_vl_c_solta_me: TDBEdit
                Left = 21
                Top = 155
                Width = 73
                Height = 21
                DataField = 'VL_C_SOLTA_ME'
                DataSource = datm_transp_rod.ds_taxa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 15
                ParentFont = False
                TabOrder = 4
                OnChange = dbedt_nm_taxaChange
              end
              object dbedt_vl_c_solta_me_RORO: TDBEdit
                Left = 157
                Top = 155
                Width = 73
                Height = 21
                DataField = 'VL_C_SOLTA_ME_RORO'
                DataSource = datm_transp_rod.ds_taxa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 15
                ParentFont = False
                TabOrder = 5
                OnChange = dbedt_nm_taxaChange
              end
            end
            object Panel3: TPanel
              Left = 308
              Top = 112
              Width = 281
              Height = 188
              BevelInner = bvLowered
              BevelOuter = bvNone
              TabOrder = 3
              object lbl_vl_cntr_20_md: TLabel
                Left = 33
                Top = 7
                Width = 76
                Height = 13
                Caption = 'Container 20'#39
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbl_vl_cntr_40_md: TLabel
                Left = 33
                Top = 67
                Width = 76
                Height = 13
                Caption = 'Container 40'#39
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbl_vl_cntr_20_md_RORO: TLabel
                Left = 165
                Top = 7
                Width = 80
                Height = 26
                Caption = 'Container 20'#39' c/ RO-RO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object lbl_vl_cntr_40_md_RORO: TLabel
                Left = 165
                Top = 67
                Width = 80
                Height = 26
                Caption = 'Container 40'#39' c/ RO-RO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object lbl_vl_c_solta_md: TLabel
                Left = 33
                Top = 123
                Width = 67
                Height = 13
                Caption = 'Carga Solta'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object lbl_vl_c_solta_md_RORO: TLabel
                Left = 165
                Top = 123
                Width = 71
                Height = 26
                Caption = 'Carga Solta c/ RO-RO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object dbedt_vl_cntr_20_md: TDBEdit
                Left = 33
                Top = 35
                Width = 73
                Height = 21
                DataField = 'VL_CNTR_20_MD'
                DataSource = datm_transp_rod.ds_taxa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 15
                ParentFont = False
                TabOrder = 0
                OnChange = dbedt_nm_taxaChange
              end
              object dbedt_vl_cntr_40_md: TDBEdit
                Left = 33
                Top = 95
                Width = 73
                Height = 21
                DataField = 'VL_CNTR_40_MD'
                DataSource = datm_transp_rod.ds_taxa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 15
                ParentFont = False
                TabOrder = 2
                OnChange = dbedt_nm_taxaChange
              end
              object dbedt_vl_cntr_20_md_RORO: TDBEdit
                Left = 165
                Top = 35
                Width = 73
                Height = 21
                DataField = 'VL_CNTR_20_MD_RORO'
                DataSource = datm_transp_rod.ds_taxa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 15
                ParentFont = False
                TabOrder = 1
                OnChange = dbedt_nm_taxaChange
              end
              object dbedt_vl_cntr_40_md_RORO: TDBEdit
                Left = 165
                Top = 95
                Width = 73
                Height = 21
                DataField = 'VL_CNTR_40_MD_RORO'
                DataSource = datm_transp_rod.ds_taxa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 15
                ParentFont = False
                TabOrder = 3
                OnChange = dbedt_nm_taxaChange
              end
              object dbedt_vl_c_solta_md_RORO: TDBEdit
                Left = 165
                Top = 155
                Width = 73
                Height = 21
                DataField = 'VL_C_SOLTA_MD_RORO'
                DataSource = datm_transp_rod.ds_taxa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 15
                ParentFont = False
                TabOrder = 5
                OnChange = dbedt_nm_taxaChange
              end
              object dbedt_vl_c_solta_md: TDBEdit
                Left = 33
                Top = 155
                Width = 73
                Height = 21
                DataField = 'VL_C_SOLTA_MD'
                DataSource = datm_transp_rod.ds_taxa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 15
                ParentFont = False
                TabOrder = 4
                OnChange = dbedt_nm_taxaChange
              end
            end
          end
        end
      end
    end
    object ts_dner: TTabSheet
      Caption = 'D&NER'
      object Label8: TLabel
        Left = 8
        Top = 8
        Width = 145
        Height = 13
        Caption = 'Transportador Rodovi'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_cd_transp_rod1: TDBEdit
        Left = 8
        Top = 26
        Width = 42
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_TRANSP_ROD'
        DataSource = datm_transp_rod.ds_transp_rod
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object cd_nm_transp_rod1: TDBEdit
        Left = 55
        Top = 26
        Width = 353
        Height = 21
        Color = clMenu
        DataField = 'NM_TRANSP_ROD'
        DataSource = datm_transp_rod.ds_transp_rod
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnChange = dbedt_nm_transp_rodChange
        OnExit = dbedt_nm_transp_rodExit
      end
      object DBGrid1: TDBGrid
        Left = 1
        Top = 53
        Width = 720
        Height = 233
        DataSource = datm_transp_rod.ds_dner
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
            Expanded = False
            FieldName = 'CD_TRANSP_ROD_DNER'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 200
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 1
        Top = 296
        Width = 720
        Height = 56
        BevelOuter = bvLowered
        TabOrder = 3
        object Label11: TLabel
          Left = 8
          Top = 10
          Width = 36
          Height = 13
          Caption = 'DNER'
          FocusControl = dbedt_transp_rod_dner
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_transp_rod_dner: TDBEdit
          Left = 8
          Top = 25
          Width = 70
          Height = 21
          DataField = 'CD_TRANSP_ROD_DNER'
          DataSource = datm_transp_rod.ds_dner
          TabOrder = 0
          OnChange = dbedt_transp_rod_dnerChange
          OnExit = dbedt_transp_rod_dnerExit
        end
      end
    end
    object ts_contatos: TTabSheet
      Caption = 'Contatos'
      ImageIndex = 4
      object Bevel1: TBevel
        Left = 8
        Top = 237
        Width = 715
        Height = 182
      end
      object Label12: TLabel
        Left = 17
        Top = 247
        Width = 35
        Height = 13
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_grupo: TSpeedButton
        Left = 467
        Top = 261
        Width = 25
        Height = 21
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
      object Label13: TLabel
        Left = 17
        Top = 286
        Width = 105
        Height = 13
        Caption = 'Cliente Espec'#237'fico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_empresa: TSpeedButton
        Left = 467
        Top = 300
        Width = 25
        Height = 21
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
        OnClick = btn_co_empresaClick
      end
      object Label14: TLabel
        Left = 17
        Top = 371
        Width = 222
        Height = 13
        Caption = 'Relacione os emails separados por ( ; )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 18
        Top = 327
        Width = 102
        Height = 13
        Caption = 'Via de Transporte'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_cd_via_transp: TSpeedButton
        Left = 468
        Top = 341
        Width = 25
        Height = 21
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
        OnClick = btn_cd_via_transpClick
      end
      object DBText1: TDBText
        Left = 0
        Top = 0
        Width = 734
        Height = 16
        Align = alTop
        Color = clSilver
        DataField = 'NM_TRANSP_ROD'
        DataSource = datm_transp_rod.ds_transp_rod
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label16: TLabel
        Left = 122
        Top = 286
        Width = 46
        Height = 13
        Caption = '(opcional)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbedt_cd_grupo: TDBEdit
        Left = 17
        Top = 261
        Width = 37
        Height = 21
        DataField = 'CD_GRUPO'
        DataSource = datm_transp_rod.ds_transp_rod_contato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 1
        OnChange = ContatoChange
        OnExit = dbedt_cd_grupoExit
      end
      object dbedt_nm_grupo: TDBEdit
        Left = 58
        Top = 261
        Width = 407
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'lookGrupo'
        DataSource = datm_transp_rod.ds_transp_rod_contato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object dbedt_cd_empresa: TDBEdit
        Left = 17
        Top = 300
        Width = 37
        Height = 21
        DataField = 'CD_EMPRESA'
        DataSource = datm_transp_rod.ds_transp_rod_contato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnChange = ContatoChange
        OnExit = dbedt_cd_empresaExit
      end
      object dbedt_nm_empresa: TDBEdit
        Left = 58
        Top = 300
        Width = 407
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'lookEmpresa'
        DataSource = datm_transp_rod.ds_transp_rod_contato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object dbg_contato: TDBGrid
        Left = 7
        Top = 28
        Width = 714
        Height = 200
        DataSource = datm_transp_rod.ds_transp_rod_contato
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
            Expanded = False
            FieldName = 'NM_EMAIL'
            Width = 683
            Visible = True
          end>
      end
      object dbedt_cd_via_transp: TDBEdit
        Left = 18
        Top = 341
        Width = 37
        Height = 21
        DataField = 'CD_VIA_TRANSP'
        DataSource = datm_transp_rod.ds_transp_rod_contato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnChange = ContatoChange
        OnExit = dbedt_cd_via_transpExit
      end
      object dbedt_nm_via_transp: TDBEdit
        Left = 59
        Top = 341
        Width = 407
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'lookVIA_TRANSPORTE'
        DataSource = datm_transp_rod.ds_transp_rod_contato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_email: TDBMemo
        Left = 18
        Top = 384
        Width = 696
        Height = 21
        Ctl3D = False
        DataField = 'NM_EMAIL'
        DataSource = datm_transp_rod.ds_transp_rod_contato
        ParentCtl3D = False
        TabOrder = 7
        WordWrap = False
        OnChange = ContatoChange
        OnExit = dbedt_nm_transp_rodExit
      end
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
    object btn_incluir: TSpeedButton
      Left = 2
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
      Left = 116
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
      Left = 391
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
      Left = 40
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
      Left = 78
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
      Left = 220
      Top = 12
      Width = 108
      Height = 25
      DataSource = datm_transp_rod.ds_transp_rod
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
      BeforeAction = dbnvgBeforeAction
    end
    object pnl_pesquisa: TPanel
      Left = 431
      Top = 2
      Width = 309
      Height = 43
      Align = alRight
      Alignment = taLeftJustify
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
    Left = 347
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
      OnClick = btn_salvarClick
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
