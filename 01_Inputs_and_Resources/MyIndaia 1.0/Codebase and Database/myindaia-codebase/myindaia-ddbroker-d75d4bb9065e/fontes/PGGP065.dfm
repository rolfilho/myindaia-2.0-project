object frm_release: Tfrm_release
  Left = 225
  Top = 133
  Width = 640
  Height = 480
  Caption = 'Informa'#231#227'o da Vers'#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_release
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_release: TPanel
    Left = 8
    Top = 0
    Width = 329
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 7
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Nova Vers'#227'o'
      Enabled = False
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
      Layout = blGlyphBottom
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_incluirClick
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 65
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
      Left = 94
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
      Left = 292
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
    object btn_frm_release: TSpeedButton
      Left = 253
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Release da Vers'#227'o'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F733373FF333333999999999
        3333333773FFFF773F3333999FFFFF9993333373377777F373F3399999FFF999
        993337F333777F3337F3399999FFF9999933373333777F33373F999999FFF999
        99937F3333777F33337F999999FFF99999937F3333777F33337F999999FFF999
        99937F3333777F33337F999999FFF99999937F3333777F33337F99999FFFF999
        999373F3377773333373399999999999993337F3333F333337F33999999F9999
        9933373F3337F3333733339999FFF99993333373FF777F3F73333339999F9999
        3333333773F7FF77333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_frm_releaseClick
    end
    object dbnvg: TDBNavigator
      Left = 133
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_release.ds_lista
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
  end
  object Panel3: TPanel
    Left = 344
    Top = 0
    Width = 281
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 1
    object Label5: TLabel
      Left = 12
      Top = 2
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
    object Label6: TLabel
      Left = 147
      Top = 2
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
    object cb_ordem: TComboBox
      Left = 147
      Top = 17
      Width = 125
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cb_ordemChange
      Items.Strings = (
        '')
    end
    object msk_edt_chave: TMaskEdit
      Left = 13
      Top = 17
      Width = 129
      Height = 21
      TabOrder = 1
      OnChange = msk_edt_chaveChange
    end
  end
  object pgctrl_release: TPageControl
    Left = 8
    Top = 56
    Width = 617
    Height = 370
    ActivePage = ts_lista
    TabOrder = 2
    OnChange = pgctrl_releaseChange
    OnChanging = pgctrl_releaseChanging
    object ts_lista: TTabSheet
      Caption = 'Lista das Vers'#245'es'
      object dbg_release: TDBGrid
        Left = 4
        Top = 5
        Width = 599
        Height = 331
        DataSource = datm_release.ds_lista
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_VERSAO'
            Title.Caption = 'Vers'#227'o'
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
            FieldName = 'NR_ITEM'
            Title.Caption = 'Item'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PATH_TELA'
            Title.Caption = 'Caminho'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 459
            Visible = True
          end>
      end
    end
    object ts_info: TTabSheet
      Caption = 'Descri'#231#227'o'
      object Label1: TLabel
        Left = 7
        Top = 6
        Width = 80
        Height = 13
        Caption = 'N.'#186' da Vers'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 115
        Top = 6
        Width = 65
        Height = 13
        Caption = 'N.'#186' do Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 65
        Width = 82
        Height = 13
        Caption = 'Dispon'#237'vel em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 9
        Top = 131
        Width = 67
        Height = 13
        Caption = 'Pend'#234'ncias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 313
        Top = 131
        Width = 61
        Height = 13
        Caption = 'Altera'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 311
        Top = 6
        Width = 47
        Height = 13
        Caption = 'Release'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 200
        Top = 6
        Width = 76
        Height = 13
        Caption = 'Classifica'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_nr_versao: TDBEdit
        Left = 7
        Top = 22
        Width = 90
        Height = 21
        DataField = 'NR_VERSAO'
        DataSource = datm_release.ds_lista
        MaxLength = 8
        TabOrder = 0
        OnChange = dbedt_nr_versaoChange
      end
      object dbedt_nr_item: TDBEdit
        Left = 115
        Top = 22
        Width = 41
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NR_ITEM'
        DataSource = datm_release.ds_lista
        MaxLength = 3
        TabOrder = 5
        OnChange = dbedt_nr_itemChange
      end
      object dbedt_path_tela: TDBEdit
        Left = 8
        Top = 80
        Width = 289
        Height = 21
        DataField = 'PATH_TELA'
        DataSource = datm_release.ds_lista
        MaxLength = 200
        TabOrder = 2
        OnChange = dbedt_path_telaChange
      end
      object dbm_pendencia: TDBMemo
        Left = 8
        Top = 146
        Width = 290
        Height = 187
        DataField = 'TX_PENDENCIA'
        DataSource = datm_release.ds_lista
        TabOrder = 4
        OnChange = dbm_pendenciaChange
      end
      object dbm_alteracoes: TDBMemo
        Left = 312
        Top = 146
        Width = 290
        Height = 187
        DataField = 'TX_ALTERACOES'
        DataSource = datm_release.ds_lista
        TabOrder = 6
        OnChange = dbm_alteracoesChange
      end
      object dbm_release: TDBMemo
        Left = 311
        Top = 22
        Width = 290
        Height = 99
        DataField = 'TX_RELEASE'
        DataSource = datm_release.ds_lista
        ScrollBars = ssVertical
        TabOrder = 3
        OnChange = dbm_releaseChange
      end
      object dblckpbox_release: TDBLookupComboBox
        Left = 200
        Top = 22
        Width = 97
        Height = 21
        DataField = 'Look_release'
        DataSource = datm_release.ds_lista
        DropDownRows = 4
        TabOrder = 1
        OnClick = dblckpbox_releaseClick
      end
    end
  end
  object menu_release: TMainMenu
    Left = 408
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
    object mi_release: TMenuItem
      Caption = 'Release da &Vers'#227'o'
      OnClick = btn_frm_releaseClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
