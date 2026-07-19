object frm_DI_adicao_Com_LI: Tfrm_DI_adicao_Com_LI
  Left = 160
  Top = 118
  Width = 750
  Height = 550
  BorderIcons = [biSystemMenu]
  Caption = 'Abertura de Adi'#231#227'o com LI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  KeyPreview = True
  Menu = mi_menu
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 46
    Width = 742
    Height = 439
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object DBCtrlGrid1: TDBCtrlGrid
      Left = 1
      Top = 20
      Width = 740
      Height = 418
      Align = alClient
      AllowDelete = False
      AllowInsert = False
      Color = clMenu
      DataSource = datm_DI_adicao_com_LI.ds_li
      PanelHeight = 19
      PanelWidth = 724
      ParentColor = False
      TabOrder = 0
      RowCount = 22
      SelectedColor = clTeal
      Visible = False
      object DBText2: TDBText
        Left = 136
        Top = 3
        Width = 93
        Height = 15
        DataField = 'DT_REG_OPER_TRAT'
        DataSource = datm_DI_adicao_com_LI.ds_li
      end
      object DBText1: TDBText
        Left = 24
        Top = 3
        Width = 97
        Height = 15
        DataField = 'NR_OPER_TRAT_PREV'
        DataSource = datm_DI_adicao_com_LI.ds_li
      end
      object DBText3: TDBText
        Left = 228
        Top = 3
        Width = 361
        Height = 15
        DataField = 'NM_FORN_ESTR'
        DataSource = datm_DI_adicao_com_LI.ds_li
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 20
      Width = 740
      Height = 418
      Align = alClient
      BorderStyle = bsNone
      Color = clMenu
      Ctl3D = True
      DataSource = datm_DI_adicao_com_LI.ds_li
      Options = [dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NR_OPER_TRAT_PREV'
          Width = 128
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DT_REG_OPER_TRAT'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_FORN_ESTR'
          Width = 369
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 740
      Height = 19
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 2
      object Label2: TLabel
        Left = 2
        Top = 2
        Width = 129
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'N'#186' Registro LI'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label1: TLabel
        Left = 132
        Top = 2
        Width = 89
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'Data'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 222
        Top = 2
        Width = 516
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'Exportador'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
  end
  object Mensagem: TStatusBar
    Left = 0
    Top = 485
    Width = 742
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 46
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object btn_sair: TSpeedButton
      Left = 396
      Top = 4
      Width = 38
      Height = 38
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
    object btn_iniciar: TSpeedButton
      Left = 5
      Top = 4
      Width = 38
      Height = 38
      Hint = 'Iniciar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_iniciarClick
    end
    object Shape1: TShape
      Left = 297
      Top = 13
      Width = 87
      Height = 22
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object dbnvg: TDBNavigator
      Left = 299
      Top = 15
      Width = 84
      Height = 19
      DataSource = datm_DI_adicao_com_LI.ds_li
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
      Left = 438
      Top = 2
      Width = 302
      Height = 42
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      object lbl_pesquisa: TLabel
        Left = 7
        Top = 4
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
        Left = 143
        Top = 4
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
        Left = 7
        Top = 16
        Width = 129
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = edt_chaveChange
      end
      object cb_ordem: TComboBox
        Left = 143
        Top = 16
        Width = 153
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
  end
  object mi_menu: TMainMenu
    Left = 552
    Top = 392
    object mi_iniciar: TMenuItem
      Caption = '&Iniciar'
      OnClick = btn_iniciarClick
    end
    object mi_fechar: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
