object frm_cliente_agente: Tfrm_cliente_agente
  Left = 289
  Top = 155
  Width = 640
  Height = 480
  Caption = 'Cliente X Agente'
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
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 44
    BevelOuter = bvLowered
    TabOrder = 0
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
    object btn_excluir: TSpeedButton
      Left = 92
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Excluir'
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
      Left = 276
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
      Left = 36
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
      Left = 64
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
    object dbnvg: TDBNavigator
      Left = 144
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_cliente_agente.ds_cliente_ag
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Próxima'
        'Última')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      BeforeAction = dbnvgBeforeAction
    end
  end
  object pnl_pesquisa: TPanel
    Left = 320
    Top = 0
    Width = 309
    Height = 44
    BevelOuter = bvLowered
    TabOrder = 1
    object lbl_pesquisa: TLabel
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
    object lbl_ordem_pesquisa: TLabel
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
  object pgctrl_cliente_agente: TPageControl
    Left = 2
    Top = 48
    Width = 629
    Height = 385
    ActivePage = ts_demurrage
    TabOrder = 2
    OnChange = pgctrl_cliente_agenteChange
    OnChanging = pgctrl_cliente_agenteChanging
    object ts_lista: TTabSheet
      Caption = '    Lista    '
      object lbl_Cliente: TLabel
        Left = 16
        Top = 1
        Width = 40
        Height = 13
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_unid_neg: TLabel
        Left = 16
        Top = 39
        Width = 48
        Height = 13
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_produto: TLabel
        Left = 16
        Top = 77
        Width = 45
        Height = 13
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbg_cadastro: TDBGrid
        Left = 16
        Top = 119
        Width = 601
        Height = 234
        Color = clWhite
        DataSource = datm_cliente_agente.ds_cliente_ag
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
            FieldName = 'LookAgente'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 260
          end
          item
            FieldName = 'LookTransp'
            Title.Caption = 'Transportador'
            Title.Color = clWindowText
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 260
          end
          item
            FieldName = 'LookAtivo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 62
          end>
      end
      object dbedt_cd_cliente: TDBEdit
        Left = 16
        Top = 17
        Width = 41
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_CLIENTE'
        DataSource = datm_cliente_agente.ds_cliente_ag
        MaxLength = 5
        ReadOnly = True
        TabOrder = 1
      end
      object dbedt_nm_cliente: TDBEdit
        Left = 61
        Top = 17
        Width = 313
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCliente'
        DataSource = datm_cliente_agente.ds_cliente_ag
        MaxLength = 50
        ReadOnly = True
        TabOrder = 2
      end
      object dbedt_cd_unid_neg: TDBEdit
        Left = 16
        Top = 53
        Width = 33
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_UNID_NEG'
        DataSource = datm_cliente_agente.ds_cliente_ag
        MaxLength = 2
        ReadOnly = True
        TabOrder = 3
      end
      object dbedt_nm_unid_neg: TDBEdit
        Left = 53
        Top = 53
        Width = 321
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookUnidNeg'
        DataSource = datm_cliente_agente.ds_cliente_ag
        ReadOnly = True
        TabOrder = 4
      end
      object dbedt_cd_produto: TDBEdit
        Left = 16
        Top = 94
        Width = 33
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_PRODUTO'
        DataSource = datm_cliente_agente.ds_cliente_ag
        MaxLength = 2
        ReadOnly = True
        TabOrder = 5
      end
      object dbedt_nm_produto: TDBEdit
        Left = 53
        Top = 94
        Width = 322
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookProduto'
        DataSource = datm_cliente_agente.ds_cliente_ag
        ReadOnly = True
        TabOrder = 6
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '   Dados Básicos   '
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 621
        Height = 357
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_agente: TLabel
          Left = 25
          Top = 135
          Width = 41
          Height = 13
          Caption = 'Agente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_in_ativo: TLabel
          Left = 426
          Top = 135
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
        object Label4: TLabel
          Left = 25
          Top = 16
          Width = 40
          Height = 13
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 25
          Top = 54
          Width = 48
          Height = 13
          Caption = 'Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 25
          Top = 92
          Width = 45
          Height = 13
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_agente: TSpeedButton
          Left = 391
          Top = 151
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
          OnClick = btn_co_agenteClick
        end
        object Label13: TLabel
          Left = 497
          Top = 135
          Width = 57
          Height = 13
          Caption = 'Free Time'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_transportadora: TLabel
          Left = 25
          Top = 176
          Width = 80
          Height = 13
          Caption = 'Transportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_transp: TSpeedButton
          Left = 392
          Top = 192
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
          OnClick = btn_co_transpClick
        end
        object dbedt_nm_agente: TDBEdit
          Left = 70
          Top = 151
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookAgente'
          DataSource = datm_cliente_agente.ds_cliente_ag
          MaxLength = 50
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_cd_agente: TDBEdit
          Left = 25
          Top = 151
          Width = 41
          Height = 21
          Color = clWhite
          DataField = 'CD_AGENTE'
          DataSource = datm_cliente_agente.ds_cliente_ag
          MaxLength = 5
          TabOrder = 10
          OnChange = dbedt_cd_agenteChange
          OnExit = dbedt_cd_agenteExit
          OnKeyDown = dbedt_cd_agenteKeyDown
        end
        object dblkpcbox_ativo: TDBLookupComboBox
          Left = 426
          Top = 151
          Width = 50
          Height = 21
          DataField = 'LookAtivo'
          DataSource = datm_cliente_agente.ds_cliente_ag
          DropDownRows = 3
          TabOrder = 0
          OnClick = dbedt_cd_agenteChange
        end
        object dbedt_cd_cliente2: TDBEdit
          Left = 25
          Top = 32
          Width = 41
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_CLIENTE'
          DataSource = datm_cliente_agente.ds_cliente_ag
          MaxLength = 5
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_nm_cliente2: TDBEdit
          Left = 70
          Top = 32
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCliente'
          DataSource = datm_cliente_agente.ds_cliente_ag
          MaxLength = 50
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_cd_unid_neg2: TDBEdit
          Left = 25
          Top = 68
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_UNID_NEG'
          DataSource = datm_cliente_agente.ds_cliente_ag
          MaxLength = 2
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_nm_unid_neg2: TDBEdit
          Left = 62
          Top = 68
          Width = 321
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidNeg'
          DataSource = datm_cliente_agente.ds_cliente_ag
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_cd_produto2: TDBEdit
          Left = 25
          Top = 109
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_PRODUTO'
          DataSource = datm_cliente_agente.ds_cliente_ag
          MaxLength = 2
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_nm_produto2: TDBEdit
          Left = 62
          Top = 109
          Width = 321
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookProduto'
          DataSource = datm_cliente_agente.ds_cliente_ag
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_nr_dias_free_time: TDBEdit
          Left = 497
          Top = 151
          Width = 70
          Height = 21
          Color = clWhite
          DataField = 'NR_DIAS_FREE_TIME'
          DataSource = datm_cliente_agente.ds_cliente_ag
          MaxLength = 5
          TabOrder = 1
          OnChange = dbedt_cd_agenteChange
          OnExit = dbedt_cd_agenteExit
          OnKeyDown = dbedt_cd_agenteKeyDown
        end
        object dbedt_nm_transp: TDBEdit
          Left = 70
          Top = 191
          Width = 315
          Height = 21
          Color = clMenu
          DataField = 'LookTransp'
          DataSource = datm_cliente_agente.ds_cliente_ag
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_cd_transp: TDBEdit
          Left = 24
          Top = 191
          Width = 41
          Height = 21
          DataField = 'CD_TRANSPORTADOR'
          DataSource = datm_cliente_agente.ds_cliente_ag
          MaxLength = 4
          TabOrder = 11
          OnChange = dbedt_cd_transpChange
          OnExit = dbedt_cd_transpExit
          OnKeyDown = dbedt_cd_agenteKeyDown
        end
      end
    end
    object ts_demurrage: TTabSheet
      Caption = '   Demurrage   '
      object pgctrl_cliente_ag_dem: TPageControl
        Left = 1
        Top = 3
        Width = 618
        Height = 354
        ActivePage = ts_dados_basicos2
        TabOrder = 0
        OnChange = pgctrl_cliente_agenteChange
        OnChanging = pgctrl_cliente_agenteChanging
        object ts_lista2: TTabSheet
          Caption = '    Lista    '
          object Label1: TLabel
            Left = 12
            Top = -1
            Width = 40
            Height = 13
            Caption = 'Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 12
            Top = 37
            Width = 48
            Height = 13
            Caption = 'Unidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 12
            Top = 75
            Width = 45
            Height = 13
            Caption = 'Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblAgente: TLabel
            Left = 12
            Top = 115
            Width = 41
            Height = 13
            Caption = 'Agente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_transp: TLabel
            Left = 8
            Top = 155
            Width = 80
            Height = 13
            Caption = 'Transportador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbg_contatos: TDBGrid
            Left = 12
            Top = 208
            Width = 586
            Height = 112
            DataSource = datm_cliente_agente.ds_cliente_ag_dem
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
                FieldName = 'NR_PERIODO'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
              end
              item
                FieldName = 'NR_DIAS_PERIODO'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 76
              end
              item
                FieldName = 'VL_DIARIA'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 84
              end
              item
                FieldName = 'LookTpCntr'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 138
              end
              item
                FieldName = 'LookIsento'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 47
              end>
          end
          object dbedt_cd_cliente3: TDBEdit
            Left = 12
            Top = 15
            Width = 41
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_CLIENTE'
            DataSource = datm_cliente_agente.ds_cliente_ag_dem
            MaxLength = 5
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_nm_cliente3: TDBEdit
            Left = 57
            Top = 15
            Width = 313
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookCliente'
            DataSource = datm_cliente_agente.ds_cliente_ag_dem
            MaxLength = 50
            ReadOnly = True
            TabOrder = 2
          end
          object dbedt_cd_unid_neg3: TDBEdit
            Left = 12
            Top = 51
            Width = 33
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_UNID_NEG'
            DataSource = datm_cliente_agente.ds_cliente_ag_dem
            MaxLength = 2
            ReadOnly = True
            TabOrder = 3
          end
          object dbedt_nm_unid_neg3: TDBEdit
            Left = 49
            Top = 51
            Width = 321
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookUnidNeg'
            DataSource = datm_cliente_agente.ds_cliente_ag_dem
            ReadOnly = True
            TabOrder = 4
          end
          object dbedt_cd_produto3: TDBEdit
            Left = 12
            Top = 92
            Width = 33
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_PRODUTO'
            DataSource = datm_cliente_agente.ds_cliente_ag_dem
            MaxLength = 2
            ReadOnly = True
            TabOrder = 5
          end
          object dbedt_nm_produto3: TDBEdit
            Left = 49
            Top = 92
            Width = 322
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookProduto'
            DataSource = datm_cliente_agente.ds_cliente_ag_dem
            ReadOnly = True
            TabOrder = 6
          end
          object dbedt_cd_agente2: TDBEdit
            Left = 12
            Top = 131
            Width = 41
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_AGENTE'
            DataSource = datm_cliente_agente.ds_cliente_ag_dem
            MaxLength = 5
            ReadOnly = True
            TabOrder = 7
          end
          object dbedt_nm_agente2: TDBEdit
            Left = 57
            Top = 131
            Width = 314
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookAgente'
            DataSource = datm_cliente_agente.ds_cliente_ag_dem
            MaxLength = 50
            ReadOnly = True
            TabOrder = 8
          end
          object dbedt_cd_transp2: TDBEdit
            Left = 12
            Top = 170
            Width = 37
            Height = 21
            Color = clMenu
            DataField = 'CD_TRANSPORTADOR'
            DataSource = datm_cliente_agente.ds_cliente_ag_dem
            MaxLength = 4
            ReadOnly = True
            TabOrder = 9
          end
          object dbedt_nm_transp2: TDBEdit
            Left = 56
            Top = 170
            Width = 313
            Height = 21
            Color = clMenu
            DataField = 'LookTransp'
            DataSource = datm_cliente_agente.ds_cliente_ag_dem
            TabOrder = 10
          end
        end
        object ts_dados_basicos2: TTabSheet
          Caption = '   Dados Básicos   '
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 610
            Height = 326
            Align = alClient
            BevelOuter = bvLowered
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object btn_co_moeda: TSpeedButton
              Left = 378
              Top = 262
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
              OnClick = btn_co_moedaClick
            end
            object Label7: TLabel
              Left = 15
              Top = 12
              Width = 40
              Height = 13
              Caption = 'Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 15
              Top = 50
              Width = 48
              Height = 13
              Caption = 'Unidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 15
              Top = 88
              Width = 45
              Height = 13
              Caption = 'Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 15
              Top = 129
              Width = 41
              Height = 13
              Caption = 'Agente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_moeda: TLabel
              Left = 15
              Top = 247
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
            object lbl_vl_diaria: TLabel
              Left = 154
              Top = 206
              Width = 67
              Height = 13
              Caption = 'Valor Diária'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_in_ativo2: TLabel
              Left = 244
              Top = 206
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
            object lbl_nr_periodo: TLabel
              Left = 15
              Top = 206
              Width = 64
              Height = 13
              Caption = 'Nº Período'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_nr_dias_periodo: TLabel
              Left = 89
              Top = 206
              Width = 44
              Height = 13
              Caption = 'Nº Dias'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 378
              Top = 205
              Width = 36
              Height = 13
              Caption = 'Isento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 15
              Top = 287
              Width = 116
              Height = 13
              Caption = 'Data Inicio Vigência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 151
              Top = 287
              Width = 130
              Height = 13
              Caption = 'Data Término Vigência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 15
              Top = 168
              Width = 80
              Height = 13
              Caption = 'Transportador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_cd_moeda: TDBEdit
              Left = 15
              Top = 259
              Width = 33
              Height = 21
              DataField = 'CD_MOEDA'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              MaxLength = 3
              TabOrder = 5
              OnChange = dbedt_cd_moedaChange
              OnExit = dbedt_cd_moedaExit
              OnKeyDown = dbedt_cd_agenteKeyDown
            end
            object dbedt_nm_moeda: TDBEdit
              Left = 52
              Top = 262
              Width = 320
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookMoeda'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              ReadOnly = True
              TabOrder = 8
            end
            object dbedt_cd_cliente4: TDBEdit
              Left = 15
              Top = 28
              Width = 41
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_CLIENTE'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              MaxLength = 5
              ReadOnly = True
              TabOrder = 9
            end
            object dbedt_nm_cliente4: TDBEdit
              Left = 59
              Top = 28
              Width = 313
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookCliente'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              MaxLength = 50
              ReadOnly = True
              TabOrder = 10
            end
            object dbedt_cd_unid_neg4: TDBEdit
              Left = 15
              Top = 64
              Width = 33
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_UNID_NEG'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              MaxLength = 2
              ReadOnly = True
              TabOrder = 11
            end
            object dbedt_nm_unid_neg4: TDBEdit
              Left = 51
              Top = 64
              Width = 321
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookUnidNeg'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              ReadOnly = True
              TabOrder = 12
            end
            object dbedt_cd_produto4: TDBEdit
              Left = 15
              Top = 105
              Width = 33
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_PRODUTO'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              MaxLength = 2
              ReadOnly = True
              TabOrder = 13
            end
            object dbedt_nm_produto4: TDBEdit
              Left = 51
              Top = 105
              Width = 321
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookProduto'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              ReadOnly = True
              TabOrder = 14
            end
            object dbedt_cd_agente3: TDBEdit
              Left = 15
              Top = 144
              Width = 41
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_AGENTE'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              MaxLength = 5
              ReadOnly = True
              TabOrder = 15
            end
            object dbedt_nm_agente3: TDBEdit
              Left = 59
              Top = 144
              Width = 313
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookAgente'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              MaxLength = 50
              ReadOnly = True
              TabOrder = 16
            end
            object dbedt_vl_diaria: TDBEdit
              Left = 154
              Top = 221
              Width = 75
              Height = 21
              DataField = 'VL_DIARIA'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 5
              ParentFont = False
              TabOrder = 2
              OnChange = dbedt_cd_moedaChange
            end
            object dblckpbox_tp_cntr: TDBLookupComboBox
              Left = 244
              Top = 221
              Width = 127
              Height = 21
              DataField = 'LookTpCntr'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              DropDownRows = 3
              TabOrder = 3
              OnClick = dbedt_cd_moedaChange
            end
            object dbedt_nr_periodo: TDBEdit
              Left = 15
              Top = 221
              Width = 50
              Height = 21
              DataField = 'NR_PERIODO'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              MaxLength = 3
              TabOrder = 0
              OnChange = dbedt_cd_moedaChange
              OnExit = dbedt_cd_moedaExit
              OnKeyDown = dbedt_cd_agenteKeyDown
            end
            object dbedt_nr_dias: TDBEdit
              Left = 89
              Top = 221
              Width = 50
              Height = 21
              DataField = 'NR_DIAS_PERIODO'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              MaxLength = 3
              TabOrder = 1
              OnChange = dbedt_cd_moedaChange
              OnExit = dbedt_cd_moedaExit
              OnKeyDown = dbedt_cd_agenteKeyDown
            end
            object dblckpbox_in_isento: TDBLookupComboBox
              Left = 378
              Top = 221
              Width = 50
              Height = 21
              DataField = 'LookIsento'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              DropDownRows = 3
              TabOrder = 4
              OnClick = dbedt_cd_moedaChange
            end
            object dbedt_dt_ini_vig: TDBDateEdit
              Left = 16
              Top = 302
              Width = 115
              Height = 21
              DataField = 'DT_INI_VIG'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              NumGlyphs = 2
              TabOrder = 6
              OnChange = dbedt_dt_ini_vigChange
              OnExit = dbedt_dt_ini_vigExit
            end
            object dbedt_dt_term_vig: TDBDateEdit
              Left = 152
              Top = 302
              Width = 115
              Height = 21
              DataField = 'DT_FIM_VIG'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              NumGlyphs = 2
              TabOrder = 7
              OnChange = dbedt_dt_term_vigChange
              OnExit = dbedt_dt_term_vigExit
            end
            object dbedt_cd_transp3: TDBEdit
              Left = 16
              Top = 184
              Width = 41
              Height = 21
              Color = clMenu
              DataField = 'CD_TRANSPORTADOR'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              MaxLength = 4
              TabOrder = 17
            end
            object dbedt_nm_transp_3: TDBEdit
              Left = 60
              Top = 184
              Width = 305
              Height = 21
              Color = clMenu
              DataField = 'LookTransp'
              DataSource = datm_cliente_agente.ds_cliente_ag_dem
              TabOrder = 18
            end
          end
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 556
    Top = 368
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
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
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
