inherited frmWalletNumerarios: TfrmWalletNumerarios
  Caption = 'Solicitar Numer'#225'rios'
  ClientHeight = 686
  ClientWidth = 945
  Position = poDesigned
  OnKeyUp = FormKeyUp
  OnShortCut = FormShortCut
  ExplicitWidth = 961
  ExplicitHeight = 724
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 129
    Width = 945
    Height = 4
    Cursor = crVSplit
    Align = alTop
    Color = clWhite
    ParentColor = False
    ExplicitLeft = -8
    ExplicitTop = 140
  end
  inherited pnlButton: TPanel
    Top = 666
    Width = 945
    ExplicitTop = 666
    ExplicitWidth = 945
  end
  inherited PageControl: TPageControl
    Top = 133
    Width = 945
    Height = 533
    Font.Height = -12
    ExplicitTop = 133
    ExplicitWidth = 945
    ExplicitHeight = 533
    inherited tshGrid: TTabSheet
      ExplicitTop = 28
      ExplicitWidth = 937
      ExplicitHeight = 501
      inherited pnlButtonGrid: TPanel
        Left = 834
        Height = 501
        ExplicitLeft = 834
        ExplicitHeight = 501
        inherited btnIncluir: TButton
          Caption = '&Incluir'
          Font.Height = -12
          ParentFont = False
        end
        inherited btnAlterar: TButton
          Caption = '&Alterar'
          Font.Height = -12
          ParentFont = False
        end
        inherited btnConsultar: TButton
          Top = 453
          Height = 14
          Enabled = False
          Font.Height = -12
          ParentFont = False
          Visible = False
          ExplicitTop = 453
          ExplicitHeight = 14
        end
        inherited btnExcluir: TButton
          Top = 465
          Height = 19
          Font.Height = -12
          ParentFont = False
          Visible = False
          ExplicitTop = 465
          ExplicitHeight = 19
        end
        inherited cbxAltRapida: TCheckBox
          Left = 16
          Top = 496
          ExplicitLeft = 16
          ExplicitTop = 496
        end
        object btnReenviar: TButton
          Left = 15
          Top = 113
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Reenviar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = btnReenviarClick
        end
        object btnExcluirCancelar: TBitBtn
          Left = 15
          Top = 65
          Width = 75
          Height = 39
          Caption = 'Excluir Numer'#225'rio'
          TabOrder = 6
          WordWrap = True
          OnClick = btnExcluirCancelarClick
        end
        object btnConsultarBaixa: TButton
          Left = 15
          Top = 142
          Width = 75
          Height = 39
          Anchors = [akTop, akRight]
          Caption = 'Consultar Baixa'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          WordWrap = True
          OnClick = btnConsultarBaixaClick
        end
        object btnImprimir: TButton
          Left = 15
          Top = 203
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Im&primir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnClick = btnImprimirClick
        end
        object btnenviarEmail: TButton
          Left = 15
          Top = 229
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'e-Mail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnClick = btnenviarEmailClick
        end
        object btnRecuperarImpostosDI: TButton
          Left = 15
          Top = 273
          Width = 75
          Height = 42
          Anchors = [akTop, akRight]
          Caption = 'Recuperar Impostos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          WordWrap = True
          OnClick = btnRecuperarImpostosDIClick
        end
        object btnReplicar: TButton
          Left = 15
          Top = 321
          Width = 75
          Height = 39
          Anchors = [akTop, akRight]
          Caption = 'Replicar Numer'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          WordWrap = True
          OnClick = btnReplicarClick
        end
      end
      inherited pnlGrid: TPanel
        Width = 834
        Height = 501
        Color = 16119285
        ParentBackground = False
        ExplicitWidth = 834
        ExplicitHeight = 501
        inherited SplitterGridDetail: TSplitter
          Top = 185
          Width = 834
          Align = alTop
          ExplicitTop = 358
          ExplicitWidth = 846
        end
        inherited cxGridDetailList: TcxGrid [1]
          Top = 189
          Width = 834
          Height = 312
          Align = alClient
          TabOrder = 0
          ExplicitTop = 189
          ExplicitWidth = 834
          ExplicitHeight = 312
          inherited cxGridDBTableViewDetailList: TcxGridDBTableView
            DataController.KeyFieldNames = 'Id'
            object cxGridDBTableViewDetailListId: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
              Width = 55
            end
            object cxGridDBTableViewDetailListCalcDestino: TcxGridDBColumn
              DataBinding.FieldName = 'CalcDestino'
              Width = 214
            end
            object cxGridDBTableViewDetailListPrice: TcxGridDBColumn
              DataBinding.FieldName = 'Price'
              Width = 100
            end
            object cxGridDBTableViewDetailListItemIdId: TcxGridDBColumn
              DataBinding.FieldName = 'ItemId.Id'
              Width = 69
            end
            object cxGridDBTableViewDetailListItemIdName: TcxGridDBColumn
              DataBinding.FieldName = 'ItemId.Name'
              Width = 386
            end
          end
        end
        inherited cxGrid: TcxGrid [2]
          Width = 834
          Height = 181
          Align = alTop
          TabOrder = 1
          ExplicitWidth = 834
          ExplicitHeight = 181
          inherited cxGridDBTableView: TcxGridDBTableView
            FilterBox.CustomizeDialog = True
            DataController.DataModeController.GridMode = False
            DataController.DataModeController.SmartRefresh = True
            DataController.KeyFieldNames = 'Id'
            Filtering.ColumnAddValueItems = True
            Filtering.ColumnMRUItemsList = True
            object colSelecionar: TcxGridDBColumn
              Caption = 'Imprimir'
              DataBinding.ValueType = 'Boolean'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.NullStyle = nssUnchecked
              Properties.OnEditValueChanged = colSelecionarPropertiesEditValueChanged
              HeaderHint = 'Imprimir - Somente numer'#225'rios ativos'
              Width = 50
            end
            object colCodNumerario: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 53
            end
            object colStatus: TcxGridDBColumn
              DataBinding.FieldName = 'Status'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Visible = False
              Width = 50
            end
            object cxGridDBTableViewlook_Status: TcxGridDBColumn
              DataBinding.FieldName = 'look_Status'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 200
            end
            object cxGridDBTableViewCashrequesttotal: TcxGridDBColumn
              DataBinding.FieldName = 'Cashrequesttotal'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 100
            end
            object cxGridDBTableViewCreated: TcxGridDBColumn
              DataBinding.FieldName = 'Created'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 125
            end
            object cxGridDBTableViewReceiveddate: TcxGridDBColumn
              DataBinding.FieldName = 'Receiveddate'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 122
            end
            object cxGridDBTableViewSeniorkey: TcxGridDBColumn
              DataBinding.FieldName = 'Seniorkey'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 69
            end
            object cxGridDBTableViewUserIdName: TcxGridDBColumn
              DataBinding.FieldName = 'UserId.Name'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 189
            end
            object cxGridDBTableViewFaturado: TcxGridDBColumn
              Caption = 'Faturado?'
              DataBinding.FieldName = 'calc_Faturado'
              Width = 60
            end
          end
        end
        inherited pnlStyle1: TPanel
          Width = 834
          ExplicitWidth = 834
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 28
      ExplicitWidth = 937
      ExplicitHeight = 501
      inherited pnlEditButon: TPanel
        Left = 834
        Height = 501
        ExplicitLeft = 834
        ExplicitHeight = 501
        DesignSize = (
          103
          501)
        inherited btnCancelar: TButton
          Caption = '&Cancelar'
        end
        inherited btnSalvar: TButton
          Height = 39
          Caption = 'Solicitar &Numer'#225'rio'
          WordWrap = True
          ExplicitHeight = 39
        end
      end
      inherited pnlFundo: TPanel
        Width = 834
        Height = 501
        ExplicitWidth = 834
        ExplicitHeight = 501
        inherited pnlStyle2: TPanel
          Width = 834
          ExplicitWidth = 834
        end
        inherited pnlDetails: TPanel
          Width = 834
          Height = 497
          ExplicitWidth = 834
          ExplicitHeight = 497
          inherited SplitterDetail: TSplitter
            Top = 280
            Width = 834
            ExplicitTop = 280
            ExplicitWidth = 846
          end
          inherited PanelDetail: TPanel
            Top = 284
            Width = 834
            Height = 213
            ExplicitTop = 284
            ExplicitWidth = 834
            ExplicitHeight = 213
            inherited pgDetails: TPageControl
              Width = 834
              Height = 213
              ExplicitWidth = 834
              ExplicitHeight = 213
              inherited tbsDetail1: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 28
                ExplicitWidth = 826
                ExplicitHeight = 181
                inherited PageControlDetail: TPageControl
                  Width = 826
                  Height = 181
                  ActivePage = tshDetailEdit
                  ExplicitWidth = 826
                  ExplicitHeight = 181
                  inherited tshDetailGrid: TTabSheet
                    ExplicitTop = 25
                    ExplicitWidth = 818
                    ExplicitHeight = 152
                    inherited pnlEditButonDetail: TPanel
                      Left = 727
                      Height = 152
                      ExplicitLeft = 727
                      ExplicitHeight = 152
                      DesignSize = (
                        91
                        152)
                      inherited btnDetailIncluir: TButton
                        Caption = '&Incluir'
                      end
                      inherited btnDetailAlterar: TButton
                        Caption = '&Alterar'
                      end
                      inherited btnDetailConsultar: TButton
                        Top = 220
                        Visible = False
                        ExplicitTop = 220
                      end
                      inherited btnDetailExcluir: TButton
                        Top = 65
                        ExplicitTop = 65
                      end
                      inherited cbxAltRapidaDetail: TCheckBox
                        Left = 6
                        Top = 200
                        ExplicitLeft = 6
                        ExplicitTop = 200
                      end
                    end
                    inherited cxGridDetail: TcxGrid
                      Width = 727
                      Height = 152
                      ExplicitWidth = 727
                      ExplicitHeight = 117
                      inherited cxGridDBTableViewDetail: TcxGridDBTableView
                        DataController.Summary.FooterSummaryItems = <
                          item
                            Format = '0.00'
                            Kind = skSum
                            Column = cxGridDBTableViewDetailPrice
                          end>
                        OptionsView.Footer = True
                        object cxGridDBTableViewDetailId: TcxGridDBColumn
                          DataBinding.FieldName = 'Id'
                          Width = 78
                        end
                        object cxGridDBTableViewDetailCalcDestino: TcxGridDBColumn
                          DataBinding.FieldName = 'CalcDestino'
                          SortIndex = 0
                          SortOrder = soDescending
                          Width = 147
                        end
                        object cxGridDBTableViewDetailPrice: TcxGridDBColumn
                          DataBinding.FieldName = 'Price'
                          Width = 91
                        end
                        object cxGridDBTableViewDetailItemIdId: TcxGridDBColumn
                          DataBinding.FieldName = 'ItemId.Id'
                          Width = 69
                        end
                        object cxGridDBTableViewDetailItemIdName: TcxGridDBColumn
                          DataBinding.FieldName = 'ItemId.Name'
                          Width = 289
                        end
                      end
                    end
                  end
                  inherited tshDetailEdit: TTabSheet
                    ExplicitTop = 25
                    ExplicitWidth = 818
                    ExplicitHeight = 152
                    object Label14: TLabel [0]
                      Left = 15
                      Top = 24
                      Width = 37
                      Height = 14
                      Caption = 'C'#243'digo'
                    end
                    object Label16: TLabel [1]
                      Left = 16
                      Top = 118
                      Width = 27
                      Height = 14
                      Caption = 'Valor'
                    end
                    object Label15: TLabel [2]
                      Left = 15
                      Top = 68
                      Width = 26
                      Height = 14
                      Caption = 'Item'
                    end
                    object Label19: TLabel [3]
                      Left = 15
                      Top = 172
                      Width = 41
                      Height = 14
                      Caption = 'Destino'
                    end
                    inherited Panel8: TPanel
                      Left = 727
                      Height = 152
                      TabOrder = 6
                      ExplicitLeft = 727
                      ExplicitHeight = 152
                      DesignSize = (
                        91
                        152)
                      inherited btnDetailCancelar: TButton
                        Caption = '&Cancelar'
                      end
                      inherited btnDetailSalvar: TButton
                        Caption = '&Salvar'
                      end
                    end
                    object dbedtCodigo: TDBEdit
                      Left = 15
                      Top = 41
                      Width = 121
                      Height = 22
                      TabStop = False
                      Color = 14935011
                      DataField = 'Id'
                      DataSource = dtsDetail
                      ReadOnly = True
                      TabOrder = 5
                    end
                    object dbedtPrice: TDBEdit
                      Left = 16
                      Top = 137
                      Width = 121
                      Height = 22
                      Color = clWhite
                      DataField = 'Price'
                      DataSource = dtsDetail
                      TabOrder = 2
                      OnKeyPress = dbedtPriceKeyPress
                    end
                    object dbcbItem: TcxDBLookupComboBox
                      Left = 87
                      Top = 84
                      DataBinding.DataField = 'ItemId'
                      DataBinding.DataSource = dtsDetail
                      Properties.ImmediateDropDownWhenActivated = True
                      Properties.ImmediatePost = True
                      Properties.KeyFieldNames = 'Self'
                      Properties.ListColumns = <
                        item
                          FieldName = 'Name'
                        end
                        item
                          FieldName = 'type_'
                        end
                        item
                          FieldName = 'seniorkey'
                        end>
                      Properties.ListSource = dtsItem
                      Properties.MaxLength = 150
                      Style.BorderStyle = ebsUltraFlat
                      Style.TextColor = clBlack
                      Style.ButtonStyle = btsDefault
                      StyleDisabled.BorderColor = clWindowFrame
                      StyleDisabled.Color = 14935011
                      StyleDisabled.TextColor = clBlack
                      TabOrder = 1
                      Width = 440
                    end
                    object dbcbItemCod: TcxDBLookupComboBox
                      Left = 16
                      Top = 84
                      DataBinding.DataField = 'ItemId'
                      DataBinding.DataSource = dtsDetail
                      Properties.ImmediateDropDownWhenActivated = True
                      Properties.ImmediatePost = True
                      Properties.KeyFieldNames = 'Self'
                      Properties.ListColumns = <
                        item
                          FieldName = 'Id'
                        end>
                      Properties.ListSource = dtsItem
                      StyleDisabled.BorderColor = clWindowFrame
                      StyleDisabled.Color = 14935011
                      StyleDisabled.TextColor = clBlack
                      TabOrder = 0
                      Width = 65
                    end
                    object dbcbDestinoDesc: TcxDBLookupComboBox
                      Left = 87
                      Top = 188
                      DataBinding.DataField = 'Destino'
                      DataBinding.DataSource = dtsDetail
                      Properties.ImmediateDropDownWhenActivated = True
                      Properties.ImmediatePost = True
                      Properties.KeyFieldNames = 'Coddestino'
                      Properties.ListColumns = <
                        item
                          FieldName = 'Descricao'
                        end>
                      Properties.ListSource = dtsDestino
                      Properties.MaxLength = 150
                      Style.BorderStyle = ebsUltraFlat
                      Style.ButtonStyle = btsDefault
                      StyleDisabled.BorderColor = clWindowFrame
                      StyleDisabled.Color = 14935011
                      StyleDisabled.TextColor = clBlack
                      TabOrder = 4
                      Width = 194
                    end
                    object dbcbDestinoID: TcxDBLookupComboBox
                      Left = 16
                      Top = 188
                      DataBinding.DataField = 'Destino'
                      DataBinding.DataSource = dtsDetail
                      Properties.ImmediateDropDownWhenActivated = True
                      Properties.ImmediatePost = True
                      Properties.KeyFieldNames = 'Coddestino'
                      Properties.ListColumns = <
                        item
                          Caption = 'C'#243'digo'
                          FieldName = 'Coddestino'
                        end>
                      Properties.ListSource = dtsDestino
                      StyleDisabled.BorderColor = clWindowFrame
                      StyleDisabled.Color = 14935011
                      StyleDisabled.TextColor = clBlack
                      TabOrder = 3
                      Width = 65
                    end
                  end
                end
              end
            end
          end
          inherited pnlMaster: TPanel
            Width = 834
            Height = 280
            ExplicitWidth = 834
            ExplicitHeight = 280
            object Label9: TLabel
              Left = 19
              Top = 16
              Width = 37
              Height = 14
              Caption = 'C'#243'digo'
            end
            object Label10: TLabel
              Left = 19
              Top = 118
              Width = 50
              Height = 14
              Caption = 'C'#243'd. ERP'
            end
            object Label11: TLabel
              Left = 334
              Top = 17
              Width = 67
              Height = 14
              Caption = 'Data Cria'#231#227'o'
            end
            object Label12: TLabel
              Left = 19
              Top = 209
              Width = 101
              Height = 14
              Caption = 'Data Recebimento'
            end
            object Label13: TLabel
              Left = 19
              Top = 164
              Width = 181
              Height = 14
              Caption = 'Valor Total (D'#233'bito Conta Indai'#225')'
            end
            object Label17: TLabel
              Left = 19
              Top = 65
              Width = 39
              Height = 14
              Caption = 'Usu'#225'rio'
            end
            object Label18: TLabel
              Left = 176
              Top = 16
              Width = 48
              Height = 14
              Caption = 'Processo'
            end
            object dbedtId: TDBEdit
              Left = 19
              Top = 33
              Width = 142
              Height = 22
              TabStop = False
              Color = 14935011
              DataField = 'Id'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 0
            end
            object dbedtSeniorKey: TDBEdit
              Left = 19
              Top = 134
              Width = 142
              Height = 22
              TabStop = False
              Color = 14935011
              DataField = 'Seniorkey'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 1
            end
            object dbedtdtCriacao: TDBEdit
              Left = 334
              Top = 33
              Width = 142
              Height = 22
              TabStop = False
              Color = 14935011
              DataField = 'Created'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 2
            end
            object dbedtDtRecebimento: TDBEdit
              Left = 19
              Top = 225
              Width = 142
              Height = 22
              TabStop = False
              Color = 14935011
              DataField = 'Receiveddate'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 3
            end
            object dbedtValorTotal: TDBEdit
              Left = 19
              Top = 179
              Width = 142
              Height = 22
              TabStop = False
              Color = 14935011
              DataField = 'Cashrequesttotal'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 4
            end
            object dbcbUsuario: TDBLookupComboBox
              Left = 19
              Top = 81
              Width = 66
              Height = 22
              Color = 14935011
              DataField = 'UserId'
              DataSource = dtsMain
              DropDownWidth = 272
              KeyField = 'Self'
              ListField = 'Id'
              ListSource = dtsUsuario
              NullValueKey = 16401
              ReadOnly = True
              TabOrder = 5
              TabStop = False
            end
            object dbcbUsuarioNome: TDBLookupComboBox
              Left = 87
              Top = 81
              Width = 231
              Height = 22
              Color = 14935011
              DataField = 'UserId'
              DataSource = dtsMain
              DropDownWidth = 272
              KeyField = 'Self'
              ListField = 'Name'
              ListSource = dtsUsuario
              NullValueKey = 16401
              ReadOnly = True
              TabOrder = 6
              TabStop = False
            end
            object dbedtNrProcesso: TDBEdit
              Left = 176
              Top = 33
              Width = 142
              Height = 22
              TabStop = False
              Color = 14935011
              DataField = 'calcNrProcesso'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 7
            end
          end
        end
      end
    end
  end
  inline framePesquisaProc: TFrameWalletPesquisaProcesso [3]
    Left = 0
    Top = 0
    Width = 945
    Height = 129
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 945
    ExplicitHeight = 129
    inherited pnlFiltroProcesso: TPanel
      Width = 838
      Height = 129
      ExplicitWidth = 838
      ExplicitHeight = 129
      inherited pnlStyle1: TPanel
        Width = 838
        ExplicitWidth = 838
      end
      inherited pnlFiltroProc: TPanel
        Width = 838
        ExplicitWidth = 838
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
        Width = 838
        ExplicitWidth = 838
        inherited pnlStyle2: TPanel
          Width = 838
          ExplicitWidth = 838
        end
      end
    end
    inherited pnlBuscarProcesso: TPanel
      Left = 838
      Height = 129
      ExplicitLeft = 838
      ExplicitHeight = 129
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
  inherited dtsMain: TDataSource [4]
    AutoEdit = True
    Left = 544
    Top = 231
  end
  inherited dtsDetail: TDataSource [5]
    Left = 544
    Top = 272
  end
  inherited adsMain: TAureliusDataset [6]
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
        Name = 'Created'
        DataType = ftDateTime
      end
      item
        Name = 'Receiveddate'
        DataType = ftDateTime
      end
      item
        Name = 'Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Status'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Cashrequesttotal'
        DataType = ftFloat
      end
      item
        Name = 'BranchId'
        DataType = ftVariant
      end
      item
        Name = 'BranchId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'BranchId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BranchId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BranchId.Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BranchId.Taxid'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BranchId.Iss'
        DataType = ftFloat
      end
      item
        Name = 'BranchId.OrganizationId'
        DataType = ftVariant
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
        Name = 'CustomclearanceId'
        DataType = ftVariant
      end
      item
        Name = 'CustomclearanceId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'CustomclearanceId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomclearanceId.Customid'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomclearanceId.BalanceId'
        DataType = ftVariant
      end
      item
        Name = 'CustomclearanceId.CustomerId'
        DataType = ftVariant
      end
      item
        Name = 'CustomclearanceId.ServiceId'
        DataType = ftVariant
      end
      item
        Name = 'CustomclearanceId.CashrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'CustomclearanceId.PaymentrequestedList'
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
        Name = 'UserId'
        DataType = ftVariant
      end
      item
        Name = 'UserId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'UserId.Gender'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'UserId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'UserId.Password'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'UserId.Status'
        DataType = ftBoolean
      end
      item
        Name = 'UserId.Username'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'UserId.FinancialAuth'
        DataType = ftBoolean
      end
      item
        Name = 'UserId.BranchId'
        DataType = ftVariant
      end
      item
        Name = 'BillingCashrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'JoinItemCashRequested'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    BeforeClose = adsMainBeforeClose
    AfterInsert = adsMainAfterInsert
    AfterScroll = adsMainAfterScroll
    OnCalcFields = adsMainCalcFields
    SubpropsDepth = 1
    SyncSubprops = True
    Left = 568
    Top = 231
    DesignClass = 'MyEntitiesV2.TCashrequested'
    object adsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsMainId: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object adsMainCreated: TDateTimeField
      DisplayLabel = 'Cria'#231#227'o'
      FieldName = 'Created'
    end
    object adsMainReceiveddate: TDateTimeField
      DisplayLabel = 'Recebimento'
      FieldName = 'Receiveddate'
      EditMask = '99/99/9999'
    end
    object adsMainSeniorkey: TStringField
      DisplayLabel = 'C'#243'd. ERP'
      FieldName = 'Seniorkey'
      Size = 255
    end
    object adsMainStatus: TStringField
      FieldName = 'Status'
      Required = True
      Size = 255
    end
    object adsMainCashrequesttotal: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'Cashrequesttotal'
      DisplayFormat = '#,##0.00'
    end
    object adsMainCustomerId: TAureliusEntityField
      DisplayLabel = 'Cliente'
      FieldName = 'CustomerId'
      Required = True
    end
    object adsMainCustomerIdName: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'CustomerId.Name'
      Size = 255
    end
    object adsMainCustomclearanceId: TAureliusEntityField
      DisplayLabel = 'Processo'
      FieldName = 'CustomclearanceId'
      Required = True
    end
    object adsMainProductId: TAureliusEntityField
      DisplayLabel = 'Produto'
      FieldName = 'ProductId'
      Required = True
    end
    object adsMainServiceId: TAureliusEntityField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'ServiceId'
      Required = True
    end
    object adsMainUserId: TAureliusEntityField
      DisplayLabel = 'Usuario'
      FieldName = 'UserId'
      Required = True
    end
    object adsMainUserIdUsername: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'UserId.Username'
      Size = 255
    end
    object adsMainCustomclearanceIdCustomid: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'CustomclearanceId.Customid'
      Size = 255
    end
    object adsMainBranchId: TAureliusEntityField
      DisplayLabel = 'Empresa'
      FieldName = 'BranchId'
      Required = True
    end
    object adsMaincalcNrProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNrProcesso'
      Size = 18
      Calculated = True
    end
    object adsMainUserIdName: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'UserId.Name'
      Size = 255
    end
    object adsMainlook_Status: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'look_Status'
      LookupDataSet = adsTipoStatus
      LookupKeyFields = 'Id'
      LookupResultField = 'Name'
      KeyFields = 'Status'
      Size = 35
      Lookup = True
    end
    object adsMainCustomclearanceIdId: TLargeintField
      FieldName = 'CustomclearanceId.Id'
      ReadOnly = True
    end
    object adsMaincalc_Faturado: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_Faturado'
      Size = 1
      Calculated = True
    end
  end
  inherited cxGridPopupMenu: TcxGridPopupMenu [7]
    Left = 568
    Top = 328
  end
  inherited adsDetail: TAureliusDataset
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
        Name = 'Destino'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Price'
        DataType = ftFloat
      end
      item
        Name = 'ItemId'
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
        Name = 'JoinCashRequested'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    AfterPost = adsDetailAfterPost
    AfterScroll = adsDetailAfterScroll
    OnCalcFields = adsDetailCalcFields
    SubpropsDepth = 1
    Left = 568
    Top = 272
    DesignClass = 'MyEntitiesV2.TItemcashrequested'
    object adsDetailSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsDetailId: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsDetailItemId: TAureliusEntityField
      FieldName = 'ItemId'
      Required = True
    end
    object adsDetailPrice: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'Price'
      Required = True
      DisplayFormat = '##,##0.00'
      EditFormat = '0.00'
    end
    object adsDetailDestino: TStringField
      FieldName = 'Destino'
      Required = True
      Size = 1
    end
    object adsDetailJoinCashRequested: TDataSetField
      FieldName = 'JoinCashRequested'
      ReadOnly = True
    end
    object adsDetailItemIdId: TLargeintField
      DisplayLabel = 'C'#243'd. Item'
      FieldName = 'ItemId.Id'
      ReadOnly = True
    end
    object adsDetailItemIdName: TStringField
      DisplayLabel = 'Item'
      FieldName = 'ItemId.Name'
      Size = 255
    end
    object adsDetailCalcDestino: TStringField
      DisplayLabel = 'Destino'
      FieldKind = fkCalculated
      FieldName = 'CalcDestino'
      Calculated = True
    end
    object adsDetailItemIdAkey: TStringField
      DisplayLabel = 'C'#243'd. Broker'
      FieldName = 'ItemId.Akey'
      Size = 255
    end
  end
  object dtsItem: TDataSource
    AutoEdit = False
    DataSet = adsItem
    Left = 352
    Top = 224
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
    Left = 352
    Top = 224
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
      Size = 100
    end
    object adsItemProductitem: TIntegerField
      FieldName = 'Productitem'
    end
    object adsItemSeniorkey: TStringField
      DisplayLabel = 'C'#243'd. Senior'
      FieldName = 'Seniorkey'
      Size = 10
    end
    object adsItemTaxable: TBooleanField
      FieldName = 'Taxable'
    end
    object adsItemType_: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 3
      FieldName = 'Type_'
      Required = True
      Size = 1
    end
  end
  object dtsUsuario: TDataSource
    AutoEdit = False
    DataSet = adsUsuario
    Left = 352
    Top = 278
  end
  object adsUsuario: TAureliusDataset
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
        Name = 'Gender'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Password'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Status'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Username'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BranchId'
        DataType = ftVariant
      end>
    Left = 352
    Top = 278
    DesignClass = 'MyEntitiesV2.TAuthuser'
    object adsUsuarioSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsUsuarioId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsUsuarioGender: TStringField
      FieldName = 'Gender'
      Size = 255
    end
    object adsUsuarioName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object adsUsuarioPassword: TStringField
      FieldName = 'Password'
      Size = 255
    end
    object adsUsuarioStatus: TBooleanField
      FieldName = 'Status'
      Required = True
    end
    object adsUsuarioUsername: TStringField
      FieldName = 'Username'
      Size = 255
    end
    object adsUsuarioBranchId: TAureliusEntityField
      FieldName = 'BranchId'
    end
  end
  object adsTipoStatus: TAureliusDataset
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
        Size = 10
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 35
      end>
    Left = 288
    Top = 272
    DesignClass = 'MyEntitiesV2.TCashrequestedstatus'
    object adsTipoStatusSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsTipoStatusId: TStringField
      FieldName = 'Id'
      Required = True
      Size = 10
    end
    object adsTipoStatusName: TStringField
      FieldName = 'Name'
      Size = 35
    end
  end
  object dtsTipoStatus: TDataSource
    AutoEdit = False
    DataSet = adsTipoStatus
    Left = 288
    Top = 272
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 652
    Top = 241
    object cdsItenschaveItem: TIntegerField
      FieldName = 'chaveItem'
    end
    object cdsItensitem_id: TIntegerField
      FieldName = 'item_id'
    end
  end
  object dtsDestino: TDataSource
    AutoEdit = False
    DataSet = adsDestino
    Left = 288
    Top = 222
  end
  object adsDestino: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Coddestino'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 30
      end>
    Left = 288
    Top = 222
    DesignClass = 'MyEntitiesV2.TDestino'
    object adsDestinoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsDestinoCoddestino: TIntegerField
      FieldName = 'Coddestino'
      Required = True
    end
    object adsDestinoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
  end
end
