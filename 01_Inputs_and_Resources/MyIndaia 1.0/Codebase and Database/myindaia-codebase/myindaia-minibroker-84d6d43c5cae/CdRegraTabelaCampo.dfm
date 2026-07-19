inherited FormCdRegraTabelaCampo: TFormCdRegraTabelaCampo
  Caption = 'Cadastro de Tabelas - Regras Autom'#225'ticas'
  ClientHeight = 605
  ExplicitHeight = 643
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlButton: TPanel
    Top = 585
    ExplicitTop = 585
  end
  inherited PageControl: TPageControl
    Height = 585
    ExplicitHeight = 585
    inherited tshGrid: TTabSheet
      ExplicitHeight = 554
      inherited pnlButtonGrid: TPanel
        Height = 554
        ExplicitHeight = 554
      end
      inherited pnlGrid: TPanel
        Height = 554
        ExplicitHeight = 554
        inherited SplitterGridDetail: TSplitter
          Top = 438
          ExplicitTop = 377
        end
        inherited cxGrid: TcxGrid
          Height = 434
          ExplicitHeight = 434
          inherited cxGridDBTableView: TcxGridDBTableView
            object cxGridDBTableViewCdRegraTabela: TcxGridDBColumn
              Caption = 'C'#243'd. Tabela'
              DataBinding.FieldName = 'CdRegraTabela'
            end
            object cxGridDBTableViewNmTabelaRegra: TcxGridDBColumn
              Caption = 'Nome '
              DataBinding.FieldName = 'NmTabelaRegra'
              Width = 228
            end
            object cxGridDBTableViewDsTabelaRegra: TcxGridDBColumn
              Caption = 'Descri'#231#227'o '
              DataBinding.FieldName = 'DsTabelaRegra'
              Width = 389
            end
          end
        end
        inherited cxGridDetailList: TcxGrid
          Top = 442
          ExplicitTop = 442
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitHeight = 554
      inherited pnlEditButon: TPanel
        Height = 554
        ExplicitHeight = 554
      end
      inherited pnlFundo: TPanel
        Height = 554
        ExplicitHeight = 554
        inherited pnlDetails: TPanel
          Height = 550
          ExplicitHeight = 550
          inherited SplitterDetail: TSplitter
            Top = 152
            ExplicitTop = 152
          end
          inherited PanelDetail: TPanel
            Top = 156
            Height = 394
            ExplicitTop = 156
            ExplicitHeight = 394
            inherited pgDetails: TPageControl
              Height = 394
              ExplicitHeight = 394
              inherited tbsDetail1: TTabSheet
                ExplicitHeight = 363
                inherited PageControlDetail: TPageControl
                  Height = 363
                  ExplicitHeight = 363
                  inherited tshDetailGrid: TTabSheet
                    ExplicitHeight = 332
                    inherited pnlEditButonDetail: TPanel
                      Height = 332
                      ExplicitHeight = 332
                    end
                    inherited cxGridDetail: TcxGrid
                      Height = 332
                      ExplicitHeight = 332
                      inherited cxGridDBTableViewDetail: TcxGridDBTableView
                        object cxGridDBTableViewDetailCdRegraCampo: TcxGridDBColumn
                          Caption = 'C'#243'd. Campo'
                          DataBinding.FieldName = 'CdRegraCampo'
                          Width = 70
                        end
                        object cxGridDBTableViewDetailNmCampo: TcxGridDBColumn
                          Caption = 'Nome'
                          DataBinding.FieldName = 'NmCampo'
                          Width = 200
                        end
                        object cxGridDBTableViewDetailDsCampo: TcxGridDBColumn
                          Caption = 'Descri'#231#227'o (Tela)'
                          DataBinding.FieldName = 'DsCampo'
                          Width = 200
                        end
                        object cxGridDBTableViewDetailNmTabelaOrigem: TcxGridDBColumn
                          Caption = 'Nome Tabela - Origem'
                          DataBinding.FieldName = 'NmTabelaOrigem'
                          Width = 200
                        end
                        object cxGridDBTableViewDetailNmCampoCdOrigem: TcxGridDBColumn
                          Caption = 'Nome Campo - Origem'
                          DataBinding.FieldName = 'NmCampoCdOrigem'
                          Width = 200
                        end
                        object cxGridDBTableViewDetailNmCampoDsOrigem: TcxGridDBColumn
                          Caption = 'Campo Descri'#231#227'o - Origem (Banco)'
                          DataBinding.FieldName = 'NmCampoDsOrigem'
                          Width = 200
                        end
                        object cxGridDBTableViewDetailTxWhereExtra: TcxGridDBColumn
                          Caption = 'Filtro Extra'
                          DataBinding.FieldName = 'TxWhereExtra'
                        end
                      end
                    end
                  end
                  inherited tshDetailEdit: TTabSheet
                    ParentFont = False
                    ExplicitHeight = 332
                    object Label13: TLabel [0]
                      Left = 16
                      Top = 13
                      Width = 69
                      Height = 16
                      Caption = 'Cod. Tabela'
                    end
                    object Label14: TLabel [1]
                      Left = 16
                      Top = 59
                      Width = 40
                      Height = 16
                      Caption = 'Campo'
                    end
                    object Label15: TLabel [2]
                      Left = 16
                      Top = 143
                      Width = 122
                      Height = 16
                      Caption = 'Nome Tabela Origem'
                    end
                    object Label16: TLabel [3]
                      Left = 16
                      Top = 185
                      Width = 166
                      Height = 16
                      Caption = 'Nome Campo Tabela Origem'
                    end
                    object Label17: TLabel [4]
                      Left = 16
                      Top = 227
                      Width = 188
                      Height = 16
                      Caption = 'Campo Descri'#231#227'o Tabela Origem'
                    end
                    object Label18: TLabel [5]
                      Left = 16
                      Top = 101
                      Width = 138
                      Height = 16
                      Caption = 'Descri'#231#227'o Campo (Tela)'
                    end
                    object Label1: TLabel [6]
                      Left = 16
                      Top = 270
                      Width = 62
                      Height = 16
                      Caption = 'Filtro Extra'
                    end
                    object Label2: TLabel [7]
                      Left = 16
                      Top = 284
                      Width = 93
                      Height = 16
                      Caption = 'Where 1=1 AND'
                    end
                    inherited Panel8: TPanel
                      Height = 332
                      ExplicitHeight = 332
                    end
                    object cxDBTextEdit3: TcxDBTextEdit
                      Left = 16
                      Top = 78
                      DataBinding.DataField = 'NmCampo'
                      DataBinding.DataSource = dtsDetail
                      TabOrder = 1
                      Width = 200
                    end
                    object cxDBTextEdit4: TcxDBTextEdit
                      Left = 16
                      Top = 120
                      DataBinding.DataField = 'DsCampo'
                      DataBinding.DataSource = dtsDetail
                      TabOrder = 2
                      Width = 200
                    end
                    object cxDBTextEdit5: TcxDBTextEdit
                      Left = 16
                      Top = 162
                      DataBinding.DataField = 'NmTabelaOrigem'
                      DataBinding.DataSource = dtsDetail
                      TabOrder = 3
                      Width = 200
                    end
                    object cxDBTextEdit6: TcxDBTextEdit
                      Left = 16
                      Top = 204
                      DataBinding.DataField = 'NmCampoCdOrigem'
                      DataBinding.DataSource = dtsDetail
                      TabOrder = 4
                      Width = 200
                    end
                    object cxDBTextEdit7: TcxDBTextEdit
                      Left = 16
                      Top = 246
                      DataBinding.DataField = 'NmCampoDsOrigem'
                      DataBinding.DataSource = dtsDetail
                      TabOrder = 5
                      Width = 200
                    end
                    object cxDBTextEdit9: TcxDBTextEdit
                      Left = 16
                      Top = 32
                      DataBinding.DataField = 'CdRegraCampo'
                      DataBinding.DataSource = dtsDetail
                      Style.Color = 14935011
                      TabOrder = 6
                      Width = 70
                    end
                    object cxDBTextEdit10: TcxDBTextEdit
                      Left = 16
                      Top = 305
                      DataBinding.DataField = 'TxWhereExtra'
                      DataBinding.DataSource = dtsDetail
                      TabOrder = 7
                      OnKeyPress = cxDBTextEdit10KeyPress
                      Width = 689
                    end
                  end
                end
              end
            end
          end
          inherited pnlMaster: TPanel
            Height = 152
            ExplicitLeft = 72
            ExplicitTop = 25
            ExplicitHeight = 152
            object Label10: TLabel
              Left = 20
              Top = 15
              Width = 69
              Height = 16
              Caption = 'Cod. Tabela'
            end
            object Label11: TLabel
              Left = 20
              Top = 59
              Width = 76
              Height = 16
              Caption = 'Nome Tabela'
            end
            object Label12: TLabel
              Left = 20
              Top = 99
              Width = 98
              Height = 16
              Caption = 'Descri'#231#227'o Tabela'
            end
            object cxDBTextEdit1: TcxDBTextEdit
              Left = 20
              Top = 75
              DataBinding.DataField = 'NmTabelaRegra'
              DataBinding.DataSource = dtsMain
              TabOrder = 0
              Width = 200
            end
            object cxDBTextEdit2: TcxDBTextEdit
              Left = 20
              Top = 115
              DataBinding.DataField = 'DsTabelaRegra'
              DataBinding.DataSource = dtsMain
              TabOrder = 1
              Width = 200
            end
            object cxDBTextEdit8: TcxDBTextEdit
              Left = 20
              Top = 35
              DataBinding.DataField = 'CdRegraTabela'
              DataBinding.DataSource = dtsMain
              Style.Color = 14935011
              TabOrder = 2
              Width = 70
            end
          end
        end
      end
    end
  end
  inherited dtsMain: TDataSource
    Left = 648
    Top = 464
  end
  inherited dtsDetail: TDataSource
    Left = 552
    Top = 464
  end
  inherited adsMain: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdRegraTabela'
        Attributes = [faReadonly, faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NmTabelaRegra'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DsTabelaRegra'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Campos'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    BeforeInsert = adsMainBeforeInsert
    BeforeEdit = adsMainBeforeEdit
    SubpropsDepth = 2
    Left = 688
    Top = 464
    DesignClass = 'MyEntitiesBroker.TTregraObsAutoTabelas'
    object adsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsMainCdRegraTabela: TIntegerField
      FieldName = 'CdRegraTabela'
      ReadOnly = True
      Required = True
    end
    object adsMainNmTabelaRegra: TStringField
      FieldName = 'NmTabelaRegra'
      Size = 50
    end
    object adsMainDsTabelaRegra: TStringField
      FieldName = 'DsTabelaRegra'
      Size = 100
    end
    object adsMainCampos: TDataSetField
      FieldName = 'Campos'
      ReadOnly = True
    end
  end
  inherited cxGridPopupMenu: TcxGridPopupMenu
    Left = 576
    Top = 312
  end
  inherited adsDetail: TAureliusDataset
    DatasetField = adsMainCampos
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdRegraCampo'
        Attributes = [faReadonly, faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NmCampo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DsCampo'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NmTabelaOrigem'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NmCampoCdOrigem'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NmCampoDsOrigem'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TxWhereExtra'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'Tabela'
        DataType = ftVariant
      end
      item
        Name = 'Tabela.CdRegraTabela'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'Tabela.NmTabelaRegra'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Tabela.DsTabelaRegra'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Tabela.Campos'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    BeforeInsert = adsDetailBeforeInsert
    BeforeEdit = adsDetailBeforeEdit
    SubpropsDepth = 1
    Left = 600
    Top = 464
    DesignClass = 'MyEntitiesBroker.TTregraObsAutoTabelasCampos'
    object adsDetailSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsDetailCdRegraCampo: TIntegerField
      FieldName = 'CdRegraCampo'
      ReadOnly = True
      Required = True
    end
    object adsDetailNmCampo: TStringField
      FieldName = 'NmCampo'
      Size = 50
    end
    object adsDetailDsCampo: TStringField
      FieldName = 'DsCampo'
      Size = 100
    end
    object adsDetailNmTabelaOrigem: TStringField
      FieldName = 'NmTabelaOrigem'
      Size = 50
    end
    object adsDetailNmCampoCdOrigem: TStringField
      FieldName = 'NmCampoCdOrigem'
      Size = 50
    end
    object adsDetailNmCampoDsOrigem: TStringField
      FieldName = 'NmCampoDsOrigem'
      Size = 50
    end
    object adsDetailTabela: TAureliusEntityField
      FieldName = 'Tabela'
    end
    object adsDetailTabelaCdRegraTabela: TIntegerField
      FieldName = 'Tabela.CdRegraTabela'
      ReadOnly = True
    end
    object adsDetailTabelaNmTabelaRegra: TStringField
      FieldName = 'Tabela.NmTabelaRegra'
      Size = 50
    end
    object adsDetailTabelaDsTabelaRegra: TStringField
      FieldName = 'Tabela.DsTabelaRegra'
      Size = 100
    end
    object adsDetailTabelaCampos: TDataSetField
      FieldName = 'Tabela.Campos'
      ReadOnly = True
    end
    object adsDetailTxWhereExtra: TStringField
      FieldName = 'TxWhereExtra'
      Size = 500
    end
  end
end
