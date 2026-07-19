object frm_pais: Tfrm_pais
  Left = 191
  Top = 58
  Width = 750
  Height = 550
  Caption = 'Tabela de Pa'#237'ses'
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
  object pgctrl_pais: TPageControl
    Left = 0
    Top = 47
    Width = 734
    Height = 445
    ActivePage = ts_lista
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_paisChange
    OnChanging = pgctrl_paisChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 726
        Height = 417
        Align = alClient
        DataSource = datm_pais.ds_pais
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
            FieldName = 'CD_PAIS'
            Title.Caption = 'C'#243'digo'
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
            FieldName = 'NM_PAIS'
            Title.Caption = 'Nome'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 532
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 417
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
        object lbl_cd_pais: TLabel
          Left = 13
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
        object lbl_nm_pais: TLabel
          Left = 58
          Top = 20
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
        object lbl_nm_port: TLabel
          Left = 13
          Top = 76
          Width = 139
          Height = 13
          Caption = 'Descri'#231#227'o em Portugu'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nm_ing: TLabel
          Left = 13
          Top = 124
          Width = 116
          Height = 13
          Caption = 'Descri'#231#227'o em Ingl'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nm_esp: TLabel
          Left = 13
          Top = 172
          Width = 134
          Height = 13
          Caption = 'Descri'#231#227'o em Espanhol'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_scx_exp: TLabel
          Left = 13
          Top = 213
          Width = 101
          Height = 26
          Caption = 'C'#243'digo Siscomex Exporta'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label3: TLabel
          Left = 125
          Top = 213
          Width = 58
          Height = 13
          Caption = 'Sigla CRT'
          FocusControl = dbedt_nm_sigla_crt
        end
        object lbl_naladi_fat: TLabel
          Left = 125
          Top = 277
          Width = 95
          Height = 13
          Caption = 'Naladi na Fatura'
          FocusControl = dbedt_nm_sigla_crt
        end
        object lbl_ncm_fat: TLabel
          Left = 13
          Top = 277
          Width = 86
          Height = 13
          Caption = 'NCM na Fatura'
          FocusControl = dbedt_nm_sigla_crt
        end
        object Label4: TLabel
          Left = 238
          Top = 277
          Width = 29
          Height = 13
          Caption = 'Aladi'
          FocusControl = dbedt_nm_sigla_crt
        end
        object Label5: TLabel
          Left = 349
          Top = 277
          Width = 62
          Height = 13
          Caption = 'Fumiga'#231#227'o'
          FocusControl = dbedt_nm_sigla_crt
        end
        object Label6: TLabel
          Left = 13
          Top = 325
          Width = 66
          Height = 13
          Caption = 'Continente:'
          FocusControl = dbedt_nm_sigla_crt
        end
        object dbedt_cd_pais: TDBEdit
          Left = 13
          Top = 38
          Width = 41
          Height = 21
          Color = clWhite
          DataField = 'CD_PAIS'
          DataSource = datm_pais.ds_pais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_nm_paisChange
          OnExit = dbedt_cd_paisExit
        end
        object dbedt_nm_pais: TDBEdit
          Left = 58
          Top = 38
          Width = 447
          Height = 21
          DataField = 'NM_PAIS'
          DataSource = datm_pais.ds_pais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = dbedt_nm_paisChange
        end
        object dbedt_nm_port: TDBEdit
          Left = 13
          Top = 92
          Width = 380
          Height = 21
          DataField = 'NM_PAIS_PORT'
          DataSource = datm_pais.ds_pais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_nm_paisChange
        end
        object dbedt_nm_ing: TDBEdit
          Left = 13
          Top = 140
          Width = 380
          Height = 21
          DataField = 'NM_PAIS_ING'
          DataSource = datm_pais.ds_pais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = dbedt_nm_paisChange
        end
        object dbedt_nm_esp: TDBEdit
          Left = 13
          Top = 188
          Width = 380
          Height = 21
          DataField = 'NM_PAIS_ESP'
          DataSource = datm_pais.ds_pais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = dbedt_nm_paisChange
        end
        object dbedt_cd_scx_exp: TDBEdit
          Left = 13
          Top = 243
          Width = 53
          Height = 21
          Color = clWhite
          DataField = 'CD_SCX_EXP'
          DataSource = datm_pais.ds_pais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnChange = dbedt_nm_paisChange
          OnExit = dbedt_cd_paisExit
        end
        object dbedt_nm_sigla_crt: TDBEdit
          Left = 125
          Top = 243
          Width = 41
          Height = 21
          DataField = 'NM_SIGLA_CRT'
          DataSource = datm_pais.ds_pais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnChange = dbedt_nm_paisChange
        end
        object dblckpbox_naladi_fat: TDBLookupComboBox
          Left = 125
          Top = 292
          Width = 92
          Height = 21
          DataField = 'IN_NALADI_FATURA'
          DataSource = datm_pais.ds_pais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_pais.ds_yesno
          ParentFont = False
          TabOrder = 8
          OnClick = dbedt_nm_paisChange
        end
        object dblckpbox_ncm_fat: TDBLookupComboBox
          Left = 13
          Top = 292
          Width = 92
          Height = 21
          DataField = 'IN_NCM_FATURA'
          DataSource = datm_pais.ds_pais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_pais.ds_yesno
          ParentFont = False
          TabOrder = 7
          OnClick = dbedt_nm_paisChange
        end
        object dblckpbox_aladi: TDBLookupComboBox
          Left = 238
          Top = 292
          Width = 92
          Height = 21
          DataField = 'IN_ALADI'
          DataSource = datm_pais.ds_pais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_pais.ds_yesno
          ParentFont = False
          TabOrder = 9
          OnClick = dbedt_nm_paisChange
        end
        object dblckpbox_fumigacao: TDBLookupComboBox
          Left = 349
          Top = 292
          Width = 92
          Height = 21
          DataField = 'IN_FUMIGACAO'
          DataSource = datm_pais.ds_pais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_pais.ds_yesno
          ParentFont = False
          TabOrder = 10
          OnClick = dbedt_nm_paisChange
        end
        object dblkpbox_nm_continente: TDBComboBox
          Left = 13
          Top = 341
          Width = 203
          Height = 21
          DataField = 'NM_CONTINENTE'
          DataSource = datm_pais.ds_pais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            #193'frica'
            'Am'#233'rica central'
            'Am'#233'rica do Norte'
            'Am'#233'rica do Sul'
            'Ant'#225'rtida'
            #193'sia'
            'Europa'
            'Oceania')
          ParentFont = False
          Sorted = True
          TabOrder = 11
          OnClick = dbedt_nm_paisChange
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 734
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
      Left = 372
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
      Left = 423
      Top = 2
      Width = 309
      Height = 43
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 0
      TabStop = True
      object Label1: TLabel
        Left = 11
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
        Left = 147
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
        Left = 11
        Top = 20
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
        OnKeyDown = edt_chaveKeyDown
      end
      object cb_ordem: TComboBox
        Left = 147
        Top = 20
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
    object dbnvg: TDBNavigator
      Left = 236
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_pais.ds_pais
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
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
