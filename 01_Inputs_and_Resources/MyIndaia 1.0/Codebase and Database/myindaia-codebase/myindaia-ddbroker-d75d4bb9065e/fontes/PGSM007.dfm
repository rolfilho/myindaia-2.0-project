object frm_faixas_ensaio: Tfrm_faixas_ensaio
  Left = 65
  Top = 101
  Width = 640
  Height = 480
  Caption = 'Cadasto de Faixas de Taxas para Ensaio de Receitas'
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
      DataSource = datm_faixas.ds_receita_exp_faixa
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Próximo'
        'Último')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      BeforeAction = dbnvgBeforeAction
    end
  end
  object pgctrl_ensaio_exp_faixa: TPageControl
    Left = 0
    Top = 48
    Width = 629
    Height = 385
    ActivePage = ts_lista
    TabOrder = 1
    object ts_lista: TTabSheet
      Caption = '    Lista    '
      object lbl_cliente: TLabel
        Left = 12
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
        Left = 12
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
        Left = 12
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
        Left = 12
        Top = 118
        Width = 44
        Height = 13
        Caption = 'Serviço'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_item: TLabel
        Left = 12
        Top = 158
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
      object dbg_cadastro: TDBGrid
        Left = 12
        Top = 199
        Width = 595
        Height = 156
        Color = clWhite
        DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
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
            FieldName = 'NR_FAIXA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'VL_INICIO_FAIXA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'VL_FIM_FAIXA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end>
      end
      object dbedt_cd_cliente: TDBEdit
        Left = 12
        Top = 22
        Width = 41
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_CLIENTE'
        DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
        MaxLength = 5
        ReadOnly = True
        TabOrder = 1
      end
      object dbedt_nm_cliente: TDBEdit
        Left = 57
        Top = 22
        Width = 313
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCliente'
        DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
        MaxLength = 50
        ReadOnly = True
        TabOrder = 2
      end
      object dbedt_cd_unid_neg: TDBEdit
        Left = 12
        Top = 58
        Width = 33
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_UNID_NEG'
        DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
        MaxLength = 2
        ReadOnly = True
        TabOrder = 3
      end
      object dbedt_nm_unid_neg: TDBEdit
        Left = 57
        Top = 58
        Width = 313
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookUnidNeg'
        DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
        ReadOnly = True
        TabOrder = 4
      end
      object dbedt_cd_produto: TDBEdit
        Left = 12
        Top = 95
        Width = 33
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_PRODUTO'
        DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
        MaxLength = 2
        ReadOnly = True
        TabOrder = 5
      end
      object dbedt_nm_produto: TDBEdit
        Left = 57
        Top = 95
        Width = 313
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookProduto'
        DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_cd_servico: TDBEdit
        Left = 12
        Top = 133
        Width = 33
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_SERVICO'
        DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
        MaxLength = 3
        ReadOnly = True
        TabOrder = 7
      end
      object dbedt_nm_servico: TDBEdit
        Left = 57
        Top = 133
        Width = 313
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookServico'
        DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
        ReadOnly = True
        TabOrder = 8
      end
      object dbedt_cd_item: TDBEdit
        Left = 12
        Top = 173
        Width = 33
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_ITEM'
        DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
        MaxLength = 3
        ReadOnly = True
        TabOrder = 9
      end
      object dbedt_nm_item: TDBEdit
        Left = 57
        Top = 173
        Width = 313
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItem'
        DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
        ReadOnly = True
        TabOrder = 10
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '   Dados Básicos   '
      object pnl_entrada_de_dados: TPanel
        Left = 2
        Top = 4
        Width = 618
        Height = 345
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_cliente2: TLabel
          Left = 14
          Top = 3
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
          Top = 41
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
        object lbl_servico2: TLabel
          Left = 14
          Top = 115
          Width = 44
          Height = 13
          Caption = 'Serviço'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_fim_faixa: TLabel
          Left = 111
          Top = 226
          Width = 72
          Height = 13
          Caption = 'Fim da Faixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_inicio_faixa: TLabel
          Left = 14
          Top = 226
          Width = 86
          Height = 13
          Caption = 'Início da Faixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_item2: TLabel
          Left = 14
          Top = 152
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
        object lbl_nr_faixa: TLabel
          Left = 14
          Top = 190
          Width = 49
          Height = 13
          Caption = 'Nº Faixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_cliente2: TDBEdit
          Left = 14
          Top = 19
          Width = 41
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_CLIENTE'
          DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
          MaxLength = 5
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_nm_cliente2: TDBEdit
          Left = 59
          Top = 19
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCliente'
          DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
          MaxLength = 50
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_cd_unid_neg2: TDBEdit
          Left = 14
          Top = 55
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_UNID_NEG'
          DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
          MaxLength = 2
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_nm_unid_neg2: TDBEdit
          Left = 59
          Top = 55
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidNeg'
          DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_produto2: TDBEdit
          Left = 14
          Top = 92
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_PRODUTO'
          DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
          MaxLength = 2
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_nm_produto2: TDBEdit
          Left = 59
          Top = 92
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookProduto'
          DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_cd_servico2: TDBEdit
          Left = 14
          Top = 130
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_SERVICO'
          DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
          MaxLength = 3
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_nm_servico2: TDBEdit
          Left = 59
          Top = 130
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookServico'
          DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_fim_faixa: TDBEdit
          Left = 111
          Top = 240
          Width = 77
          Height = 21
          DataField = 'VL_FIM_FAIXA'
          DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
          MaxLength = 3
          TabOrder = 1
        end
        object dbedt_inicio_faixa: TDBEdit
          Left = 14
          Top = 240
          Width = 83
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_INICIO_FAIXA'
          DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
          MaxLength = 3
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
        end
        object dbedt_cd_item2: TDBEdit
          Left = 14
          Top = 167
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_ITEM'
          DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
          MaxLength = 3
          ReadOnly = True
          TabOrder = 12
        end
        object dbedt_nm_item2: TDBEdit
          Left = 59
          Top = 167
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookItem'
          DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_nr_faixa: TDBEdit
          Left = 14
          Top = 204
          Width = 34
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_FAIXA'
          DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
          MaxLength = 2
          ReadOnly = True
          TabOrder = 2
        end
        object pnl_taxa: TPanel
          Left = 14
          Top = 279
          Width = 595
          Height = 45
          BevelOuter = bvLowered
          TabOrder = 3
          object Label2: TLabel
            Left = 68
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
            Left = 181
            Top = 3
            Width = 75
            Height = 13
            Caption = 'Base Cálculo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_moeda_taxa: TLabel
            Left = 307
            Top = 3
            Width = 80
            Height = 13
            Caption = 'Moeda/Índice'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_taxa: TLabel
            Left = 3
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
            Left = 508
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
          object Label1: TLabel
            Left = 527
            Top = 3
            Width = 65
            Height = 13
            Caption = 'Por B.Calc.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_vl_num_taxa: TDBEdit
            Left = 3
            Top = 19
            Width = 64
            Height = 21
            DataField = 'VL_NUM_FAIXA'
            DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
            TabOrder = 0
            OnChange = dbedt_vl_num_taxaChange
          end
          object dbedt_vl_den_taxa: TDBEdit
            Left = 75
            Top = 19
            Width = 33
            Height = 21
            DataField = 'VL_DEN_FAIXA'
            DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
            MaxLength = 4
            TabOrder = 1
            OnChange = dbedt_vl_num_taxaChange
          end
          object dbedt_calc_taxa: TDBEdit
            Left = 110
            Top = 19
            Width = 70
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Calc_Taxa'
            DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
            ReadOnly = True
            TabOrder = 4
            OnChange = dbedt_calc_taxaChange
          end
          object dblckbox_base_calc_taxa: TDBLookupComboBox
            Left = 181
            Top = 19
            Width = 124
            Height = 21
            DataField = 'TP_BASE_CALC_FAIXA'
            DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
            DropDownRows = 4
            DropDownWidth = 120
            Enabled = False
            KeyField = 'CD_BASE_CALCULO'
            ListField = 'NM_BASE_CALCULO'
            ListSource = datm_faixas_ensaio.ds_base_calculo
            TabOrder = 2
            TabStop = False
            OnClick = dblckbox_base_calc_taxaClick
          end
          object dbedt_cd_moeda_taxa: TDBEdit
            Left = 306
            Top = 19
            Width = 33
            Height = 21
            TabStop = False
            Color = clWhite
            DataField = 'CD_MOEDA_FAIXA'
            DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
            MaxLength = 3
            ReadOnly = True
            TabOrder = 3
            OnChange = dbedt_vl_num_taxaChange
            OnExit = dbedt_cd_moeda_taxaExit
            OnKeyDown = dbedt_cd_moeda_taxaKeyDown
          end
          object dbedt_nm_moeda_taxa: TDBEdit
            Left = 342
            Top = 19
            Width = 163
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookMoedaFaixa'
            DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
            ReadOnly = True
            TabOrder = 5
          end
          object dblkpcbox_por_base_calc: TDBLookupComboBox
            Left = 535
            Top = 18
            Width = 54
            Height = 21
            DataField = 'TP_POR_BASE_CALC'
            DataSource = datm_faixas_ensaio.ds_ensaio_exp_faixa
            DropDownRows = 3
            KeyField = 'CD_YESNO'
            ListField = 'TX_YESNO'
            ListSource = datm_faixas_ensaio.ds_yesno
            TabOrder = 6
            OnClick = dbedt_vl_num_taxaChange
          end
        end
      end
    end
  end
  object pnl_pesquisa: TPanel
    Left = 320
    Top = 0
    Width = 309
    Height = 44
    BevelOuter = bvLowered
    TabOrder = 2
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
    end
  end
  object menu_cadastro: TMainMenu
    Left = 563
    Top = 83
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
