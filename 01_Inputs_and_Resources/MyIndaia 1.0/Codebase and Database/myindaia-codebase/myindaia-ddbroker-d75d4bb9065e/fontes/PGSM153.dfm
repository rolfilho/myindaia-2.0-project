object frm_arm_rec: Tfrm_arm_rec
  Left = 172
  Top = 134
  Width = 750
  Height = 550
  Caption = 'Armazenagem por Recinto'
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
  object Label1: TLabel
    Left = 350
    Top = 24
    Width = 46
    Height = 13
    Caption = 'Per'#237'odo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 48
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 35
      Height = 39
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
      Left = 113
      Top = 4
      Width = 35
      Height = 39
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
      Left = 396
      Top = 4
      Width = 35
      Height = 39
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
      Left = 41
      Top = 4
      Width = 35
      Height = 39
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
      Left = 77
      Top = 4
      Width = 35
      Height = 39
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
    object dbnvg: TDBNavigator
      Left = 285
      Top = 10
      Width = 96
      Height = 26
      DataSource = datm_item.ds_item
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
    object pnl_pesquisa: TPanel
      Left = 435
      Top = 2
      Width = 305
      Height = 44
      Align = alRight
      BevelInner = bvLowered
      ParentColor = True
      TabOrder = 1
      object lbl_pesquisa: TLabel
        Left = 9
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
        Left = 145
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
        Left = 9
        Top = 17
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
      end
      object cb_ordem: TComboBox
        Left = 145
        Top = 17
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
  end
  object pgctrl_armrec: TPageControl
    Left = 0
    Top = 48
    Width = 742
    Height = 456
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_armrecChange
    OnChanging = pgctrl_armrecChanging
    object ts_lista: TTabSheet
      BorderWidth = 4
      Caption = '    Lista    '
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 726
        Height = 420
        Align = alClient
        Color = clWhite
        DataSource = datm_arm_rec.ds_arm_rec
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
            FieldName = 'CD_RECINTO'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CalcNmRecinto'
            Title.Caption = 'Recinto'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 520
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
        Height = 428
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_periodo: TLabel
          Left = 15
          Top = 73
          Width = 92
          Height = 13
          Caption = 'Dias p/ Per'#237'odo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_recinto: TLabel
          Left = 16
          Top = 17
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
        object btn_co_recinto: TSpeedButton
          Left = 558
          Top = 30
          Width = 25
          Height = 21
          Flat = True
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
          OnClick = btn_co_recintoClick
        end
        object dbedt_qt_dias: TDBEdit
          Left = 119
          Top = 69
          Width = 50
          Height = 21
          DataField = 'QT_DIAS'
          DataSource = datm_arm_rec.ds_arm_rec
          TabOrder = 1
          OnChange = dbedt_qt_diasChange
        end
        object dbedt_cd_recinto: TDBEdit
          Left = 16
          Top = 30
          Width = 91
          Height = 21
          DataField = 'CD_RECINTO'
          DataSource = datm_arm_rec.ds_arm_rec
          TabOrder = 0
          OnChange = btn_co_recintoClick
          OnExit = dbedt_cd_recintoExit
          OnKeyDown = dbedt_cd_recintoKeyDown
        end
        object dbedt_nm_recinto: TEdit
          Left = 107
          Top = 30
          Width = 449
          Height = 21
          TabStop = False
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 120
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_cd_recintoChange
        end
        object dbchbx_sabdom: TDBCheckBox
          Left = 240
          Top = 73
          Width = 113
          Height = 17
          Caption = 'Contar Sab/Dom.'
          DataField = 'IN_SABDOM'
          DataSource = datm_arm_rec.ds_arm_rec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchbx_feriado: TDBCheckBox
          Left = 400
          Top = 73
          Width = 121
          Height = 17
          Caption = 'Contar Feriados'
          DataField = 'IN_FERIADO'
          DataSource = datm_arm_rec.ds_arm_rec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
    object ts_periodos: TTabSheet
      Caption = 'Per'#237'odos'
      object pnl_periodo: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 428
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object dbg_normal: TDBGrid
          Left = 24
          Top = 24
          Width = 369
          Height = 281
          DataSource = datm_arm_rec.ds_arm_rec_per
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NR_PERIODO'
              Title.Caption = 'Per'#237'odo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QT_DIAS'
              Title.Caption = 'Dias'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_PERCENT'
              Title.Caption = 'Percentual'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 112
              Visible = True
            end>
        end
        object Panel1: TPanel
          Left = 408
          Top = 24
          Width = 305
          Height = 97
          BevelInner = bvLowered
          TabOrder = 1
          object Label109: TLabel
            Left = 30
            Top = 31
            Width = 46
            Height = 13
            Caption = 'Per'#237'odo'
            FocusControl = dbedt_nr_periodo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 118
            Top = 31
            Width = 26
            Height = 13
            Caption = 'Dias'
            FocusControl = dbedt_nr_dias
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 207
            Top = 31
            Width = 62
            Height = 13
            Caption = 'Percentual'
            FocusControl = dbedt_nr_perc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_nr_periodo: TDBEdit
            Left = 31
            Top = 44
            Width = 68
            Height = 21
            DataField = 'NR_PERIODO'
            DataSource = datm_arm_rec.ds_arm_rec_per
            MaxLength = 2
            TabOrder = 0
          end
          object dbedt_nr_dias: TDBEdit
            Left = 119
            Top = 44
            Width = 68
            Height = 21
            DataField = 'QT_DIAS'
            DataSource = datm_arm_rec.ds_arm_rec_per
            MaxLength = 2
            TabOrder = 1
          end
          object dbedt_nr_perc: TDBEdit
            Left = 207
            Top = 44
            Width = 68
            Height = 21
            DataField = 'NR_PERCENT'
            DataSource = datm_arm_rec.ds_arm_rec_per
            MaxLength = 8
            TabOrder = 2
          end
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 556
    Top = 368
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
