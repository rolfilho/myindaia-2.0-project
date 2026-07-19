inherited frmWalletProductService: TfrmWalletProductService
  Caption = 'Cadastro de Produto'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited PageControl: TPageControl
    inherited tshGrid: TTabSheet
      inherited pnlButtonGrid: TPanel
        inherited btnConsultar: TButton
          Top = 209
          Visible = False
          ExplicitTop = 209
        end
        inherited btnExcluir: TButton
          Top = 65
          ExplicitTop = 65
        end
        inherited cbxAltRapida: TCheckBox
          Left = 15
          Top = 240
          WordWrap = True
          ExplicitLeft = 15
          ExplicitTop = 240
        end
        object btnContexto: TButton
          Left = 15
          Top = 129
          Width = 75
          Height = 25
          Hint = 'Atalho: [Ctrl + P]'
          Anchors = [akTop, akRight]
          Caption = 'Pesquisar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          Visible = False
          WordWrap = True
          OnClick = btnContextoClick
        end
      end
      inherited pnlGrid: TPanel
        inherited SplitterGridDetail: TSplitter
          ExplicitTop = 341
        end
        inherited cxGrid: TcxGrid
          inherited cxGridDBTableView: TcxGridDBTableView
            FindPanel.DisplayMode = fpdmAlways
            FindPanel.InfoText = 'Buscar...'
            FindPanel.ShowClearButton = False
            FindPanel.ShowCloseButton = False
            FindPanel.ShowFindButton = False
            DataController.DataModeController.GridMode = False
            object cxGridDBTableViewId: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
              Width = 47
            end
            object cxGridDBTableViewName: TcxGridDBColumn
              DataBinding.FieldName = 'Name'
              Width = 629
            end
          end
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inherited pnlFundo: TPanel
        inherited pnlDetails: TPanel
          inherited SplitterDetail: TSplitter
            Top = 260
            ExplicitTop = 260
          end
          inherited PanelDetail: TPanel
            Top = 264
            Height = 248
            ExplicitTop = 264
            ExplicitHeight = 251
            inherited pgDetails: TPageControl
              Height = 248
              ExplicitHeight = 251
              inherited tbsDetail1: TTabSheet
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 220
                inherited PageControlDetail: TPageControl
                  Height = 214
                  ExplicitHeight = 220
                  inherited tshDetailGrid: TTabSheet
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 189
                    inherited pnlEditButonDetail: TPanel
                      Height = 189
                      ExplicitHeight = 189
                      inherited btnDetailConsultar: TButton
                        Visible = False
                      end
                    end
                    inherited cxGridDetail: TcxGrid
                      Height = 189
                      ExplicitHeight = 189
                      inherited cxGridDBTableViewDetail: TcxGridDBTableView
                        object cxGridDBTableViewDetailServicesIdId: TcxGridDBColumn
                          DataBinding.FieldName = 'ServicesId.Id'
                          Width = 46
                        end
                        object cxGridDBTableViewDetailServicesIdAkey: TcxGridDBColumn
                          DataBinding.FieldName = 'ServicesId.Akey'
                          Width = 87
                        end
                        object cxGridDBTableViewDetailServicesIdName: TcxGridDBColumn
                          DataBinding.FieldName = 'ServicesId.Name'
                          Width = 445
                        end
                      end
                    end
                  end
                  inherited tshDetailEdit: TTabSheet
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 189
                    object Label4: TLabel [0]
                      Left = 11
                      Top = 14
                      Width = 42
                      Height = 16
                      Caption = 'Servi'#231'o'
                    end
                    inherited Panel8: TPanel
                      Height = 183
                      ExplicitHeight = 189
                    end
                    object dbcService: TDBLookupComboBox
                      Left = 11
                      Top = 30
                      Width = 66
                      Height = 24
                      DataField = 'ServicesId'
                      DataSource = dtsDetail
                      DropDownWidth = 272
                      KeyField = 'Self'
                      ListField = 'Id'
                      ListSource = dsService
                      NullValueKey = 16401
                      TabOrder = 1
                    end
                    object dbcbNameService: TDBLookupComboBox
                      Left = 79
                      Top = 30
                      Width = 418
                      Height = 24
                      DataField = 'ServicesId'
                      DataSource = dtsDetail
                      DropDownWidth = 272
                      KeyField = 'Self'
                      ListField = 'Name'
                      ListSource = dsService
                      NullValueKey = 16401
                      TabOrder = 2
                    end
                  end
                end
              end
            end
          end
          inherited pnlMaster: TPanel
            Height = 260
            ExplicitLeft = 72
            ExplicitTop = 30
            ExplicitHeight = 260
            object Label1: TLabel
              Left = 19
              Top = 16
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
            end
            object Label2: TLabel
              Left = 19
              Top = 64
              Width = 84
              Height = 16
              Caption = 'C'#243'digo  Broker'
            end
            object Label3: TLabel
              Left = 19
              Top = 112
              Width = 55
              Height = 16
              Caption = 'Descri'#231#227'o'
            end
            object dbedtId: TDBEdit
              Left = 19
              Top = 33
              Width = 121
              Height = 24
              Color = 14935011
              DataField = 'Id'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 0
            end
            object dbedtCodBroker: TDBEdit
              Left = 19
              Top = 81
              Width = 121
              Height = 24
              Color = clWhite
              DataField = 'Akey'
              DataSource = dtsMain
              TabOrder = 1
            end
            object dbedtDescricao: TDBEdit
              Left = 19
              Top = 129
              Width = 121
              Height = 24
              Color = clWhite
              DataField = 'Name'
              DataSource = dtsMain
              TabOrder = 2
            end
          end
        end
      end
    end
  end
  inherited adsMain: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faReadonly, faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ProductServiceList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    BeforeInsert = adsMainBeforeInsert
    BeforeEdit = adsMainBeforeEdit
    BeforeDelete = adsMainBeforeDelete
    SubpropsDepth = 1
    DesignClass = 'MyEntitiesV2.TProduct'
    object adsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsMainId: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsMainAkey: TStringField
      DisplayLabel = 'C'#243'digo Broker'
      FieldName = 'Akey'
      Required = True
      Size = 255
    end
    object adsMainName: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Name'
      Required = True
      Size = 255
    end
    object adsMainProductServiceList: TDataSetField
      FieldName = 'ProductServiceList'
      ReadOnly = True
    end
  end
  inherited cxGridPopupMenu: TcxGridPopupMenu
    Left = 680
    Top = 168
  end
  inherited adsDetail: TAureliusDataset
    DatasetField = adsMainProductServiceList
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'ProductId'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'ProductId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'ProductId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ProductId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ProductId.ProductServiceList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ProductId.ProductCashrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ProductId.ProductCustomerprofileList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ProductId.ProductPaymentdefinitionList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ProductId.ProductPaymentrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ServicesId'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'ServicesId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'ServicesId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ServicesId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ServicesId.ServiceCashrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ServicesId.ServiceCustomclearanceList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ServicesId.ServiceProductServiceList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ServicesId.ServicePaymentrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    BeforeInsert = adsDetailBeforeInsert
    BeforeEdit = adsDetailBeforeEdit
    SubpropsDepth = 1
    DesignClass = 'MyEntitiesV2.TProductService'
    object adsDetailSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsDetailProductId: TAureliusEntityField
      DisplayLabel = 'Produto'
      FieldName = 'ProductId'
      Required = True
    end
    object adsDetailProductIdId: TLargeintField
      FieldName = 'ProductId.Id'
      ReadOnly = True
    end
    object adsDetailServicesId: TAureliusEntityField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'ServicesId'
      Required = True
    end
    object adsDetailServicesIdId: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ServicesId.Id'
      ReadOnly = True
    end
    object adsDetailServicesIdAkey: TStringField
      DisplayLabel = 'C'#243'digo Broker'
      FieldName = 'ServicesId.Akey'
      ReadOnly = True
      Size = 255
    end
    object adsDetailServicesIdName: TStringField
      DisplayLabel = 'Descri'#231#227'o Servi'#231'o'
      FieldName = 'ServicesId.Name'
      ReadOnly = True
      Size = 255
    end
  end
  object adsService: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faReadonly, faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ServiceCashrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ServiceCustomclearanceList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ServiceProductServiceList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ServicePaymentrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    Left = 336
    Top = 384
    DesignClass = 'MyEntitiesV2.TService'
    object adsServiceSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsServiceId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsServiceAkey: TStringField
      FieldName = 'Akey'
      Size = 255
    end
    object adsServiceName: TStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object dsService: TDataSource
    AutoEdit = False
    DataSet = adsService
    Left = 312
    Top = 384
  end
end
