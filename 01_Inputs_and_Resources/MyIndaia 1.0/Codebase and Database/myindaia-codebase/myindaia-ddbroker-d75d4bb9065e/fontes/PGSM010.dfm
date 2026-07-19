object frm_produto: Tfrm_produto
  Left = 181
  Top = 113
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tabela de Produto'
  ClientHeight = 434
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
      Left = 8
      Top = 12
      Width = 25
      Height = 25
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
      DataSource = datm_produto.ds_produto_lista
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
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
  object pgctrl_produto: TPageControl
    Left = 0
    Top = 52
    Width = 629
    Height = 381
    ActivePage = ts_lista
    TabOrder = 2
    OnChange = pgctrl_produtoChange
    OnChanging = pgctrl_produtoChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 4
        Top = 4
        Width = 609
        Height = 341
        DataSource = datm_produto.ds_produto_lista
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
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
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_PRODUTO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_PRODUTO'
            Title.Alignment = taCenter
            Title.Caption = 'Descri'#231#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 278
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_PRODUTO'
            Title.Alignment = taCenter
            Title.Caption = 'Apelido'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 154
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'LK_ATIVO'
            Title.Alignment = taCenter
            Title.Caption = 'Ativo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 61
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object pnl_entrada_de_dados: TPanel
        Left = 8
        Top = 8
        Width = 605
        Height = 333
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label3: TLabel
          Left = 36
          Top = 32
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_produto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 93
          Top = 32
          Width = 58
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Descri'#231#227'o'
          FocusControl = dbedt_nm_produto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 36
          Top = 94
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Apelido'
          FocusControl = dbedt_ap_produto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_usuatio_ativo: TLabel
          Left = 474
          Top = 32
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
        object Label6: TLabel
          Left = 142
          Top = 94
          Width = 157
          Height = 13
          AutoSize = False
          Caption = 'Faturamento sem Receita'
          FocusControl = dbedt_ap_produto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 35
          Top = 155
          Width = 157
          Height = 13
          AutoSize = False
          Caption = 'Tipo do Produto'
          FocusControl = dbedt_ap_produto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_produto: TDBEdit
          Left = 36
          Top = 45
          Width = 40
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_PRODUTO'
          DataSource = datm_produto.ds_produto
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_nm_produtoChange
        end
        object dbedt_nm_produto: TDBEdit
          Left = 93
          Top = 45
          Width = 364
          Height = 21
          DataField = 'NM_PRODUTO'
          DataSource = datm_produto.ds_produto
          TabOrder = 0
          OnChange = dbedt_nm_produtoChange
        end
        object dbedt_ap_produto: TDBEdit
          Left = 36
          Top = 107
          Width = 88
          Height = 21
          DataField = 'AP_PRODUTO'
          DataSource = datm_produto.ds_produto
          TabOrder = 2
          OnChange = dbedt_nm_produtoChange
        end
        object dblkpcbox_ativo: TDBLookupComboBox
          Left = 474
          Top = 45
          Width = 50
          Height = 21
          DataField = 'IN_ATIVO'
          DataSource = datm_produto.ds_produto
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_produto.ds_yesno
          TabOrder = 1
          OnClick = dbedt_nm_produtoChange
        end
        object dblckbox_fat_sem_rec: TDBLookupComboBox
          Left = 141
          Top = 107
          Width = 134
          Height = 21
          DataField = 'TP_FAT_SEM_RECEITA'
          DataSource = datm_produto.ds_produto
          DropDownRows = 4
          DropDownWidth = 120
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_produto.ds_yesno
          TabOrder = 3
          OnClick = dbedt_nm_produtoChange
        end
        object rxcmbox_tp_produto: TRxDBComboBox
          Left = 36
          Top = 168
          Width = 145
          Height = 21
          Style = csDropDownList
          DataField = 'TP_PRODUTO'
          DataSource = datm_produto.ds_produto
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Importa'#231#227'o'
            'Exporta'#231#227'o'
            'Ambos'
            'Trade'
            'Frete Importa'#231#227'o'
            'Frete Exporta'#231#227'o')
          TabOrder = 5
          Values.Strings = (
            '01'
            '02'
            '03'
            '04'
            '05'
            '06')
          OnChange = dbedt_nm_produtoChange
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 556
    Top = 364
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
end
