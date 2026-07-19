object frm_Caditens_Avancado: Tfrm_Caditens_Avancado
  Left = 205
  Top = 118
  Width = 750
  Height = 550
  Caption = 'Cadastro de Itens Avan'#231'ados'
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 576
    Top = 363
    Width = 25
    Height = 21
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
    OnClick = btn_co_ct_gerencialClick
  end
  object pgctrl_item: TPageControl
    Left = 0
    Top = 51
    Width = 742
    Height = 453
    ActivePage = ts_dados_basicos
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_itemChange
    OnChanging = pgctrl_itemChanging
    object ts_lista: TTabSheet
      Caption = '    Lista    '
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 425
        Align = alClient
        Color = clWhite
        DataSource = datm_CadItens_avancado.ds_item
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
        ReadOnly = True
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
            Expanded = False
            FieldName = 'CD_ITEM'
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
            FieldName = 'NM_ITEM'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 259
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_ativo'
            Title.Caption = 'Ativo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'look_nm_tipo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '   Dados B'#225'sicos   '
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 425
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_nm_item: TLabel
          Left = 55
          Top = 15
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
        object lbl_cd_item: TLabel
          Left = 8
          Top = 15
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
        object lbl_tipo_item: TLabel
          Left = 388
          Top = 60
          Width = 72
          Height = 13
          Caption = 'Tipo do Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 8
          Top = 61
          Width = 116
          Height = 13
          Caption = 'Descri'#231#227'o em Ingl'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 276
          Top = 60
          Width = 43
          Height = 13
          Caption = 'Apelido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ct_contabil: TLabel
          Left = 307
          Top = 141
          Width = 84
          Height = 13
          Caption = 'Conta Cont'#225'bil'
          FocusControl = dbedt_nm_ct_contabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ct_contabil: TSpeedButton
          Left = 590
          Top = 156
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
          OnClick = btn_co_ct_contabilClick
        end
        object lbl_nr_ordem_fat: TLabel
          Left = 528
          Top = 60
          Width = 81
          Height = 13
          Caption = 'Ordem  Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ct_gerencial: TSpeedButton
          Left = 590
          Top = 198
          Width = 25
          Height = 21
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
          OnClick = btn_co_ct_gerencialClick
        end
        object lbl_ct_gerencial: TLabel
          Left = 307
          Top = 184
          Width = 92
          Height = 13
          Caption = 'Conta Gerencial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nm_item: TDBEdit
          Left = 55
          Top = 29
          Width = 400
          Height = 21
          DataField = 'NM_ITEM'
          DataSource = datm_CadItens_avancado.ds_item
          TabOrder = 1
          OnChange = dbedt_nm_itemChange
        end
        object dbedt_cd_item: TDBEdit
          Left = 8
          Top = 30
          Width = 41
          Height = 21
          Color = clMenu
          DataField = 'CD_ITEM'
          DataSource = datm_CadItens_avancado.ds_item
          ReadOnly = True
          TabOrder = 0
        end
        object dblckbox_tipo_item: TDBLookupComboBox
          Left = 386
          Top = 74
          Width = 137
          Height = 21
          DataField = 'CD_TIPO_ITEM'
          DataSource = datm_CadItens_avancado.ds_item
          KeyField = 'CD_TIPO_ITEM'
          ListField = 'NM_TIPO_ITEM'
          ListSource = datm_CadItens_avancado.ds_tipo_item
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          OnClick = dbedt_nm_itemChange
        end
        object dbedt_nm_ingles: TDBEdit
          Left = 8
          Top = 74
          Width = 257
          Height = 21
          DataField = 'NM_ITEM_INGLES'
          DataSource = datm_CadItens_avancado.ds_item
          TabOrder = 2
          OnChange = dbedt_nm_itemChange
        end
        object dbedt_nm_apelido: TDBEdit
          Left = 274
          Top = 74
          Width = 106
          Height = 21
          DataField = 'NM_APELIDO'
          DataSource = datm_CadItens_avancado.ds_item
          TabOrder = 3
          OnChange = dbedt_nm_itemChange
        end
        object dbedt_cd_ct_contabil: TDBEdit
          Left = 307
          Top = 157
          Width = 75
          Height = 21
          DataField = 'CD_CT_CONTABIL'
          DataSource = datm_CadItens_avancado.ds_item
          TabOrder = 7
          OnChange = dbedt_nm_itemChange
          OnExit = dbedt_cd_ct_contabilExit
          OnKeyDown = dbedt_cd_ct_contabilKeyDown
        end
        object dbedt_nm_ct_contabil: TDBEdit
          Left = 388
          Top = 157
          Width = 195
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCtContabil'
          DataSource = datm_CadItens_avancado.ds_item
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_nr_ordem_fat: TDBEdit
          Left = 528
          Top = 74
          Width = 74
          Height = 21
          DataField = 'NR_ORDEM_FAT'
          DataSource = datm_CadItens_avancado.ds_item
          MaxLength = 3
          TabOrder = 5
          OnChange = dbedt_nm_itemChange
        end
        object dbedt_cd_ct_gerencial: TDBEdit
          Left = 307
          Top = 198
          Width = 41
          Height = 21
          DataField = 'CD_CT_GERENCIAL'
          DataSource = datm_CadItens_avancado.ds_item
          TabOrder = 6
          OnChange = dbedt_nm_itemChange
          OnExit = dbedt_cd_ct_gerencialExit
          OnKeyDown = dbedt_cd_ct_contabilKeyDown
        end
        object dbedt_nm_ct_gerencial: TDBEdit
          Left = 355
          Top = 198
          Width = 228
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCtGerencial'
          DataSource = datm_CadItens_avancado.ds_item
          MaxLength = 120
          ReadOnly = True
          TabOrder = 9
        end
        object grp_box_ag: TGroupBox
          Left = 8
          Top = 188
          Width = 289
          Height = 117
          TabOrder = 10
          object Label3: TLabel
            Left = 8
            Top = 16
            Width = 77
            Height = 13
            Caption = 'Tipo de Frete'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 7
            Top = 42
            Width = 140
            Height = 13
            Caption = 'Tipo de Base de C'#225'lculo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 8
            Top = 69
            Width = 102
            Height = 13
            Caption = 'Via de Transporte'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb_sigla_iata: TLabel
            Left = 10
            Top = 93
            Width = 61
            Height = 13
            Caption = 'Sigla IATA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbluckup_tipo_base_calculo: TDBLookupComboBox
            Left = 152
            Top = 40
            Width = 129
            Height = 21
            DataField = 'Look_nm_base_calc'
            DataSource = datm_CadItens_avancado.ds_item
            ListField = 'NM_TP_BASE_CALC_FRETE'
            TabOrder = 0
            OnClick = dbedt_nm_itemChange
          end
          object dbcombo_via_transp: TRxDBComboBox
            Left = 152
            Top = 66
            Width = 129
            Height = 21
            Style = csDropDownList
            DataField = 'CD_VIA_TRANSPORTE'
            DataSource = datm_CadItens_avancado.ds_item
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'A'#233'rea'
              'Mar'#237'tima'
              'Ambos')
            TabOrder = 1
            Values.Strings = (
              '04'
              '01'
              '10')
            OnChange = dbcombo_via_transpChange
          end
          object dbedt_sigla_iata: TDBEdit
            Left = 152
            Top = 89
            Width = 41
            Height = 21
            DataField = 'CD_IATA'
            DataSource = datm_CadItens_avancado.ds_item
            TabOrder = 2
          end
          object dbluckup_tipo_frete: TRxDBComboBox
            Left = 153
            Top = 16
            Width = 129
            Height = 21
            Style = csDropDownList
            DataField = 'TP_FRETE'
            DataSource = datm_CadItens_avancado.ds_item
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'Collect'
              'Prepaid'
              'Ambos')
            TabOrder = 3
            Values.Strings = (
              '1'
              '2'
              '3')
            OnChange = dbcombo_via_transpChange
          end
        end
        object grp_class_item: TGroupBox
          Left = 309
          Top = 98
          Width = 307
          Height = 37
          TabOrder = 11
          object dbcheck_cpmf: TDBCheckBox
            Left = 118
            Top = 12
            Width = 97
            Height = 17
            Caption = 'Cobrar CPMF'
            Color = clBtnFace
            DataField = 'IN_CPMF'
            DataSource = datm_CadItens_avancado.ds_item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbcheck_despesa_diClick
          end
          object dbcheck_calcula_ir: TDBCheckBox
            Left = 218
            Top = 10
            Width = 81
            Height = 17
            Caption = 'Calcular IR'
            DataField = 'IN_CALCULA_IR'
            DataSource = datm_CadItens_avancado.ds_item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbcheck_despesa_diClick
          end
          object dbcheck_despesa_di: TDBCheckBox
            Left = 7
            Top = 13
            Width = 107
            Height = 17
            Caption = 'Despesa da DI'
            DataField = 'IN_ITEM_DI'
            DataSource = datm_CadItens_avancado.ds_item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbcheck_despesa_diClick
          end
        end
        object dbradiogroup_ativo: TDBRadioGroup
          Left = 461
          Top = 15
          Width = 147
          Height = 37
          Caption = ' Ativo '
          Columns = 2
          DataField = 'IN_ATIVO'
          DataSource = datm_CadItens_avancado.ds_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Sim'
            'N'#227'o')
          ParentFont = False
          TabOrder = 12
          Values.Strings = (
            '1'
            '0')
          OnChange = dbedt_nm_itemChange
        end
        object rdbgoup_tp_item: TDBRadioGroup
          Left = 7
          Top = 98
          Width = 288
          Height = 91
          Caption = 'Classifica'#231#227'o do Item'
          DataField = 'TP_ITEM'
          DataSource = datm_CadItens_avancado.ds_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Desembara'#231'o'
            'Agencimento'
            'Agenciamento/Desembara'#231'o')
          ParentFont = False
          TabOrder = 13
          Values.Strings = (
            '0'
            '1'
            '2')
          OnChange = rdbgoup_tp_itemChange
        end
        object pnl_contabil: TPanel
          Left = 306
          Top = 224
          Width = 312
          Height = 54
          BevelInner = bvLowered
          TabOrder = 14
          object SpeedButton2: TSpeedButton
            Left = 280
            Top = 23
            Width = 25
            Height = 21
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
            OnClick = SpeedButton2Click
          end
          object Label11: TLabel
            Left = 7
            Top = 7
            Width = 75
            Height = 13
            Caption = 'Item Cont'#225'bil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_nm_item_contabil1: TDBEdit
            Left = 51
            Top = 22
            Width = 225
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Look_nm_item_contabil'
            DataSource = datm_CadItens_avancado.ds_item
            MaxLength = 120
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_cd_item_contabil: TDBEdit
            Left = 7
            Top = 22
            Width = 41
            Height = 21
            DataField = 'CD_ITEM_CONTABIL'
            DataSource = datm_CadItens_avancado.ds_item
            TabOrder = 1
            OnChange = dbedt_nm_itemChange
            OnExit = dbedt_cd_item_contabilExit
            OnKeyDown = dbedt_cd_ct_contabilKeyDown
          end
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 51
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 5
      Width = 38
      Height = 41
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
      Left = 119
      Top = 5
      Width = 38
      Height = 41
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
      Left = 385
      Top = 5
      Width = 38
      Height = 41
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
      Left = 43
      Top = 5
      Width = 36
      Height = 41
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
      Left = 81
      Top = 5
      Width = 38
      Height = 41
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
    object pnl_pesquisa: TPanel
      Left = 431
      Top = 2
      Width = 309
      Height = 47
      Align = alRight
      BevelOuter = bvLowered
      TabOrder = 0
      object lbl_pesquisa: TLabel
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
      object lbl_ordem_pesquisa: TLabel
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
    object dbnvg: TDBNavigator
      Left = 256
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_CadItens_avancado.ds_item
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object menu_cadastro: TMainMenu
    Left = 563
    Top = 387
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
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
