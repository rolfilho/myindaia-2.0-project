object frm_DI_adicao_Com_LI: Tfrm_DI_adicao_Com_LI
  Left = 65
  Top = 54
  Width = 640
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Abertura de Adição com LI'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 434
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 12
      Top = 10
      Width = 129
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Nº Registro LI'
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
      Left = 236
      Top = 10
      Width = 385
      Height = 17
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
    object Label1: TLabel
      Left = 144
      Top = 10
      Width = 89
      Height = 17
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
    object DBCtrlGrid1: TDBCtrlGrid
      Left = 12
      Top = 32
      Width = 610
      Height = 336
      AllowDelete = False
      AllowInsert = False
      ColCount = 1
      Color = clMenu
      DataSource = datm_DI_adicao_com_LI.ds_li
      PanelHeight = 21
      PanelWidth = 594
      ParentColor = False
      TabOrder = 0
      RowCount = 16
      SelectedColor = clTeal
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
  end
  object Mensagem: TStatusBar
    Left = 0
    Top = 434
    Width = 632
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object btn_iniciar: TButton
    Left = 225
    Top = 392
    Width = 75
    Height = 25
    Caption = '&Iniciar'
    Default = True
    TabOrder = 2
    OnClick = btn_iniciarClick
  end
  object btn_fechar: TButton
    Left = 337
    Top = 392
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Fechar'
    ModalResult = 2
    TabOrder = 3
    OnClick = btn_fecharClick
  end
end
