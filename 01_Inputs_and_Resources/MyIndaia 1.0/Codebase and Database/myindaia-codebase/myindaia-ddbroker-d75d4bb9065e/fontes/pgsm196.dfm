object frm_de_para: Tfrm_de_para
  Left = 428
  Top = 124
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Tabela De -> Para'
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
  object pgctrl_de_para: TPageControl
    Left = 0
    Top = 55
    Width = 734
    Height = 437
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_de_paraChange
    OnChanging = pgctrl_de_paraChanging
    object ts_lista: TTabSheet
      Caption = '    Lista    '
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 726
        Height = 409
        Align = alClient
        Color = clWhite
        DataSource = datm_de_para.ds_de_para
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
            FieldName = 'CD_TABELA'
            Title.Caption = 'Cod Tabela'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_UNID_NEG'
            Title.Caption = 'Unid.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_PRODUTO'
            Title.Caption = 'Produto'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookTipo'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 218
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_DDBROKER'
            Title.Caption = 'Cod Broker'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_EXTERNO'
            Title.Caption = 'Cod. Externo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 117
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CalcNmDDBroker'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = -1
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CD_GRUPO'
            Title.Caption = 'Cod Grupo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 85
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '   Dados B'#225'sicos   '
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 409
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_cd_ddbroker: TLabel
          Left = 8
          Top = 171
          Width = 99
          Height = 13
          Caption = 'C'#243'digo DDBroker'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_tabela: TLabel
          Left = 8
          Top = 128
          Width = 87
          Height = 13
          Caption = 'Tipo da Tabela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_externo: TLabel
          Left = 136
          Top = 171
          Width = 87
          Height = 13
          Caption = 'C'#243'digo Externo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_unid_neg: TLabel
          Left = 8
          Top = 8
          Width = 48
          Height = 13
          Caption = 'Unidade'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_unid_neg: TSpeedButton
          Left = 411
          Top = 23
          Width = 25
          Height = 23
          Enabled = False
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
          OnClick = btn_co_unid_negClick
        end
        object lbl_cd_produto: TLabel
          Left = 8
          Top = 50
          Width = 45
          Height = 13
          Caption = 'Produto'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_produto: TSpeedButton
          Left = 411
          Top = 65
          Width = 25
          Height = 21
          Enabled = False
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
          OnClick = btn_co_produtoClick
        end
        object btn_co_grupo: TSpeedButton
          Left = 411
          Top = 106
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
          OnClick = btn_co_grupoClick
        end
        object lbl_cd_grupo: TLabel
          Left = 9
          Top = 89
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
        object SpeedButton1: TSpeedButton
          Left = 586
          Top = 142
          Width = 29
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
          OnClick = SpeedButton1Click
        end
        object dbedt_cd_ddbroker: TDBEdit
          Left = 8
          Top = 188
          Width = 97
          Height = 21
          TabStop = False
          DataField = 'CD_DDBROKER'
          DataSource = datm_de_para.ds_de_para
          TabOrder = 5
          OnExit = dbedt_cd_ddbrokerExit
          OnKeyDown = dbedt_cd_ddbrokerKeyDown
        end
        object dblkpcbox_cd_tabela: TDBLookupComboBox
          Left = 8
          Top = 143
          Width = 160
          Height = 21
          DataField = 'CD_TABELA'
          DataSource = datm_de_para.ds_de_para
          DropDownRows = 8
          TabOrder = 3
          OnExit = dblkpcbox_cd_tabelaExit
        end
        object dbedt_cd_externo: TDBEdit
          Left = 136
          Top = 188
          Width = 161
          Height = 21
          TabStop = False
          DataField = 'CD_EXTERNO'
          DataSource = datm_de_para.ds_de_para
          TabOrder = 6
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 8
          Top = 23
          Width = 56
          Height = 21
          DataField = 'CD_UNID_NEG'
          DataSource = datm_de_para.ds_de_para
          Enabled = False
          TabOrder = 0
          OnExit = dbedt_cd_unid_negExit
          OnKeyDown = dbedt_cd_ddbrokerKeyDown
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 65
          Top = 23
          Width = 343
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmUnidNeg'
          DataSource = datm_de_para.ds_de_para
          Enabled = False
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_produto: TDBEdit
          Left = 8
          Top = 65
          Width = 56
          Height = 21
          DataField = 'CD_PRODUTO'
          DataSource = datm_de_para.ds_de_para
          Enabled = False
          TabOrder = 1
          OnExit = dbedt_cd_produtoExit
          OnKeyDown = dbedt_cd_ddbrokerKeyDown
        end
        object dbedt_nm_produto: TDBEdit
          Left = 65
          Top = 65
          Width = 343
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmProduto'
          DataSource = datm_de_para.ds_de_para
          Enabled = False
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_cd_grupo: TDBEdit
          Left = 8
          Top = 105
          Width = 56
          Height = 21
          DataField = 'CD_GRUPO'
          DataSource = datm_de_para.ds_de_para
          TabOrder = 2
          OnExit = dbedt_cd_grupoExit
          OnKeyDown = dbedt_cd_ddbrokerKeyDown
        end
        object dbedt_nm_grupo: TDBEdit
          Left = 65
          Top = 106
          Width = 343
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'lookGrupo'
          DataSource = datm_de_para.ds_de_para
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_cdtabela: TDBEdit
          Left = 181
          Top = 143
          Width = 56
          Height = 21
          DataField = 'CD_TABELA'
          DataSource = datm_de_para.ds_de_para
          TabOrder = 4
          OnExit = dbedt_cdtabelaExit
          OnKeyDown = dbedt_cd_ddbrokerKeyDown
        end
        object DBEdit2: TDBEdit
          Left = 241
          Top = 143
          Width = 343
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookTipo'
          DataSource = datm_de_para.ds_de_para
          ReadOnly = True
          TabOrder = 10
        end
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      734
      55)
    object pnl_cadastro: TPanel
      Left = 0
      Top = 5
      Width = 443
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvLowered
      TabOrder = 0
      DesignSize = (
        443
        45)
      object btn_incluir: TSpeedButton
        Left = 5
        Top = 3
        Width = 40
        Height = 40
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
        Left = 125
        Top = 3
        Width = 40
        Height = 40
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
        Left = 398
        Top = 2
        Width = 40
        Height = 40
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
        Left = 45
        Top = 3
        Width = 40
        Height = 40
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
        Left = 85
        Top = 3
        Width = 40
        Height = 40
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
        Left = 284
        Top = 11
        Width = 104
        Height = 25
        DataSource = datm_de_para.ds_de_para
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Anchors = [akTop, akRight]
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
    end
    object pnl_pesquisa: TPanel
      Left = 448
      Top = 5
      Width = 294
      Height = 45
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      TabOrder = 1
      object lbl_pesquisa: TLabel
        Left = 5
        Top = 4
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
        Left = 137
        Top = 4
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
        Left = 5
        Top = 19
        Width = 129
        Height = 21
        TabStop = False
        TabOrder = 0
        OnChange = edt_chaveChange
      end
      object cb_ordem: TComboBox
        Left = 137
        Top = 19
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
    Left = 556
    Top = 368
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
