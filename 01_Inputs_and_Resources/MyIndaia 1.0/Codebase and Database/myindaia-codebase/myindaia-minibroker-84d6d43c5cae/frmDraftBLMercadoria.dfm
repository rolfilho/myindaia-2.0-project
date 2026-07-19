inherited frameDraftBLMercadoria: TframeDraftBLMercadoria
  Width = 811
  Height = 598
  ExplicitWidth = 811
  ExplicitHeight = 598
  inherited PageControl: TPageControl
    Width = 811
    Height = 598
    ActivePage = tshEdit
    ExplicitWidth = 811
    ExplicitHeight = 598
    inherited tshGrid: TTabSheet
      ExplicitWidth = 803
      ExplicitHeight = 569
      inherited Panel2: TPanel
        Left = 712
        Height = 569
        ExplicitLeft = 712
        ExplicitHeight = 569
        DesignSize = (
          91
          569)
        inherited btnConsultar: TButton
          Top = 529
          ExplicitTop = 529
        end
        inherited btnExcluir: TButton
          Top = 65
          ExplicitTop = 65
        end
      end
      inherited pnlGrid: TPanel
        Width = 712
        Height = 569
        ExplicitWidth = 712
        ExplicitHeight = 569
        inherited cxGridD: TcxGrid
          Width = 712
          Height = 569
          ExplicitWidth = 712
          ExplicitHeight = 569
          inherited cxGridDBTableViewDetail: TcxGridDBTableView
            object cxGridDBTableViewDetailNrItem: TcxGridDBColumn
              DataBinding.FieldName = 'NrItem'
              Width = 36
            end
            object cxGridDBTableViewDetailCdMercadoria: TcxGridDBColumn
              DataBinding.FieldName = 'CdMercadoria'
              Width = 95
            end
            object cxGridDBTableViewDetailDsMercadoria: TcxGridDBColumn
              DataBinding.FieldName = 'DsMercadoria'
              Width = 208
            end
            object cxGridDBTableViewDetailCdNcm: TcxGridDBColumn
              DataBinding.FieldName = 'CdNcm'
              Width = 69
            end
            object cxGridDBTableViewDetailDsEmbalagem: TcxGridDBColumn
              DataBinding.FieldName = 'DsEmbalagem'
              Width = 72
            end
            object cxGridDBTableViewDetailQtEmbalagem: TcxGridDBColumn
              DataBinding.FieldName = 'QtEmbalagem'
              Width = 80
            end
            object cxGridDBTableViewDetailQtPesoBruto: TcxGridDBColumn
              DataBinding.FieldName = 'QtPesoBruto'
              Width = 71
            end
            object cxGridDBTableViewDetailVlCubagem: TcxGridDBColumn
              DataBinding.FieldName = 'VlCubagem'
              Width = 66
            end
          end
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitWidth = 803
      ExplicitHeight = 569
      inherited Panel3: TPanel
        Left = 712
        Height = 569
        ExplicitLeft = 712
        ExplicitHeight = 569
        DesignSize = (
          91
          569)
      end
      inherited Panel1: TPanel
        Width = 712
        Height = 569
        ExplicitWidth = 712
        ExplicitHeight = 569
        object pblFundoCampos: TPanel
          Left = 0
          Top = 0
          Width = 712
          Height = 569
          Align = alClient
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object SplitterDetail: TSplitter
            Left = 1
            Top = 281
            Width = 710
            Height = 4
            Cursor = crVSplit
            Align = alTop
            Color = 16758122
            ParentColor = False
            ExplicitWidth = 686
          end
          object pnlMaster: TPanel
            Left = 1
            Top = 1
            Width = 710
            Height = 280
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            object Label2: TLabel
              Left = 17
              Top = 17
              Width = 83
              Height = 14
              Caption = 'C'#243'd Mercadoria'
            end
            object Label3: TLabel
              Left = 159
              Top = 17
              Width = 58
              Height = 14
              Caption = 'Mercadoria'
            end
            object Label4: TLabel
              Left = 17
              Top = 113
              Width = 91
              Height = 14
              Caption = 'C'#243'd Embalagem '
            end
            object Label5: TLabel
              Left = 127
              Top = 113
              Width = 66
              Height = 14
              Caption = 'Embalagem '
            end
            object Label6: TLabel
              Left = 17
              Top = 66
              Width = 24
              Height = 14
              Caption = 'NCM'
            end
            object Label7: TLabel
              Left = 300
              Top = 112
              Width = 63
              Height = 14
              Caption = 'Quantidade'
            end
            object Label8: TLabel
              Left = 17
              Top = 160
              Width = 60
              Height = 14
              Caption = 'Peso Bruto'
            end
            object Label9: TLabel
              Left = 127
              Top = 160
              Width = 51
              Height = 14
              Caption = 'Cubagem'
            end
            object DBEdit2: TDBEdit
              Left = 17
              Top = 35
              Width = 136
              Height = 22
              Color = clWhite
              DataField = 'CdMercadoria'
              DataSource = dtsDetailx
              TabOrder = 0
            end
            object DBEdit3: TDBEdit
              Left = 159
              Top = 35
              Width = 488
              Height = 22
              Color = clWhite
              DataField = 'DsMercadoria'
              DataSource = dtsDetailx
              TabOrder = 1
            end
            object DBEdit4: TDBEdit
              Left = 17
              Top = 131
              Width = 97
              Height = 22
              Color = clWhite
              DataField = 'CdEmbalagem'
              DataSource = dtsDetailx
              TabOrder = 2
            end
            object DBEdit5: TDBEdit
              Left = 127
              Top = 131
              Width = 163
              Height = 22
              Color = clWhite
              DataField = 'DsEmbalagem'
              DataSource = dtsDetailx
              TabOrder = 3
            end
            object DBEdit6: TDBEdit
              Left = 17
              Top = 85
              Width = 119
              Height = 22
              Color = clWhite
              DataField = 'CdNcm'
              DataSource = dtsDetailx
              TabOrder = 4
            end
            object DBEdit7: TDBEdit
              Left = 300
              Top = 131
              Width = 119
              Height = 22
              Color = clWhite
              DataField = 'QtEmbalagem'
              DataSource = dtsDetailx
              TabOrder = 5
              OnKeyPress = DBEdit7KeyPress
            end
            object DBEdit8: TDBEdit
              Left = 17
              Top = 179
              Width = 97
              Height = 22
              Color = clWhite
              DataField = 'QtPesoBruto'
              DataSource = dtsDetailx
              TabOrder = 6
              OnKeyPress = DBEdit8KeyPress
            end
            object DBEdit9: TDBEdit
              Left = 127
              Top = 179
              Width = 97
              Height = 22
              Color = clWhite
              DataField = 'VlCubagem'
              DataSource = dtsDetailx
              TabOrder = 7
              OnKeyPress = DBEdit9KeyPress
            end
          end
          object pgDetails: TPageControl
            Left = 1
            Top = 285
            Width = 710
            Height = 283
            ActivePage = TabSheet1
            Align = alClient
            Style = tsButtons
            TabOrder = 1
            object TabSheet1: TTabSheet
              Caption = 'Containers'
              inline frameDraftBLMercContainer: TFramDraftBLMercContainer
                Left = 0
                Top = 0
                Width = 702
                Height = 251
                Align = alClient
                Color = clWhite
                ParentBackground = False
                ParentColor = False
                TabOrder = 0
                ExplicitWidth = 702
                ExplicitHeight = 251
                inherited PageControl: TPageControl
                  Width = 702
                  Height = 251
                  ExplicitWidth = 702
                  ExplicitHeight = 251
                  inherited tshGrid: TTabSheet
                    ExplicitWidth = 694
                    ExplicitHeight = 222
                    inherited Panel2: TPanel
                      Left = 603
                      Height = 222
                      ExplicitLeft = 603
                      ExplicitHeight = 222
                      DesignSize = (
                        91
                        222)
                      inherited btnIncluir: TButton
                        OnClick = frameDraftBLMercContainerbtnIncluirClick
                      end
                      inherited btnAlterar: TButton
                        OnClick = frameDraftBLMercContainerbtnAlterarClick
                      end
                      inherited btnConsultar: TButton
                        Top = 145
                        ExplicitTop = 145
                      end
                      inherited btnExcluir: TButton
                        OnClick = frameDraftBLMercContainerbtnExcluirClick
                      end
                    end
                    inherited pnlGrid: TPanel
                      Width = 603
                      Height = 222
                      ExplicitWidth = 603
                      ExplicitHeight = 222
                      inherited cxGridD: TcxGrid
                        Width = 603
                        Height = 222
                        ExplicitWidth = 603
                        ExplicitHeight = 222
                      end
                    end
                  end
                  inherited tshEdit: TTabSheet
                    inherited Panel3: TPanel
                      inherited btnCancelar: TButton
                        OnClick = frameDraftBLMercContainerbtnCancelarClick
                      end
                      inherited btnSalvar: TButton
                        OnClick = frameDraftBLMercContainerbtnSalvarClick
                      end
                    end
                    inherited Panel1: TPanel
                      inherited dbcbPrepaindCollect: TcxDBLookupComboBox
                        Properties.ListSource = dtsDetailx
                      end
                    end
                  end
                end
                inherited dtsDetailx: TDataSource
                  Left = 543
                  Top = 133
                end
                inherited adsDetailx: TAureliusDataset
                  Left = 607
                  Top = 133
                  DesignClass = 'MyEntitiesBroker.TTprocessoDraftMercCntr'
                end
              end
            end
          end
        end
      end
    end
  end
  inherited dtsDetailx: TDataSource
    Left = 615
    Top = 173
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
        Name = 'CdMercadoria'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'DsMercadoria'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'CdNcm'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'CdEmbalagem'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DsEmbalagem'
        DataType = ftString
        Size = 50
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
    BeforeClose = adsDetailxBeforeClose
    AfterInsert = adsDetailxAfterInsert
    AfterScroll = adsDetailxAfterScroll
    Left = 615
    Top = 109
    DesignClass = 'MyEntitiesBroker.TTprocessoDraftMerc'
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
    object adsDetailxCdMercadoria: TStringField
      DisplayLabel = 'C'#243'd. Mercadoria'
      FieldName = 'CdMercadoria'
      Required = True
      Size = 40
    end
    object adsDetailxDsMercadoria: TStringField
      DisplayLabel = 'Mercadoria'
      FieldName = 'DsMercadoria'
      Size = 200
    end
    object adsDetailxCdNcm: TStringField
      DisplayLabel = 'Ncm'
      FieldName = 'CdNcm'
      Size = 11
    end
    object adsDetailxCdEmbalagem: TStringField
      DisplayLabel = 'C'#243'd. Embalagem'
      FieldName = 'CdEmbalagem'
      Size = 3
    end
    object adsDetailxDsEmbalagem: TStringField
      DisplayLabel = 'Embalagem'
      FieldName = 'DsEmbalagem'
      Size = 50
    end
    object adsDetailxQtEmbalagem: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QtEmbalagem'
      DisplayFormat = '##,##0.00'
      EditFormat = '0.00'
    end
    object adsDetailxQtPesoBruto: TFloatField
      DisplayLabel = 'Peso Bruto'
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
