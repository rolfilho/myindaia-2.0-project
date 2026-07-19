inherited frmWalletBranch: TfrmWalletBranch
  Caption = 'Cadastro de Empresa'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited PageControl: TPageControl
    inherited tshGrid: TTabSheet
      inherited pnlButtonGrid: TPanel
        inherited btnConsultar: TButton
          Top = 153
          Visible = False
          ExplicitTop = 153
        end
        inherited btnExcluir: TButton
          Top = 65
          ExplicitTop = 65
        end
        inherited cbxAltRapida: TCheckBox
          Left = 12
          Top = 184
          ExplicitLeft = 12
          ExplicitTop = 184
        end
      end
      inherited pnlGrid: TPanel
        inherited cxGrid: TcxGrid
          BevelInner = bvNone
          BevelOuter = bvNone
          inherited cxGridDBTableView: TcxGridDBTableView
            FindPanel.DisplayMode = fpdmAlways
            FindPanel.InfoText = 'Buscar...'
            FindPanel.ShowClearButton = False
            FindPanel.ShowCloseButton = False
            FindPanel.ShowFindButton = False
            DataController.DataModeController.GridMode = False
            object cxGridDBTableViewId: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
              Width = 49
            end
            object cxGridDBTableViewName: TcxGridDBColumn
              DataBinding.FieldName = 'Name'
              Width = 484
            end
            object cxGridDBTableViewTaxid: TcxGridDBColumn
              DataBinding.FieldName = 'Taxid'
              Width = 169
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
        ExplicitLeft = 105
        ExplicitTop = 34
        object Label1: TLabel [0]
          Left = 19
          Top = 16
          Width = 39
          Height = 16
          Caption = 'C'#243'digo'
        end
        object Label2: TLabel [1]
          Left = 19
          Top = 61
          Width = 55
          Height = 16
          Caption = 'Descri'#231#227'o'
        end
        object Label3: TLabel [2]
          Left = 19
          Top = 106
          Width = 28
          Height = 16
          Caption = 'CNPJ'
        end
        object Label4: TLabel [3]
          Left = 19
          Top = 154
          Width = 80
          Height = 16
          Caption = 'C'#243'digo Broker'
        end
        object Label5: TLabel [4]
          Left = 19
          Top = 203
          Width = 65
          Height = 16
          Caption = 'C'#243'digo ERP'
        end
        object Label6: TLabel [5]
          Left = 19
          Top = 251
          Width = 20
          Height = 16
          Caption = 'ISS'
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
          TabOrder = 1
        end
        object dbedtDescricao: TDBEdit
          Left = 19
          Top = 78
          Width = 342
          Height = 24
          Color = clWhite
          DataField = 'Name'
          DataSource = dtsMain
          TabOrder = 2
        end
        object dbedtCnpj: TDBEdit
          Left = 19
          Top = 123
          Width = 121
          Height = 24
          Color = clWhite
          DataField = 'Taxid'
          DataSource = dtsMain
          TabOrder = 3
        end
        object dbedtAkey: TDBEdit
          Left = 19
          Top = 171
          Width = 121
          Height = 24
          Color = clWhite
          DataField = 'Akey'
          DataSource = dtsMain
          TabOrder = 4
        end
        object dbedtSeniorKey: TDBEdit
          Left = 19
          Top = 220
          Width = 121
          Height = 24
          Color = clWhite
          DataField = 'Seniorkey'
          DataSource = dtsMain
          TabOrder = 5
        end
        object dbedtIss: TDBEdit
          Left = 19
          Top = 268
          Width = 121
          Height = 24
          Color = clWhite
          DataField = 'Iss'
          DataSource = dtsMain
          TabOrder = 6
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
    BeforePost = adsMainBeforePost
    DesignClass = 'MyEntitiesV2.TBranch'
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
    object adsMainSeniorkey: TStringField
      DisplayLabel = 'C'#243'digo Senior'
      FieldName = 'Seniorkey'
      Size = 255
    end
    object adsMainTaxid: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'Taxid'
      Required = True
      Size = 255
    end
    object adsMainIss: TFloatField
      DisplayLabel = 'ISS'
      FieldName = 'Iss'
    end
    object adsMainOrganizationId: TAureliusEntityField
      FieldName = 'OrganizationId'
    end
  end
  inherited cxGridPopupMenu: TcxGridPopupMenu
    Left = 680
    Top = 408
  end
  object adsOrganization: TAureliusDataset
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
        Name = 'BranchList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    Left = 512
    Top = 112
    DesignClass = 'MyEntitiesV2.TOrganization'
    object adsOrganizationSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsOrganizationId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsOrganizationAkey: TStringField
      FieldName = 'Akey'
      Size = 255
    end
    object adsOrganizationName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object adsOrganizationSeniorkey: TStringField
      FieldName = 'Seniorkey'
      Size = 255
    end
    object adsOrganizationTaxid: TStringField
      FieldName = 'Taxid'
      Size = 255
    end
  end
  object dsOrganization: TDataSource
    AutoEdit = False
    DataSet = adsOrganization
    Left = 488
    Top = 112
  end
end
