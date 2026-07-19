inherited frmWalletBeneficiaryAccount: TfrmWalletBeneficiaryAccount
  Caption = 'Cadastro de Favorecido'
  ClientHeight = 575
  ExplicitHeight = 613
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlButton: TPanel
    Top = 555
    ExplicitTop = 555
  end
  inherited PageControl: TPageControl
    Height = 555
    ExplicitHeight = 555
    inherited tshGrid: TTabSheet
      ExplicitHeight = 521
      inherited pnlButtonGrid: TPanel
        Height = 521
        ExplicitHeight = 524
        inherited btnConsultar: TButton
          Top = 241
          Visible = False
          ExplicitTop = 241
        end
        inherited btnExcluir: TButton
          Top = 65
          ExplicitTop = 65
        end
        inherited cbxAltRapida: TCheckBox
          Top = 216
          ExplicitTop = 216
        end
        object btnContexto: TButton
          Left = 8
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
        Height = 521
        ExplicitHeight = 521
        inherited SplitterGridDetail: TSplitter
          Top = 405
          ExplicitTop = 407
        end
        inherited cxGrid: TcxGrid
          Height = 401
          ExplicitHeight = 401
          inherited cxGridDBTableView: TcxGridDBTableView
            FindPanel.DisplayMode = fpdmAlways
            FindPanel.InfoText = 'Buscar...'
            FindPanel.ShowClearButton = False
            FindPanel.ShowCloseButton = False
            FindPanel.ShowFindButton = False
            DataController.DataModeController.GridMode = False
            object cxGridDBTableViewId: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
              Width = 54
            end
            object cxGridDBTableViewName: TcxGridDBColumn
              DataBinding.FieldName = 'Name'
              Width = 498
            end
            object cxGridDBTableViewTaxid: TcxGridDBColumn
              DataBinding.FieldName = 'Taxid'
              Width = 184
            end
          end
        end
        inherited cxGridDetailList: TcxGrid
          Top = 409
          ExplicitTop = 412
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 524
      inherited pnlEditButon: TPanel
        Height = 521
        ExplicitHeight = 524
      end
      inherited pnlFundo: TPanel
        Height = 521
        ExplicitHeight = 524
        inherited pnlDetails: TPanel
          Height = 517
          ExplicitHeight = 520
          inherited SplitterDetail: TSplitter
            Top = 229
            ExplicitTop = 229
          end
          inherited PanelDetail: TPanel
            Top = 233
            Height = 284
            ExplicitTop = 233
            ExplicitHeight = 287
            inherited pgDetails: TPageControl
              Height = 284
              ExplicitHeight = 287
              inherited tbsDetail1: TTabSheet
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 256
                inherited PageControlDetail: TPageControl
                  Height = 250
                  ExplicitHeight = 256
                  inherited tshDetailGrid: TTabSheet
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 225
                    inherited pnlEditButonDetail: TPanel
                      Height = 225
                      ExplicitHeight = 225
                      inherited btnDetailConsultar: TButton
                        Visible = False
                      end
                    end
                    inherited cxGridDetail: TcxGrid
                      Height = 225
                      ExplicitHeight = 225
                      inherited cxGridDBTableViewDetail: TcxGridDBTableView
                        object cxGridDBTableViewDetailId: TcxGridDBColumn
                          DataBinding.FieldName = 'Id'
                          Width = 40
                        end
                        object cxGridDBTableViewDetailBankIdName: TcxGridDBColumn
                          DataBinding.FieldName = 'BankId.Name'
                          Width = 200
                        end
                        object cxGridDBTableViewDetailAgency: TcxGridDBColumn
                          DataBinding.FieldName = 'Agency'
                          Width = 69
                        end
                        object cxGridDBTableViewDetailNumber: TcxGridDBColumn
                          DataBinding.FieldName = 'Number'
                          Width = 112
                        end
                      end
                    end
                  end
                  inherited tshDetailEdit: TTabSheet
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 225
                    object Label5: TLabel [0]
                      Left = 15
                      Top = 62
                      Width = 34
                      Height = 16
                      Caption = 'Banco'
                    end
                    object Label6: TLabel [1]
                      Left = 15
                      Top = 113
                      Width = 45
                      Height = 16
                      Caption = 'Ag'#234'ncia'
                    end
                    object Label8: TLabel [2]
                      Left = 15
                      Top = 158
                      Width = 45
                      Height = 16
                      Caption = 'N'#250'mero'
                    end
                    object Label9: TLabel [3]
                      Left = 15
                      Top = 18
                      Width = 39
                      Height = 16
                      Caption = 'C'#243'digo'
                    end
                    inherited Panel8: TPanel
                      Height = 219
                      ExplicitHeight = 225
                    end
                    object dbcBank: TDBLookupComboBox
                      Left = 15
                      Top = 78
                      Width = 66
                      Height = 24
                      DataField = 'BankId'
                      DataSource = dtsDetail
                      DropDownWidth = 272
                      KeyField = 'Self'
                      ListField = 'Code'
                      ListSource = dsBank
                      NullValueKey = 16401
                      TabOrder = 1
                    end
                    object dbcbNmBank: TDBLookupComboBox
                      Left = 83
                      Top = 78
                      Width = 274
                      Height = 24
                      DataField = 'BankId'
                      DataSource = dtsDetail
                      DropDownWidth = 272
                      KeyField = 'Self'
                      ListField = 'Name'
                      ListSource = dsBank
                      NullValueKey = 16401
                      TabOrder = 2
                    end
                    object DBEdit1: TDBEdit
                      Left = 15
                      Top = 35
                      Width = 121
                      Height = 24
                      Color = 14935011
                      DataField = 'Id'
                      DataSource = dtsDetail
                      ReadOnly = True
                      TabOrder = 3
                    end
                    object dbedtAgencia: TDBEdit
                      Left = 15
                      Top = 131
                      Width = 66
                      Height = 24
                      DataField = 'Agency'
                      DataSource = dtsDetail
                      TabOrder = 4
                    end
                    object dbedtNumero: TDBEdit
                      Left = 15
                      Top = 174
                      Width = 121
                      Height = 24
                      DataField = 'Number'
                      DataSource = dtsDetail
                      TabOrder = 5
                    end
                  end
                end
              end
            end
          end
          inherited pnlMaster: TPanel
            Height = 229
            ExplicitLeft = 168
            ExplicitTop = 6
            ExplicitHeight = 229
            object Label1: TLabel
              Left = 19
              Top = 16
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
            end
            object Label3: TLabel
              Left = 19
              Top = 64
              Width = 33
              Height = 16
              Caption = 'Nome'
            end
            object Label7: TLabel
              Left = 19
              Top = 112
              Width = 28
              Height = 16
              Caption = 'CNPJ'
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
              Top = 81
              Width = 342
              Height = 24
              Color = clWhite
              DataField = 'Name'
              DataSource = dtsMain
              TabOrder = 1
            end
            object dbedtCnpj: TDBEdit
              Left = 19
              Top = 129
              Width = 121
              Height = 24
              Color = clWhite
              DataField = 'Taxid'
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
        Name = 'Taxid'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'AccountList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'BenefPaymentrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    BeforeInsert = adsMainBeforeInsert
    BeforeEdit = adsMainBeforeEdit
    BeforeDelete = adsMainBeforeDelete
    DesignClass = 'MyEntitiesV2.TBeneficiary'
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
      Size = 255
    end
    object adsMainName: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
      Required = True
      Size = 255
    end
    object adsMainTaxid: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'Taxid'
      Required = True
      Size = 255
    end
    object adsMainAccountList: TDataSetField
      FieldName = 'AccountList'
      ReadOnly = True
    end
  end
  inherited adsDetail: TAureliusDataset
    DatasetField = adsMainAccountList
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
        Name = 'Agency'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Number'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BankId'
        DataType = ftVariant
      end
      item
        Name = 'BankId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'BankId.Code'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BankId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BankId.AccountList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'BeneficiaryId'
        DataType = ftVariant
      end
      item
        Name = 'BeneficiaryId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'BeneficiaryId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BeneficiaryId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BeneficiaryId.Taxid'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BeneficiaryId.AccountList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'BeneficiaryId.BenefPaymentrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    BeforeInsert = adsDetailBeforeInsert
    BeforeEdit = adsDetailBeforeEdit
    SubpropsDepth = 1
    DesignClass = 'MyEntitiesV2.TAccount'
    object adsDetailSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsDetailId: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsDetailAgency: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'Agency'
      Required = True
      Size = 255
    end
    object adsDetailNumber: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'Number'
      Required = True
      Size = 255
    end
    object adsDetailBankId: TAureliusEntityField
      DisplayLabel = 'Banco'
      FieldName = 'BankId'
      Required = True
    end
    object adsDetailBeneficiaryId: TAureliusEntityField
      FieldName = 'BeneficiaryId'
    end
    object adsDetailBankIdId: TLargeintField
      FieldName = 'BankId.Id'
      ReadOnly = True
    end
    object adsDetailBankIdName: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BankId.Name'
      ReadOnly = True
      Size = 255
    end
  end
  object adsBank: TAureliusDataset
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
        Name = 'Code'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end>
    Left = 328
    Top = 392
    DesignClass = 'MyEntitiesV2.TBank'
    object adsBankSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsBankId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsBankCode: TStringField
      FieldName = 'Code'
      Size = 255
    end
    object adsBankName: TStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object dsBank: TDataSource
    AutoEdit = False
    DataSet = adsBank
    Left = 304
    Top = 392
  end
end
