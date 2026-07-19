inherited formCdClientes: TformCdClientes
  Caption = 'Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited tshGrid: TTabSheet
      inherited pnlButtonGrid: TPanel
        object Bevel1: TBevel [0]
          Left = 7
          Top = 152
          Width = 72
          Height = 2
        end
        object btnNotasFiscais: TButton
          Left = 6
          Top = 160
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Notas Fiscais'
          TabOrder = 5
          OnClick = btnNotasFiscaisClick
        end
      end
      inherited pnlGrid: TPanel
        inherited cxGrid: TcxGrid
          inherited cxGridDBTableView: TcxGridDBTableView
            object cxGridDBTableViewSelf: TcxGridDBColumn
              DataBinding.FieldName = 'Self'
              Visible = False
            end
            object cxGridDBTableViewId: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
            end
            object cxGridDBTableViewNome: TcxGridDBColumn
              DataBinding.FieldName = 'Nome'
            end
            object cxGridDBTableViewEmail: TcxGridDBColumn
              DataBinding.FieldName = 'Email'
            end
            object cxGridDBTableViewNotas: TcxGridDBColumn
              DataBinding.FieldName = 'Notas'
              Visible = False
            end
          end
        end
      end
    end
    inherited tshEdit: TTabSheet
      object Label1: TLabel [0]
        Left = 3
        Top = 3
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object Label2: TLabel [1]
        Left = 3
        Top = 51
        Width = 28
        Height = 13
        Caption = 'Email:'
      end
      inherited pnlEditButon: TPanel
        TabOrder = 2
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 22
        Width = 294
        Height = 21
        DataField = 'Nome'
        DataSource = dtsMain
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 70
        Width = 294
        Height = 21
        DataField = 'Email'
        DataSource = dtsMain
        TabOrder = 1
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
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Email'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Notas'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    DesignClass = 'DemoEntities.TCliente'
    object adsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object adsMainId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsMainNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 100
    end
    object adsMainEmail: TStringField
      FieldName = 'Email'
      Required = True
      Size = 50
    end
    object adsMainNotas: TDataSetField
      FieldName = 'Notas'
      ReadOnly = True
      Visible = False
    end
  end
end
