inherited FramDraftBLMercContainer: TFramDraftBLMercContainer
  Width = 691
  Height = 259
  ExplicitWidth = 691
  ExplicitHeight = 259
  inherited PageControl: TPageControl
    Width = 691
    Height = 259
    ExplicitWidth = 691
    ExplicitHeight = 259
    inherited tshGrid: TTabSheet
      ExplicitWidth = 683
      ExplicitHeight = 230
      inherited Panel2: TPanel
        Left = 592
        Height = 230
        ExplicitLeft = 592
        ExplicitHeight = 230
        DesignSize = (
          91
          230)
        inherited btnConsultar: TButton
          Top = 193
          ExplicitTop = 193
        end
        inherited btnExcluir: TButton
          Top = 65
          ExplicitTop = 65
        end
      end
      inherited pnlGrid: TPanel
        Width = 592
        Height = 230
        ExplicitWidth = 592
        ExplicitHeight = 230
        inherited cxGridD: TcxGrid
          Width = 592
          Height = 230
          ExplicitWidth = 592
          ExplicitHeight = 230
          inherited cxGridDBTableViewDetail: TcxGridDBTableView
            object cxGridDBTableViewDetailNrCntr: TcxGridDBColumn
              DataBinding.FieldName = 'NrCntr'
            end
            object cxGridDBTableViewDetailQtEmbalagem: TcxGridDBColumn
              DataBinding.FieldName = 'QtEmbalagem'
              Width = 92
            end
            object cxGridDBTableViewDetailQtPesoBruto: TcxGridDBColumn
              DataBinding.FieldName = 'QtPesoBruto'
              Width = 88
            end
            object cxGridDBTableViewDetailVlCubagem: TcxGridDBColumn
              DataBinding.FieldName = 'VlCubagem'
              Width = 95
            end
          end
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitWidth = 683
      ExplicitHeight = 230
      inherited Panel3: TPanel
        Left = 592
        Height = 230
        ExplicitLeft = 592
        ExplicitHeight = 230
        DesignSize = (
          91
          230)
      end
      inherited Panel1: TPanel
        Width = 592
        Height = 230
        ExplicitWidth = 592
        ExplicitHeight = 230
        object Label1: TLabel
          Left = 244
          Top = 88
          Width = 63
          Height = 14
          Caption = 'Quantidade'
        end
        object Label2: TLabel
          Left = 127
          Top = 88
          Width = 51
          Height = 14
          Caption = 'Cubagem'
        end
        object Label3: TLabel
          Left = 17
          Top = 88
          Width = 60
          Height = 14
          Caption = 'Peso Bruto'
        end
        object Label4: TLabel
          Left = 17
          Top = 30
          Width = 52
          Height = 14
          Caption = 'Container'
        end
        object DBEdit1: TDBEdit
          Left = 244
          Top = 107
          Width = 119
          Height = 22
          Color = clWhite
          DataField = 'QtEmbalagem'
          DataSource = dtsDetailx
          TabOrder = 0
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit2: TDBEdit
          Left = 127
          Top = 107
          Width = 97
          Height = 22
          Color = clWhite
          DataField = 'VlCubagem'
          DataSource = dtsDetailx
          TabOrder = 1
          OnKeyPress = DBEdit2KeyPress
        end
        object DBEdit3: TDBEdit
          Left = 17
          Top = 107
          Width = 97
          Height = 22
          Color = clWhite
          DataField = 'QtPesoBruto'
          DataSource = dtsDetailx
          TabOrder = 2
          OnKeyPress = DBEdit3KeyPress
        end
        object dbcbPrepaindCollect: TcxDBLookupComboBox
          Left = 17
          Top = 50
          DataBinding.DataField = 'NrCntr'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'NrCntr'
          Properties.ListColumns = <
            item
              FieldName = 'NrCntr'
            end>
          Properties.ListSource = dtsDetailx
          StyleDisabled.BorderColor = clWindowFrame
          StyleDisabled.Color = 14935011
          StyleDisabled.TextColor = clBlack
          TabOrder = 3
          Width = 161
        end
      end
    end
  end
  inherited dtsDetailx: TDataSource
    Left = 279
    Top = 45
  end
  inherited adsDetailx: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso'
        Attributes = [faRequired]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'NrAmend'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NrCntr'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'QtEmbalagem'
        DataType = ftInteger
      end
      item
        Name = 'QtPesoBruto'
        DataType = ftFloat
      end
      item
        Name = 'VlCubagem'
        DataType = ftFloat
      end>
    AfterInsert = adsDetailxAfterInsert
    OnFilterRecord = adsDetailxFilterRecord
    SubpropsDepth = 1
    Left = 343
    Top = 45
    DesignClass = 'MyEntitiesBroker.TTprocessoDraftMercCntr'
    object adsDetailxSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsDetailxNrProcesso: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object adsDetailxNrAmend: TIntegerField
      DisplayLabel = 'Nr. Amend'
      FieldName = 'NrAmend'
      Required = True
    end
    object adsDetailxNrItem: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'NrItem'
      Required = True
    end
    object adsDetailxNrCntr: TStringField
      DisplayLabel = 'Container'
      FieldName = 'NrCntr'
      Required = True
    end
    object adsDetailxQtEmbalagem: TIntegerField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QtEmbalagem'
      DisplayFormat = '##,##0.00'
      EditFormat = '0.00'
    end
    object adsDetailxQtPesoBruto: TFloatField
      DisplayLabel = 'Peso Bruto'
      DisplayWidth = 10
      FieldName = 'QtPesoBruto'
      DisplayFormat = '##,##0.00'
      EditFormat = '0.00'
    end
    object adsDetailxVlCubagem: TFloatField
      DisplayLabel = 'Cubagem'
      FieldName = 'VlCubagem'
      DisplayFormat = '##,###0.000'
      EditFormat = '0.000'
    end
  end
end
