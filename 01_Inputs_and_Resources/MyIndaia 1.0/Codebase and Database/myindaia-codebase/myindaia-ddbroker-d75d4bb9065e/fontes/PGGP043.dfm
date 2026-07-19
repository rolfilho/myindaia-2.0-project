object frm_ajuste_impressao_gnre: Tfrm_ajuste_impressao_gnre
  Left = 7
  Top = 22
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ajuste de Impressão GNRE'
  ClientHeight = 434
  ClientWidth = 635
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
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 12
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
      Left = 40
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
      Left = 68
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
    object btn_excluir: TSpeedButton
      Left = 96
      Top = 12
      Width = 25
      Height = 25
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
      OnClick = btn_excluirClick
    end
    object dbnvg: TDBNavigator
      Left = 148
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
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
    end
  end
  object pgctrl_ajuste_imp: TPageControl
    Left = 0
    Top = 51
    Width = 635
    Height = 383
    ActivePage = ts_lista
    Align = alBottom
    HotTrack = True
    TabOrder = 1
    OnChange = pgctrl_ajuste_impChange
    OnChanging = pgctrl_ajuste_impChanging
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 627
        Height = 355
        Align = alClient
        DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
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
            FieldName = 'LookUnidade'
            Title.Caption = 'Unidade'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 350
          end>
      end
    end
    object ts_dados: TTabSheet
      Caption = 'Dados Básicos'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 627
        Height = 355
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label001: TLabel
          Left = 164
          Top = 44
          Width = 32
          Height = 13
          Caption = 'Linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label002: TLabel
          Left = 227
          Top = 44
          Width = 40
          Height = 13
          Caption = 'Coluna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_unid_neg: TLabel
          Left = 39
          Top = 8
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
        object btn_co_unid_neg: TSpeedButton
          Left = 368
          Top = 21
          Width = 25
          Height = 22
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
        end
        object Label1: TLabel
          Left = 63
          Top = 65
          Width = 92
          Height = 13
          Caption = 'UF - Favorecida'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 88
          Top = 89
          Width = 67
          Height = 13
          Caption = 'Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 78
          Top = 113
          Width = 78
          Height = 13
          Caption = 'Código da UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 49
          Top = 135
          Width = 106
          Height = 13
          Caption = 'Código da Receita'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 28
          Top = 159
          Width = 128
          Height = 13
          Caption = 'Importador/Exportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 49
          Top = 183
          Width = 106
          Height = 13
          Caption = 'Inscrição Estadual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 123
          Top = 207
          Width = 32
          Height = 13
          Caption = 'CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 100
          Top = 232
          Width = 55
          Height = 13
          Caption = 'Endereço'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 29
          Top = 254
          Width = 126
          Height = 13
          Caption = 'Documento de Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 98
          Top = 277
          Width = 57
          Height = 13
          Caption = 'Município'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 139
          Top = 299
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
          Left = 130
          Top = 323
          Width = 25
          Height = 13
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 412
          Top = 44
          Width = 32
          Height = 13
          Caption = 'Linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 347
          Top = 65
          Width = 51
          Height = 13
          Caption = 'Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 475
          Top = 44
          Width = 40
          Height = 13
          Caption = 'Coluna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 336
          Top = 89
          Width = 63
          Height = 13
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 318
          Top = 113
          Width = 83
          Height = 13
          Caption = 'Valor Principal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 358
          Top = 137
          Width = 44
          Height = 13
          Caption = 'N/REF.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 364
          Top = 161
          Width = 37
          Height = 13
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 315
          Top = 185
          Width = 86
          Height = 13
          Caption = 'Conta Corrente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 354
          Top = 210
          Width = 47
          Height = 13
          Caption = 'Agência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 344
          Top = 232
          Width = 58
          Height = 13
          Caption = 'Nr. Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 371
          Top = 255
          Width = 30
          Height = 13
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 39
          Top = 22
          Width = 36
          Height = 21
          DataField = 'CD_UNID_NEG'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          MaxLength = 2
          TabOrder = 0
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_cd_unid_negExit
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 82
          Top = 22
          Width = 281
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidade'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_col_cd_uf_fav: TDBEdit
          Left = 227
          Top = 106
          Width = 40
          Height = 21
          DataField = 'C_CD_UF_FAV'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 7
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_cd_uf_favExit
        end
        object dbedt_linha_cd_uf_fav: TDBEdit
          Left = 164
          Top = 106
          Width = 40
          Height = 21
          DataField = 'L_CD_UF_FAV'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 6
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_cd_uf_favExit
        end
        object dbedt_linha_uf_fav: TDBEdit
          Left = 164
          Top = 58
          Width = 40
          Height = 21
          DataField = 'L_UF_FAV'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 2
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_uf_favExit
        end
        object dbedt_linha_venc: TDBEdit
          Left = 164
          Top = 82
          Width = 40
          Height = 21
          DataField = 'L_VENC'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 4
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_vencExit
        end
        object dbedt_col_venc: TDBEdit
          Left = 227
          Top = 82
          Width = 40
          Height = 21
          DataField = 'C_VENC'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 5
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_vencExit
        end
        object dbedt_col_uf_fav: TDBEdit
          Left = 227
          Top = 58
          Width = 40
          Height = 21
          DataField = 'C_UF_FAV'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 3
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_uf_favExit
        end
        object dbedt_linha_cd_receita: TDBEdit
          Left = 164
          Top = 130
          Width = 40
          Height = 21
          DataField = 'L_CD_RECEITA'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 8
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_cd_receitaExit
        end
        object dbedt_col_cd_receita: TDBEdit
          Left = 227
          Top = 130
          Width = 40
          Height = 21
          DataField = 'C_CD_RECEITA'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 9
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_cd_receitaExit
        end
        object dbedt_linha_imp_exp: TDBEdit
          Left = 164
          Top = 154
          Width = 40
          Height = 21
          DataField = 'L_IMP_EXP'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 10
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_imp_expExit
        end
        object dbedt_col_imp_exp: TDBEdit
          Left = 227
          Top = 154
          Width = 40
          Height = 21
          DataField = 'C_IMP_EXP'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 11
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_imp_expExit
        end
        object dbedt_linha_insc_est: TDBEdit
          Left = 164
          Top = 178
          Width = 40
          Height = 21
          DataField = 'L_INSC_EST'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 12
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_insc_estExit
        end
        object dbedt_col_insc_est: TDBEdit
          Left = 227
          Top = 178
          Width = 40
          Height = 21
          DataField = 'C_INSC_EST'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 13
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_insc_estExit
        end
        object dbedt_linha_cnpj: TDBEdit
          Left = 164
          Top = 201
          Width = 40
          Height = 21
          DataField = 'L_CNPJ'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 14
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_cnpjExit
        end
        object dbedt_col_cnpj: TDBEdit
          Left = 227
          Top = 201
          Width = 40
          Height = 21
          DataField = 'C_CNPJ'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 15
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_cnpjExit
        end
        object dbedt_linha_end: TDBEdit
          Left = 164
          Top = 224
          Width = 40
          Height = 21
          DataField = 'L_END'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 16
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_endExit
        end
        object dbedt_col_end: TDBEdit
          Left = 227
          Top = 224
          Width = 40
          Height = 21
          DataField = 'C_END'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 17
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_endExit
        end
        object dbedt_linha_docto_origem: TDBEdit
          Left = 164
          Top = 247
          Width = 40
          Height = 21
          DataField = 'L_DOCTO_ORIGEM'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 18
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_docto_origemExit
        end
        object dbedt_col_docto_origem: TDBEdit
          Left = 227
          Top = 247
          Width = 40
          Height = 21
          DataField = 'C_DOCTO_ORIGEM'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 19
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_docto_origemExit
        end
        object dbedt_linha_municipio: TDBEdit
          Left = 164
          Top = 270
          Width = 40
          Height = 21
          DataField = 'L_MUNICIPIO'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 20
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_municipioExit
        end
        object dbedt_col_municipio: TDBEdit
          Left = 227
          Top = 270
          Width = 40
          Height = 21
          DataField = 'C_MUNICIPIO'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 21
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_municipioExit
        end
        object dbedt_linha_uf: TDBEdit
          Left = 164
          Top = 293
          Width = 40
          Height = 21
          DataField = 'L_UF'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 22
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_ufExit
        end
        object dbedt_col_uf: TDBEdit
          Left = 227
          Top = 293
          Width = 40
          Height = 21
          DataField = 'C_UF'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 23
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_ufExit
        end
        object dbedt_linha_cep: TDBEdit
          Left = 164
          Top = 316
          Width = 40
          Height = 21
          DataField = 'L_CEP'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 24
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_cepExit
        end
        object dbedt_col_cep: TDBEdit
          Left = 227
          Top = 316
          Width = 40
          Height = 21
          DataField = 'C_CEP'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 25
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_cepExit
        end
        object dbedt_linha_tel: TDBEdit
          Left = 412
          Top = 58
          Width = 40
          Height = 21
          DataField = 'L_TEL'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 26
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_telExit
        end
        object dbedt_col_tel: TDBEdit
          Left = 475
          Top = 58
          Width = 40
          Height = 21
          DataField = 'C_TEL'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 27
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_telExit
        end
        object dbedt_linha_ref: TDBEdit
          Left = 412
          Top = 82
          Width = 40
          Height = 21
          DataField = 'L_REF'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 28
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_refExit
        end
        object dbedt_col_ref: TDBEdit
          Left = 475
          Top = 82
          Width = 40
          Height = 21
          DataField = 'C_REF'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 29
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_refExit
        end
        object dbedt_linha_vl_princ: TDBEdit
          Left = 412
          Top = 106
          Width = 40
          Height = 21
          DataField = 'L_VL_PRINC'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 30
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_vl_princExit
        end
        object dbedt_col_vl_princ: TDBEdit
          Left = 475
          Top = 106
          Width = 40
          Height = 21
          DataField = 'C_VL_PRINC'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 31
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_vl_princExit
        end
        object dbedt_linha_nr_ref: TDBEdit
          Left = 412
          Top = 130
          Width = 40
          Height = 21
          DataField = 'L_NR_REF'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 32
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_nr_refExit
        end
        object dbedt_col_nr_ref: TDBEdit
          Left = 475
          Top = 130
          Width = 40
          Height = 21
          DataField = 'C_NR_REF'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 33
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_nr_refExit
        end
        object dbedt_linha_nm_banco: TDBEdit
          Left = 412
          Top = 154
          Width = 40
          Height = 21
          DataField = 'L_NM_BANCO'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 34
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_nm_bancoExit
        end
        object dbedt_col_nm_banco: TDBEdit
          Left = 475
          Top = 154
          Width = 40
          Height = 21
          DataField = 'C_NM_BANCO'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 35
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_nm_bancoExit
        end
        object dbedt_linha_conta: TDBEdit
          Left = 412
          Top = 178
          Width = 40
          Height = 21
          DataField = 'L_CONTA'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 36
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_contaExit
        end
        object dbedt_col_conta: TDBEdit
          Left = 475
          Top = 178
          Width = 40
          Height = 21
          DataField = 'C_CONTA'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 37
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_contaExit
        end
        object dbedt_linha_agencia: TDBEdit
          Left = 412
          Top = 201
          Width = 40
          Height = 21
          DataField = 'L_AGENCIA'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 38
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_agenciaExit
        end
        object dbedt_col_agencia: TDBEdit
          Left = 475
          Top = 201
          Width = 40
          Height = 21
          DataField = 'C_AGENCIA'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          TabOrder = 39
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_agenciaExit
        end
        object dbedt_linha_nr_banco: TDBEdit
          Left = 412
          Top = 224
          Width = 40
          Height = 21
          DataField = 'L_NR_BANCO'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 40
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_nr_bancoExit
        end
        object dbedt_col_nr_banco: TDBEdit
          Left = 475
          Top = 224
          Width = 40
          Height = 21
          DataField = 'C_NR_BANCO'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 41
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_nr_bancoExit
        end
        object dbedt_linha_total: TDBEdit
          Left = 412
          Top = 247
          Width = 40
          Height = 21
          DataField = 'L_TOTAL'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 42
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_linha_totalExit
        end
        object dbedt_col_total: TDBEdit
          Left = 475
          Top = 247
          Width = 40
          Height = 21
          DataField = 'C_TOTAL'
          DataSource = datm_ajuste_impressao_gnre.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 43
          OnChange = dbedt_linha_uf_favChange
          OnExit = dbedt_col_totalExit
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 582
    Top = 84
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
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
      OnClick = btn_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
