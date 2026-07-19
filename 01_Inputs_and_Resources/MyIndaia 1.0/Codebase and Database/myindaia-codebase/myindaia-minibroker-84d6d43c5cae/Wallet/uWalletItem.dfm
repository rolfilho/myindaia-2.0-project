inherited FrmWalletItem: TFrmWalletItem
  Caption = 'Cadastro de Item'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited PageControl: TPageControl
    inherited tshGrid: TTabSheet
      inherited pnlButtonGrid: TPanel
        inherited btnConsultar: TButton
          Top = 145
          Visible = False
          ExplicitTop = 145
        end
        inherited btnExcluir: TButton
          Top = 65
          ExplicitTop = 65
        end
        inherited cbxAltRapida: TCheckBox
          Top = 176
          ExplicitTop = 176
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
              Width = 46
            end
            object cxGridDBTableViewAkey: TcxGridDBColumn
              DataBinding.FieldName = 'Akey'
              Width = 87
            end
            object cxGridDBTableViewSeniorkey: TcxGridDBColumn
              DataBinding.FieldName = 'Seniorkey'
              Width = 79
            end
            object cxGridDBTableViewType_: TcxGridDBColumn
              DataBinding.FieldName = 'Type_'
              Width = 47
            end
            object cxGridDBTableViewName: TcxGridDBColumn
              DataBinding.FieldName = 'Name'
              Width = 400
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
        ExplicitLeft = 136
        ExplicitTop = 3
        object Label1: TLabel [0]
          Left = 19
          Top = 16
          Width = 39
          Height = 16
          Caption = 'C'#243'digo'
        end
        object Label2: TLabel [1]
          Left = 19
          Top = 88
          Width = 55
          Height = 16
          Caption = 'Descri'#231#227'o'
        end
        object Label5: TLabel [2]
          Left = 19
          Top = 180
          Width = 65
          Height = 16
          Caption = 'C'#243'digo ERP'
        end
        object Label4: TLabel [3]
          Left = 19
          Top = 133
          Width = 80
          Height = 16
          Caption = 'C'#243'digo Broker'
        end
        object dbedtSeniorKey: TDBEdit
          Left = 19
          Top = 197
          Width = 121
          Height = 24
          Color = clWhite
          DataField = 'Seniorkey'
          DataSource = dtsMain
          TabOrder = 1
        end
        object dbedtAkey: TDBEdit
          Left = 19
          Top = 150
          Width = 121
          Height = 24
          Color = clWhite
          DataField = 'Akey'
          DataSource = dtsMain
          TabOrder = 2
        end
        object dbedtDescricao: TDBEdit
          Left = 19
          Top = 105
          Width = 342
          Height = 24
          Color = clWhite
          DataField = 'Name'
          DataSource = dtsMain
          TabOrder = 3
        end
        object DBCheckBox1: TDBCheckBox
          Left = 291
          Top = 82
          Width = 94
          Height = 16
          Caption = 'Tribut'#225'vel'
          DataField = 'Taxable'
          DataSource = dtsMain
          TabOrder = 4
        end
        object dbcbStatus: TDBCheckBox
          Left = 19
          Top = 62
          Width = 49
          Height = 16
          Caption = 'Ativo'
          DataField = 'Active'
          DataSource = dtsMain
          TabOrder = 5
        end
        object dbrgProduto: TDBRadioGroup
          Left = 19
          Top = 232
          Width = 94
          Height = 73
          Caption = 'Produto'
          DataField = 'Productitem'
          DataSource = dtsMain
          Items.Strings = (
            'IMPO_EXPO'
            'IMPO'
            'EXPO')
          TabOrder = 6
          Values.Strings = (
            '0'
            '1'
            '2')
        end
        object dbrgTipo: TDBRadioGroup
          Left = 19
          Top = 320
          Width = 94
          Height = 57
          Caption = 'Tipo '
          DataField = 'Type_'
          DataSource = dtsMain
          Items.Strings = (
            'Despesa'
            'Receita')
          TabOrder = 7
          Values.Strings = (
            'D'
            'R')
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
          TabOrder = 8
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
        Name = 'Active'
        DataType = ftBoolean
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Productitem'
        DataType = ftInteger
      end
      item
        Name = 'Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Taxable'
        DataType = ftBoolean
      end
      item
        Name = 'Type_'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Contafinanceiraimp'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Contafinanceiraexp'
        DataType = ftString
        Size = 255
      end>
    AfterInsert = adsMainAfterInsert
    DesignClass = 'MyEntitiesV2.TItem'
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
    object adsMainActive: TBooleanField
      DisplayLabel = 'Status'
      FieldName = 'Active'
    end
    object adsMainName: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
      Required = True
      Size = 255
    end
    object adsMainAkey: TStringField
      DisplayLabel = 'C'#243'digo Broker'
      FieldName = 'Akey'
      Size = 255
    end
    object adsMainSeniorkey: TStringField
      DisplayLabel = 'C'#243'digo ERP'
      FieldName = 'Seniorkey'
      Size = 255
    end
    object adsMainTaxable: TBooleanField
      DisplayLabel = 'Tribut'#225'vel'
      FieldName = 'Taxable'
    end
    object adsMainType_: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Type_'
      Size = 1
    end
    object adsMainProductitem: TIntegerField
      FieldName = 'Productitem'
    end
  end
  inherited cxGridPopupMenu: TcxGridPopupMenu
    Left = 760
    Top = 344
  end
end
