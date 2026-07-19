object frm_ag_tx: Tfrm_ag_tx
  Left = 147
  Top = 85
  Width = 640
  Height = 480
  Caption = 'Cadastro de Taxa do Agente'
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
  object pgctrl_ag_tx: TPageControl
    Left = 0
    Top = 49
    Width = 632
    Height = 383
    ActivePage = ts_lista
    TabOrder = 0
    OnChange = pgctrl_ag_txChange
    OnChanging = pgctrl_ag_txChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_ag_tx: TDBGrid
        Left = 8
        Top = 11
        Width = 607
        Height = 337
        DataSource = datm_ag_tx.ds_ag_tx
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_ag_txDblClick
        OnKeyPress = dbg_ag_txKeyPress
        Columns = <
          item
            FieldName = 'CD_TAXA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 45
          end
          item
            FieldName = 'NM_TAXA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 300
          end
          item
            FieldName = 'look_ativo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 45
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados Básicos'
      object pnl_ag_tx: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 355
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Bevel2: TBevel
          Left = 86
          Top = 110
          Width = 352
          Height = 17
        end
        object Bevel1: TBevel
          Left = 40
          Top = 69
          Width = 449
          Height = 169
          Shape = bsFrame
        end
        object Label3: TLabel
          Left = 40
          Top = 29
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'Código'
          FocusControl = dbedt_cd_ag_tx
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 128
          Top = 29
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Descrição'
          FocusControl = dbedt_nm_ag_tx
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ativo: TLabel
          Left = 499
          Top = 29
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
        object Label5: TLabel
          Left = 86
          Top = 129
          Width = 73
          Height = 13
          Caption = 'Container 20'
          FocusControl = dbedt_VL_CPTZ_CNTR_20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 174
          Top = 129
          Width = 73
          Height = 13
          Caption = 'Container 40'
          FocusControl = dbedt_VL_CPTZ_CNTR_40
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 270
          Top = 129
          Width = 67
          Height = 13
          Caption = 'Carga Solta'
          FocusControl = dbedt_VL_CPTZ_C_SOLTA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 366
          Top = 129
          Width = 42
          Height = 13
          Caption = 'Mínima'
          FocusControl = dbedt_VL_CPTZ_MINIMA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 86
          Top = 178
          Width = 66
          Height = 13
          Caption = 'Liberac. BL'
          FocusControl = dbedt_VL_LIBERACAO_BL
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 47
          Top = 85
          Width = 39
          Height = 13
          Caption = 'Taxas '
          FocusControl = dbedt_VL_CPTZ_CNTR_20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 227
          Top = 111
          Width = 57
          Height = 13
          Caption = 'Capatazia'
          FocusControl = dbedt_VL_CPTZ_CNTR_20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_ag_tx: TDBEdit
          Left = 40
          Top = 44
          Width = 82
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_TAXA'
          DataSource = datm_ag_tx.ds_ag_tx
          TabOrder = 7
          OnChange = dbedt_nm_ag_txChange
        end
        object dbedt_nm_ag_tx: TDBEdit
          Left = 128
          Top = 44
          Width = 363
          Height = 21
          DataField = 'NM_TAXA'
          DataSource = datm_ag_tx.ds_ag_tx
          TabOrder = 0
          OnChange = dbedt_nm_ag_txChange
        end
        object dblkpcbox_ativo_ag: TDBLookupComboBox
          Left = 499
          Top = 44
          Width = 66
          Height = 21
          DataField = 'look_ativo'
          DataSource = datm_ag_tx.ds_ag_tx
          DropDownRows = 3
          TabOrder = 1
          OnClick = dbedt_nm_ag_txChange
        end
        object dbedt_VL_CPTZ_CNTR_20: TDBEdit
          Left = 86
          Top = 143
          Width = 71
          Height = 21
          DataField = 'VL_CPTZ_CNTR_20'
          DataSource = datm_ag_tx.ds_ag_tx
          TabOrder = 2
          OnChange = dbedt_nm_ag_txChange
        end
        object dbedt_VL_CPTZ_CNTR_40: TDBEdit
          Left = 175
          Top = 143
          Width = 70
          Height = 21
          DataField = 'VL_CPTZ_CNTR_40'
          DataSource = datm_ag_tx.ds_ag_tx
          TabOrder = 3
          OnChange = dbedt_nm_ag_txChange
        end
        object dbedt_VL_CPTZ_C_SOLTA: TDBEdit
          Left = 270
          Top = 143
          Width = 71
          Height = 21
          DataField = 'VL_CPTZ_C_SOLTA'
          DataSource = datm_ag_tx.ds_ag_tx
          TabOrder = 4
          OnChange = dbedt_nm_ag_txChange
        end
        object dbedt_VL_CPTZ_MINIMA: TDBEdit
          Left = 366
          Top = 143
          Width = 71
          Height = 21
          DataField = 'VL_CPTZ_MINIMA'
          DataSource = datm_ag_tx.ds_ag_tx
          TabOrder = 5
          OnChange = dbedt_nm_ag_txChange
        end
        object dbedt_VL_LIBERACAO_BL: TDBEdit
          Left = 86
          Top = 191
          Width = 71
          Height = 21
          DataField = 'VL_LIBERACAO_BL'
          DataSource = datm_ag_tx.ds_ag_tx
          TabOrder = 6
          OnChange = dbedt_nm_ag_txChange
        end
      end
    end
  end
  object pnl_btn_ag_tx: TPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 1
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
      DataSource = datm_ag_tx.ds_ag_tx
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
  object panel100: TPanel
    Left = 320
    Top = 0
    Width = 309
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 2
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
  object menu_cadastro: TMainMenu
    Left = 568
    Top = 272
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
