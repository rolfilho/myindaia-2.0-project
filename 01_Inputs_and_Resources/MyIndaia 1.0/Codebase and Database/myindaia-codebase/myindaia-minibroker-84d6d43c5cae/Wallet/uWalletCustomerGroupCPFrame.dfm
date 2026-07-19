inherited FrameWalletCustomerGroupCP: TFrameWalletCustomerGroupCP
  Width = 790
  Height = 658
  ExplicitWidth = 790
  ExplicitHeight = 658
  inherited PageControl: TPageControl
    Width = 790
    Height = 658
    Font.Color = clBlack
    Font.Height = -13
    ExplicitWidth = 790
    ExplicitHeight = 658
    inherited tshGrid: TTabSheet
      ExplicitTop = 27
      ExplicitWidth = 782
      ExplicitHeight = 627
      inherited Panel2: TPanel
        Left = 691
        Height = 627
        TabOrder = 1
        ExplicitLeft = 691
        ExplicitHeight = 627
        DesignSize = (
          91
          627)
      end
      inherited pnlGrid: TPanel
        Width = 691
        Height = 627
        TabOrder = 0
        ExplicitWidth = 691
        ExplicitHeight = 627
        inherited cxGridD: TcxGrid
          Width = 691
          Height = 627
          Font.Color = clBlack
          ExplicitWidth = 691
          ExplicitHeight = 627
          inherited cxGridDBTableViewDetail: TcxGridDBTableView
            object cxGridDBTableViewDetailId: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
              Width = 35
            end
            object cxGridDBTableViewDetailProductIdId: TcxGridDBColumn
              DataBinding.FieldName = 'ProductId.Name'
              Width = 99
            end
            object cxGridDBTableViewDetailServiceIdName: TcxGridDBColumn
              DataBinding.FieldName = 'ServiceId.Name'
              Width = 147
            end
            object cxGridDBTableViewDetailItemIdName: TcxGridDBColumn
              DataBinding.FieldName = 'ItemId.Name'
              Width = 149
            end
            object cxGridDBTableViewDetailPrice: TcxGridDBColumn
              DataBinding.FieldName = 'Price'
              Width = 64
            end
            object cxGridDBTableViewDetailBillingtypeIdName: TcxGridDBColumn
              DataBinding.FieldName = 'BillingtypeId.Name'
              Width = 120
            end
            object cxGridDBTableViewDetailStartdate: TcxGridDBColumn
              DataBinding.FieldName = 'Startdate'
              Width = 85
            end
            object cxGridDBTableViewDetailExpirydate: TcxGridDBColumn
              DataBinding.FieldName = 'Enddate'
              Width = 85
            end
            object cxGridDBTableViewDetailBaseeventIdId: TcxGridDBColumn
              DataBinding.FieldName = 'BaseeventId.Id'
              Width = 74
            end
            object cxGridDBTableViewDetailBaseeventIdName: TcxGridDBColumn
              DataBinding.FieldName = 'BaseeventId.Name'
              Width = 115
            end
            object cxGridDBTableViewDetailPlaceofshipmentIdName: TcxGridDBColumn
              DataBinding.FieldName = 'PlaceofshipmentId.Name'
              Width = 133
            end
            object cxGridDBTableViewDetailPlaceofshipmentExcept: TcxGridDBColumn
              DataBinding.FieldName = 'PlaceofshipmentExcept'
              Width = 50
            end
            object cxGridDBTableViewDetailPlaceofdischargeIdName: TcxGridDBColumn
              DataBinding.FieldName = 'PlaceofdischargeId.Name'
              Width = 110
            end
            object cxGridDBTableViewDetailPlaceofdischargeExcept: TcxGridDBColumn
              DataBinding.FieldName = 'PlaceofdischargeExcept'
              Width = 49
            end
            object cxGridDBTableViewDetailTypeoftransportIdName: TcxGridDBColumn
              DataBinding.FieldName = 'TypeoftransportId.Name'
              Width = 105
            end
            object cxGridDBTableViewDetailTypeofstuffingIdName: TcxGridDBColumn
              DataBinding.FieldName = 'TypeofstuffingId.Name'
              Width = 115
            end
            object cxGridDBTableViewDetailCustomerIdName: TcxGridDBColumn
              DataBinding.FieldName = 'CustomerId.Name'
              Width = 178
            end
          end
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitTop = 27
      ExplicitWidth = 782
      ExplicitHeight = 627
      inherited Panel3: TPanel
        Left = 691
        Height = 627
        TabOrder = 1
        ExplicitLeft = 691
        ExplicitHeight = 627
        DesignSize = (
          91
          627)
      end
      inherited Panel1: TPanel
        Width = 691
        Height = 627
        TabOrder = 0
        ExplicitWidth = 691
        ExplicitHeight = 627
        object lblCodigo: TLabel
          Left = 16
          Top = 11
          Width = 39
          Height = 16
          Caption = 'C'#243'digo'
        end
        object lblValor: TLabel
          Left = 466
          Top = 323
          Width = 30
          Height = 16
          Caption = 'Valor'
        end
        object lblItem: TLabel
          Left = 16
          Top = 322
          Width = 26
          Height = 16
          Caption = 'Item'
        end
        object lblEventoBase: TLabel
          Left = 16
          Top = 220
          Width = 69
          Height = 16
          Caption = 'Evento Base'
        end
        object lblTipoCobranca: TLabel
          Left = 16
          Top = 371
          Width = 83
          Height = 16
          Caption = 'Tipo Cobran'#231'a'
        end
        object lblDtInicial: TLabel
          Left = 16
          Top = 273
          Width = 53
          Height = 16
          Caption = 'Dt. Inicial'
        end
        object lblDtFinal: TLabel
          Left = 164
          Top = 274
          Width = 47
          Height = 16
          Caption = 'Dt. Final'
        end
        object lblIndiceAumento: TLabel
          Left = 16
          Top = 523
          Width = 106
          Height = 16
          Caption = #205'ndice de aumento'
        end
        object lblTpEstufagem: TLabel
          Left = 309
          Top = 473
          Width = 107
          Height = 16
          Caption = 'Tipo de Estufagem'
        end
        object lblViaTransporte: TLabel
          Left = 16
          Top = 473
          Width = 103
          Height = 16
          Caption = 'Via de Transporte'
        end
        object Label1: TLabel
          Left = 16
          Top = 423
          Width = 109
          Height = 16
          Caption = 'Local de Embarque'
        end
        object lblLocalDesembarque: TLabel
          Left = 308
          Top = 422
          Width = 130
          Height = 16
          Caption = 'Local de Desembarque'
        end
        object lblServico: TLabel
          Left = 309
          Top = 60
          Width = 42
          Height = 16
          Caption = 'Servico'
        end
        object lblProduto: TLabel
          Left = 16
          Top = 60
          Width = 44
          Height = 16
          Caption = 'Produto'
        end
        object Label2: TLabel
          Left = 16
          Top = 109
          Width = 39
          Height = 16
          Caption = 'Cliente'
        end
        object Label3: TLabel
          Left = 16
          Top = 165
          Width = 83
          Height = 16
          Caption = 'Representante'
        end
        object dbedtId: TDBEdit
          Left = 16
          Top = 30
          Width = 142
          Height = 24
          TabStop = False
          Color = 14935011
          DataField = 'Id'
          DataSource = dtsDetailx
          ReadOnly = True
          TabOrder = 0
        end
        object dbedtPrice: TDBEdit
          Left = 466
          Top = 341
          Width = 123
          Height = 24
          Color = clWhite
          DataField = 'Price'
          DataSource = dtsDetailx
          TabOrder = 15
          OnKeyPress = dbedtPriceKeyPress
        end
        object dbcbItem: TcxDBLookupComboBox
          Left = 84
          Top = 341
          DataBinding.DataField = 'ItemId'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Name'
            end
            item
              FieldName = 'Type_'
            end>
          Properties.ListSource = dsItem
          Properties.MaxLength = 150
          Style.BorderStyle = ebsUltraFlat
          Style.ButtonStyle = btsDefault
          TabOrder = 14
          Width = 368
        end
        object dbcbItemCod: TcxDBLookupComboBox
          Left = 16
          Top = 341
          DataBinding.DataField = 'ItemId'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Id'
            end>
          Properties.ListSource = dsItem
          TabOrder = 13
          Width = 65
        end
        object dbcbEventoBase: TcxDBLookupComboBox
          Left = 84
          Top = 240
          DataBinding.DataField = 'BaseeventId'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Name'
            end>
          Properties.ListSource = dsEvento
          Properties.MaxLength = 150
          Style.BorderStyle = ebsUltraFlat
          Style.ButtonStyle = btsDefault
          TabOrder = 10
          Width = 505
        end
        object dbcbCodEventoBase: TcxDBLookupComboBox
          Left = 16
          Top = 240
          DataBinding.DataField = 'BaseeventId'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Id'
            end>
          Properties.ListSource = dsEvento
          TabOrder = 9
          Width = 65
        end
        object dbcbTpCobranca: TcxDBLookupComboBox
          Left = 16
          Top = 391
          DataBinding.DataField = 'BillingtypeId'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Name'
            end>
          Properties.ListSource = dsBillingType
          Properties.MaxLength = 150
          Style.BorderStyle = ebsUltraFlat
          Style.ButtonStyle = btsDefault
          TabOrder = 16
          Width = 210
        end
        object dbedtDtInicial: TDBEdit
          Left = 16
          Top = 293
          Width = 142
          Height = 24
          Color = clWhite
          DataField = 'Startdate'
          DataSource = dtsDetailx
          TabOrder = 11
        end
        object dbedtDtFinal: TDBEdit
          Left = 164
          Top = 293
          Width = 142
          Height = 24
          Color = clWhite
          DataField = 'Enddate'
          DataSource = dtsDetailx
          TabOrder = 12
        end
        object dbedtIncreaserate: TDBEdit
          Left = 16
          Top = 543
          Width = 83
          Height = 24
          Color = clWhite
          DataField = 'Increaserate'
          DataSource = dtsDetailx
          TabOrder = 25
          OnKeyPress = dbedtIncreaserateKeyPress
        end
        object dbcbTpEstufagem: TcxDBLookupComboBox
          Left = 309
          Top = 493
          DataBinding.DataField = 'TypeofstuffingId'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Name'
            end>
          Properties.ListSource = dsEstufagem
          Properties.MaxLength = 150
          Style.BorderStyle = ebsUltraFlat
          Style.ButtonStyle = btsDefault
          TabOrder = 24
          Width = 280
        end
        object dbcbViaTransporte: TcxDBLookupComboBox
          Left = 16
          Top = 493
          DataBinding.DataField = 'TypeoftransportId'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Name'
            end>
          Properties.ListSource = dsViaTransporte
          Properties.MaxLength = 150
          Style.BorderStyle = ebsUltraFlat
          Style.ButtonStyle = btsDefault
          TabOrder = 23
          Width = 280
        end
        object dbcbLocalEmbarque: TcxDBLookupComboBox
          Left = 84
          Top = 442
          DataBinding.DataField = 'PlaceofshipmentId'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Name'
            end>
          Properties.ListSource = dsLocalEmbarque
          Properties.MaxLength = 150
          Style.BorderStyle = ebsUltraFlat
          Style.ButtonStyle = btsDefault
          TabOrder = 20
          Width = 212
        end
        object dbcbCodLocalEmbarque: TcxDBLookupComboBox
          Left = 16
          Top = 442
          DataBinding.DataField = 'PlaceofshipmentId'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Id'
            end>
          Properties.ListSource = dsLocalEmbarque
          TabOrder = 19
          Width = 65
        end
        object dbcbLocalDesembarque: TcxDBLookupComboBox
          Left = 377
          Top = 442
          DataBinding.DataField = 'PlaceofdischargeId'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Name'
            end>
          Properties.ListSource = dsLocalDesembarque
          Properties.MaxLength = 150
          Style.BorderStyle = ebsUltraFlat
          Style.ButtonStyle = btsDefault
          TabOrder = 22
          Width = 212
        end
        object dbcbCodLocalDesembarque: TcxDBLookupComboBox
          Left = 309
          Top = 442
          DataBinding.DataField = 'PlaceofdischargeId'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Id'
            end>
          Properties.ListSource = dsLocalDesembarque
          TabOrder = 21
          Width = 65
        end
        object dbcbServico: TcxDBLookupComboBox
          Left = 309
          Top = 80
          DataBinding.DataField = 'ServiceId'
          DataBinding.DataSource = dtsDetailx
          Properties.DropDownAutoSize = True
          Properties.DropDownWidth = 500
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Name'
            end>
          Properties.ListSource = dsServico
          Properties.MaxLength = 200
          Style.BorderStyle = ebsUltraFlat
          Style.ButtonStyle = btsDefault
          TabOrder = 2
          Width = 280
        end
        object dbcbProduto: TcxDBLookupComboBox
          Left = 16
          Top = 80
          DataBinding.DataField = 'ProductId'
          DataBinding.DataSource = dtsDetailx
          Properties.DropDownWidth = 500
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Name'
            end>
          Properties.ListSource = dtsProduto
          Properties.MaxLength = 200
          Style.BorderStyle = ebsUltraFlat
          Style.ButtonStyle = btsDefault
          TabOrder = 1
          Width = 280
        end
        object dbchbExcetoLocalEmbarque: TDBCheckBox
          Left = 527
          Top = 421
          Width = 62
          Height = 17
          TabStop = False
          Caption = 'Exceto'
          DataField = 'PlaceofshipmentExcept'
          DataSource = dtsDetailx
          TabOrder = 18
        end
        object dbchbExcetoLocalDesembarque: TDBCheckBox
          Left = 234
          Top = 421
          Width = 62
          Height = 17
          TabStop = False
          Caption = 'Exceto'
          DataField = 'PlaceofdischargeExcept'
          DataSource = dtsDetailx
          TabOrder = 17
        end
        object dbcbCodCliente: TcxDBLookupComboBox
          Left = 16
          Top = 129
          DataBinding.DataField = 'CustomerId'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Id'
            end>
          Properties.ListSource = dsCliente
          TabOrder = 5
          Width = 65
        end
        object dbcbCliente: TcxDBLookupComboBox
          Left = 84
          Top = 129
          DataBinding.DataField = 'CustomerId'
          DataBinding.DataSource = dtsDetailx
          Properties.ClearKey = 46
          Properties.DropDownSizeable = True
          Properties.DropDownWidth = 800
          Properties.GridMode = True
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Name'
            end
            item
              FieldName = 'CNPJ'
            end>
          Properties.ListSource = dsCliente
          Properties.MaxLength = 500
          Style.BorderStyle = ebsUltraFlat
          Style.ButtonStyle = btsDefault
          TabOrder = 6
          Width = 505
        end
        object rgCnpj: TRadioButton
          Left = 531
          Top = 108
          Width = 51
          Height = 17
          Caption = 'CNPJ'
          TabOrder = 4
          OnClick = rgCnpjClick
        end
        object rgNome: TRadioButton
          Left = 466
          Top = 108
          Width = 53
          Height = 17
          Caption = 'Nome'
          Checked = True
          TabOrder = 3
          TabStop = True
          OnClick = rgCnpjClick
        end
        object dbcbCodRepresentante: TcxDBLookupComboBox
          Left = 16
          Top = 185
          DataBinding.DataField = 'RepresentanteId'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Id'
            end>
          Properties.ListSource = dsRepresentante
          TabOrder = 7
          Width = 65
        end
        object dbcbRepresentante: TcxDBLookupComboBox
          Left = 84
          Top = 185
          DataBinding.DataField = 'RepresentanteId'
          DataBinding.DataSource = dtsDetailx
          Properties.ClearKey = 46
          Properties.DropDownSizeable = True
          Properties.DropDownWidth = 800
          Properties.GridMode = True
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Name'
            end>
          Properties.ListSource = dsRepresentante
          Properties.MaxLength = 500
          Style.BorderStyle = ebsUltraFlat
          Style.ButtonStyle = btsDefault
          TabOrder = 8
          Width = 505
        end
      end
    end
  end
  inherited dtsDetailx: TDataSource
    Left = 519
    Top = 301
  end
  inherited adsDetailx: TAureliusDataset
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
        Name = 'Price'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'Startdate'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'Enddate'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'PlaceofshipmentExcept'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'PlaceofdischargeExcept'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Increaserate'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'CustomergroupId'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'CustomergroupId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'CustomergroupId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomergroupId.DefinitionsId'
        DataType = ftVariant
      end
      item
        Name = 'CustomergroupId.GrupoJoin'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'CustomergroupId.BillingcustomerprofileList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'CustomergroupId.VwProcessoResumoList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ItemId'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'ItemId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'ItemId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemId.Active'
        DataType = ftBoolean
      end
      item
        Name = 'ItemId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemId.Productitem'
        DataType = ftInteger
      end
      item
        Name = 'ItemId.Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemId.Taxable'
        DataType = ftBoolean
      end
      item
        Name = 'ItemId.Type_'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ItemId.Contafinanceiraimp'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemId.Contafinanceiraexp'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemId.ItemcashrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ItemId.ItempaymentrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'BillingtypeId'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'BillingtypeId.Id'
        DataType = ftLargeint
      end
      item
        Name = 'BillingtypeId.Name'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ProductId'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'ProductId.Id'
        DataType = ftLargeint
      end
      item
        Name = 'ProductId.Akey'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ProductId.Name'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ServiceId'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'ServiceId.Id'
        DataType = ftLargeint
      end
      item
        Name = 'ServiceId.Akey'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ServiceId.Name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PlaceofshipmentId'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'PlaceofshipmentId.Id'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'PlaceofshipmentId.Name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PlaceofdischargeId'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'PlaceofdischargeId.Id'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'PlaceofdischargeId.Name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'BaseeventId'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'BaseeventId.Id'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'BaseeventId.Name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TypeoftransportId'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'TypeoftransportId.Id'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TypeoftransportId.Name'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TypeofstuffingId'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'TypeofstuffingId.Id'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TypeofstuffingId.Name'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CustomerId'
        DataType = ftVariant
      end
      item
        Name = 'CustomerId.Id'
        DataType = ftLargeint
      end
      item
        Name = 'CustomerId.Name'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'CustomerId.Taxid'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RepresentanteId'
        DataType = ftVariant
      end
      item
        Name = 'RepresentanteId.Id'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'RepresentanteId.Name'
        DataType = ftString
        Size = 50
      end>
    SubpropsDepth = 1
    Left = 519
    Top = 301
    DesignClass = 'MyEntitiesV2.TBillingcustomerprofile'
    object adsDetailxSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsDetailxId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
    end
    object adsDetailxCustomergroupId: TAureliusEntityField
      DisplayLabel = 'Grupo'
      FieldName = 'CustomergroupId'
    end
    object adsDetailxCustomergroupIdId: TLargeintField
      DisplayLabel = 'C'#243'd. Grupo'
      FieldName = 'CustomergroupId.Id'
      ReadOnly = True
    end
    object adsDetailxCustomergroupIdName: TStringField
      DisplayLabel = 'Grupo'
      FieldName = 'CustomergroupId.Name'
      Size = 255
    end
    object adsDetailxBaseeventId: TAureliusEntityField
      DisplayLabel = 'Evento Base'
      FieldName = 'BaseeventId'
      Required = True
    end
    object adsDetailxBaseeventIdId: TStringField
      DisplayLabel = 'C'#243'd. Evento Base'
      FieldName = 'BaseeventId.Id'
      Size = 3
    end
    object adsDetailxBaseeventIdName: TStringField
      DisplayLabel = 'Evento Base'
      FieldName = 'BaseeventId.Name'
      Size = 50
    end
    object adsDetailxStartdate: TDateTimeField
      DisplayLabel = 'Dt. Inicial'
      FieldName = 'Startdate'
      Required = True
      EditMask = '99/99/9999'
    end
    object adsDetailxEnddate: TDateTimeField
      DisplayLabel = 'Dt. Final'
      FieldName = 'Enddate'
      Required = True
    end
    object adsDetailxItemId: TAureliusEntityField
      DisplayLabel = 'Item'
      FieldName = 'ItemId'
    end
    object adsDetailxItemIdId: TLargeintField
      DisplayLabel = 'C'#243'd. Item'
      FieldName = 'ItemId.Id'
      ReadOnly = True
    end
    object adsDetailxItemIdAkey: TStringField
      DisplayLabel = 'C'#243'd. Broker'
      FieldName = 'ItemId.Akey'
      Size = 255
    end
    object adsDetailxItemIdName: TStringField
      DisplayLabel = 'Item'
      FieldName = 'ItemId.Name'
      Size = 255
    end
    object adsDetailxPrice: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'Price'
      Required = True
      DisplayFormat = '##,##0.00'
      EditFormat = '0.00'
    end
    object adsDetailxBillingtypeId: TAureliusEntityField
      DisplayLabel = 'Tipo Cobran'#231'a'
      FieldName = 'BillingtypeId'
      Required = True
    end
    object adsDetailxBillingtypeIdId: TLargeintField
      DisplayLabel = 'C'#243'd. Tipo Cobran'#231'a'
      FieldName = 'BillingtypeId.Id'
    end
    object adsDetailxBillingtypeIdName: TStringField
      DisplayLabel = 'Tipo Cobran'#231'a'
      FieldName = 'BillingtypeId.Name'
      Size = 100
    end
    object adsDetailxProductId: TAureliusEntityField
      DisplayLabel = 'Produto'
      FieldName = 'ProductId'
      Required = True
    end
    object adsDetailxProductIdId: TLargeintField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'ProductId.Id'
    end
    object adsDetailxProductIdAkey: TStringField
      DisplayLabel = 'C'#243'd. Broker'
      FieldName = 'ProductId.Akey'
      Size = 2
    end
    object adsDetailxProductIdName: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'ProductId.Name'
      Size = 40
    end
    object adsDetailxServiceId: TAureliusEntityField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'ServiceId'
      Required = True
    end
    object adsDetailxServiceIdId: TLargeintField
      DisplayLabel = 'C'#243'd. Servi'#231'o'
      FieldName = 'ServiceId.Id'
    end
    object adsDetailxServiceIdAkey: TStringField
      DisplayLabel = 'C'#243'd. Broker'
      FieldName = 'ServiceId.Akey'
      Size = 3
    end
    object adsDetailxServiceIdName: TStringField
      DisplayLabel = 'Servi'#231'o '
      FieldName = 'ServiceId.Name'
      Size = 50
    end
    object adsDetailxPlaceofshipmentId: TAureliusEntityField
      DisplayLabel = 'Local de Embarque'
      FieldName = 'PlaceofshipmentId'
      Required = True
    end
    object adsDetailxPlaceofshipmentIdId: TStringField
      DisplayLabel = 'C'#243'd. Local de Embarque'
      FieldName = 'PlaceofshipmentId.Id'
      Size = 4
    end
    object adsDetailxPlaceofshipmentIdName: TStringField
      DisplayLabel = 'Local de Embarque'
      FieldName = 'PlaceofshipmentId.Name'
      Size = 50
    end
    object adsDetailxPlaceofshipmentExcept: TBooleanField
      DisplayLabel = 'Exceto'
      FieldName = 'PlaceofshipmentExcept'
      Required = True
    end
    object adsDetailxPlaceofdischargeId: TAureliusEntityField
      DisplayLabel = 'Local de Desembarque'
      FieldName = 'PlaceofdischargeId'
      Required = True
    end
    object adsDetailxPlaceofdischargeIdId: TStringField
      DisplayLabel = 'C'#243'd. Local de Desembarque'
      FieldName = 'PlaceofdischargeId.Id'
      Size = 4
    end
    object adsDetailxPlaceofdischargeIdName: TStringField
      DisplayLabel = 'Local de Desembarque'
      FieldName = 'PlaceofdischargeId.Name'
      Size = 50
    end
    object adsDetailxPlaceofdischargeExcept: TBooleanField
      DisplayLabel = 'Exceto'
      FieldName = 'PlaceofdischargeExcept'
      Required = True
    end
    object adsDetailxTypeoftransportId: TAureliusEntityField
      DisplayLabel = 'Via de Transporte'
      FieldName = 'TypeoftransportId'
      Required = True
    end
    object adsDetailxTypeoftransportIdId: TStringField
      DisplayLabel = 'C'#243'd. Via de Transporte'
      FieldName = 'TypeoftransportId.Id'
      Size = 2
    end
    object adsDetailxTypeoftransportIdName: TStringField
      DisplayLabel = 'Via de Transporte'
      FieldName = 'TypeoftransportId.Name'
    end
    object adsDetailxTypeofstuffingId: TAureliusEntityField
      DisplayLabel = 'Tipo de Estufagem'
      FieldName = 'TypeofstuffingId'
    end
    object adsDetailxTypeofstuffingIdId: TStringField
      DisplayLabel = 'C'#243'd. Tipo de Estufagem'
      FieldName = 'TypeofstuffingId.Id'
      Size = 2
    end
    object adsDetailxTypeofstuffingIdName: TStringField
      DisplayLabel = 'Tipo de Estufagem'
      FieldName = 'TypeofstuffingId.Name'
      Size = 15
    end
    object adsDetailxIncreaserate: TFloatField
      DisplayLabel = #205'ndice de Aumento'
      FieldName = 'Increaserate'
      Required = True
    end
    object adsDetailxCustomerId: TAureliusEntityField
      DisplayLabel = 'Cliente'
      FieldName = 'CustomerId'
    end
    object adsDetailxCustomerIdId: TLargeintField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'CustomerId.Id'
      ReadOnly = True
    end
    object adsDetailxCustomerIdName: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CustomerId.Name'
      Size = 255
    end
    object adsDetailxRepresentanteId: TAureliusEntityField
      DisplayLabel = 'Representante'
      FieldName = 'RepresentanteId'
    end
    object adsDetailxRepresentanteIdId: TStringField
      DisplayLabel = 'C'#243'd. Representante'
      FieldName = 'RepresentanteId.Id'
      Size = 5
    end
    object adsDetailxRepresentanteIdName: TStringField
      DisplayLabel = 'Representante'
      FieldName = 'RepresentanteId.Name'
      Size = 50
    end
  end
  object adsItem: TAureliusDataset
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
      end
      item
        Name = 'ItemcashrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ItempaymentrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    Left = 488
    Top = 600
    DesignClass = 'MyEntitiesV2.TItem'
    object adsItemSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsItemId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsItemAkey: TStringField
      FieldName = 'Akey'
      Size = 255
    end
    object adsItemActive: TBooleanField
      FieldName = 'Active'
    end
    object adsItemName: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
      Size = 50
    end
    object adsItemType_: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Type_'
      Required = True
      Size = 10
    end
  end
  object dsItem: TDataSource
    AutoEdit = False
    DataSet = adsItem
    Left = 488
    Top = 600
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
        Attributes = [faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'Akey'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 40
      end>
    Left = 403
    Top = 552
    DesignClass = 'MyEntitiesV2.TVwProduct'
    object adsProdutoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsProdutoId: TLargeintField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'Id'
      Required = True
    end
    object adsProdutoAkey: TStringField
      DisplayLabel = 'C'#243'd. Broker'
      FieldName = 'Akey'
      Size = 2
    end
    object adsProdutoName: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
      Size = 40
    end
  end
  object dtsProduto: TDataSource
    AutoEdit = False
    DataSet = adsProduto
    Left = 403
    Top = 552
  end
  object adsServico: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'Akey'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 50
      end>
    Left = 576
    Top = 504
    DesignClass = 'MyEntitiesV2.TVwService'
    object adsServicoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsServicoId: TLargeintField
      FieldName = 'Id'
      Required = True
    end
    object adsServicoName: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
      Size = 50
    end
    object adsServicoAkey: TStringField
      FieldName = 'Akey'
      Size = 3
    end
  end
  object dsServico: TDataSource
    AutoEdit = False
    DataSet = adsServico
    Left = 576
    Top = 504
  end
  object adsEvento: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 50
      end>
    Left = 416
    Top = 600
    DesignClass = 'MyEntitiesV2.TVwEvent'
    object adsEventoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsEventoId: TStringField
      FieldName = 'Id'
      Required = True
      Size = 3
    end
    object adsEventoName: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
      Size = 50
    end
  end
  object dsEvento: TDataSource
    AutoEdit = False
    DataSet = adsEvento
    Left = 416
    Top = 600
  end
  object adsBillingType: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'Name'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end>
    Left = 488
    Top = 504
    DesignClass = 'MyEntitiesV2.TBillingtype'
    object adsBillingTypeSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsBillingTypeId: TLargeintField
      FieldName = 'Id'
      Required = True
    end
    object adsBillingTypeName: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
      Required = True
      Size = 100
    end
  end
  object dsBillingType: TDataSource
    AutoEdit = False
    DataSet = adsBillingType
    Left = 488
    Top = 504
  end
  object adsLocalEmbarque: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faRequired]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 50
      end>
    Left = 552
    Top = 552
    DesignClass = 'MyEntitiesV2.TVwLocalembarque'
    object adsLocalEmbarqueSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsLocalEmbarqueId: TStringField
      FieldName = 'Id'
      Required = True
      Size = 4
    end
    object adsLocalEmbarqueName: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
      Size = 50
    end
  end
  object dsLocalEmbarque: TDataSource
    AutoEdit = False
    DataSet = adsLocalEmbarque
    Left = 552
    Top = 552
  end
  object adsLocalDesembarque: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faRequired]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 50
      end>
    Left = 224
    Top = 600
    DesignClass = 'MyEntitiesV2.TVwLocalembarque'
    object adsLocalDesembarqueSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsLocalDesembarqueId: TStringField
      FieldName = 'Id'
      Required = True
      Size = 4
    end
    object adsLocalDesembarqueName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object dsLocalDesembarque: TDataSource
    AutoEdit = False
    DataSet = adsLocalDesembarque
    Left = 224
    Top = 600
  end
  object adsEstufagem: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 15
      end>
    Left = 552
    Top = 600
    DesignClass = 'MyEntitiesV2.TVwEstufagem'
    object adsEstufagemSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsEstufagemId: TStringField
      FieldName = 'Id'
      Required = True
      Size = 2
    end
    object adsEstufagemName: TStringField
      FieldName = 'Name'
      Size = 15
    end
  end
  object dsEstufagem: TDataSource
    AutoEdit = False
    DataSet = adsEstufagem
    Left = 552
    Top = 600
  end
  object adsViaTransporte: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 20
      end>
    Left = 344
    Top = 600
    DesignClass = 'MyEntitiesV2.TVwViatransporte'
    object adsViaTransporteSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsViaTransporteId: TStringField
      FieldName = 'Id'
      Required = True
      Size = 2
    end
    object adsViaTransporteName: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
    end
  end
  object dsViaTransporte: TDataSource
    AutoEdit = False
    DataSet = adsViaTransporte
    Left = 344
    Top = 600
  end
  object dsCliente: TDataSource
    AutoEdit = False
    DataSet = adsCliente
    Left = 352
    Top = 552
  end
  object adsCliente: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'Taxid'
        DataType = ftString
        Size = 20
      end>
    OnCalcFields = adsClienteCalcFields
    Left = 352
    Top = 552
    DesignClass = 'MyEntitiesV2.TVwCustomer'
    object adsClienteSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsClienteId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsClienteName: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
      Size = 100
    end
    object adsClienteTaxid: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'Taxid'
      Size = 255
    end
    object adsClienteCNPJ: TStringField
      FieldKind = fkCalculated
      FieldName = 'CNPJ'
      Calculated = True
    end
  end
  object adsRepresentante: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 50
      end>
    OnCalcFields = adsClienteCalcFields
    Left = 464
    Top = 560
    DesignClass = 'MyEntitiesV2.TVwRepresentante'
    object AureliusDataset1Self: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object AureliusDataset1Id: TStringField
      FieldName = 'Id'
      Required = True
      Size = 5
    end
    object AureliusDataset1Name: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Name'
      Size = 50
    end
  end
  object dsRepresentante: TDataSource
    AutoEdit = False
    DataSet = adsRepresentante
    Left = 464
    Top = 560
  end
end
