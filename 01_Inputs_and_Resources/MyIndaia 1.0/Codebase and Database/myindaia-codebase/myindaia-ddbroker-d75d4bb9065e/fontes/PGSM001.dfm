object frm_modulo: Tfrm_modulo
  Left = 242
  Top = 138
  Width = 750
  Height = 550
  Caption = 'M'#243'dulos e Rotinas do Sistema'
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
  object pnl_modulo_rotina: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 36
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
      Left = 113
      Top = 4
      Width = 36
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
      Left = 397
      Top = 4
      Width = 36
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
      Left = 41
      Top = 4
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
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 77
      Top = 4
      Width = 36
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
      OnClick = btn_cancelarClick
    end
    object dbnvg: TDBNavigator
      Left = 281
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_modulo.ds_modulo
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 428
      Top = 2
      Width = 304
      Height = 45
      Align = alRight
      BevelInner = bvLowered
      ParentColor = True
      TabOrder = 1
      TabStop = True
      object Label1: TLabel
        Left = 8
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
        Transparent = True
      end
      object Label2: TLabel
        Left = 144
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
        Transparent = True
      end
      object edt_chave: TEdit
        Left = 8
        Top = 18
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
      end
      object cb_ordem: TComboBox
        Left = 144
        Top = 18
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
  end
  object pgctrl_modulo: TPageControl
    Left = 0
    Top = 49
    Width = 734
    Height = 443
    ActivePage = ts_lista
    Align = alClient
    HotTrack = True
    TabOrder = 1
    OnChange = pgctrl_moduloChange
    OnChanging = pgctrl_moduloChanging
    object ts_lista: TTabSheet
      BorderWidth = 3
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 720
        Height = 409
        Align = alClient
        DataSource = datm_modulo.ds_modulo
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
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
            FieldName = 'CD_MODULO'
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
            FieldName = 'NM_MODULO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 407
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_MODULO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 115
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados B'#225'sicos'
      object TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 427
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label3: TLabel
          Left = 29
          Top = 21
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_modulo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 29
          Top = 62
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Descri'#231#227'o'
          FocusControl = dbedt_nm_modulo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 31
          Top = 102
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Apelido'
          FocusControl = dbedt_ap_modulo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_modulo: TDBEdit
          Left = 30
          Top = 34
          Width = 63
          Height = 21
          Color = clWhite
          DataField = 'CD_MODULO'
          DataSource = datm_modulo.ds_modulo
          TabOrder = 0
          OnChange = dbedt_nm_moduloChange
        end
        object dbedt_nm_modulo: TDBEdit
          Left = 30
          Top = 75
          Width = 448
          Height = 21
          DataField = 'NM_MODULO'
          DataSource = datm_modulo.ds_modulo
          TabOrder = 1
          OnChange = dbedt_nm_moduloChange
        end
        object dbedt_ap_modulo: TDBEdit
          Left = 30
          Top = 115
          Width = 190
          Height = 21
          DataField = 'AP_MODULO'
          DataSource = datm_modulo.ds_modulo
          TabOrder = 2
          OnChange = dbedt_nm_moduloChange
        end
      end
    end
    object ts_rotina: TTabSheet
      Caption = 'R&otina'
      object pgctrl_modulo_rotina: TPageControl
        Left = 0
        Top = 0
        Width = 726
        Height = 415
        ActivePage = ts_lista_modulo_rotina
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_moduloChange
        OnChanging = pgctrl_moduloChanging
        object ts_lista_modulo_rotina: TTabSheet
          Caption = '&Lista'
          object Label10: TLabel
            Left = 16
            Top = 13
            Width = 67
            Height = 13
            AutoSize = False
            Caption = 'M'#243'dulo'
            FocusControl = dbedt_cd_modulo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbg_cadastro_modulo_rotina: TDBGrid
            Left = 16
            Top = 55
            Width = 695
            Height = 330
            DataSource = datm_modulo.ds_modulo_rotina
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
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_ROTINA'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_ROTINA'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 511
                Visible = True
              end>
          end
          object dbedt_cd_modulo2: TDBEdit
            Left = 16
            Top = 26
            Width = 29
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_MODULO'
            DataSource = datm_modulo.ds_modulo
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_nm_modulo2: TDBEdit
            Left = 45
            Top = 26
            Width = 572
            Height = 21
            TabStop = False
            DataField = 'NM_MODULO'
            DataSource = datm_modulo.ds_modulo
            ParentColor = True
            ReadOnly = True
            TabOrder = 2
          end
        end
        object ts_dados_basicos_modulo_rotina: TTabSheet
          Caption = '&Dados B'#225'sicos'
          object TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 399
            Align = alClient
            BevelInner = bvLowered
            Ctl3D = True
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object Label13: TLabel
              Left = 26
              Top = 20
              Width = 103
              Height = 13
              AutoSize = False
              Caption = 'M'#243'dulo'
              FocusControl = dbedt_cd_modulo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 26
              Top = 76
              Width = 29
              Height = 13
              AutoSize = False
              Caption = 'C'#243'd.'
              FocusControl = dbedt_cd_modulo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 84
              Top = 76
              Width = 119
              Height = 13
              AutoSize = False
              Caption = 'Desc. Rotina'
              FocusControl = dbedt_cd_modulo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 27
              Top = 131
              Width = 119
              Height = 13
              AutoSize = False
              Caption = 'Menu'
              FocusControl = dbedt_cd_modulo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 28
              Top = 185
              Width = 119
              Height = 13
              AutoSize = False
              Caption = 'Formul'#225'rio'
              FocusControl = dbedt_cd_modulo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object dbedt_cd_rotina_modulo_rotina: TDBEdit
              Left = 26
              Top = 89
              Width = 58
              Height = 21
              TabStop = False
              Color = clWhite
              DataField = 'CD_ROTINA'
              DataSource = datm_modulo.ds_modulo_rotina
              TabOrder = 0
              OnChange = dbedt_nm_modulo_modulo_rotinaChange
            end
            object dbedt_nm_rotina_modulo_rotina: TDBEdit
              Left = 84
              Top = 89
              Width = 396
              Height = 21
              Color = clWhite
              DataField = 'NM_ROTINA'
              DataSource = datm_modulo.ds_modulo_rotina
              TabOrder = 1
              OnChange = dbedt_nm_modulo_modulo_rotinaChange
            end
            object dbedt_nm_modulo_modulo_rotina: TDBEdit
              Left = 83
              Top = 33
              Width = 398
              Height = 21
              TabStop = False
              DataField = 'look_nm_modulo'
              DataSource = datm_modulo.ds_modulo_rotina
              ParentColor = True
              TabOrder = 2
              OnChange = dbedt_nm_modulo_modulo_rotinaChange
            end
            object dbedt_cd_modulo_modulo_rotina: TDBEdit
              Left = 26
              Top = 33
              Width = 57
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_MODULO'
              DataSource = datm_modulo.ds_modulo_rotina
              ReadOnly = True
              TabOrder = 3
              OnChange = dbedt_nm_modulo_modulo_rotinaChange
            end
            object dbedit_nm_menu_modulo_rotina: TDBEdit
              Left = 28
              Top = 144
              Width = 396
              Height = 21
              Color = clWhite
              DataField = 'NM_MENU'
              DataSource = datm_modulo.ds_modulo_rotina
              TabOrder = 4
              OnChange = dbedt_nm_modulo_modulo_rotinaChange
            end
            object dbedit_nm_form_modulo_rotina: TDBEdit
              Left = 28
              Top = 198
              Width = 396
              Height = 21
              Color = clWhite
              DataField = 'NM_FORM'
              DataSource = datm_modulo.ds_modulo_rotina
              TabOrder = 5
              Visible = False
              OnChange = dbedt_nm_modulo_modulo_rotinaChange
            end
          end
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 564
    Top = 380
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
