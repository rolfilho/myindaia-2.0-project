object frm_cargo: Tfrm_cargo
  Left = 272
  Top = 164
  Width = 755
  Height = 499
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Cargos e Controle de Acesso'
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_cargo: TPageControl
    Left = 0
    Top = 49
    Width = 739
    Height = 392
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_cargoChange
    OnChanging = pgctrl_cargoChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cargo_lista: TDBGrid
        Left = 0
        Top = 0
        Width = 731
        Height = 364
        Align = alClient
        DataSource = datm_cargo.ds_cargo_lista
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
            FieldName = 'CD_CARGO'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CARGO'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_CARGO_PAI'
            Title.Caption = 'C'#243'digo Pai'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_NM_CARGO_PAI'
            Title.Caption = 'Descri'#231#227'o Cargo Pai'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 186
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_ATIVO'
            Title.Caption = 'Ativo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calcSELECIONADO'
            Font.Charset = SYMBOL_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = 'Wingdings'
            Font.Style = [fsBold]
            Title.Caption = 'Selec.'
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados B'#225'sicos'
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 731
        Height = 364
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label4: TLabel
          Left = 9
          Top = 11
          Width = 76
          Height = 13
          AutoSize = False
          Caption = 'Cargo Pai'
          FocusControl = dbedt_cd_cargo_pai
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_usuatio_ativo: TLabel
          Left = 405
          Top = 59
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
        object Label6: TLabel
          Left = 9
          Top = 59
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_cargo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 53
          Top = 59
          Width = 112
          Height = 13
          AutoSize = False
          Caption = 'Desc. Cargo'
          FocusControl = dbedt_nm_cargo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_cargo_pai: TDBEdit
          Left = 9
          Top = 25
          Width = 40
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'CD_CARGO_PAI'
          DataSource = datm_cargo.ds_cargo
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_nm_cargo_pai: TDBEdit
          Left = 53
          Top = 25
          Width = 345
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'LK_NM_CARGO_PAI'
          DataSource = datm_cargo.ds_cargo
          ReadOnly = True
          TabOrder = 3
        end
        object dblkpcbox_ativo: TDBLookupComboBox
          Left = 404
          Top = 73
          Width = 50
          Height = 21
          DataField = 'LK_ATIVO'
          DataSource = datm_cargo.ds_cargo
          DropDownRows = 3
          ListField = 'TX_YESNO'
          TabOrder = 4
          OnClick = dbedt_nm_cargoChange
        end
        object dbedt_cd_cargo: TDBEdit
          Left = 9
          Top = 73
          Width = 40
          Height = 21
          Color = clWhite
          DataField = 'CD_CARGO'
          DataSource = datm_cargo.ds_cargo
          TabOrder = 0
          OnChange = dbedt_nm_cargoChange
        end
        object dbedt_nm_cargo: TDBEdit
          Left = 53
          Top = 73
          Width = 346
          Height = 21
          DataField = 'NM_CARGO'
          DataSource = datm_cargo.ds_cargo
          TabOrder = 2
          OnChange = dbedt_nm_cargoChange
        end
        object dbchkSelecionado: TDBCheckBox
          Left = 11
          Top = 104
          Width = 310
          Height = 17
          Caption = 'Ver apenas selecionados'
          DataField = 'IN_SELECIONADO'
          DataSource = datm_cargo.ds_cargo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_cargoChange
        end
        object dbchkTipoHelpDesk: TDBCheckBox
          Left = 11
          Top = 130
          Width = 214
          Height = 17
          Caption = 'Acessar HelpDesk como Manager'
          DataField = 'IN_MANAGER'
          DataSource = datm_cargo.ds_cargo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkCargoInterno: TDBCheckBox
          Left = 11
          Top = 156
          Width = 97
          Height = 17
          Caption = 'Cargo Interno'
          DataField = 'IN_INTERNO'
          DataSource = datm_cargo.ds_cargo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_cargoChange
        end
        object dbchkDashWeb: TDBCheckBox
          Left = 11
          Top = 183
          Width = 198
          Height = 17
          Caption = 'Visualizar Dashboard na Web'
          DataField = 'IN_DASHBOARD_WEB'
          DataSource = datm_cargo.ds_cargo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_cargoChange
        end
        object dbchkIN_LIBERA_TRANSMISSAO_DI: TDBCheckBox
          Left = 11
          Top = 208
          Width = 170
          Height = 17
          Caption = 'Liberar Transmiss'#227'o de DI'
          DataField = 'IN_LIBERA_TRANSMISSAO_DI'
          DataSource = datm_cargo.ds_cargo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_cargoChange
        end
      end
    end
    object ts_controle_acesso: TTabSheet
      Caption = 'Controle de Acesso'
      object Label3: TLabel
        Left = 5
        Top = 4
        Width = 44
        Height = 13
        AutoSize = False
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 49
        Top = 4
        Width = 112
        Height = 13
        AutoSize = False
        Caption = 'Desc. Cargo'
        FocusControl = DBEdit2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbctrlg_modulo: TDBCtrlGrid
        Left = 0
        Top = 67
        Width = 322
        Height = 286
        AllowDelete = False
        AllowInsert = False
        Color = clWhite
        DataSource = datm_cargo.ds_cargo_modulo
        PanelHeight = 22
        PanelWidth = 305
        ParentColor = False
        TabOrder = 0
        RowCount = 13
        SelectedColor = clTeal
        OnExit = dbctrlg_moduloExit
        object dbtxt_nome_modulo: TDBText
          Left = 28
          Top = 3
          Width = 227
          Height = 17
          DataField = 'LK_NM_MODULO'
          DataSource = datm_cargo.ds_cargo_modulo
        end
        object dbchkbox_in_ativo: TDBCheckBox
          Left = 4
          Top = 3
          Width = 17
          Height = 17
          Caption = 'dbchkbox_in_ativo'
          DataField = 'IN_ATIVO'
          DataSource = datm_cargo.ds_cargo_modulo
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkbox_in_ativoClick
        end
      end
      object dbctrlg_rotina: TDBCtrlGrid
        Left = 337
        Top = 67
        Width = 393
        Height = 286
        AllowDelete = False
        AllowInsert = False
        Color = clWhite
        DataSource = datm_cargo.ds_controle_acesso
        PanelHeight = 22
        PanelWidth = 376
        ParentColor = False
        TabOrder = 1
        RowCount = 13
        SelectedColor = clTeal
        object dbtxt_nome_rotina: TDBText
          Left = 28
          Top = 3
          Width = 208
          Height = 17
          DataField = 'LK_MN_ROTINA'
          DataSource = datm_cargo.ds_controle_acesso
        end
        object dbchkbox_in_acesso: TDBCheckBox
          Left = 8
          Top = 3
          Width = 17
          Height = 17
          Caption = 'dbchkbox_in_acesso'
          Ctl3D = True
          DataField = 'IN_ACESSO'
          DataSource = datm_cargo.ds_controle_acesso
          ParentCtl3D = False
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkbox_in_acessoClick
        end
        object dbchkbox_in_incluir: TDBCheckBox
          Left = 303
          Top = 3
          Width = 17
          Height = 17
          Ctl3D = True
          DataField = 'IN_INCLUIR'
          DataSource = datm_cargo.ds_controle_acesso
          ParentCtl3D = False
          TabOrder = 1
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkbox_in_incluirClick
        end
        object dbchkbox_in_modificar: TDBCheckBox
          Left = 325
          Top = 3
          Width = 17
          Height = 17
          Ctl3D = True
          DataField = 'IN_MODIFICAR'
          DataSource = datm_cargo.ds_controle_acesso
          ParentCtl3D = False
          TabOrder = 2
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkbox_in_modificarClick
        end
        object dbchkbox_in_excluir: TDBCheckBox
          Left = 348
          Top = 3
          Width = 17
          Height = 17
          Ctl3D = True
          DataField = 'IN_EXCLUIR'
          DataSource = datm_cargo.ds_controle_acesso
          ParentCtl3D = False
          TabOrder = 3
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkbox_in_excluirClick
        end
      end
      object DBEdit1: TDBEdit
        Left = 5
        Top = 18
        Width = 40
        Height = 21
        Color = clWhite
        DataField = 'CD_CARGO'
        DataSource = datm_cargo.ds_cargo
        ReadOnly = True
        TabOrder = 2
        OnChange = dbedt_nm_cargoChange
      end
      object DBEdit2: TDBEdit
        Left = 49
        Top = 18
        Width = 346
        Height = 21
        DataField = 'NM_CARGO'
        DataSource = datm_cargo.ds_cargo
        ReadOnly = True
        TabOrder = 3
        OnChange = dbedt_nm_cargoChange
      end
      object Panel1: TPanel
        Left = 0
        Top = 45
        Width = 321
        Height = 22
        BevelOuter = bvNone
        Caption = 'M'#243'dulos'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object Panel2: TPanel
        Left = 338
        Top = 45
        Width = 287
        Height = 22
        BevelOuter = bvNone
        Caption = 'Rotinas / Direitos'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object Panel3: TPanel
        Left = 625
        Top = 45
        Width = 104
        Height = 22
        BevelOuter = bvNone
        Caption = 'I    A    E   '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
    end
    object ts_controle_acesso_novo: TTabSheet
      Caption = 'Novo Controle Acesso'
      ImageIndex = 4
      object Label13: TLabel
        Left = 5
        Top = 4
        Width = 44
        Height = 13
        AutoSize = False
        Caption = 'C'#243'digo'
        FocusControl = DBEdit7
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 49
        Top = 4
        Width = 112
        Height = 13
        AutoSize = False
        Caption = 'Desc. Cargo'
        FocusControl = DBEdit8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit7: TDBEdit
        Left = 5
        Top = 18
        Width = 40
        Height = 21
        Color = clWhite
        DataField = 'CD_CARGO'
        DataSource = datm_cargo.ds_cargo
        ReadOnly = True
        TabOrder = 0
        OnChange = dbedt_nm_cargoChange
      end
      object DBEdit8: TDBEdit
        Left = 49
        Top = 18
        Width = 346
        Height = 21
        DataField = 'NM_CARGO'
        DataSource = datm_cargo.ds_cargo
        ReadOnly = True
        TabOrder = 1
        OnChange = dbedt_nm_cargoChange
      end
      object DBCtrlGrid4: TDBCtrlGrid
        Left = 8
        Top = 67
        Width = 162
        Height = 286
        AllowDelete = False
        AllowInsert = False
        Color = clWhite
        DataSource = datm_cargo.ds_controle_acesso_sistema
        PanelHeight = 22
        PanelWidth = 145
        ParentColor = False
        PopupMenu = pm_duplica_acesso_sistema
        TabOrder = 2
        RowCount = 13
        SelectedColor = clTeal
        OnClick = DBCtrlGrid1Click
        OnExit = DBCtrlGrid1Exit
        object DBText4: TDBText
          Left = 2
          Top = 4
          Width = 135
          Height = 17
          DataField = 'LK_NM_SISTEMA'
          DataSource = datm_cargo.ds_controle_acesso_sistema
        end
      end
      object DBCtrlGrid5: TDBCtrlGrid
        Left = 172
        Top = 67
        Width = 212
        Height = 286
        AllowDelete = False
        AllowInsert = False
        Color = clWhite
        DataSource = datm_cargo.ds_controle_acesso_modulo
        PanelHeight = 22
        PanelWidth = 195
        ParentColor = False
        PopupMenu = pm_duplica_acesso_modulo
        TabOrder = 3
        RowCount = 13
        SelectedColor = clTeal
        OnClick = DBCtrlGrid2Click
        object DBText5: TDBText
          Left = 4
          Top = 4
          Width = 173
          Height = 17
          DataField = 'LK_NM_MODULO'
          DataSource = datm_cargo.ds_controle_acesso_modulo
        end
      end
      object DBCtrlGrid6: TDBCtrlGrid
        Left = 386
        Top = 67
        Width = 350
        Height = 286
        AllowDelete = False
        AllowInsert = False
        Color = clWhite
        DataSource = datm_cargo.ds_controle_acesso_rotina
        PanelHeight = 22
        PanelWidth = 333
        ParentColor = False
        TabOrder = 4
        RowCount = 13
        SelectedColor = clTeal
        OnExit = DBCtrlGrid6Exit
        object DBText6: TDBText
          Left = 2
          Top = 4
          Width = 307
          Height = 17
          DataField = 'LK_NM_ROTINA'
          DataSource = datm_cargo.ds_controle_acesso_rotina
        end
        object DBCheckBox11: TDBCheckBox
          Left = 316
          Top = 2
          Width = 13
          Height = 17
          DataField = 'IN_VISIVEL'
          DataSource = datm_cargo.ds_controle_acesso_rotina
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = DBCheckBox11Click
        end
        object DBCheckBox12: TDBCheckBox
          Left = 293
          Top = 1
          Width = 15
          Height = 20
          DataField = 'IN_ATIVO'
          DataSource = datm_cargo.ds_controle_acesso_rotina
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = DBCheckBox12Click
        end
      end
      object Panel11: TPanel
        Left = 386
        Top = 46
        Width = 287
        Height = 22
        BevelOuter = bvNone
        Caption = 'Rotina'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object Panel12: TPanel
        Left = 672
        Top = 46
        Width = 63
        Height = 22
        BevelOuter = bvNone
        Caption = 'A    V   '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object Panel13: TPanel
        Left = 173
        Top = 46
        Width = 210
        Height = 22
        BevelOuter = bvNone
        Caption = 'M'#243'dulos'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
      object Panel14: TPanel
        Left = 8
        Top = 46
        Width = 161
        Height = 22
        BevelOuter = bvNone
        Caption = 'Sistema'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        object SpeedButton1: TSpeedButton
          Left = 0
          Top = 0
          Width = 22
          Height = 22
          Hint = 'Nova tabela'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
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
          OnClick = SpeedButton1Click
        end
      end
      object pnl_duplica: TPanel
        Left = 159
        Top = 144
        Width = 354
        Height = 137
        Caption = 'pnl_duplica'
        Color = clBlack
        TabOrder = 9
        Visible = False
        object pnl_duplica_cargo: TPanel
          Left = 4
          Top = 4
          Width = 347
          Height = 130
          TabOrder = 0
          object Shape3: TShape
            Left = 1
            Top = 1
            Width = 317
            Height = 22
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Shape4: TShape
            Left = 321
            Top = 1
            Width = 25
            Height = 22
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object lbl_duplica: TLabel
            Left = 4
            Top = 33
            Width = 339
            Height = 24
            AutoSize = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object Shape2: TShape
            Left = 1
            Top = 25
            Width = 345
            Height = 102
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object lblFechar: TLabel
            Left = 329
            Top = 4
            Width = 10
            Height = 16
            Caption = 'X'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = lblFecharClick
          end
          object btnCoProcesso: TSpeedButton
            Left = 315
            Top = 56
            Width = 24
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
            OnClick = btnCoProcessoClick
          end
          object Label12: TLabel
            Left = 7
            Top = 6
            Width = 200
            Height = 13
            Caption = 'Duplicar Configura'#231#245'es de Acesso Cargo :'
          end
          object Button1: TButton
            Left = 256
            Top = 96
            Width = 75
            Height = 25
            Caption = 'Duplicar'
            TabOrder = 0
            OnClick = Button1Click
          end
          object edt_cd_cargo_duplica: TEdit
            Left = 7
            Top = 56
            Width = 33
            Height = 21
            TabOrder = 1
            OnChange = edt_cd_cargo_duplicaChange
          end
          object edt_cargo_duplica: TEdit
            Left = 40
            Top = 56
            Width = 273
            Height = 21
            TabOrder = 2
          end
        end
      end
    end
    object ts_DocumentosDigitalizados: TTabSheet
      Caption = 'Acesso a Documentos Digitalizados'
      ImageIndex = 3
      OnShow = ts_DocumentosDigitalizadosShow
      object Label8: TLabel
        Left = 5
        Top = 4
        Width = 44
        Height = 13
        AutoSize = False
        Caption = 'C'#243'digo'
        FocusControl = DBEdit3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 49
        Top = 4
        Width = 112
        Height = 13
        AutoSize = False
        Caption = 'Desc. Cargo'
        FocusControl = DBEdit4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnMarcarVisualizar: TSpeedButton
        Left = 608
        Top = 24
        Width = 23
        Height = 22
        Hint = 'Marcar todos para visualiza'#231#227'o'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066001EB2311F
          B133006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660047D36D3BCB5E25A83B00
          66001BA92E1DB132006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          0066004FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660041C563006600CE6C6CB7
          3D3DFF00FFFF00FF00660019AA2B006600FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFB73D3D006600CF6F6FCD6969CF6E6EB73D3DFF00FFFF00FF006600149D
          21006600FF00FFFF00FFFF00FFFF00FFB73D3DDA9090D78686CD6969B73D3DCC
          6666CE6B6BB73D3DFF00FFFF00FFFF00FF006600006600FF00FFFF00FFB73D3D
          DC9595DE9B9BD27777B73D3DFF00FFB73D3DCA5F5FCD6969B73D3DFF00FFFF00
          FFFF00FF006600006600FF00FFFF00FFB73D3DD78686B73D3DFF00FFFF00FFFF
          00FFFF00FFB73D3DCC6565B73D3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFB73D3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB73D3DC95C5CB73D
          3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFB73D3DB73D3DFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFB73D3DB73D3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnMarcarVisualizarClick
      end
      object btnMarcarAlterar: TSpeedButton
        Left = 642
        Top = 24
        Width = 23
        Height = 22
        Hint = 'Marcar todos para altera'#231#227'o'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066001EB2311F
          B133006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660047D36D3BCB5E25A83B00
          66001BA92E1DB132006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          0066004FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660041C563006600CE6C6CB7
          3D3DFF00FFFF00FF00660019AA2B006600FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFB73D3D006600CF6F6FCD6969CF6E6EB73D3DFF00FFFF00FF006600149D
          21006600FF00FFFF00FFFF00FFFF00FFB73D3DDA9090D78686CD6969B73D3DCC
          6666CE6B6BB73D3DFF00FFFF00FFFF00FF006600006600FF00FFFF00FFB73D3D
          DC9595DE9B9BD27777B73D3DFF00FFB73D3DCA5F5FCD6969B73D3DFF00FFFF00
          FFFF00FF006600006600FF00FFFF00FFB73D3DD78686B73D3DFF00FFFF00FFFF
          00FFFF00FFB73D3DCC6565B73D3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFB73D3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB73D3DC95C5CB73D
          3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFB73D3DB73D3DFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFB73D3DB73D3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnMarcarAlterarClick
      end
      object btnCopiarAcesso: TSpeedButton
        Left = 400
        Top = 18
        Width = 39
        Height = 22
        Hint = 'Copiar Acesso do Cargo...'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB98385B98385B98385B983
          85B98385B98385B98385FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFB98385F6DDB7F4D7ACF3D3A1F1CF98F0CA8FB98385FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA8E85F8E5C98A94D91E47
          F6888ECDF2D19CB98385FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFCB9A82FAEDD91E49F90033FF1E48F6F4D8ABB98385FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDCA887FCF5E98D9DED1E49
          FA8B97E0F6E0BDB98385FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFE3B18EFEFBF6FCF7EDFBF2E4FAEDDAF8E8CEB98385FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEDBD92FFFFFFFEFCFAFDF9
          F2B98384B98384BE8675B78183B78183B78183B78183B78183B78183B78183B7
          8183FF00FFEDBD92FFFFFFFFFFFFFEFDFCB98384D39769FF00FFB78183EED1B1
          E1B894E1B68CDFB180DCAB75EFC686B78183FF00FFEDBD92DCA887DCA887DCA8
          87B98384FF00FF007404B78183CA8F6B952B009A3401993401993300E4B57CB7
          8183FF00FFFF00FF45812CFF00FFFF00FFFF00FFFF00FF057E0EBA8E85F8EEE5
          A14213972E00942900BD7649FDE5B3B78183FF00FF017809109726FF00FFFF00
          FFFF00FF049012087F10CB9A82FFFFFFD5A992922600A04112ECCCAEFFEFC5B7
          818303750F49CC722EA848037008097B110C91160D9C1905730BDCA887FFFFFF
          FCF7F5AE5B33CD9574FBF1DEDECBB4428A3E44D2735CE78E3ECA6027B84014AB
          250EA31B07800FFF00FFE3B18EFFFFFFFFFFFFEDDBD1F9F2EAB78183B78183B7
          847530AB4A38C65826AF3D0D8A18098611077B0DFF00FFFF00FFEDBD92FFFFFF
          FFFFFFFFFFFFFDFFFFB78183DC9D64FF00FFFF00FF138E21199F29FF00FFFF00
          FFFF00FFFF00FFFF00FFEDBD92DCA887DCA887DCA887DCA887B78183FF00FFFF
          00FFFF00FFFF00FF0A7D12FF00FFFF00FFFF00FFFF00FFFF00FF}
        Layout = blGlyphRight
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCopiarAcessoClick
      end
      object DBEdit3: TDBEdit
        Left = 5
        Top = 18
        Width = 40
        Height = 21
        Color = clWhite
        DataField = 'CD_CARGO'
        DataSource = datm_cargo.ds_cargo
        ReadOnly = True
        TabOrder = 0
        OnChange = dbedt_nm_cargoChange
      end
      object DBEdit4: TDBEdit
        Left = 49
        Top = 18
        Width = 346
        Height = 21
        DataField = 'NM_CARGO'
        DataSource = datm_cargo.ds_cargo
        ReadOnly = True
        TabOrder = 1
        OnChange = dbedt_nm_cargoChange
      end
      object dbctrlgrdTabelasDigitalizacao: TDBCtrlGrid
        Left = 0
        Top = 67
        Width = 270
        Height = 286
        AllowDelete = False
        AllowInsert = False
        Color = clWhite
        DataSource = datm_cargo.ds_tabelas
        PanelHeight = 22
        PanelWidth = 253
        ParentColor = False
        TabOrder = 2
        RowCount = 13
        SelectedColor = clTeal
        OnExit = dbctrlg_moduloExit
        object dbtxt_NomeTabela: TDBText
          Left = 4
          Top = 5
          Width = 245
          Height = 13
          DataField = 'NM_EXIBICAO'
          DataSource = datm_cargo.ds_tabelas
        end
      end
      object dbctrlgrdDocumentosDigitalizacao: TDBCtrlGrid
        Left = 273
        Top = 67
        Width = 425
        Height = 286
        AllowDelete = False
        AllowInsert = False
        Color = clWhite
        DataSource = datm_cargo.ds_acesso_documento
        PanelHeight = 22
        PanelWidth = 408
        ParentColor = False
        TabOrder = 3
        RowCount = 13
        SelectedColor = clTeal
        object dbedt_NomeTipoDocumento: TDBText
          Left = 4
          Top = 5
          Width = 237
          Height = 13
          DataField = 'LK_NM_TIPO_DOCTO'
          DataSource = datm_cargo.ds_acesso_documento
        end
        object dbchkVisualizacao: TDBCheckBox
          Left = 342
          Top = 3
          Width = 15
          Height = 17
          DataField = 'IN_VISUALIZACAO'
          DataSource = datm_cargo.ds_acesso_documento
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchkVisualizacaoClick
        end
        object dbchkAlteracao: TDBCheckBox
          Left = 373
          Top = 3
          Width = 15
          Height = 17
          DataField = 'IN_ALTERACAO'
          DataSource = datm_cargo.ds_acesso_documento
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchkAlteracaoClick
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 45
        Width = 269
        Height = 22
        BevelOuter = bvNone
        Caption = 'Tabelas'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object btn_NovaTabela: TSpeedButton
          Left = 0
          Top = 0
          Width = 22
          Height = 22
          Hint = 'Nova tabela'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
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
          OnClick = btn_NovaTabelaClick
        end
      end
      object Panel5: TPanel
        Left = 272
        Top = 45
        Width = 319
        Height = 22
        BevelOuter = bvNone
        Caption = 'Tipos de documento'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object btn_NovoTipoDocumento: TSpeedButton
          Left = 0
          Top = 0
          Width = 22
          Height = 22
          Hint = 'Novo tipo de documento'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
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
          OnClick = btn_NovoTipoDocumentoClick
        end
      end
      object Panel6: TPanel
        Left = 593
        Top = 45
        Width = 101
        Height = 22
        BevelOuter = bvNone
        Caption = 'V      A   '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
    end
  end
  object pnl_modulo_rotina: TPanel
    Left = 0
    Top = 0
    Width = 739
    Height = 49
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      739
      49)
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 40
      Height = 40
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
      Left = 125
      Top = 4
      Width = 40
      Height = 40
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
      Left = 408
      Top = 4
      Width = 40
      Height = 40
      Hint = 'Sair'
      Anchors = [akTop, akRight]
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
      Left = 45
      Top = 4
      Width = 40
      Height = 40
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
      Left = 85
      Top = 4
      Width = 40
      Height = 40
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
    object Label1: TLabel
      Left = 458
      Top = 5
      Width = 56
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 590
      Top = 5
      Width = 37
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Ordem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbnvg: TDBNavigator
      Left = 180
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_cargo.ds_cargo_lista
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
    end
    object edt_chave: TEdit
      Left = 457
      Top = 20
      Width = 129
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 590
      Top = 20
      Width = 153
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
      OnClick = cb_ordemClick
    end
  end
  object menu_cadastro: TMainMenu
    Left = 308
    Top = 4
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
  object pm_duplica_acesso_sistema: TPopupMenu
    Left = 360
    Top = 5
    object mi_recebe_configuracao: TMenuItem
      Caption = 'Receber Configura'#231#245'es de Acesso'
      OnClick = mi_recebe_configuracaoClick
    end
    object mi_envia_configuracao: TMenuItem
      Caption = 'Enviar Configura'#231#245'es de Acesso'
      OnClick = mi_envia_configuracaoClick
    end
  end
  object pm_duplica_acesso_modulo: TPopupMenu
    Left = 416
    Top = 8
    object ReceberConfiguraesdeAcesso1: TMenuItem
      Caption = 'Receber Configura'#231#245'es de Acesso'
      OnClick = ReceberConfiguraesdeAcesso1Click
    end
    object EnviarConfiguraesdeAcesso1: TMenuItem
      Caption = 'Enviar Configura'#231#245'es de Acesso'
      OnClick = EnviarConfiguraesdeAcesso1Click
    end
  end
end
