inherited formMyCdEnquadramento: TformMyCdEnquadramento
  Caption = 'Enquadramento'
  PixelsPerInch = 96
  TextHeight = 16
  inherited PageControl: TPageControl
    inherited tshGrid: TTabSheet
      inherited pnlGrid: TPanel
        inherited cxGrid: TcxGrid
          inherited cxGridDBTableView: TcxGridDBTableView
            object cxGridDBTableViewSelf: TcxGridDBColumn
              DataBinding.FieldName = 'Self'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewCdEnquadOp: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'CdEnquadOp'
              Options.Editing = False
              Width = 72
            end
            object cxGridDBTableViewNmEnquadOp: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'NmEnquadOp'
            end
            object cxGridDBTableViewInAtivo: TcxGridDBColumn
              Caption = 'Ativo?'
              DataBinding.FieldName = 'InAtivo'
              Options.Editing = False
              Width = 45
            end
          end
        end
      end
    end
    inherited tshEdit: TTabSheet
      inherited pnlFundo: TPanel
        ExplicitLeft = 136
        ExplicitTop = 3
        object Label1: TLabel [0]
          Left = 11
          Top = 23
          Width = 39
          Height = 16
          Caption = 'C'#243'digo'
          FocusControl = DBEdit1
        end
        object Label2: TLabel [1]
          Left = 11
          Top = 79
          Width = 149
          Height = 16
          Caption = 'Descri'#231#227'o Enquadramento'
          FocusControl = DBEdit2
        end
        object DBEdit1: TDBEdit
          Left = 11
          Top = 39
          Width = 110
          Height = 24
          DataField = 'CdEnquadOp'
          DataSource = dtsMain
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Left = 11
          Top = 95
          Width = 390
          Height = 24
          DataField = 'NmEnquadOp'
          DataSource = dtsMain
          TabOrder = 2
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
        Name = 'CdEnquadOp'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NmEnquadOp'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'InAtivo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end>
    DesignClass = 'MyEntitiesBroker.TTenquadOp'
    object adsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsMainCdEnquadOp: TStringField
      FieldName = 'CdEnquadOp'
      Required = True
      Size = 5
    end
    object adsMainNmEnquadOp: TStringField
      FieldName = 'NmEnquadOp'
      Required = True
      Size = 60
    end
    object adsMainInAtivo: TStringField
      FieldName = 'InAtivo'
      Required = True
      Size = 1
    end
  end
end
