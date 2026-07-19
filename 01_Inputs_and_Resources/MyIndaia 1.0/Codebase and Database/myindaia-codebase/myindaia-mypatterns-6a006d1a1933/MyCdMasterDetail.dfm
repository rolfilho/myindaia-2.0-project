inherited formMyCdMasterDetail: TformMyCdMasterDetail
  Caption = 'formMyCdMasterDetail'
  ClientHeight = 570
  ExplicitTop = -55
  ExplicitHeight = 608
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlButton: TPanel
    Top = 550
    ExplicitTop = 550
  end
  inherited PageControl: TPageControl
    Height = 550
    ActivePage = tshGrid
    Font.Color = clWindowText
    ParentFont = False
    ExplicitHeight = 550
    inherited tshGrid: TTabSheet
      ExplicitHeight = 516
      inherited pnlButtonGrid: TPanel
        Height = 516
        ExplicitHeight = 516
        DesignSize = (
          103
          516)
        inherited btnIncluir: TButton
          Left = 15
          Default = False
          WordWrap = True
          ExplicitLeft = 15
        end
        inherited btnAlterar: TButton
          Left = 15
          WordWrap = True
          OnKeyDown = btnAlterarKeyDown
          ExplicitLeft = 15
        end
        inherited btnConsultar: TButton
          Left = 15
          WordWrap = True
          ExplicitLeft = 15
        end
        inherited btnExcluir: TButton
          Left = 15
          WordWrap = True
          ExplicitLeft = 15
        end
        inherited cbxAltRapida: TCheckBox
          Width = 83
          ExplicitWidth = 83
        end
      end
      inherited pnlGrid: TPanel
        Height = 516
        ExplicitHeight = 516
        object SplitterGridDetail: TSplitter [0]
          Left = 0
          Top = 400
          Width = 812
          Height = 4
          Cursor = crVSplit
          Align = alBottom
          Color = 16758122
          ParentColor = False
          ExplicitTop = 342
          ExplicitWidth = 742
        end
        inherited cxGrid: TcxGrid
          Height = 396
          BevelInner = bvNone
          BevelOuter = bvNone
          Font.Color = clWindowText
          ExplicitHeight = 396
        end
        object cxGridDetailList: TcxGrid [2]
          Left = 0
          Top = 404
          Width = 812
          Height = 112
          Align = alBottom
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = cxcbsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object cxGridDBTableViewDetailList: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataModeController.GridMode = True
            DataController.DataSource = dtsDetail
            DataController.Options = []
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
          end
          object cxGridLevelDetailList: TcxGridLevel
            GridView = cxGridDBTableViewDetailList
          end
        end
        inherited pnlStyle1: TPanel
          TabOrder = 2
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitHeight = 516
      inherited pnlEditButon: TPanel
        Height = 516
        Color = clWhite
        ParentBackground = False
        ExplicitHeight = 516
        DesignSize = (
          103
          516)
      end
      inherited pnlFundo: TPanel
        Height = 516
        ExplicitHeight = 516
        object pnlDetails: TPanel
          Left = 0
          Top = 4
          Width = 812
          Height = 512
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object SplitterDetail: TSplitter
            Left = 0
            Top = 202
            Width = 812
            Height = 4
            Cursor = crVSplit
            Align = alTop
            Color = 16758122
            ParentColor = False
            ExplicitWidth = 742
          end
          object PanelDetail: TPanel
            Left = 0
            Top = 206
            Width = 812
            Height = 306
            Align = alClient
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            object pgDetails: TPageControl
              Left = 0
              Top = 0
              Width = 812
              Height = 306
              ActivePage = tbsDetail1
              Align = alClient
              Style = tsButtons
              TabOrder = 0
              object tbsDetail1: TTabSheet
                object PageControlDetail: TPageControl
                  Left = 0
                  Top = 0
                  Width = 804
                  Height = 272
                  ActivePage = tshDetailGrid
                  Align = alClient
                  TabOrder = 0
                  object tshDetailGrid: TTabSheet
                    Caption = 'Grid'
                    object pnlEditButonDetail: TPanel
                      Left = 705
                      Top = 0
                      Width = 91
                      Height = 241
                      Align = alRight
                      BevelOuter = bvNone
                      TabOrder = 0
                      DesignSize = (
                        91
                        241)
                      object btnDetailIncluir: TButton
                        Left = 8
                        Top = 3
                        Width = 75
                        Height = 25
                        Anchors = [akTop, akRight]
                        Caption = 'Incluir'
                        Default = True
                        TabOrder = 0
                        OnClick = btnDetailIncluirClick
                      end
                      object btnDetailAlterar: TButton
                        Left = 8
                        Top = 34
                        Width = 75
                        Height = 25
                        Anchors = [akTop, akRight]
                        Caption = 'Alterar'
                        TabOrder = 1
                        OnClick = btnDetailAlterarClick
                        OnKeyDown = btnDetailAlterarKeyDown
                      end
                      object btnDetailConsultar: TButton
                        Left = 8
                        Top = 65
                        Width = 75
                        Height = 25
                        Anchors = [akTop, akRight]
                        Caption = 'Consultar'
                        TabOrder = 2
                        OnClick = btnDetailConsultarClick
                      end
                      object btnDetailExcluir: TButton
                        Left = 8
                        Top = 97
                        Width = 75
                        Height = 25
                        Anchors = [akTop, akRight]
                        Caption = 'Excluir'
                        TabOrder = 3
                        OnClick = btnDetailExcluirClick
                      end
                      object cbxAltRapidaDetail: TCheckBox
                        Left = 8
                        Top = 128
                        Width = 75
                        Height = 17
                        Caption = 'Alt. R'#225'pida'
                        TabOrder = 4
                        Visible = False
                      end
                    end
                    object cxGridDetail: TcxGrid
                      Left = 0
                      Top = 0
                      Width = 705
                      Height = 241
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
                      TabOrder = 1
                      object cxGridDBTableViewDetail: TcxGridDBTableView
                        Navigator.Buttons.CustomButtons = <>
                        OnCanFocusRecord = cxGridDBTableViewDetailCanFocusRecord
                        OnEditKeyDown = cxGridDBTableViewDetailEditKeyDown
                        DataController.DataSource = dtsDetail
                        DataController.Options = []
                        DataController.Summary.DefaultGroupSummaryItems = <>
                        DataController.Summary.FooterSummaryItems = <>
                        DataController.Summary.SummaryGroups = <>
                        OptionsData.Deleting = False
                        OptionsView.GroupByBox = False
                        OptionsView.Indicator = True
                      end
                      object cxGridLevelDetail: TcxGridLevel
                        GridView = cxGridDBTableViewDetail
                      end
                    end
                  end
                  object tshDetailEdit: TTabSheet
                    Caption = 'Edit'
                    ImageIndex = 1
                    object Panel8: TPanel
                      Left = 705
                      Top = 0
                      Width = 91
                      Height = 241
                      Align = alRight
                      BevelOuter = bvNone
                      TabOrder = 0
                      DesignSize = (
                        91
                        241)
                      object btnDetailCancelar: TButton
                        Left = 8
                        Top = 3
                        Width = 75
                        Height = 25
                        Anchors = [akTop, akRight]
                        Caption = 'Cancelar'
                        TabOrder = 0
                        OnClick = btnDetailCancelarClick
                      end
                      object btnDetailSalvar: TButton
                        Left = 8
                        Top = 34
                        Width = 75
                        Height = 25
                        Anchors = [akTop, akRight]
                        Caption = 'Salvar'
                        Default = True
                        TabOrder = 1
                        OnClick = btnDetailSalvarClick
                      end
                    end
                  end
                end
              end
            end
          end
          object pnlMaster: TPanel
            Left = 0
            Top = 0
            Width = 812
            Height = 202
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
          end
        end
      end
    end
  end
  object dtsDetail: TDataSource [3]
    AutoEdit = False
    DataSet = adsDetail
    Left = 656
    Top = 416
  end
  object adsDetail: TAureliusDataset
    FieldDefs = <>
    Left = 704
    Top = 416
  end
end
