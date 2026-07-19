inherited frmWalletCustomerGroup: TfrmWalletCustomerGroup
  Caption = 'Cadastro de Grupo'
  ClientHeight = 686
  ExplicitHeight = 724
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlButton: TPanel
    Top = 666
    ExplicitTop = 666
  end
  inherited PageControl: TPageControl
    Height = 666
    ExplicitHeight = 666
    inherited tshGrid: TTabSheet
      ExplicitHeight = 632
      inherited pnlButtonGrid: TPanel
        Height = 632
        ExplicitHeight = 632
        inherited btnConsultar: TButton
          Top = 193
          Height = 26
          Visible = False
          ExplicitTop = 193
          ExplicitHeight = 26
        end
        inherited btnExcluir: TButton
          Top = 65
          ExplicitTop = 65
        end
        inherited cbxAltRapida: TCheckBox
          Left = 15
          Top = 168
          ExplicitLeft = 15
          ExplicitTop = 168
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
          OnClick = btnContextoClick
        end
      end
      inherited pnlGrid: TPanel
        Height = 632
        ExplicitHeight = 632
        inherited SplitterGridDetail: TSplitter
          Top = 516
          ExplicitTop = 404
        end
        inherited cxGrid: TcxGrid
          Height = 512
          ExplicitHeight = 512
          inherited cxGridDBTableView: TcxGridDBTableView
            FindPanel.DisplayMode = fpdmAlways
            FindPanel.InfoText = 'Buscar...'
            FindPanel.ShowClearButton = False
            FindPanel.ShowCloseButton = False
            FindPanel.ShowFindButton = False
            DataController.DataModeController.GridMode = False
            object cxGridDBTableViewId: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
            end
            object cxGridDBTableViewName: TcxGridDBColumn
              DataBinding.FieldName = 'Name'
              Width = 559
            end
          end
        end
        inherited cxGridDetailList: TcxGrid
          Top = 520
          ExplicitTop = 520
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitHeight = 632
      inherited pnlEditButon: TPanel
        Height = 632
        ExplicitHeight = 632
      end
      inherited pnlFundo: TPanel
        Height = 632
        ExplicitHeight = 632
        inherited pnlDetails: TPanel
          Height = 628
          ExplicitHeight = 628
          inherited SplitterDetail: TSplitter
            Top = 118
            ExplicitTop = 157
          end
          inherited PanelDetail: TPanel
            Top = 122
            Height = 506
            ExplicitTop = 122
            ExplicitHeight = 506
            inherited pgDetails: TPageControl
              Height = 506
              Style = tsTabs
              ExplicitHeight = 506
              inherited tbsDetail1: TTabSheet
                Caption = 'Produtos'
                ExplicitTop = 27
                ExplicitHeight = 475
                inherited PageControlDetail: TPageControl
                  Height = 475
                  ExplicitHeight = 475
                  inherited tshDetailGrid: TTabSheet
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 444
                    inherited pnlEditButonDetail: TPanel
                      Height = 444
                      ExplicitHeight = 444
                      inherited btnDetailConsultar: TButton
                        Visible = False
                      end
                    end
                    inherited cxGridDetail: TcxGrid
                      Height = 444
                      ExplicitHeight = 444
                      inherited cxGridDBTableViewDetail: TcxGridDBTableView
                        object cxGridDBTableViewDetailProductIdName: TcxGridDBColumn
                          DataBinding.FieldName = 'ProductId.Name'
                          Width = 300
                        end
                      end
                    end
                  end
                  inherited tshDetailEdit: TTabSheet
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 444
                    object Label2: TLabel [0]
                      Left = 11
                      Top = 62
                      Width = 44
                      Height = 16
                      Caption = 'Produto'
                    end
                    object Label4: TLabel [1]
                      Left = 11
                      Top = 16
                      Width = 39
                      Height = 16
                      Caption = 'C'#243'digo'
                    end
                    object Label5: TLabel [2]
                      Left = 387
                      Top = 62
                      Width = 55
                      Height = 16
                      Caption = 'Descri'#231#227'o'
                      Visible = False
                    end
                    object Label6: TLabel [3]
                      Left = 11
                      Top = 114
                      Width = 92
                      Height = 16
                      Caption = 'Centro de Custo'
                    end
                    object Label7: TLabel [4]
                      Left = 11
                      Top = 162
                      Width = 135
                      Height = 16
                      Caption = 'Limite de Adiantamento'
                    end
                    inherited Panel8: TPanel
                      Height = 444
                      ExplicitHeight = 444
                    end
                    object dbcProduct: TDBLookupComboBox
                      Left = 11
                      Top = 78
                      Width = 66
                      Height = 24
                      DataField = 'ProductId'
                      DataSource = dtsDetail
                      DropDownWidth = 272
                      KeyField = 'Self'
                      ListField = 'Id'
                      ListSource = dsProduct
                      NullValueKey = 16401
                      TabOrder = 1
                    end
                    object dbcbNmProduct: TDBLookupComboBox
                      Left = 79
                      Top = 78
                      Width = 274
                      Height = 24
                      DataField = 'ProductId'
                      DataSource = dtsDetail
                      DropDownWidth = 272
                      KeyField = 'Self'
                      ListField = 'Name'
                      ListSource = dsProduct
                      NullValueKey = 16401
                      TabOrder = 2
                    end
                    object DBEdit1: TDBEdit
                      Left = 11
                      Top = 33
                      Width = 121
                      Height = 24
                      Color = 14935011
                      DataField = 'Id'
                      DataSource = dtsDetail
                      ReadOnly = True
                      TabOrder = 3
                    end
                    object DBEdit2: TDBEdit
                      Left = 387
                      Top = 78
                      Width = 121
                      Height = 24
                      Color = clWhite
                      DataField = 'Descricao'
                      DataSource = dtsDetail
                      TabOrder = 4
                      Visible = False
                    end
                    object DBEdit3: TDBEdit
                      Left = 11
                      Top = 130
                      Width = 121
                      Height = 24
                      Color = clWhite
                      DataField = 'Costcenter'
                      DataSource = dtsDetail
                      TabOrder = 5
                    end
                    object DBEdit4: TDBEdit
                      Left = 11
                      Top = 178
                      Width = 121
                      Height = 24
                      Color = clWhite
                      DataField = 'Limitvalue'
                      DataSource = dtsDetail
                      TabOrder = 6
                    end
                    object DBCheckBox1: TDBCheckBox
                      Left = 11
                      Top = 221
                      Width = 194
                      Height = 17
                      Caption = 'Faturamento consolidado'
                      DataField = 'Consolidatedbilling'
                      DataSource = dtsDetail
                      TabOrder = 7
                    end
                    object DBCheckBox2: TDBCheckBox
                      Left = 10
                      Top = 249
                      Width = 194
                      Height = 17
                      Caption = 'Solicita'#231#227'o de numer'#225'rio'
                      DataField = 'Withcashrequest'
                      DataSource = dtsDetail
                      TabOrder = 8
                    end
                    object DBCheckBox3: TDBCheckBox
                      Left = 186
                      Top = 221
                      Width = 167
                      Height = 17
                      Caption = 'Fatura consolidada'
                      DataField = 'Consolidatedinvoice'
                      DataSource = dtsDetail
                      TabOrder = 9
                    end
                    object DBCheckBox4: TDBCheckBox
                      Left = 186
                      Top = 249
                      Width = 194
                      Height = 17
                      Caption = 'Envio para o banco'
                      DataField = 'Sendtobank'
                      DataSource = dtsDetail
                      TabOrder = 10
                    end
                  end
                end
              end
              object tbsFaturamento: TTabSheet
                Caption = 'Faturamento'
                ImageIndex = 1
                inline frameCP: TFrameWalletCustomerGroupCP
                  Left = 0
                  Top = 0
                  Width = 804
                  Height = 475
                  Align = alClient
                  Color = clWhite
                  ParentBackground = False
                  ParentColor = False
                  TabOrder = 0
                  ExplicitWidth = 804
                  ExplicitHeight = 475
                  inherited PageControl: TPageControl
                    Width = 804
                    Height = 475
                    ExplicitWidth = 804
                    ExplicitHeight = 475
                    inherited tshGrid: TTabSheet
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 796
                      ExplicitHeight = 444
                      inherited Panel2: TPanel
                        Left = 705
                        Height = 444
                        ExplicitLeft = 705
                        ExplicitHeight = 444
                        inherited btnIncluir: TButton
                          OnClick = frameWalletCustomerGroupCP1btnIncluirClick
                        end
                        inherited btnAlterar: TButton
                          OnClick = frameWalletCustomerGroupCP1btnAlterarClick
                        end
                        inherited btnConsultar: TButton
                          Top = 313
                          Visible = False
                          ExplicitTop = 313
                        end
                        inherited btnExcluir: TButton
                          Top = 65
                          OnClick = frameWalletCustomerGroupCP1btnExcluirClick
                          ExplicitTop = 65
                        end
                      end
                      inherited pnlGrid: TPanel
                        Width = 705
                        Height = 444
                        ExplicitWidth = 705
                        ExplicitHeight = 444
                        inherited cxGridD: TcxGrid
                          Width = 705
                          Height = 444
                          ExplicitWidth = 705
                          ExplicitHeight = 444
                          inherited cxGridDBTableViewDetail: TcxGridDBTableView
                            inherited cxGridDBTableViewDetailId: TcxGridDBColumn
                              Width = 31
                            end
                            inherited cxGridDBTableViewDetailServiceIdName: TcxGridDBColumn
                              Width = 151
                            end
                            inherited cxGridDBTableViewDetailItemIdName: TcxGridDBColumn
                              Width = 130
                            end
                            inherited cxGridDBTableViewDetailPrice: TcxGridDBColumn
                              Width = 56
                            end
                            inherited cxGridDBTableViewDetailStartdate: TcxGridDBColumn
                              Width = 70
                            end
                            inherited cxGridDBTableViewDetailExpirydate: TcxGridDBColumn
                              Width = 70
                            end
                            inherited cxGridDBTableViewDetailBaseeventIdId: TcxGridDBColumn
                              Width = 32
                            end
                            inherited cxGridDBTableViewDetailBaseeventIdName: TcxGridDBColumn
                              Width = 126
                            end
                            inherited cxGridDBTableViewDetailPlaceofshipmentExcept: TcxGridDBColumn
                              Width = 45
                            end
                            inherited cxGridDBTableViewDetailPlaceofdischargeExcept: TcxGridDBColumn
                              Width = 45
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
                      inherited Panel3: TPanel
                        Left = 705
                        Height = 444
                        ExplicitLeft = 705
                        ExplicitHeight = 444
                        inherited btnCancelar: TButton
                          OnClick = frameWalletCustomerGroupCP1btnCancelarClick
                        end
                        inherited btnSalvar: TButton
                          OnClick = frameWalletCustomerGroupCP1btnSalvarClick
                        end
                      end
                      inherited Panel1: TPanel
                        Width = 705
                        Height = 444
                        ExplicitWidth = 705
                        ExplicitHeight = 444
                        inherited dbcbItem: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbItemCod: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbEventoBase: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbCodEventoBase: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbTpCobranca: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbTpEstufagem: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbViaTransporte: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbLocalEmbarque: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbCodLocalEmbarque: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbLocalDesembarque: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbCodLocalDesembarque: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbServico: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbProduto: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbCodCliente: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbCliente: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbCodRepresentante: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                        inherited dbcbRepresentante: TcxDBLookupComboBox
                          ExplicitHeight = 24
                        end
                      end
                    end
                  end
                  inherited dtsDetailx: TDataSource
                    Top = 61
                  end
                  inherited adsDetailx: TAureliusDataset
                    AfterInsert = frameWalletCustomerGroupCP1adsDetailxAfterInsert
                    Top = 61
                    DesignClass = 'MyEntitiesV2.TBillingcustomerprofile'
                  end
                  inherited adsItem: TAureliusDataset
                    Top = 64
                    DesignClass = 'MyEntitiesV2.TItem'
                  end
                  inherited dsItem: TDataSource
                    Top = 64
                  end
                  inherited adsProduto: TAureliusDataset
                    DesignClass = 'MyEntitiesV2.TVwProduct'
                  end
                  inherited adsServico: TAureliusDataset
                    DesignClass = 'MyEntitiesV2.TVwService'
                  end
                  inherited adsEvento: TAureliusDataset
                    Top = 64
                    DesignClass = 'MyEntitiesV2.TVwEvent'
                  end
                  inherited dsEvento: TDataSource
                    Top = 64
                  end
                  inherited adsBillingType: TAureliusDataset
                    DesignClass = 'MyEntitiesV2.TBillingtype'
                  end
                  inherited adsLocalEmbarque: TAureliusDataset
                    DesignClass = 'MyEntitiesV2.TVwLocalembarque'
                  end
                  inherited adsLocalDesembarque: TAureliusDataset
                    DesignClass = 'MyEntitiesV2.TVwLocalembarque'
                  end
                  inherited adsEstufagem: TAureliusDataset
                    Top = 64
                    DesignClass = 'MyEntitiesV2.TVwEstufagem'
                  end
                  inherited dsEstufagem: TDataSource
                    Top = 64
                  end
                  inherited adsViaTransporte: TAureliusDataset
                    DesignClass = 'MyEntitiesV2.TVwViatransporte'
                  end
                  inherited adsCliente: TAureliusDataset
                    DesignClass = 'MyEntitiesV2.TCustomer'
                  end
                  inherited adsRepresentante: TAureliusDataset
                    DesignClass = 'MyEntitiesV2.TVwRepresentante'
                  end
                end
              end
            end
          end
          inherited pnlMaster: TPanel
            Height = 118
            ExplicitHeight = 118
            object Label1: TLabel
              Left = 19
              Top = 16
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
            end
            object Label3: TLabel
              Left = 19
              Top = 58
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
            object dbedtDescricao: TDBEdit
              Left = 19
              Top = 74
              Width = 406
              Height = 24
              Color = clWhite
              DataField = 'Name'
              DataSource = dtsMain
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  inherited dtsMain: TDataSource
    Left = 584
    Top = 112
  end
  inherited dtsDetail: TDataSource
    Left = 488
    Top = 112
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
        Name = 'Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DefinitionsId'
        DataType = ftVariant
      end
      item
        Name = 'GrupoJoin'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    BeforeInsert = adsMainBeforeInsert
    BeforeEdit = adsMainBeforeEdit
    BeforeDelete = adsMainBeforeDelete
    AfterScroll = adsMainAfterScroll
    Left = 624
    Top = 112
    DesignClass = 'MyEntitiesV2.TCustomergroup'
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
    object adsMainName: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
      Required = True
      Size = 255
    end
    object adsMainDefinitionsId: TAureliusEntityField
      FieldName = 'DefinitionsId'
    end
    object adsMainGrupoJoin: TDataSetField
      FieldName = 'GrupoJoin'
      ReadOnly = True
    end
  end
  inherited cxGridPopupMenu: TcxGridPopupMenu
    Left = 528
    Top = 32
  end
  inherited adsDetail: TAureliusDataset
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
        Name = 'Consolidatedbilling'
        DataType = ftBoolean
      end
      item
        Name = 'Consolidatedinvoice'
        DataType = ftBoolean
      end
      item
        Name = 'Costcenter'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Loadditax'
        DataType = ftBoolean
      end
      item
        Name = 'Sendtobank'
        DataType = ftBoolean
      end
      item
        Name = 'Withcashrequest'
        DataType = ftBoolean
      end
      item
        Name = 'Limitvalue'
        DataType = ftFloat
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
        Name = 'PerfisJoin'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    BeforeInsert = adsDetailBeforeInsert
    AfterInsert = adsDetailAfterInsert
    BeforeEdit = adsDetailBeforeEdit
    AfterPost = adsDetailAfterPost
    BeforeDelete = adsDetailBeforeDelete
    SubpropsDepth = 2
    SyncSubprops = True
    Left = 536
    Top = 112
    DesignClass = 'MyEntitiesV2.TCustomerprofile'
    object adsDetailSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsDetailId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsDetailConsolidatedbilling: TBooleanField
      DisplayLabel = 'Faturamento Consolidado'
      FieldName = 'Consolidatedbilling'
    end
    object adsDetailConsolidatedinvoice: TBooleanField
      DisplayLabel = 'Fatura Consolidada'
      FieldName = 'Consolidatedinvoice'
    end
    object adsDetailCostcenter: TStringField
      DisplayLabel = 'Centro de custo'
      FieldName = 'Costcenter'
      Required = True
      Size = 255
    end
    object adsDetailDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 255
    end
    object adsDetailLoadditax: TBooleanField
      FieldName = 'Loadditax'
    end
    object adsDetailSendtobank: TBooleanField
      DisplayLabel = 'Envio para o banco'
      FieldName = 'Sendtobank'
    end
    object adsDetailWithcashrequest: TBooleanField
      DisplayLabel = 'Solicita'#231#227'o de numer'#225'rio'
      FieldName = 'Withcashrequest'
    end
    object adsDetailLimitvalue: TFloatField
      DisplayLabel = 'Limite de Adiantamento'
      FieldName = 'Limitvalue'
      Required = True
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
    object adsDetailProductIdAkey: TStringField
      FieldName = 'ProductId.Akey'
      ReadOnly = True
      Size = 255
    end
    object adsDetailProductIdName: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'ProductId.Name'
      ReadOnly = True
      Size = 255
    end
    object adsDetailPerfisJoin: TDataSetField
      FieldName = 'PerfisJoin'
      ReadOnly = True
    end
  end
  object adsProduct: TAureliusDataset
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
    Left = 368
    Top = 32
    DesignClass = 'MyEntitiesV2.TProduct'
    object adsProductSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsProductId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsProductAkey: TStringField
      FieldName = 'Akey'
      Size = 255
    end
    object adsProductName: TStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object dsProduct: TDataSource
    AutoEdit = False
    DataSet = adsProduct
    Left = 368
    Top = 32
  end
  object adsJoin: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faReadonly, faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CustomergroupId'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'CpsId'
        DataType = ftVariant
      end>
    Left = 624
    Top = 32
    DesignClass = 'MyEntitiesV2.TCustomergroupCustomerprofile'
    object adsJoinSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsJoinId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsJoinCustomergroupId: TAureliusEntityField
      FieldName = 'CustomergroupId'
      Required = True
    end
    object adsJoinCpsId: TAureliusEntityField
      FieldName = 'CpsId'
    end
  end
end
