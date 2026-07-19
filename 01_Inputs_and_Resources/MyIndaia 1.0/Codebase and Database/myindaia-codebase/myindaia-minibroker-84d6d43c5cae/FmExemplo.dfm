object FrameExemplo: TFrameExemplo
  Left = 0
  Top = 0
  Width = 267
  Height = 21
  AutoSize = True
  TabOrder = 0
  object edtCodigo: TEdit
    Left = 0
    Top = 0
    Width = 40
    Height = 21
    TabOrder = 0
    OnChange = edtCodigoChange
    OnExit = edtCodigoExit
  end
  object DBLookupComboBox: TDBLookupComboBox
    Left = 39
    Top = 0
    Width = 228
    Height = 21
    KeyField = 'CdProduto'
    ListField = 'CdProduto;NmProduto'
    ListFieldIndex = 1
    ListSource = DataSource
    NullValueKey = 16452
    TabOrder = 1
    OnCloseUp = DBLookupComboBoxCloseUp
  end
  object DataSource: TDataSource
    DataSet = adsProduto
    Left = 80
  end
  object adsProduto: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdProduto'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NmProduto'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ApProduto'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'InAtivo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CdViatransp'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CdCtGerencial'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'TpFatSemReceita'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TpProduto'
        DataType = ftString
        Size = 2
      end>
    IncludeUnmappedObjects = False
    SubpropsDepth = 0
    SyncSubprops = False
    RecordCountMode = Default
    Left = 104
    DesignClass = 'MyEntitiesBroker.TTproduto'
    object adsProdutoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object adsProdutoCdProduto: TStringField
      FieldName = 'CdProduto'
      Required = True
      Size = 2
    end
    object adsProdutoNmProduto: TStringField
      FieldName = 'NmProduto'
      Required = True
      Size = 40
    end
    object adsProdutoApProduto: TStringField
      FieldName = 'ApProduto'
      Required = True
      Size = 10
    end
    object adsProdutoInAtivo: TStringField
      FieldName = 'InAtivo'
      Required = True
      Visible = False
      Size = 1
    end
  end
end
