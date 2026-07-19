object frm_ajuste_impressao_exoneracao: Tfrm_ajuste_impressao_exoneracao
  Left = 64
  Top = 19
  BorderStyle = bsSingle
  Caption = 'Ajuste de Impressão - Exoneração'
  ClientHeight = 434
  ClientWidth = 632
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
      DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
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
    Width = 632
    Height = 383
    ActivePage = ts_dados
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
        Width = 624
        Height = 355
        Align = alClient
        DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
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
        Width = 624
        Height = 355
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label001: TLabel
          Left = 103
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
          Left = 148
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
          Left = 12
          Top = 65
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'UF - Secretaria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 50
          Top = 89
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 46
          Top = 113
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 38
          Top = 135
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Número DI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 13
          Top = 159
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Registro DI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 44
          Top = 183
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Insc. Est.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 38
          Top = 207
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'CNPJ/CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 74
          Top = 232
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = 'CAE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 14
          Top = 254
          Width = 85
          Height = 13
          Alignment = taRightJustify
          Caption = 'Local Desemb.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 51
          Top = 277
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'UF ARM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 44
          Top = 299
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Endereço'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 65
          Top = 323
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 289
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
          Left = 260
          Top = 65
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 335
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
          Left = 228
          Top = 89
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'Município'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 208
          Top = 113
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = 'UF - Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 232
          Top = 159
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor CIF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 245
          Top = 183
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Adição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 196
          Top = 207
          Width = 89
          Height = 13
          Alignment = taRightJustify
          Caption = 'Classe Tarifária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 217
          Top = 254
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fund. Legal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 225
          Top = 277
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor MVC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 220
          Top = 299
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data Venc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 216
          Top = 232
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'Trat. Tribut.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 234
          Top = 135
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 201
          Top = 323
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = 'Representante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 390
          Top = 65
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = 'Obs. do Fisco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 473
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
        object Label29: TLabel
          Left = 519
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
        object dbedt_cd_unid_neg: TDBEdit
          Left = 39
          Top = 22
          Width = 36
          Height = 21
          DataField = 'CD_UNID_NEG'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          MaxLength = 2
          TabOrder = 0
          OnChange = dbedt_cd_unid_negChange
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
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_col_processo: TDBEdit
          Left = 148
          Top = 106
          Width = 40
          Height = 21
          DataField = 'C_PROCESSO'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 6
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_processoExit
        end
        object dbedt_linha_uf_sec: TDBEdit
          Left = 103
          Top = 58
          Width = 40
          Height = 21
          DataField = 'L_UF_SEC'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 2
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_linha_uf_secExit
        end
        object dbedt_linha_empresa: TDBEdit
          Left = 103
          Top = 82
          Width = 40
          Height = 21
          DataField = 'L_EMPRESA'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 4
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_linha_empresaExit
        end
        object dbedt_col_empresa: TDBEdit
          Left = 148
          Top = 82
          Width = 40
          Height = 21
          DataField = 'C_EMPRESA'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 5
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_empresaExit
        end
        object dbedt_col_uf_sec: TDBEdit
          Left = 148
          Top = 58
          Width = 40
          Height = 21
          DataField = 'C_UF_SEC'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 3
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_uf_secExit
        end
        object dbedt_col_nr_di: TDBEdit
          Left = 148
          Top = 130
          Width = 40
          Height = 21
          DataField = 'C_NR_DI'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 7
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_nr_diExit
        end
        object dbedt_col_dt_reg_di: TDBEdit
          Left = 148
          Top = 154
          Width = 40
          Height = 21
          DataField = 'C_DT_REG_DI'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 8
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_dt_reg_diExit
        end
        object dbedt_linha_ie: TDBEdit
          Left = 103
          Top = 178
          Width = 40
          Height = 21
          DataField = 'L_INSC_EST'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 9
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_linha_ieExit
        end
        object dbedt_col_ie: TDBEdit
          Left = 148
          Top = 178
          Width = 40
          Height = 21
          DataField = 'C_INSC_EST'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 10
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_ieExit
        end
        object dbedt_col_cnpj: TDBEdit
          Left = 148
          Top = 201
          Width = 40
          Height = 21
          DataField = 'C_CNPJ_CPF'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 11
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_cnpjExit
        end
        object dbedt_col_cae: TDBEdit
          Left = 148
          Top = 224
          Width = 40
          Height = 21
          DataField = 'C_CAE'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 12
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_caeExit
        end
        object dbedt_col_desemb: TDBEdit
          Left = 148
          Top = 247
          Width = 40
          Height = 21
          DataField = 'C_DESEMB'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 13
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_desembExit
        end
        object dbedt_col_ufarm: TDBEdit
          Left = 148
          Top = 270
          Width = 40
          Height = 21
          DataField = 'C_UFARM'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 14
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_ufarmExit
        end
        object dbedt_linha_end: TDBEdit
          Left = 103
          Top = 293
          Width = 40
          Height = 21
          DataField = 'L_END'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 15
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_linha_endExit
        end
        object dbedt_col_end: TDBEdit
          Left = 148
          Top = 293
          Width = 40
          Height = 21
          DataField = 'C_END'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 16
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_endExit
        end
        object dbedt_col_bairro: TDBEdit
          Left = 148
          Top = 316
          Width = 40
          Height = 21
          DataField = 'C_BAIRRO'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 17
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_bairroExit
        end
        object dbedt_linha_cep: TDBEdit
          Left = 289
          Top = 58
          Width = 40
          Height = 21
          DataField = 'L_CEP'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 18
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_linha_cepExit
        end
        object dbedt_col_cep: TDBEdit
          Left = 335
          Top = 58
          Width = 40
          Height = 21
          DataField = 'C_CEP'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 19
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_cepExit
        end
        object dbedt_col_municipio: TDBEdit
          Left = 335
          Top = 82
          Width = 40
          Height = 21
          DataField = 'C_MUNICIPIO'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 20
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_municipioExit
        end
        object dbedt_col_uf_emp: TDBEdit
          Left = 335
          Top = 106
          Width = 40
          Height = 21
          DataField = 'C_UF_EMP'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 21
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_uf_empExit
        end
        object dbedt_col_vl_cif: TDBEdit
          Left = 335
          Top = 154
          Width = 40
          Height = 21
          DataField = 'C_VL_CIF'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 23
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_vl_cifExit
        end
        object dbedt_linha_adicao: TDBEdit
          Left = 289
          Top = 178
          Width = 40
          Height = 21
          DataField = 'L_ADICAO'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 24
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_linha_adicaoExit
        end
        object dbedt_col_adicao: TDBEdit
          Left = 335
          Top = 178
          Width = 40
          Height = 21
          DataField = 'C_ADICAO'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 25
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_adicaoExit
        end
        object dbedt_col_classe: TDBEdit
          Left = 335
          Top = 201
          Width = 40
          Height = 21
          DataField = 'C_CLASSE'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 26
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_classeExit
        end
        object dbedt_col_trat: TDBEdit
          Left = 335
          Top = 224
          Width = 40
          Height = 21
          DataField = 'C_TRAT'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 27
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_tratExit
        end
        object dbedt_col_fund_legal: TDBEdit
          Left = 335
          Top = 247
          Width = 40
          Height = 21
          DataField = 'C_FUND_LEGAL'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 28
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_fund_legalExit
        end
        object dbedt_col_valor_mcv: TDBEdit
          Left = 335
          Top = 270
          Width = 40
          Height = 21
          DataField = 'C_VL_MCV'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 29
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_valor_mcvExit
        end
        object dbedt_linha_data: TDBEdit
          Left = 289
          Top = 293
          Width = 40
          Height = 21
          DataField = 'L_DATA'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 30
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_linha_dataExit
        end
        object dbedt_col_tel: TDBEdit
          Left = 335
          Top = 130
          Width = 40
          Height = 21
          DataField = 'C_TEL'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 22
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_telExit
        end
        object dbedt_col_representante: TDBEdit
          Left = 335
          Top = 316
          Width = 40
          Height = 21
          DataField = 'C_REPRESENTANTE'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 32
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_representanteExit
        end
        object dbedt_col_data: TDBEdit
          Left = 335
          Top = 293
          Width = 40
          Height = 21
          DataField = 'C_DATA'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          TabOrder = 31
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_dataExit
        end
        object dbedt_linha_obs: TDBEdit
          Left = 473
          Top = 58
          Width = 40
          Height = 21
          DataField = 'L_OBS'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 33
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_linha_obsExit
        end
        object dbedt_col_obs: TDBEdit
          Left = 519
          Top = 58
          Width = 40
          Height = 21
          DataField = 'C_OBS'
          DataSource = datm_ajuste_impressao_exoneracao.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 34
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_col_obsExit
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 512
    Top = 40
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
