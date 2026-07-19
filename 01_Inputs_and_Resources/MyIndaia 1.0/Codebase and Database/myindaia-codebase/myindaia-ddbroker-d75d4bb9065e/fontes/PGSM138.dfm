object frm_mod_follow_up: Tfrm_mod_follow_up
  Left = 195
  Top = 131
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Tabela de Modelos de Follow Up'
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
  object pgctrl_mod_follow_up: TPageControl
    Left = 0
    Top = 47
    Width = 742
    Height = 457
    ActivePage = ts_lista
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_mod_follow_upChange
    OnChanging = pgctrl_mod_follow_upChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        DataSource = datm_mod_follow_up.ds_mod_follow_up
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
            FieldName = 'CD_FOLLOW_UP'
            Title.Caption = 'C'#243'digo'
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
            FieldName = 'NM_FOLLOW_UP'
            Title.Caption = 'Descri'#231#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 501
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
        object lbl_codigo: TLabel
          Left = 24
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
        object lbl_nome: TLabel
          Left = 67
          Top = 24
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
          Left = 416
          Top = 24
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
          Left = 24
          Top = 80
          Width = 71
          Height = 13
          Caption = 'Embarca'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 24
          Top = 136
          Width = 127
          Height = 13
          Caption = 'Armaz'#233'm de Descarga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 232
          Top = 80
          Width = 64
          Height = 13
          Caption = 'Mercadoria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 232
          Top = 136
          Width = 79
          Height = 13
          Caption = 'N'#250'mero da DI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 424
          Top = 80
          Width = 75
          Height = 13
          Caption = 'Observa'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_follow_up: TDBEdit
          Left = 24
          Top = 40
          Width = 41
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_FOLLOW_UP'
          DataSource = datm_mod_follow_up.ds_mod_follow_up
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 0
        end
        object dbedt_descricao: TDBEdit
          Left = 67
          Top = 40
          Width = 345
          Height = 21
          DataField = 'NM_FOLLOW_UP'
          DataSource = datm_mod_follow_up.ds_mod_follow_up
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 1
        end
        object dblkpcbox_ativo: TDBLookupComboBox
          Left = 416
          Top = 40
          Width = 50
          Height = 21
          DataField = 'IN_ATIVO'
          DataSource = datm_mod_follow_up.ds_mod_follow_up
          DropDownRows = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_mod_follow_up.ds_yesno
          ParentFont = False
          TabOrder = 2
        end
        object dblkpcbox_embarcacao: TDBLookupComboBox
          Left = 24
          Top = 96
          Width = 50
          Height = 21
          DataField = 'IN_EMBARCACAO'
          DataSource = datm_mod_follow_up.ds_mod_follow_up
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_mod_follow_up.ds_yesno
          TabOrder = 3
        end
        object dblkpcbox_mercadoria: TDBLookupComboBox
          Left = 232
          Top = 96
          Width = 50
          Height = 21
          DataField = 'IN_MERCADORIA'
          DataSource = datm_mod_follow_up.ds_mod_follow_up
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_mod_follow_up.ds_yesno
          TabOrder = 5
        end
        object dblkpcbox_obs: TDBLookupComboBox
          Left = 424
          Top = 96
          Width = 50
          Height = 21
          DataField = 'IN_OBS'
          DataSource = datm_mod_follow_up.ds_mod_follow_up
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_mod_follow_up.ds_yesno
          TabOrder = 7
        end
        object dblkpcbox_arm_desc: TDBLookupComboBox
          Left = 24
          Top = 152
          Width = 50
          Height = 21
          DataField = 'IN_ARM_DESC'
          DataSource = datm_mod_follow_up.ds_mod_follow_up
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_mod_follow_up.ds_yesno
          TabOrder = 4
        end
        object dblkpcbox_nr_di: TDBLookupComboBox
          Left = 232
          Top = 152
          Width = 50
          Height = 21
          DataField = 'IN_NR_DI'
          DataSource = datm_mod_follow_up.ds_mod_follow_up
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_mod_follow_up.ds_yesno
          TabOrder = 6
        end
      end
    end
    object ts_mod_follow_up_evento: TTabSheet
      Caption = 'Eventos'
      object pgctrl_mod_follow_up_evento: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        ActivePage = ts_lista2
        Align = alClient
        HotTrack = True
        TabOrder = 0
        OnChange = pgctrl_mod_follow_upChange
        OnChanging = pgctrl_mod_follow_up_eventoChanging
        object ts_lista2: TTabSheet
          Caption = '    Lista    '
          OnEnter = ts_lista2Enter
          object Label3: TLabel
            Left = 7
            Top = 8
            Width = 120
            Height = 13
            Caption = 'Modelo de Follow Up'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 119
            Top = 128
            Width = 32
            Height = 13
            Caption = 'Label4'
          end
          object dbg_eventos: TDBGrid
            Left = 7
            Top = 56
            Width = 705
            Height = 321
            DataSource = datm_mod_follow_up.ds_mod_follow_up_evento
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
                FieldName = 'NR_ORDEM'
                Title.Caption = 'N'#186' Ordem'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 59
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_EVENTO'
                Title.Caption = 'Cod.Evento'
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
                FieldName = 'look_evento'
                Title.Caption = 'Descri'#231#227'o do Evento'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 439
                Visible = True
              end>
          end
          object dbedt_cd_follow_up2: TDBEdit
            Left = 7
            Top = 26
            Width = 33
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_FOLLOW_UP'
            DataSource = datm_mod_follow_up.ds_mod_follow_up
            MaxLength = 3
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_descricao2: TDBEdit
            Left = 45
            Top = 26
            Width = 289
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NM_FOLLOW_UP'
            DataSource = datm_mod_follow_up.ds_mod_follow_up
            ReadOnly = True
            TabOrder = 2
          end
        end
        object ts_dados_basicos2: TTabSheet
          Caption = '   Dados B'#225'sicos   '
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
            object lbl_evento: TLabel
              Left = 12
              Top = 73
              Width = 41
              Height = 13
              Caption = 'Evento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_ordem: TLabel
              Left = 384
              Top = 73
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
            object btn_co_evento: TSpeedButton
              Left = 345
              Top = 91
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
              OnClick = btn_co_eventoClick
            end
            object lbl_mod_follow_up: TLabel
              Left = 12
              Top = 20
              Width = 120
              Height = 13
              Caption = 'Modelo de Follow Up'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_ordem: TDBEdit
              Left = 384
              Top = 91
              Width = 33
              Height = 21
              DataField = 'NR_ORDEM'
              DataSource = datm_mod_follow_up.ds_mod_follow_up_evento
              TabOrder = 1
            end
            object dbedt_cd_evento: TDBEdit
              Left = 12
              Top = 91
              Width = 33
              Height = 21
              DataField = 'CD_EVENTO'
              DataSource = datm_mod_follow_up.ds_mod_follow_up_evento
              MaxLength = 3
              TabOrder = 0
              OnExit = dbedt_cd_eventoExit
              OnKeyDown = dbedt_cd_eventoKeyDown
            end
            object dbedt_nm_evento: TDBEdit
              Left = 50
              Top = 91
              Width = 289
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'look_evento'
              DataSource = datm_mod_follow_up.ds_mod_follow_up_evento
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_cd_follow_up3: TDBEdit
              Left = 12
              Top = 36
              Width = 33
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_FOLLOW_UP'
              DataSource = datm_mod_follow_up.ds_mod_follow_up
              MaxLength = 3
              ReadOnly = True
              TabOrder = 3
            end
            object dbedt_descricao3: TDBEdit
              Left = 50
              Top = 36
              Width = 289
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_FOLLOW_UP'
              DataSource = datm_mod_follow_up.ds_mod_follow_up
              ReadOnly = True
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
    object pnl_pesquisa: TPanel
      Left = 431
      Top = 2
      Width = 309
      Height = 43
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 0
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
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        TabStop = False
        OnClick = cb_ordemClick
      end
    end
    object dbnvg: TDBNavigator
      Left = 244
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_servico.ds_servico
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object menu_cadastro: TMainMenu
    Left = 563
    Top = 348
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
