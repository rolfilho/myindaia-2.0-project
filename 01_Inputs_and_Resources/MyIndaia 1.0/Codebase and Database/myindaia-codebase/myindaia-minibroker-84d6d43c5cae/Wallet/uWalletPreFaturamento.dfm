inherited frmWalletPreFaturamento: TfrmWalletPreFaturamento
  Caption = 'Pr'#233' Faturamento'
  ClientHeight = 662
  ClientWidth = 915
  ExplicitWidth = 931
  ExplicitHeight = 700
  PixelsPerInch = 96
  TextHeight = 16
  inline framePesquisaProc: TFrameWalletPesquisaProcesso
    Left = 0
    Top = 0
    Width = 915
    Height = 178
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 915
    inherited pnlFiltroProcesso: TPanel
      Width = 808
      ExplicitWidth = 808
      inherited pnlStyle1: TPanel
        Width = 808
        ExplicitWidth = 808
      end
      inherited pnlFiltroProc: TPanel
        Width = 808
        ExplicitWidth = 808
        inherited edtProcesso: TcxMaskEdit
          Style.IsFontAssigned = True
          ExplicitHeight = 22
        end
        inherited edtProduto: TcxMaskEdit
          Style.IsFontAssigned = True
          ExplicitHeight = 22
        end
        inherited edtUnidadeNeg: TcxMaskEdit
          Style.IsFontAssigned = True
          ExplicitHeight = 22
        end
      end
      inherited pnlResumoProc: TPanel
        Width = 808
        ExplicitWidth = 808
        inherited pnlStyle2: TPanel
          Width = 808
          ExplicitWidth = 808
        end
      end
    end
    inherited pnlBuscarProcesso: TPanel
      Left = 808
      ExplicitLeft = 808
      inherited btnPesquisar: TBitBtn
        OnClick = framePesquisaProcbtnPesquisarClick
      end
    end
    inherited adsProcesso: TAureliusDataset
      AfterOpen = framePesquisaProcadsProcessoAfterOpen
      AfterClose = framePesquisaProcadsProcessoAfterClose
      DesignClass = 'MyEntitiesV2.TCustomclearance'
    end
    inherited adsProduto: TAureliusDataset
      DesignClass = 'MyEntitiesV2.TProduct'
    end
    inherited adsUnidade: TAureliusDataset
      DesignClass = 'MyEntitiesV2.TBranch'
    end
  end
  object pnlBotoes: TPanel
    Left = 808
    Top = 178
    Width = 107
    Height = 484
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
  end
  object pgProcesso: TPageControl
    Left = 0
    Top = 178
    Width = 808
    Height = 484
    ActivePage = tbsResumo
    Align = alClient
    TabOrder = 2
    object tbsResumo: TTabSheet
      Caption = 'Resumo'
      object pnlResumoProcesso: TPanel
        Left = 0
        Top = 0
        Width = 800
        Height = 453
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object lblProcesso: TLabel
          Left = 9
          Top = 14
          Width = 51
          Height = 16
          Caption = 'Processo'
        end
        object lblCliente: TLabel
          Left = 9
          Top = 64
          Width = 39
          Height = 16
          Caption = 'Cliente'
        end
        object lblCNPJ: TLabel
          Left = 406
          Top = 64
          Width = 28
          Height = 16
          Caption = 'CNPJ'
        end
        object lblRepresentante: TLabel
          Left = 9
          Top = 115
          Width = 83
          Height = 16
          Caption = 'Representante'
        end
        object lblViaTransporte: TLabel
          Left = 9
          Top = 221
          Width = 103
          Height = 16
          Caption = 'Via de Transporte'
        end
        object lblDataAbertura: TLabel
          Left = 164
          Top = 14
          Width = 70
          Height = 16
          Caption = 'Dt. Abertura'
        end
        object lblDesembaraco: TLabel
          Left = 8
          Top = 280
          Width = 98
          Height = 16
          Caption = 'Dt. Desembara'#231'o'
        end
        object lblDataSaida: TLabel
          Left = 169
          Top = 280
          Width = 52
          Height = 16
          Caption = 'Dt. Sa'#237'da'
        end
        object lblDataChegada: TLabel
          Left = 331
          Top = 280
          Width = 70
          Height = 16
          Caption = 'Dt. Chegada'
        end
        object lblEstufagem: TLabel
          Left = 169
          Top = 221
          Width = 60
          Height = 16
          Caption = 'Estufagem'
        end
        object lblLocalEmbarque: TLabel
          Left = 9
          Top = 168
          Width = 109
          Height = 16
          Caption = 'Local de Embarque'
        end
        object lblLocalDesembarque: TLabel
          Left = 278
          Top = 168
          Width = 130
          Height = 16
          Caption = 'Local de Desembarque'
        end
        object lblQtLis: TLabel
          Left = 9
          Top = 336
          Width = 36
          Height = 16
          Caption = 'Qt. Lis'
        end
        object lblQtLisAnvisa: TLabel
          Left = 169
          Top = 336
          Width = 77
          Height = 16
          Caption = 'Qt. Lis Anvisa'
        end
        object lblQtLisInmetro: TLabel
          Left = 331
          Top = 336
          Width = 85
          Height = 16
          Caption = 'Qt. Lis Inmetro'
        end
        object lblQtLisMapa: TLabel
          Left = 490
          Top = 336
          Width = 71
          Height = 16
          Caption = 'Qt. Lis Mapa'
        end
        object lblQtContainers: TLabel
          Left = 9
          Top = 389
          Width = 82
          Height = 16
          Caption = 'Qt. Containers'
        end
        object dbedtProcesso: TDBEdit
          Left = 9
          Top = 33
          Width = 142
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'NrProcesso'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 0
        end
        object dbedtCdCliente: TDBEdit
          Left = 9
          Top = 83
          Width = 51
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'CustomerId.Id'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 2
        end
        object dbedtCNPJ: TDBEdit
          Left = 406
          Top = 83
          Width = 142
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'CustomerId.Taxid'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 4
        end
        object dbedtCdRepresentante: TDBEdit
          Left = 9
          Top = 134
          Width = 51
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'CdRepresentante.Id'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 5
        end
        object dbedtViaTransporte: TDBEdit
          Left = 9
          Top = 241
          Width = 142
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'CdViaTransporte.Name'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 11
        end
        object dbedtDtAbertura: TDBEdit
          Left = 164
          Top = 33
          Width = 142
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'DtAbertura'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 1
        end
        object dbedtDtDesembaraco: TDBEdit
          Left = 8
          Top = 300
          Width = 142
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'DtDesembaraco'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 13
        end
        object dbeditDtSaida: TDBEdit
          Left = 169
          Top = 300
          Width = 142
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'DtSaida'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 14
        end
        object dbedtDtChegada: TDBEdit
          Left = 331
          Top = 300
          Width = 142
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'DtChegada'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 15
        end
        object dbedtCliente: TDBEdit
          Left = 63
          Top = 83
          Width = 332
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'CustomerId.Name'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 3
        end
        object dbedtRepresentante: TDBEdit
          Left = 63
          Top = 134
          Width = 332
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'CdRepresentante.Name'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 6
        end
        object dbedtTpEstufagem: TDBEdit
          Left = 169
          Top = 241
          Width = 142
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'TpEstufagem.Name'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 12
        end
        object dbedtCdLocalEmbarque: TDBEdit
          Left = 9
          Top = 187
          Width = 51
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'CdLocalEmbarque.Id'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 7
        end
        object dbedtLocalEmbarque: TDBEdit
          Left = 63
          Top = 187
          Width = 200
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'CdLocalEmbarque.Name'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 8
        end
        object dbedtCdLocalDesembarque: TDBEdit
          Left = 278
          Top = 187
          Width = 51
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'CdLocalDesembarque.Id'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 9
        end
        object dbedtLocalDesembarque: TDBEdit
          Left = 333
          Top = 187
          Width = 200
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'CdLocalDesembarque.Name'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 10
        end
        object dbedtQtLis: TDBEdit
          Left = 9
          Top = 356
          Width = 142
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'QtLis'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 16
        end
        object dbedtQtLisAnvisa: TDBEdit
          Left = 169
          Top = 356
          Width = 142
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'QtLisAnvisa'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 17
        end
        object dbedtQtLisInmetro: TDBEdit
          Left = 331
          Top = 356
          Width = 142
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'QtLisInmetro'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 18
        end
        object dbedtQtLisMapa: TDBEdit
          Left = 490
          Top = 356
          Width = 142
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'QtLisMapa'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 19
        end
        object dbedtQtContainers: TDBEdit
          Left = 9
          Top = 409
          Width = 142
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'QtContainers'
          DataSource = dsProcessoResumo
          ReadOnly = True
          TabOrder = 20
        end
      end
    end
    object tbsFaturamento: TTabSheet
      Caption = 'Faturamento'
      ImageIndex = 1
      object pnlFaturamento: TPanel
        Left = 0
        Top = 0
        Width = 800
        Height = 453
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 800
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lblItensAFaturar: TLabel
            Left = 6
            Top = 8
            Width = 32
            Height = 14
            Caption = 'Itens'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 41
          Width = 800
          Height = 412
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsItensAFaturar
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'codCP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'itemName'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'value'
              Visible = True
            end>
        end
      end
    end
  end
  object adsProcessoResumo: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CustomclearanceId'
        Attributes = [faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'NrProcesso'
        Attributes = [faRequired]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'DtAbertura'
        DataType = ftDateTime
      end
      item
        Name = 'DtDesembaraco'
        DataType = ftDateTime
      end
      item
        Name = 'DtSaida'
        DataType = ftDateTime
      end
      item
        Name = 'DtChegada'
        DataType = ftDateTime
      end
      item
        Name = 'QtLis'
        DataType = ftInteger
      end
      item
        Name = 'QtLisAnvisa'
        DataType = ftInteger
      end
      item
        Name = 'QtLisInmetro'
        DataType = ftInteger
      end
      item
        Name = 'QtLisMapa'
        DataType = ftInteger
      end
      item
        Name = 'QtContainers'
        DataType = ftInteger
      end
      item
        Name = 'GroupId'
        DataType = ftVariant
      end
      item
        Name = 'GroupId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'GroupId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'GroupId.DefinitionsId'
        DataType = ftVariant
      end
      item
        Name = 'GroupId.GrupoJoin'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'CustomerId'
        DataType = ftVariant
      end
      item
        Name = 'CustomerId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'CustomerId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Active'
        DataType = ftBoolean
      end
      item
        Name = 'CustomerId.City'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Neighborhood'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Number'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.State'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Street'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Zipcode'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Fax'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Fone'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Inscestadual'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Inscmunicipal'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Taxid'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Type_'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.GroupId'
        DataType = ftVariant
      end
      item
        Name = 'CustomerId.CountryId'
        DataType = ftVariant
      end
      item
        Name = 'CustomerId.CustomclearanceList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'CustomerId.PaymentdefinitionList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ProductId'
        DataType = ftVariant
      end
      item
        Name = 'ProductId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'ProductId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ProductId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ProductId.ProductServiceList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ServiceId'
        DataType = ftVariant
      end
      item
        Name = 'ServiceId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'ServiceId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ServiceId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CdRepresentante'
        DataType = ftVariant
      end
      item
        Name = 'CdRepresentante.Id'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'CdRepresentante.Name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CdViaTransporte'
        DataType = ftVariant
      end
      item
        Name = 'CdViaTransporte.Id'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CdViaTransporte.Name'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TpEstufagem'
        DataType = ftVariant
      end
      item
        Name = 'TpEstufagem.Id'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TpEstufagem.Name'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CdLocalEmbarque'
        DataType = ftVariant
      end
      item
        Name = 'CdLocalEmbarque.Id'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CdLocalEmbarque.Name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CdLocalDesembarque'
        DataType = ftVariant
      end
      item
        Name = 'CdLocalDesembarque.Id'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CdLocalDesembarque.Name'
        DataType = ftString
        Size = 50
      end>
    AfterClose = adsProcessoResumoAfterClose
    SubpropsDepth = 1
    Left = 814
    Top = 232
    DesignClass = 'MyEntitiesV2.TVwProcessoResumo'
    object adsProcessoResumoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsProcessoResumoDtAbertura: TDateTimeField
      FieldName = 'DtAbertura'
    end
    object adsProcessoResumoDtDesembaraco: TDateTimeField
      FieldName = 'DtDesembaraco'
    end
    object adsProcessoResumoDtSaida: TDateTimeField
      FieldName = 'DtSaida'
    end
    object adsProcessoResumoDtChegada: TDateTimeField
      FieldName = 'DtChegada'
    end
    object adsProcessoResumoQtLis: TIntegerField
      FieldName = 'QtLis'
    end
    object adsProcessoResumoQtLisAnvisa: TIntegerField
      FieldName = 'QtLisAnvisa'
    end
    object adsProcessoResumoQtLisInmetro: TIntegerField
      FieldName = 'QtLisInmetro'
    end
    object adsProcessoResumoQtLisMapa: TIntegerField
      FieldName = 'QtLisMapa'
    end
    object adsProcessoResumoQtContainers: TIntegerField
      FieldName = 'QtContainers'
    end
    object adsProcessoResumoGroupId: TAureliusEntityField
      FieldName = 'GroupId'
    end
    object adsProcessoResumoGroupIdId: TLargeintField
      FieldName = 'GroupId.Id'
      ReadOnly = True
    end
    object adsProcessoResumoGroupIdName: TStringField
      FieldName = 'GroupId.Name'
      Size = 255
    end
    object adsProcessoResumoCustomerId: TAureliusEntityField
      FieldName = 'CustomerId'
    end
    object adsProcessoResumoCustomerIdId: TLargeintField
      FieldName = 'CustomerId.Id'
      ReadOnly = True
    end
    object adsProcessoResumoCustomerIdName: TStringField
      FieldName = 'CustomerId.Name'
      Size = 255
    end
    object adsProcessoResumoCustomerIdTaxid: TStringField
      FieldName = 'CustomerId.Taxid'
      Size = 255
    end
    object adsProcessoResumoProductId: TAureliusEntityField
      FieldName = 'ProductId'
    end
    object adsProcessoResumoProductIdId: TLargeintField
      FieldName = 'ProductId.Id'
      ReadOnly = True
    end
    object adsProcessoResumoProductIdName: TStringField
      FieldName = 'ProductId.Name'
      Size = 255
    end
    object adsProcessoResumoServiceId: TAureliusEntityField
      FieldName = 'ServiceId'
    end
    object adsProcessoResumoServiceIdId: TLargeintField
      FieldName = 'ServiceId.Id'
      ReadOnly = True
    end
    object adsProcessoResumoServiceIdName: TStringField
      FieldName = 'ServiceId.Name'
      Size = 255
    end
    object adsProcessoResumoCdRepresentante: TAureliusEntityField
      FieldName = 'CdRepresentante'
    end
    object adsProcessoResumoCdRepresentanteId: TStringField
      FieldName = 'CdRepresentante.Id'
      Size = 5
    end
    object adsProcessoResumoCdRepresentanteName: TStringField
      FieldName = 'CdRepresentante.Name'
      Size = 50
    end
    object adsProcessoResumoCdViaTransporte: TAureliusEntityField
      FieldName = 'CdViaTransporte'
    end
    object adsProcessoResumoCdViaTransporteId: TStringField
      FieldName = 'CdViaTransporte.Id'
      Size = 2
    end
    object adsProcessoResumoCdViaTransporteName: TStringField
      FieldName = 'CdViaTransporte.Name'
    end
    object adsProcessoResumoTpEstufagem: TAureliusEntityField
      FieldName = 'TpEstufagem'
    end
    object adsProcessoResumoTpEstufagemId: TStringField
      FieldName = 'TpEstufagem.Id'
      Size = 2
    end
    object adsProcessoResumoTpEstufagemName: TStringField
      FieldName = 'TpEstufagem.Name'
      Size = 15
    end
    object adsProcessoResumoCdLocalEmbarque: TAureliusEntityField
      FieldName = 'CdLocalEmbarque'
    end
    object adsProcessoResumoCdLocalEmbarqueId: TStringField
      FieldName = 'CdLocalEmbarque.Id'
      Size = 4
    end
    object adsProcessoResumoCdLocalEmbarqueName: TStringField
      FieldName = 'CdLocalEmbarque.Name'
      Size = 50
    end
    object adsProcessoResumoCdLocalDesembarque: TAureliusEntityField
      FieldName = 'CdLocalDesembarque'
    end
    object adsProcessoResumoCdLocalDesembarqueId: TStringField
      FieldName = 'CdLocalDesembarque.Id'
      Size = 4
    end
    object adsProcessoResumoCdLocalDesembarqueName: TStringField
      FieldName = 'CdLocalDesembarque.Name'
      Size = 50
    end
    object adsProcessoResumoNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object adsProcessoResumoCustomclearanceId: TLargeintField
      FieldName = 'CustomclearanceId'
      Required = True
    end
  end
  object dsProcessoResumo: TDataSource
    AutoEdit = False
    DataSet = adsProcessoResumo
    Left = 816
    Top = 288
  end
  object dsItensAFaturar: TDataSource
    AutoEdit = False
    DataSet = adsItensAFaturar
    Left = 728
    Top = 288
  end
  object adsItensAFaturar: TAureliusDataset
    FieldDefs = <>
    Left = 724
    Top = 245
    object adsItensAFaturarcodCP: TIntegerField
      DisplayLabel = 'C'#243'd. CP'
      FieldName = 'codCP'
    end
    object adsItensAFaturaritemName: TStringField
      DisplayLabel = 'Item'
      FieldName = 'itemName'
      Size = 100
    end
    object adsItensAFaturarvalue: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'value'
      DisplayFormat = '##,##0.00'
      EditFormat = '0.00'
    end
  end
end
