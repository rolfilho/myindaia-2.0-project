inherited frmWalletAuthUser: TfrmWalletAuthUser
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 507
  ClientWidth = 875
  ExplicitWidth = 891
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlButton: TPanel
    Top = 487
    Width = 875
    ExplicitTop = 487
    ExplicitWidth = 875
  end
  inherited PageControl: TPageControl
    Width = 875
    Height = 487
    ActivePage = tshGrid
    ExplicitWidth = 875
    ExplicitHeight = 487
    inherited tshGrid: TTabSheet
      ExplicitWidth = 867
      ExplicitHeight = 453
      inherited pnlButtonGrid: TPanel
        Left = 764
        Height = 453
        ExplicitLeft = 764
        ExplicitHeight = 453
        inherited btnConsultar: TButton
          Visible = False
        end
      end
      inherited pnlGrid: TPanel
        Width = 764
        Height = 453
        ExplicitWidth = 764
        ExplicitHeight = 453
        inherited cxGrid: TcxGrid
          Width = 764
          Height = 449
          BevelInner = bvNone
          BevelOuter = bvNone
          ExplicitWidth = 764
          ExplicitHeight = 449
          inherited cxGridDBTableView: TcxGridDBTableView
            FilterBox.CustomizeDialog = True
            FindPanel.DisplayMode = fpdmAlways
            FindPanel.FocusViewOnApplyFilter = True
            FindPanel.InfoText = 'Buscar...'
            FindPanel.ShowClearButton = False
            FindPanel.ShowCloseButton = False
            FindPanel.ShowFindButton = False
            DataController.DataModeController.GridMode = False
            Filtering.ColumnAddValueItems = True
            Filtering.ColumnFilteredItemsList = True
            Filtering.ColumnMRUItemsList = True
            object cxGridDBTableViewId: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
              SortIndex = 0
              SortOrder = soAscending
            end
            object cxGridDBTableViewName: TcxGridDBColumn
              DataBinding.FieldName = 'Name'
              Width = 277
            end
            object cxGridDBTableViewUsername: TcxGridDBColumn
              DataBinding.FieldName = 'Username'
              Width = 296
            end
            object cxGridDBTableViewStatus: TcxGridDBColumn
              DataBinding.FieldName = 'calcAtivo'
              Width = 51
            end
          end
        end
        inherited pnlStyle1: TPanel
          Width = 764
          ExplicitWidth = 764
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitWidth = 867
      ExplicitHeight = 453
      inherited pnlEditButon: TPanel
        Left = 764
        Height = 453
        ExplicitLeft = 764
        ExplicitHeight = 453
      end
      inherited pnlFundo: TPanel
        Width = 764
        Height = 453
        ExplicitWidth = 764
        ExplicitHeight = 453
        object Label1: TLabel [0]
          Left = 19
          Top = 101
          Width = 33
          Height = 16
          Caption = 'Nome'
        end
        object Label2: TLabel [1]
          Left = 19
          Top = 149
          Width = 43
          Height = 16
          Caption = 'Usu'#225'rio'
        end
        object Label5: TLabel [2]
          Left = 19
          Top = 16
          Width = 39
          Height = 16
          Caption = 'C'#243'digo'
        end
        inherited pnlStyle2: TPanel
          Width = 764
          ExplicitWidth = 764
        end
        object chbResetarSenha: TCheckBox
          Left = 91
          Top = 69
          Width = 166
          Height = 17
          Caption = 'Resetar Senha (123)'
          TabOrder = 1
        end
        object dbcbStatus: TDBCheckBox
          Left = 24
          Top = 69
          Width = 52
          Height = 17
          Caption = 'Ativo'
          DataField = 'Status'
          DataSource = dtsMain
          TabOrder = 2
        end
        object DBCheckBox1: TDBCheckBox
          Left = 24
          Top = 285
          Width = 185
          Height = 17
          Hint = 
            'Usu'#225'rio faz desbloqueio de pagamentos e transferencias entre pro' +
            'cessos.'
          Caption = 'Libera'#231#245'es Financeiras'
          DataField = 'FinancialAuth'
          DataSource = dtsMain
          TabOrder = 3
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
          TabOrder = 4
        end
        object dbedtNome: TDBEdit
          Left = 19
          Top = 117
          Width = 210
          Height = 24
          DataField = 'Name'
          DataSource = dtsMain
          TabOrder = 5
        end
        object dbedtUsuario: TDBEdit
          Left = 19
          Top = 168
          Width = 210
          Height = 24
          DataField = 'Username'
          DataSource = dtsMain
          TabOrder = 6
        end
        object dbrgGenero: TDBRadioGroup
          Left = 19
          Top = 204
          Width = 210
          Height = 58
          Caption = 'G'#234'nero'
          DataField = 'Gender'
          DataSource = dtsMain
          Items.Strings = (
            'Masculino'
            'Feminino')
          TabOrder = 7
          Values.Strings = (
            'MALE'
            'FEMALE')
        end
      end
    end
  end
  inherited dtsMain: TDataSource
    Left = 544
    Top = 280
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
        Name = 'Gender'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Password'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Status'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Username'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'FinancialAuth'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'BranchId'
        DataType = ftVariant
      end>
    AfterInsert = adsMainAfterInsert
    BeforePost = adsMainBeforePost
    OnCalcFields = adsMainCalcFields
    Left = 584
    Top = 280
    DesignClass = 'MyEntitiesV2.TAuthuser'
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
    object adsMainGender: TStringField
      DisplayLabel = 'G'#234'nero'
      FieldName = 'Gender'
      Size = 255
    end
    object adsMainName: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
      Required = True
      Size = 255
    end
    object adsMainPassword: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'Password'
      Size = 255
    end
    object adsMainStatus: TBooleanField
      DisplayLabel = 'Ativo'
      FieldName = 'Status'
      Required = True
    end
    object adsMainUsername: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Username'
      Required = True
      Size = 255
    end
    object adsMainBranchId: TAureliusEntityField
      FieldName = 'BranchId'
    end
    object adsMainFinancialAuth: TBooleanField
      FieldName = 'FinancialAuth'
      Required = True
    end
    object adsMaincalcAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkCalculated
      FieldName = 'calcAtivo'
      Size = 3
      Calculated = True
    end
  end
  inherited cxGridPopupMenu: TcxGridPopupMenu
    Left = 624
    Top = 112
  end
  object adsBranch: TAureliusDataset
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
    Left = 368
    Top = 152
    DesignClass = 'MyEntitiesV2.TBranch'
    object adsBranchSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsBranchId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsBranchAkey: TStringField
      FieldName = 'Akey'
      Size = 255
    end
    object adsBranchName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object adsBranchSeniorkey: TStringField
      FieldName = 'Seniorkey'
      Size = 255
    end
    object adsBranchTaxid: TStringField
      FieldName = 'Taxid'
      Size = 255
    end
    object adsBranchIss: TFloatField
      FieldName = 'Iss'
    end
  end
  object dsBranch: TDataSource
    AutoEdit = False
    DataSet = adsBranch
    Left = 312
    Top = 152
  end
end
