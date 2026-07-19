object frm_tx_amg: Tfrm_tx_amg
  Left = 22
  Top = 72
  Width = 640
  Height = 480
  Caption = 'Taxa de Armazenagem'
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
      DataSource = datm_tx_amg.ds_tx_amg
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
  object pgctrl_tx_amg: TPageControl
    Left = 1
    Top = 52
    Width = 629
    Height = 381
    ActivePage = ts_lista
    HotTrack = True
    TabOrder = 2
    OnChange = pgctrl_tx_amgChange
    OnChanging = pgctrl_tx_amgChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 10
        Top = 10
        Width = 605
        Height = 333
        DataSource = datm_tx_amg.ds_tx_amg
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
            FieldName = 'CD_TAXA'
            Title.Color = clBlack
          end
          item
            FieldName = 'NM_DESCRICAO'
            Title.Color = clBlack
            Width = 350
          end
          item
            FieldName = 'look_ativo'
            Title.Color = clBlack
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
        object Label3: TLabel
          Left = 72
          Top = 52
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
          Left = 116
          Top = 52
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
          Left = 475
          Top = 53
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
          Left = 72
          Top = 94
          Width = 101
          Height = 13
          Caption = 'Cntr 20 MD Pallet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 72
          Top = 133
          Width = 106
          Height = 13
          Caption = 'Cntr 20 MD Outros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 72
          Top = 171
          Width = 101
          Height = 13
          Caption = 'Cntr 40 MD Pallet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 72
          Top = 213
          Width = 106
          Height = 13
          Caption = 'Cntr 40 MD Outros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 257
          Top = 94
          Width = 65
          Height = 13
          Caption = 'C Solta MD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 257
          Top = 133
          Width = 100
          Height = 13
          Caption = 'Cntr 20 ME Pallet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 257
          Top = 171
          Width = 105
          Height = 13
          Caption = 'Cntr 20 ME Outros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 258
          Top = 213
          Width = 100
          Height = 13
          Caption = 'Cntr 40 ME Pallet'
          FocusControl = dbedt_VL_CNTR_40_ME_PALLET
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 434
          Top = 94
          Width = 105
          Height = 13
          Caption = 'Cntr 40 ME Outros'
          FocusControl = dbedt_VL_CNTR_40_ME_OUTROS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 434
          Top = 133
          Width = 64
          Height = 13
          Caption = 'C Solta ME'
          FocusControl = dbedt_VL_C_SOLTA_ME
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 434
          Top = 171
          Width = 57
          Height = 13
          Caption = 'Vl Mínimo'
          FocusControl = dbedt_VL_MINIMO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_look_ativo: TDBEdit
          Left = 473
          Top = 66
          Width = 53
          Height = 21
          DataField = 'look_ativo'
          DataSource = datm_tx_amg.ds_tx_amg
          TabOrder = 1
          OnClick = dbedt_nm_descricaoChange
        end
        object dbedt_cd_taxa_amg: TDBEdit
          Left = 72
          Top = 66
          Width = 40
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'CD_TAXA'
          DataSource = datm_tx_amg.ds_tx_amg
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_nm_descricao: TDBEdit
          Left = 116
          Top = 66
          Width = 353
          Height = 21
          DataField = 'NM_DESCRICAO'
          DataSource = datm_tx_amg.ds_tx_amg
          TabOrder = 0
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_CNTR_20_MD_PALLET: TDBEdit
          Left = 72
          Top = 107
          Width = 64
          Height = 21
          DataField = 'VL_CNTR_20_MD_PALLET'
          DataSource = datm_tx_amg.ds_tx_amg
          TabOrder = 2
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_CNTR_20_MD_OUTROS: TDBEdit
          Left = 72
          Top = 147
          Width = 64
          Height = 21
          DataField = 'VL_CNTR_20_MD_OUTROS'
          DataSource = datm_tx_amg.ds_tx_amg
          TabOrder = 5
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_CNTR_40_MD_PALLET: TDBEdit
          Left = 72
          Top = 187
          Width = 64
          Height = 21
          DataField = 'VL_CNTR_40_MD_PALLET'
          DataSource = datm_tx_amg.ds_tx_amg
          TabOrder = 8
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_CNTR_40_MD_OUTROS: TDBEdit
          Left = 72
          Top = 227
          Width = 64
          Height = 21
          DataField = 'VL_CNTR_40_MD_OUTROS'
          DataSource = datm_tx_amg.ds_tx_amg
          TabOrder = 11
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_C_SOLTA_MD: TDBEdit
          Left = 257
          Top = 107
          Width = 64
          Height = 21
          DataField = 'VL_C_SOLTA_MD'
          DataSource = datm_tx_amg.ds_tx_amg
          TabOrder = 3
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_CNTR_20_ME_PALLET: TDBEdit
          Left = 257
          Top = 147
          Width = 64
          Height = 21
          DataField = 'VL_CNTR_20_ME_PALLET'
          DataSource = datm_tx_amg.ds_tx_amg
          TabOrder = 6
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_CNTR_20_ME_OUTROS: TDBEdit
          Left = 257
          Top = 187
          Width = 64
          Height = 21
          DataField = 'VL_CNTR_20_ME_OUTROS'
          DataSource = datm_tx_amg.ds_tx_amg
          TabOrder = 9
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_CNTR_40_ME_PALLET: TDBEdit
          Left = 258
          Top = 227
          Width = 64
          Height = 21
          DataField = 'VL_CNTR_40_ME_PALLET'
          DataSource = datm_tx_amg.ds_tx_amg
          TabOrder = 12
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_CNTR_40_ME_OUTROS: TDBEdit
          Left = 434
          Top = 107
          Width = 64
          Height = 21
          DataField = 'VL_CNTR_40_ME_OUTROS'
          DataSource = datm_tx_amg.ds_tx_amg
          TabOrder = 4
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_C_SOLTA_ME: TDBEdit
          Left = 434
          Top = 147
          Width = 64
          Height = 21
          DataField = 'VL_C_SOLTA_ME'
          DataSource = datm_tx_amg.ds_tx_amg
          TabOrder = 7
          OnChange = dbedt_nm_descricaoChange
        end
        object dbedt_VL_MINIMO: TDBEdit
          Left = 434
          Top = 187
          Width = 64
          Height = 21
          DataField = 'VL_MINIMO'
          DataSource = datm_tx_amg.ds_tx_amg
          TabOrder = 10
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
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
