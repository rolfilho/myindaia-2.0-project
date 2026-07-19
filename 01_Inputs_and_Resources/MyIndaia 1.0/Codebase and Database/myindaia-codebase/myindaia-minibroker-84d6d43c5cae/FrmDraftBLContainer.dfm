inherited frameDraftBLContainer: TframeDraftBLContainer
  Width = 700
  Height = 365
  ExplicitWidth = 700
  ExplicitHeight = 365
  inherited PageControl: TPageControl
    Width = 700
    Height = 365
    ActivePage = tshEdit
    ExplicitWidth = 700
    ExplicitHeight = 365
    inherited tshGrid: TTabSheet
      ExplicitWidth = 692
      ExplicitHeight = 336
      inherited Panel2: TPanel
        Left = 601
        Height = 336
        ExplicitLeft = 601
        ExplicitHeight = 336
        DesignSize = (
          91
          336)
      end
      inherited pnlGrid: TPanel
        Width = 601
        Height = 336
        ExplicitWidth = 601
        ExplicitHeight = 336
        inherited cxGridD: TcxGrid
          Width = 601
          Height = 336
          ExplicitWidth = 601
          ExplicitHeight = 336
          inherited cxGridDBTableViewDetail: TcxGridDBTableView
            object cxGridDBTableViewDetailNrCntr: TcxGridDBColumn
              DataBinding.FieldName = 'NrCntr'
              Width = 92
            end
            object cxGridDBTableViewDetailCdIso: TcxGridDBColumn
              DataBinding.FieldName = 'CdIso'
              Width = 72
            end
            object cxGridDBTableViewDetailNrLacre: TcxGridDBColumn
              DataBinding.FieldName = 'NrLacre'
              Width = 83
            end
            object cxGridDBTableViewDetailNrLacreSif: TcxGridDBColumn
              DataBinding.FieldName = 'NrLacreSif'
            end
            object cxGridDBTableViewDetailVlCubagem: TcxGridDBColumn
              DataBinding.FieldName = 'VlCubagem'
              Width = 80
            end
            object cxGridDBTableViewDetailTaraCntr: TcxGridDBColumn
              DataBinding.FieldName = 'TaraCntr'
              Width = 56
            end
            object cxGridDBTableViewDetailDsTemperatura: TcxGridDBColumn
              DataBinding.FieldName = 'DsTemperatura'
            end
          end
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitWidth = 692
      ExplicitHeight = 336
      inherited Panel3: TPanel
        Left = 601
        Height = 336
        ExplicitLeft = 601
        ExplicitHeight = 336
        DesignSize = (
          91
          336)
      end
      inherited Panel1: TPanel
        Width = 601
        Height = 336
        ExplicitWidth = 601
        ExplicitHeight = 336
        object Label1: TLabel
          Left = 17
          Top = 16
          Width = 72
          Height = 14
          Caption = 'Nr. Container'
        end
        object Label2: TLabel
          Left = 17
          Top = 113
          Width = 29
          Height = 14
          Caption = 'Lacre'
        end
        object Label3: TLabel
          Left = 137
          Top = 113
          Width = 50
          Height = 14
          Caption = 'Lacre SIF'
        end
        object Label4: TLabel
          Left = 15
          Top = 64
          Width = 80
          Height = 14
          Caption = 'Tipo Container'
        end
        object Label5: TLabel
          Left = 239
          Top = 64
          Width = 49
          Height = 14
          Caption = 'C'#243'd. ISO'
        end
        object Label6: TLabel
          Left = 17
          Top = 161
          Width = 71
          Height = 14
          Caption = 'Temperatura'
        end
        object Label7: TLabel
          Left = 17
          Top = 209
          Width = 24
          Height = 14
          Caption = 'Tara'
        end
        object Label8: TLabel
          Left = 17
          Top = 257
          Width = 51
          Height = 14
          Caption = 'Cubagem'
        end
        object DBEdit1: TDBEdit
          Left = 17
          Top = 35
          Width = 96
          Height = 22
          Color = clWhite
          DataField = 'NrCntr'
          DataSource = dtsDetailx
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 17
          Top = 131
          Width = 96
          Height = 22
          Color = clWhite
          DataField = 'NrLacre'
          DataSource = dtsDetailx
          TabOrder = 3
        end
        object DBEdit3: TDBEdit
          Left = 137
          Top = 131
          Width = 96
          Height = 22
          Color = clWhite
          DataField = 'NrLacreSif'
          DataSource = dtsDetailx
          TabOrder = 4
        end
        object DBEdit4: TDBEdit
          Left = 15
          Top = 83
          Width = 218
          Height = 22
          Color = clWhite
          DataField = 'NmTpCntr'
          DataSource = dtsDetailx
          TabOrder = 1
        end
        object DBEdit5: TDBEdit
          Left = 239
          Top = 83
          Width = 98
          Height = 22
          Color = clWhite
          DataField = 'CdIso'
          DataSource = dtsDetailx
          TabOrder = 2
        end
        object DBEdit6: TDBEdit
          Left = 17
          Top = 179
          Width = 96
          Height = 22
          Color = clWhite
          DataField = 'DsTemperatura'
          DataSource = dtsDetailx
          TabOrder = 5
        end
        object DBEdit7: TDBEdit
          Left = 17
          Top = 227
          Width = 96
          Height = 22
          Color = clWhite
          DataField = 'TaraCntr'
          DataSource = dtsDetailx
          TabOrder = 6
        end
        object DBEdit8: TDBEdit
          Left = 17
          Top = 275
          Width = 96
          Height = 22
          Color = clWhite
          DataField = 'VlCubagem'
          DataSource = dtsDetailx
          TabOrder = 7
        end
      end
    end
  end
  inherited dtsDetailx: TDataSource
    Left = 471
    Top = 117
  end
  inherited adsDetailx: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'NrCntr'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NrLacre'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NrLacreSif'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'NmTpCntr'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CdIso'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DsTemperatura'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'TaraCntr'
        DataType = ftFloat
      end
      item
        Name = 'VlCubagem'
        DataType = ftFloat
      end
      item
        Name = 'Draft'
        Attributes = [faRequired]
        DataType = ftVariant
      end>
    AfterInsert = adsDetailxAfterInsert
    Left = 471
    Top = 165
    DesignClass = 'MyEntitiesBroker.TTprocessoDraftCntr'
    object adsDetailxSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsDetailxCdIso: TStringField
      DisplayLabel = 'C'#243'digo ISO'
      FieldName = 'CdIso'
      Size = 4
    end
    object adsDetailxNrLacre: TStringField
      DisplayLabel = 'Lacre'
      FieldName = 'NrLacre'
    end
    object adsDetailxNrLacreSif: TStringField
      DisplayLabel = 'Lacre Sif'
      FieldName = 'NrLacreSif'
      Size = 11
    end
    object adsDetailxDsTemperatura: TStringField
      DisplayLabel = 'Temp.'
      FieldName = 'DsTemperatura'
      Size = 6
    end
    object adsDetailxTaraCntr: TFloatField
      DisplayLabel = 'Tara'
      FieldName = 'TaraCntr'
    end
    object adsDetailxNmTpCntr: TStringField
      DisplayLabel = 'Tipo Container'
      FieldName = 'NmTpCntr'
    end
    object adsDetailxVlCubagem: TFloatField
      DisplayLabel = 'Cubagem'
      FieldName = 'VlCubagem'
    end
    object adsDetailxDraft: TAureliusEntityField
      FieldName = 'Draft'
      Required = True
    end
    object adsDetailxNrCntr: TStringField
      FieldName = 'NrCntr'
      Required = True
    end
  end
end
