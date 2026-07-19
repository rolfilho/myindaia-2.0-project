inherited frmWalletBank: TfrmWalletBank
  Caption = 'Cadastro de Banco'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited PageControl: TPageControl
    inherited tshGrid: TTabSheet
      inherited pnlButtonGrid: TPanel
        inherited btnConsultar: TButton
          Top = 169
          Visible = False
          ExplicitTop = 169
        end
        inherited btnExcluir: TButton
          Top = 65
          ExplicitTop = 65
        end
        inherited cbxAltRapida: TCheckBox
          Top = 232
          ExplicitTop = 232
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
            object cxGridDBTableViewCode: TcxGridDBColumn
              DataBinding.FieldName = 'Code'
              Width = 89
            end
            object cxGridDBTableViewName: TcxGridDBColumn
              DataBinding.FieldName = 'Name'
              Width = 574
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
        ExplicitLeft = 72
        ExplicitTop = -2
        object Label3: TLabel [0]
          Left = 19
          Top = 112
          Width = 55
          Height = 16
          Caption = 'Descri'#231#227'o'
        end
        object Label2: TLabel [1]
          Left = 19
          Top = 64
          Width = 77
          Height = 16
          Caption = 'C'#243'digo Banco'
        end
        object Label1: TLabel [2]
          Left = 19
          Top = 16
          Width = 39
          Height = 16
          Caption = 'C'#243'digo'
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
          Top = 129
          Width = 121
          Height = 24
          Color = clWhite
          DataField = 'Name'
          DataSource = dtsMain
          TabOrder = 2
        end
        object dbedtCodBroker: TDBEdit
          Left = 19
          Top = 81
          Width = 121
          Height = 24
          Color = clWhite
          DataField = 'Code'
          DataSource = dtsMain
          TabOrder = 3
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
        Name = 'Code'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end>
    DesignClass = 'MyEntitiesV2.TBank'
    object adsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsMainId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsMainCode: TStringField
      DisplayLabel = 'C'#243'digo Banco'
      FieldName = 'Code'
      Required = True
      Size = 255
    end
    object adsMainName: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
      Required = True
      Size = 255
    end
  end
end
