object frm_ajuste_impressao_boleto: Tfrm_ajuste_impressao_boleto
  Left = 54
  Top = 80
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ajuste de Impressão Boleto'
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
        Width = 627
        Height = 355
        Align = alClient
        DataSource = datm_ajuste_impressao_boleto.ds_lista
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
          end
          item
            FieldName = 'NR_BANCO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'NM_BCO'
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
        Height = 355
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label001: TLabel
          Left = 214
          Top = 84
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
          Left = 277
          Top = 84
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
          Top = 5
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
          Top = 18
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
          Left = 111
          Top = 103
          Width = 99
          Height = 13
          Caption = 'Local Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 122
          Top = 126
          Width = 88
          Height = 13
          Caption = 'Dt. Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 124
          Top = 149
          Width = 86
          Height = 13
          Caption = 'Dt. Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 127
          Top = 172
          Width = 83
          Height = 13
          Caption = 'Nº Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 112
          Top = 195
          Width = 98
          Height = 13
          Caption = 'Valor Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 150
          Top = 218
          Width = 60
          Height = 13
          Caption = 'Instruções'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 166
          Top = 240
          Width = 44
          Height = 13
          Caption = 'Sacado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_banco: TSpeedButton
          Left = 368
          Top = 57
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
          OnClick = btn_co_bancoClick
        end
        object Label12: TLabel
          Left = 39
          Top = 44
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
        object Label11: TLabel
          Left = 74
          Top = 262
          Width = 136
          Height = 13
          Caption = 'Nº Fatura ( Cód. Baixa )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 39
          Top = 19
          Width = 32
          Height = 21
          DataField = 'CD_UNID_NEG'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          MaxLength = 2
          TabOrder = 0
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_cd_unid_negExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 76
          Top = 19
          Width = 288
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidNeg'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          ReadOnly = True
          TabOrder = 17
        end
        object dbedt_col_dt_docto: TDBEdit
          Left = 277
          Top = 145
          Width = 40
          Height = 21
          DataField = 'C_DT_DOCTO'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 6
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_col_dt_doctoExit
        end
        object dbedt_linha_dt_docto: TDBEdit
          Left = 214
          Top = 145
          Width = 40
          Height = 21
          DataField = 'L_DT_DOCTO'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 5
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_linha_dt_doctoExit
        end
        object dbedt_linha_local_pagto: TDBEdit
          Left = 214
          Top = 99
          Width = 40
          Height = 21
          DataField = 'L_LOCAL_PAGTO'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 2
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_linha_local_pagtoExit
        end
        object dbedt_col_dt_vencto: TDBEdit
          Left = 277
          Top = 122
          Width = 40
          Height = 21
          DataField = 'C_DT_VENCTO'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 4
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_col_dt_venctoExit
        end
        object dbedt_col_local_pagto: TDBEdit
          Left = 277
          Top = 99
          Width = 40
          Height = 21
          DataField = 'C_LOCAL_PAGTO'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 3
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_col_local_pagtoExit
        end
        object dbedt_col_nr_docto: TDBEdit
          Left = 277
          Top = 168
          Width = 40
          Height = 21
          DataField = 'C_NR_DOCTO'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          TabOrder = 7
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_col_nr_doctoExit
        end
        object dbedt_linha_vl_docto: TDBEdit
          Left = 214
          Top = 191
          Width = 40
          Height = 21
          DataField = 'L_VL_DOCTO'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          TabOrder = 8
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_linha_vl_doctoExit
        end
        object dbedt_col_vl_docto: TDBEdit
          Left = 277
          Top = 191
          Width = 40
          Height = 21
          DataField = 'C_VL_DOCTO'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          TabOrder = 9
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_col_vl_doctoExit
        end
        object dbedt_linha_tx_instr: TDBEdit
          Left = 214
          Top = 214
          Width = 40
          Height = 21
          DataField = 'L_TX_INSTR'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          TabOrder = 10
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_linha_tx_instrExit
        end
        object dbedt_col_tx_instr: TDBEdit
          Left = 277
          Top = 214
          Width = 40
          Height = 21
          DataField = 'C_TX_INSTR'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          TabOrder = 11
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_col_tx_instrExit
        end
        object dbedt_linha_nr_fatura: TDBEdit
          Left = 214
          Top = 258
          Width = 40
          Height = 21
          DataField = 'L_NR_FATURA'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          TabOrder = 14
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_linha_nr_faturaExit
        end
        object dbedt_col_nr_fatura: TDBEdit
          Left = 277
          Top = 258
          Width = 40
          Height = 21
          DataField = 'C_NR_FATURA'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          TabOrder = 15
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_col_nr_faturaExit
        end
        object dbedt_linha_sacado: TDBEdit
          Left = 214
          Top = 236
          Width = 40
          Height = 21
          DataField = 'L_SACADO'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          TabOrder = 12
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_linha_sacadoExit
        end
        object dbedt_col_sacado: TDBEdit
          Left = 277
          Top = 236
          Width = 40
          Height = 21
          DataField = 'C_SACADO'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          TabOrder = 13
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_col_sacadoExit
        end
        object dbedt_nr_banco: TDBEdit
          Left = 39
          Top = 58
          Width = 42
          Height = 21
          DataField = 'NR_BANCO'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_linha_local_pagtoChange
          OnExit = dbedt_nr_bancoExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_nm_banco: TDBEdit
          Left = 85
          Top = 58
          Width = 279
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_ajuste_impressao_boleto.ds_ajuste_impressao
          ReadOnly = True
          TabOrder = 16
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
