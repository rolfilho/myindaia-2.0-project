inherited formMyCdDescricaoMercadoriaDraft: TformMyCdDescricaoMercadoriaDraft
  Caption = 'Descri'#231#227'o de Mercadoria Draft'
  ClientHeight = 526
  ExplicitTop = 8
  ExplicitHeight = 564
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlButton: TPanel
    Top = 506
    ExplicitTop = 506
  end
  inherited PageControl: TPageControl
    Height = 506
    ActivePage = tshGrid
    ExplicitHeight = 506
    inherited tshGrid: TTabSheet
      ExplicitHeight = 472
      inherited pnlButtonGrid: TPanel
        Height = 472
        ExplicitHeight = 472
        object Button1: TButton
          Left = 16
          Top = 160
          Width = 73
          Height = 25
          Caption = 'Mercadorias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          WordWrap = True
          OnClick = Button1Click
        end
      end
      inherited pnlGrid: TPanel
        Height = 472
        ExplicitHeight = 472
        inherited cxGrid: TcxGrid
          Height = 468
          ExplicitHeight = 468
          inherited cxGridDBTableView: TcxGridDBTableView
            object cxGridDBTableViewCodigo: TcxGridDBColumn
              DataBinding.FieldName = 'Codigo'
            end
            object cxGridDBTableViewNmDescricao: TcxGridDBColumn
              Caption = 'Nome Descri'#231#227'o'
              DataBinding.FieldName = 'NmDescricao'
              Width = 600
            end
          end
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitHeight = 472
      inherited pnlEditButon: TPanel
        Height = 472
        ExplicitHeight = 472
      end
      inherited pnlFundo: TPanel
        Height = 472
        ExplicitHeight = 472
        object Label2: TLabel [0]
          Left = 16
          Top = 241
          Width = 93
          Height = 16
          Caption = 'Descri'#231#227'o Ingl'#234's'
        end
        object Label3: TLabel [1]
          Left = 16
          Top = 361
          Width = 110
          Height = 16
          Caption = 'Descri'#231#227'o Espanhol'
        end
        object Label4: TLabel [2]
          Left = 16
          Top = 18
          Width = 95
          Height = 16
          Caption = 'Grupo de Cliente'
        end
        object Label5: TLabel [3]
          Left = 16
          Top = 123
          Width = 116
          Height = 16
          Caption = 'Descri'#231#227'o Portugu'#234's'
        end
        object Label1: TLabel [4]
          Left = 16
          Top = 72
          Width = 33
          Height = 16
          Caption = 'Nome'
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 16
          Top = 35
          Width = 95
          Height = 24
          DataField = 'CdGrupo'
          DataSource = dtsMain
          KeyField = 'CdGrupo'
          ListField = 'CdGrupo'
          ListSource = dtsGrupos
          TabOrder = 1
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 115
          Top = 35
          Width = 286
          Height = 24
          DataField = 'CdGrupo'
          DataSource = dtsMain
          KeyField = 'CdGrupo'
          ListField = 'NmGrupo'
          ListSource = dtsGrupos
          TabOrder = 2
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 90
          Width = 700
          Height = 24
          DataField = 'NmDescricao'
          DataSource = dtsMain
          TabOrder = 3
        end
        object DBMemo1: TDBMemo
          Left = 16
          Top = 142
          Width = 700
          Height = 89
          DataField = 'TxDescricaoPortugues'
          DataSource = dtsMain
          TabOrder = 4
        end
        object DBMemo2: TDBMemo
          Left = 16
          Top = 260
          Width = 700
          Height = 89
          DataField = 'TxDescricaoIngles'
          DataSource = dtsMain
          TabOrder = 5
        end
        object DBMemo3: TDBMemo
          Left = 16
          Top = 380
          Width = 700
          Height = 89
          DataField = 'TxDescricaoEspanhol'
          DataSource = dtsMain
          TabOrder = 6
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
        Name = 'Codigo'
        Attributes = [faReadonly, faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CdGrupo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NmDescricao'
        Attributes = [faRequired]
        DataType = ftString
        Size = 200
      end
      item
        Name = 'TxDescricaoPortugues'
        Attributes = [faRequired]
        DataType = ftMemo
      end
      item
        Name = 'TxDescricaoIngles'
        Attributes = [faRequired]
        DataType = ftMemo
      end
      item
        Name = 'TxDescricaoEspanhol'
        Attributes = [faRequired]
        DataType = ftMemo
      end>
    DesignClass = 'MyEntitiesBroker.TTdescricaoMercadoriaDraft'
    object adsMainCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      ReadOnly = True
      Required = True
    end
    object adsMainNmDescricao: TStringField
      FieldName = 'NmDescricao'
      Required = True
      Size = 200
    end
    object adsMainTxDescricaoIngles: TMemoField
      DisplayLabel = 'Descri'#231#227'o Ingl'#234's'
      FieldName = 'TxDescricaoIngles'
      Required = True
      BlobType = ftMemo
    end
    object adsMainTxDescricaoEspanhol: TMemoField
      DisplayLabel = 'Descri'#231#227'o Espanhol'
      FieldName = 'TxDescricaoEspanhol'
      Required = True
      BlobType = ftMemo
    end
    object adsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsMainCdGrupo: TStringField
      DisplayLabel = 'Grupo de Cliente'
      FieldName = 'CdGrupo'
      Size = 3
    end
    object adsMainTxDescricaoPortugues: TMemoField
      DisplayLabel = 'Descri'#231#227'o Portugu'#234's'
      FieldName = 'TxDescricaoPortugues'
      BlobType = ftMemo
    end
  end
  inherited cxGridPopupMenu: TcxGridPopupMenu
    Left = 240
    Top = 384
  end
  object adsGrupos: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdGrupo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NmGrupo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DtInclusao'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'InAtivo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CnpjGrupo'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'DtNovoFollowupImp'
        DataType = ftDateTime
      end
      item
        Name = 'DtNovoFollowupExp'
        DataType = ftDateTime
      end
      item
        Name = 'NmEmailDraftBl'
        DataType = ftString
        Size = 100
      end>
    Left = 764
    Top = 326
    DesignClass = 'MyEntitiesBroker.TTgrupo'
    object adsGruposSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsGruposCdGrupo: TStringField
      FieldName = 'CdGrupo'
      Required = True
      Size = 3
    end
    object adsGruposNmGrupo: TStringField
      FieldName = 'NmGrupo'
      Required = True
      Size = 50
    end
    object adsGruposDtInclusao: TDateTimeField
      FieldName = 'DtInclusao'
      Required = True
    end
    object adsGruposInAtivo: TStringField
      FieldName = 'InAtivo'
      Required = True
      Size = 1
    end
    object adsGruposCnpjGrupo: TStringField
      FieldName = 'CnpjGrupo'
      Size = 14
    end
    object adsGruposDtNovoFollowupImp: TDateTimeField
      FieldName = 'DtNovoFollowupImp'
    end
    object adsGruposDtNovoFollowupExp: TDateTimeField
      FieldName = 'DtNovoFollowupExp'
    end
    object adsGruposNmEmailDraftBl: TStringField
      FieldName = 'NmEmailDraftBl'
      Size = 100
    end
  end
  object dtsGrupos: TDataSource
    DataSet = adsGrupos
    Left = 716
    Top = 318
  end
end
