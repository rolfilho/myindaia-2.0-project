inherited frmWalletCustomer: TfrmWalletCustomer
  Caption = 'Cadastro de Cliente'
  ClientHeight = 662
  ClientWidth = 837
  ExplicitWidth = 853
  ExplicitHeight = 700
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlButton: TPanel
    Top = 642
    Width = 837
    ExplicitTop = 642
    ExplicitWidth = 837
  end
  inherited PageControl: TPageControl
    Width = 837
    Height = 642
    ExplicitWidth = 837
    ExplicitHeight = 642
    inherited tshGrid: TTabSheet
      ExplicitWidth = 829
      ExplicitHeight = 608
      inherited pnlButtonGrid: TPanel
        Left = 726
        Height = 608
        ExplicitLeft = 726
        ExplicitHeight = 611
        inherited btnConsultar: TButton
          Top = 217
          Visible = False
          ExplicitTop = 217
        end
        inherited btnExcluir: TButton
          Top = 65
          ExplicitTop = 65
        end
        inherited cbxAltRapida: TCheckBox
          Left = 15
          Top = 192
          ExplicitLeft = 15
          ExplicitTop = 192
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
        Width = 726
        Height = 608
        ExplicitWidth = 726
        ExplicitHeight = 608
        inherited SplitterGridDetail: TSplitter
          Top = 492
          Width = 726
          ExplicitTop = 491
          ExplicitWidth = 893
        end
        inherited cxGrid: TcxGrid
          Width = 726
          Height = 488
          ExplicitWidth = 726
          ExplicitHeight = 488
          inherited cxGridDBTableView: TcxGridDBTableView
            FindPanel.DisplayMode = fpdmAlways
            FindPanel.InfoText = 'Buscar...'
            FindPanel.ShowClearButton = False
            FindPanel.ShowCloseButton = False
            FindPanel.ShowFindButton = False
            DataController.DataModeController.GridMode = False
            object cxGridDBTableViewId: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
              Width = 51
            end
            object cxGridDBTableViewName: TcxGridDBColumn
              DataBinding.FieldName = 'Name'
              Width = 355
            end
            object cxGridDBTableViewAkey: TcxGridDBColumn
              DataBinding.FieldName = 'Akey'
              Width = 69
            end
            object cxGridDBTableViewSeniorkey: TcxGridDBColumn
              DataBinding.FieldName = 'Seniorkey'
              Width = 72
            end
            object cxGridDBTableViewTaxid: TcxGridDBColumn
              DataBinding.FieldName = 'Taxid'
              Width = 143
            end
          end
        end
        inherited cxGridDetailList: TcxGrid
          Top = 496
          Width = 726
          ExplicitTop = 499
          ExplicitWidth = 726
        end
        inherited pnlStyle1: TPanel
          Width = 726
          ExplicitWidth = 726
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 829
      ExplicitHeight = 611
      inherited pnlEditButon: TPanel
        Left = 726
        Height = 608
        ExplicitLeft = 726
        ExplicitHeight = 611
      end
      inherited pnlFundo: TPanel
        Width = 726
        Height = 608
        ExplicitWidth = 726
        ExplicitHeight = 611
        inherited pnlStyle2: TPanel
          Width = 726
          ExplicitWidth = 726
        end
        inherited pnlDetails: TPanel
          Width = 726
          Height = 604
          ExplicitWidth = 726
          ExplicitHeight = 607
          inherited SplitterDetail: TSplitter
            Top = 340
            Width = 726
            ExplicitTop = 340
            ExplicitWidth = 895
          end
          inherited PanelDetail: TPanel
            Top = 344
            Width = 726
            Height = 260
            ExplicitTop = 344
            ExplicitWidth = 726
            ExplicitHeight = 263
            inherited pgDetails: TPageControl
              Width = 726
              Height = 260
              ExplicitWidth = 726
              ExplicitHeight = 263
              inherited tbsDetail1: TTabSheet
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 718
                ExplicitHeight = 232
                inherited PageControlDetail: TPageControl
                  Width = 718
                  Height = 226
                  ExplicitWidth = 718
                  ExplicitHeight = 232
                  inherited tshDetailGrid: TTabSheet
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 710
                    ExplicitHeight = 201
                    inherited pnlEditButonDetail: TPanel
                      Left = 619
                      Height = 201
                      ExplicitLeft = 619
                      ExplicitHeight = 201
                      inherited btnDetailConsultar: TButton
                        Visible = False
                      end
                    end
                    inherited cxGridDetail: TcxGrid
                      Width = 619
                      Height = 201
                      ExplicitWidth = 619
                      ExplicitHeight = 201
                      inherited cxGridDBTableViewDetail: TcxGridDBTableView
                        object cxGridDBTableViewDetailId: TcxGridDBColumn
                          DataBinding.FieldName = 'Id'
                          Width = 39
                        end
                        object cxGridDBTableViewDetailBranchIdName: TcxGridDBColumn
                          DataBinding.FieldName = 'BranchId.Name'
                          Width = 278
                        end
                        object cxGridDBTableViewDetailProductIdName: TcxGridDBColumn
                          DataBinding.FieldName = 'ProductId.Name'
                          Width = 259
                        end
                        object cxGridDBTableViewDetailDueinvoiceday: TcxGridDBColumn
                          DataBinding.FieldName = 'Dueinvoiceday'
                          Width = 162
                        end
                      end
                    end
                  end
                  inherited tshDetailEdit: TTabSheet
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 710
                    ExplicitHeight = 201
                    object Label4: TLabel [0]
                      Left = 19
                      Top = 62
                      Width = 113
                      Height = 16
                      Caption = 'Unidade de Neg'#243'cio'
                    end
                    object Label6: TLabel [1]
                      Left = 19
                      Top = 105
                      Width = 44
                      Height = 16
                      Caption = 'Produto'
                    end
                    object Label20: TLabel [2]
                      Left = 19
                      Top = 16
                      Width = 39
                      Height = 16
                      Caption = 'C'#243'digo'
                    end
                    object Label21: TLabel [3]
                      Left = 19
                      Top = 152
                      Width = 149
                      Height = 16
                      Caption = 'Dias vencimento da fatura'
                    end
                    inherited Panel8: TPanel
                      Left = 619
                      Height = 195
                      ExplicitLeft = 619
                      ExplicitHeight = 201
                    end
                    object dbcbServico: TDBLookupComboBox
                      Left = 19
                      Top = 78
                      Width = 66
                      Height = 24
                      DataField = 'BranchId'
                      DataSource = dtsDetail
                      DropDownWidth = 272
                      KeyField = 'Self'
                      ListField = 'Id'
                      ListSource = dtsUnidade
                      NullValueKey = 16401
                      TabOrder = 1
                    end
                    object dbcbServicoNome: TDBLookupComboBox
                      Left = 87
                      Top = 78
                      Width = 418
                      Height = 24
                      DataField = 'BranchId'
                      DataSource = dtsDetail
                      DropDownWidth = 272
                      KeyField = 'Self'
                      ListField = 'Name'
                      ListSource = dtsUnidade
                      NullValueKey = 16401
                      TabOrder = 2
                    end
                    object dbcbProduto: TDBLookupComboBox
                      Left = 19
                      Top = 121
                      Width = 66
                      Height = 24
                      DataField = 'ProductId'
                      DataSource = dtsDetail
                      DropDownWidth = 272
                      KeyField = 'Self'
                      ListField = 'Id'
                      ListSource = dtsProduto
                      NullValueKey = 16401
                      TabOrder = 3
                    end
                    object dbcbProdutoNome: TDBLookupComboBox
                      Left = 87
                      Top = 121
                      Width = 418
                      Height = 24
                      DataField = 'ProductId'
                      DataSource = dtsDetail
                      DropDownWidth = 272
                      KeyField = 'Self'
                      ListField = 'Name'
                      ListSource = dtsProduto
                      NullValueKey = 16401
                      TabOrder = 4
                    end
                    object dbedtIdDetail: TDBEdit
                      Left = 19
                      Top = 33
                      Width = 121
                      Height = 24
                      Color = 14935011
                      DataField = 'Id'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 5
                    end
                    object dbedtVencimentoFatura: TDBEdit
                      Left = 19
                      Top = 171
                      Width = 121
                      Height = 24
                      Color = clWhite
                      DataField = 'Dueinvoiceday'
                      DataSource = dtsDetail
                      TabOrder = 6
                    end
                  end
                end
              end
            end
          end
          inherited pnlMaster: TPanel
            Width = 726
            Height = 340
            ExplicitWidth = 726
            ExplicitHeight = 340
            object PageControl1: TPageControl
              Left = 0
              Top = 0
              Width = 726
              Height = 340
              ActivePage = TabSheet1
              Align = alClient
              TabOrder = 0
              ExplicitLeft = 120
              ExplicitTop = 6
              object TabSheet1: TTabSheet
                Caption = 'Dados Gerais'
                ExplicitLeft = 116
                ExplicitTop = 6
                ExplicitWidth = 0
                ExplicitHeight = 0
                object Label1: TLabel
                  Left = 19
                  Top = 16
                  Width = 39
                  Height = 16
                  Caption = 'C'#243'digo'
                end
                object Label2: TLabel
                  Left = 19
                  Top = 206
                  Width = 84
                  Height = 16
                  Caption = 'C'#243'digo  Broker'
                end
                object Label3: TLabel
                  Left = 163
                  Top = 206
                  Width = 65
                  Height = 16
                  Caption = 'C'#243'digo ERP'
                end
                object Label5: TLabel
                  Left = 19
                  Top = 62
                  Width = 33
                  Height = 16
                  Caption = 'Nome'
                end
                object Label15: TLabel
                  Left = 19
                  Top = 158
                  Width = 108
                  Height = 16
                  Caption = 'Inscri'#231'ao Municipal'
                end
                object Label16: TLabel
                  Left = 163
                  Top = 158
                  Width = 103
                  Height = 16
                  Caption = 'Inscri'#231#227'o Estadual'
                end
                object Label17: TLabel
                  Left = 19
                  Top = 109
                  Width = 55
                  Height = 16
                  Caption = 'CNPJ/CPF'
                end
                object Label19: TLabel
                  Left = 19
                  Top = 252
                  Width = 34
                  Height = 16
                  Caption = 'Grupo'
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
                  Top = 223
                  Width = 121
                  Height = 24
                  Color = clWhite
                  DataField = 'Akey'
                  DataSource = dtsMain
                  TabOrder = 7
                end
                object dbedtCodSenior: TDBEdit
                  Left = 163
                  Top = 223
                  Width = 121
                  Height = 24
                  Color = clWhite
                  DataField = 'Seniorkey'
                  DataSource = dtsMain
                  TabOrder = 8
                end
                object dbcbStatus: TDBCheckBox
                  Left = 153
                  Top = 35
                  Width = 97
                  Height = 17
                  Caption = 'Ativo'
                  DataField = 'Active'
                  DataSource = dtsMain
                  TabOrder = 1
                end
                object dbedtNome: TDBEdit
                  Left = 19
                  Top = 79
                  Width = 326
                  Height = 24
                  Color = clWhite
                  DataField = 'Name'
                  DataSource = dtsMain
                  TabOrder = 2
                end
                object dbedtInscrMunicipal: TDBEdit
                  Left = 19
                  Top = 175
                  Width = 121
                  Height = 24
                  Color = clWhite
                  DataField = 'Inscmunicipal'
                  DataSource = dtsMain
                  TabOrder = 5
                end
                object dbedtInscricaoEstadual: TDBEdit
                  Left = 163
                  Top = 175
                  Width = 121
                  Height = 24
                  Color = clWhite
                  DataField = 'Inscestadual'
                  DataSource = dtsMain
                  TabOrder = 6
                end
                object dbedtCNPJ: TDBEdit
                  Left = 19
                  Top = 126
                  Width = 121
                  Height = 24
                  Color = clWhite
                  DataField = 'Taxid'
                  DataSource = dtsMain
                  TabOrder = 3
                end
                object dbrgTipo: TDBRadioGroup
                  Left = 163
                  Top = 109
                  Width = 145
                  Height = 38
                  Caption = 'Tipo'
                  Columns = 2
                  DataField = 'Type_'
                  DataSource = dtsMain
                  Items.Strings = (
                    'Jur'#237'dica'
                    'F'#237'sica')
                  TabOrder = 4
                  Values.Strings = (
                    'JURIDICA'
                    'FISICA')
                end
                object dbcbGrupo: TDBLookupComboBox
                  Left = 19
                  Top = 268
                  Width = 66
                  Height = 24
                  DataField = 'GroupId'
                  DataSource = dtsMain
                  DropDownWidth = 272
                  KeyField = 'Self'
                  ListField = 'Id'
                  ListSource = dtsGrupo
                  NullValueKey = 16401
                  TabOrder = 9
                end
                object dbcbGrupoNome: TDBLookupComboBox
                  Left = 87
                  Top = 268
                  Width = 197
                  Height = 24
                  DataField = 'GroupId'
                  DataSource = dtsMain
                  DropDownWidth = 272
                  KeyField = 'Self'
                  ListField = 'Name'
                  ListSource = dtsGrupo
                  NullValueKey = 16401
                  TabOrder = 10
                end
              end
              object TabSheet2: TTabSheet
                Caption = 'Endere'#231'o'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object Label7: TLabel
                  Left = 11
                  Top = 72
                  Width = 34
                  Height = 16
                  Caption = 'Bairro'
                end
                object Label8: TLabel
                  Left = 299
                  Top = 72
                  Width = 22
                  Height = 16
                  Caption = 'CEP'
                end
                object Label9: TLabel
                  Left = 299
                  Top = 28
                  Width = 45
                  Height = 16
                  Caption = 'N'#250'mero'
                end
                object Label10: TLabel
                  Left = 11
                  Top = 28
                  Width = 22
                  Height = 16
                  Caption = 'Rua'
                end
                object Label11: TLabel
                  Left = 187
                  Top = 114
                  Width = 38
                  Height = 16
                  Caption = 'Estado'
                end
                object Label12: TLabel
                  Left = 11
                  Top = 209
                  Width = 50
                  Height = 16
                  Caption = 'Telefone'
                end
                object Label13: TLabel
                  Left = 11
                  Top = 114
                  Width = 39
                  Height = 16
                  Caption = 'Cidade'
                end
                object Label14: TLabel
                  Left = 155
                  Top = 209
                  Width = 20
                  Height = 16
                  Caption = 'Fax'
                end
                object Label18: TLabel
                  Left = 11
                  Top = 162
                  Width = 23
                  Height = 16
                  Caption = 'Pais'
                end
                object dbedtCidade: TDBEdit
                  Left = 11
                  Top = 131
                  Width = 162
                  Height = 24
                  Color = clWhite
                  DataField = 'City'
                  DataSource = dtsMain
                  TabOrder = 4
                end
                object dbedtBairro: TDBEdit
                  Left = 11
                  Top = 89
                  Width = 265
                  Height = 24
                  Color = clWhite
                  DataField = 'Neighborhood'
                  DataSource = dtsMain
                  TabOrder = 2
                end
                object dbedtCep: TDBEdit
                  Left = 299
                  Top = 89
                  Width = 78
                  Height = 24
                  Color = clWhite
                  DataField = 'Zipcode'
                  DataSource = dtsMain
                  TabOrder = 3
                end
                object dbedtNumero: TDBEdit
                  Left = 299
                  Top = 45
                  Width = 46
                  Height = 24
                  Color = clWhite
                  DataField = 'Number'
                  DataSource = dtsMain
                  TabOrder = 1
                end
                object dbedtRua: TDBEdit
                  Left = 11
                  Top = 45
                  Width = 265
                  Height = 24
                  Color = clWhite
                  DataField = 'Street'
                  DataSource = dtsMain
                  TabOrder = 0
                end
                object dbedtEstado: TDBEdit
                  Left = 187
                  Top = 136
                  Width = 89
                  Height = 24
                  Color = clWhite
                  DataField = 'State'
                  DataSource = dtsMain
                  TabOrder = 5
                end
                object dbedtTelefone: TDBEdit
                  Left = 11
                  Top = 226
                  Width = 121
                  Height = 24
                  Color = clWhite
                  DataField = 'Fone'
                  DataSource = dtsMain
                  TabOrder = 8
                end
                object dbedtFax: TDBEdit
                  Left = 155
                  Top = 226
                  Width = 121
                  Height = 24
                  Color = clWhite
                  DataField = 'Fax'
                  DataSource = dtsMain
                  TabOrder = 9
                end
                object dbcbPais: TDBLookupComboBox
                  Left = 11
                  Top = 178
                  Width = 66
                  Height = 24
                  DataField = 'CountryId'
                  DataSource = dtsMain
                  DropDownWidth = 272
                  KeyField = 'Self'
                  ListField = 'Id'
                  ListSource = dtsPais
                  NullValueKey = 16401
                  TabOrder = 6
                end
                object dbcbPaisNome: TDBLookupComboBox
                  Left = 79
                  Top = 178
                  Width = 155
                  Height = 24
                  DataField = 'CountryId'
                  DataSource = dtsMain
                  DropDownWidth = 272
                  KeyField = 'Self'
                  ListField = 'Name'
                  ListSource = dtsPais
                  NullValueKey = 16401
                  TabOrder = 7
                end
              end
            end
          end
        end
      end
    end
  end
  inherited dtsMain: TDataSource
    Left = 624
    Top = 288
  end
  inherited dtsDetail: TDataSource
    Left = 528
    Top = 288
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
        Name = 'Active'
        DataType = ftBoolean
      end
      item
        Name = 'City'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Neighborhood'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Number'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'State'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Street'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Zipcode'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Fax'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Fone'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Inscestadual'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Inscmunicipal'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Taxid'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Type_'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'GroupId'
        DataType = ftVariant
      end
      item
        Name = 'CountryId'
        DataType = ftVariant
      end
      item
        Name = 'PaymentdefinitionList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    AfterInsert = adsMainAfterInsert
    BeforeDelete = adsMainBeforeDelete
    Left = 664
    Top = 288
    DesignClass = 'MyEntitiesV2.TCustomer'
    object adsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsMainId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsMainActive: TBooleanField
      DisplayLabel = 'Ativo'
      FieldName = 'Active'
    end
    object adsMainAkey: TStringField
      DisplayLabel = 'C'#243'd. Broker'
      FieldName = 'Akey'
      Size = 255
    end
    object adsMainSeniorkey: TStringField
      DisplayLabel = 'C'#243'd. ERP'
      FieldName = 'Seniorkey'
      Size = 255
    end
    object adsMainName: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
      Required = True
      Size = 255
    end
    object adsMainTaxid: TStringField
      DisplayLabel = 'CNPJ/CPF'
      FieldName = 'Taxid'
      Required = True
      Size = 255
    end
    object adsMainInscestadual: TStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'Inscestadual'
      Size = 255
    end
    object adsMainInscmunicipal: TStringField
      DisplayLabel = 'Inscri'#231#227'o Municipal'
      FieldName = 'Inscmunicipal'
      Size = 255
    end
    object adsMainType_: TStringField
      FieldName = 'Type_'
      Size = 255
    end
    object adsMainGroupId: TAureliusEntityField
      DisplayLabel = 'Grupo'
      FieldName = 'GroupId'
      Required = True
    end
    object adsMainCity: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'City'
      Required = True
      Size = 255
    end
    object adsMainNeighborhood: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'Neighborhood'
      Size = 255
    end
    object adsMainState: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'State'
      Required = True
      Size = 255
    end
    object adsMainStreet: TStringField
      DisplayLabel = 'Rua'
      FieldName = 'Street'
      Size = 255
    end
    object adsMainNumber: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'Number'
      Size = 255
    end
    object adsMainZipcode: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'Zipcode'
      Size = 255
    end
    object adsMainCountryId: TAureliusEntityField
      FieldName = 'CountryId'
      Required = True
    end
    object adsMainFone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'Fone'
      Required = True
      Size = 255
    end
    object adsMainFax: TStringField
      FieldName = 'Fax'
      Size = 255
    end
    object adsMainPaymentdefinitionList: TDataSetField
      FieldName = 'PaymentdefinitionList'
      ReadOnly = True
    end
  end
  inherited cxGridPopupMenu: TcxGridPopupMenu
    Left = 520
    Top = 104
  end
  inherited adsDetail: TAureliusDataset
    DatasetField = adsMainPaymentdefinitionList
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
        Name = 'Dueinvoiceday'
        DataType = ftInteger
      end
      item
        Name = 'BranchId'
        DataType = ftVariant
      end
      item
        Name = 'BranchId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'BranchId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BranchId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BranchId.Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BranchId.Taxid'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BranchId.Iss'
        DataType = ftFloat
      end
      item
        Name = 'BranchId.OrganizationId'
        DataType = ftVariant
      end
      item
        Name = 'CustomerId'
        DataType = ftVariant
      end
      item
        Name = 'CustomerId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'CustomerId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Active'
        DataType = ftBoolean
      end
      item
        Name = 'CustomerId.City'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Neighborhood'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Number'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.State'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Street'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Zipcode'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Fax'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Fone'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Inscestadual'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Inscmunicipal'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Taxid'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Type_'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.GroupId'
        DataType = ftVariant
      end
      item
        Name = 'CustomerId.CountryId'
        DataType = ftVariant
      end
      item
        Name = 'CustomerId.PaymentdefinitionList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ProductId'
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
      end>
    SubpropsDepth = 1
    Left = 576
    Top = 288
    DesignClass = 'MyEntitiesV2.TPaymentdefinition'
    object adsDetailSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsDetailId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsDetailDueinvoiceday: TIntegerField
      DisplayLabel = 'Dias vencimento da Fatura'
      FieldName = 'Dueinvoiceday'
      Required = True
    end
    object adsDetailBranchId: TAureliusEntityField
      DisplayLabel = 'Unidade de Neg'#243'cio'
      FieldName = 'BranchId'
      Required = True
    end
    object adsDetailCustomerId: TAureliusEntityField
      DisplayLabel = 'Cliente'
      FieldName = 'CustomerId'
    end
    object adsDetailProductId: TAureliusEntityField
      DisplayLabel = 'Produto'
      FieldName = 'ProductId'
      Required = True
    end
    object adsDetailProductIdName: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'ProductId.Name'
      ReadOnly = True
      Size = 255
    end
    object adsDetailBranchIdName: TStringField
      DisplayLabel = 'Unidade de Neg'#243'cio'
      FieldName = 'BranchId.Name'
      ReadOnly = True
      Size = 255
    end
  end
  object adsPais: TAureliusDataset
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
      end>
    Left = 664
    Top = 110
    DesignClass = 'MyEntitiesV2.TCountry'
    object adsPaisSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsPaisId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsPaisAkey: TStringField
      FieldName = 'Akey'
      Size = 255
    end
    object adsPaisName: TStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object dtsPais: TDataSource
    AutoEdit = False
    DataSet = adsPais
    Left = 600
    Top = 110
  end
  object adsGrupo: TAureliusDataset
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
    Left = 664
    Top = 56
    DesignClass = 'MyEntitiesV2.TCustomergroup'
    object AureliusEntityField1: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object LargeintField1: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'Akey'
      Size = 255
    end
    object StringField2: TStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object dtsGrupo: TDataSource
    AutoEdit = False
    DataSet = adsGrupo
    Left = 600
    Top = 56
  end
  object dtsProduto: TDataSource
    AutoEdit = False
    DataSet = adsProduto
    Left = 600
    Top = 166
  end
  object adsProduto: TAureliusDataset
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
      end>
    Left = 664
    Top = 166
    DesignClass = 'MyEntitiesV2.TProduct'
    object AureliusEntityField2: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object LargeintField2: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'Akey'
      Size = 255
    end
    object StringField4: TStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object dtsUnidade: TDataSource
    AutoEdit = False
    DataSet = adsUnidade
    Left = 600
    Top = 230
  end
  object adsUnidade: TAureliusDataset
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
        Name = 'Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Taxid'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Iss'
        DataType = ftFloat
      end
      item
        Name = 'OrganizationId'
        DataType = ftVariant
      end>
    Left = 664
    Top = 230
    DesignClass = 'MyEntitiesV2.TBranch'
    object AureliusEntityField3: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object LargeintField3: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object StringField5: TStringField
      FieldName = 'Akey'
      Size = 255
    end
    object StringField6: TStringField
      FieldName = 'Name'
      Size = 255
    end
  end
end
