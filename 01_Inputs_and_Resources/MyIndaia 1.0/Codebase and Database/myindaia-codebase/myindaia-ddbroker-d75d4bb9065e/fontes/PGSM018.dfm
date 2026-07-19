object frm_unidade: Tfrm_unidade
  Left = 305
  Top = 108
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tabela de Unidade'
  ClientHeight = 432
  ClientWidth = 632
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
  object pnl_unid_neg: TPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 8
      Top = 12
      Width = 25
      Height = 25
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
      Left = 92
      Top = 12
      Width = 25
      Height = 25
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
      Left = 280
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
      OnClick = btn_cancelarClick
    end
    object btn_duplica: TSpeedButton
      Left = 120
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Duplica Unidade'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_duplicaClick
    end
    object dbnvg: TDBNavigator
      Left = 158
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_unidade.ds_usuario_habilitacao_unidade
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
      BeforeAction = dbnvgBeforeAction
    end
  end
  object Panel1: TPanel
    Left = 320
    Top = 0
    Width = 309
    Height = 49
    BevelOuter = bvLowered
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
      OnKeyDown = edt_chaveKeyDown
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
  object pgctrl_unidade: TPageControl
    Left = 0
    Top = 52
    Width = 629
    Height = 381
    ActivePage = ts_lista
    TabOrder = 2
    OnChange = pgctrl_unidadeChange
    OnChanging = pgctrl_unidadeChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_unidade: TDBGrid
        Left = 0
        Top = 0
        Width = 621
        Height = 353
        Align = alClient
        DataSource = datm_unidade.ds_usuario_habilitacao_unidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_unidadeDblClick
        OnKeyPress = dbg_unidadeKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_UNID_NEG'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_UNID_NEG'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 372
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_UNID_NEG'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'look_ativo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 44
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados B'#225'sicos'
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 621
        Height = 353
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label3: TLabel
          Left = 13
          Top = 3
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 69
          Top = 3
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Descri'#231#227'o'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 471
          Top = 4
          Width = 58
          Height = 16
          AutoSize = False
          Caption = 'Apelido'
          FocusControl = dbedt_ap_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_usuatio_ativo: TLabel
          Left = 419
          Top = 5
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
        object Label6: TLabel
          Left = 13
          Top = 44
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Endere'#231'o'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 358
          Top = 44
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'N'#250'mero'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 428
          Top = 44
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Bairro'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 13
          Top = 80
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Cidade'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 200
          Top = 80
          Width = 31
          Height = 13
          AutoSize = False
          Caption = 'U.F.'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 239
          Top = 80
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'CEP'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 194
          Top = 118
          Width = 127
          Height = 13
          AutoSize = False
          Caption = 'Inscri'#231#227'o Estadual'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 507
          Top = 118
          Width = 51
          Height = 13
          Caption = 'Telefone'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_fax1: TLabel
          Left = 13
          Top = 154
          Width = 127
          Height = 13
          AutoSize = False
          Caption = 'Fax 1'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_fax2: TLabel
          Left = 172
          Top = 154
          Width = 127
          Height = 13
          AutoSize = False
          Caption = 'Fax 2'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cnpj: TLabel
          Left = 13
          Top = 116
          Width = 127
          Height = 13
          AutoSize = False
          Caption = 'C.N.P.J.'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nm_slogan: TLabel
          Left = 13
          Top = 191
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Slogan'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_email: TLabel
          Left = 333
          Top = 154
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Email'
          FocusControl = dbedt_nm_email
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 352
          Top = 80
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
        object btn_co_pais: TSpeedButton
          Left = 578
          Top = 93
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
          OnClick = btn_co_paisClick
        end
        object lbl_aliq_iss: TLabel
          Left = 371
          Top = 191
          Width = 62
          Height = 13
          Caption = 'Aliq. I.S.S.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_insc_mun: TLabel
          Left = 352
          Top = 118
          Width = 127
          Height = 13
          AutoSize = False
          Caption = 'Inscri'#231#227'o Municipal'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 443
          Top = 191
          Width = 106
          Height = 13
          Caption = 'N'#186'  Processo Pref.'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_livro: TLabel
          Left = 557
          Top = 191
          Width = 51
          Height = 13
          Caption = 'N'#186'  Livro'
          FocusControl = dbedt_nm_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 562
          Top = 4
          Width = 58
          Height = 16
          AutoSize = False
          Caption = 'Sigla'
          FocusControl = dbedt_ap_unid_neg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 13
          Top = 228
          Width = 180
          Height = 13
          Caption = 'Banco Padr'#227'o para Concilia'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_banco: TSpeedButton
          Left = 239
          Top = 241
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
          OnClick = btn_co_bancoClick
        end
        object Image2: TImage
          Left = 270
          Top = 241
          Width = 17
          Height = 20
          Hint = 'Banco default para concilia'#231#227'o'
          ParentShowHint = False
          Picture.Data = {
            07544269746D6170F6000000424DF60000000000000076000000280000000F00
            000010000000010004000000000080000000C40E0000C40E0000100000000000
            0000000000000000800000800000008080008000000080008000808000007F7F
            7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF0033333CCCCC333330CCCCCC808CCCCCC000888807088880000F0770F7F077
            0F0070FFFFF7FFFFF07070FFFB99FBFFF07030FFBF99BFBFF030370BFBF7FBFB
            0730370FBF98BFBF07303B0BFB990BFB03303FB000B99000B3303BFBFBFB99FB
            F3303FBF99BF99BFB33033FB99FB99FB3330333FB9999FB333303333FBFBFB33
            3330}
          ShowHint = True
          Transparent = True
        end
        object Label34: TLabel
          Left = 340
          Top = 228
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
        object btn_co_cd_custo: TSpeedButton
          Left = 576
          Top = 241
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
          OnClick = btn_co_cd_custoClick
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 13
          Top = 20
          Width = 39
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_UNID_NEG'
          DataSource = datm_unidade.ds_unid_neg
          ReadOnly = True
          TabOrder = 24
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 69
          Top = 20
          Width = 346
          Height = 21
          DataField = 'NM_UNID_NEG'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 0
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_ap_unid_neg: TDBEdit
          Left = 471
          Top = 20
          Width = 88
          Height = 21
          DataField = 'AP_UNID_NEG'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 2
          OnChange = dbedt_cd_unid_negChange
        end
        object dblkpcbox_ativo: TDBLookupComboBox
          Left = 419
          Top = 20
          Width = 50
          Height = 21
          DataField = 'IN_ATIVO'
          DataSource = datm_unidade.ds_unid_neg
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_unidade.ds_yesno
          TabOrder = 1
          OnClick = dbedt_cd_unid_negChange
        end
        object dbedt_end_unid_neg: TDBEdit
          Left = 13
          Top = 57
          Width = 340
          Height = 21
          DataField = 'END_UNID_NEG'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 4
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_no_unid_neg: TDBEdit
          Left = 358
          Top = 57
          Width = 63
          Height = 21
          DataField = 'END_NUMERO'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 5
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_bairro_unid_neg: TDBEdit
          Left = 428
          Top = 57
          Width = 175
          Height = 21
          DataField = 'END_BAIRRO'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 6
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_cidade_unid_neg: TDBEdit
          Left = 13
          Top = 93
          Width = 183
          Height = 21
          DataField = 'END_CIDADE'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 7
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_uf_unid_neg: TDBEdit
          Left = 200
          Top = 93
          Width = 31
          Height = 21
          DataField = 'END_UF'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 8
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_cep_unid_neg: TDBEdit
          Left = 238
          Top = 93
          Width = 106
          Height = 21
          DataField = 'END_CEP'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 9
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_ie_unid_neg: TDBEdit
          Left = 194
          Top = 132
          Width = 148
          Height = 21
          DataField = 'IE_UNID_NEG'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 13
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_tel_unid_neg: TDBEdit
          Left = 507
          Top = 132
          Width = 103
          Height = 21
          DataField = 'NR_FONE'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 15
          OnChange = dbedt_cd_unid_negChange
        end
        object dbdt_nr_fax1: TDBEdit
          Left = 13
          Top = 168
          Width = 154
          Height = 21
          DataField = 'NR_FAX1'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 16
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_nr_fax2: TDBEdit
          Left = 172
          Top = 168
          Width = 154
          Height = 21
          DataField = 'NR_FAX2'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 17
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_cgc_unid_neg: TDBEdit
          Left = 13
          Top = 130
          Width = 175
          Height = 21
          DataField = 'CGC_UNID_NEG'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 12
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_cgc_unid_negExit
        end
        object dbedt_nm_slogan: TDBEdit
          Left = 13
          Top = 205
          Width = 354
          Height = 21
          DataField = 'NM_SLOGAN'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 19
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_nm_email: TDBEdit
          Left = 333
          Top = 168
          Width = 280
          Height = 21
          DataField = 'NM_EMAIL'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 18
          OnChange = dbedt_cd_unid_negChange
        end
        object grpbx_livro_fiscal: TGroupBox
          Left = 14
          Top = 264
          Width = 599
          Height = 85
          Caption = ' Livro Fiscal '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 23
          object Label24: TLabel
            Left = 76
            Top = 14
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Diretor'
            FocusControl = dbedt_nm_unid_neg
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label25: TLabel
            Left = 63
            Top = 38
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contador'
            FocusControl = dbedt_nm_unid_neg
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label26: TLabel
            Left = 52
            Top = 62
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Procurador'
            FocusControl = dbedt_nm_unid_neg
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 392
            Top = 14
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'CPF'
            FocusControl = dbedt_nm_unid_neg
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label28: TLabel
            Left = 390
            Top = 38
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'CRC'
            FocusControl = dbedt_nm_unid_neg
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label29: TLabel
            Left = 392
            Top = 62
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'CPF'
            FocusControl = dbedt_nm_unid_neg
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_nm_diretor: TDBEdit
            Left = 119
            Top = 11
            Width = 256
            Height = 21
            DataField = 'NM_DIRETOR'
            DataSource = datm_unidade.ds_unid_neg
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = dbedt_cd_unid_negChange
          end
          object dbedt_nm_contador: TDBEdit
            Left = 119
            Top = 35
            Width = 256
            Height = 21
            DataField = 'NM_CONTADOR'
            DataSource = datm_unidade.ds_unid_neg
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnChange = dbedt_cd_unid_negChange
          end
          object dbedt_nm_procurador: TDBEdit
            Left = 119
            Top = 59
            Width = 256
            Height = 21
            DataField = 'NM_PROCURADOR'
            DataSource = datm_unidade.ds_unid_neg
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnChange = dbedt_cd_unid_negChange
          end
          object dbedt_cpf_diretor: TDBEdit
            Left = 420
            Top = 11
            Width = 138
            Height = 21
            DataField = 'NR_CPF_DIRETOR'
            DataSource = datm_unidade.ds_unid_neg
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = dbedt_cd_unid_negChange
          end
          object dbedt_crc_contador: TDBEdit
            Left = 420
            Top = 35
            Width = 138
            Height = 21
            DataField = 'NR_CRC_CONTADOR'
            DataSource = datm_unidade.ds_unid_neg
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnChange = dbedt_cd_unid_negChange
          end
          object dbedt_procurador_cpf: TDBEdit
            Left = 420
            Top = 59
            Width = 138
            Height = 21
            DataField = 'NR_CPF_PROCURADOR'
            DataSource = datm_unidade.ds_unid_neg
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnChange = dbedt_cd_unid_negChange
          end
        end
        object dbedt_cd_pais: TDBEdit
          Left = 352
          Top = 93
          Width = 40
          Height = 21
          DataField = 'CD_PAIS'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 10
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_cd_paisExit
          OnKeyDown = dbedt_cd_paisKeyDown
        end
        object dbedt_nm_pais: TDBEdit
          Left = 394
          Top = 94
          Width = 180
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Look_Pais'
          DataSource = datm_unidade.ds_unid_neg
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_vl_aliq_iss: TDBEdit
          Left = 371
          Top = 205
          Width = 64
          Height = 21
          DataField = 'VL_ALIQ_ISS'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 20
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_cd_paisExit
          OnKeyDown = dbedt_cd_paisKeyDown
        end
        object dbedt_im_unid_neg: TDBEdit
          Left = 352
          Top = 132
          Width = 148
          Height = 21
          DataField = 'IM_UNID_NEG'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 14
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_nr_proc_nf_pref: TDBEdit
          Left = 443
          Top = 205
          Width = 104
          Height = 21
          DataField = 'NR_PROC_NF_PREF'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 21
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_nr_livro: TDBEdit
          Left = 557
          Top = 205
          Width = 55
          Height = 21
          DataField = 'NR_LIVRO'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 22
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_nm_sigla: TDBEdit
          Left = 562
          Top = 19
          Width = 49
          Height = 21
          DataField = 'NM_SIGLA'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 3
          OnChange = dbedt_nm_siglaChange
        end
        object dbedt_cd_banco: TDBEdit
          Left = 13
          Top = 241
          Width = 40
          Height = 21
          DataField = 'CD_BANCO_CONCILIACAO'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 25
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_cd_bancoExit
          OnKeyDown = dbedt_cd_bancoKeyDown
        end
        object dbedt_nm_banco: TDBEdit
          Left = 55
          Top = 241
          Width = 180
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_unidade.ds_unid_neg
          ReadOnly = True
          TabOrder = 26
        end
        object dbedt_cd_custo: TDBEdit
          Left = 340
          Top = 242
          Width = 48
          Height = 21
          Hint = 'Centro de Custo Administrativo'
          DataField = 'CD_CT_CUSTO'
          DataSource = datm_unidade.ds_unid_neg
          TabOrder = 27
          OnChange = dbedt_cd_custoChange
          OnExit = dbedt_cd_custoExit
          OnKeyDown = dbedt_cd_custoKeyDown
        end
        object dbedt_nm_custo: TDBEdit
          Left = 392
          Top = 241
          Width = 180
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCusto'
          DataSource = datm_unidade.ds_unid_neg
          ReadOnly = True
          TabOrder = 28
        end
      end
    end
    object ts_produto: TTabSheet
      Caption = '&Produto'
      object pgctrl_unid_neg_produto: TPageControl
        Left = 0
        Top = 0
        Width = 621
        Height = 353
        ActivePage = ts_lista_unid_neg_produto
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_unidadeChange
        OnChanging = pgctrl_unidadeChanging
        object ts_lista_unid_neg_produto: TTabSheet
          Caption = '&Lista'
          object Label10: TLabel
            Left = 6
            Top = 9
            Width = 58
            Height = 13
            AutoSize = False
            Caption = 'Unidade'
            FocusControl = dbedt_cd_unid_neg
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_cd_unid_neg2: TDBEdit
            Left = 6
            Top = 23
            Width = 28
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_UNID_NEG'
            DataSource = datm_unidade.ds_usuario_habilitacao_unidade
            ReadOnly = True
            TabOrder = 0
            OnChange = dbedt_cd_unid_negChange
          end
          object dbedt_nm_unid_neg2: TDBEdit
            Left = 36
            Top = 23
            Width = 572
            Height = 21
            TabStop = False
            DataField = 'NM_UNID_NEG'
            DataSource = datm_unidade.ds_usuario_habilitacao_unidade
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
            OnChange = dbedt_cd_unid_negChange
          end
          object dbg_produto: TDBGrid
            Left = 6
            Top = 56
            Width = 601
            Height = 262
            DataSource = datm_unidade.ds_usuario_habilitacao_produto
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
                FieldName = 'CD_PRODUTO'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 67
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'look_nm_produto'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 285
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'look_ap_produto'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 167
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'look_ativo'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 39
                Visible = True
              end>
          end
        end
        object ts_dados_basicos_unid_neg_produto: TTabSheet
          Caption = '&Dados B'#225'sicos'
          object Panel2: TPanel
            Left = 5
            Top = 5
            Width = 602
            Height = 314
            BevelOuter = bvLowered
            Caption = 'Panel2'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object Label7: TLabel
              Left = 42
              Top = 97
              Width = 117
              Height = 13
              AutoSize = False
              Caption = 'Obs. Numer'#225'rio '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 42
              Top = 181
              Width = 101
              Height = 13
              AutoSize = False
              Caption = 'Ass. Numer'#225'rio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 42
              Top = 260
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_produto: TSpeedButton
              Left = 473
              Top = 70
              Width = 25
              Height = 21
              Enabled = False
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
            object Label13: TLabel
              Left = 42
              Top = 14
              Width = 71
              Height = 13
              AutoSize = False
              Caption = 'Unidade'
              FocusControl = dbedt_cd_unid_neg
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 42
              Top = 54
              Width = 71
              Height = 13
              AutoSize = False
              Caption = 'Produto'
              FocusControl = dbedt_cd_unid_neg
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_cd_produto_unid_neg_prod: TDBEdit
              Left = 42
              Top = 70
              Width = 28
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_PRODUTO'
              DataSource = datm_unidade.ds_unid_neg_produto
              ReadOnly = True
              TabOrder = 0
              OnChange = dbmemo_tx_numerario_obsChange
              OnExit = dbedt_cd_produto_unid_neg_prodExit
            end
            object dblkpcbox_ativo_unid_neg_prod: TDBLookupComboBox
              Left = 42
              Top = 273
              Width = 50
              Height = 21
              DataField = 'IN_ATIVO'
              DataSource = datm_unidade.ds_unid_neg_produto
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_unidade.ds_yesno
              TabOrder = 3
              OnClick = dbmemo_tx_numerario_obsChange
            end
            object dbedt_nm_produto_unid_neg_prod: TDBEdit
              Left = 71
              Top = 70
              Width = 396
              Height = 21
              TabStop = False
              Color = clSilver
              DataField = 'look_nm_produto'
              DataSource = datm_unidade.ds_unid_neg_produto
              TabOrder = 4
              OnChange = dbmemo_tx_numerario_obsChange
            end
            object dbmemo_tx_numerario_obs: TDBMemo
              Left = 42
              Top = 111
              Width = 457
              Height = 65
              DataField = 'TX_NUMERARIO_OBS'
              DataSource = datm_unidade.ds_unid_neg_produto
              TabOrder = 1
              OnChange = dbmemo_tx_numerario_obsChange
            end
            object dbedt_nm_unidade_unid_neg_prod: TDBEdit
              Left = 72
              Top = 29
              Width = 396
              Height = 21
              TabStop = False
              DataField = 'look_nm_unid_neg'
              DataSource = datm_unidade.ds_unid_neg_produto
              ParentColor = True
              TabOrder = 5
              OnChange = dbmemo_tx_numerario_obsChange
            end
            object dbedt_cd_unidade_unid_neg_prod: TDBEdit
              Left = 42
              Top = 29
              Width = 28
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_UNID_NEG'
              DataSource = datm_unidade.ds_unid_neg_produto
              ReadOnly = True
              TabOrder = 6
              OnChange = dbmemo_tx_numerario_obsChange
            end
            object dbmemo_tx_numerario_ass: TDBMemo
              Left = 42
              Top = 195
              Width = 457
              Height = 60
              DataField = 'TX_NUMERARIO_ASS'
              DataSource = datm_unidade.ds_unid_neg_produto
              TabOrder = 2
              OnChange = dbmemo_tx_numerario_obsChange
            end
          end
        end
      end
    end
    object ts_diretorios: TTabSheet
      Caption = 'Diret'#243'rios'
      object Label20: TLabel
        Left = 6
        Top = 9
        Width = 58
        Height = 13
        AutoSize = False
        Caption = 'Unidade'
        FocusControl = dbedt_cd_unid_neg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 6
        Top = 86
        Width = 54
        Height = 13
        Caption = 'Siscomex'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 6
        Top = 46
        Width = 58
        Height = 13
        Caption = 'Relat'#243'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 6
        Top = 126
        Width = 22
        Height = 13
        Caption = 'REI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_cd_unid_neg3: TDBEdit
        Left = 6
        Top = 23
        Width = 28
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_UNID_NEG'
        DataSource = datm_unidade.ds_unid_neg
        ReadOnly = True
        TabOrder = 0
        OnChange = dbedt_cd_unid_negChange
      end
      object dbedt_nm_unid_neg3: TDBEdit
        Left = 36
        Top = 23
        Width = 572
        Height = 21
        TabStop = False
        DataField = 'NM_UNID_NEG'
        DataSource = datm_unidade.ds_unid_neg
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
        OnChange = dbedt_cd_unid_negChange
      end
      object dbedt_path_rel: TDBEdit
        Left = 6
        Top = 61
        Width = 300
        Height = 21
        DataField = 'PATH_RELATORIOS'
        DataSource = datm_unidade.ds_unid_neg
        TabOrder = 2
        OnChange = dbedt_cd_unid_negChange
      end
      object dbedt_path_siscomex: TDBEdit
        Left = 6
        Top = 101
        Width = 300
        Height = 21
        DataField = 'PATH_SISCOMEX'
        DataSource = datm_unidade.ds_unid_neg
        TabOrder = 3
        OnChange = dbedt_cd_unid_negChange
      end
      object dbedt_path_rei: TDBEdit
        Left = 6
        Top = 141
        Width = 300
        Height = 21
        DataField = 'PATH_REI'
        DataSource = datm_unidade.ds_unid_neg
        TabOrder = 4
        OnChange = dbedt_cd_unid_negChange
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 260
    Top = 36
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
    object mi_duplica: TMenuItem
      Caption = '&Duplica'
      Enabled = False
      OnClick = btn_duplicaClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
