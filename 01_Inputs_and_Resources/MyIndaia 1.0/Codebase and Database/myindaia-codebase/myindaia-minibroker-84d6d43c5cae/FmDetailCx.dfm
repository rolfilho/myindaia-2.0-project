object FrameDetailCX: TFrameDetailCX
  Left = 0
  Top = 0
  Width = 503
  Height = 317
  Color = clWhite
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 503
    Height = 317
    ActivePage = tshGrid
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object tshGrid: TTabSheet
      Caption = 'Grid'
      object Panel2: TPanel
        Left = 404
        Top = 0
        Width = 91
        Height = 288
        Align = alRight
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          91
          288)
        object btnIncluir: TButton
          Left = 8
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
          Left = 8
          Top = 34
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Alterar'
          TabOrder = 1
          OnClick = btnAlterarClick
        end
        object btnConsultar: TButton
          Left = 8
          Top = 65
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Consultar'
          TabOrder = 2
          Visible = False
        end
        object btnExcluir: TButton
          Left = 8
          Top = 97
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Excluir'
          TabOrder = 3
          OnClick = btnExcluirClick
        end
      end
      object pnlGrid: TPanel
        Left = 0
        Top = 0
        Width = 404
        Height = 288
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object cxGridD: TcxGrid
          Left = 0
          Top = 0
          Width = 404
          Height = 288
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = cxcbsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object cxGridDBTableViewDetail: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dtsDetailx
            DataController.Options = []
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
          end
          object cxGridLevelDetail: TcxGridLevel
            GridView = cxGridDBTableViewDetail
          end
        end
      end
    end
    object tshEdit: TTabSheet
      Caption = 'Edit'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 404
        Top = 0
        Width = 91
        Height = 288
        Align = alRight
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          91
          288)
        object btnCancelar: TButton
          Left = 8
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Cancelar'
          TabOrder = 0
          OnClick = btnCancelarClick
        end
        object btnSalvar: TButton
          Left = 8
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
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 404
        Height = 288
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
      end
    end
  end
  object dtsDetailx: TDataSource
    AutoEdit = False
    DataSet = adsDetailx
    Left = 175
    Top = 101
  end
  object adsDetailx: TAureliusDataset
    FieldDefs = <>
    Left = 239
    Top = 101
  end
end
