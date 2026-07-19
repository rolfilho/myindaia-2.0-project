object frm_ajuste_impressao_nf_serv: Tfrm_ajuste_impressao_nf_serv
  Left = 239
  Top = 122
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ajuste de Impressão Nota Fiscal de Serviço'
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 35
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 12
      Top = 5
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
      Top = 5
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
      Top = 5
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
      Top = 5
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
      Top = 5
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
      Top = 5
      Width = 104
      Height = 25
      DataSource = datm_ajuste_impressao_nf_serv.ds_lista
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
    Top = 36
    Width = 635
    Height = 398
    ActivePage = ts_lista
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
        Height = 370
        Align = alClient
        DataSource = datm_ajuste_impressao_nf_serv.ds_lista
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
            FieldName = 'CD_UNID_NEG'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'NM_UNID_NEG'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 277
          end>
      end
    end
    object ts_dados: TTabSheet
      Caption = 'Dados Básicos'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 627
        Height = 370
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label001: TLabel
          Left = 82
          Top = 38
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
          Left = 145
          Top = 38
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
          Top = 2
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
          Top = 15
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
          OnClick = btn_co_unid_negClick
        end
        object Label1: TLabel
          Left = 30
          Top = 57
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Emissão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 10
          Top = 80
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 37
          Top = 103
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'N/Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 1
          Top = 125
          Width = 76
          Height = 13
          Alignment = taRightJustify
          Caption = 'Razão Social'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 37
          Top = 148
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 22
          Top = 171
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
        object Label10: TLabel
          Left = 20
          Top = 193
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
        object Label11: TLabel
          Left = 43
          Top = 215
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
        object Label21: TLabel
          Left = 52
          Top = 261
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
        object Label22: TLabel
          Left = 29
          Top = 283
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'C.N.P.J.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 52
          Top = 238
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = 'U.F.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 18
          Top = 304
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Inscr. Est.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 290
          Top = 38
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
        object Label8: TLabel
          Left = 353
          Top = 38
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
        object Label9: TLabel
          Left = 258
          Top = 57
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Área'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 239
          Top = 80
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Analista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 208
          Top = 103
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = 'S/Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 199
          Top = 125
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nat. Despacho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 250
          Top = 148
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Modal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 240
          Top = 171
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Caption = 'Veículo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 245
          Top = 193
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 241
          Top = 215
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = 'Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 222
          Top = 261
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Peso Bruto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 211
          Top = 283
          Width = 74
          Height = 13
          Alignment = taRightJustify
          Caption = 'Peso Liquido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 237
          Top = 238
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Volumes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 227
          Top = 304
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor FOB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 519
          Top = 38
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
        object Label30: TLabel
          Left = 582
          Top = 38
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
        object Label31: TLabel
          Left = 478
          Top = 125
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Indaiá'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 407
          Top = 148
          Width = 107
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor dos Serviços'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 439
          Top = 171
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Observações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 429
          Top = 193
          Width = 85
          Height = 13
          Alignment = taRightJustify
          Caption = 'Não Tributável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 397
          Top = 215
          Width = 117
          Height = 13
          Alignment = taRightJustify
          Caption = 'Sub-Total Tributável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label36: TLabel
          Left = 460
          Top = 238
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = 'Comissão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 450
          Top = 261
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Geral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 399
          Top = 283
          Width = 115
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Tributável-ISS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 484
          Top = 325
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'IRRF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 493
          Top = 304
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'ISS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 184
          Top = 348
          Width = 101
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nº DA/DI/RE/DT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 456
          Top = 80
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Left = 232
          Top = 325
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
        object Label45: TLabel
          Left = 474
          Top = 103
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 405
          Top = 57
          Width = 109
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nº de Linhas/Desp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 402
          Top = 2
          Width = 127
          Height = 13
          Caption = 'Nº Última N.F. Emitida'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 478
          Top = 349
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cofins'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 39
          Top = 16
          Width = 32
          Height = 21
          DataField = 'CD_UNID_NEG'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 2
          TabOrder = 0
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_cd_unid_negExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 76
          Top = 16
          Width = 288
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidNeg'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          ReadOnly = True
          TabOrder = 62
        end
        object dbedt_col_n_referencia: TDBEdit
          Left = 145
          Top = 99
          Width = 40
          Height = 21
          DataField = 'C_N_REFERENCIA'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 6
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_n_referenciaExit
        end
        object dbedt_linha_n_referencia: TDBEdit
          Left = 82
          Top = 99
          Width = 40
          Height = 21
          DataField = 'L_N_REFERENCIA'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 5
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_n_referenciaExit
        end
        object dbedt_linha_emissao: TDBEdit
          Left = 82
          Top = 53
          Width = 40
          Height = 21
          DataField = 'L_EMISSAO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 2
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_emissaoExit
        end
        object dbedt_col_vencimento: TDBEdit
          Left = 145
          Top = 76
          Width = 40
          Height = 21
          DataField = 'C_VENCIMENTO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 4
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_vencimentoExit
        end
        object dbedt_col_emissao: TDBEdit
          Left = 145
          Top = 53
          Width = 40
          Height = 21
          DataField = 'C_EMISSAO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 3
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_emissaoExit
        end
        object dbedt_col_razao_social: TDBEdit
          Left = 145
          Top = 121
          Width = 40
          Height = 21
          DataField = 'C_RAZAO_SOCIAL'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 8
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_razao_socialExit
        end
        object dbedt_linha_razao_social: TDBEdit
          Left = 82
          Top = 121
          Width = 40
          Height = 21
          DataField = 'L_RAZAO_SOCIAL'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 7
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_razao_socialExit
        end
        object dbedt_col_codigo: TDBEdit
          Left = 145
          Top = 144
          Width = 40
          Height = 21
          DataField = 'C_CODIGO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 9
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_codigoExit
        end
        object dbedt_linha_endereco: TDBEdit
          Left = 82
          Top = 167
          Width = 40
          Height = 21
          DataField = 'L_ENDERECO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 10
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_enderecoExit
        end
        object dbedt_col_endereco: TDBEdit
          Left = 145
          Top = 167
          Width = 40
          Height = 21
          DataField = 'C_ENDERECO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 11
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_enderecoExit
        end
        object dbedt_col_bairro: TDBEdit
          Left = 145
          Top = 211
          Width = 40
          Height = 21
          DataField = 'C_BAIRRO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 14
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_bairroExit
        end
        object dbedt_linha_municipio: TDBEdit
          Left = 82
          Top = 189
          Width = 40
          Height = 21
          DataField = 'L_MUNICIPIO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 12
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_municipioExit
        end
        object dbedt_col_municipio: TDBEdit
          Left = 145
          Top = 189
          Width = 40
          Height = 21
          DataField = 'C_MUNICIPIO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 13
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_municipioExit
        end
        object dbedt_col_cnpj: TDBEdit
          Left = 145
          Top = 279
          Width = 40
          Height = 21
          DataField = 'C_CNPJ'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 18
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_cnpjExit
        end
        object dbedt_linha_cnpj: TDBEdit
          Left = 82
          Top = 279
          Width = 40
          Height = 21
          DataField = 'L_CNPJ'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 17
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_cnpjExit
        end
        object dbedt_col_cep: TDBEdit
          Left = 145
          Top = 257
          Width = 40
          Height = 21
          DataField = 'C_CEP'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 16
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_cepExit
        end
        object dbedt_col_uf: TDBEdit
          Left = 145
          Top = 234
          Width = 40
          Height = 21
          DataField = 'C_UF'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 15
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_ufExit
        end
        object dbedt_col_ie: TDBEdit
          Left = 145
          Top = 300
          Width = 40
          Height = 21
          DataField = 'C_IE'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 19
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_ieExit
        end
        object dbedt_col_s_referencia: TDBEdit
          Left = 353
          Top = 99
          Width = 40
          Height = 21
          DataField = 'C_S_REFERENCIA'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 24
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_s_referenciaExit
        end
        object dbedt_linha_s_referencia: TDBEdit
          Left = 290
          Top = 99
          Width = 40
          Height = 21
          DataField = 'L_S_REFERENCIA'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 23
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_s_referenciaExit
        end
        object dbedt_linha_area: TDBEdit
          Left = 290
          Top = 53
          Width = 40
          Height = 21
          DataField = 'L_AREA'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 20
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_areaExit
        end
        object dbedt_col_analista: TDBEdit
          Left = 353
          Top = 76
          Width = 40
          Height = 21
          DataField = 'C_ANALISTA'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 22
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_analistaExit
        end
        object dbedt_col_area: TDBEdit
          Left = 353
          Top = 53
          Width = 40
          Height = 21
          DataField = 'C_AREA'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 21
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_areaExit
        end
        object dbedt_col_nat_despacho: TDBEdit
          Left = 353
          Top = 121
          Width = 40
          Height = 21
          DataField = 'C_NAT_DESPACHO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 26
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_nat_despachoExit
        end
        object dbedt_linha_nat_despacho: TDBEdit
          Left = 290
          Top = 121
          Width = 40
          Height = 21
          DataField = 'L_NAT_DESPACHO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 25
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_nat_despachoExit
        end
        object dbedt_col_modal: TDBEdit
          Left = 353
          Top = 144
          Width = 40
          Height = 21
          DataField = 'C_MODAL'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 27
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_modalExit
        end
        object dbedt_linha_veiculo: TDBEdit
          Left = 290
          Top = 167
          Width = 40
          Height = 21
          DataField = 'L_VEICULO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 28
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_veiculoExit
        end
        object dbedt_col_veiculo: TDBEdit
          Left = 353
          Top = 167
          Width = 40
          Height = 21
          DataField = 'C_VEICULO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 29
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_veiculoExit
        end
        object dbedt_col_destino: TDBEdit
          Left = 353
          Top = 211
          Width = 40
          Height = 21
          DataField = 'C_DESTINO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 31
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_destinoExit
        end
        object dbedt_col_origem: TDBEdit
          Left = 353
          Top = 189
          Width = 40
          Height = 21
          DataField = 'C_ORIGEM'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 30
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_origemExit
        end
        object dbedt_col_peso_liquido: TDBEdit
          Left = 353
          Top = 279
          Width = 40
          Height = 21
          DataField = 'C_PESO_LIQUIDO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 35
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_peso_liquidoExit
        end
        object dbedt_linha_volumes: TDBEdit
          Left = 290
          Top = 234
          Width = 40
          Height = 21
          DataField = 'L_VOLUMES'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 32
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_volumesExit
        end
        object dbedt_col_peso_bruto: TDBEdit
          Left = 353
          Top = 257
          Width = 40
          Height = 21
          DataField = 'C_PESO_BRUTO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 34
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_peso_brutoExit
        end
        object dbedt_col_volumes: TDBEdit
          Left = 353
          Top = 234
          Width = 40
          Height = 21
          DataField = 'C_VOLUMES'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 33
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_volumesExit
        end
        object dbedt_col_valor_fob: TDBEdit
          Left = 353
          Top = 300
          Width = 40
          Height = 21
          DataField = 'C_VALOR_FOB'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 37
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_valor_fobExit
        end
        object dbedt_col_obs: TDBEdit
          Left = 582
          Top = 167
          Width = 40
          Height = 21
          DataField = 'C_OBS'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 48
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_obsExit
        end
        object dbedt_linha_obs: TDBEdit
          Left = 519
          Top = 167
          Width = 40
          Height = 21
          DataField = 'L_OBS'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 47
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_obsExit
        end
        object dbedt_linha_valor_fob: TDBEdit
          Left = 290
          Top = 300
          Width = 40
          Height = 21
          DataField = 'L_VALOR_FOB'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 36
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_valor_fobExit
        end
        object dbedt_col_servicos: TDBEdit
          Left = 582
          Top = 144
          Width = 40
          Height = 21
          DataField = 'C_SERVICOS'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 46
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_servicosExit
        end
        object dbedt_col_indaia: TDBEdit
          Left = 582
          Top = 121
          Width = 40
          Height = 21
          DataField = 'C_INDAIA'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 45
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_indaiaExit
        end
        object dbedt_col_nao_tributavel: TDBEdit
          Left = 582
          Top = 189
          Width = 40
          Height = 21
          DataField = 'C_NAO_TRIBUTAVEL'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 50
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_nao_tributavelExit
        end
        object dbedt_linha_nao_tributavel: TDBEdit
          Left = 519
          Top = 189
          Width = 40
          Height = 21
          DataField = 'L_NAO_TRIBUTAVEL'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 49
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_nao_tributavelExit
        end
        object dbedt_col_sub_total_tributavel: TDBEdit
          Left = 582
          Top = 211
          Width = 40
          Height = 21
          DataField = 'C_SUB_TOTAL_TRIBUTAVEL'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 51
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_sub_total_tributavelExit
        end
        object dbedt_linha_comissao: TDBEdit
          Left = 519
          Top = 234
          Width = 40
          Height = 21
          DataField = 'L_COMISSAO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 52
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_comissaoExit
        end
        object dbedt_col_comissao: TDBEdit
          Left = 582
          Top = 234
          Width = 40
          Height = 21
          DataField = 'C_COMISSAO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 53
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_comissaoExit
        end
        object dbedt_col_total_tributavel: TDBEdit
          Left = 582
          Top = 279
          Width = 40
          Height = 21
          DataField = 'C_TOTAL_TRIBUTAVEL'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 57
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_total_tributavelExit
        end
        object dbedt_linha_total_geral: TDBEdit
          Left = 519
          Top = 257
          Width = 40
          Height = 21
          DataField = 'L_TOTAL_GERAL'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 54
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_total_geralExit
        end
        object dbedt_col_total_geral: TDBEdit
          Left = 582
          Top = 257
          Width = 40
          Height = 21
          DataField = 'C_TOTAL_GERAL'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          TabOrder = 55
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_total_geralExit
        end
        object dbedt_linha_total_tributavel: TDBEdit
          Left = 519
          Top = 279
          Width = 40
          Height = 21
          DataField = 'L_TOTAL_TRIBUTAVEL'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 56
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_total_tributavelExit
        end
        object dbedt_col_irrf: TDBEdit
          Left = 582
          Top = 321
          Width = 40
          Height = 21
          DataField = 'C_IRRF'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 61
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_irrfExit
        end
        object dbedt_col_iss: TDBEdit
          Left = 582
          Top = 300
          Width = 40
          Height = 21
          DataField = 'C_ISS'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 59
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_issExit
        end
        object dbedt_col_descricao: TDBEdit
          Left = 582
          Top = 76
          Width = 40
          Height = 21
          DataField = 'C_DESCRICAO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 43
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_descricaoExit
        end
        object dbedt_linha_di: TDBEdit
          Left = 290
          Top = 344
          Width = 40
          Height = 21
          DataField = 'L_DI'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 39
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_diExit
        end
        object dbedt_col_di: TDBEdit
          Left = 353
          Top = 344
          Width = 40
          Height = 21
          DataField = 'C_DI'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 40
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_diExit
        end
        object dbedt_col_valor_cif: TDBEdit
          Left = 353
          Top = 321
          Width = 40
          Height = 21
          DataField = 'C_VALOR_CIF'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 38
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_valor_cifExit
        end
        object dbedt_col_cliente: TDBEdit
          Left = 582
          Top = 99
          Width = 40
          Height = 21
          DataField = 'C_CLIENTE'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 44
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_clienteExit
        end
        object dbedt_linha_descricao: TDBEdit
          Left = 519
          Top = 76
          Width = 40
          Height = 21
          DataField = 'L_DESCRICAO'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 42
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_descricaoExit
        end
        object dbedt_nr_linhas: TDBEdit
          Left = 519
          Top = 53
          Width = 40
          Height = 21
          DataField = 'NR_LINHAS'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 41
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_nr_linhasExit
        end
        object dbedt_nr_ult_nf_serv: TDBEdit
          Left = 402
          Top = 16
          Width = 96
          Height = 21
          DataField = 'NR_ULT_NF_SERV'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 6
          TabOrder = 1
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_nr_ult_nf_servExit
        end
        object dbedt_linha_iss: TDBEdit
          Left = 519
          Top = 300
          Width = 40
          Height = 21
          DataField = 'L_ISS'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 58
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_issExit
        end
        object dbedt_linha_irrf: TDBEdit
          Left = 519
          Top = 321
          Width = 40
          Height = 21
          DataField = 'L_IRRF'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 60
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_irrfExit
        end
        object dbedt_linha_cofins: TDBEdit
          Left = 519
          Top = 342
          Width = 40
          Height = 21
          DataField = 'L_COFINS'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 63
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_linha_cofinsExit
        end
        object dbedt_col_cofins: TDBEdit
          Left = 582
          Top = 342
          Width = 40
          Height = 21
          DataField = 'C_COFINS'
          DataSource = datm_ajuste_impressao_nf_serv.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 64
          OnChange = dbedt_linha_emissaoChange
          OnExit = dbedt_col_cofinsExit
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 576
    Top = 3
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
