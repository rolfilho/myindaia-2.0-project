inherited FrmWalletCountry: TFrmWalletCountry
  Caption = 'Cadastro de Pa'#237's'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited PageControl: TPageControl
    inherited tshGrid: TTabSheet
      inherited pnlButtonGrid: TPanel
        inherited btnConsultar: TButton
          Top = 161
          Visible = False
          ExplicitTop = 161
        end
        inherited btnExcluir: TButton
          Top = 65
          ExplicitTop = 65
        end
        inherited cbxAltRapida: TCheckBox
          Top = 200
          ExplicitTop = 200
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
              Width = 47
            end
            object cxGridDBTableViewName: TcxGridDBColumn
              DataBinding.FieldName = 'Name'
              Width = 668
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
        ExplicitLeft = 120
        ExplicitTop = 16
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
          Top = 110
          Width = 80
          Height = 16
          Caption = 'C'#243'digo Broker'
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
        object dbedtAkey: TDBEdit
          Left = 19
          Top = 127
          Width = 121
          Height = 24
          Color = clWhite
          DataField = 'Akey'
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
        Name = 'Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end>
    DesignClass = 'MyEntitiesV2.TCountry'
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
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Name'
      Required = True
      Size = 255
    end
  end
end
