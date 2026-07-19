object frm_item_contabil: Tfrm_item_contabil
  Left = 171
  Top = 65
  BorderStyle = bsSingle
  Caption = 'Evento Cont'#225'bil'
  ClientHeight = 464
  ClientWidth = 712
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 39
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 8
      Top = 8
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
      Top = 8
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
      Left = 276
      Top = 8
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
      Top = 8
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
      Left = 64
      Top = 8
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
    object lbl_pesquisa: TLabel
      Left = 388
      Top = 1
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
    object lbl_ordem_pesquisa: TLabel
      Left = 524
      Top = 1
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
    object dbnvg: TDBNavigator
      Left = 152
      Top = 8
      Width = 104
      Height = 25
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
    object edt_chave: TEdit
      Left = 388
      Top = 16
      Width = 129
      Height = 21
      TabOrder = 1
      OnChange = edt_chaveChange
      OnKeyDown = edt_chaveKeyDown
    end
    object cb_ordem: TComboBox
      Left = 524
      Top = 16
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnClick = cb_ordemClick
    end
  end
  object pgctrl_item_contabil: TPageControl
    Left = 0
    Top = 39
    Width = 712
    Height = 425
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_item_contabilChange
    OnChanging = pgctrl_item_contabilChanging
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object dbgrid_item_contabil: TDBGrid
        Left = 0
        Top = 0
        Width = 704
        Height = 397
        Align = alClient
        DataSource = datm_item_contabil.ds_item_contabil
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrid_item_contabilDblClick
        OnKeyPress = dbgrid_item_contabilKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_ITEM_CONTABIL'
            Title.Caption = 'C'#243'digo'
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
            FieldName = 'NM_ITEM_CONTABIL'
            Title.Caption = 'Descri'#231#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_in_contabiliza'
            Title.Caption = 'Contabililza'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 91
            Visible = True
          end>
      end
    end
    object ts_contabilizacao: TTabSheet
      Caption = 'Dados '
      ImageIndex = 1
      object PageControl1: TPageControl
        Left = 0
        Top = 44
        Width = 704
        Height = 353
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'Pagamentos'
          object GroupBox2: TGroupBox
            Left = 7
            Top = 1
            Width = 341
            Height = 322
            Caption = 'Provis'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label5: TLabel
              Left = 11
              Top = 20
              Width = 42
              Height = 13
              Caption = 'M'#243'dulo'
            end
            object Label3: TLabel
              Left = 10
              Top = 50
              Width = 27
              Height = 13
              Caption = 'C'#243'd.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 66
              Top = 50
              Width = 65
              Height = 13
              Caption = 'Hist CompL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 236
              Top = 50
              Width = 65
              Height = 13
              Caption = 'Hist CompL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label16: TLabel
              Left = 180
              Top = 50
              Width = 27
              Height = 13
              Caption = 'C'#243'd.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 56
              Top = 15
              Width = 249
              Height = 21
              DataField = 'Look_mod_pagto_prov'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = dbedt_nm_itemChange
            end
            object DBEdit2: TDBEdit
              Left = 10
              Top = 65
              Width = 50
              Height = 21
              DataField = 'CD_HIST_PAGTO_PROVISAO'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = dbedt_nm_itemChange
            end
            object DBEdit3: TDBEdit
              Left = 66
              Top = 65
              Width = 75
              Height = 21
              DataField = 'NM_HIST_PAGTO_PROVISAO'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnChange = dbedt_nm_itemChange
            end
            object rd1: TDBRadioGroup
              Left = 10
              Top = 95
              Width = 130
              Height = 160
              Caption = 'Debitar '
              DataField = 'IN_PAGTO_DEB_PROVISAO'
              DataSource = datm_item_contabil.ds_item_contabil
              Items.Strings = (
                'Processo'
                'Agente'
                'Cliente'
                'Banco/Caixa'
                'Favorecido'
                'Outro'
                'Nenhum')
              TabOrder = 3
              Values.Strings = (
                '3'
                '5'
                '2'
                '1'
                '4'
                '6'
                '7')
              OnChange = dbedt_nm_itemChange
              OnClick = rd1Click
            end
            object rd2: TDBRadioGroup
              Left = 180
              Top = 95
              Width = 130
              Height = 160
              Caption = 'Creditar'
              DataField = 'IN_PAGTO_CRE_PROVISAO'
              DataSource = datm_item_contabil.ds_item_contabil
              Items.Strings = (
                'Processo'
                'Agente'
                'Cliente'
                'Banco/Caixa'
                'Favorecido'
                'Outro'
                'Nenhum')
              TabOrder = 4
              Values.Strings = (
                '3'
                '5'
                '2'
                '1'
                '4'
                '6'
                '7')
              OnChange = dbedt_nm_itemChange
              OnClick = rd2Click
            end
            object bdedt_outro_pagto_deb_prov: TDBEdit
              Left = 10
              Top = 265
              Width = 132
              Height = 21
              DataField = 'NR_OUTRO_PAGTO_DEB_PROVISAO'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnChange = dbedt_nm_itemChange
            end
            object bdedt_outro_pagto_cre_prov: TDBEdit
              Left = 180
              Top = 265
              Width = 132
              Height = 21
              DataField = 'NR_OUTRO_PAGTO_CRE_PROVISAO'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              OnChange = dbedt_nm_itemChange
            end
            object DBEdit10: TDBEdit
              Left = 232
              Top = 65
              Width = 75
              Height = 21
              DataField = 'NM_HIST_PAGTO_PROVISAOII'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              OnChange = dbedt_nm_itemChange
            end
            object DBEdit11: TDBEdit
              Left = 180
              Top = 65
              Width = 48
              Height = 21
              DataField = 'CD_HIST_PAGTO_PROVISAOII'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              OnChange = dbedt_nm_itemChange
            end
          end
          object GroupBox3: TGroupBox
            Left = 354
            Top = 1
            Width = 341
            Height = 322
            Caption = 'Baixa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label1: TLabel
              Left = 21
              Top = 20
              Width = 42
              Height = 13
              Caption = 'M'#243'dulo'
            end
            object Label6: TLabel
              Left = 180
              Top = 50
              Width = 27
              Height = 13
              Caption = 'C'#243'd.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 232
              Top = 50
              Width = 61
              Height = 13
              Caption = 'Hist Compl'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label17: TLabel
              Left = 66
              Top = 50
              Width = 61
              Height = 13
              Caption = 'Hist Compl'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 10
              Top = 50
              Width = 27
              Height = 13
              Caption = 'C'#243'd.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBLookupComboBox2: TDBLookupComboBox
              Left = 66
              Top = 15
              Width = 252
              Height = 21
              DataField = 'Look_mod_pagto_baixa'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = dbedt_nm_itemChange
            end
            object DBEdit4: TDBEdit
              Left = 180
              Top = 65
              Width = 50
              Height = 21
              DataField = 'CD_HIST_PAGTO_BAIXAII'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = dbedt_nm_itemChange
            end
            object DBEdit5: TDBEdit
              Left = 232
              Top = 65
              Width = 75
              Height = 21
              DataField = 'NM_HIST_PAGTO_BAIXAII'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnChange = dbedt_nm_itemChange
            end
            object rd3: TDBRadioGroup
              Left = 10
              Top = 95
              Width = 130
              Height = 160
              Caption = 'Debitar '
              DataField = 'IN_PAGTO_DEB_BAIXA'
              DataSource = datm_item_contabil.ds_item_contabil
              Items.Strings = (
                'Processo'
                'Agente'
                'Cliente'
                'Banco/Caixa'
                'Favorecido'
                'Outro'
                'Nenhum')
              TabOrder = 3
              Values.Strings = (
                '3'
                '5'
                '2'
                '1'
                '4'
                '6'
                '7')
              OnChange = dbedt_nm_itemChange
              OnClick = rd3Click
            end
            object bdedt_outro_pagto_deb_baixa: TDBEdit
              Left = 10
              Top = 265
              Width = 130
              Height = 21
              DataField = 'NR_OUTRO_PAGTO_DEB_BAIXA'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnChange = dbedt_nm_itemChange
            end
            object bdedt_outro_pagto_cre_baixa: TDBEdit
              Left = 180
              Top = 265
              Width = 130
              Height = 21
              DataField = 'NR_OUTRO_PAGTO_CRE_BAIXA'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnChange = dbedt_nm_itemChange
            end
            object DBEdit12: TDBEdit
              Left = 66
              Top = 65
              Width = 75
              Height = 21
              DataField = 'NM_HIST_PAGTO_BAIXA'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              OnChange = dbedt_nm_itemChange
            end
            object DBEdit13: TDBEdit
              Left = 10
              Top = 65
              Width = 50
              Height = 21
              DataField = 'CD_HIST_PAGTO_BAIXA'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              OnChange = dbedt_nm_itemChange
            end
            object rd4: TDBRadioGroup
              Left = 182
              Top = 95
              Width = 130
              Height = 160
              Caption = 'Creditar '
              DataField = 'IN_PAGTO_CRE_BAIXA'
              DataSource = datm_item_contabil.ds_item_contabil
              Items.Strings = (
                'Processo'
                'Agente'
                'Cliente'
                'Banco/Caixa'
                'Favorecido'
                'Outro'
                'Nenhum')
              TabOrder = 8
              Values.Strings = (
                '3'
                '5'
                '2'
                '1'
                '4'
                '6'
                '7')
              OnChange = dbedt_nm_itemChange
              OnClick = rd4Click
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Recebimentos'
          ImageIndex = 1
          object GroupBox1: TGroupBox
            Left = 350
            Top = 0
            Width = 341
            Height = 323
            Caption = 'Baixa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label2: TLabel
              Left = 13
              Top = 20
              Width = 42
              Height = 13
              Caption = 'M'#243'dulo'
            end
            object Label13: TLabel
              Left = 14
              Top = 50
              Width = 27
              Height = 13
              Caption = 'C'#243'd.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 65
              Top = 50
              Width = 61
              Height = 13
              Caption = 'Hist Compl'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label21: TLabel
              Left = 243
              Top = 50
              Width = 61
              Height = 13
              Caption = 'Hist Compl'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 192
              Top = 50
              Width = 27
              Height = 13
              Caption = 'C'#243'd.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBLookupComboBox4: TDBLookupComboBox
              Left = 60
              Top = 15
              Width = 252
              Height = 21
              DataField = 'Look_mod_receb_baixa'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = dbedt_nm_itemChange
            end
            object DBEdit8: TDBEdit
              Left = 13
              Top = 65
              Width = 50
              Height = 21
              DataField = 'CD_HIST_RECEB_BAIXA'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = dbedt_nm_itemChange
            end
            object DBEdit9: TDBEdit
              Left = 66
              Top = 65
              Width = 75
              Height = 21
              DataField = 'NM_HIST_RECEB_BAIXA'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnChange = dbedt_nm_itemChange
            end
            object rd7: TDBRadioGroup
              Left = 9
              Top = 95
              Width = 128
              Height = 160
              Caption = 'Debitar '
              DataField = 'IN_RECEB_DEB_BAIXA'
              DataSource = datm_item_contabil.ds_item_contabil
              Items.Strings = (
                'Processo'
                'Agente'
                'Cliente'
                'Banco/Caixa'
                'Favorecido'
                'Outro'
                'Nenhum')
              TabOrder = 3
              Values.Strings = (
                '3'
                '5'
                '2'
                '1'
                '4'
                '6 '
                '7')
              OnChange = dbedt_nm_itemChange
              OnClick = rd7Click
            end
            object bdedt_outro_receb_deb_baixa: TDBEdit
              Left = 12
              Top = 265
              Width = 121
              Height = 21
              DataField = 'NR_OUTRO_RECEB_DEB_BAIXA'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnChange = dbedt_nm_itemChange
            end
            object rd8: TDBRadioGroup
              Left = 191
              Top = 95
              Width = 128
              Height = 160
              Caption = 'Creditar'
              DataField = 'IN_RECEB_CRE_BAIXA'
              DataSource = datm_item_contabil.ds_item_contabil
              Items.Strings = (
                'Processo'
                'Agente'
                'Cliente'
                'Banco/Caixa'
                'Favorecido'
                'Outro'
                'Nenhum')
              TabOrder = 5
              Values.Strings = (
                '3'
                '5'
                '2'
                '1'
                '4'
                '6'
                '7')
              OnChange = dbedt_nm_itemChange
              OnClick = rd8Click
            end
            object bdedt_outro_receb_cre_baixa: TDBEdit
              Left = 188
              Top = 265
              Width = 121
              Height = 21
              DataField = 'NR_OUTRO_RECEB_CRE_BAIXA'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              OnChange = dbedt_nm_itemChange
            end
            object DBEdit16: TDBEdit
              Left = 244
              Top = 65
              Width = 75
              Height = 21
              DataField = 'NM_HIST_RECEB_BAIXAII'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              OnChange = dbedt_nm_itemChange
            end
            object DBEdit17: TDBEdit
              Left = 191
              Top = 65
              Width = 50
              Height = 21
              DataField = 'CD_HIST_RECEB_BAIXAII'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              OnChange = dbedt_nm_itemChange
            end
          end
          object GroupBox4: TGroupBox
            Left = 0
            Top = 0
            Width = 341
            Height = 323
            Caption = 'Provis'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label7: TLabel
              Left = 11
              Top = 20
              Width = 42
              Height = 13
              Caption = 'M'#243'dulo'
            end
            object Label11: TLabel
              Left = 11
              Top = 50
              Width = 27
              Height = 13
              Caption = 'C'#243'd.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 64
              Top = 50
              Width = 61
              Height = 13
              Caption = 'Hist Compl'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label19: TLabel
              Left = 232
              Top = 50
              Width = 61
              Height = 13
              Caption = 'Hist Compl'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label20: TLabel
              Left = 179
              Top = 50
              Width = 27
              Height = 13
              Caption = 'C'#243'd.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBLookupComboBox3: TDBLookupComboBox
              Left = 56
              Top = 15
              Width = 252
              Height = 21
              DataField = 'Look_mod_receb_prov'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = dbedt_nm_itemChange
            end
            object DBEdit6: TDBEdit
              Left = 10
              Top = 65
              Width = 50
              Height = 21
              DataField = 'CD_HIST_RECEB_PROVISAO'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = dbedt_nm_itemChange
            end
            object DBEdit7: TDBEdit
              Left = 65
              Top = 65
              Width = 75
              Height = 21
              DataField = 'NM_HIST_RECEB_PROVISAO'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnChange = dbedt_nm_itemChange
            end
            object rd5: TDBRadioGroup
              Left = 9
              Top = 96
              Width = 130
              Height = 160
              Caption = 'Debitar'
              DataField = 'IN_RECEB_DEB_PROVISAO'
              DataSource = datm_item_contabil.ds_item_contabil
              Items.Strings = (
                'Processo'
                'Agente'
                'Cliente'
                'Banco/Caixa'
                'Favorecido'
                'Outro'
                'Nenhum')
              TabOrder = 3
              Values.Strings = (
                '3'
                '5'
                '2'
                '1'
                '4'
                '6'
                '7')
              OnChange = dbedt_nm_itemChange
              OnClick = rd5Click
            end
            object bdedt_outro_receb_deb_prov: TDBEdit
              Left = 11
              Top = 265
              Width = 121
              Height = 21
              DataField = 'NR_OUTRO_RECEB_DEB_PROVISAO'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnChange = dbedt_nm_itemChange
            end
            object rd6: TDBRadioGroup
              Left = 181
              Top = 95
              Width = 130
              Height = 160
              Caption = 'Creditar '
              DataField = 'IN_RECEB_CRE_PROVISAO'
              DataSource = datm_item_contabil.ds_item_contabil
              Items.Strings = (
                'Processo'
                'Agente'
                'Cliente'
                'Banco/Caixa'
                'Favorecido'
                'Outro'
                'Nenhum')
              TabOrder = 5
              Values.Strings = (
                '3'
                '5'
                '2'
                '1'
                '4'
                '6'
                '7')
              OnChange = dbedt_nm_itemChange
              OnClick = rd6Click
            end
            object bdedt_outro_receb_cre_prov: TDBEdit
              Left = 183
              Top = 265
              Width = 121
              Height = 21
              DataField = 'NR_OUTRO_RECEB_CRE_PROVISAO'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              OnChange = dbedt_nm_itemChange
            end
            object DBEdit14: TDBEdit
              Left = 233
              Top = 65
              Width = 75
              Height = 21
              DataField = 'NM_HIST_RECEB_PROVISAOII'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              OnChange = dbedt_nm_itemChange
            end
            object DBEdit15: TDBEdit
              Left = 178
              Top = 65
              Width = 50
              Height = 21
              DataField = 'CD_HIST_RECEB_PROVISAOII'
              DataSource = datm_item_contabil.ds_item_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              OnChange = dbedt_nm_itemChange
            end
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 704
        Height = 44
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label8: TLabel
          Left = 8
          Top = 3
          Width = 40
          Height = 13
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 55
          Top = 3
          Width = 58
          Height = 13
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 18
          Width = 41
          Height = 21
          Color = clMenu
          DataField = 'CD_ITEM_CONTABIL'
          DataSource = datm_item_contabil.ds_item_contabil
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nm_item: TDBEdit
          Left = 55
          Top = 17
          Width = 487
          Height = 21
          DataField = 'NM_ITEM_CONTABIL'
          DataSource = datm_item_contabil.ds_item_contabil
          TabOrder = 1
          OnChange = dbedt_nm_itemChange
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 552
          Top = 3
          Width = 147
          Height = 37
          Caption = 'Contabilliza'
          Columns = 2
          DataField = 'IN_CONTABILIZA'
          DataSource = datm_item_contabil.ds_item_contabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ParentFont = False
          TabOrder = 2
          Values.Strings = (
            '1'
            '0')
          OnChange = dbedt_nm_itemChange
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 476
    Top = 246
    object mi_Incluir: TMenuItem
      Caption = '&Incluir'
    end
    object mi_Salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_Cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_Excluir: TMenuItem
      Caption = '&Excluir'
      OnClick = btn_excluirClick
    end
    object TMenuItem
    end
    object mi_Sair: TMenuItem
      Caption = 'Sai&r'
    end
  end
end
