object frm_cliente_numerario: Tfrm_cliente_numerario
  Left = 192
  Top = 141
  Width = 750
  Height = 550
  Caption = 'Cliente X Numer'#225'rio'
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
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 48
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 37
      Height = 39
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
      Left = 116
      Top = 4
      Width = 37
      Height = 39
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
      Left = 392
      Top = 4
      Width = 37
      Height = 39
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
      Width = 37
      Height = 39
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
      Left = 79
      Top = 4
      Width = 37
      Height = 39
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
      Left = 289
      Top = 14
      Width = 88
      Height = 21
      DataSource = datm_cliente_numerario.ds_cliente_numerario
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
      Left = 434
      Top = 1
      Width = 307
      Height = 46
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      object lbl_pesquisa: TLabel
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
      object lbl_ordem_pesquisa: TLabel
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
        Left = 10
        Top = 18
        Width = 129
        Height = 21
        TabStop = False
        TabOrder = 0
        OnChange = edt_chaveChange
      end
      object cmb_ordem: TComboBox
        Left = 146
        Top = 18
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        TabStop = False
      end
    end
  end
  object pgctrl_cliente_numerario: TPageControl
    Left = 0
    Top = 48
    Width = 742
    Height = 456
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_cliente_numerarioChange
    OnChanging = pgctrl_cliente_numerarioChanging
    object ts_lista: TTabSheet
      Caption = '    Lista    '
      object bvl1: TBevel
        Left = 0
        Top = 0
        Width = 734
        Height = 187
        Align = alClient
      end
      object lbl_cliente: TLabel
        Left = 16
        Top = 13
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
        Top = 55
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
        Top = 97
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
      object lbl_servico: TLabel
        Left = 16
        Top = 139
        Width = 44
        Height = 13
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 187
        Width = 734
        Height = 241
        Align = alBottom
        Color = clWhite
        DataSource = datm_cliente_numerario.ds_cliente_numerario
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
            Expanded = False
            FieldName = 'NR_SOLICITACAO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 43
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
            Width = 319
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookTpDestino'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 215
            Visible = True
          end>
      end
      object dbedt_nm_cliente: TDBEdit
        Left = 57
        Top = 26
        Width = 413
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCliente'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 2
      end
      object dbedt_nm_unid_neg: TDBEdit
        Left = 57
        Top = 68
        Width = 413
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookUnidNeg'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 4
      end
      object dbedt_nm_produto: TDBEdit
        Left = 57
        Top = 110
        Width = 413
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookProduto'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_nm_servico: TDBEdit
        Left = 57
        Top = 152
        Width = 413
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookServico'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 8
      end
      object dbedt_cd_cliente: TDBEdit
        Left = 17
        Top = 26
        Width = 41
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_CLIENTE'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 1
      end
      object dbedt_cd_unid_neg: TDBEdit
        Left = 17
        Top = 68
        Width = 41
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_UNID_NEG'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 3
      end
      object dbedt_cd_produto: TDBEdit
        Left = 17
        Top = 110
        Width = 41
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_PRODUTO'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 5
      end
      object dbedt_cd_servico: TDBEdit
        Left = 17
        Top = 152
        Width = 41
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_SERVICO'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 7
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '   Dados B'#225'sicos   '
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 428
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_cliente2: TLabel
          Left = 21
          Top = 18
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
        object lbl_unid_neg2: TLabel
          Left = 22
          Top = 61
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
        object lbl_produto2: TLabel
          Left = 21
          Top = 103
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
        object lbl_servico2: TLabel
          Left = 21
          Top = 146
          Width = 44
          Height = 13
          Caption = 'Servi'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nr_solicitacao: TLabel
          Left = 22
          Top = 190
          Width = 80
          Height = 13
          Caption = 'Solicita'#231#227'o n'#186
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_item: TLabel
          Left = 22
          Top = 232
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
          Left = 388
          Top = 244
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
          OnClick = btn_co_itemClick
        end
        object lbl_tipo_calculo: TLabel
          Left = 21
          Top = 274
          Width = 90
          Height = 13
          Caption = 'Tipo de C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_tp_calculo: TSpeedButton
          Left = 388
          Top = 287
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
          OnClick = btn_tp_calculoClick
        end
        object Label7: TLabel
          Left = 21
          Top = 318
          Width = 91
          Height = 13
          Caption = 'Tipo de Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nm_cliente2: TDBEdit
          Left = 67
          Top = 31
          Width = 320
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCliente'
          DataSource = datm_cliente_numerario.ds_cliente_numerario
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_nm_unid_neg2: TDBEdit
          Left = 67
          Top = 74
          Width = 320
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidNeg'
          DataSource = datm_cliente_numerario.ds_cliente_numerario
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_nm_produto2: TDBEdit
          Left = 67
          Top = 116
          Width = 320
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookProduto'
          DataSource = datm_cliente_numerario.ds_cliente_numerario
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_nm_servico2: TDBEdit
          Left = 67
          Top = 159
          Width = 320
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookServico'
          DataSource = datm_cliente_numerario.ds_cliente_numerario
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_nm_item: TDBEdit
          Left = 67
          Top = 244
          Width = 320
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookItem'
          DataSource = datm_cliente_numerario.ds_cliente_numerario
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_nm_calculo: TDBEdit
          Left = 67
          Top = 287
          Width = 320
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCalculo'
          DataSource = datm_cliente_numerario.ds_cliente_numerario
          ReadOnly = True
          TabOrder = 12
        end
        object dblckpbox_tp_destino: TDBLookupComboBox
          Left = 22
          Top = 332
          Width = 145
          Height = 21
          DataField = 'TP_DESTINO'
          DataSource = datm_cliente_numerario.ds_cliente_numerario
          KeyField = 'CD_TP_DESTINO'
          ListField = 'NM_TP_DESTINO'
          ListSource = datm_cliente_numerario.ds_tp_destino
          TabOrder = 13
          OnClick = dbedt_nr_solicitacaoChange
        end
        object dbedt_tp_calculo: TDBEdit
          Left = 22
          Top = 287
          Width = 46
          Height = 21
          DataField = 'TP_CALCULO'
          DataSource = datm_cliente_numerario.ds_cliente_numerario
          TabOrder = 2
          OnChange = dbedt_nr_solicitacaoChange
          OnExit = dbedt_tp_calculoExit
          OnKeyDown = dbedt_cd_itemKeyDown
        end
        object dbedt_cd_item: TDBEdit
          Left = 22
          Top = 244
          Width = 46
          Height = 21
          DataField = 'CD_ITEM'
          DataSource = datm_cliente_numerario.ds_cliente_numerario
          TabOrder = 1
          OnChange = dbedt_nr_solicitacaoChange
          OnExit = dbedt_cd_itemExit
          OnKeyDown = dbedt_cd_itemKeyDown
        end
        object dbedt_nr_solicitacao: TDBEdit
          Left = 22
          Top = 203
          Width = 46
          Height = 21
          DataField = 'NR_SOLICITACAO'
          DataSource = datm_cliente_numerario.ds_cliente_numerario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_nr_solicitacaoChange
          OnExit = dbedt_nr_solicitacaoExit
        end
        object dbedt_cd_servico2: TDBEdit
          Left = 22
          Top = 159
          Width = 46
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_SERVICO'
          DataSource = datm_cliente_numerario.ds_cliente_numerario
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_cd_produto2: TDBEdit
          Left = 22
          Top = 116
          Width = 46
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_PRODUTO'
          DataSource = datm_cliente_numerario.ds_cliente_numerario
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_unid_neg2: TDBEdit
          Left = 22
          Top = 74
          Width = 46
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_UNID_NEG'
          DataSource = datm_cliente_numerario.ds_cliente_numerario
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_cd_cliente2: TDBEdit
          Left = 22
          Top = 31
          Width = 46
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_CLIENTE'
          DataSource = datm_cliente_numerario.ds_cliente_numerario
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
    object ts_receita_imp: TTabSheet
      Caption = 'Receita Importa'#231#227'o'
      object lbl_cliente3: TLabel
        Left = 4
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
      object lbl_unid_neg3: TLabel
        Left = 210
        Top = -1
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
      object lbl_produto3: TLabel
        Left = 4
        Top = 35
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
      object lbl_servico3: TLabel
        Left = 210
        Top = 35
        Width = 44
        Height = 13
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_item2: TLabel
        Left = 4
        Top = 70
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
      object lbl_regime_trib: TLabel
        Left = 420
        Top = -1
        Width = 108
        Height = 13
        Caption = 'Regime Tributa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dt_base: TLabel
        Left = 210
        Top = 70
        Width = 172
        Height = 13
        Caption = 'Data Base para Moeda/'#205'ndice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_in_ativo: TLabel
        Left = 419
        Top = 70
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
      object dbedt_nm_cliente3: TDBEdit
        Left = 4
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCliente'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 7
      end
      object dbedt_nm_unid_neg3: TDBEdit
        Left = 210
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookUnidNeg'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 8
      end
      object dbedt_nm_produto3: TDBEdit
        Left = 4
        Top = 48
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookProduto'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 9
      end
      object dbedt_nm_servico3: TDBEdit
        Left = 210
        Top = 48
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookServico'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 10
      end
      object dbedt_nm_item2: TDBEdit
        Left = 4
        Top = 83
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItem'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 11
      end
      object pnl_taxa: TPanel
        Left = 4
        Top = 112
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 2
        object Label2: TLabel
          Left = 67
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_base_calc_taxa: TLabel
          Left = 211
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_moeda_taxa: TLabel
          Left = 359
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_taxa: TLabel
          Left = 5
          Top = 3
          Width = 29
          Height = 13
          Caption = 'Taxa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_taxa: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_taxaClick
        end
        object dbedt_vl_num_taxa: TDBEdit
          Left = 5
          Top = 19
          Width = 60
          Height = 21
          DataField = 'VL_NUM_TAXA'
          DataSource = datm_cliente_numerario.ds_receita_imp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedt_vl_den_taxa: TDBEdit
          Left = 77
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_TAXA'
          DataSource = datm_cliente_numerario.ds_receita_imp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_vl_den_taxaExit
        end
        object dbedt_calc_taxa: TDBEdit
          Left = 121
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Taxa'
          DataSource = datm_cliente_numerario.ds_receita_imp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_taxaChange
        end
        object dblckbox_base_calc_taxa: TDBLookupComboBox
          Left = 211
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_TAXA'
          DataSource = datm_cliente_numerario.ds_receita_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_cliente_numerario.ds_base_calc_imp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_taxaClick
        end
        object dbedt_cd_moeda_taxa: TDBEdit
          Left = 359
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_TAXA'
          DataSource = datm_cliente_numerario.ds_receita_imp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_cd_moeda_taxaExit
          OnKeyDown = dbedt_cd_itemKeyDown
        end
        object dbedt_nm_moeda_taxa: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaTaxa'
          DataSource = datm_cliente_numerario.ds_receita_imp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_acr: TPanel
        Left = 4
        Top = 160
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 3
        object Label1: TLabel
          Left = 67
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_base_calc_acr: TLabel
          Left = 211
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_moeda_acr: TLabel
          Left = 359
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_acr: TLabel
          Left = 5
          Top = 3
          Width = 59
          Height = 13
          Caption = 'Acr'#233'scimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_acr: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_acrClick
        end
        object dbedt_vl_num_acr: TDBEdit
          Left = 5
          Top = 19
          Width = 60
          Height = 21
          DataField = 'VL_NUM_ACR'
          DataSource = datm_cliente_numerario.ds_receita_imp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedt_vl_den_acr: TDBEdit
          Left = 77
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_ACR'
          DataSource = datm_cliente_numerario.ds_receita_imp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_vl_den_acrExit
        end
        object dblckbox_base_calc_acr: TDBLookupComboBox
          Left = 211
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_ACR'
          DataSource = datm_cliente_numerario.ds_receita_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_cliente_numerario.ds_base_calc_imp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_acrClick
        end
        object dbedt_cd_moeda_acr: TDBEdit
          Left = 359
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_ACR'
          DataSource = datm_cliente_numerario.ds_receita_imp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_cd_moeda_acrExit
          OnKeyDown = dbedt_cd_itemKeyDown
        end
        object dbedt_nm_moeda_acr: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaAcr'
          DataSource = datm_cliente_numerario.ds_receita_imp
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_calc_acr: TDBEdit
          Left = 121
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Acr'
          DataSource = datm_cliente_numerario.ds_receita_imp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 5
          OnChange = dbedt_calc_acrChange
        end
      end
      object pnl_fora_regiao: TPanel
        Left = 4
        Top = 208
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 4
        object Label6: TLabel
          Left = 67
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_base_calc_fora_regiao: TLabel
          Left = 211
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_moeda_fora_regiao: TLabel
          Left = 359
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_fora_regiao: TLabel
          Left = 5
          Top = 3
          Width = 88
          Height = 13
          Caption = 'Fora da Regi'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_fora_regiao: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_fora_regiaoClick
        end
        object dbedt_vl_num_fora_regiao: TDBEdit
          Left = 5
          Top = 19
          Width = 60
          Height = 21
          DataField = 'VL_NUM_FORA_REGIAO'
          DataSource = datm_cliente_numerario.ds_receita_imp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedt_vl_den_fora_regiao: TDBEdit
          Left = 77
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_FORA_REGIAO'
          DataSource = datm_cliente_numerario.ds_receita_imp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_vl_den_fora_regiaoExit
        end
        object dbedt_calc_fora_regiao: TDBEdit
          Left = 121
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Fora_Regiao'
          DataSource = datm_cliente_numerario.ds_receita_imp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_fora_regiaoChange
        end
        object dblckbox_base_calc_fora_regiao: TDBLookupComboBox
          Left = 211
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_FORA_REGIAO'
          DataSource = datm_cliente_numerario.ds_receita_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_cliente_numerario.ds_base_calc_imp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_fora_regiaoClick
        end
        object dbedt_cd_moeda_fora_regiao: TDBEdit
          Left = 359
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_FORA_REGIAO'
          DataSource = datm_cliente_numerario.ds_receita_imp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_cd_moeda_fora_regiaoExit
          OnKeyDown = dbedt_cd_itemKeyDown
        end
        object dbedt_nm_moeda_fora_regiao: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaForaRegiao'
          DataSource = datm_cliente_numerario.ds_receita_imp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_min: TPanel
        Left = 4
        Top = 256
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 5
        object Label10: TLabel
          Left = 67
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_base_calc_min: TLabel
          Left = 211
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_moeda_min: TLabel
          Left = 359
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_min: TLabel
          Left = 5
          Top = 3
          Width = 42
          Height = 13
          Caption = 'M'#237'nimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_min: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_minClick
        end
        object dbedt_vl_num_min: TDBEdit
          Left = 5
          Top = 19
          Width = 60
          Height = 21
          DataField = 'VL_NUM_MIN'
          DataSource = datm_cliente_numerario.ds_receita_imp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedt_vl_den_min: TDBEdit
          Left = 77
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MIN'
          DataSource = datm_cliente_numerario.ds_receita_imp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_vl_den_minExit
        end
        object dbedt_calc_min: TDBEdit
          Left = 121
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Min'
          DataSource = datm_cliente_numerario.ds_receita_imp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_minChange
        end
        object dblckbox_base_calc_min: TDBLookupComboBox
          Left = 211
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_MIN'
          DataSource = datm_cliente_numerario.ds_receita_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_cliente_numerario.ds_base_calc_imp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_minClick
        end
        object dbedt_cd_moeda_min: TDBEdit
          Left = 359
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_MIN'
          DataSource = datm_cliente_numerario.ds_receita_imp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_cd_moeda_minExit
          OnKeyDown = dbedt_cd_itemKeyDown
        end
        object dbedt_nm_moeda_min: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaMin'
          DataSource = datm_cliente_numerario.ds_receita_imp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_max: TPanel
        Left = 4
        Top = 305
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 6
        object Label14: TLabel
          Left = 67
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_base_calc_max: TLabel
          Left = 211
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_moeda_max: TLabel
          Left = 358
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_max: TLabel
          Left = 5
          Top = 3
          Width = 43
          Height = 13
          Caption = 'M'#225'ximo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_max: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_maxClick
        end
        object dbedt_vl_num_max: TDBEdit
          Left = 5
          Top = 19
          Width = 60
          Height = 21
          DataField = 'VL_NUM_MAX'
          DataSource = datm_cliente_numerario.ds_receita_imp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedt_vl_den_max: TDBEdit
          Left = 77
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MAX'
          DataSource = datm_cliente_numerario.ds_receita_imp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_vl_den_maxExit
        end
        object dbedt_calc_max: TDBEdit
          Left = 121
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Max'
          DataSource = datm_cliente_numerario.ds_receita_imp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_maxChange
        end
        object dblckbox_base_calc_max: TDBLookupComboBox
          Left = 211
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_MAX'
          DataSource = datm_cliente_numerario.ds_receita_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_cliente_numerario.ds_base_calc_imp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_maxClick
        end
        object dbedt_cd_moeda_max: TDBEdit
          Left = 358
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_MAX'
          DataSource = datm_cliente_numerario.ds_receita_imp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_cd_moeda_maxExit
          OnKeyDown = dbedt_cd_itemKeyDown
        end
        object dbedt_nm_moeda_max: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaMax'
          DataSource = datm_cliente_numerario.ds_receita_imp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object dblckbox_dt_base: TDBLookupComboBox
        Left = 210
        Top = 83
        Width = 197
        Height = 21
        DataField = 'TP_DT_BASE'
        DataSource = datm_cliente_numerario.ds_receita_imp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'CD_DT_BASE'
        ListField = 'NM_DT_BASE'
        ListSource = datm_cliente_numerario.ds_dt_base
        TabOrder = 0
        OnClick = dbedt_vl_num_taxaChange
      end
      object dblkpcbox_in_ativo: TDBLookupComboBox
        Left = 419
        Top = 83
        Width = 50
        Height = 21
        DataField = 'IN_ATIVO'
        DataSource = datm_cliente_numerario.ds_receita_imp
        DropDownRows = 3
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_cliente_numerario.ds_yesno
        TabOrder = 1
        OnClick = dbedt_vl_num_taxaChange
      end
      object dbgrd_reg_trib: TDBGrid
        Left = 421
        Top = 13
        Width = 196
        Height = 55
        DataSource = datm_cliente_numerario.ds_receita_imp
        Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 12
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'LookRegimeTrib'
            Visible = True
          end>
      end
    end
    object ts_receita_exp: TTabSheet
      Caption = 'Receita Exporta'#231#227'o'
      object lbl_cliente4: TLabel
        Left = 4
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
      object lbl_servico4: TLabel
        Left = 4
        Top = 35
        Width = 44
        Height = 13
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_unid_neg4: TLabel
        Left = 210
        Top = -1
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
      object lbl_item3: TLabel
        Left = 210
        Top = 35
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
      object lbl_produto4: TLabel
        Left = 419
        Top = -1
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
      object lbl_tp_faixa: TLabel
        Left = 210
        Top = 72
        Width = 78
        Height = 13
        Caption = 'Tipo da Faixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dt_base2: TLabel
        Left = 4
        Top = 72
        Width = 172
        Height = 13
        Caption = 'Data Base para Moeda/'#205'ndice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_ativo2: TLabel
        Left = 567
        Top = 72
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
      object lbl_tp_faixa_valor: TLabel
        Left = 355
        Top = 72
        Width = 129
        Height = 13
        Caption = 'Tipo do Valor da Faixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_pc_reduc_re_canc: TLabel
        Left = 500
        Top = 71
        Width = 62
        Height = 13
        Caption = '% Red. RE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_nm_cliente4: TDBEdit
        Left = 4
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCliente'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 9
      end
      object dbedt_nm_servico4: TDBEdit
        Left = 4
        Top = 49
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookServico'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 10
      end
      object dbedt_nm_unid_neg4: TDBEdit
        Left = 210
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookUnidNeg'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 11
      end
      object dbedt_nm_item3: TDBEdit
        Left = 210
        Top = 49
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItem'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 12
      end
      object dbedt_nm_produto4: TDBEdit
        Left = 419
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookProduto'
        DataSource = datm_cliente_numerario.ds_cliente_numerario
        ReadOnly = True
        TabOrder = 13
      end
      object dblckbox_tp_faixa: TDBLookupComboBox
        Left = 210
        Top = 85
        Width = 142
        Height = 21
        DataField = 'TP_FAIXA'
        DataSource = datm_cliente_numerario.ds_receita_exp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'TP_FAIXA'
        ListField = 'NM_TP_FAIXA'
        ListSource = datm_cliente_numerario.ds_tp_faixa
        TabOrder = 1
        OnClick = dblckbox_tp_faixaClick
      end
      object dblckbox_regime_trib2: TDBLookupComboBox
        Left = 4
        Top = 85
        Width = 197
        Height = 21
        DataField = 'TP_DT_BASE'
        DataSource = datm_cliente_numerario.ds_receita_exp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'CD_DT_BASE'
        ListField = 'NM_DT_BASE'
        ListSource = datm_cliente_numerario.ds_dt_base
        TabOrder = 0
        OnClick = dbedt_vl_num_taxa2Change
      end
      object dblck_box_in_ativo2: TDBLookupComboBox
        Left = 567
        Top = 85
        Width = 50
        Height = 21
        DataField = 'IN_ATIVO'
        DataSource = datm_cliente_numerario.ds_receita_exp
        DropDownRows = 3
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_cliente_numerario.ds_yesno
        TabOrder = 4
        OnClick = dbedt_vl_num_taxa2Change
      end
      object dblckbox_tp_faixa_valor: TDBLookupComboBox
        Left = 355
        Top = 85
        Width = 142
        Height = 21
        DataField = 'TP_FAIXA_VALOR'
        DataSource = datm_cliente_numerario.ds_receita_exp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'TP_FAIXA_VALOR'
        ListField = 'NM_TP_FAIXA_VALOR'
        ListSource = datm_cliente_numerario.ds_tp_faixa_valor
        TabOrder = 2
        OnClick = dbedt_vl_num_taxa2Change
      end
      object dbedt_pc_reduc_re_canc: TDBEdit
        Left = 500
        Top = 85
        Width = 61
        Height = 21
        DataField = 'PC_REDUC_RE_CANC'
        DataSource = datm_cliente_numerario.ds_receita_exp
        MaxLength = 6
        TabOrder = 3
        OnChange = dbedt_vl_num_taxa2Change
      end
      object pnl_taxa2: TPanel
        Left = 5
        Top = 112
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 5
        Visible = False
        object Label3: TLabel
          Left = 67
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 211
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 359
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_taxa2: TLabel
          Left = 5
          Top = 3
          Width = 29
          Height = 13
          Caption = 'Taxa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_taxa2: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_taxa2Click
        end
        object dbedt_vl_num_taxa2: TDBEdit
          Left = 5
          Top = 19
          Width = 60
          Height = 21
          DataField = 'VL_NUM_TAXA'
          DataSource = datm_cliente_numerario.ds_receita_exp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxa2Change
        end
        object dbedt_vl_den_taxa2: TDBEdit
          Left = 77
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_TAXA'
          DataSource = datm_cliente_numerario.ds_receita_exp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_vl_den_taxa2Exit
        end
        object dbedt_calc_taxa2: TDBEdit
          Left = 121
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Taxa2'
          DataSource = datm_cliente_numerario.ds_receita_exp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_taxa2Change
        end
        object dblckbox_base_calc_taxa2: TDBLookupComboBox
          Left = 211
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_TAXA'
          DataSource = datm_cliente_numerario.ds_receita_exp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_cliente_numerario.ds_base_calc_exp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_taxa2Click
        end
        object dbedt_cd_moeda_taxa2: TDBEdit
          Left = 359
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_TAXA'
          DataSource = datm_cliente_numerario.ds_receita_exp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_cd_moeda_taxa2Exit
          OnKeyDown = dbedt_cd_itemKeyDown
        end
        object dbedt_nm_moeda_taxa2: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaTaxa'
          DataSource = datm_cliente_numerario.ds_receita_exp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_min2: TPanel
        Left = 5
        Top = 160
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 6
        object Label8: TLabel
          Left = 67
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_base_calc_min2: TLabel
          Left = 211
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_moeda_min2: TLabel
          Left = 359
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_min2: TLabel
          Left = 5
          Top = 3
          Width = 42
          Height = 13
          Caption = 'M'#237'nimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_min2: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_min2Click
        end
        object dbedt_vl_num_min2: TDBEdit
          Left = 5
          Top = 19
          Width = 60
          Height = 21
          DataField = 'VL_NUM_MIN'
          DataSource = datm_cliente_numerario.ds_receita_exp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxa2Change
        end
        object dbedt_vl_den_min2: TDBEdit
          Left = 77
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MIN'
          DataSource = datm_cliente_numerario.ds_receita_exp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_vl_den_min2Exit
        end
        object dbedt_calc_min2: TDBEdit
          Left = 121
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Min2'
          DataSource = datm_cliente_numerario.ds_receita_exp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_min2Change
        end
        object dblckbox_base_calc_min2: TDBLookupComboBox
          Left = 211
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_MIN'
          DataSource = datm_cliente_numerario.ds_receita_exp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_cliente_numerario.ds_base_calc_exp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_min2Click
        end
        object dbedt_cd_moeda_min2: TDBEdit
          Left = 359
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_MIN'
          DataSource = datm_cliente_numerario.ds_receita_exp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_cd_moeda_min2Exit
          OnKeyDown = dbedt_cd_itemKeyDown
        end
        object dbedt_nm_moeda_min2: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaMin'
          DataSource = datm_cliente_numerario.ds_receita_exp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_max2: TPanel
        Left = 5
        Top = 209
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 7
        object Label13: TLabel
          Left = 67
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_base_calc_max2: TLabel
          Left = 211
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_moeda_max2: TLabel
          Left = 358
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_max2: TLabel
          Left = 5
          Top = 3
          Width = 43
          Height = 13
          Caption = 'M'#225'ximo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_max2: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_max2Click
        end
        object dbedt_vl_num_max2: TDBEdit
          Left = 5
          Top = 19
          Width = 60
          Height = 21
          DataField = 'VL_NUM_MAX'
          DataSource = datm_cliente_numerario.ds_receita_exp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxa2Change
        end
        object dbedt_vl_den_max2: TDBEdit
          Left = 77
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MAX'
          DataSource = datm_cliente_numerario.ds_receita_exp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_vl_den_max2Exit
        end
        object dbedt_calc_max2: TDBEdit
          Left = 121
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Max2'
          DataSource = datm_cliente_numerario.ds_receita_exp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_max2Change
        end
        object dblckbox_base_calc_max2: TDBLookupComboBox
          Left = 211
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_MAX'
          DataSource = datm_cliente_numerario.ds_receita_exp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_cliente_numerario.ds_base_calc_exp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_max2Click
        end
        object dbedt_cd_moeda_max2: TDBEdit
          Left = 358
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_MAX'
          DataSource = datm_cliente_numerario.ds_receita_exp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_cd_moeda_max2Exit
          OnKeyDown = dbedt_cd_itemKeyDown
        end
        object dbedt_nm_moeda_max2: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaMax'
          DataSource = datm_cliente_numerario.ds_receita_exp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object btn_faixas: TButton
        Left = 254
        Top = 276
        Width = 96
        Height = 23
        Caption = '&Faixas de Taxas'
        TabOrder = 8
        Visible = False
        OnClick = btn_faixasClick
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 587
    Top = 99
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
