object FrameUnidadeNegocio: TFrameUnidadeNegocio
  Left = 0
  Top = 0
  Width = 273
  Height = 41
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentBackground = False
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 110
    Height = 14
    Caption = 'Unidade de Neg'#243'cio'
  end
  object edtCodigo: TEdit
    Left = 0
    Top = 15
    Width = 40
    Height = 22
    TabOrder = 0
    OnChange = edtCodigoChange
    OnExit = edtCodigoExit
  end
  object DBLookupComboBox: TDBLookupComboBox
    Left = 39
    Top = 15
    Width = 228
    Height = 22
    KeyField = 'CdUnidNeg'
    ListField = 'CdUnidNeg;ApUnidNeg'
    ListFieldIndex = 1
    ListSource = DataSource
    NullValueKey = 16452
    TabOrder = 1
  end
  object DataSource: TDataSource
    DataSet = adsUnidNegocio
    Left = 104
  end
  object adsUnidNegocio: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdUnidNeg'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NmUnidNeg'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ApUnidNeg'
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
        Name = 'VlAliqIss'
        DataType = ftFloat
      end
      item
        Name = 'CgcUnidNeg'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'CdFilial'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'EndUnidNeg'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'EndCompl'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EndBairro'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'EndUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'IeUnidNeg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ImUnidNeg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NrFone'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EndCep'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'NrFax1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NrFax2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NmSlogan'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NrNotaFatura'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'NmEmail'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PathRelatorios'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PathSiscomex'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PathRei'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NmDiretor'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrCpfDiretor'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'NmContador'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrCrcContador'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NmProcurador'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrCpfProcurador'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'CdPais'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrProcNfPref'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NrLivro'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NmSigla'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'VlPercIss'
        DataType = ftFloat
      end
      item
        Name = 'CdBancoConciliacao'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CdDac'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CdCtCusto'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'IdArquivoNovoex'
        DataType = ftString
        Size = 10
      end>
    AfterScroll = adsUnidNegocioAfterScroll
    Left = 128
    DesignClass = 'MyEntitiesBroker.TTunidNeg'
    object adsUnidNegocioSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object adsUnidNegocioCdUnidNeg: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CdUnidNeg'
      Required = True
      Size = 2
    end
    object adsUnidNegocioNmUnidNeg: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NmUnidNeg'
      Required = True
      Size = 50
    end
    object adsUnidNegocioApUnidNeg: TStringField
      DisplayLabel = 'Apelido'
      DisplayWidth = 30
      FieldName = 'ApUnidNeg'
      Required = True
      Size = 10
    end
    object adsUnidNegocioInAtivo: TStringField
      FieldName = 'InAtivo'
      Required = True
      Visible = False
      Size = 1
    end
  end
end
