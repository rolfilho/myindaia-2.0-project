object frm_grupo_item: Tfrm_grupo_item
  Left = 150
  Top = 150
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Cadastro de Grupo de Itens'
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
  object pgctrl_grupo_item: TPageControl
    Left = 0
    Top = 47
    Width = 742
    Height = 457
    ActivePage = ts_lista
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_grupo_itemChange
    OnChanging = pgctrl_grupo_itemChanging
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object dbgrd_grupo_item: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        DataSource = datm_grupo_item.ds_grupo_item
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrd_grupo_itemDblClick
        OnKeyPress = dbgrd_grupo_itemKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_GRUPO_ITEM'
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
            FieldName = 'NM_GRUPO_ITEM'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 523
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object pnl_entrada_de_dados: TPanel
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
        object lbl_descricao: TLabel
          Left = 85
          Top = 22
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
        object lbl_codigo: TLabel
          Left = 21
          Top = 22
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
        object lbl_acesso: TLabel
          Left = 21
          Top = 72
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
          Left = 75
          Top = 72
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
          Left = 125
          Top = 72
          Width = 128
          Height = 13
          Caption = 'Conta Cont'#225'bil Cr'#233'dito'
          FocusControl = dbedt_cd_ct_contabil_cre
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ct_contabil_cre: TSpeedButton
          Left = 476
          Top = 84
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
          OnClick = btn_co_ct_contabil_creClick
        end
        object Label34: TLabel
          Left = 21
          Top = 121
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
        object Label35: TLabel
          Left = 75
          Top = 121
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
        object Label33: TLabel
          Left = 125
          Top = 121
          Width = 125
          Height = 13
          Caption = 'Conta Cont'#225'bil D'#233'bito'
          FocusControl = dbedt_cd_ct_contabil_deb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ct_contabil_deb: TSpeedButton
          Left = 478
          Top = 134
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
          OnClick = btn_co_ct_contabil_debClick
        end
        object Label3: TLabel
          Left = 21
          Top = 172
          Width = 108
          Height = 13
          Caption = 'Descri'#231#227'o Cont'#225'bil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nm_grupo_item: TDBEdit
          Left = 85
          Top = 37
          Width = 415
          Height = 21
          DataField = 'NM_GRUPO_ITEM'
          DataSource = datm_grupo_item.ds_grupo_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 1
          OnChange = dbedt_nm_grupo_itemChange
        end
        object dbedt_cd_grupo_item: TDBEdit
          Left = 21
          Top = 37
          Width = 38
          Height = 21
          DataField = 'CD_GRUPO_ITEM'
          DataSource = datm_grupo_item.ds_grupo_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_nm_grupo_itemChange
          OnExit = dbedt_cd_grupo_itemExit
        end
        object dbedt_cd_acesso_cre: TDBEdit
          Left = 21
          Top = 85
          Width = 36
          Height = 21
          DataField = 'CD_ACESSO_CRE'
          DataSource = datm_grupo_item.ds_grupo_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_nm_grupo_itemChange
          OnExit = dbedt_cd_acesso_creExit
        end
        object dbedt_cd_aux_cre: TDBEdit
          Left = 75
          Top = 86
          Width = 38
          Height = 21
          DataField = 'CD_AUX_CRE'
          DataSource = datm_grupo_item.ds_grupo_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = dbedt_nm_grupo_itemChange
          OnExit = dbedt_cd_aux_creExit
        end
        object dbedt_cd_ct_contabil_cre: TDBEdit
          Left = 125
          Top = 85
          Width = 83
          Height = 21
          DataField = 'CD_CT_CONTABIL_CRE'
          DataSource = datm_grupo_item.ds_grupo_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 12
          ParentFont = False
          TabOrder = 4
          OnChange = btn_co_ct_contabil_creClick
          OnExit = dbedt_cd_ct_contabil_creExit
          OnKeyDown = dbedt_cd_ct_contabil_creKeyDown
        end
        object edt_nm_ct_contabil_cre: TEdit
          Left = 210
          Top = 85
          Width = 263
          Height = 21
          TabStop = False
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          OnChange = dbedt_nm_grupo_itemChange
        end
        object dbedt_cd_acesso_deb: TDBEdit
          Left = 21
          Top = 135
          Width = 36
          Height = 21
          DataField = 'CD_ACESSO_DEB'
          DataSource = datm_grupo_item.ds_grupo_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnChange = dbedt_nm_grupo_itemChange
          OnExit = dbedt_cd_acesso_debExit
        end
        object dbedt_cd_aux_deb: TDBEdit
          Left = 75
          Top = 135
          Width = 38
          Height = 21
          DataField = 'CD_AUX_DEB'
          DataSource = datm_grupo_item.ds_grupo_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 7
          OnChange = dbedt_nm_grupo_itemChange
          OnExit = dbedt_cd_aux_debExit
        end
        object dbedt_cd_ct_contabil_deb: TDBEdit
          Left = 125
          Top = 135
          Width = 83
          Height = 21
          DataField = 'CD_CT_CONTABIL_DEB'
          DataSource = datm_grupo_item.ds_grupo_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnChange = btn_co_ct_contabil_debClick
          OnExit = dbedt_cd_ct_contabil_debExit
          OnKeyDown = dbedt_cd_ct_contabil_creKeyDown
        end
        object edt_nm_ct_contabil_deb: TEdit
          Left = 210
          Top = 134
          Width = 263
          Height = 21
          TabStop = False
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
          OnChange = dbedt_nm_grupo_itemChange
        end
        object dbedt_nm_desc_contabil: TDBEdit
          Left = 21
          Top = 187
          Width = 415
          Height = 21
          DataField = 'NM_DESC_CONTABIL'
          DataSource = datm_grupo_item.ds_grupo_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          OnChange = dbedt_nm_grupo_itemChange
        end
      end
    end
    object ts_grupo_item_item: TTabSheet
      Caption = 'Grupo X Itens'
      object pgctrl_grupo_item_item: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        ActivePage = ts_lista2
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_grupo_itemChange
        OnChanging = pgctrl_grupo_item_itemChanging
        object ts_lista2: TTabSheet
          Caption = '    Lista    '
          object lbl_grupo_item: TLabel
            Left = 3
            Top = 8
            Width = 81
            Height = 13
            Caption = 'Grupo de Item'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbgrd_grupo_item_item: TDBGrid
            Left = 1
            Top = 53
            Width = 719
            Height = 343
            DataSource = datm_grupo_item.ds_grupo_item_item
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
                FieldName = 'CD_ITEM'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookItem'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 397
                Visible = True
              end>
          end
          object dbedt_cd_grupo_item2: TDBEdit
            Left = 3
            Top = 24
            Width = 52
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_GRUPO_ITEM'
            DataSource = datm_grupo_item.ds_grupo_item
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_nm_grupo_item2: TDBEdit
            Left = 61
            Top = 24
            Width = 415
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NM_GRUPO_ITEM'
            DataSource = datm_grupo_item.ds_grupo_item
            MaxLength = 60
            ReadOnly = True
            TabOrder = 2
          end
        end
        object ts_dados_basicos2: TTabSheet
          Caption = '   Dados B'#225'sicos   '
          object pnl_grupo_item_item: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 401
            Align = alClient
            BevelOuter = bvLowered
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object lbl_item: TLabel
              Left = 12
              Top = 66
              Width = 25
              Height = 13
              Caption = 'Item'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_item: TSpeedButton
              Left = 345
              Top = 81
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
              OnClick = btn_co_itemClick
            end
            object lbl_grupo_item2: TLabel
              Left = 12
              Top = 15
              Width = 81
              Height = 13
              Caption = 'Grupo de Item'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_cd_item: TDBEdit
              Left = 12
              Top = 81
              Width = 33
              Height = 21
              DataField = 'CD_ITEM'
              DataSource = datm_grupo_item.ds_grupo_item_item
              TabOrder = 0
              OnChange = dbedt_cd_itemChange
              OnExit = dbedt_cd_itemExit
              OnKeyDown = dbedt_cd_classifKeyDown
            end
            object dbedt_nm_item: TDBEdit
              Left = 50
              Top = 81
              Width = 289
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookItem'
              DataSource = datm_grupo_item.ds_grupo_item_item
              MaxLength = 20
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_cd_grupo_item3: TDBEdit
              Left = 12
              Top = 31
              Width = 52
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_GRUPO_ITEM'
              DataSource = datm_grupo_item.ds_grupo_item
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_nm_grupo_item3: TDBEdit
              Left = 68
              Top = 31
              Width = 415
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_GRUPO_ITEM'
              DataSource = datm_grupo_item.ds_grupo_item
              MaxLength = 60
              ReadOnly = True
              TabOrder = 3
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
    Height = 47
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
      Left = 393
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
      Left = 270
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_inst_negoc.ds_inst_negoc
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
      Left = 431
      Top = 2
      Width = 309
      Height = 43
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
    Left = 553
    Top = 372
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
