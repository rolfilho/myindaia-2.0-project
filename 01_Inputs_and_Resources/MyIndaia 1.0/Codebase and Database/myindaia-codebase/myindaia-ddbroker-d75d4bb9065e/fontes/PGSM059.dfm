object frm_item: Tfrm_item
  Left = 379
  Top = 89
  Width = 750
  Height = 550
  Caption = 'Cadastro de Itens'
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
    Height = 51
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 39
      Height = 43
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
      Left = 122
      Top = 4
      Width = 39
      Height = 43
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
      Width = 39
      Height = 43
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
      Left = 44
      Top = 4
      Width = 39
      Height = 43
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
      Left = 83
      Top = 4
      Width = 39
      Height = 43
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
    object btn_imprimir: TSpeedButton
      Left = 161
      Top = 4
      Width = 39
      Height = 43
      Hint = 'Imprimir'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_imprimirClick
    end
    object btn_duplicar: TSpeedButton
      Left = 200
      Top = 4
      Width = 39
      Height = 43
      Hint = 'Duplicar Item X '#193'rea'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFFCCCCCF333333333377777F33FFFFFFFFCC
        CCCF33333333337F337F333FFFFFFFCCCCCF33333333337F337F3333FFFFFFCC
        CCCF33333333337FFF7F33333FFFFFCCCCCF3333333333777773333333FFFFFF
        FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
        00FF33333333333777FF333333333F00000F33FFFFF33777777F3CCCCC333000
        0000377777F3377777773CCCCC33333000FF37F337F3333777F33CCCCC333330
        00FF37F337F3333777F33CCCCC33333000FF37FFF7F333F777333CCCCC333000
        03FF3777773337777333333333333333333F3333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_duplicarClick
    end
    object dbnvg: TDBNavigator
      Left = 281
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_item.ds_item
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
      Left = 439
      Top = 2
      Width = 301
      Height = 47
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      object lbl_pesquisa: TLabel
        Left = 6
        Top = 7
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
        Left = 142
        Top = 7
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
        Left = 6
        Top = 20
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
        OnKeyDown = edt_chaveKeyDown
      end
      object cb_ordem: TComboBox
        Left = 142
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
  object pgctrl_item: TPageControl
    Left = 0
    Top = 51
    Width = 742
    Height = 453
    ActivePage = ts_dados_basicos
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_itemChange
    OnChanging = pgctrl_itemChanging
    object ts_lista: TTabSheet
      Caption = '    Lista    '
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 425
        Align = alClient
        Color = clWhite
        DataSource = datm_item.ds_item
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
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
            FieldName = 'CD_ITEM'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ITEM'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 452
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
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'look_nm_tipo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 103
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '   Dados B'#225'sicos   '
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 425
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object shp1: TShape
          Left = 15
          Top = 142
          Width = 698
          Height = 99
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Bevel1: TBevel
          Left = 237
          Top = 301
          Width = 377
          Height = 108
          Shape = bsFrame
        end
        object lbl_nm_item: TLabel
          Left = 76
          Top = 13
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
        object lbl_cd_item: TLabel
          Left = 15
          Top = 13
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
        object lblAtivo: TLabel
          Left = 319
          Top = 152
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
        object lbl_tipo_item: TLabel
          Left = 15
          Top = 95
          Width = 72
          Height = 13
          Caption = 'Tipo do Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 402
          Top = 13
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
        object Label2: TLabel
          Left = 15
          Top = 54
          Width = 43
          Height = 13
          Caption = 'Apelido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_item_di: TLabel
          Left = 415
          Top = 152
          Width = 42
          Height = 13
          Caption = 'Item DI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cpmf: TLabel
          Left = 511
          Top = 152
          Width = 75
          Height = 13
          Caption = 'Cobrar CPMF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ct_contabil: TLabel
          Left = 120
          Top = 250
          Width = 84
          Height = 13
          Caption = 'Conta Cont'#225'bil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ct_contabil: TSpeedButton
          Left = 598
          Top = 262
          Width = 25
          Height = 23
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
          OnClick = btn_co_ct_contabilClick
        end
        object lbl_acesso: TLabel
          Left = 15
          Top = 250
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
          Left = 71
          Top = 250
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
        object lbl_reemb: TLabel
          Left = 27
          Top = 195
          Width = 59
          Height = 13
          Caption = 'Rel. BASF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_diversos: TLabel
          Left = 221
          Top = 195
          Width = 82
          Height = 13
          Caption = 'Div. na Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_calcula_ir: TLabel
          Left = 319
          Top = 195
          Width = 60
          Height = 13
          Caption = 'Calcula IR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nr_ordem_fat: TLabel
          Left = 415
          Top = 195
          Width = 95
          Height = 13
          Caption = 'Ordem na Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ct_gerencial: TSpeedButton
          Left = 363
          Top = 108
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
          OnClick = btn_co_ct_gerencialClick
        end
        object lbl_ct_gerencial: TLabel
          Left = 178
          Top = 95
          Width = 92
          Height = 13
          Caption = 'Conta Gerencial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 27
          Top = 152
          Width = 58
          Height = 13
          Caption = 'Tribut'#225'vel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_solic_pagto: TLabel
          Left = 124
          Top = 152
          Width = 70
          Height = 13
          Caption = 'Solic. Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 221
          Top = 152
          Width = 78
          Height = 13
          Caption = 'Desp. Alfand.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 124
          Top = 195
          Width = 90
          Height = 13
          Caption = 'Reemb. Financ.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 253
          Top = 317
          Width = 77
          Height = 13
          Caption = 'Tipo de Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 253
          Top = 357
          Width = 140
          Height = 13
          Caption = 'Tipo de Base de C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 448
          Top = 317
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
        object lb_sigla_iata: TLabel
          Left = 448
          Top = 357
          Width = 61
          Height = 13
          Caption = 'Sigla IATA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 402
          Top = 95
          Width = 83
          Height = 13
          Caption = 'Tipo Item SGA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nm_item: TDBEdit
          Left = 77
          Top = 26
          Width = 308
          Height = 21
          DataField = 'NM_ITEM'
          DataSource = datm_item.ds_item
          TabOrder = 1
        end
        object dbedt_cd_item: TDBEdit
          Left = 15
          Top = 26
          Width = 50
          Height = 21
          DataField = 'CD_ITEM'
          DataSource = datm_item.ds_item
          TabOrder = 0
        end
        object dblkpcbox_ativo: TDBLookupComboBox
          Left = 319
          Top = 165
          Width = 83
          Height = 21
          DataField = 'IN_ATIVO'
          DataSource = datm_item.ds_item
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_item.ds_yesno
          TabOrder = 10
        end
        object dblckbox_tipo_item: TDBLookupComboBox
          Left = 15
          Top = 108
          Width = 147
          Height = 21
          DataField = 'CD_TIPO_ITEM'
          DataSource = datm_item.ds_item
          KeyField = 'CD_TIPO_ITEM'
          ListField = 'NM_TIPO_ITEM'
          ListSource = datm_item.ds_tipo_item
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
        end
        object dbedt_nm_ingles: TDBEdit
          Left = 402
          Top = 26
          Width = 306
          Height = 21
          DataField = 'NM_ITEM_INGLES'
          DataSource = datm_item.ds_item
          TabOrder = 2
        end
        object dbedt_nm_apelido: TDBEdit
          Left = 15
          Top = 67
          Width = 306
          Height = 21
          DataField = 'NM_APELIDO'
          DataSource = datm_item.ds_item
          TabOrder = 3
        end
        object dblckpbox_item_di: TDBLookupComboBox
          Left = 415
          Top = 165
          Width = 83
          Height = 21
          DataField = 'IN_ITEM_DI'
          DataSource = datm_item.ds_item
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_item.ds_yesno
          TabOrder = 11
        end
        object dblckpbox_cmpf: TDBLookupComboBox
          Left = 511
          Top = 165
          Width = 83
          Height = 21
          DataField = 'IN_CPMF'
          DataSource = datm_item.ds_item
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_item.ds_yesno
          TabOrder = 12
        end
        object dblckpbox_reembolso: TDBLookupComboBox
          Left = 27
          Top = 208
          Width = 83
          Height = 21
          DataField = 'IN_REEMBOLSO'
          DataSource = datm_item.ds_item
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_item.ds_yesno
          TabOrder = 13
        end
        object dblckpbox_diversos: TDBLookupComboBox
          Left = 221
          Top = 208
          Width = 83
          Height = 21
          DataField = 'IN_DIVERSOS'
          DataSource = datm_item.ds_item
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_item.ds_yesno
          TabOrder = 15
        end
        object dblckpbox_calcula_ir: TDBLookupComboBox
          Left = 319
          Top = 208
          Width = 83
          Height = 21
          DataField = 'IN_CALCULA_IR'
          DataSource = datm_item.ds_item
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_item.ds_yesno
          TabOrder = 16
        end
        object dbedt_nr_ordem_fat: TDBEdit
          Left = 415
          Top = 208
          Width = 83
          Height = 21
          DataField = 'NR_ORDEM_FAT'
          DataSource = datm_item.ds_item
          MaxLength = 3
          TabOrder = 17
          OnEnter = dbedt_cd_auxEnter
          OnExit = dbedt_cd_auxExit
        end
        object dbedt_nm_ct_gerencial: TDBEdit
          Left = 224
          Top = 108
          Width = 139
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCtGerencial'
          DataSource = datm_item.ds_item
          MaxLength = 120
          ReadOnly = True
          TabOrder = 6
        end
        object dblckpbox_tributavel: TDBLookupComboBox
          Left = 27
          Top = 165
          Width = 83
          Height = 21
          DataField = 'IN_TRIBUTAVEL'
          DataSource = datm_item.ds_item
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_item.ds_yesno
          TabOrder = 7
        end
        object dblckpbox_in_solic_pagto: TDBLookupComboBox
          Left = 124
          Top = 165
          Width = 83
          Height = 21
          DataField = 'IN_SOLIC_PAGTO'
          DataSource = datm_item.ds_item
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_item.ds_yesno
          TabOrder = 8
        end
        object dblckpbox_in_desp_alf: TDBLookupComboBox
          Left = 221
          Top = 165
          Width = 83
          Height = 21
          DataField = 'IN_DESP_ALF'
          DataSource = datm_item.ds_item
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_item.ds_yesno
          TabOrder = 9
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 124
          Top = 208
          Width = 83
          Height = 21
          DataField = 'IN_REEMB_FINANC'
          DataSource = datm_item.ds_item
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_item.ds_yesno
          TabOrder = 14
        end
        object dbedt_cd_ct_contabil: TDBEdit
          Left = 120
          Top = 263
          Width = 95
          Height = 21
          DataField = 'CD_CT_CONTABIL'
          DataSource = datm_item.ds_item
          TabOrder = 20
          OnChange = btn_co_ct_contabilClick
          OnExit = dbedt_cd_ct_contabilExit
          OnKeyDown = dbedt_cd_ct_contabilKeyDown
        end
        object dbedt_cd_ct_gerencial: TDBEdit
          Left = 178
          Top = 108
          Width = 47
          Height = 21
          DataField = 'CD_CT_GERENCIAL'
          DataSource = datm_item.ds_item
          TabOrder = 5
          OnExit = dbedt_cd_ct_gerencialExit
          OnKeyDown = dbedt_cd_ct_contabilKeyDown
        end
        object rdbgoup_tp_item: TDBRadioGroup
          Left = 15
          Top = 296
          Width = 211
          Height = 113
          Caption = 'Classifica'#231#227'o do Item'
          DataField = 'TP_ITEM'
          DataSource = datm_item.ds_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Desembara'#231'o'
            'Agencimento'
            'Agenciamento/Desembara'#231'o')
          ParentFont = False
          TabOrder = 22
          Values.Strings = (
            '0'
            '1'
            '2')
        end
        object dbluckup_tipo_base_calculo: TDBLookupComboBox
          Left = 255
          Top = 371
          Width = 175
          Height = 21
          DataField = 'TP_BASE_CALCULO'
          DataSource = datm_item.ds_item
          KeyField = 'CD_TP_BASE_CALC_FRETE'
          ListField = 'NM_TP_BASE_CALC_FRETE'
          ListSource = datm_item.ds_base_calc_frete
          TabOrder = 25
        end
        object dbcombo_via_transp: TRxDBComboBox
          Left = 448
          Top = 331
          Width = 145
          Height = 21
          Style = csDropDownList
          DataField = 'CD_VIA_TRANSPORTE'
          DataSource = datm_item.ds_item
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'A'#233'rea'
            'Mar'#237'tima'
            'Ambos')
          TabOrder = 24
          Values.Strings = (
            '04'
            '01'
            '10')
        end
        object dbedt_sigla_iata: TDBEdit
          Left = 448
          Top = 371
          Width = 41
          Height = 21
          DataField = 'CD_IATA'
          DataSource = datm_item.ds_item
          TabOrder = 26
        end
        object dbluckup_tipo_frete: TRxDBComboBox
          Left = 255
          Top = 331
          Width = 175
          Height = 21
          Style = csDropDownList
          DataField = 'TP_FRETE'
          DataSource = datm_item.ds_item
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Collect'
            'Prepaid'
            'Ambos')
          TabOrder = 23
          Values.Strings = (
            '1'
            '2'
            '3')
        end
        object dbedt_cd_aux: TDBEdit
          Left = 70
          Top = 263
          Width = 47
          Height = 21
          DataField = 'CD_AUX'
          DataSource = datm_item.ds_item
          TabOrder = 19
          OnEnter = dbedt_cd_auxEnter
          OnExit = dbedt_cd_auxExit
        end
        object dbedt_cd_acesso: TDBEdit
          Left = 15
          Top = 263
          Width = 52
          Height = 21
          DataField = 'CD_ACESSO'
          DataSource = datm_item.ds_item
          TabOrder = 18
          OnEnter = dbedt_cd_acessoEnter
          OnExit = dbedt_cd_acessoExit
        end
        object dbedt_nm_ct_contabil: TEdit
          Left = 217
          Top = 263
          Width = 381
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 21
        end
        object RxDBComboBox1: TRxDBComboBox
          Left = 402
          Top = 108
          Width = 145
          Height = 21
          Style = csDropDownList
          DataField = 'TP_ITEM_SGA'
          DataSource = datm_item.ds_item
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '------------------------'
            'Armazenagem'
            'Honor'#225'rios'
            'Frete Reemb.'
            'Frete Rodov.'
            'Desp. Bancarias/C.O')
          TabOrder = 27
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5')
        end
        object dbNecessitaRecibo: TDBCheckBox
          Left = 515
          Top = 209
          Width = 137
          Height = 17
          Caption = 'Necessita de Recibo'
          DataField = 'IN_RECIBO'
          DataSource = datm_item.ds_item
          TabOrder = 28
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
    object ts_area: TTabSheet
      Caption = #193'reas'
      object Label7: TLabel
        Left = 12
        Top = 12
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
      object Label8: TLabel
        Left = 59
        Top = 12
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
      object pnl_ts_area_indice: TPanel
        Left = 13
        Top = 299
        Width = 709
        Height = 111
        BevelInner = bvLowered
        TabOrder = 3
        object Label4: TLabel
          Left = 85
          Top = 78
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
        object Label5: TLabel
          Left = 237
          Top = 61
          Width = 94
          Height = 13
          Caption = 'Forma de Rateio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 406
          Top = 61
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
          Left = 15
          Top = 61
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
        object btn_co_moeda: TSpeedButton
          Left = 636
          Top = 73
          Width = 25
          Height = 23
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
          OnClick = btn_co_moedaClick
        end
        object Label108: TLabel
          Left = 15
          Top = 31
          Width = 27
          Height = 13
          Caption = #193'rea'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_area: TSpeedButton
          Left = 190
          Top = 30
          Width = 25
          Height = 23
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
          OnClick = btn_co_areaClick
        end
        object Label9: TLabel
          Left = 15
          Top = 18
          Width = 27
          Height = 13
          Caption = #193'rea'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 238
          Top = 18
          Width = 132
          Height = 13
          Caption = 'Ratear somente com LI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_num_indice: TDBEdit
          Left = 15
          Top = 74
          Width = 68
          Height = 21
          DataField = 'VL_NUN_INDICE'
          DataSource = datm_item.ds_item_area_
          TabOrder = 3
          OnChange = dbedt_cd_areaChange
        end
        object dbedt_calc_indice: TDBEdit
          Left = 130
          Top = 74
          Width = 85
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CalcIndice'
          DataSource = datm_item.ds_item_area_
          MaxLength = 3
          ReadOnly = True
          TabOrder = 5
          OnChange = dbedt_calc_indiceChange
        end
        object dblckbox_forma_rateio: TDBLookupComboBox
          Left = 237
          Top = 74
          Width = 149
          Height = 21
          DataField = 'TP_RATEIO_DESP'
          DataSource = datm_item.ds_item_area_
          DropDownWidth = 120
          Enabled = False
          KeyField = 'TP_RATEIO_DESP'
          ListField = 'NM_TP_RATEIO_DESP'
          ListSource = datm_item.ds_tp_rateio_desp
          TabOrder = 6
          OnClick = dbedt_cd_areaChange
        end
        object dbedt_nm_moeda: TDBEdit
          Left = 447
          Top = 74
          Width = 188
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmMoeda'
          DataSource = datm_item.ds_item_area_
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_nm_area: TDBEdit
          Left = 51
          Top = 31
          Width = 138
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmArea'
          DataSource = datm_item.ds_item_area_
          ReadOnly = True
          TabOrder = 1
        end
        object dblckbox_ratear_li: TDBLookupComboBox
          Left = 238
          Top = 31
          Width = 148
          Height = 21
          DataField = 'IN_LI'
          DataSource = datm_item.ds_item_area_
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_item.ds_yesno
          TabOrder = 2
          OnClick = dbedt_cd_areaChange
        end
        object dbedt_cd_area: TDBEdit
          Left = 15
          Top = 31
          Width = 37
          Height = 21
          DataField = 'CD_AREA'
          DataSource = datm_item.ds_item_area_
          TabOrder = 0
          OnChange = dbedt_cd_areaChange
          OnExit = dbedt_cd_areaExit
          OnKeyDown = dbedt_cd_ct_contabilKeyDown
        end
        object dbedt_vl_den_indice: TDBEdit
          Left = 95
          Top = 74
          Width = 36
          Height = 21
          DataField = 'VL_DEN_INDICE'
          DataSource = datm_item.ds_item_area_
          MaxLength = 4
          TabOrder = 4
          OnChange = dbedt_cd_areaChange
          OnExit = dbedt_vl_den_indiceExit
        end
        object dbedt_cd_moeda: TDBEdit
          Left = 406
          Top = 74
          Width = 42
          Height = 21
          Color = clWhite
          DataField = 'CD_MOEDA_INDICE'
          DataSource = datm_item.ds_item_area_
          TabOrder = 7
          OnChange = dbedt_cd_areaChange
          OnExit = dbedt_cd_moedaExit
          OnKeyDown = dbedt_cd_ct_contabilKeyDown
        end
      end
      object dbedt_nm_item_ts_area: TDBEdit
        Left = 60
        Top = 25
        Width = 549
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_ITEM'
        DataSource = datm_item.ds_item
        ReadOnly = True
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 13
        Top = 64
        Width = 709
        Height = 220
        Color = clWhite
        DataSource = datm_item.ds_item_area_
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
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
            FieldName = 'LookNmArea'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 224
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CalcIndice'
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
            FieldName = 'LookNmRateioDesp'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookNmMoeda'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 249
            Visible = True
          end>
      end
      object dbedt_cd_item_ts_area: TDBEdit
        Left = 13
        Top = 25
        Width = 48
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_ITEM'
        DataSource = datm_item.ds_item
        ReadOnly = True
        TabOrder = 1
      end
    end
    object ts_Rateio: TTabSheet
      Caption = 'Rateio de Receita'
      ImageIndex = 3
      object Label16: TLabel
        Left = 13
        Top = 12
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
      object Label17: TLabel
        Left = 60
        Top = 12
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
      object DBEdit1: TDBEdit
        Left = 13
        Top = 25
        Width = 48
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_ITEM'
        DataSource = datm_item.ds_item
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 61
        Top = 25
        Width = 549
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_ITEM'
        DataSource = datm_item.ds_item
        ReadOnly = True
        TabOrder = 1
      end
      object DBGrid2: TDBGrid
        Left = 13
        Top = 64
        Width = 709
        Height = 220
        Color = clWhite
        DataSource = datm_item.dts_Item_Rateio
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
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
            FieldName = 'lkpNM_Unidade'
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
            FieldName = 'lkpNM_Produto'
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
            FieldName = 'lkpContabilCusto'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 13
        Top = 293
        Width = 709
        Height = 122
        BevelInner = bvLowered
        TabOrder = 3
        object lbl_cd_unid_neg: TLabel
          Left = 19
          Top = 18
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_unid_neg: TSpeedButton
          Left = 298
          Top = 34
          Width = 23
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
          OnClick = btn_co_unid_negClick
        end
        object lbl_cd_produto: TLabel
          Left = 348
          Top = 18
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
        object btn_co_produto: TSpeedButton
          Left = 568
          Top = 33
          Width = 23
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
          OnClick = btn_co_produtoClick
        end
        object Label25: TLabel
          Left = 19
          Top = 66
          Width = 92
          Height = 13
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_rateio: TSpeedButton
          Left = 298
          Top = 79
          Width = 23
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
          OnClick = btn_rateioClick
        end
        object edt_nm_unid_neg: TEdit
          Left = 54
          Top = 34
          Width = 243
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
        end
        object edt_nm_produto: TEdit
          Left = 381
          Top = 34
          Width = 185
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nm_custo: TEdit
          Left = 72
          Top = 80
          Width = 225
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_cd_ct_custo: TDBEdit
          Left = 19
          Top = 80
          Width = 49
          Height = 21
          DataField = 'CD_CT_CUSTO'
          DataSource = datm_item.dts_Item_Rateio
          TabOrder = 4
          OnChange = btn_rateioClick
          OnExit = dbedt_cd_ct_custoExit
          OnKeyDown = dbedt_cd_ct_contabilKeyDown
        end
        object msk_cd_unid_neg: TDBEdit
          Left = 19
          Top = 34
          Width = 33
          Height = 21
          DataField = 'CD_UNIDADE'
          DataSource = datm_item.dts_Item_Rateio
          TabOrder = 0
          OnChange = btn_co_unid_negClick
          OnExit = msk_cd_unid_negExit
          OnKeyDown = dbedt_cd_ct_contabilKeyDown
        end
        object msk_cd_produto: TDBEdit
          Left = 347
          Top = 34
          Width = 32
          Height = 21
          DataField = 'CD_PRODUTO'
          DataSource = datm_item.dts_Item_Rateio
          TabOrder = 2
          OnChange = btn_co_produtoClick
          OnExit = msk_cd_produtoExit
          OnKeyDown = dbedt_cd_ct_contabilKeyDown
        end
      end
    end
    object ts_Group_Services: TTabSheet
      Caption = 'Group Services'
      ImageIndex = 4
      object Label18: TLabel
        Left = 13
        Top = 12
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
      object Label19: TLabel
        Left = 60
        Top = 12
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
      object Label20: TLabel
        Left = 13
        Top = 370
        Width = 82
        Height = 13
        Caption = 'Group Service'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_group_services: TSpeedButton
        Left = 372
        Top = 386
        Width = 23
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
        OnClick = btn_group_servicesClick
      end
      object DBEdit3: TDBEdit
        Left = 13
        Top = 25
        Width = 48
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_ITEM'
        DataSource = datm_item.ds_item
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 61
        Top = 25
        Width = 549
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_ITEM'
        DataSource = datm_item.ds_item
        ReadOnly = True
        TabOrder = 1
      end
      object GridGroupServices: TDBGrid
        Left = 13
        Top = 64
        Width = 709
        Height = 297
        Color = clWhite
        DataSource = datm_item.dts_item_group_service
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
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
            FieldName = 'calcNM_GROUP_SERVICE'
            Title.Caption = 'Group Service'
            Width = 472
            Visible = True
          end>
      end
      object dbedt_nm_Group_Service: TEdit
        Left = 48
        Top = 386
        Width = 323
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
      end
      object dbedt_cd_Group_Service: TDBEdit
        Left = 13
        Top = 386
        Width = 33
        Height = 21
        DataField = 'CD_GROUP_SERVICES'
        DataSource = datm_item.dts_item_group_service
        TabOrder = 4
        OnChange = btn_group_servicesClick
        OnExit = dbedt_cd_Group_ServiceExit
        OnKeyDown = dbedt_cd_ct_contabilKeyDown
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 651
    Top = 65523
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
    object mi_duplicar: TMenuItem
      Caption = '&Duplicar'
      Enabled = False
      OnClick = btn_duplicarClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
  object crp_item: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 688
    Top = 65530
  end
end
