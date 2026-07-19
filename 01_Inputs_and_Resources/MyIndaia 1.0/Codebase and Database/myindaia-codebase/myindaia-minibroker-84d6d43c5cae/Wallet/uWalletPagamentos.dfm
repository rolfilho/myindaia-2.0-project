inherited frmWalletPagamentos: TfrmWalletPagamentos
  Caption = 'Criar Pagamentos'
  ClientHeight = 627
  ClientWidth = 972
  OnShortCut = FormShortCut
  ExplicitWidth = 988
  ExplicitHeight = 665
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 44
    Width = 972
    Height = 4
    Cursor = crVSplit
    Align = alTop
    Color = clWhite
    ParentColor = False
    ExplicitLeft = 8
    ExplicitTop = 318
    ExplicitWidth = 861
  end
  inherited pnlButton: TPanel
    Top = 607
    Width = 972
    ExplicitTop = 607
    ExplicitWidth = 972
  end
  inherited PageControl: TPageControl
    Top = 48
    Width = 972
    Height = 559
    ActivePage = tshEdit
    Font.Height = -12
    ExplicitTop = 48
    ExplicitWidth = 972
    ExplicitHeight = 559
    inherited tshGrid: TTabSheet
      ExplicitTop = 28
      ExplicitWidth = 964
      ExplicitHeight = 527
      inherited pnlButtonGrid: TPanel
        Left = 861
        Height = 527
        ExplicitLeft = 861
        ExplicitHeight = 527
        inherited btnIncluir: TButton
          Top = 6
          Caption = '&Incluir'
          Font.Height = -12
          ParentFont = False
          ExplicitTop = 6
        end
        inherited btnAlterar: TButton
          Top = 37
          Caption = '&Alterar'
          Font.Height = -12
          ParentFont = False
          ExplicitTop = 37
        end
        inherited btnConsultar: TButton
          Left = 6
          Top = 516
          Height = 16
          Font.Height = -12
          ParentFont = False
          Visible = False
          ExplicitLeft = 6
          ExplicitTop = 516
          ExplicitHeight = 16
        end
        inherited btnExcluir: TButton
          Top = 68
          Font.Height = -12
          ParentFont = False
          ExplicitTop = 68
        end
        inherited cbxAltRapida: TCheckBox
          Left = 6
          Top = 524
          ExplicitLeft = 6
          ExplicitTop = 524
        end
        object btnReplicar: TButton
          Left = 15
          Top = 116
          Width = 75
          Height = 39
          Anchors = [akTop, akRight]
          Caption = 'Replicar Pagamento'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          WordWrap = True
          OnClick = btnReplicarClick
        end
        object btnConsultarBaixa: TButton
          Left = 15
          Top = 161
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
          TabOrder = 6
          WordWrap = True
          OnClick = btnConsultarBaixaClick
        end
        object btnRecuperarImpostosDI: TButton
          Left = 15
          Top = 279
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
          TabOrder = 7
          WordWrap = True
          OnClick = btnRecuperarImpostosDIClick
        end
        object btnDesbloquearPgmto: TButton
          Left = 15
          Top = 327
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Desbloquear'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Visible = False
          OnClick = btnDesbloquearPgmtoClick
        end
      end
      inherited pnlGrid: TPanel
        Width = 861
        Height = 527
        Color = 16119285
        ParentBackground = False
        ExplicitWidth = 861
        ExplicitHeight = 527
        inherited SplitterGridDetail: TSplitter
          Top = 185
          Width = 861
          Align = alTop
          ExplicitTop = 358
          ExplicitWidth = 873
        end
        inherited cxGridDetailList: TcxGrid [1]
          Top = 189
          Width = 861
          Height = 338
          Align = alClient
          TabOrder = 0
          ExplicitTop = 189
          ExplicitWidth = 861
          ExplicitHeight = 338
          inherited cxGridDBTableViewDetailList: TcxGridDBTableView
            object cxGridDBTableViewDetailListId: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
              Width = 55
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
          Width = 861
          Height = 181
          Align = alTop
          TabOrder = 2
          ExplicitWidth = 861
          ExplicitHeight = 181
          inherited cxGridDBTableView: TcxGridDBTableView
            DataController.DataModeController.GridMode = False
            DataController.DataModeController.SmartRefresh = True
            object cxGridDBTableViewId: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
              Width = 51
            end
            object cxGridDBTableViewlook_Status: TcxGridDBColumn
              DataBinding.FieldName = 'look_Status'
              Width = 164
            end
            object cxGridDBTableViewBeneficiaryIdName: TcxGridDBColumn
              DataBinding.FieldName = 'BeneficiaryId.Name'
              Width = 297
            end
            object cxGridDBTableViewCashrequesttotal: TcxGridDBColumn
              DataBinding.FieldName = 'Paymenttotal'
              Width = 83
            end
            object cxGridDBTableViewCreated: TcxGridDBColumn
              DataBinding.FieldName = 'Created'
              Width = 124
            end
            object cxGridDBTableViewReceiveddate: TcxGridDBColumn
              DataBinding.FieldName = 'Receiveddate'
              Width = 81
            end
            object cxGridDBTableViewSeniorkey: TcxGridDBColumn
              DataBinding.FieldName = 'Seniorkey'
              Width = 72
            end
            object cxGridDBTableViewSeniorsubkey: TcxGridDBColumn
              DataBinding.FieldName = 'Seniorsubkey'
              Width = 95
            end
            object cxGridDBTableViewUserIdName: TcxGridDBColumn
              DataBinding.FieldName = 'UserId.Name'
              Width = 154
            end
            object cxGridDBTableViewcalc_Faturado: TcxGridDBColumn
              DataBinding.FieldName = 'calc_Faturado'
              Width = 60
            end
          end
        end
        inherited pnlStyle1: TPanel
          Width = 861
          TabOrder = 1
          ExplicitWidth = 861
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 28
      ExplicitWidth = 964
      ExplicitHeight = 527
      inherited pnlEditButon: TPanel
        Left = 861
        Height = 527
        ExplicitLeft = 861
        ExplicitHeight = 527
        inherited btnCancelar: TButton
          Caption = '&Cancelar'
        end
        inherited btnSalvar: TButton
          Caption = '&Salvar'
        end
      end
      inherited pnlFundo: TPanel
        Width = 861
        Height = 527
        ExplicitWidth = 861
        ExplicitHeight = 527
        inherited pnlStyle2: TPanel
          Width = 861
          ExplicitWidth = 861
        end
        inherited pnlDetails: TPanel
          Width = 861
          Height = 523
          ExplicitWidth = 861
          ExplicitHeight = 523
          inherited SplitterDetail: TSplitter
            Top = 310
            Width = 861
            ExplicitTop = 310
            ExplicitWidth = 873
          end
          inherited PanelDetail: TPanel
            Top = 314
            Width = 861
            Height = 209
            ExplicitTop = 314
            ExplicitWidth = 861
            ExplicitHeight = 209
            inherited pgDetails: TPageControl
              Width = 861
              Height = 209
              ExplicitWidth = 861
              ExplicitHeight = 209
              inherited tbsDetail1: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 28
                ExplicitWidth = 853
                ExplicitHeight = 177
                inherited PageControlDetail: TPageControl
                  Width = 853
                  Height = 177
                  ActivePage = tshDetailEdit
                  ExplicitWidth = 853
                  ExplicitHeight = 177
                  inherited tshDetailGrid: TTabSheet
                    ExplicitTop = 25
                    ExplicitWidth = 845
                    ExplicitHeight = 148
                    inherited pnlEditButonDetail: TPanel
                      Left = 754
                      Height = 148
                      ExplicitLeft = 754
                      ExplicitHeight = 148
                      DesignSize = (
                        91
                        148)
                      inherited btnDetailIncluir: TButton
                        Caption = '&Incluir'
                      end
                      inherited btnDetailAlterar: TButton
                        Caption = '&Alterar'
                      end
                      inherited btnDetailConsultar: TButton
                        Top = 193
                        Visible = False
                        ExplicitTop = 193
                      end
                      inherited btnDetailExcluir: TButton
                        Top = 65
                        ExplicitTop = 65
                      end
                      inherited cbxAltRapidaDetail: TCheckBox
                        Top = 168
                        ExplicitTop = 168
                      end
                    end
                    inherited cxGridDetail: TcxGrid
                      Width = 754
                      Height = 148
                      ExplicitWidth = 754
                      ExplicitHeight = 148
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
                        object cxGridDBTableViewDetailItemIdType_: TcxGridDBColumn
                          DataBinding.FieldName = 'ItemId.Type_'
                        end
                      end
                    end
                  end
                  inherited tshDetailEdit: TTabSheet
                    ExplicitTop = 25
                    ExplicitWidth = 845
                    ExplicitHeight = 148
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
                    inherited Panel8: TPanel
                      Left = 754
                      Height = 148
                      TabOrder = 4
                      ExplicitLeft = 754
                      ExplicitHeight = 148
                      DesignSize = (
                        91
                        148)
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
                      TabOrder = 3
                    end
                    object dbedtPrice: TDBEdit
                      Left = 16
                      Top = 134
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
                      Properties.ListSource = dsItem
                      Properties.MaxLength = 150
                      Style.BorderStyle = ebsUltraFlat
                      Style.ButtonStyle = btsDefault
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
                      Properties.ListSource = dsItem
                      TabOrder = 0
                      Width = 65
                    end
                  end
                end
              end
            end
          end
          inherited pnlMaster: TPanel
            Width = 861
            Height = 310
            ExplicitWidth = 861
            ExplicitHeight = 310
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
              Left = 337
              Top = 17
              Width = 67
              Height = 14
              Caption = 'Data Cria'#231#227'o'
            end
            object Label12: TLabel
              Left = 19
              Top = 265
              Width = 101
              Height = 14
              Caption = 'Data Recebimento'
            end
            object Label13: TLabel
              Left = 19
              Top = 164
              Width = 63
              Height = 14
              Caption = 'Valor Total '
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
            object Label20: TLabel
              Left = 176
              Top = 118
              Width = 75
              Height = 14
              Caption = 'C'#243'd. ERP Sub'
            end
            object Label23: TLabel
              Left = 19
              Top = 213
              Width = 58
              Height = 14
              Caption = 'Favorecido'
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
              TabOrder = 5
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
              TabOrder = 10
            end
            object dbedtdtCriacao: TDBEdit
              Left = 337
              Top = 33
              Width = 142
              Height = 22
              TabStop = False
              Color = 14935011
              DataField = 'Created'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 7
            end
            object dbedtDtRecebimento: TDBEdit
              Left = 19
              Top = 281
              Width = 142
              Height = 22
              TabStop = False
              Color = 14935011
              DataField = 'Receiveddate'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 4
            end
            object dbedtValorTotal: TDBEdit
              Left = 19
              Top = 184
              Width = 142
              Height = 22
              TabStop = False
              Color = 14935011
              DataField = 'Paymenttotal'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 12
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
              TabOrder = 8
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
              TabOrder = 9
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
              TabOrder = 6
            end
            object dbedtSeniorKeySub: TDBEdit
              Left = 176
              Top = 134
              Width = 142
              Height = 22
              TabStop = False
              Color = 14935011
              DataField = 'Seniorsubkey'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 11
            end
            object dbcbFavorecido: TcxDBLookupComboBox
              Left = 89
              Top = 229
              DataBinding.DataField = 'BeneficiaryId'
              DataBinding.DataSource = dtsMain
              Properties.ClearKey = 46
              Properties.DropDownSizeable = True
              Properties.DropDownWidth = 800
              Properties.GridMode = True
              Properties.ImmediateDropDownWhenActivated = True
              Properties.ImmediatePost = True
              Properties.KeyFieldNames = 'Self'
              Properties.ListColumns = <
                item
                  Width = 500
                  FieldName = 'Name'
                end
                item
                  Width = 130
                  FieldName = 'CNPJ'
                end>
              Properties.ListSource = dtsFavorecido
              Properties.MaxLength = 100
              Style.BorderStyle = ebsUltraFlat
              Style.ButtonStyle = btsDefault
              TabOrder = 1
              Width = 357
            end
            object dbcbFavorecidoCod: TcxDBLookupComboBox
              Left = 19
              Top = 229
              DataBinding.DataField = 'BeneficiaryId'
              DataBinding.DataSource = dtsMain
              Properties.ImmediateDropDownWhenActivated = True
              Properties.ImmediatePost = True
              Properties.KeyFieldNames = 'Self'
              Properties.ListColumns = <
                item
                  FieldName = 'Id'
                end>
              Properties.ListSource = dtsFavorecido
              TabOrder = 0
              Width = 65
            end
            object rgNome: TRadioButton
              Left = 330
              Top = 206
              Width = 53
              Height = 17
              Caption = 'Nome'
              Checked = True
              TabOrder = 2
              TabStop = True
              OnClick = rgNomeClick
            end
            object rgCnpj: TRadioButton
              Left = 395
              Top = 206
              Width = 51
              Height = 17
              Caption = 'CNPJ'
              TabOrder = 3
              OnClick = rgNomeClick
            end
          end
        end
      end
    end
  end
  inline framePesquisaProc: TFrameWalletPesquisaProcesso [3]
    Left = 0
    Top = 0
    Width = 972
    Height = 44
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 972
    ExplicitHeight = 44
    inherited pnlFiltroProcesso: TPanel
      Width = 865
      Height = 44
      ExplicitWidth = 865
      ExplicitHeight = 44
      inherited pnlStyle1: TPanel
        Width = 865
        ExplicitWidth = 865
      end
      inherited pnlFiltroProc: TPanel
        Width = 865
        ExplicitWidth = 865
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
        Width = 865
        ExplicitWidth = 865
        inherited pnlStyle2: TPanel
          Width = 865
          ExplicitWidth = 865
        end
      end
    end
    inherited pnlBuscarProcesso: TPanel
      Left = 865
      Height = 44
      ExplicitLeft = 865
      ExplicitHeight = 44
    end
    inherited adsProcesso: TAureliusDataset
      AfterOpen = framePesquisaProcadsProcessoAfterOpen
      AfterClose = framePesquisaProcadsProcessoAfterClose
      DesignClass = 'MyEntitiesV2.TCustomclearance'
    end
    inherited dtsProcesso: TDataSource
      Top = 95
    end
    inherited adsProduto: TAureliusDataset
      DesignClass = 'MyEntitiesV2.TProduct'
    end
    inherited adsUnidade: TAureliusDataset
      DesignClass = 'MyEntitiesV2.TBranch'
    end
  end
  inherited dtsMain: TDataSource [4]
    Left = 536
    Top = 280
  end
  inherited dtsDetail: TDataSource [5]
    Left = 536
    Top = 328
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
        Name = 'Barcode'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Created'
        DataType = ftDateTime
      end
      item
        Name = 'Paymenttotal'
        DataType = ftFloat
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
        Name = 'Type_'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Duedate'
        DataType = ftDateTime
      end
      item
        Name = 'Seniorsubkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ApproveduserId'
        DataType = ftVariant
      end
      item
        Name = 'ApproveduserId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'ApproveduserId.Gender'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ApproveduserId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ApproveduserId.Password'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ApproveduserId.Status'
        DataType = ftBoolean
      end
      item
        Name = 'ApproveduserId.Username'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ApproveduserId.FinancialAuth'
        DataType = ftBoolean
      end
      item
        Name = 'ApproveduserId.BranchId'
        DataType = ftVariant
      end
      item
        Name = 'BeneficiaryId'
        DataType = ftVariant
      end
      item
        Name = 'BeneficiaryId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'BeneficiaryId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BeneficiaryId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BeneficiaryId.Taxid'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BeneficiaryId.AccountList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'BeneficiaryId.PaymentrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'BillingId'
        DataType = ftVariant
      end
      item
        Name = 'BillingId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'BillingId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BillingId.Created'
        DataType = ftDateTime
      end
      item
        Name = 'BillingId.Duedate'
        DataType = ftDateTime
      end
      item
        Name = 'BillingId.Invoicereceivertype'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BillingId.Obs'
        DataType = ftWideMemo
      end
      item
        Name = 'BillingId.Seniordatenfe'
        DataType = ftDateTime
      end
      item
        Name = 'BillingId.Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BillingId.Status'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BillingId.Type_'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BillingId.Irretained'
        DataType = ftBoolean
      end
      item
        Name = 'BillingId.Ir'
        DataType = ftFloat
      end
      item
        Name = 'BillingId.Total'
        DataType = ftFloat
      end
      item
        Name = 'BillingId.Valortibutavel'
        DataType = ftFloat
      end
      item
        Name = 'BillingId.Cofins'
        DataType = ftFloat
      end
      item
        Name = 'BillingId.Iss'
        DataType = ftFloat
      end
      item
        Name = 'BillingId.NrNota'
        DataType = ftLargeint
      end
      item
        Name = 'BillingId.BranchId'
        DataType = ftVariant
      end
      item
        Name = 'BillingId.UserId'
        DataType = ftVariant
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
        Name = 'JoinItemPaymentRequested'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    AfterOpen = adsMainAfterOpen
    BeforeClose = adsMainBeforeClose
    AfterInsert = adsMainAfterInsert
    AfterScroll = adsMainAfterScroll
    OnCalcFields = adsMainCalcFields
    SubpropsDepth = 2
    SyncSubprops = True
    Left = 560
    Top = 280
    DesignClass = 'MyEntitiesV2.TPaymentrequested'
    object adsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsMainId: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Id'
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
    object adsMainDuedate: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'Duedate'
      EditMask = '99/99/9999'
    end
    object adsMainSeniorkey: TStringField
      DisplayLabel = 'C'#243'd. ERP'
      FieldName = 'Seniorkey'
      Size = 255
    end
    object adsMainSeniorsubkey: TStringField
      DisplayLabel = 'C'#243'd. ERP Sub'
      FieldName = 'Seniorsubkey'
      Size = 255
    end
    object adsMainUserId: TAureliusEntityField
      FieldName = 'UserId'
    end
    object adsMainApproveduserId: TAureliusEntityField
      FieldName = 'ApproveduserId'
    end
    object adsMainStatus: TStringField
      FieldName = 'Status'
      Size = 255
    end
    object adsMainType_: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Type_'
      Size = 255
    end
    object adsMainPaymenttotal: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'Paymenttotal'
      DisplayFormat = '#,##0.00'
    end
    object adsMainBarcode: TStringField
      FieldName = 'Barcode'
      Size = 255
    end
    object adsMainBeneficiaryId: TAureliusEntityField
      DisplayLabel = 'Favorecido'
      FieldName = 'BeneficiaryId'
      Required = True
    end
    object adsMainBillingId: TAureliusEntityField
      DisplayLabel = 'Fatura'
      FieldName = 'BillingId'
    end
    object adsMainBranchId: TAureliusEntityField
      FieldName = 'BranchId'
    end
    object adsMainCustomclearanceId: TAureliusEntityField
      FieldName = 'CustomclearanceId'
    end
    object adsMainCustomclearanceIdId: TLargeintField
      FieldName = 'CustomclearanceId.Id'
      ReadOnly = True
    end
    object adsMainCustomclearanceIdCustomid: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'CustomclearanceId.Customid'
      Size = 255
    end
    object adsMainCustomerId: TAureliusEntityField
      FieldName = 'CustomerId'
    end
    object adsMainProductId: TAureliusEntityField
      FieldName = 'ProductId'
    end
    object adsMainServiceId: TAureliusEntityField
      FieldName = 'ServiceId'
    end
    object adsMainUserIdName: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'UserId.Name'
      Size = 255
    end
    object adsMainApproveduserIdName: TStringField
      DisplayLabel = 'Usu'#225'rio Aprova'#231#227'o'
      FieldName = 'ApproveduserId.Name'
      Size = 255
    end
    object adsMaincalcNrProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNrProcesso'
      Size = 18
      Calculated = True
    end
    object adsMainBillingIdId: TLargeintField
      DisplayLabel = 'Fatura'
      FieldName = 'BillingId.Id'
      ReadOnly = True
    end
    object adsMaincalc_Faturado: TStringField
      DisplayLabel = 'Faturado?'
      FieldKind = fkCalculated
      FieldName = 'calc_Faturado'
      Size = 1
      Calculated = True
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
    object adsMainBeneficiaryIdName: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'BeneficiaryId.Name'
      Size = 255
    end
    object adsMainBeneficiaryIdId: TLargeintField
      DisplayLabel = 'Favorecido'
      FieldName = 'BeneficiaryId.Id'
      ReadOnly = True
      Required = True
    end
    object adsMainCustomclearanceIdBalanceId: TAureliusEntityField
      FieldName = 'CustomclearanceId.BalanceId'
    end
    object adsMainCustomclearanceIdBalanceIdId: TLargeintField
      FieldName = 'CustomclearanceId.BalanceId.Id'
      ReadOnly = True
    end
    object adsMainCustomclearanceIdBalanceIdValue: TFloatField
      FieldName = 'CustomclearanceId.BalanceId.Value'
    end
    object adsMainProductIdId: TLargeintField
      FieldName = 'ProductId.Id'
      ReadOnly = True
    end
    object adsMainCustomerIdGroupIdId: TLargeintField
      FieldName = 'CustomerId.GroupId.Id'
      ReadOnly = True
    end
  end
  inherited cxGridPopupMenu: TcxGridPopupMenu [7]
    Left = 624
    Top = 400
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
        Name = 'JoinPaymentRequested'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    AfterInsert = adsDetailAfterInsert
    AfterPost = adsDetailAfterPost
    OnCalcFields = adsDetailCalcFields
    SubpropsDepth = 1
    Left = 560
    Top = 328
    DesignClass = 'MyEntitiesV2.TItempaymentrequested'
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
    object adsDetailDestino: TStringField
      FieldName = 'Destino'
      Required = True
      Size = 1
    end
    object adsDetailPrice: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'Price'
      Required = True
      DisplayFormat = '##,##0.00'
      EditFormat = '0.00'
    end
    object adsDetailItemId: TAureliusEntityField
      FieldName = 'ItemId'
      Required = True
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
    object adsDetailJoinPaymentRequested: TDataSetField
      FieldName = 'JoinPaymentRequested'
      ReadOnly = True
    end
    object adsDetailCalcDestino: TStringField
      DisplayLabel = 'Destino'
      FieldKind = fkCalculated
      FieldName = 'CalcDestino'
      Size = 30
      Calculated = True
    end
    object adsDetailItemIdType_: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'ItemId.Type_'
      Size = 1
    end
  end
  object dsItem: TDataSource
    AutoEdit = False
    DataSet = adsItem
    Left = 280
    Top = 264
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
    Left = 304
    Top = 264
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
      FieldName = 'Name'
      Size = 255
    end
    object adsItemType_: TStringField
      FieldName = 'Type_'
      Required = True
      Size = 1
    end
  end
  object dtsUsuario: TDataSource
    AutoEdit = False
    DataSet = adsUsuario
    Left = 144
    Top = 264
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
    Left = 168
    Top = 264
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
  object dtsFavorecido: TDataSource
    AutoEdit = False
    DataSet = adsFavorecido
    Left = 211
    Top = 264
  end
  object adsFavorecido: TAureliusDataset
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
        Name = 'Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Taxid'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'AccountList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    OnCalcFields = adsFavorecidoCalcFields
    Left = 235
    Top = 264
    DesignClass = 'MyEntitiesV2.TBeneficiary'
    object adsFavorecidoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsFavorecidoId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsFavorecidoAkey: TStringField
      FieldName = 'Akey'
      Size = 255
    end
    object adsFavorecidoName: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 100
      FieldName = 'Name'
      Size = 255
    end
    object adsFavorecidoTaxid: TStringField
      FieldName = 'Taxid'
      Required = True
      Size = 255
    end
    object adsFavorecidocalcCnpj: TStringField
      FieldKind = fkCalculated
      FieldName = 'CNPJ'
      Calculated = True
    end
  end
  object dtsTipoStatus: TDataSource
    AutoEdit = False
    DataSet = adsTipoStatus
    Left = 144
    Top = 320
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
    Left = 172
    Top = 320
    DesignClass = 'MyEntitiesV2.TPaymentstatus'
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
  object cdsFavorecidos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 356
    Top = 289
    object cdsFavorecidosfavorecido_Id: TIntegerField
      FieldName = 'favorecido_Id'
    end
    object cdsFavorecidoschave_pagamento: TIntegerField
      FieldName = 'chave_pagamento'
    end
  end
end
