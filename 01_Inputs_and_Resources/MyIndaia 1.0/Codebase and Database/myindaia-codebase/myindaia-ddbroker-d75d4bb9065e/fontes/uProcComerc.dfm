object frm_proc_comerc: Tfrm_proc_comerc
  Left = 294
  Top = 236
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Manuten'#231#227'o do Cliente'
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      47)
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 4
      Width = 37
      Height = 39
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
      Left = 115
      Top = 4
      Width = 37
      Height = 39
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
      Left = 403
      Top = 4
      Width = 37
      Height = 39
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
      Left = 41
      Top = 4
      Width = 37
      Height = 39
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
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 78
      Top = 4
      Width = 37
      Height = 39
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
      OnClick = btn_cancelarClick
    end
    object btn_gera_proposta: TSpeedButton
      Left = 157
      Top = 4
      Width = 37
      Height = 39
      Hint = 'Gerar Proposta ou Cota'#231#227'o'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      PopupMenu = pmGera
      ShowHint = True
      OnClick = btn_gera_propostaClick
    end
    object Label1: TLabel
      Left = 446
      Top = 6
      Width = 56
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 582
      Top = 6
      Width = 37
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Ordem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnGera: TSpeedButton
      Left = 194
      Top = 4
      Width = 14
      Height = 39
      Hint = 'Gerar Proposta ou Cota'#231#227'o'
      Caption = 'q'
      Enabled = False
      Flat = True
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Wingdings 3'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      PopupMenu = pmGera
      ShowHint = True
      OnClick = btn_gera_propostaClick
    end
    object dbnvg: TDBNavigator
      Left = 286
      Top = 12
      Width = 104
      Height = 23
      DataSource = datm_proc_comerc.ds_proc_comerc_lista
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      TabOrder = 0
    end
    object edt_chave: TEdit
      Left = 446
      Top = 18
      Width = 129
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnChange = edt_chaveChange
      OnKeyDown = edt_chaveKeyDown
    end
    object cb_ordem: TComboBox
      Left = 582
      Top = 18
      Width = 153
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
      OnClick = cb_ordemClick
    end
  end
  object pgctrl_proc_comerc: TPageControl
    Left = 0
    Top = 47
    Width = 742
    Height = 457
    ActivePage = ts_proposta
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = pgctrl_proc_comercChange
    OnChanging = pgctrl_proc_comercChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 52
        Width = 734
        Height = 377
        Align = alClient
        DataSource = datm_proc_comerc.ds_proc_comerc_lista
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
            FieldName = 'CD_EMPRESA'
            Title.Caption = 'C'#243'd.'
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
            FieldName = 'NM_EMPRESA'
            Title.Caption = 'Cliente'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 248
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CGC_EMPRESA'
            Title.Caption = 'C.N.P.J. '
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ABERTURA'
            Title.Caption = 'Abertura'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CONTATO'
            Title.Caption = 'Contato'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 160
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 52
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object btn_co_unid_neg1: TSpeedButton
          Left = 258
          Top = 22
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
          OnClick = btn_co_unid_neg1Click
        end
        object Label19: TLabel
          Left = 10
          Top = 9
          Width = 117
          Height = 13
          Caption = 'Unidade de Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 295
          Top = 9
          Width = 80
          Height = 13
          Caption = 'Data Abertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_nm_unid_neg: TEdit
          Left = 46
          Top = 22
          Width = 211
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
          TabOrder = 0
        end
        object msk_cd_unid_neg: TMaskEdit
          Left = 10
          Top = 22
          Width = 37
          Height = 21
          EditMask = '99;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 1
          OnExit = msk_cd_unid_negExit
          OnKeyDown = dbedt_cd_empresaKeyDown
        end
        object msk_dt_abertura: TMaskEdit
          Left = 295
          Top = 22
          Width = 82
          Height = 21
          EditMask = '!99/99/9999;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 2
          Text = '  /  /    '
          OnExit = msk_dt_aberturaExit
          OnKeyDown = dbedt_cd_empresaKeyDown
        end
      end
    end
    object ts_vendedores: TTabSheet
      Caption = 'Vendedores'
      ImageIndex = 4
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 204
        Align = alClient
        DataSource = datm_proc_comerc.ds_proc_vendedor
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
            FieldName = 'CD_VENDEDOR'
            Title.Caption = 'C'#243'd.'
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
            FieldName = 'NM_VENDEDOR'
            Title.Caption = 'Vendedor'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 391
            Visible = True
          end
          item
            Expanded = False
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end>
      end
      object Panel6: TPanel
        Left = 0
        Top = 204
        Width = 734
        Height = 225
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object Label5: TLabel
          Left = 14
          Top = 11
          Width = 55
          Height = 13
          Caption = 'Vendedor'
          FocusControl = dbedt_cd_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_cd_vendedor: TSpeedButton
          Left = 348
          Top = 25
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
          OnClick = btn_co_cd_vendedorClick
        end
        object Label46: TLabel
          Left = 14
          Top = 69
          Width = 179
          Height = 13
          Caption = 'Forma de C'#225'lculo Import. A'#233'rea'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label47: TLabel
          Left = 14
          Top = 96
          Width = 195
          Height = 13
          Caption = 'Forma de C'#225'lculo Import. Mar'#237'tima'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label48: TLabel
          Left = 14
          Top = 123
          Width = 180
          Height = 13
          Caption = 'Forma de C'#225'lculo Export. A'#233'rea'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label49: TLabel
          Left = 14
          Top = 151
          Width = 196
          Height = 13
          Caption = 'Forma de C'#225'lculo Export. Mar'#237'tima'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 14
          Top = 177
          Width = 180
          Height = 13
          Caption = 'Forma de C'#225'lculo Desembara'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 480
          Top = 177
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
        object Label53: TLabel
          Left = 480
          Top = 96
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
        object Label52: TLabel
          Left = 480
          Top = 70
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
        object Label51: TLabel
          Left = 480
          Top = 124
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
        object Label21: TLabel
          Left = 480
          Top = 151
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
        object dbedt_look_nm_vendedor: TDBEdit
          Left = 55
          Top = 25
          Width = 292
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_VENDEDOR'
          DataSource = datm_proc_comerc.ds_proc_vendedor
          ReadOnly = True
          TabOrder = 1
        end
        object dblkup_tp_calc_imp_ae: TDBLookupComboBox
          Left = 250
          Top = 65
          Width = 145
          Height = 21
          DataField = 'Look_tp_calc_imp_aerea'
          DataSource = datm_proc_comerc.ds_proc_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = dblkup_tp_calc_imp_aeClick
        end
        object dblkup_tp_calc_desemb: TDBLookupComboBox
          Left = 250
          Top = 175
          Width = 145
          Height = 21
          DataField = 'look_tp_calc_desembaraco'
          DataSource = datm_proc_comerc.ds_proc_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = dblkup_tp_calc_imp_aeClick
        end
        object dblkup_tp_calc_exp_ma: TDBLookupComboBox
          Left = 250
          Top = 147
          Width = 145
          Height = 21
          DataField = 'Look_tp_calc_exp_maritima'
          DataSource = datm_proc_comerc.ds_proc_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = dblkup_tp_calc_imp_aeClick
        end
        object dblkup_tp_calc_exp_ae: TDBLookupComboBox
          Left = 250
          Top = 119
          Width = 145
          Height = 21
          DataField = 'Look_tp_exp_aerea'
          DataSource = datm_proc_comerc.ds_proc_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = dblkup_tp_calc_imp_aeClick
        end
        object dblkup_tp_calc_imp_ma: TDBLookupComboBox
          Left = 250
          Top = 92
          Width = 145
          Height = 21
          DataField = 'Look_tp_calc_imp_maritima'
          DataSource = datm_proc_comerc.ds_proc_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = dblkup_tp_calc_imp_aeClick
        end
        object vl_desemb: TDBEdit
          Left = 525
          Top = 175
          Width = 136
          Height = 21
          DataField = 'VL_CALC_DESEMBARACO'
          DataSource = datm_proc_comerc.ds_proc_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnChange = dblkup_tp_calc_imp_aeClick
        end
        object vl_exp_ma: TDBEdit
          Left = 525
          Top = 147
          Width = 136
          Height = 21
          DataField = 'VL_CALC_EXP_MARITIMA'
          DataSource = datm_proc_comerc.ds_proc_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnChange = dblkup_tp_calc_imp_aeClick
        end
        object vl_exp_ae: TDBEdit
          Left = 525
          Top = 119
          Width = 136
          Height = 21
          DataField = 'VL_CALC_EXP_AEREA'
          DataSource = datm_proc_comerc.ds_proc_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnChange = dblkup_tp_calc_imp_aeClick
        end
        object vl_imp_ma: TDBEdit
          Left = 525
          Top = 92
          Width = 136
          Height = 21
          DataField = 'VL_CALC_IMP_MARITIMA'
          DataSource = datm_proc_comerc.ds_proc_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          OnChange = dblkup_tp_calc_imp_aeClick
        end
        object vl_imp_ae: TDBEdit
          Left = 525
          Top = 65
          Width = 136
          Height = 21
          DataField = 'VL_CALC_IMP_AEREA'
          DataSource = datm_proc_comerc.ds_proc_vendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          OnChange = dblkup_tp_calc_imp_aeClick
        end
        object dbedt_cd_vendedor: TDBEdit
          Left = 14
          Top = 25
          Width = 42
          Height = 21
          DataField = 'CD_VENDEDOR'
          DataSource = datm_proc_comerc.ds_proc_vendedor
          TabOrder = 0
          OnChange = dblkup_tp_calc_imp_aeClick
          OnExit = dbedt_cd_vendedorExit
          OnKeyDown = dbedt_cd_empresaKeyDown
        end
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 172
        Align = alTop
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label4: TLabel
          Left = 638
          Top = 9
          Width = 80
          Height = 13
          Caption = 'Data Abertura'
          FocusControl = dbedt_dt_abertura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 387
          Top = 126
          Width = 35
          Height = 13
          Caption = 'E-mail'
          FocusControl = dbedt_email
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 289
          Top = 9
          Width = 40
          Height = 13
          Caption = 'Cliente'
          FocusControl = dbedt_cd_empresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_cd_empresa: TSpeedButton
          Left = 602
          Top = 22
          Width = 24
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
          OnClick = btn_co_cd_empresaClick
        end
        object Label6: TLabel
          Left = 14
          Top = 126
          Width = 45
          Height = 13
          Caption = 'Contato'
          FocusControl = dbedt_contato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 491
          Top = 88
          Width = 51
          Height = 13
          Caption = 'Telefone'
          FocusControl = dbedt_look_nr_telefone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 611
          Top = 88
          Width = 21
          Height = 13
          Caption = 'Fax'
          FocusControl = dbedt_look_nr_fax
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 14
          Top = 88
          Width = 40
          Height = 13
          Caption = 'Cidade'
          FocusControl = dbedt_look_end_cidade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 176
          Top = 88
          Width = 17
          Height = 13
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 216
          Top = 88
          Width = 37
          Height = 13
          Caption = 'C.E.P.'
          FocusControl = dbedt_look_end_cep
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 587
          Top = 49
          Width = 34
          Height = 13
          Caption = 'Bairro'
          FocusControl = dbedt_look_end_bairro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 255
          Top = 49
          Width = 44
          Height = 13
          Caption = 'N'#250'mero'
          FocusControl = dbedt_look_end_numero
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 14
          Top = 49
          Width = 55
          Height = 13
          Caption = 'Endere'#231'o'
          FocusControl = dbedt_look_end_empresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 296
          Top = 88
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
        object Label20: TLabel
          Left = 13
          Top = 9
          Width = 117
          Height = 13
          Caption = 'Unidade de Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 315
          Top = 49
          Width = 104
          Height = 13
          Caption = 'Grupo Empresarial'
          FocusControl = dbedt_look_end_numero
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_dt_abertura: TDBEdit
          Left = 638
          Top = 22
          Width = 80
          Height = 21
          DataField = 'DT_ABERTURA'
          DataSource = datm_proc_comerc.ds_proc_comerc
          TabOrder = 1
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_email: TDBEdit
          Left = 387
          Top = 139
          Width = 331
          Height = 21
          DataField = 'NM_EMAIL'
          DataSource = datm_proc_comerc.ds_proc_comerc
          TabOrder = 3
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_look_nm_empresa: TDBEdit
          Left = 328
          Top = 22
          Width = 273
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_EMPRESA'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_look_nm_unid_neg: TDBEdit
          Left = 50
          Top = 22
          Width = 229
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_nm_unid_neg'
          DataSource = datm_proc_comerc.ds_proc_comerc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 14
          Top = 22
          Width = 37
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_UNID_NEG'
          DataSource = datm_proc_comerc.ds_proc_comerc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_cd_unid_negExit
          OnKeyDown = dbedt_cd_empresaKeyDown
        end
        object dbedt_contato: TDBEdit
          Left = 14
          Top = 139
          Width = 362
          Height = 21
          DataField = 'NM_CONTATO'
          DataSource = datm_proc_comerc.ds_proc_comerc
          TabOrder = 2
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_look_nr_telefone: TDBEdit
          Left = 492
          Top = 101
          Width = 109
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_TELEFONE'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_look_nr_fax: TDBEdit
          Left = 613
          Top = 101
          Width = 105
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_FAX'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 15
        end
        object dbedt_look_end_cidade: TDBEdit
          Left = 14
          Top = 101
          Width = 150
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'END_CIDADE'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_look_end_cep: TDBEdit
          Left = 217
          Top = 101
          Width = 67
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'END_CEP'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 12
        end
        object dbedt_look_nm_pais: TDBEdit
          Left = 296
          Top = 101
          Width = 185
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_PAIS'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_look_end_empresa: TDBEdit
          Left = 14
          Top = 62
          Width = 229
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'END_EMPRESA'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_look_end_numero: TDBEdit
          Left = 255
          Top = 62
          Width = 49
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'END_NUMERO'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_look_end_bairro: TDBEdit
          Left = 587
          Top = 62
          Width = 131
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'END_BAIRRO'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_look_uf: TDBEdit
          Left = 176
          Top = 101
          Width = 30
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clMenu
          DataField = 'END_UF'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_lookup_grupo: TDBEdit
          Left = 316
          Top = 62
          Width = 259
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_GRUPO'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 16
        end
        object dbedt_cd_empresa: TDBEdit
          Left = 290
          Top = 22
          Width = 39
          Height = 21
          DataField = 'CD_EMPRESA'
          DataSource = datm_proc_comerc.ds_proc_comerc
          TabOrder = 0
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_cd_empresaExit
          OnKeyDown = dbedt_cd_empresaKeyDown
        end
      end
      object pnlAgendaCliente: TPanel
        Left = 0
        Top = 172
        Width = 734
        Height = 257
        Align = alClient
        BorderWidth = 4
        TabOrder = 1
        object dbg_agenda: TDBGrid
          Left = 5
          Top = 57
          Width = 640
          Height = 195
          Align = alClient
          Ctl3D = False
          DataSource = datm_proc_comerc.ds_agenda_comerc_lista
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbg_agendaDrawColumnCell
          OnDblClick = dbg_agendaDblClick
          OnEnter = dbg_agendaEnter
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_AGENDA'
              ReadOnly = False
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CD_VENDEDOR'
              ReadOnly = False
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'IN_PERIODO'
              ReadOnly = False
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DT_AGENDA'
              ReadOnly = False
              Title.Caption = 'Data'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HR_AGENDA'
              ReadOnly = False
              Title.Caption = 'Hora'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_PROC_COMERC'
              ReadOnly = False
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'IN_CANCELADO'
              ReadOnly = False
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'OBS_AGENDA'
              ReadOnly = False
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NM_CONTATO'
              Title.Caption = 'Contato'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 232
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'look_nm_vendedor'
              Title.Caption = 'Vendedor'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 237
              Visible = True
            end>
        end
        object Panel8: TPanel
          Left = 648
          Top = 57
          Width = 81
          Height = 195
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object Shape7: TShape
            Left = 0
            Top = 20
            Width = 81
            Height = 175
            Align = alClient
          end
          object Shape1: TShape
            Left = 6
            Top = 94
            Width = 15
            Height = 16
            Brush.Color = 9671679
            Pen.Color = clGray
          end
          object Shape2: TShape
            Left = 6
            Top = 43
            Width = 15
            Height = 16
            Brush.Color = 12189625
            Pen.Color = clGray
          end
          object Shape3: TShape
            Left = 6
            Top = 77
            Width = 15
            Height = 16
            Brush.Color = 16763025
            Pen.Color = clGray
          end
          object Label26: TLabel
            Left = 24
            Top = 28
            Width = 25
            Height = 13
            Caption = 'Visita'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label31: TLabel
            Left = 23
            Top = 45
            Width = 42
            Height = 13
            Caption = 'Telefone'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label35: TLabel
            Left = 23
            Top = 62
            Width = 28
            Height = 13
            Caption = 'E-mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Shape4: TShape
            Left = 6
            Top = 60
            Width = 15
            Height = 16
            Brush.Color = 11060735
            Pen.Color = clGray
          end
          object Shape6: TShape
            Left = 6
            Top = 26
            Width = 15
            Height = 16
            Brush.Color = 14869191
            Pen.Color = clGray
          end
          object Label36: TLabel
            Left = 23
            Top = 79
            Width = 17
            Height = 13
            Caption = 'Fax'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label37: TLabel
            Left = 23
            Top = 95
            Width = 47
            Height = 13
            Caption = 'Postagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 81
            Height = 20
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Legendas'
            Color = clAppWorkSpace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Shape8: TShape
              Left = 0
              Top = 0
              Width = 81
              Height = 20
              Align = alClient
              Brush.Style = bsClear
            end
          end
        end
        object Panel2: TPanel
          Left = 5
          Top = 5
          Width = 724
          Height = 52
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            724
            52)
          object Shape5: TShape
            Left = 0
            Top = 0
            Width = 724
            Height = 20
            Align = alTop
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Label18: TLabel
            Left = 4
            Top = 4
            Width = 131
            Height = 13
            Caption = 'Agenda para o Cliente:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_incluir_agenda: TSpeedButton
            Left = 1
            Top = 24
            Width = 110
            Height = 24
            Hint = 'Nova Visita'
            Caption = 'Nova entrada'
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
            OnClick = btn_incluir_agendaClick
          end
          object btn_editar_agenda: TSpeedButton
            Left = 112
            Top = 24
            Width = 110
            Height = 24
            Hint = 'Modificar Visita'
            Caption = 'Alterar'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFF00FF
              FFFFFFFFFFFF88FFFFFFFFFFFF04774FFFFFFFFFFF88778FFFFFFFFF04778874
              FFFFFFFF88778878FFFFFFF4778FFF874FFFFFF8778FFF878FFFFFF08FF8FF88
              74FFFFF88FF8FF8878FFFFF08FFF88FF874FFFF88FFF88FF878F000008F8FF78
              F874888888F8FF78F8784400077770788884448887777F78888844FFFF877088
              F77444FFFF877F88F77840FFFF703778800048FFFF7F377888880008FF338370
              000F8888FF338378888FFFF0733800000FFFFFF8733888888FFFFFFF0000FFFF
              FFFFFFFF8888FFFFFFFFFFF00FFFFFFFFFFFFFF88FFFFFFFFFFFFF00FFFFFFFF
              FFFFFF88FFFFFFFFFFFFFF0FFFFFFFFFFFFFFF8FFFFFFFFFFFFF}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btn_editar_agendaClick
          end
          object btn_cancelar_agenda: TSpeedButton
            Left = 223
            Top = 24
            Width = 110
            Height = 24
            Hint = 'Cancelar Visita'
            Caption = 'Cancelar'
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
            OnClick = btn_cancelar_agendaClick
          end
          object DBText1: TDBText
            Left = 137
            Top = 4
            Width = 586
            Height = 16
            DataField = 'NM_EMPRESA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object SpeedButton1: TSpeedButton
            Left = 695
            Top = 22
            Width = 29
            Height = 28
            Hint = 'Maximizar / Restaurar a Agenda do Cliente'
            Anchors = [akTop, akRight]
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
              FFF07F3FF3FF3FFF3FF70F00F00F000F00F07F773773777377370FFFFFFFFFFF
              FFF07F3FF3FF33FFFFF70F00F00FF00000F07F773773377777F70FEEEEEFF0F9
              FCF07F33333337F7F7F70FFFFFFFF0F9FCF07F3FFFF337F737F70F0000FFF0FF
              FCF07F7777F337F337370F0000FFF0FFFFF07F777733373333370FFFFFFFFFFF
              FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
              C880733777777777733700000000000000007777777777777777333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton1Click
          end
          object chkRetroativo: TCheckBox
            Left = 521
            Top = 29
            Width = 116
            Height = 17
            Caption = 'Mostrar Retroativos'
            TabOrder = 0
            OnClick = chkRetroativoClick
          end
        end
        object Panel10: TPanel
          Left = 645
          Top = 57
          Width = 3
          Height = 195
          Align = alRight
          Alignment = taRightJustify
          BevelOuter = bvNone
          TabOrder = 3
        end
      end
    end
    object ts_historico: TTabSheet
      Caption = 'Hist'#243'rico'
      ImageIndex = 2
      object dbg_historico: TDBGrid
        Left = 0
        Top = 47
        Width = 734
        Height = 224
        TabStop = False
        Align = alClient
        Ctl3D = False
        DataSource = datm_proc_comerc.ds_proc_comerc_historico
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
        ParentCtl3D = False
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
            FieldName = 'CD_HIST_PROC_COMERC'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NR_PROC_COMERC'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DT_HISTORICO'
            Title.Caption = 'Data'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HR_HISTORICO'
            Title.Caption = 'Hora'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CONTATO'
            Title.Caption = 'Contato'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 149
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_tp_historico'
            Title.Caption = 'Meio de Contato'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 147
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_AGENDA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'calcVendedor'
            Title.Caption = 'Vendedor'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 250
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 47
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label33: TLabel
          Left = 359
          Top = 7
          Width = 104
          Height = 13
          Caption = 'Grupo Empresarial'
          FocusControl = dbedt_look_end_numero
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 8
          Top = 7
          Width = 40
          Height = 13
          Caption = 'Cliente'
          FocusControl = dbedt_cd_cliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nm_grupo: TDBEdit
          Left = 360
          Top = 19
          Width = 361
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_GRUPO'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nm_cliente: TDBEdit
          Left = 50
          Top = 19
          Width = 299
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_EMPRESA'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_cliente: TDBEdit
          Left = 9
          Top = 19
          Width = 42
          Height = 21
          Color = clMenu
          DataField = 'CD_EMPRESA'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 2
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 271
        Width = 734
        Height = 158
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 2
        object Label27: TLabel
          Left = 12
          Top = 8
          Width = 28
          Height = 13
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 91
          Top = 8
          Width = 28
          Height = 13
          Caption = 'Hora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 150
          Top = 8
          Width = 45
          Height = 13
          Caption = 'Contato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 545
          Top = 8
          Width = 94
          Height = 13
          Caption = 'Meio de Contato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 12
          Top = 44
          Width = 124
          Height = 13
          Caption = 'Assunto e Coment'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_dt_historico: TDBEdit
          Left = 12
          Top = 20
          Width = 68
          Height = 21
          DataField = 'DT_HISTORICO'
          DataSource = datm_proc_comerc.ds_proc_comerc_historico
          MaxLength = 10
          TabOrder = 0
          OnChange = dbedt_cd_hist_proc_comercChange
        end
        object dbedt_hr_historico: TDBEdit
          Left = 91
          Top = 20
          Width = 50
          Height = 21
          DataField = 'HR_HISTORICO'
          DataSource = datm_proc_comerc.ds_proc_comerc_historico
          TabOrder = 1
          OnChange = dbedt_cd_hist_proc_comercChange
        end
        object dbedt_nm_contato: TDBEdit
          Left = 151
          Top = 20
          Width = 384
          Height = 21
          DataField = 'NM_CONTATO'
          DataSource = datm_proc_comerc.ds_proc_comerc_historico
          TabOrder = 2
          OnChange = dbedt_cd_hist_proc_comercChange
        end
        object dbedt_nm_historico: TRxDBComboBox
          Left = 546
          Top = 20
          Width = 177
          Height = 21
          Style = csDropDownList
          DataField = 'NM_HISTORICO'
          DataSource = datm_proc_comerc.ds_proc_comerc_historico
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Visita'
            'Telefone'
            'E-mail'
            'Fax'
            'Postagem')
          TabOrder = 3
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4')
          OnChange = dbedt_cd_hist_proc_comercChange
        end
        object dbmemo_tx_obs_historico: TDBMemo
          Left = 11
          Top = 56
          Width = 712
          Height = 94
          DataField = 'TX_OBS_HISTORICO'
          DataSource = datm_proc_comerc.ds_proc_comerc_historico
          TabOrder = 4
          OnChange = dbedt_cd_hist_proc_comercChange
        end
      end
    end
    object ts_proposta: TTabSheet
      Caption = 'Propostas e Cota'#231#245'es Geradas'
      ImageIndex = 3
      object DBGrid1: TDBGrid
        Left = 0
        Top = 54
        Width = 734
        Height = 375
        Hint = 'Duplo-clique para abrir Proposta ou Cota'#231#227'o'
        Align = alClient
        DataSource = datm_proc_comerc.ds_proposta
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_PROPOSTA'
            Title.Caption = 'N'#186' Proposta'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ABERTURA'
            Title.Caption = 'Data Abertura'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_status'
            Title.Caption = 'Status'
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
            FieldName = 'DT_STATUS'
            Title.Caption = 'Data Status'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_PROPOSTA'
            Title.Caption = 'Tipo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindow
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 90
            Visible = True
          end>
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 54
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label22: TLabel
          Left = 361
          Top = 10
          Width = 104
          Height = 13
          Caption = 'Grupo Empresarial'
          FocusControl = dbedt_look_end_numero
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 10
          Top = 10
          Width = 40
          Height = 13
          Caption = 'Cliente'
          FocusControl = DBEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 362
          Top = 24
          Width = 359
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_GRUPO'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 52
          Top = 24
          Width = 299
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_EMPRESA'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 11
          Top = 24
          Width = 42
          Height = 21
          Color = clMenu
          DataField = 'CD_EMPRESA'
          DataSource = datm_proc_comerc.ds_proc_comerc
          ReadOnly = True
          TabOrder = 2
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 588
    Top = 244
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
      Caption = '&Sair'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
  object pmGera: TPopupMenu
    TrackButton = tbLeftButton
    Left = 220
    Top = 199
    object Proposta: TMenuItem
      Caption = 'Proposta'
      OnClick = PropostaClick
    end
    object cotacao: TMenuItem
      Caption = 'Cota'#231#227'o'
      OnClick = cotacaoClick
    end
  end
end
