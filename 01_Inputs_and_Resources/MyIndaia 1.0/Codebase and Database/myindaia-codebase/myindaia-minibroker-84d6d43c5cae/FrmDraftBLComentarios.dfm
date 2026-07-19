inherited frameDraftBLComentarios: TframeDraftBLComentarios
  Width = 818
  ExplicitWidth = 818
  inherited PageControl: TPageControl
    Width = 818
    ActivePage = tshEdit
    ExplicitWidth = 818
    inherited tshGrid: TTabSheet
      ExplicitWidth = 810
      inherited Panel2: TPanel
        Left = 719
        ExplicitLeft = 719
        inherited btnConsultar: TButton
          Top = 241
          ExplicitTop = 241
        end
        inherited btnExcluir: TButton
          Top = 65
          ExplicitTop = 65
        end
      end
      inherited pnlGrid: TPanel
        Width = 719
        ExplicitWidth = 719
        inherited cxGridD: TcxGrid
          Width = 719
          ExplicitWidth = 719
          inherited cxGridDBTableViewDetail: TcxGridDBTableView
            object cxGridDBTableViewDetailNrComentario: TcxGridDBColumn
              DataBinding.FieldName = 'NrComentario'
              Width = 100
            end
            object cxGridDBTableViewDetailDsComentario: TcxGridDBColumn
              DataBinding.FieldName = 'DsComentario'
              Width = 291
            end
            object cxGridDBTableViewDetailTpComentarioDescricao: TcxGridDBColumn
              DataBinding.FieldName = 'TpComentario.Descricao'
              Width = 295
            end
          end
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitWidth = 810
      inherited Panel3: TPanel
        Left = 719
        ExplicitLeft = 719
      end
      inherited Panel1: TPanel
        Width = 719
        ExplicitWidth = 719
        object Label1: TLabel
          Left = 15
          Top = 16
          Width = 62
          Height = 14
          Caption = 'Coment'#225'rio'
        end
        object Label2: TLabel
          Left = 15
          Top = 68
          Width = 87
          Height = 14
          Caption = 'Tipo da Cl'#225'usula'
        end
        object DBEdit1: TDBEdit
          Left = 15
          Top = 35
          Width = 512
          Height = 22
          Color = clWhite
          DataField = 'DsComentario'
          DataSource = dtsDetailx
          TabOrder = 0
        end
        object dbcbItemCod: TcxDBLookupComboBox
          Left = 16
          Top = 84
          DataBinding.DataField = 'TpComentario'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'CdComentarioInntra'
            end>
          Properties.ListSource = dsTpComentario
          StyleDisabled.BorderColor = clWindowFrame
          StyleDisabled.Color = 14935011
          StyleDisabled.TextColor = clBlack
          TabOrder = 1
          Width = 65
        end
        object dbcbItem: TcxDBLookupComboBox
          Left = 87
          Top = 84
          DataBinding.DataField = 'TpComentario'
          DataBinding.DataSource = dtsDetailx
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Descricao'
            end>
          Properties.ListSource = dsTpComentario
          Properties.MaxLength = 150
          Style.BorderStyle = ebsUltraFlat
          Style.TextColor = clBlack
          Style.ButtonStyle = btsDefault
          StyleDisabled.BorderColor = clWindowFrame
          StyleDisabled.Color = 14935011
          StyleDisabled.TextColor = clBlack
          TabOrder = 2
          Width = 440
        end
      end
    end
  end
  inherited dtsDetailx: TDataSource
    Left = 575
    Top = 205
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
        Name = 'NrComentario'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DsComentario'
        DataType = ftString
        Size = 130
      end
      item
        Name = 'TpComentario'
        DataType = ftVariant
      end
      item
        Name = 'TpComentario.CdComentarioInntra'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TpComentario.Descricao'
        DataType = ftString
        Size = 130
      end>
    AfterInsert = adsDetailxAfterInsert
    SubpropsDepth = 1
    Left = 639
    Top = 205
    DesignClass = 'MyEntitiesBroker.TTprocessoDraftComentarios'
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
    object adsDetailxNrComentario: TIntegerField
      DisplayLabel = 'Nr. Comentario'
      FieldName = 'NrComentario'
      Required = True
    end
    object adsDetailxDsComentario: TStringField
      DisplayLabel = 'Comentario'
      FieldName = 'DsComentario'
      Size = 130
    end
    object adsDetailxTpComentario: TAureliusEntityField
      DisplayLabel = 'Tipo Comentario'
      FieldName = 'TpComentario'
    end
    object adsDetailxTpComentarioDescricao: TStringField
      DisplayLabel = 'Tipo Comentario'
      FieldName = 'TpComentario.Descricao'
      Size = 130
    end
  end
  object adsTpComentario: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdComentarioInntra'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 130
      end>
    AfterInsert = adsDetailxAfterInsert
    Left = 495
    Top = 213
    DesignClass = 'MyEntitiesBroker.TTtpComentariosInttra'
    object adsTpComentarioSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsTpComentarioCdComentarioInntra: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CdComentarioInntra'
      Required = True
      Size = 2
    end
    object adsTpComentarioDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 130
    end
  end
  object dsTpComentario: TDataSource
    AutoEdit = False
    DataSet = adsTpComentario
    Left = 431
    Top = 213
  end
end
