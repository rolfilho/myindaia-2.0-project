object frm_cliente_faturamento: Tfrm_cliente_faturamento
  Left = 471
  Top = 174
  Width = 640
  Height = 480
  Caption = 'Cliente X Faturamento'
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
      DataSource = datm_cliente_faturamento.ds_cliente_faturamento
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
  end
  object pnl_pesquisa: TPanel
    Left = 320
    Top = 0
    Width = 309
    Height = 44
    BevelOuter = bvLowered
    TabOrder = 1
    TabStop = True
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
    end
  end
  object pgctrl_cliente_faturamento: TPageControl
    Left = 0
    Top = 48
    Width = 629
    Height = 385
    ActivePage = ts_receita_imp
    TabOrder = 2
    OnChange = pgctrl_cliente_faturamentoChange
    OnChanging = pgctrl_cliente_faturamentoChanging
    object ts_lista: TTabSheet
      Caption = '    Lista    '
      object lbl_Cliente: TLabel
        Left = 14
        Top = 6
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
        Left = 14
        Top = 44
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
        Left = 14
        Top = 80
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
        Left = 14
        Top = 118
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
        Left = 14
        Top = 163
        Width = 594
        Height = 188
        Color = clWhite
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
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
            FieldName = 'CD_ITEM'
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
            FieldName = 'LookItem'
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
      object dbedt_cd_cliente: TDBEdit
        Left = 14
        Top = 22
        Width = 41
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_CLIENTE'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 1
      end
      object dbedt_nm_cliente: TDBEdit
        Left = 59
        Top = 22
        Width = 313
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCliente'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 2
      end
      object dbedt_cd_unid_neg: TDBEdit
        Left = 14
        Top = 58
        Width = 33
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_UNID_NEG'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 3
      end
      object dbedt_nm_unid_neg: TDBEdit
        Left = 59
        Top = 58
        Width = 313
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookUnidNeg'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 4
      end
      object dbedt_cd_produto: TDBEdit
        Left = 14
        Top = 95
        Width = 33
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_PRODUTO'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 5
      end
      object dbedt_nm_produto: TDBEdit
        Left = 59
        Top = 95
        Width = 313
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookProduto'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_cd_servico: TDBEdit
        Left = 14
        Top = 133
        Width = 33
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_SERVICO'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 7
      end
      object dbedt_nm_servico: TDBEdit
        Left = 59
        Top = 133
        Width = 313
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookServico'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 8
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '   Dados B'#225'sicos   '
      object pnl_entrada_de_dados: TPanel
        Left = 3
        Top = 8
        Width = 610
        Height = 345
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_cliente2: TLabel
          Left = 14
          Top = 9
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
          Left = 14
          Top = 47
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
          Left = 14
          Top = 83
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
          Left = 14
          Top = 121
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
        object lbl_item: TLabel
          Left = 14
          Top = 164
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
          Left = 380
          Top = 179
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
        object btn_tp_calculo: TSpeedButton
          Left = 380
          Top = 222
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
          OnClick = btn_tp_calculoClick
        end
        object lbl_tipo_calculo: TLabel
          Left = 14
          Top = 207
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
        object dbedt_cd_cliente2: TDBEdit
          Left = 16
          Top = 25
          Width = 40
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_CLIENTE'
          DataSource = datm_cliente_faturamento.ds_cliente_faturamento
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nm_cliente2: TDBEdit
          Left = 59
          Top = 25
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCliente'
          DataSource = datm_cliente_faturamento.ds_cliente_faturamento
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_unid_neg2: TDBEdit
          Left = 16
          Top = 61
          Width = 40
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_UNID_NEG'
          DataSource = datm_cliente_faturamento.ds_cliente_faturamento
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_nm_unid_neg2: TDBEdit
          Left = 59
          Top = 61
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidNeg'
          DataSource = datm_cliente_faturamento.ds_cliente_faturamento
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_cd_produto2: TDBEdit
          Left = 16
          Top = 98
          Width = 40
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_PRODUTO'
          DataSource = datm_cliente_faturamento.ds_cliente_faturamento
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_nm_produto2: TDBEdit
          Left = 59
          Top = 98
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookProduto'
          DataSource = datm_cliente_faturamento.ds_cliente_faturamento
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_cd_servico2: TDBEdit
          Left = 16
          Top = 136
          Width = 40
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_SERVICO'
          DataSource = datm_cliente_faturamento.ds_cliente_faturamento
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_nm_servico2: TDBEdit
          Left = 59
          Top = 136
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookServico'
          DataSource = datm_cliente_faturamento.ds_cliente_faturamento
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_item: TDBEdit
          Left = 16
          Top = 179
          Width = 40
          Height = 21
          DataField = 'CD_ITEM'
          DataSource = datm_cliente_faturamento.ds_cliente_faturamento
          TabOrder = 8
          OnChange = dbedt_cd_itemChange
          OnExit = dbedt_cd_itemExit
          OnKeyDown = dbedt_cd_itemKeyDown
        end
        object dbedt_nm_item: TDBEdit
          Left = 59
          Top = 179
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookItem'
          DataSource = datm_cliente_faturamento.ds_cliente_faturamento
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_nm_calculo: TEdit
          Left = 59
          Top = 222
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_tp_calculo: TDBEdit
          Left = 16
          Top = 222
          Width = 40
          Height = 21
          DataField = 'TP_CALCULO'
          DataSource = datm_cliente_faturamento.ds_cliente_faturamento
          TabOrder = 11
          OnChange = btn_tp_calculoClick
          OnExit = btn_tp_calculoClick
          OnKeyDown = dbedt_cd_itemKeyDown
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
      object lbl_item2: TLabel
        Left = 4
        Top = 72
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
      object lbl_dt_base: TLabel
        Left = 210
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
      object lbl_in_ativo: TLabel
        Left = 419
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
      object dbedt_nm_cliente3: TDBEdit
        Left = 4
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCliente'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_nm_servico3: TDBEdit
        Left = 210
        Top = 49
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookServico'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
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
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 8
      end
      object dbedt_nm_item2: TDBEdit
        Left = 4
        Top = 86
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItem'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 9
      end
      object dblckbox_dt_base: TDBLookupComboBox
        Left = 210
        Top = 86
        Width = 197
        Height = 21
        DataField = 'TP_DT_BASE'
        DataSource = datm_cliente_faturamento.ds_receita_imp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'CD_DT_BASE'
        ListField = 'NM_DT_BASE'
        ListSource = datm_cliente_faturamento.ds_dt_base
        TabOrder = 0
        OnClick = dbedt_vl_num_taxaChange
      end
      object dbedt_nm_produto3: TDBEdit
        Left = 4
        Top = 49
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookProduto'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 10
      end
      object dblkpcbox_in_ativo: TDBLookupComboBox
        Left = 419
        Top = 86
        Width = 50
        Height = 21
        DataField = 'IN_ATIVO'
        DataSource = datm_cliente_faturamento.ds_receita_imp
        DropDownRows = 3
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_cliente_faturamento.ds_yesno
        TabOrder = 1
        OnClick = dbedt_vl_num_taxaChange
      end
      object pnl_taxa: TPanel
        Left = 4
        Top = 112
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 2
        object Label2: TLabel
          Left = 75
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
          Left = 219
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
          Width = 68
          Height = 21
          DataField = 'VL_NUM_TAXA'
          DataSource = datm_cliente_faturamento.ds_receita_imp
          TabOrder = 0
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedt_vl_den_taxa: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_TAXA'
          DataSource = datm_cliente_faturamento.ds_receita_imp
          MaxLength = 4
          TabOrder = 1
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_vl_den_taxaExit
        end
        object dbedt_calc_taxa: TDBEdit
          Left = 129
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Taxa'
          DataSource = datm_cliente_faturamento.ds_receita_imp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_taxaChange
        end
        object dblckbox_base_calc_taxa: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_TAXA'
          DataSource = datm_cliente_faturamento.ds_receita_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_cliente_faturamento.ds_base_calc_imp
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
          DataSource = datm_cliente_faturamento.ds_receita_imp
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
          DataSource = datm_cliente_faturamento.ds_receita_imp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_min: TPanel
        Left = 4
        Top = 161
        Width = 125
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 4
        object Label10: TLabel
          Left = 75
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
        object dbedt_vl_num_min: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_MIN'
          DataSource = datm_cliente_faturamento.ds_receita_imp
          TabOrder = 0
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedt_vl_den_min: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MIN'
          DataSource = datm_cliente_faturamento.ds_receita_imp
          MaxLength = 4
          TabOrder = 1
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_vl_den_minExit
        end
      end
      object pnl_max: TPanel
        Left = 4
        Top = 210
        Width = 125
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 5
        object Label14: TLabel
          Left = 75
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
        object dbedt_vl_num_max: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_MAX'
          DataSource = datm_cliente_faturamento.ds_receita_imp
          TabOrder = 0
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedt_vl_den_max: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MAX'
          DataSource = datm_cliente_faturamento.ds_receita_imp
          MaxLength = 4
          TabOrder = 1
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_vl_den_maxExit
        end
      end
      object dbgrd_reg_trib: TDBGrid
        Left = 421
        Top = 13
        Width = 196
        Height = 55
        DataSource = datm_cliente_faturamento.ds_receita_imp
        Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 11
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
      object pnlFaixasImp: TPanel
        Left = 360
        Top = 115
        Width = 255
        Height = 156
        BevelOuter = bvLowered
        TabOrder = 3
        Visible = False
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 254
          Height = 42
          BevelOuter = bvNone
          TabOrder = 0
          object btnIncluirFaixaImp: TSpeedButton
            Left = 142
            Top = 1
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
            OnClick = btnIncluirFaixaImpClick
          end
          object btnSalvarFaixaImp: TSpeedButton
            Left = 170
            Top = 1
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
            OnClick = btnSalvarFaixaImpClick
          end
          object btnCancelarFaixaImp: TSpeedButton
            Left = 198
            Top = 1
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
            OnClick = btnCancelarFaixaImpClick
          end
          object btnExcluirFaixaImp: TSpeedButton
            Left = 226
            Top = 1
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
            OnClick = btnExcluirFaixaImpClick
          end
          object Label1: TLabel
            Left = 3
            Top = 29
            Width = 17
            Height = 13
            Caption = 'De'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 85
            Top = 29
            Width = 20
            Height = 13
            Caption = 'At'#233
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 166
            Top = 29
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
        end
        object dbgrd_Faixas_Imp: TDBGrid
          Left = 3
          Top = 67
          Width = 249
          Height = 86
          DataSource = datm_cliente_faturamento.dsFaixasImp
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'QTD_DE'
              Title.Caption = 'De'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD_ATE'
              Title.Caption = 'At'#233
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_FAIXA'
              Title.Caption = 'Valor'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end>
        end
        object dbedtImpQTD_ATE: TDBEdit
          Left = 84
          Top = 42
          Width = 68
          Height = 21
          DataField = 'QTD_ATE'
          DataSource = datm_cliente_faturamento.dsFaixasImp
          TabOrder = 2
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedtImpVL_FAIXA: TDBEdit
          Left = 165
          Top = 42
          Width = 87
          Height = 21
          DataField = 'VL_FAIXA'
          DataSource = datm_cliente_faturamento.dsFaixasImp
          TabOrder = 3
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedtImpQTD_DE: TDBEdit
          Left = 4
          Top = 43
          Width = 68
          Height = 21
          DataField = 'QTD_DE'
          DataSource = datm_cliente_faturamento.dsFaixasImp
          TabOrder = 4
          OnChange = dbedt_vl_num_taxaChange
        end
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
      object dbedt_nm_cliente4: TDBEdit
        Left = 4
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCliente'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 10
      end
      object dbedt_nm_servico4: TDBEdit
        Left = 4
        Top = 49
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookServico'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 11
      end
      object dbedt_nm_unid_neg4: TDBEdit
        Left = 210
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookUnidNeg'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 12
      end
      object dbedt_nm_item3: TDBEdit
        Left = 210
        Top = 49
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItem'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 13
      end
      object dbedt_nm_produto4: TDBEdit
        Left = 419
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookProduto'
        DataSource = datm_cliente_faturamento.ds_cliente_faturamento
        ReadOnly = True
        TabOrder = 14
      end
      object dblck_box_in_ativo2: TDBLookupComboBox
        Left = 567
        Top = 85
        Width = 50
        Height = 21
        DataField = 'IN_ATIVO'
        DataSource = datm_cliente_faturamento.ds_receita_exp
        DropDownRows = 3
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_cliente_faturamento.ds_yesno
        TabOrder = 4
        OnClick = dbedt_vl_num_taxa2Change
      end
      object dbedt_pc_reduc_re_canc: TDBEdit
        Left = 500
        Top = 85
        Width = 61
        Height = 21
        DataField = 'PC_REDUC_RE_CANC'
        DataSource = datm_cliente_faturamento.ds_receita_exp
        MaxLength = 6
        TabOrder = 3
        OnChange = dbedt_vl_num_taxa2Change
      end
      object dblckbox_tp_faixa_valor: TDBLookupComboBox
        Left = 355
        Top = 85
        Width = 142
        Height = 21
        DataField = 'TP_FAIXA_VALOR'
        DataSource = datm_cliente_faturamento.ds_receita_exp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'TP_FAIXA_VALOR'
        ListField = 'NM_TP_FAIXA_VALOR'
        ListSource = datm_cliente_faturamento.ds_tp_faixa_valor
        TabOrder = 2
        OnClick = dbedt_vl_num_taxa2Change
      end
      object dblckbox_tp_faixa: TDBLookupComboBox
        Left = 210
        Top = 85
        Width = 142
        Height = 21
        DataField = 'TP_FAIXA'
        DataSource = datm_cliente_faturamento.ds_receita_exp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'TP_FAIXA'
        ListField = 'NM_TP_FAIXA'
        ListSource = datm_cliente_faturamento.ds_tp_faixa
        TabOrder = 1
        OnClick = dblckbox_tp_faixaClick
      end
      object dblckbox_regime_trib2: TDBLookupComboBox
        Left = 4
        Top = 85
        Width = 197
        Height = 21
        DataField = 'TP_DT_BASE'
        DataSource = datm_cliente_faturamento.ds_receita_exp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'CD_DT_BASE'
        ListField = 'NM_DT_BASE'
        ListSource = datm_cliente_faturamento.ds_dt_base
        TabOrder = 0
        OnClick = dbedt_vl_num_taxa2Change
      end
      object pnl_taxa2: TPanel
        Left = 4
        Top = 112
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 5
        Visible = False
        object Label3: TLabel
          Left = 75
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
          Left = 219
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
          Width = 68
          Height = 21
          DataField = 'VL_NUM_TAXA'
          DataSource = datm_cliente_faturamento.ds_receita_exp
          TabOrder = 0
          OnChange = dbedt_vl_num_taxa2Change
        end
        object dbedt_vl_den_taxa2: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_TAXA'
          DataSource = datm_cliente_faturamento.ds_receita_exp
          MaxLength = 4
          TabOrder = 1
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_vl_den_taxa2Exit
        end
        object dbedt_calc_taxa2: TDBEdit
          Left = 129
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Taxa2'
          DataSource = datm_cliente_faturamento.ds_receita_exp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_taxa2Change
        end
        object dblckbox_base_calc_taxa2: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_TAXA'
          DataSource = datm_cliente_faturamento.ds_receita_exp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_cliente_faturamento.ds_base_calc_exp
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
          DataSource = datm_cliente_faturamento.ds_receita_exp
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
          DataSource = datm_cliente_faturamento.ds_receita_exp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_min2: TPanel
        Left = 4
        Top = 161
        Width = 125
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 7
        object Label8: TLabel
          Left = 75
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
        object dbedt_vl_num_min2: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_MIN'
          DataSource = datm_cliente_faturamento.ds_receita_exp
          TabOrder = 0
          OnChange = dbedt_vl_num_taxa2Change
        end
        object dbedt_vl_den_min2: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MIN'
          DataSource = datm_cliente_faturamento.ds_receita_exp
          MaxLength = 4
          TabOrder = 1
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_vl_den_min2Exit
        end
      end
      object pnl_max2: TPanel
        Left = 4
        Top = 210
        Width = 125
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 8
        object Label13: TLabel
          Left = 75
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
        object dbedt_vl_num_max2: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_MAX'
          DataSource = datm_cliente_faturamento.ds_receita_exp
          TabOrder = 0
          OnChange = dbedt_vl_num_taxa2Change
        end
        object dbedt_vl_den_max2: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MAX'
          DataSource = datm_cliente_faturamento.ds_receita_exp
          MaxLength = 4
          TabOrder = 1
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_vl_den_max2Exit
        end
      end
      object btn_faixas: TButton
        Left = 254
        Top = 276
        Width = 96
        Height = 23
        Caption = '&Faixas de Taxas'
        TabOrder = 9
        Visible = False
        OnClick = btn_faixasClick
      end
      object pnlFaixasExp: TPanel
        Left = 360
        Top = 115
        Width = 255
        Height = 156
        BevelOuter = bvLowered
        TabOrder = 6
        Visible = False
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 254
          Height = 42
          BevelOuter = bvNone
          TabOrder = 0
          object btnIncluirFaixaExp: TSpeedButton
            Left = 142
            Top = 1
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
            OnClick = btnIncluirFaixaExpClick
          end
          object btnSalvarFaixaExp: TSpeedButton
            Left = 170
            Top = 1
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
            OnClick = btnSalvarFaixaExpClick
          end
          object btnCancelarFaixaExp: TSpeedButton
            Left = 198
            Top = 1
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
            OnClick = btnCancelarFaixaExpClick
          end
          object btnExcluirFaixaExp: TSpeedButton
            Left = 226
            Top = 1
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
            OnClick = btnExcluirFaixaExpClick
          end
          object Label9: TLabel
            Left = 3
            Top = 29
            Width = 17
            Height = 13
            Caption = 'De'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 85
            Top = 29
            Width = 20
            Height = 13
            Caption = 'At'#233
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 166
            Top = 29
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
        end
        object dbgrd_Faixas_Exp: TDBGrid
          Left = 3
          Top = 67
          Width = 249
          Height = 86
          DataSource = datm_cliente_faturamento.dsFaixasImp
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'QTD_DE'
              Title.Caption = 'De'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD_ATE'
              Title.Caption = 'At'#233
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_FAIXA'
              Title.Caption = 'Valor'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end>
        end
        object dbedtExpQTD_ATE: TDBEdit
          Left = 84
          Top = 42
          Width = 68
          Height = 21
          DataField = 'QTD_ATE'
          DataSource = datm_cliente_faturamento.dsFaixasImp
          TabOrder = 2
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedtExpVL_FAIXA: TDBEdit
          Left = 165
          Top = 42
          Width = 87
          Height = 21
          DataField = 'VL_FAIXA'
          DataSource = datm_cliente_faturamento.dsFaixasImp
          TabOrder = 3
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedtExpQTD_DE: TDBEdit
          Left = 4
          Top = 43
          Width = 68
          Height = 21
          DataField = 'QTD_DE'
          DataSource = datm_cliente_faturamento.dsFaixasImp
          TabOrder = 4
          OnChange = dbedt_vl_num_taxaChange
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 566
    Top = 22
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
