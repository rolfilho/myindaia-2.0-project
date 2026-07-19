inherited formMyCdBasic: TformMyCdBasic
  Caption = 'MyCdBasic'
  ClientHeight = 508
  ClientWidth = 923
  OnCloseQuery = FormCloseQuery
  ExplicitTop = -10
  ExplicitWidth = 939
  ExplicitHeight = 546
  PixelsPerInch = 96
  TextHeight = 16
  object pnlButton: TPanel
    Left = 0
    Top = 488
    Width = 923
    Height = 20
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    Visible = False
  end
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 923
    Height = 488
    ActivePage = tshEdit
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    object tshGrid: TTabSheet
      Caption = 'Grid'
      object pnlButtonGrid: TPanel
        Left = 812
        Top = 0
        Width = 103
        Height = 454
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          103
          454)
        object btnIncluir: TButton
          Left = 14
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Incluir'
          Default = True
          TabOrder = 0
          OnClick = btnIncluirClick
        end
        object btnAlterar: TButton
          Left = 14
          Top = 34
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Alterar'
          TabOrder = 1
          OnClick = btnAlterarClick
        end
        object btnConsultar: TButton
          Left = 14
          Top = 65
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Consultar'
          TabOrder = 2
        end
        object btnExcluir: TButton
          Left = 14
          Top = 97
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Excluir'
          TabOrder = 3
          OnClick = btnExcluirClick
        end
        object cbxAltRapida: TCheckBox
          Left = 11
          Top = 128
          Width = 81
          Height = 17
          Caption = 'Alt. R'#225'pida'
          TabOrder = 4
          Visible = False
        end
      end
      object pnlGrid: TPanel
        Left = 0
        Top = 0
        Width = 812
        Height = 454
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object cxGrid: TcxGrid
          Left = 0
          Top = 4
          Width = 812
          Height = 450
          Align = alClient
          BorderStyle = cxcbsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object cxGridDBTableView: TcxGridDBTableView
            OnKeyDown = cxGridDBTableViewKeyDown
            Navigator.Buttons.CustomButtons = <>
            FilterBox.CustomizeDialog = False
            OnCanFocusRecord = cxGridDBTableViewCanFocusRecord
            DataController.DataModeController.GridMode = True
            DataController.DataSource = dtsMain
            DataController.Options = []
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            Filtering.ColumnAddValueItems = False
            Filtering.ColumnMRUItemsList = False
            OptionsData.Deleting = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            Preview.AutoHeight = False
          end
          object cxGridLevel: TcxGridLevel
            GridView = cxGridDBTableView
          end
        end
        object pnlStyle1: TPanel
          Left = 0
          Top = 0
          Width = 812
          Height = 4
          Align = alTop
          BevelOuter = bvNone
          Color = 16758122
          ParentBackground = False
          TabOrder = 1
        end
      end
    end
    object tshEdit: TTabSheet
      Caption = 'Edit'
      ImageIndex = 1
      object pnlEditButon: TPanel
        Left = 812
        Top = 0
        Width = 103
        Height = 454
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          103
          454)
        object btnCancelar: TButton
          Left = 14
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Cancelar'
          TabOrder = 0
          OnClick = btnCancelarClick
        end
        object btnSalvar: TButton
          Left = 14
          Top = 34
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Salvar'
          Default = True
          TabOrder = 1
          OnClick = btnSalvarClick
        end
      end
      object pnlFundo: TPanel
        Left = 0
        Top = 0
        Width = 812
        Height = 454
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object pnlStyle2: TPanel
          Left = 0
          Top = 0
          Width = 812
          Height = 4
          Align = alTop
          BevelOuter = bvNone
          Color = 16758122
          ParentBackground = False
          TabOrder = 0
        end
      end
    end
  end
  object dtsMain: TDataSource
    AutoEdit = False
    DataSet = adsMain
    Left = 752
    Top = 416
  end
  object adsMain: TAureliusDataset
    FieldDefs = <>
    Left = 792
    Top = 416
  end
  object cxGridPopupMenu: TcxGridPopupMenu
    Grid = cxGrid
    PopupMenus = <>
    Left = 208
    Top = 232
  end
end
