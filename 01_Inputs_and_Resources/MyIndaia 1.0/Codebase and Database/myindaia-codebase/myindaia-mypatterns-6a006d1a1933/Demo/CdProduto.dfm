inherited formMyCdProduto: TformMyCdProduto
  Caption = 'Produtos'
  ExplicitTop = -108
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited tshGrid: TTabSheet
      inherited pnlButtonGrid: TPanel
        ExplicitLeft = 747
        ExplicitTop = -2
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
          end
        end
      end
    end
    inherited tshEdit: TTabSheet
      object Label1: TLabel [0]
        Left = 3
        Top = 10
        Width = 31
        Height = 13
        Caption = 'Nome:'
        FocusControl = DBEdit1
      end
      inherited pnlEditButon: TPanel
        TabOrder = 1
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 26
        Width = 297
        Height = 21
        DataField = 'Nome'
        DataSource = dtsMain
        TabOrder = 0
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
        Size = 255
      end>
    DesignClass = 'DemoEntities.TProduto'
    object adsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object adsMainId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsMainNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 255
    end
  end
end
