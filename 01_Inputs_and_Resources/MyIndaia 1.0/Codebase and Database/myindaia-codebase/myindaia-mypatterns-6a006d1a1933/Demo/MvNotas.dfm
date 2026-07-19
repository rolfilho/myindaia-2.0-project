inherited formMyMvNotasFisais: TformMyMvNotasFisais
  Caption = 'Nostas Fiscais'
  ExplicitWidth = 857
  ExplicitHeight = 547
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = tshEdit
    inherited tshGrid: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
            object cxGridDBTableViewCliente: TcxGridDBColumn
              DataBinding.FieldName = 'Cliente'
            end
            object cxGridDBTableViewClienteNome: TcxGridDBColumn
              DataBinding.FieldName = 'ClienteNome'
            end
            object cxGridDBTableViewItens: TcxGridDBColumn
              DataBinding.FieldName = 'Itens'
              Visible = False
            end
            object cxGridDBTableViewObs: TcxGridDBColumn
              DataBinding.FieldName = 'Obs'
            end
          end
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 833
      ExplicitHeight = 460
      inherited Panel5: TPanel
        inherited PanelDetail: TPanel
          inherited PageControlDetail: TPageControl
            ActivePage = tshDetailEdit
            inherited tshDetailGrid: TTabSheet
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              inherited pnlEditButonDetail: TPanel
                inherited cbxAltRapidaDetail: TCheckBox
                  Visible = True
                end
              end
              inherited cxGridDetail: TcxGrid
                inherited cxGridDBTableViewDetail: TcxGridDBTableView
                  object cxGridDBTableViewDetailSelf: TcxGridDBColumn
                    DataBinding.FieldName = 'Self'
                    Visible = False
                  end
                  object cxGridDBTableViewDetailId: TcxGridDBColumn
                    DataBinding.FieldName = 'Id'
                  end
                  object cxGridDBTableViewDetailProduto: TcxGridDBColumn
                    DataBinding.FieldName = 'Produto'
                    Visible = False
                  end
                  object cxGridDBTableViewDetailProdutoDescicao: TcxGridDBColumn
                    DataBinding.FieldName = 'ProdutoDescicao'
                  end
                  object cxGridDBTableViewDetailQuantidade: TcxGridDBColumn
                    DataBinding.FieldName = 'Quantidade'
                  end
                  object cxGridDBTableViewDetailValor: TcxGridDBColumn
                    DataBinding.FieldName = 'Valor'
                  end
                end
              end
            end
            inherited tshDetailEdit: TTabSheet
              object Label1: TLabel [0]
                Left = 3
                Top = 3
                Width = 38
                Height = 13
                Caption = 'Produto'
              end
              object Label2: TLabel [1]
                Left = 3
                Top = 43
                Width = 56
                Height = 13
                Caption = 'Quantidade'
                FocusControl = DBEdit3
              end
              object Label3: TLabel [2]
                Left = 3
                Top = 83
                Width = 24
                Height = 13
                Caption = 'Valor'
                FocusControl = DBEdit5
              end
              object DBEdit3: TDBEdit
                Left = 3
                Top = 59
                Width = 134
                Height = 21
                DataField = 'Quantidade'
                DataSource = dtsDetail
                TabOrder = 1
              end
              object DBEdit5: TDBEdit
                Left = 3
                Top = 99
                Width = 134
                Height = 21
                DataField = 'Valor'
                DataSource = dtsDetail
                TabOrder = 2
              end
              object DBLookupComboBox1: TDBLookupComboBox
                Left = 3
                Top = 16
                Width = 145
                Height = 21
                DataField = 'Produto'
                DataSource = dtsDetail
                KeyField = 'Self'
                ListField = 'Nome'
                ListSource = dssProduto
                TabOrder = 3
              end
            end
          end
        end
        inherited pnlMaster: TPanel
          object Label4: TLabel
            Left = 4
            Top = 56
            Width = 19
            Height = 13
            Caption = 'Obs'
            FocusControl = DBEdit1
          end
          object Label5: TLabel
            Left = 4
            Top = 8
            Width = 67
            Height = 13
            Caption = 'Nome Cliente:'
            FocusControl = DBEdit4
          end
          object DBEdit1: TDBEdit
            Left = 4
            Top = 72
            Width = 397
            Height = 21
            DataField = 'Obs'
            DataSource = dtsMain
            TabOrder = 1
          end
          object DBEdit4: TDBEdit
            Left = 4
            Top = 24
            Width = 325
            Height = 21
            DataField = 'ClienteNome'
            DataSource = dtsMain
            ReadOnly = True
            TabOrder = 0
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
        DataType = ftInteger
      end
      item
        Name = 'Obs'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Cliente'
        DataType = ftVariant
      end
      item
        Name = 'Itens'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    OnCalcFields = adsMainCalcFields
    DesignClass = 'DemoEntities.TNotaFiscal'
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
    object adsMainCliente: TAureliusEntityField
      FieldName = 'Cliente'
    end
    object adsMainClienteNome: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldKind = fkCalculated
      FieldName = 'ClienteNome'
      Size = 30
      Calculated = True
    end
    object adsMainItens: TDataSetField
      FieldName = 'Itens'
      ReadOnly = True
      Visible = False
    end
    object adsMainObs: TStringField
      DisplayWidth = 30
      FieldName = 'Obs'
      Required = True
      Size = 255
    end
  end
  inherited adsDetail: TAureliusDataset
    DatasetField = adsMainItens
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
        Name = 'Produto'
        DataType = ftVariant
      end
      item
        Name = 'Quantidade'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'Valor'
        Attributes = [faRequired]
        DataType = ftCurrency
      end>
    OnCalcFields = adsDetailCalcFields
    DesignClass = 'DemoEntities.TItemNota'
    object adsDetailSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object adsDetailId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsDetailProduto: TAureliusEntityField
      FieldName = 'Produto'
      Visible = False
    end
    object adsDetailProdutoDescicao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkCalculated
      FieldName = 'ProdutoDescicao'
      Size = 30
      Calculated = True
    end
    object adsDetailQuantidade: TFloatField
      FieldName = 'Quantidade'
      Required = True
    end
    object adsDetailValor: TCurrencyField
      FieldName = 'Valor'
      Required = True
    end
  end
  object dssProduto: TDataSource
    AutoEdit = False
    DataSet = adsProduto
    Left = 288
    Top = 296
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
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end>
    IncludeUnmappedObjects = False
    SubpropsDepth = 0
    SyncSubprops = False
    RecordCountMode = Default
    Left = 352
    Top = 296
    DesignClass = 'DemoEntities.TProduto'
    object adsProdutoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object adsProdutoId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsProdutoNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 255
    end
  end
end
