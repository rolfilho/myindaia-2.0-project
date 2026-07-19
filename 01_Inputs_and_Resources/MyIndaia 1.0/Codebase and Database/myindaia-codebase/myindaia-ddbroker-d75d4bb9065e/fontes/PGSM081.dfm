object frm_tx_tra: Tfrm_tx_tra
  Left = 134
  Top = 69
  Width = 640
  Height = 480
  Caption = 'Taxa de Tra'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel300: TPanel
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
    object dbnvg: TDBNavigator
      Left = 148
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_tx_tra.ds_tx_tra
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Próxima'
        'Última')
      TabOrder = 0
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
      OnClick = cb_ordemClick
    end
  end
  object pgctrl_tx_tra: TPageControl
    Left = 0
    Top = 52
    Width = 629
    Height = 381
    ActivePage = ts_lista
    TabOrder = 2
    OnChange = pgctrl_tx_traChange
    OnChanging = pgctrl_tx_traChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 10
        Top = 11
        Width = 605
        Height = 333
        DataSource = datm_tx_tra.ds_tx_tra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDblClick = dbg_cadastroDblClick
        OnKeyPress = dbg_cadastroKeyPress
        Columns = <
          item
            FieldName = 'CD_TAXA_TRA'
            Title.Color = clBlack
            Width = 48
          end
          item
            FieldName = 'NM_DESCRICAO'
            Title.Color = clBlack
            Width = 280
          end
          item
            FieldName = 'look_ativo'
            Title.Color = clBlack
            Width = 38
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados Básicos'
      object TPanel
        Left = 8
        Top = 9
        Width = 605
        Height = 333
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Bevel5: TBevel
          Left = 490
          Top = 212
          Width = 106
          Height = 116
        end
        object Bevel4: TBevel
          Left = 490
          Top = 43
          Width = 106
          Height = 166
        end
        object Bevel3: TBevel
          Left = 255
          Top = 43
          Width = 232
          Height = 286
        end
        object Bevel1: TBevel
          Left = 32
          Top = 43
          Width = 108
          Height = 286
        end
        object Bevel2: TBevel
          Left = 144
          Top = 43
          Width = 108
          Height = 286
        end
        object Label3: TLabel
          Left = 32
          Top = 4
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 76
          Top = 4
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 435
          Top = 5
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Ativo'
          FocusControl = dbedt_look_ativo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 55
          Top = 59
          Width = 62
          Height = 13
          Caption = 'Cntr Conv 20'
          FocusControl = dbedt_VL_THC_CNTR_20
        end
        object Label7: TLabel
          Left = 55
          Top = 96
          Width = 62
          Height = 13
          Caption = 'Cntr Conv 40'
          FocusControl = dbedt_VL_THC_CNTR_40
        end
        object Label8: TLabel
          Left = 55
          Top = 135
          Width = 55
          Height = 13
          Caption = 'Carga Solta'
          FocusControl = dbedt_VL_THC_C_SOLTA
        end
        object Label9: TLabel
          Left = 55
          Top = 175
          Width = 72
          Height = 13
          Caption = 'Cntr 20 RO RO'
          FocusControl = dbedt_VL_THC_CNTR_20_RORO
        end
        object Label10: TLabel
          Left = 54
          Top = 214
          Width = 69
          Height = 13
          Caption = 'Cntr 40 RORO'
          FocusControl = dbedt_VL_THC_CNTR_40_RORO
        end
        object Label11: TLabel
          Left = 54
          Top = 253
          Width = 72
          Height = 13
          Caption = 'C Solta RO RO'
          FocusControl = dbedt_VL_THC_C_SOLTA_RORO
        end
        object Label12: TLabel
          Left = 54
          Top = 288
          Width = 47
          Height = 13
          Caption = 'Vl Mínimo'
          FocusControl = dbedt_VL_THC_MIN
        end
        object Label13: TLabel
          Left = 163
          Top = 59
          Width = 55
          Height = 13
          Caption = 'Cntr 20 MM'
          FocusControl = dbedt_VL_CARR_CNTR_20_MM
        end
        object Label14: TLabel
          Left = 163
          Top = 93
          Width = 54
          Height = 13
          Caption = 'Cntr 20 MO'
          FocusControl = dbedt_VL_CARR_CNTR_20_MO
        end
        object Label15: TLabel
          Left = 162
          Top = 126
          Width = 55
          Height = 13
          Caption = 'Cntr 40 MM'
          FocusControl = dbedt_VL_CARR_CNTR_40_MM
        end
        object Label16: TLabel
          Left = 162
          Top = 159
          Width = 54
          Height = 13
          Caption = 'Cntr 40 MO'
          FocusControl = dbedt_VL_CARR_CNTR_40_MO
        end
        object Label17: TLabel
          Left = 162
          Top = 193
          Width = 55
          Height = 13
          Caption = 'C Solta MM'
          FocusControl = dbedt_VL_CARR_C_SOLTA_MM
        end
        object Label18: TLabel
          Left = 162
          Top = 226
          Width = 54
          Height = 13
          Caption = 'C Solta MO'
          FocusControl = dbedt_VL_CARR_C_SOLTA_MO
        end
        object Label19: TLabel
          Left = 163
          Top = 259
          Width = 47
          Height = 13
          Caption = 'Vl Mínimo'
          FocusControl = dbedt_VL_CARR_MIN
        end
        object Label20: TLabel
          Left = 162
          Top = 292
          Width = 54
          Height = 13
          Caption = '% Acr Perig'
          FocusControl = dbedt_PC_ACR_CARR_PERIGO
        end
        object Label21: TLabel
          Left = 285
          Top = 57
          Width = 52
          Height = 13
          Caption = 'Nr Período'
          FocusControl = dbedt_NR_PERIODO_ARM
        end
        object Label22: TLabel
          Left = 285
          Top = 97
          Width = 51
          Height = 13
          Caption = 'Cntr 1º Per'
          FocusControl = dbedt_VL_ARM_CNTR_1P
        end
        object Label23: TLabel
          Left = 285
          Top = 137
          Width = 49
          Height = 13
          Caption = 'Cntr D Per'
          FocusControl = dbedt_VL_ARM_CNTR_DP
        end
        object Label24: TLabel
          Left = 285
          Top = 177
          Width = 54
          Height = 13
          Caption = 'Cntr 20 Min'
          FocusControl = dbedt_VL_ARM_CNTR_20_MIN
        end
        object Label25: TLabel
          Left = 285
          Top = 217
          Width = 54
          Height = 13
          Caption = 'Cntr 40 Min'
          FocusControl = dbedt_VL_ARM_CNTR_40_MIN
        end
        object Label26: TLabel
          Left = 285
          Top = 257
          Width = 52
          Height = 13
          Caption = 'Cntr Reimp'
          FocusControl = dbedt_VL_ARM_CNTR_REIMP
        end
        object Label27: TLabel
          Left = 285
          Top = 291
          Width = 66
          Height = 13
          Caption = 'C Solta 1º Per'
          FocusControl = dbedt_VL_ARM_C_SOLTA_1P
        end
        object Label28: TLabel
          Left = 387
          Top = 56
          Width = 66
          Height = 13
          Caption = 'C Solta 2º Per'
          FocusControl = dbedt_VL_ARM_C_SOLTA_2P
        end
        object Label29: TLabel
          Left = 387
          Top = 96
          Width = 66
          Height = 13
          Caption = 'C Solta 3º Per'
          FocusControl = dbedt_VL_ARM_C_SOLTA_3P
        end
        object Label30: TLabel
          Left = 387
          Top = 136
          Width = 64
          Height = 13
          Caption = 'C Solta D Per'
          FocusControl = dbedt_VL_ARM_C_SOLTA_DP
        end
        object Label31: TLabel
          Left = 387
          Top = 176
          Width = 54
          Height = 13
          Caption = 'C Solta Min'
          FocusControl = dbedt_VL_ARM_C_SOLTA_MIN
        end
        object Label32: TLabel
          Left = 387
          Top = 216
          Width = 56
          Height = 13
          Caption = 'C Solta Bag'
          FocusControl = dbedt_VL_ARM_C_SOLTA_BAGAGEM
        end
        object Label33: TLabel
          Left = 387
          Top = 256
          Width = 67
          Height = 13
          Caption = 'C Solta Reimp'
          FocusControl = dbedt_VL_ARM_C_SOLTA_REIMP
        end
        object Label34: TLabel
          Left = 386
          Top = 291
          Width = 54
          Height = 13
          Caption = '% Acr Perig'
          FocusControl = dbedt_PC_ACR_ARM_PERIGO
        end
        object Label35: TLabel
          Left = 513
          Top = 60
          Width = 41
          Height = 13
          Caption = 'Cntr Fixo'
          FocusControl = dbedt_VL_ENERGIA_CNTR_FIXO
        end
        object Label36: TLabel
          Left = 513
          Top = 100
          Width = 34
          Height = 13
          Caption = 'Cntr 20'
          FocusControl = dbedt_VL_ENERGIA_CNTR_20
        end
        object Label37: TLabel
          Left = 513
          Top = 140
          Width = 34
          Height = 13
          Caption = 'Cntr 40'
          FocusControl = dbedt_VL_ENERGIA_CNTR_40
        end
        object Label38: TLabel
          Left = 515
          Top = 252
          Width = 44
          Height = 13
          Caption = 'Taxa ISS'
          FocusControl = dbedt_PC_ISS
        end
        object Label39: TLabel
          Left = 72
          Top = 43
          Width = 26
          Height = 13
          Caption = 'THC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label40: TLabel
          Left = 157
          Top = 43
          Width = 79
          Height = 13
          Caption = 'Carregamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label41: TLabel
          Left = 333
          Top = 43
          Width = 79
          Height = 13
          Caption = 'Armazenagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label42: TLabel
          Left = 498
          Top = 45
          Width = 91
          Height = 13
          Caption = 'Energia Elétrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object dbedt_look_ativo: TDBEdit
          Left = 433
          Top = 18
          Width = 53
          Height = 21
          DataField = 'look_ativo'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 1
          OnClick = dbedt_nm_descricaoChange
        end
        object dbedt_cd_taxa_tra: TDBEdit
          Left = 32
          Top = 18
          Width = 40
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'CD_TAXA_TRA'
          DataSource = datm_tx_tra.ds_tx_tra
          Enabled = False
          TabOrder = 2
        end
        object dbedt_nm_descricao: TDBEdit
          Left = 76
          Top = 18
          Width = 353
          Height = 21
          DataField = 'NM_DESCRICAO'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 0
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_THC_CNTR_20: TDBEdit
          Left = 55
          Top = 72
          Width = 64
          Height = 21
          DataField = 'VL_THC_CNTR_20'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 3
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_THC_CNTR_40: TDBEdit
          Left = 55
          Top = 109
          Width = 64
          Height = 21
          DataField = 'VL_THC_CNTR_40'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 4
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_THC_C_SOLTA: TDBEdit
          Left = 55
          Top = 149
          Width = 64
          Height = 21
          DataField = 'VL_THC_C_SOLTA'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 5
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_THC_CNTR_20_RORO: TDBEdit
          Left = 55
          Top = 188
          Width = 64
          Height = 21
          DataField = 'VL_THC_CNTR_20_RORO'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 6
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_THC_CNTR_40_RORO: TDBEdit
          Left = 54
          Top = 227
          Width = 64
          Height = 21
          DataField = 'VL_THC_CNTR_40_RORO'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 7
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_THC_C_SOLTA_RORO: TDBEdit
          Left = 54
          Top = 266
          Width = 64
          Height = 21
          DataField = 'VL_THC_C_SOLTA_RORO'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 8
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_THC_MIN: TDBEdit
          Left = 54
          Top = 300
          Width = 64
          Height = 21
          DataField = 'VL_THC_MIN'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 9
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_CARR_CNTR_20_MM: TDBEdit
          Left = 162
          Top = 71
          Width = 64
          Height = 21
          DataField = 'VL_CARR_CNTR_20_MM'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 10
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_CARR_CNTR_20_MO: TDBEdit
          Left = 162
          Top = 105
          Width = 64
          Height = 21
          DataField = 'VL_CARR_CNTR_20_MO'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 11
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_CARR_CNTR_40_MM: TDBEdit
          Left = 162
          Top = 138
          Width = 64
          Height = 21
          DataField = 'VL_CARR_CNTR_40_MM'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 12
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_CARR_CNTR_40_MO: TDBEdit
          Left = 162
          Top = 171
          Width = 64
          Height = 21
          DataField = 'VL_CARR_CNTR_40_MO'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 13
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_CARR_C_SOLTA_MM: TDBEdit
          Left = 162
          Top = 205
          Width = 64
          Height = 21
          DataField = 'VL_CARR_C_SOLTA_MM'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 14
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_CARR_C_SOLTA_MO: TDBEdit
          Left = 162
          Top = 238
          Width = 64
          Height = 21
          DataField = 'VL_CARR_C_SOLTA_MO'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 15
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_CARR_MIN: TDBEdit
          Left = 162
          Top = 272
          Width = 64
          Height = 21
          DataField = 'VL_CARR_MIN'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 16
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_PC_ACR_CARR_PERIGO: TDBEdit
          Left = 162
          Top = 304
          Width = 64
          Height = 21
          DataField = 'PC_ACR_CARR_PERIGO'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 17
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_NR_PERIODO_ARM: TDBEdit
          Left = 285
          Top = 70
          Width = 64
          Height = 21
          DataField = 'NR_PERIODO_ARM'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 18
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_ARM_CNTR_1P: TDBEdit
          Left = 285
          Top = 110
          Width = 64
          Height = 21
          DataField = 'VL_ARM_CNTR_1P'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 19
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_ARM_CNTR_DP: TDBEdit
          Left = 285
          Top = 150
          Width = 64
          Height = 21
          DataField = 'VL_ARM_CNTR_DP'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 20
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_ARM_CNTR_20_MIN: TDBEdit
          Left = 285
          Top = 190
          Width = 64
          Height = 21
          DataField = 'VL_ARM_CNTR_20_MIN'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 21
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_ARM_CNTR_40_MIN: TDBEdit
          Left = 285
          Top = 230
          Width = 64
          Height = 21
          DataField = 'VL_ARM_CNTR_40_MIN'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 22
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_ARM_CNTR_REIMP: TDBEdit
          Left = 285
          Top = 270
          Width = 64
          Height = 21
          DataField = 'VL_ARM_CNTR_REIMP'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 23
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_ARM_C_SOLTA_1P: TDBEdit
          Left = 285
          Top = 304
          Width = 64
          Height = 21
          DataField = 'VL_ARM_C_SOLTA_1P'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 24
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_ARM_C_SOLTA_2P: TDBEdit
          Left = 387
          Top = 69
          Width = 64
          Height = 21
          DataField = 'VL_ARM_C_SOLTA_2P'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 25
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_ARM_C_SOLTA_3P: TDBEdit
          Left = 387
          Top = 109
          Width = 64
          Height = 21
          DataField = 'VL_ARM_C_SOLTA_3P'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 26
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_ARM_C_SOLTA_DP: TDBEdit
          Left = 387
          Top = 149
          Width = 64
          Height = 21
          DataField = 'VL_ARM_C_SOLTA_DP'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 27
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_ARM_C_SOLTA_MIN: TDBEdit
          Left = 387
          Top = 189
          Width = 64
          Height = 21
          DataField = 'VL_ARM_C_SOLTA_MIN'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 28
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_ARM_C_SOLTA_BAGAGEM: TDBEdit
          Left = 387
          Top = 229
          Width = 64
          Height = 21
          DataField = 'VL_ARM_C_SOLTA_BAGAGEM'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 29
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_ARM_C_SOLTA_REIMP: TDBEdit
          Left = 387
          Top = 269
          Width = 64
          Height = 21
          DataField = 'VL_ARM_C_SOLTA_REIMP'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 30
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_PC_ACR_ARM_PERIGO: TDBEdit
          Left = 386
          Top = 304
          Width = 64
          Height = 21
          DataField = 'PC_ACR_ARM_PERIGO'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 31
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_ENERGIA_CNTR_FIXO: TDBEdit
          Left = 513
          Top = 73
          Width = 64
          Height = 21
          DataField = 'VL_ENERGIA_CNTR_FIXO'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 32
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_ENERGIA_CNTR_20: TDBEdit
          Left = 513
          Top = 113
          Width = 64
          Height = 21
          DataField = 'VL_ENERGIA_CNTR_20'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 33
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_ENERGIA_CNTR_40: TDBEdit
          Left = 513
          Top = 153
          Width = 64
          Height = 21
          DataField = 'VL_ENERGIA_CNTR_40'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 34
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_PC_ISS: TDBEdit
          Left = 515
          Top = 266
          Width = 64
          Height = 21
          DataField = 'PC_ISS'
          DataSource = datm_tx_tra.ds_tx_tra
          TabOrder = 35
          OnChange = dbedt_nm_descricaoChange
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 564
    Top = 372
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
      OnClick = btn_sairClick
    end
  end
end
