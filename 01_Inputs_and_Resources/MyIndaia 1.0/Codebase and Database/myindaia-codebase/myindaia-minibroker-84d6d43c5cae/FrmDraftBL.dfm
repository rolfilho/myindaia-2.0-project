inherited frmCdDraftBL: TfrmCdDraftBL
  ParentCustomHint = False
  Caption = 'Draft BL'
  ClientHeight = 874
  ClientWidth = 1184
  ParentBiDiMode = False
  Position = poDesigned
  OnShow = FormShow
  ExplicitWidth = 1200
  ExplicitHeight = 912
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 17
    Width = 1184
    Height = 6
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 987
  end
  object Label48: TLabel [1]
    Left = 25
    Top = 73
    Width = 90
    Height = 16
    Caption = 'C'#243'd Mercadoria'
  end
  inherited pnlButton: TPanel
    Top = 854
    Width = 1184
    ExplicitTop = 854
    ExplicitWidth = 1184
  end
  inherited PageControl: TPageControl
    Top = 23
    Width = 1184
    Height = 831
    ExplicitTop = 23
    ExplicitWidth = 1184
    ExplicitHeight = 831
    inherited tshGrid: TTabSheet
      ExplicitWidth = 1176
      ExplicitHeight = 797
      inherited pnlButtonGrid: TPanel
        Left = 1073
        Height = 797
        ExplicitLeft = 1073
        ExplicitHeight = 797
        inherited btnConsultar: TButton
          Left = 23
          Top = 593
          Visible = False
          ExplicitLeft = 23
          ExplicitTop = 593
        end
        inherited btnExcluir: TButton
          Top = 65
          ExplicitTop = 65
        end
        inherited cbxAltRapida: TCheckBox
          Left = 15
          Top = 536
          ExplicitLeft = 15
          ExplicitTop = 536
        end
        object btnEnviarInttra: TButton
          Left = 15
          Top = 171
          Width = 75
          Height = 42
          Anchors = [akTop, akRight]
          Caption = 'Enviar  Inttra'
          TabOrder = 5
          WordWrap = True
          OnClick = btnEnviarInttraClick
        end
        object btnImprimir: TButton
          Left = 15
          Top = 107
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
          TabOrder = 6
          OnClick = btnImprimirClick
        end
        object btnenviarEmail: TButton
          Left = 22
          Top = 464
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
          TabOrder = 7
          Visible = False
          OnClick = btnenviarEmailClick
        end
        object Button1: TButton
          Left = 15
          Top = 137
          Width = 75
          Height = 28
          Anchors = [akTop, akRight]
          Caption = 'Ver XML'
          TabOrder = 8
          WordWrap = True
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 15
          Top = 219
          Width = 75
          Height = 60
          Anchors = [akTop, akRight]
          Caption = 'Consultar XML enviado'
          TabOrder = 9
          WordWrap = True
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 16
          Top = 320
          Width = 75
          Height = 25
          Caption = 'buscar'
          TabOrder = 10
          OnClick = Button3Click
        end
      end
      inherited pnlGrid: TPanel
        Width = 1073
        Height = 797
        ExplicitWidth = 1073
        ExplicitHeight = 797
        inherited SplitterGridDetail: TSplitter
          Top = 719
          Width = 1073
          ExplicitTop = 222
          ExplicitWidth = 876
        end
        inherited cxGrid: TcxGrid
          Width = 1073
          Height = 715
          ExplicitWidth = 1073
          ExplicitHeight = 715
          inherited cxGridDBTableView: TcxGridDBTableView
            object cxGridDBTableViewNrProcesso: TcxGridDBColumn
              DataBinding.FieldName = 'NrProcesso.NrProcesso'
              Width = 131
            end
            object cxGridDBTableViewNrAmend: TcxGridDBColumn
              Caption = 'Vers'#227'o'
              DataBinding.FieldName = 'NrAmend'
              Width = 100
            end
            object cxGridDBTableViewDtCriacao: TcxGridDBColumn
              DataBinding.FieldName = 'DtCriacao'
              Width = 142
            end
            object cxGridDBTableViewCdUsuarioCriacaoNmUsuario: TcxGridDBColumn
              DataBinding.FieldName = 'CdUsuarioCriacao.ApUsuario'
              Width = 178
            end
            object cxGridDBTableViewDtEnvioDraft: TcxGridDBColumn
              DataBinding.FieldName = 'DtEnvioDraft'
              Width = 100
            end
            object cxGridDBTableViewStatusEnvio: TcxGridDBColumn
              Caption = 'Status Envio'
              DataBinding.FieldName = 'StatusEnvio'
              Width = 200
            end
            object cxGridDBTableViewCdEnvioInttra: TcxGridDBColumn
              DataBinding.FieldName = 'CdEnvioInttra'
              Width = 140
            end
          end
        end
        inherited cxGridDetailList: TcxGrid
          Top = 723
          Width = 1073
          Height = 74
          ExplicitTop = 723
          ExplicitWidth = 1073
          ExplicitHeight = 74
        end
        inherited pnlStyle1: TPanel
          Width = 1073
          ExplicitWidth = 1073
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 30
      ExplicitWidth = 1176
      ExplicitHeight = 797
      inherited pnlEditButon: TPanel
        Left = 1073
        Height = 797
        ExplicitLeft = 1073
        ExplicitHeight = 797
      end
      inherited pnlFundo: TPanel
        Width = 1073
        Height = 797
        ExplicitWidth = 1073
        ExplicitHeight = 797
        inherited pnlStyle2: TPanel
          Width = 1073
          ExplicitWidth = 1073
        end
        inherited pnlDetails: TPanel
          Width = 1073
          Height = 793
          ExplicitWidth = 1073
          ExplicitHeight = 793
          inherited SplitterDetail: TSplitter
            Top = 473
            Width = 1073
            ExplicitTop = 450
            ExplicitWidth = 976
          end
          inherited PanelDetail: TPanel
            Top = 477
            Width = 1073
            Height = 316
            ExplicitTop = 477
            ExplicitWidth = 1073
            ExplicitHeight = 316
            inherited pgDetails: TPageControl
              Width = 1073
              Height = 316
              Visible = False
              ExplicitWidth = 1073
              ExplicitHeight = 316
              inherited tbsDetail1: TTabSheet
                Caption = 'Containers'
                ExplicitLeft = 4
                ExplicitTop = 30
                ExplicitWidth = 1065
                ExplicitHeight = 282
                inherited PageControlDetail: TPageControl
                  Width = 1065
                  Height = 282
                  ActivePage = tshDetailEdit
                  ExplicitWidth = 1065
                  ExplicitHeight = 282
                  inherited tshDetailGrid: TTabSheet
                    ExplicitWidth = 1057
                    ExplicitHeight = 251
                    inherited pnlEditButonDetail: TPanel
                      Left = 966
                      Height = 251
                      ExplicitLeft = 966
                      ExplicitHeight = 251
                      inherited btnDetailConsultar: TButton
                        Left = 6
                        Top = 161
                        Visible = False
                        ExplicitLeft = 6
                        ExplicitTop = 161
                      end
                      inherited btnDetailExcluir: TButton
                        Top = 65
                        ExplicitTop = 65
                      end
                    end
                    inherited cxGridDetail: TcxGrid
                      Width = 966
                      Height = 251
                      ExplicitWidth = 966
                      ExplicitHeight = 251
                      inherited cxGridDBTableViewDetail: TcxGridDBTableView
                        object cxGridDBTableViewDetailNrCntr: TcxGridDBColumn
                          DataBinding.FieldName = 'NrCntr'
                        end
                        object cxGridDBTableViewDetailNrLacre: TcxGridDBColumn
                          DataBinding.FieldName = 'NrLacre'
                          Width = 146
                        end
                        object cxGridDBTableViewDetailNrLacreSif: TcxGridDBColumn
                          DataBinding.FieldName = 'NrLacreSif'
                          Width = 130
                        end
                        object cxGridDBTableViewDetailNmTpCntr: TcxGridDBColumn
                          DataBinding.FieldName = 'NmTpCntr'
                        end
                        object cxGridDBTableViewDetailDsTemperatura: TcxGridDBColumn
                          DataBinding.FieldName = 'DsTemperatura'
                          Width = 96
                        end
                        object cxGridDBTableViewDetailTaraCntr: TcxGridDBColumn
                          DataBinding.FieldName = 'TaraCntr'
                        end
                        object cxGridDBTableViewDetailVlCubagem: TcxGridDBColumn
                          DataBinding.FieldName = 'VlCubagem'
                        end
                      end
                    end
                  end
                  inherited tshDetailEdit: TTabSheet
                    ExplicitWidth = 1057
                    ExplicitHeight = 251
                    object Label43: TLabel [0]
                      Left = 17
                      Top = 16
                      Width = 76
                      Height = 16
                      Caption = 'Nr. Container'
                    end
                    object Label44: TLabel [1]
                      Left = 119
                      Top = 16
                      Width = 84
                      Height = 16
                      Caption = 'Tipo Container'
                    end
                    object Label45: TLabel [2]
                      Left = 17
                      Top = 64
                      Width = 31
                      Height = 16
                      Caption = 'Lacre'
                    end
                    object Label46: TLabel [3]
                      Left = 447
                      Top = 17
                      Width = 75
                      Height = 16
                      Caption = 'Temperatura'
                    end
                    object Label47: TLabel [4]
                      Left = 222
                      Top = 162
                      Width = 27
                      Height = 16
                      Caption = 'Tara'
                    end
                    object Label49: TLabel [5]
                      Left = 343
                      Top = 162
                      Width = 54
                      Height = 16
                      Caption = 'Cubagem'
                    end
                    object Label50: TLabel [6]
                      Left = 119
                      Top = 65
                      Width = 54
                      Height = 16
                      Caption = 'Lacre SIF'
                    end
                    object Label51: TLabel [7]
                      Left = 343
                      Top = 16
                      Width = 51
                      Height = 16
                      Caption = 'C'#243'd. ISO'
                    end
                    object Label58: TLabel [8]
                      Left = 616
                      Top = 16
                      Width = 111
                      Height = 16
                      Caption = 'Descri'#231#227'o da Carga'
                    end
                    object Label59: TLabel [9]
                      Left = 233
                      Top = 64
                      Width = 26
                      Height = 16
                      Caption = 'NCM'
                    end
                    object Label60: TLabel [10]
                      Left = 17
                      Top = 113
                      Width = 97
                      Height = 16
                      Caption = 'C'#243'd. Embalagem'
                    end
                    object Label61: TLabel [11]
                      Left = 119
                      Top = 113
                      Width = 126
                      Height = 16
                      Caption = 'Descri'#231#227'o Embalagem'
                    end
                    object Label62: TLabel [12]
                      Left = 343
                      Top = 113
                      Width = 102
                      Height = 16
                      Caption = 'Qtde. Embalagem'
                    end
                    object Label63: TLabel [13]
                      Left = 17
                      Top = 162
                      Width = 54
                      Height = 16
                      Caption = 'Cubagem'
                    end
                    object Label64: TLabel [14]
                      Left = 119
                      Top = 162
                      Width = 61
                      Height = 16
                      Caption = 'Peso Bruto'
                    end
                    object lblExcessoCntr: TLabel [15]
                      Left = 447
                      Top = 162
                      Width = 151
                      Height = 16
                      Caption = 'Excesso no container (cm)'
                      Visible = False
                    end
                    object Label11: TLabel [16]
                      Left = 543
                      Top = 19
                      Width = 45
                      Height = 13
                      Caption = 'Ex: -18.0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clGrayText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    inherited Panel8: TPanel
                      Left = 966
                      Height = 251
                      ExplicitLeft = 966
                      ExplicitHeight = 251
                    end
                    object DBEdit44: TDBEdit
                      Left = 17
                      Top = 35
                      Width = 96
                      Height = 24
                      Color = clWhite
                      DataField = 'NrCntr'
                      DataSource = dtsDetail
                      TabOrder = 1
                    end
                    object DBEdit45: TDBEdit
                      Left = 119
                      Top = 35
                      Width = 218
                      Height = 24
                      Color = clWhite
                      DataField = 'NmTpCntr'
                      DataSource = dtsDetail
                      TabOrder = 2
                    end
                    object DBEdit46: TDBEdit
                      Left = 17
                      Top = 82
                      Width = 96
                      Height = 24
                      Color = clWhite
                      DataField = 'NrLacre'
                      DataSource = dtsDetail
                      TabOrder = 3
                    end
                    object DBEdit48: TDBEdit
                      Left = 447
                      Top = 35
                      Width = 146
                      Height = 24
                      Color = clWhite
                      DataField = 'DsTemperatura'
                      DataSource = dtsDetail
                      TabOrder = 4
                      OnKeyPress = DBEdit48KeyPress
                    end
                    object DBEdit49: TDBEdit
                      Left = 222
                      Top = 179
                      Width = 115
                      Height = 24
                      Color = clWhite
                      DataField = 'TaraCntr'
                      DataSource = dtsDetail
                      TabOrder = 5
                      OnKeyPress = DBEdit49KeyPress
                    end
                    object DBEdit50: TDBEdit
                      Left = 343
                      Top = 179
                      Width = 96
                      Height = 24
                      Color = clWhite
                      DataField = 'VlCubagem'
                      DataSource = dtsDetail
                      TabOrder = 6
                      OnKeyPress = DBEdit50KeyPress
                    end
                    object DBEdit51: TDBEdit
                      Left = 119
                      Top = 82
                      Width = 108
                      Height = 24
                      Color = clWhite
                      DataField = 'NrLacreSif'
                      DataSource = dtsDetail
                      TabOrder = 7
                    end
                    object DBEdit52: TDBEdit
                      Left = 343
                      Top = 35
                      Width = 98
                      Height = 24
                      Color = clWhite
                      DataField = 'CdIso'
                      DataSource = dtsDetail
                      TabOrder = 8
                    end
                    object txtCargoDescription: TDBMemo
                      Left = 616
                      Top = 35
                      Width = 338
                      Height = 213
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      DataField = 'DsCarga'
                      DataSource = dtsDetail
                      TabOrder = 9
                    end
                    object DBEdit57: TDBEdit
                      Left = 233
                      Top = 82
                      Width = 104
                      Height = 24
                      Color = clWhite
                      DataField = 'CdNcm'
                      DataSource = dtsDetail
                      TabOrder = 10
                      OnKeyPress = DBEdit48KeyPress
                    end
                    object DBEdit58: TDBEdit
                      Left = 17
                      Top = 131
                      Width = 96
                      Height = 24
                      Color = clWhite
                      DataField = 'CdEmbalagem'
                      DataSource = dtsDetail
                      TabOrder = 11
                      OnKeyPress = DBEdit48KeyPress
                    end
                    object DBEdit59: TDBEdit
                      Left = 119
                      Top = 131
                      Width = 218
                      Height = 24
                      Color = clWhite
                      DataField = 'DsEmbalagem'
                      DataSource = dtsDetail
                      TabOrder = 12
                      OnKeyPress = DBEdit48KeyPress
                    end
                    object DBEdit60: TDBEdit
                      Left = 343
                      Top = 131
                      Width = 98
                      Height = 24
                      Color = clWhite
                      DataField = 'QtEmbalagem'
                      DataSource = dtsDetail
                      TabOrder = 13
                      OnKeyPress = DBEdit48KeyPress
                    end
                    object DBEdit61: TDBEdit
                      Left = 17
                      Top = 181
                      Width = 97
                      Height = 24
                      Color = clWhite
                      DataField = 'VlCubagem'
                      DataSource = dtsDetail
                      TabOrder = 14
                      OnKeyPress = DBEdit48KeyPress
                    end
                    object DBEdit62: TDBEdit
                      Left = 119
                      Top = 181
                      Width = 97
                      Height = 24
                      Color = clWhite
                      DataField = 'QtPesoBruto'
                      DataSource = dtsDetail
                      TabOrder = 15
                      OnKeyPress = DBEdit48KeyPress
                    end
                    object edtExcessoCntr: TDBEdit
                      Left = 447
                      Top = 179
                      Width = 150
                      Height = 24
                      Color = clWhite
                      DataField = 'VlExcessoCntr'
                      DataSource = dtsDetail
                      TabOrder = 16
                      Visible = False
                      OnKeyPress = DBEdit50KeyPress
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'Mercadorias'
                ImageIndex = 1
                TabVisible = False
                inline frameDraftBLMercadoria: TframeDraftBLMercadoria
                  Left = 0
                  Top = 0
                  Width = 1065
                  Height = 282
                  Align = alClient
                  Color = clWhite
                  ParentBackground = False
                  ParentColor = False
                  TabOrder = 0
                  ExplicitWidth = 1065
                  ExplicitHeight = 282
                  inherited PageControl: TPageControl
                    Width = 1065
                    Height = 282
                    ActivePage = frameDraftBLMercadoria.tshGrid
                    ExplicitWidth = 1065
                    ExplicitHeight = 282
                    inherited tshGrid: TTabSheet
                      ExplicitWidth = 1057
                      ExplicitHeight = 253
                      inherited Panel2: TPanel
                        Left = 966
                        Height = 253
                        ExplicitLeft = 966
                        ExplicitHeight = 253
                        inherited btnIncluir: TButton
                          OnClick = frameDraftBLMercadoriabtnIncluirClick
                        end
                        inherited btnAlterar: TButton
                          OnClick = frameDraftBLMercadoriabtnAlterarClick
                        end
                        inherited btnExcluir: TButton
                          OnClick = frameDraftBLMercadoriabtnExcluirClick
                        end
                      end
                      inherited pnlGrid: TPanel
                        Width = 966
                        Height = 253
                        ExplicitWidth = 966
                        ExplicitHeight = 253
                        inherited cxGridD: TcxGrid
                          Width = 966
                          Height = 253
                          ExplicitWidth = 966
                          ExplicitHeight = 253
                        end
                      end
                    end
                    inherited tshEdit: TTabSheet
                      ExplicitLeft = 4
                      ExplicitTop = 25
                      inherited Panel3: TPanel
                        inherited btnCancelar: TButton
                          OnClick = frameDraftBLMercadoriabtnCancelarClick
                        end
                        inherited btnSalvar: TButton
                          OnClick = frameDraftBLMercadoriabtnSalvarClick
                        end
                      end
                      inherited Panel1: TPanel
                        inherited pblFundoCampos: TPanel
                          inherited SplitterDetail: TSplitter
                            Top = 216
                            ExplicitTop = 216
                            ExplicitWidth = 867
                          end
                          inherited pnlMaster: TPanel
                            Height = 215
                            ExplicitHeight = 215
                          end
                          inherited pgDetails: TPageControl
                            Top = 220
                            Height = 348
                            ExplicitTop = 220
                            ExplicitHeight = 348
                            inherited TabSheet1: TTabSheet
                              ExplicitHeight = 316
                              inherited frameDraftBLMercContainer: TFramDraftBLMercContainer
                                Height = 316
                                ExplicitHeight = 316
                                inherited PageControl: TPageControl
                                  Height = 316
                                  ExplicitHeight = 316
                                  inherited tshGrid: TTabSheet
                                    ExplicitHeight = 287
                                    inherited Panel2: TPanel
                                      Height = 287
                                      ExplicitHeight = 287
                                    end
                                    inherited pnlGrid: TPanel
                                      Height = 287
                                      ExplicitHeight = 287
                                      inherited cxGridD: TcxGrid
                                        Height = 287
                                        ExplicitHeight = 287
                                      end
                                    end
                                  end
                                  inherited tshEdit: TTabSheet
                                    ExplicitLeft = 4
                                    ExplicitTop = 25
                                    ExplicitWidth = 683
                                    ExplicitHeight = 230
                                    inherited Panel1: TPanel
                                      inherited dbcbPrepaindCollect: TcxDBLookupComboBox
                                        Properties.ListSource = dtsDetail
                                        ExplicitHeight = 22
                                      end
                                    end
                                  end
                                end
                                inherited adsDetailx: TAureliusDataset
                                  DesignClass = 'MyEntitiesBroker.TTprocessoDraftMercCntr'
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                  inherited adsDetailx: TAureliusDataset
                    DesignClass = 'MyEntitiesBroker.TTprocessoDraftMerc'
                  end
                end
              end
              object TabSheet6: TTabSheet
                Caption = 'Coment'#225'rios'
                ImageIndex = 3
                inline frameDraftBLComentarios: TframeDraftBLComentarios
                  Left = 0
                  Top = 0
                  Width = 1065
                  Height = 282
                  Align = alClient
                  Color = clWhite
                  ParentBackground = False
                  ParentColor = False
                  TabOrder = 0
                  ExplicitWidth = 1065
                  ExplicitHeight = 282
                  inherited PageControl: TPageControl
                    Width = 1065
                    Height = 282
                    ActivePage = frameDraftBLComentarios.tshGrid
                    ExplicitWidth = 1065
                    ExplicitHeight = 282
                    inherited tshGrid: TTabSheet
                      ExplicitWidth = 1057
                      ExplicitHeight = 253
                      inherited Panel2: TPanel
                        Left = 966
                        Height = 253
                        ExplicitLeft = 966
                        ExplicitHeight = 253
                        inherited btnIncluir: TButton
                          OnClick = frameDetailComentariosbtnIncluirClick
                        end
                        inherited btnAlterar: TButton
                          OnClick = frameDetailComentariosbtnAlterarClick
                        end
                        inherited btnExcluir: TButton
                          OnClick = frameDetailComentariosbtnExcluirClick
                        end
                      end
                      inherited pnlGrid: TPanel
                        Width = 966
                        Height = 253
                        ExplicitWidth = 966
                        ExplicitHeight = 253
                        inherited cxGridD: TcxGrid
                          Width = 966
                          Height = 253
                          ExplicitWidth = 966
                          ExplicitHeight = 253
                        end
                      end
                    end
                    inherited tshEdit: TTabSheet
                      inherited Panel3: TPanel
                        inherited btnCancelar: TButton
                          OnClick = frameDetailComentariosbtnCancelarClick
                        end
                        inherited btnSalvar: TButton
                          OnClick = frameDetailComentariosbtnSalvarClick
                        end
                      end
                      inherited Panel1: TPanel
                        inherited dbcbItemCod: TcxDBLookupComboBox
                          ExplicitHeight = 22
                        end
                        inherited dbcbItem: TcxDBLookupComboBox
                          ExplicitHeight = 22
                        end
                      end
                    end
                  end
                  inherited adsDetailx: TAureliusDataset
                    DesignClass = 'MyEntitiesBroker.TTprocessoDraftComentarios'
                  end
                  inherited adsTpComentario: TAureliusDataset
                    DesignClass = 'MyEntitiesBroker.TTprocessoDraftComentarios'
                  end
                end
              end
            end
          end
          inherited pnlMaster: TPanel
            Width = 1073
            Height = 473
            ExplicitWidth = 1073
            ExplicitHeight = 473
            object pgCamposMaster: TPageControl
              Left = 0
              Top = 0
              Width = 1073
              Height = 473
              ActivePage = TabSheet1
              Align = alClient
              TabOrder = 0
              object TabSheet1: TTabSheet
                Caption = 'Geral'
                object Panel1: TPanel
                  Left = 0
                  Top = 0
                  Width = 1065
                  Height = 442
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label14: TLabel
                    Left = 289
                    Top = 17
                    Width = 43
                    Height = 16
                    Caption = 'Usu'#225'rio'
                  end
                  object Label13: TLabel
                    Left = 151
                    Top = 17
                    Width = 61
                    Height = 16
                    Caption = 'Nr. Vers'#227'o'
                  end
                  object Label1: TLabel
                    Left = 19
                    Top = 16
                    Width = 51
                    Height = 16
                    Caption = 'Processo'
                  end
                  object Label17: TLabel
                    Left = 554
                    Top = 17
                    Width = 82
                    Height = 16
                    Caption = 'Dt. Envio Draft'
                  end
                  object Label18: TLabel
                    Left = 691
                    Top = 17
                    Width = 77
                    Height = 16
                    Caption = 'C'#243'd. SI Inttra'
                  end
                  object Label19: TLabel
                    Left = 424
                    Top = 17
                    Width = 63
                    Height = 16
                    Caption = 'Dt. Cria'#231#227'o'
                  end
                  object DBEdit2: TDBEdit
                    Left = 289
                    Top = 34
                    Width = 121
                    Height = 24
                    Color = 14935011
                    DataField = 'calc_Usuario'
                    DataSource = dtsMain
                    ReadOnly = True
                    TabOrder = 0
                  end
                  object DBEdit1: TDBEdit
                    Left = 151
                    Top = 34
                    Width = 121
                    Height = 24
                    Color = 14935011
                    DataField = 'NrAmend'
                    DataSource = dtsMain
                    ReadOnly = True
                    TabOrder = 1
                  end
                  object dbedtId: TDBEdit
                    Left = 19
                    Top = 33
                    Width = 121
                    Height = 24
                    Color = 14935011
                    DataField = 'calc_Processo'
                    DataSource = dtsMain
                    ReadOnly = True
                    TabOrder = 2
                  end
                  object DBEdit10: TDBEdit
                    Left = 554
                    Top = 33
                    Width = 121
                    Height = 24
                    Color = 14935011
                    DataField = 'DtEnvioDraft'
                    DataSource = dtsMain
                    ReadOnly = True
                    TabOrder = 3
                  end
                  object DBEdit11: TDBEdit
                    Left = 691
                    Top = 33
                    Width = 121
                    Height = 24
                    Color = 14935011
                    DataField = 'CdEnvioInttra'
                    DataSource = dtsMain
                    TabOrder = 4
                  end
                  object DBEdit12: TDBEdit
                    Left = 424
                    Top = 33
                    Width = 121
                    Height = 24
                    Color = 14935011
                    DataField = 'DtCriacao'
                    DataSource = dtsMain
                    ReadOnly = True
                    TabOrder = 5
                  end
                  object GroupBox10: TGroupBox
                    Left = 761
                    Top = 130
                    Width = 203
                    Height = 109
                    TabOrder = 6
                    object Label24: TLabel
                      Left = 9
                      Top = 55
                      Width = 43
                      Height = 16
                      Caption = 'Viagem'
                    end
                    object Label54: TLabel
                      Left = 9
                      Top = 7
                      Width = 31
                      Height = 16
                      Caption = 'Navio'
                    end
                    object DBEdit39: TDBEdit
                      Left = 7
                      Top = 25
                      Width = 184
                      Height = 24
                      Color = clWhite
                      DataField = 'NmNavio'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object DBEdit40: TDBEdit
                      Left = 9
                      Top = 72
                      Width = 97
                      Height = 24
                      Color = clWhite
                      DataField = 'NrViagem'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 1
                    end
                  end
                  object GroupBox12: TGroupBox
                    Left = 15
                    Top = 245
                    Width = 421
                    Height = 71
                    Caption = 'Local de Embarque'
                    TabOrder = 7
                    object Label52: TLabel
                      Left = 136
                      Top = 19
                      Width = 55
                      Height = 16
                      Caption = 'Descri'#231#227'o'
                    end
                    object Label53: TLabel
                      Left = 10
                      Top = 19
                      Width = 39
                      Height = 16
                      Caption = 'C'#243'digo'
                    end
                    object DBEdit41: TDBEdit
                      Left = 136
                      Top = 36
                      Width = 269
                      Height = 24
                      Color = clWhite
                      DataField = 'LocalEmbarque'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object DBEdit55: TDBEdit
                      Left = 10
                      Top = 36
                      Width = 120
                      Height = 24
                      Color = clWhite
                      DataField = 'LocalEmbarqueSigla'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 1
                    end
                  end
                  object GroupBox13: TGroupBox
                    Left = 15
                    Top = 319
                    Width = 421
                    Height = 116
                    Caption = ' Local de Desembarque '
                    TabOrder = 8
                    object Label56: TLabel
                      Left = 135
                      Top = 19
                      Width = 55
                      Height = 16
                      Caption = 'Descri'#231#227'o'
                    end
                    object Label57: TLabel
                      Left = 9
                      Top = 19
                      Width = 39
                      Height = 16
                      Caption = 'C'#243'digo'
                    end
                    object Label55: TLabel
                      Left = 9
                      Top = 64
                      Width = 23
                      Height = 16
                      Caption = 'Pa'#237's'
                    end
                    object DBEdit42: TDBEdit
                      Left = 136
                      Top = 36
                      Width = 269
                      Height = 24
                      Color = clWhite
                      DataField = 'LocalDesembarque'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object DBEdit56: TDBEdit
                      Left = 9
                      Top = 36
                      Width = 120
                      Height = 24
                      Color = clWhite
                      DataField = 'LocalDesembarqueSigla'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 1
                    end
                    object edtPaisDesembarqueDescricao: TEdit
                      Left = 9
                      Top = 81
                      Width = 206
                      Height = 24
                      ReadOnly = True
                      TabOrder = 2
                    end
                  end
                  object GroupBox5: TGroupBox
                    Left = 448
                    Top = 66
                    Width = 299
                    Height = 172
                    Caption = 'Refer'#234'ncias'
                    TabOrder = 9
                    object Label38: TLabel
                      Left = 9
                      Top = 24
                      Width = 58
                      Height = 16
                      Caption = 'Embarque'
                    end
                    object Label39: TLabel
                      Left = 9
                      Top = 72
                      Width = 98
                      Height = 16
                      Caption = 'Booking Armador'
                    end
                    object Label40: TLabel
                      Left = 9
                      Top = 120
                      Width = 24
                      Height = 16
                      Caption = 'RUC'
                    end
                    object DBEdit30: TDBEdit
                      Left = 8
                      Top = 43
                      Width = 278
                      Height = 24
                      Color = clWhite
                      DataField = 'ReferenciaEmbarque'
                      DataSource = dtsMain
                      TabOrder = 0
                    end
                    object DBEdit31: TDBEdit
                      Left = 8
                      Top = 91
                      Width = 278
                      Height = 24
                      Color = clWhite
                      DataField = 'BookingArmador'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 1
                    end
                    object DBEdit32: TDBEdit
                      Left = 8
                      Top = 139
                      Width = 278
                      Height = 24
                      Color = clWhite
                      DataField = 'CdRuc'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 2
                    end
                  end
                  object GroupBox15: TGroupBox
                    Left = 761
                    Top = 62
                    Width = 205
                    Height = 62
                    Caption = 'Contato Indai'#225
                    TabOrder = 10
                    object DBEdit47: TDBEdit
                      Left = 9
                      Top = 26
                      Width = 184
                      Height = 24
                      Color = clWhite
                      DataField = 'DsEmailIndaia'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 0
                    end
                  end
                  object GroupBox16: TGroupBox
                    Left = 448
                    Top = 319
                    Width = 518
                    Height = 116
                    Caption = 'Local de Entrega'
                    TabOrder = 11
                    object Label85: TLabel
                      Left = 9
                      Top = 61
                      Width = 23
                      Height = 16
                      Caption = 'Pa'#237's'
                    end
                    object Label86: TLabel
                      Left = 9
                      Top = 19
                      Width = 39
                      Height = 16
                      Caption = 'C'#243'digo'
                    end
                    object Label87: TLabel
                      Left = 136
                      Top = 19
                      Width = 55
                      Height = 16
                      Caption = 'Descri'#231#227'o'
                    end
                    object DBEdit54: TDBEdit
                      Left = 136
                      Top = 36
                      Width = 312
                      Height = 24
                      Color = clWhite
                      DataField = 'LocalEntrega'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object edtPaisEntregaDescricao: TEdit
                      Left = 9
                      Top = 78
                      Width = 206
                      Height = 24
                      ReadOnly = True
                      TabOrder = 1
                    end
                    object DBEdit19: TDBEdit
                      Left = 9
                      Top = 36
                      Width = 120
                      Height = 24
                      Color = clWhite
                      DataField = 'LocalEntregaSigla'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 2
                    end
                  end
                  object GroupBox18: TGroupBox
                    Left = 448
                    Top = 245
                    Width = 518
                    Height = 71
                    Caption = ' Local de Libera'#231#227'o do BL '
                    TabOrder = 12
                    object Label90: TLabel
                      Left = 135
                      Top = 19
                      Width = 55
                      Height = 16
                      Caption = 'Descri'#231#227'o'
                    end
                    object Label91: TLabel
                      Left = 9
                      Top = 19
                      Width = 39
                      Height = 16
                      Caption = 'C'#243'digo'
                    end
                    object Label92: TLabel
                      Left = 401
                      Top = 19
                      Width = 66
                      Height = 16
                      Caption = 'Pa'#237's C'#243'digo'
                    end
                    object DBEdit88: TDBEdit
                      Left = 136
                      Top = 36
                      Width = 259
                      Height = 24
                      Color = clWhite
                      DataField = 'LocalLiberacaoBlNome'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object DBEdit89: TDBEdit
                      Left = 9
                      Top = 36
                      Width = 120
                      Height = 24
                      Color = clWhite
                      DataField = 'LocalLiberacaoBlCod'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 1
                    end
                    object DBEdit90: TDBEdit
                      Left = 401
                      Top = 36
                      Width = 105
                      Height = 24
                      Color = clWhite
                      DataField = 'LocalLiberacaoBlPais'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 2
                    end
                  end
                  object GroupBox4: TGroupBox
                    Left = 17
                    Top = 67
                    Width = 421
                    Height = 172
                    Caption = 'Agente'
                    TabOrder = 13
                    object Label26: TLabel
                      Left = 9
                      Top = 24
                      Width = 33
                      Height = 16
                      Caption = 'Nome'
                    end
                    object Label27: TLabel
                      Left = 9
                      Top = 71
                      Width = 53
                      Height = 16
                      Caption = 'Endere'#231'o'
                    end
                    object Label28: TLabel
                      Left = 9
                      Top = 119
                      Width = 39
                      Height = 16
                      Caption = 'Cidade'
                    end
                    object Label29: TLabel
                      Left = 289
                      Top = 119
                      Width = 15
                      Height = 16
                      Caption = 'UF'
                    end
                    object Label31: TLabel
                      Left = 327
                      Top = 119
                      Width = 66
                      Height = 16
                      Caption = 'C'#243'digo Pa'#237's'
                    end
                    object Label30: TLabel
                      Left = 189
                      Top = 119
                      Width = 22
                      Height = 16
                      Caption = 'CEP'
                    end
                    object Label88: TLabel
                      Left = 327
                      Top = 24
                      Width = 75
                      Height = 16
                      Caption = 'C'#243'digo SCAC'
                    end
                    object DBEdit24: TDBEdit
                      Left = 9
                      Top = 43
                      Width = 312
                      Height = 24
                      Color = clWhite
                      DataField = 'AgenteNome'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object DBEdit25: TDBEdit
                      Left = 9
                      Top = 90
                      Width = 394
                      Height = 24
                      Color = clWhite
                      DataField = 'AgenteEndereco'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 1
                    end
                    object DBEdit26: TDBEdit
                      Left = 9
                      Top = 138
                      Width = 171
                      Height = 24
                      Color = clWhite
                      DataField = 'AgenteCidade'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 2
                    end
                    object DBEdit27: TDBEdit
                      Left = 289
                      Top = 138
                      Width = 32
                      Height = 24
                      Color = clWhite
                      DataField = 'AgenteEstado'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 3
                    end
                    object DBEdit29: TDBEdit
                      Left = 327
                      Top = 138
                      Width = 76
                      Height = 24
                      Color = clWhite
                      DataField = 'AgentePaisCod'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 4
                    end
                    object DBEdit22: TDBEdit
                      Left = 189
                      Top = 138
                      Width = 94
                      Height = 24
                      Color = clWhite
                      DataField = 'AgenteCep'
                      DataSource = dtsMain
                      ReadOnly = True
                      TabOrder = 5
                    end
                    object DBEdit28: TDBEdit
                      Left = 327
                      Top = 43
                      Width = 76
                      Height = 24
                      Color = clWhite
                      DataField = 'AgenteCdInttra'
                      DataSource = dtsMain
                      TabOrder = 6
                    end
                  end
                end
              end
              object TabSheet2: TTabSheet
                Caption = 'Partes 1'
                ImageIndex = 1
                object GroupBox6: TGroupBox
                  Left = 437
                  Top = 10
                  Width = 403
                  Height = 319
                  Caption = ' Consignat'#225'rio '
                  TabOrder = 0
                  object Label32: TLabel
                    Left = 9
                    Top = 24
                    Width = 33
                    Height = 16
                    Caption = 'Nome'
                  end
                  object Label33: TLabel
                    Left = 9
                    Top = 71
                    Width = 53
                    Height = 16
                    Caption = 'Endere'#231'o'
                  end
                  object Label34: TLabel
                    Left = 9
                    Top = 161
                    Width = 39
                    Height = 16
                    Caption = 'Cidade'
                  end
                  object Label35: TLabel
                    Left = 186
                    Top = 161
                    Width = 15
                    Height = 16
                    Caption = 'UF'
                  end
                  object Label37: TLabel
                    Left = 232
                    Top = 161
                    Width = 66
                    Height = 16
                    Caption = 'C'#243'digo Pa'#237's'
                  end
                  object Label36: TLabel
                    Left = 9
                    Top = 116
                    Width = 45
                    Height = 16
                    Caption = 'N'#250'mero'
                  end
                  object Label65: TLabel
                    Left = 111
                    Top = 116
                    Width = 79
                    Height = 16
                    Caption = 'Complemento'
                  end
                  object Label66: TLabel
                    Left = 9
                    Top = 206
                    Width = 50
                    Height = 16
                    Caption = 'Telefone'
                  end
                  object Label67: TLabel
                    Left = 129
                    Top = 206
                    Width = 20
                    Height = 16
                    Caption = 'Fax'
                  end
                  object Label68: TLabel
                    Left = 249
                    Top = 206
                    Width = 24
                    Height = 16
                    Caption = 'RUC'
                  end
                  object Label69: TLabel
                    Left = 9
                    Top = 253
                    Width = 20
                    Height = 16
                    Caption = 'NIT'
                  end
                  object Label70: TLabel
                    Left = 129
                    Top = 253
                    Width = 28
                    Height = 16
                    Caption = 'CUIT'
                  end
                  object DBEdit33: TDBEdit
                    Left = 9
                    Top = 43
                    Width = 312
                    Height = 24
                    Color = clWhite
                    DataField = 'ConsigNome'
                    DataSource = dtsMain
                    TabOrder = 0
                  end
                  object DBEdit34: TDBEdit
                    Left = 9
                    Top = 90
                    Width = 384
                    Height = 24
                    Color = clWhite
                    DataField = 'ConsigEndereco'
                    DataSource = dtsMain
                    TabOrder = 1
                  end
                  object DBEdit35: TDBEdit
                    Left = 9
                    Top = 178
                    Width = 171
                    Height = 24
                    Color = clWhite
                    DataField = 'ConsigCidade'
                    DataSource = dtsMain
                    TabOrder = 2
                  end
                  object DBEdit36: TDBEdit
                    Left = 186
                    Top = 178
                    Width = 40
                    Height = 24
                    Color = clWhite
                    DataField = 'ConsigEstado'
                    DataSource = dtsMain
                    TabOrder = 3
                  end
                  object DBEdit38: TDBEdit
                    Left = 232
                    Top = 178
                    Width = 66
                    Height = 24
                    Color = clWhite
                    DataField = 'ConsigPaisCod'
                    DataSource = dtsMain
                    TabOrder = 4
                  end
                  object DBEdit37: TDBEdit
                    Left = 9
                    Top = 133
                    Width = 96
                    Height = 24
                    Color = clWhite
                    DataField = 'ConsigEndNumero'
                    DataSource = dtsMain
                    TabOrder = 5
                  end
                  object DBEdit63: TDBEdit
                    Left = 111
                    Top = 133
                    Width = 282
                    Height = 24
                    Color = clWhite
                    DataField = 'ConsigEndCompl'
                    DataSource = dtsMain
                    TabOrder = 6
                  end
                  object DBEdit64: TDBEdit
                    Left = 9
                    Top = 223
                    Width = 115
                    Height = 24
                    Color = clWhite
                    DataField = 'ConsigNrTelefone'
                    DataSource = dtsMain
                    TabOrder = 7
                  end
                  object DBEdit65: TDBEdit
                    Left = 129
                    Top = 223
                    Width = 115
                    Height = 24
                    Color = clWhite
                    DataField = 'ConsigNrFax'
                    DataSource = dtsMain
                    TabOrder = 8
                  end
                  object DBEdit66: TDBEdit
                    Left = 249
                    Top = 223
                    Width = 144
                    Height = 24
                    Color = clWhite
                    DataField = 'ConsigNrRuc'
                    DataSource = dtsMain
                    TabOrder = 9
                  end
                  object DBEdit67: TDBEdit
                    Left = 9
                    Top = 270
                    Width = 115
                    Height = 24
                    Color = clWhite
                    DataField = 'ConsigNrNit'
                    DataSource = dtsMain
                    TabOrder = 10
                  end
                  object DBEdit68: TDBEdit
                    Left = 129
                    Top = 270
                    Width = 115
                    Height = 24
                    Color = clWhite
                    DataField = 'ConsigNrCuit'
                    DataSource = dtsMain
                    TabOrder = 11
                  end
                end
                object GroupBox1: TGroupBox
                  Left = 10
                  Top = 10
                  Width = 408
                  Height = 226
                  Caption = ' Exportador - Shipper '
                  TabOrder = 1
                  object Label2: TLabel
                    Left = 9
                    Top = 22
                    Width = 33
                    Height = 16
                    Caption = 'Nome'
                  end
                  object Label3: TLabel
                    Left = 141
                    Top = 68
                    Width = 53
                    Height = 16
                    Caption = 'Endere'#231'o'
                  end
                  object Label4: TLabel
                    Left = 9
                    Top = 116
                    Width = 39
                    Height = 16
                    Caption = 'Cidade'
                  end
                  object Label5: TLabel
                    Left = 289
                    Top = 116
                    Width = 15
                    Height = 16
                    Caption = 'UF'
                  end
                  object Label6: TLabel
                    Left = 185
                    Top = 116
                    Width = 22
                    Height = 16
                    Caption = 'CEP'
                  end
                  object Label15: TLabel
                    Left = 9
                    Top = 69
                    Width = 28
                    Height = 16
                    Caption = 'CNPJ'
                  end
                  object Label16: TLabel
                    Left = 327
                    Top = 116
                    Width = 66
                    Height = 16
                    Caption = 'C'#243'digo Pa'#237's'
                  end
                  object dbedtNome: TDBEdit
                    Left = 9
                    Top = 41
                    Width = 312
                    Height = 24
                    Color = clWhite
                    DataField = 'ClienteNome'
                    DataSource = dtsMain
                    TabOrder = 0
                  end
                  object DBEdit3: TDBEdit
                    Left = 141
                    Top = 87
                    Width = 257
                    Height = 24
                    Color = clWhite
                    DataField = 'ClienteEndereco'
                    DataSource = dtsMain
                    TabOrder = 1
                  end
                  object DBEdit4: TDBEdit
                    Left = 9
                    Top = 133
                    Width = 171
                    Height = 24
                    Color = clWhite
                    DataField = 'ClienteCidade'
                    DataSource = dtsMain
                    TabOrder = 2
                  end
                  object DBEdit5: TDBEdit
                    Left = 289
                    Top = 133
                    Width = 32
                    Height = 24
                    Color = clWhite
                    DataField = 'ClienteEstado'
                    DataSource = dtsMain
                    TabOrder = 3
                  end
                  object DBEdit6: TDBEdit
                    Left = 186
                    Top = 133
                    Width = 96
                    Height = 24
                    Color = clWhite
                    DataField = 'ClienteCep'
                    DataSource = dtsMain
                    TabOrder = 4
                  end
                  object DBEdit8: TDBEdit
                    Left = 9
                    Top = 87
                    Width = 126
                    Height = 24
                    Color = clWhite
                    DataField = 'ClienteCnpj'
                    DataSource = dtsMain
                    TabOrder = 5
                  end
                  object DBEdit9: TDBEdit
                    Left = 327
                    Top = 133
                    Width = 71
                    Height = 24
                    Color = clWhite
                    DataField = 'ClientePaisCod'
                    DataSource = dtsMain
                    TabOrder = 6
                  end
                end
              end
              object TabSheet5: TTabSheet
                Caption = 'Partes 2'
                ImageIndex = 4
                object GroupBox3: TGroupBox
                  Left = 10
                  Top = 10
                  Width = 408
                  Height = 343
                  Caption = 'Notify 1'
                  TabOrder = 0
                  object Label7: TLabel
                    Left = 9
                    Top = 24
                    Width = 33
                    Height = 16
                    Caption = 'Nome'
                  end
                  object Label8: TLabel
                    Left = 9
                    Top = 71
                    Width = 53
                    Height = 16
                    Caption = 'Endere'#231'o'
                  end
                  object Label9: TLabel
                    Left = 9
                    Top = 167
                    Width = 39
                    Height = 16
                    Caption = 'Cidade'
                  end
                  object Label10: TLabel
                    Left = 185
                    Top = 167
                    Width = 15
                    Height = 16
                    Caption = 'UF'
                  end
                  object Label12: TLabel
                    Left = 223
                    Top = 167
                    Width = 66
                    Height = 16
                    Caption = 'C'#243'digo Pa'#237's'
                  end
                  object Label71: TLabel
                    Left = 9
                    Top = 119
                    Width = 45
                    Height = 16
                    Caption = 'N'#250'mero'
                  end
                  object Label72: TLabel
                    Left = 111
                    Top = 119
                    Width = 79
                    Height = 16
                    Caption = 'Complemento'
                  end
                  object Label73: TLabel
                    Left = 9
                    Top = 214
                    Width = 50
                    Height = 16
                    Caption = 'Telefone'
                  end
                  object Label74: TLabel
                    Left = 129
                    Top = 214
                    Width = 20
                    Height = 16
                    Caption = 'Fax'
                  end
                  object Label75: TLabel
                    Left = 249
                    Top = 214
                    Width = 24
                    Height = 16
                    Caption = 'RUC'
                  end
                  object Label76: TLabel
                    Left = 9
                    Top = 261
                    Width = 20
                    Height = 16
                    Caption = 'NIT'
                  end
                  object Label77: TLabel
                    Left = 129
                    Top = 261
                    Width = 28
                    Height = 16
                    Caption = 'CUIT'
                  end
                  object DBEdit7: TDBEdit
                    Left = 9
                    Top = 43
                    Width = 384
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify1Nome'
                    DataSource = dtsMain
                    TabOrder = 0
                  end
                  object DBEdit15: TDBEdit
                    Left = 9
                    Top = 90
                    Width = 384
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify1Endereco'
                    DataSource = dtsMain
                    TabOrder = 1
                  end
                  object DBEdit16: TDBEdit
                    Left = 9
                    Top = 184
                    Width = 171
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify1Cidade'
                    DataSource = dtsMain
                    TabOrder = 2
                  end
                  object DBEdit18: TDBEdit
                    Left = 185
                    Top = 184
                    Width = 32
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify1Estado'
                    DataSource = dtsMain
                    TabOrder = 3
                  end
                  object DBEdit20: TDBEdit
                    Left = 223
                    Top = 184
                    Width = 66
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify1PaisCod'
                    DataSource = dtsMain
                    TabOrder = 4
                  end
                  object DBEdit69: TDBEdit
                    Left = 9
                    Top = 136
                    Width = 96
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify1EndNumero'
                    DataSource = dtsMain
                    TabOrder = 5
                  end
                  object DBEdit70: TDBEdit
                    Left = 111
                    Top = 136
                    Width = 282
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify1EndCompl'
                    DataSource = dtsMain
                    TabOrder = 6
                  end
                  object DBEdit71: TDBEdit
                    Left = 9
                    Top = 231
                    Width = 115
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify1NrTelefone'
                    DataSource = dtsMain
                    TabOrder = 7
                  end
                  object DBEdit72: TDBEdit
                    Left = 129
                    Top = 231
                    Width = 115
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify1NrFax'
                    DataSource = dtsMain
                    TabOrder = 8
                  end
                  object DBEdit73: TDBEdit
                    Left = 249
                    Top = 231
                    Width = 144
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify1NrRuc'
                    DataSource = dtsMain
                    TabOrder = 9
                  end
                  object DBEdit74: TDBEdit
                    Left = 9
                    Top = 278
                    Width = 115
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify1NrNit'
                    DataSource = dtsMain
                    TabOrder = 10
                  end
                  object DBEdit75: TDBEdit
                    Left = 129
                    Top = 278
                    Width = 115
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify1NrCuit'
                    DataSource = dtsMain
                    TabOrder = 11
                  end
                end
                object GroupBox2: TGroupBox
                  Left = 437
                  Top = 10
                  Width = 403
                  Height = 343
                  Caption = 'Notify 2'
                  TabOrder = 1
                  object Label20: TLabel
                    Left = 9
                    Top = 24
                    Width = 33
                    Height = 16
                    Caption = 'Nome'
                  end
                  object Label21: TLabel
                    Left = 9
                    Top = 71
                    Width = 53
                    Height = 16
                    Caption = 'Endere'#231'o'
                  end
                  object Label22: TLabel
                    Left = 9
                    Top = 167
                    Width = 39
                    Height = 16
                    Caption = 'Cidade'
                  end
                  object Label23: TLabel
                    Left = 184
                    Top = 167
                    Width = 15
                    Height = 16
                    Caption = 'UF'
                  end
                  object Label25: TLabel
                    Left = 222
                    Top = 167
                    Width = 66
                    Height = 16
                    Caption = 'C'#243'digo Pa'#237's'
                  end
                  object Label78: TLabel
                    Left = 9
                    Top = 214
                    Width = 50
                    Height = 16
                    Caption = 'Telefone'
                  end
                  object Label79: TLabel
                    Left = 129
                    Top = 214
                    Width = 20
                    Height = 16
                    Caption = 'Fax'
                  end
                  object Label80: TLabel
                    Left = 249
                    Top = 214
                    Width = 24
                    Height = 16
                    Caption = 'RUC'
                  end
                  object Label81: TLabel
                    Left = 9
                    Top = 261
                    Width = 20
                    Height = 16
                    Caption = 'NIT'
                  end
                  object Label82: TLabel
                    Left = 129
                    Top = 261
                    Width = 28
                    Height = 16
                    Caption = 'CUIT'
                  end
                  object Label83: TLabel
                    Left = 9
                    Top = 119
                    Width = 45
                    Height = 16
                    Caption = 'N'#250'mero'
                  end
                  object Label84: TLabel
                    Left = 111
                    Top = 119
                    Width = 79
                    Height = 16
                    Caption = 'Complemento'
                  end
                  object DBEdit13: TDBEdit
                    Left = 9
                    Top = 43
                    Width = 384
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify2Nome'
                    DataSource = dtsMain
                    TabOrder = 0
                  end
                  object DBEdit14: TDBEdit
                    Left = 9
                    Top = 90
                    Width = 384
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify2Endereco'
                    DataSource = dtsMain
                    TabOrder = 1
                  end
                  object DBEdit17: TDBEdit
                    Left = 9
                    Top = 184
                    Width = 171
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify2Cidade'
                    DataSource = dtsMain
                    TabOrder = 2
                  end
                  object DBEdit21: TDBEdit
                    Left = 184
                    Top = 184
                    Width = 32
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify2Estado'
                    DataSource = dtsMain
                    TabOrder = 3
                  end
                  object DBEdit23: TDBEdit
                    Left = 222
                    Top = 184
                    Width = 66
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify2PaisCod'
                    DataSource = dtsMain
                    TabOrder = 4
                  end
                  object DBEdit76: TDBEdit
                    Left = 9
                    Top = 231
                    Width = 115
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify2NrTelefone'
                    DataSource = dtsMain
                    TabOrder = 5
                  end
                  object DBEdit77: TDBEdit
                    Left = 129
                    Top = 231
                    Width = 115
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify2NrFax'
                    DataSource = dtsMain
                    TabOrder = 6
                  end
                  object DBEdit78: TDBEdit
                    Left = 249
                    Top = 231
                    Width = 144
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify2NrRuc'
                    DataSource = dtsMain
                    TabOrder = 7
                  end
                  object DBEdit79: TDBEdit
                    Left = 9
                    Top = 278
                    Width = 115
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify2NrNit'
                    DataSource = dtsMain
                    TabOrder = 8
                  end
                  object DBEdit80: TDBEdit
                    Left = 129
                    Top = 278
                    Width = 115
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify2NrCuit'
                    DataSource = dtsMain
                    TabOrder = 9
                  end
                  object DBEdit81: TDBEdit
                    Left = 9
                    Top = 136
                    Width = 96
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify2EndNumero'
                    DataSource = dtsMain
                    TabOrder = 10
                  end
                  object DBEdit82: TDBEdit
                    Left = 111
                    Top = 136
                    Width = 282
                    Height = 24
                    Color = clWhite
                    DataField = 'Notify2EndCompl'
                    DataSource = dtsMain
                    TabOrder = 11
                  end
                end
              end
              object Marcação: TTabSheet
                Caption = 'Marca'#231#227'o'
                ImageIndex = 2
                object GroupBox7: TGroupBox
                  Left = 15
                  Top = 13
                  Width = 403
                  Height = 199
                  Caption = 'Marca'#231#227'o'
                  TabOrder = 0
                  object DBMemo1: TDBMemo
                    Left = 9
                    Top = 28
                    Width = 384
                    Height = 157
                    BevelInner = bvNone
                    BevelOuter = bvNone
                    DataField = 'MarcacaoVolumes'
                    DataSource = dtsMain
                    TabOrder = 0
                  end
                end
              end
              object TabSheet3: TTabSheet
                Caption = 'Taxa e Tipo de Movimento'
                ImageIndex = 3
                object GroupBox8: TGroupBox
                  Left = 11
                  Top = 13
                  Width = 349
                  Height = 196
                  Caption = 'Taxa'
                  TabOrder = 0
                  object Label42: TLabel
                    Left = 9
                    Top = 20
                    Width = 56
                    Height = 16
                    Caption = 'Tipo frete'
                  end
                  object Label41: TLabel
                    Left = 9
                    Top = 136
                    Width = 53
                    Height = 16
                    Caption = 'Tipo taxa'
                  end
                  object dbcbPrepaindCollect: TcxDBLookupComboBox
                    Left = 9
                    Top = 42
                    DataBinding.DataField = 'CdCollectPrepaid'
                    DataBinding.DataSource = dtsMain
                    Properties.ImmediateDropDownWhenActivated = True
                    Properties.ImmediatePost = True
                    Properties.KeyFieldNames = 'Self'
                    Properties.ListColumns = <
                      item
                        FieldName = 'Descricao'
                      end>
                    Properties.ListSource = dsTipoFrete
                    StyleDisabled.BorderColor = clWindowFrame
                    StyleDisabled.Color = 14935011
                    StyleDisabled.TextColor = clBlack
                    TabOrder = 0
                    Width = 313
                  end
                  object dbcbTipoTaxa: TcxDBLookupComboBox
                    Left = 9
                    Top = 158
                    DataBinding.DataField = 'CdTipoPgmtoTaxas'
                    DataBinding.DataSource = dtsMain
                    Properties.ImmediateDropDownWhenActivated = True
                    Properties.ImmediatePost = True
                    Properties.KeyFieldNames = 'Self'
                    Properties.ListColumns = <
                      item
                        FieldName = 'CdTaxaInttra'
                      end>
                    Properties.ListSource = dsTipoTaxaInttra
                    StyleDisabled.BorderColor = clWindowFrame
                    StyleDisabled.Color = 14935011
                    StyleDisabled.TextColor = clBlack
                    TabOrder = 1
                    Width = 65
                  end
                  object dbcbTaxa: TcxDBLookupComboBox
                    Left = 79
                    Top = 158
                    DataBinding.DataField = 'CdTipoPgmtoTaxas'
                    DataBinding.DataSource = dtsMain
                    Properties.ImmediateDropDownWhenActivated = True
                    Properties.ImmediatePost = True
                    Properties.KeyFieldNames = 'Self'
                    Properties.ListColumns = <
                      item
                        FieldName = 'Descricao'
                      end>
                    Properties.ListSource = dsTipoTaxaInttra
                    Properties.MaxLength = 150
                    Style.BorderStyle = ebsUltraFlat
                    Style.TextColor = clBlack
                    Style.ButtonStyle = btsDefault
                    StyleDisabled.BorderColor = clWindowFrame
                    StyleDisabled.Color = 14935011
                    StyleDisabled.TextColor = clBlack
                    TabOrder = 2
                    Width = 243
                  end
                  object dbchAbroad: TDBCheckBox
                    Left = 9
                    Top = 72
                    Width = 208
                    Height = 17
                    Caption = 'Outro Local (Abroad)'
                    DataField = 'InPgmtoAbroad'
                    DataSource = dtsMain
                    TabOrder = 3
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                  end
                  object DBEdit53: TDBEdit
                    Left = 10
                    Top = 95
                    Width = 312
                    Height = 24
                    Color = clWhite
                    DataField = 'NmLocalPgmtoTaxas'
                    DataSource = dtsMain
                    TabOrder = 4
                  end
                end
                object GroupBox9: TGroupBox
                  Left = 11
                  Top = 254
                  Width = 349
                  Height = 68
                  Caption = 'Tipo Movimento'
                  TabOrder = 1
                  object cxDBLookupComboBox1: TcxDBLookupComboBox
                    Left = 9
                    Top = 29
                    DataBinding.DataField = 'CdTipoMovimento'
                    DataBinding.DataSource = dtsMain
                    Properties.ImmediateDropDownWhenActivated = True
                    Properties.ImmediatePost = True
                    Properties.KeyFieldNames = 'Self'
                    Properties.ListColumns = <
                      item
                        FieldName = 'Descricao'
                      end>
                    Properties.ListSource = dsMovimentoInttra
                    StyleDisabled.BorderColor = clWindowFrame
                    StyleDisabled.Color = 14935011
                    StyleDisabled.TextColor = clBlack
                    TabOrder = 0
                    Width = 313
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  inline framePesquisaProc: TFrBuscaProcessos [4]
    Left = 0
    Top = 0
    Width = 1184
    Height = 17
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 1184
    ExplicitHeight = 17
    inherited pnlFiltroProcesso: TPanel
      Width = 1077
      Height = 17
      ExplicitWidth = 1077
      ExplicitHeight = 17
      inherited pnlStyle1: TPanel
        Top = 65
        Width = 1077
        ExplicitTop = 65
        ExplicitWidth = 1077
      end
      inherited pnlFiltroProc: TPanel
        Top = 0
        Width = 1077
        ExplicitTop = 0
        ExplicitWidth = 1077
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
        Width = 1077
        ExplicitWidth = 1077
        inherited lblServico: TLabel
          Left = 167
          ExplicitLeft = 167
        end
        inherited pnlStyle2: TPanel
          Width = 1077
          ExplicitWidth = 1077
        end
        inherited dbedtServico: TDBEdit
          Left = 167
          ExplicitLeft = 167
        end
      end
    end
    inherited pnlBuscarProcesso: TPanel
      Left = 1077
      Height = 17
      ExplicitLeft = 1077
      ExplicitHeight = 17
      inherited btnPesquisar: TBitBtn
        OnClick = framePesquisaProcbtnPesquisarClick
      end
    end
    inherited adsProcesso: TAureliusDataset
      AfterOpen = framePesquisaProcadsProcessoAfterOpen
      AfterClose = framePesquisaProcadsProcessoAfterClose
      DesignClass = 'MyEntitiesBroker.TTprocesso'
    end
    inherited adsProduto: TAureliusDataset
      DesignClass = 'MyEntitiesBroker.TTproduto'
    end
    inherited adsUnidade: TAureliusDataset
      DesignClass = 'MyEntitiesBroker.TTunidNeg'
    end
  end
  inherited dtsMain: TDataSource [5]
    Left = 904
    Top = 296
  end
  inherited dtsDetail: TDataSource [6]
    Left = 904
    Top = 336
  end
  inherited adsMain: TAureliusDataset [7]
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'NrAmend'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DtCriacao'
        DataType = ftDateTime
      end
      item
        Name = 'DtEnvioDraft'
        DataType = ftDateTime
      end
      item
        Name = 'CdEnvioInttra'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ClienteNome'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'ClienteEndereco'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ClienteCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ClienteCep'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ClienteEstado'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ClientePaisCod'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ClienteCnpj'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ConsigNome'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ConsigEndereco'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ConsigCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ConsigCep'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ConsigEstado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ConsigPaisCod'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Notify1Nome'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Notify1Endereco'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Notify1Cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Notify1Cep'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Notify1Estado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Notify1PaisCod'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Notify2Nome'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Notify2Endereco'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Notify2Cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Notify2Cep'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Notify2Estado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Notify2PaisCod'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'AgenteNome'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'AgenteCdInttra'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AgenteEndereco'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'AgenteCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'AgenteCep'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'AgenteEstado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'AgentePaisCod'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'BookingArmador'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ReferenciaEmbarque'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'NmNavio'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NrViagem'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'LocalEmbarque'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LocalDesembarque'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LocalDesembarquePaisCod'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'MarcacaoVolumes'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'CdRuc'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'InPgmtoAbroad'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NmLocalPgmtoTaxas'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DsEmailIndaia'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'LocalEntrega'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LocalEmbarqueSigla'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'LocalDesembarqueSigla'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ConsigEndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ConsigEndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'ConsigNrTelefone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ConsigNrFax'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ConsigNrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ConsigNrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ConsigNrCuit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Notify1EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Notify1EndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'Notify1NrTelefone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Notify1NrFax'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Notify1NrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Notify1NrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Notify1NrCuit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Notify2EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Notify2EndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'Notify2NrTelefone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Notify2NrFax'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Notify2NrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Notify2NrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Notify2NrCuit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LocalLiberacaoBlCod'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'LocalLiberacaoBlNome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LocalLiberacaoBlPais'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'LocalEntregaSigla'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'LocalEntregaPaisCod'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'StatusEnvio'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CdUsuarioCriacao'
        DataType = ftVariant
      end
      item
        Name = 'CdUsuarioCriacao.CdUsuario'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CdUsuarioCriacao.CdSenha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CdUsuarioCriacao.CdCargo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CdUsuarioCriacao.NmUsuario'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CdUsuarioCriacao.ApUsuario'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CdUsuarioCriacao.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CdUsuarioCriacao.NmEmail'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'CdCollectPrepaid'
        DataType = ftVariant
      end
      item
        Name = 'CdCollectPrepaid.Codigo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CdCollectPrepaid.Descricao'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CdTipoPgmtoTaxas'
        DataType = ftVariant
      end
      item
        Name = 'CdTipoPgmtoTaxas.CdTaxaInttra'
        DataType = ftInteger
      end
      item
        Name = 'CdTipoPgmtoTaxas.Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CdTipoMovimento'
        DataType = ftVariant
      end
      item
        Name = 'CdTipoMovimento.CdMovimentoInttra'
        DataType = ftInteger
      end
      item
        Name = 'CdTipoMovimento.Descricao'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrProcesso'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.NrProcesso'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'NrProcesso.DtAbertura'
        DataType = ftDateTime
      end
      item
        Name = 'NrProcesso.InCancelado'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.VlMleMneg'
        DataType = ftFloat
      end
      item
        Name = 'NrProcesso.VlFretePrepaidMneg'
        DataType = ftFloat
      end
      item
        Name = 'NrProcesso.VlSeguroMn'
        DataType = ftFloat
      end
      item
        Name = 'NrProcesso.NrViagem'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NrProcesso.NrProcessoExpTemp'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NrProcesso.VlPesoLiquido'
        DataType = ftFloat
      end
      item
        Name = 'NrProcesso.VlPesoBruto'
        DataType = ftFloat
      end
      item
        Name = 'NrProcesso.TpProcesso'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.NrFatura'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NrProcesso.CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrProcesso.CdLinguaPedido'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.CdRuc'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'NrProcesso.CdDue'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'NrProcesso.VlDescontoMn'
        DataType = ftFloat
      end
      item
        Name = 'NrProcesso.VlAcrescimoMn'
        DataType = ftFloat
      end
      item
        Name = 'NrProcesso.InProcessoConsolidado'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.UnidNeg'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.UnidNeg.CdUnidNeg'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.UnidNeg.NmUnidNeg'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.UnidNeg.ApUnidNeg'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrProcesso.UnidNeg.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Produto'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Produto.CdProduto'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.Produto.NmProduto'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NrProcesso.Produto.ApProduto'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrProcesso.Produto.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Produto.CdViatransp'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Cliente'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Cliente.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NrProcesso.Cliente.NmEmpresa'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'NrProcesso.Cliente.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrProcesso.Cliente.EndEmpresa'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.Cliente.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'NrProcesso.Cliente.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NrProcesso.Cliente.EndBairro'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NrProcesso.Cliente.EndUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.Cliente.EndCep'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'NrProcesso.Cliente.CdTipoPessoa'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Cliente.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'NrProcesso.Cliente.CpfEmpresa'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'NrProcesso.Cliente.IeEmpresa'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NrProcesso.Cliente.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Cliente.InCliente'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Cliente.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Cliente.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Cliente.InOutros'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Cliente.InRepresentante'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Cliente.CdPaisImportador'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrProcesso.Cliente.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Cliente.EndCompl'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.Cliente.EndComplemento'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NrProcesso.Cliente.Grupo'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Usuario'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Usuario.CdUsuario'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NrProcesso.Usuario.CdSenha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrProcesso.Usuario.CdCargo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrProcesso.Usuario.NmUsuario'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.Usuario.ApUsuario'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NrProcesso.Usuario.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Usuario.NmEmail'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'NrProcesso.MoedaMle'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.MoedaMle.CdMoeda'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrProcesso.MoedaMle.NmMoeda'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NrProcesso.MoedaMle.ApMoeda'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'NrProcesso.MoedaMle.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.PaisDestino'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.PaisDestino.CdPais'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrProcesso.PaisDestino.NmPais'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'NrProcesso.PaisDestino.NmSiglaCrt'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.PaisDestino.NmSigla2l'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.Despachante'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Despachante.CdDespachante'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrProcesso.Despachante.NmDespachante'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.Despachante.ApDespachante'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrProcesso.Despachante.VlMinSda'
        DataType = ftFloat
      end
      item
        Name = 'NrProcesso.Despachante.VlMaxSda'
        DataType = ftFloat
      end
      item
        Name = 'NrProcesso.Despachante.CdRisc'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrProcesso.Despachante.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Despachante.CdModSda'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.Despachante.NrRegistro'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'NrProcesso.Despachante.CpfDespachante'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'NrProcesso.Despachante.CdDespSda'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'NrProcesso.Despachante.CdProduto'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.Despachante.NmSenha'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'NrProcesso.Despachante.InConsultaSiscomex'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Despachante.CdUsuario'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NrProcesso.Despachante.DtSenha'
        DataType = ftDateTime
      end
      item
        Name = 'NrProcesso.Incoterm'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Incoterm.Codigo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrProcesso.Incoterm.Descricao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NrProcesso.Incoterm.Sinal'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Incoterm.InTipoFrete'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.Exportador'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Exportador.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NrProcesso.Exportador.NmEmpresa'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'NrProcesso.Exportador.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrProcesso.Exportador.EndEmpresa'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.Exportador.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'NrProcesso.Exportador.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NrProcesso.Exportador.EndBairro'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NrProcesso.Exportador.EndUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.Exportador.EndCep'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'NrProcesso.Exportador.CdTipoPessoa'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Exportador.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'NrProcesso.Exportador.CpfEmpresa'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'NrProcesso.Exportador.IeEmpresa'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NrProcesso.Exportador.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Exportador.InCliente'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Exportador.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Exportador.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Exportador.InOutros'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Exportador.InRepresentante'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Exportador.CdPaisImportador'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrProcesso.Exportador.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Exportador.EndCompl'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.Exportador.EndComplemento'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NrProcesso.Exportador.Grupo'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Importador'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Importador.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NrProcesso.Importador.NmEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NrProcesso.Importador.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrProcesso.Importador.EndEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NrProcesso.Importador.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'NrProcesso.Importador.EndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'NrProcesso.Importador.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NrProcesso.Importador.EndEstado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NrProcesso.Importador.NrTelefone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NrProcesso.Importador.NrFax'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NrProcesso.Importador.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Importador.InAgente'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Importador.InBanco'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Importador.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Importador.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Importador.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Importador.NrCliente'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NrProcesso.Importador.NmContato'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.Importador.InComprador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Importador.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'NrProcesso.Importador.InPoTrans'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Importador.NrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NrProcesso.Importador.NrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NrProcesso.Importador.NrCuit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NrProcesso.Importador.Pais'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Servico'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Servico.CdServico'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrProcesso.Servico.NmServico'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.Servico.CdViaTransporte'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.Servico.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Servico.InNovoServico'
        DataType = ftInteger
      end
      item
        Name = 'NrProcesso.Agente'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Agente.CdAgente'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NrProcesso.Agente.NmAgente'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NrProcesso.Agente.NrCgcAgente'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'NrProcesso.Agente.NrSigla'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'NrProcesso.Agente.DsEndereco'
        DataType = ftString
        Size = 260
      end
      item
        Name = 'NrProcesso.Agente.NrZipCode'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'NrProcesso.Agente.DsEmail'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NrProcesso.Agente.EndUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.Agente.DsScacCode'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NrProcesso.Agente.CdCidade'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Agente.Pais'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Notify1Proc'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Notify1Proc.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NrProcesso.Notify1Proc.NmEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NrProcesso.Notify1Proc.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrProcesso.Notify1Proc.EndEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NrProcesso.Notify1Proc.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'NrProcesso.Notify1Proc.EndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'NrProcesso.Notify1Proc.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NrProcesso.Notify1Proc.EndEstado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NrProcesso.Notify1Proc.NrTelefone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NrProcesso.Notify1Proc.NrFax'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NrProcesso.Notify1Proc.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Notify1Proc.InAgente'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Notify1Proc.InBanco'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Notify1Proc.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Notify1Proc.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Notify1Proc.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Notify1Proc.NrCliente'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NrProcesso.Notify1Proc.NmContato'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.Notify1Proc.InComprador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Notify1Proc.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'NrProcesso.Notify1Proc.InPoTrans'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Notify1Proc.NrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NrProcesso.Notify1Proc.NrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NrProcesso.Notify1Proc.NrCuit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NrProcesso.Notify1Proc.Pais'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Notify2Proc'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Notify2Proc.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NrProcesso.Notify2Proc.NmEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NrProcesso.Notify2Proc.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrProcesso.Notify2Proc.EndEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NrProcesso.Notify2Proc.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'NrProcesso.Notify2Proc.EndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'NrProcesso.Notify2Proc.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NrProcesso.Notify2Proc.EndEstado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NrProcesso.Notify2Proc.NrTelefone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NrProcesso.Notify2Proc.NrFax'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NrProcesso.Notify2Proc.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Notify2Proc.InAgente'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Notify2Proc.InBanco'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Notify2Proc.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Notify2Proc.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Notify2Proc.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Notify2Proc.NrCliente'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NrProcesso.Notify2Proc.NmContato'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.Notify2Proc.InComprador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Notify2Proc.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'NrProcesso.Notify2Proc.InPoTrans'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Notify2Proc.NrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NrProcesso.Notify2Proc.NrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NrProcesso.Notify2Proc.NrCuit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NrProcesso.Notify2Proc.Pais'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Consignee'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Consignee.CdEmpresa'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NrProcesso.Consignee.NmEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NrProcesso.Consignee.ApEmpresa'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrProcesso.Consignee.EndEmpresa'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NrProcesso.Consignee.EndNumero'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'NrProcesso.Consignee.EndCompl'
        DataType = ftString
        Size = 41
      end
      item
        Name = 'NrProcesso.Consignee.EndCidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NrProcesso.Consignee.EndEstado'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NrProcesso.Consignee.NrTelefone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NrProcesso.Consignee.NrFax'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NrProcesso.Consignee.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Consignee.InAgente'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Consignee.InBanco'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Consignee.InImportador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Consignee.InSeguradora'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Consignee.InExportador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Consignee.NrCliente'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NrProcesso.Consignee.NmContato'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.Consignee.InComprador'
        DataType = ftBoolean
      end
      item
        Name = 'NrProcesso.Consignee.CgcEmpresa'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'NrProcesso.Consignee.InPoTrans'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.Consignee.NrRuc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NrProcesso.Consignee.NrNit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NrProcesso.Consignee.NrCuit'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NrProcesso.Consignee.Pais'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Embarcacao'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.Embarcacao.CdEmbarcacao'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NrProcesso.Embarcacao.NmEmbarcacao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NrProcesso.LocalEmbarque'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.LocalEmbarque.Codigo'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NrProcesso.LocalEmbarque.Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.LocalEmbarque.CdUnidNegLocal'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.LocalEmbarque.CdUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.LocalEmbarque.CdSigla'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrProcesso.LocalEmbarque.NmCidade'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.LocalEmbarque.CdPais'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.LocalDesembarque'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.LocalDesembarque.Codigo'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NrProcesso.LocalDesembarque.Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.LocalDesembarque.CdUnidNegLocal'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.LocalDesembarque.CdUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.LocalDesembarque.CdSigla'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrProcesso.LocalDesembarque.NmCidade'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.LocalDesembarque.CdPais'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.LocalEntrega'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.LocalEntrega.Codigo'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NrProcesso.LocalEntrega.Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.LocalEntrega.CdUnidNegLocal'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.LocalEntrega.CdUf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrProcesso.LocalEntrega.CdSigla'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrProcesso.LocalEntrega.NmCidade'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NrProcesso.LocalEntrega.CdPais'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.TpFrete'
        DataType = ftVariant
      end
      item
        Name = 'NrProcesso.TpFrete.Codigo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NrProcesso.TpFrete.Descricao'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NrProcesso.ProcessoExp'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    BeforeClose = adsMainBeforeClose
    AfterInsert = adsMainAfterInsert
    AfterScroll = adsMainAfterScroll
    OnCalcFields = adsMainCalcFields
    SubpropsDepth = 2
    Left = 944
    Top = 296
    DesignClass = 'MyEntitiesBroker.TTprocessoDraftBl'
    object adsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsMainNrProcesso: TAureliusEntityField
      DisplayLabel = 'Processo'
      FieldName = 'NrProcesso'
      Required = True
    end
    object adsMainNrProcessoNrProcesso: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NrProcesso.NrProcesso'
      Size = 18
    end
    object adsMainNrAmend: TIntegerField
      DisplayLabel = 'Nr. Vers'#227'o'
      FieldName = 'NrAmend'
      Required = True
    end
    object adsMainDtCriacao: TDateTimeField
      DisplayLabel = 'Dt. Cria'#231#227'o'
      FieldName = 'DtCriacao'
    end
    object adsMainDtEnvioDraft: TDateTimeField
      DisplayLabel = 'Dt. Envio Draft'
      FieldName = 'DtEnvioDraft'
    end
    object adsMainCdEnvioInttra: TStringField
      DisplayLabel = 'Nr. SI Inttra'
      FieldName = 'CdEnvioInttra'
      Size = 15
    end
    object adsMainCdUsuarioCriacao: TAureliusEntityField
      DisplayLabel = 'Usu'#225'rio Cria'#231#227'o'
      FieldName = 'CdUsuarioCriacao'
    end
    object adsMainCdUsuarioCriacaoApUsuario: TStringField
      DisplayLabel = 'Usu'#225'rio Cria'#231#227'o'
      FieldName = 'CdUsuarioCriacao.ApUsuario'
      Size = 15
    end
    object adsMainClienteEndereco: TStringField
      DisplayLabel = 'Cliente Endereco'
      FieldName = 'ClienteEndereco'
      Size = 50
    end
    object adsMainClienteNome: TStringField
      DisplayLabel = 'Cliente Nome'
      FieldName = 'ClienteNome'
      Size = 80
    end
    object adsMainClienteCidade: TStringField
      DisplayLabel = 'Cliente Cidade'
      FieldName = 'ClienteCidade'
      Size = 30
    end
    object adsMainClienteCep: TStringField
      DisplayLabel = 'Cliente Cep'
      FieldName = 'ClienteCep'
      Size = 8
    end
    object adsMainClienteEstado: TStringField
      DisplayLabel = 'Cliente Estado'
      FieldName = 'ClienteEstado'
      Size = 2
    end
    object adsMainClientePaisCod: TStringField
      DisplayLabel = 'Cliente Pais C'#243'd'
      FieldName = 'ClientePaisCod'
      Size = 2
    end
    object adsMainClienteCnpj: TStringField
      DisplayLabel = 'Cliente Cnpj'
      FieldName = 'ClienteCnpj'
      Size = 18
    end
    object adsMainConsigNome: TStringField
      DisplayLabel = 'Consig Nome'
      FieldName = 'ConsigNome'
      Size = 100
    end
    object adsMainConsigEndereco: TStringField
      DisplayLabel = 'Consig Endereco'
      FieldName = 'ConsigEndereco'
      Size = 100
    end
    object adsMainConsigCidade: TStringField
      DisplayLabel = 'Consig Cidade'
      FieldName = 'ConsigCidade'
      Size = 30
    end
    object adsMainConsigCep: TStringField
      DisplayLabel = 'Consig Cep'
      FieldName = 'ConsigCep'
      Size = 8
    end
    object adsMainConsigEstado: TStringField
      DisplayLabel = 'Consig Estado'
      FieldName = 'ConsigEstado'
      Size = 30
    end
    object adsMainNotify1Nome: TStringField
      DisplayLabel = 'Notify1 Nome'
      FieldName = 'Notify1Nome'
      Size = 100
    end
    object adsMainNotify1Cidade: TStringField
      DisplayLabel = 'Notify1 Cidade'
      FieldName = 'Notify1Cidade'
      Size = 30
    end
    object adsMainNotify1Cep: TStringField
      DisplayLabel = 'Notify1 Cep'
      FieldName = 'Notify1Cep'
      Size = 8
    end
    object adsMainNotify1Endereco: TStringField
      FieldName = 'Notify1Endereco'
      Size = 100
    end
    object adsMainNotify1Estado: TStringField
      DisplayLabel = 'Notify1 Estado'
      FieldName = 'Notify1Estado'
      Size = 30
    end
    object adsMainNotify1PaisCod: TStringField
      DisplayLabel = 'Notify1 Pais Cod'
      FieldName = 'Notify1PaisCod'
      Size = 2
    end
    object adsMainNotify2Nome: TStringField
      DisplayLabel = 'Notify2 Nome'
      FieldName = 'Notify2Nome'
      Size = 100
    end
    object adsMainNotify2Endereco: TStringField
      FieldName = 'Notify2Endereco'
      Size = 100
    end
    object adsMainNotify2Cidade: TStringField
      DisplayLabel = 'Notify2 Cidade'
      FieldName = 'Notify2Cidade'
      Size = 30
    end
    object adsMainNotify2Cep: TStringField
      DisplayLabel = 'Notify2 Cep'
      FieldName = 'Notify2Cep'
      Size = 8
    end
    object adsMainNotify2Estado: TStringField
      DisplayLabel = 'Notify2 Estado'
      FieldName = 'Notify2Estado'
      Size = 30
    end
    object adsMainNotify2PaisCod: TStringField
      DisplayLabel = 'Notify2 Pais Cod'
      FieldName = 'Notify2PaisCod'
      Size = 2
    end
    object adsMainAgenteNome: TStringField
      DisplayLabel = 'Agente Nome'
      FieldName = 'AgenteNome'
      Size = 60
    end
    object adsMainAgenteEndereco: TStringField
      FieldName = 'AgenteEndereco'
      Size = 100
    end
    object adsMainAgenteCdInttra: TStringField
      DisplayLabel = 'Agente Cd. Inttra'
      FieldName = 'AgenteCdInttra'
    end
    object adsMainAgenteCidade: TStringField
      DisplayLabel = 'Agente Cidade'
      FieldName = 'AgenteCidade'
      Size = 30
    end
    object adsMainAgenteCep: TStringField
      DisplayLabel = 'Agente Cep'
      FieldName = 'AgenteCep'
      Size = 8
    end
    object adsMainAgenteEstado: TStringField
      DisplayLabel = 'Agente Estado'
      FieldName = 'AgenteEstado'
      Size = 30
    end
    object adsMainAgentePaisCod: TStringField
      DisplayLabel = 'Agente Pais Cod'
      FieldName = 'AgentePaisCod'
      Size = 2
    end
    object adsMainBookingArmador: TStringField
      DisplayLabel = 'Booking Armador'
      FieldName = 'BookingArmador'
      Size = 35
    end
    object adsMainReferenciaEmbarque: TStringField
      DisplayLabel = 'Referencia Embarque'
      FieldName = 'ReferenciaEmbarque'
      Size = 35
    end
    object adsMainNmNavio: TStringField
      DisplayLabel = 'Navio'
      FieldName = 'NmNavio'
      Size = 40
    end
    object adsMainNrViagem: TStringField
      DisplayLabel = 'Viagem'
      FieldName = 'NrViagem'
      Size = 15
    end
    object adsMainLocalEmbarque: TStringField
      DisplayLabel = 'Local Embarque'
      FieldName = 'LocalEmbarque'
      Size = 50
    end
    object adsMainLocalDesembarque: TStringField
      DisplayLabel = 'Local Desembarque'
      FieldName = 'LocalDesembarque'
      Size = 50
    end
    object adsMainLocalDesembarquePaisCod: TStringField
      DisplayLabel = 'Local Desembarque Pais Cod'
      FieldName = 'LocalDesembarquePaisCod'
      Size = 2
    end
    object adsMainMarcacaoVolumes: TStringField
      DisplayLabel = 'Marca'#231#227'o Volumes'
      FieldName = 'MarcacaoVolumes'
      Size = 1000
    end
    object adsMainCdRuc: TStringField
      DisplayLabel = 'RUC'
      FieldName = 'CdRuc'
      Size = 35
    end
    object adsMainCdCollectPrepaid: TAureliusEntityField
      DisplayLabel = 'Collect/Prepaid'
      FieldName = 'CdCollectPrepaid'
    end
    object adsMainCdTipoPgmtoTaxas: TAureliusEntityField
      DisplayLabel = 'Tipo Pgmto Taxas'
      FieldName = 'CdTipoPgmtoTaxas'
    end
    object adsMainCdTipoMovimento: TAureliusEntityField
      DisplayLabel = 'Tipo Movimento'
      FieldName = 'CdTipoMovimento'
    end
    object adsMaincalc_Processo: TStringField
      DisplayLabel = 'Processo'
      FieldKind = fkCalculated
      FieldName = 'calc_Processo'
      Size = 18
      Calculated = True
    end
    object adsMaincalc_Usuario: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldKind = fkCalculated
      FieldName = 'calc_Usuario'
      Size = 30
      Calculated = True
    end
    object adsMainDsEmailIndaia: TStringField
      DisplayLabel = 'Email Indai'#225
      FieldName = 'DsEmailIndaia'
      Size = 100
    end
    object adsMainInPgmtoAbroad: TStringField
      FieldName = 'InPgmtoAbroad'
      Size = 1
    end
    object adsMainNmLocalPgmtoTaxas: TStringField
      FieldName = 'NmLocalPgmtoTaxas'
      Size = 100
    end
    object adsMainConsigPaisCod: TStringField
      FieldName = 'ConsigPaisCod'
      Size = 2
    end
    object adsMainLocalEntrega: TStringField
      FieldName = 'LocalEntrega'
      Size = 50
    end
    object adsMainLocalEmbarqueSigla: TStringField
      FieldName = 'LocalEmbarqueSigla'
      Size = 3
    end
    object adsMainLocalDesembarqueSigla: TStringField
      FieldName = 'LocalDesembarqueSigla'
      Size = 3
    end
    object adsMainCdTipoPgmtoTaxasCdTaxaInttra: TIntegerField
      FieldName = 'CdTipoPgmtoTaxas.CdTaxaInttra'
    end
    object adsMainCdTipoPgmtoTaxasDescricao: TStringField
      FieldName = 'CdTipoPgmtoTaxas.Descricao'
      Size = 50
    end
    object adsMainCdCollectPrepaidCodigo: TStringField
      FieldName = 'CdCollectPrepaid.Codigo'
      Size = 1
    end
    object adsMainCdCollectPrepaidDescricao: TStringField
      FieldName = 'CdCollectPrepaid.Descricao'
      Size = 30
    end
    object adsMainCdTipoMovimentoCdMovimentoInttra: TIntegerField
      FieldName = 'CdTipoMovimento.CdMovimentoInttra'
    end
    object adsMainCdTipoMovimentoDescricao: TStringField
      FieldName = 'CdTipoMovimento.Descricao'
      Size = 10
    end
    object adsMainConsigEndNumero: TStringField
      FieldName = 'ConsigEndNumero'
      Size = 6
    end
    object adsMainConsigEndCompl: TStringField
      FieldName = 'ConsigEndCompl'
      Size = 41
    end
    object adsMainConsigNrTelefone: TStringField
      FieldName = 'ConsigNrTelefone'
      Size = 15
    end
    object adsMainConsigNrFax: TStringField
      FieldName = 'ConsigNrFax'
      Size = 15
    end
    object adsMainConsigNrRuc: TStringField
      FieldName = 'ConsigNrRuc'
      Size = 25
    end
    object adsMainConsigNrNit: TStringField
      FieldName = 'ConsigNrNit'
      Size = 25
    end
    object adsMainConsigNrCuit: TStringField
      FieldName = 'ConsigNrCuit'
      Size = 25
    end
    object adsMainNotify1EndNumero: TStringField
      FieldName = 'Notify1EndNumero'
      Size = 6
    end
    object adsMainNotify1EndCompl: TStringField
      FieldName = 'Notify1EndCompl'
      Size = 41
    end
    object adsMainNotify1NrTelefone: TStringField
      FieldName = 'Notify1NrTelefone'
      Size = 15
    end
    object adsMainNotify1NrFax: TStringField
      FieldName = 'Notify1NrFax'
      Size = 15
    end
    object adsMainNotify1NrRuc: TStringField
      FieldName = 'Notify1NrRuc'
      Size = 25
    end
    object adsMainNotify1NrNit: TStringField
      FieldName = 'Notify1NrNit'
      Size = 25
    end
    object adsMainNotify1NrCuit: TStringField
      FieldName = 'Notify1NrCuit'
      Size = 25
    end
    object adsMainNotify2EndNumero: TStringField
      FieldName = 'Notify2EndNumero'
      Size = 6
    end
    object adsMainNotify2EndCompl: TStringField
      FieldName = 'Notify2EndCompl'
      Size = 41
    end
    object adsMainNotify2NrTelefone: TStringField
      FieldName = 'Notify2NrTelefone'
      Size = 15
    end
    object adsMainNotify2NrFax: TStringField
      FieldName = 'Notify2NrFax'
      Size = 15
    end
    object adsMainNotify2NrRuc: TStringField
      FieldName = 'Notify2NrRuc'
      Size = 25
    end
    object adsMainNotify2NrNit: TStringField
      FieldName = 'Notify2NrNit'
      Size = 25
    end
    object adsMainNotify2NrCuit: TStringField
      FieldName = 'Notify2NrCuit'
      Size = 25
    end
    object adsMainLocalLiberacaoBlCod: TStringField
      FieldName = 'LocalLiberacaoBlCod'
      Size = 5
    end
    object adsMainLocalLiberacaoBlNome: TStringField
      FieldName = 'LocalLiberacaoBlNome'
      Size = 50
    end
    object adsMainLocalLiberacaoBlPais: TStringField
      FieldName = 'LocalLiberacaoBlPais'
      Size = 120
    end
    object adsMainLocalEntregaSigla: TStringField
      FieldName = 'LocalEntregaSigla'
      Size = 3
    end
    object adsMainLocalEntregaPaisCod: TStringField
      FieldName = 'LocalEntregaPaisCod'
      Size = 2
    end
    object adsMainStatusEnvio: TStringField
      FieldName = 'StatusEnvio'
      Size = 100
    end
  end
  inherited cxGridPopupMenu: TcxGridPopupMenu [8]
    Left = 920
    Top = 128
  end
  inherited adsDetail: TAureliusDataset
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
        Name = 'DsCarga'
        DataType = ftMemo
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
        Name = 'VlExcessoCntr'
        DataType = ftFloat
      end>
    AfterInsert = adsDetailAfterInsert
    Left = 944
    Top = 336
    DesignClass = 'MyEntitiesBroker.TTprocessoDraftCntr'
    object adsDetailSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsDetailNrProcesso: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object adsDetailNrAmend: TIntegerField
      DisplayLabel = 'Nr. Amend'
      FieldName = 'NrAmend'
      Required = True
    end
    object adsDetailNrCntr: TStringField
      DisplayLabel = 'Container'
      FieldName = 'NrCntr'
      Required = True
    end
    object adsDetailNrLacre: TStringField
      DisplayLabel = 'Lacre'
      FieldName = 'NrLacre'
    end
    object adsDetailNrLacreSif: TStringField
      DisplayLabel = 'Lacre SIF'
      FieldName = 'NrLacreSif'
      Size = 11
    end
    object adsDetailNmTpCntr: TStringField
      DisplayLabel = 'Tipo Container'
      FieldName = 'NmTpCntr'
    end
    object adsDetailCdIso: TStringField
      DisplayLabel = 'C'#243'd. ISO'
      FieldName = 'CdIso'
      Size = 4
    end
    object adsDetailDsTemperatura: TStringField
      DisplayLabel = 'Temperatura'
      FieldName = 'DsTemperatura'
      EditMask = '#00.0;1;_'
      Size = 6
    end
    object adsDetailTaraCntr: TFloatField
      DisplayLabel = 'Tara'
      FieldName = 'TaraCntr'
      DisplayFormat = '##,##0.00'
      EditFormat = '0.00'
    end
    object adsDetailVlCubagem: TFloatField
      DisplayLabel = 'Cubagem'
      FieldName = 'VlCubagem'
      DisplayFormat = '##,###0.000'
      EditFormat = '0.000'
    end
    object adsDetailDsCarga: TMemoField
      FieldName = 'DsCarga'
      BlobType = ftMemo
    end
    object adsDetailCdNcm: TStringField
      DisplayLabel = 'NCM'
      FieldName = 'CdNcm'
      Size = 11
    end
    object adsDetailCdEmbalagem: TStringField
      DisplayLabel = 'C'#243'd. Embalagem'
      FieldName = 'CdEmbalagem'
      Size = 3
    end
    object adsDetailDsEmbalagem: TStringField
      DisplayLabel = 'Descri'#231#227'o Embalagem'
      FieldName = 'DsEmbalagem'
      Size = 50
    end
    object adsDetailQtEmbalagem: TIntegerField
      DisplayLabel = 'Qtde. Embalagem'
      FieldName = 'QtEmbalagem'
    end
    object adsDetailQtPesoBruto: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'QtPesoBruto'
      DisplayFormat = '##,###0.000'
    end
    object adsDetailVlExcessoCntr: TFloatField
      FieldName = 'VlExcessoCntr'
    end
  end
  object adsTipoFrete: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Codigo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Descricao'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end>
    Left = 680
    Top = 464
    DesignClass = 'MyEntitiesBroker.TTtpFrete'
    object adsTipoFreteSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsTipoFreteCodigo: TStringField
      FieldName = 'Codigo'
      Required = True
      Size = 1
    end
    object adsTipoFreteDescricao: TStringField
      FieldName = 'Descricao'
      Required = True
      Size = 30
    end
  end
  object dsTipoFrete: TDataSource
    AutoEdit = False
    DataSet = adsTipoFrete
    Left = 640
    Top = 464
  end
  object adsTipoTaxaInttra: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdTaxaInttra'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 50
      end>
    Left = 568
    Top = 464
    DesignClass = 'MyEntitiesBroker.TTtpTaxasInttra'
    object adsTipoTaxaInttraSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsTipoTaxaInttraCdTaxaInttra: TIntegerField
      FieldName = 'CdTaxaInttra'
      Required = True
    end
    object adsTipoTaxaInttraDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object dsTipoTaxaInttra: TDataSource
    AutoEdit = False
    DataSet = adsTipoTaxaInttra
    Left = 528
    Top = 464
  end
  object dsComentariosIntra: TDataSource
    AutoEdit = False
    DataSet = adsComentariosIntra
    Left = 752
    Top = 464
  end
  object adsComentariosIntra: TAureliusDataset
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
    Left = 792
    Top = 456
    DesignClass = 'MyEntitiesBroker.TTtpComentariosInttra'
    object adsComentariosIntraSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsComentariosIntraCdComentarioInntra: TStringField
      FieldName = 'CdComentarioInntra'
      Required = True
      Size = 2
    end
    object adsComentariosIntraDescricao: TStringField
      FieldName = 'Descricao'
      Size = 130
    end
  end
  object dsMovimentoInttra: TDataSource
    AutoEdit = False
    DataSet = adsMovimentoInttra
    Left = 416
    Top = 464
  end
  object adsMovimentoInttra: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdMovimentoInttra'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 10
      end>
    Left = 456
    Top = 488
    DesignClass = 'MyEntitiesBroker.TTtpMovimentoInttra'
    object adsMovimentoInttraSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsMovimentoInttraCdMovimentoInttra: TIntegerField
      FieldName = 'CdMovimentoInttra'
      Required = True
    end
    object adsMovimentoInttraDescricao: TStringField
      FieldName = 'Descricao'
      Size = 10
    end
  end
  object adsUsuario: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdUsuario'
        Attributes = [faRequired]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CdSenha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CdCargo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NmUsuario'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ApUsuario'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'InAtivo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NmEmail'
        DataType = ftString
        Size = 2000
      end>
    Left = 568
    Top = 534
    DesignClass = 'MyEntitiesBroker.TTusuario'
    object adsUsuarioSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsUsuarioApUsuario: TStringField
      FieldName = 'ApUsuario'
      Required = True
      Size = 15
    end
    object adsUsuarioCdUsuario: TStringField
      FieldName = 'CdUsuario'
      Required = True
      Size = 4
    end
    object adsUsuarioInAtivo: TStringField
      FieldName = 'InAtivo'
      Required = True
      Size = 1
    end
  end
  object dtsUsuario: TDataSource
    AutoEdit = False
    DataSet = adsUsuario
    Left = 560
    Top = 534
  end
  object XMLDocument1: TXMLDocument
    Options = [doNodeAutoCreate, doNodeAutoIndent, doAttrNull, doAutoPrefix, doNamespaceDecl]
    Left = 964
    Top = 413
  end
  object qryContainersAgrupados: TFDQuery
    Connection = FireDacMSSQLConnection.Connection
    SQL.Strings = (
      'SELECT '
      'NR_PROCESSO, '
      'COUNT(*)QTDE_CNTR, '
      'B.NM_TP_CNTR,'
      'B.TP_CNTR,'
      'CD_ISO, '
      'SUM(A.VL_QUANTIDADE_EMBALAGEM) QTDE_EMBALAGEM, '
      'C.NM_EMBALAGEM,'
      'SUM(A.VL_PESO_BRUTO) VL_PESO_BRUTO,'
      'SUM(A.VL_PESO_LIQUIDO) VL_PESO_LIQUIDO'
      'FROM TPROCESSO_CNTR A'
      'INNER JOIN TTP_CNTR B ON B.TP_CNTR = A.TP_CNTR'
      
        'LEFT JOIN TTP_EMBALAGEM_INTTRA C ON C.CD_EMBALAGEM = A.CD_EMBALA' +
        'GEM'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'GROUP BY NR_PROCESSO, NM_TP_CNTR, CD_ISO, C.NM_EMBALAGEM, '
      'B.NM_TP_CNTR, A.VL_PESO_BRUTO, A.VL_PESO_LIQUIDO, B.TP_CNTR')
    Left = 658
    Top = 609
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Value = '0102EM-003987-19'
      end>
    object qryContainersAgrupadosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryContainersAgrupadosQTDE_CNTR: TIntegerField
      FieldName = 'QTDE_CNTR'
      Origin = 'QTDE_CNTR'
      ReadOnly = True
    end
    object qryContainersAgrupadosNM_TP_CNTR: TStringField
      FieldName = 'NM_TP_CNTR'
      Origin = 'NM_TP_CNTR'
      Required = True
      FixedChar = True
    end
    object qryContainersAgrupadosCD_ISO: TStringField
      FieldName = 'CD_ISO'
      Origin = 'CD_ISO'
      FixedChar = True
      Size = 4
    end
    object qryContainersAgrupadosNM_EMBALAGEM: TStringField
      FieldName = 'NM_EMBALAGEM'
      Origin = 'NM_EMBALAGEM'
      Size = 100
    end
    object qryContainersAgrupadosQTDE_EMBALAGEM: TFloatField
      FieldName = 'QTDE_EMBALAGEM'
    end
    object qryContainersAgrupadosVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      Origin = 'VL_PESO_BRUTO'
    end
    object qryContainersAgrupadosVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      Origin = 'VL_PESO_LIQUIDO'
    end
    object qryContainersAgrupadosTP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'TP_CNTR'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object qryNcmItem: TFDQuery
    Connection = FireDacMSSQLConnection.Connection
    SQL.Strings = (
      
        'SELECT DISTINCT CD_NCM FROM TPROCESSO_EXP_NF_ITEM WHERE NR_PROCE' +
        'SSO = :NR_PROCESSO ORDER BY CD_NCM'
      ''
      
        '--SELECT DISTINCT CD_NCM FROM TPROCESSO_EXP_ITEM WHERE NR_PROCES' +
        'SO = :NR_PROCESSO ORDER BY CD_NCM')
    Left = 658
    Top = 654
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Value = '0102EM-002951-19'
      end>
    object qryNcmItemCD_NCM: TStringField
      FieldName = 'CD_NCM'
      Origin = 'CD_NCM'
      Size = 11
    end
  end
  object qryDescricaoItem: TFDQuery
    Connection = FireDacMSSQLConnection.Connection
    SQL.Strings = (
      'SELECT DISTINCT DM.TX_DESCRICAO_INGLES, DM.TX_DESCRICAO_ESPANHOL'
      'FROM TPROCESSO_EXP_NF_ITEM I'
      
        'LEFT JOIN TMERCADORIA_EXP ME ON ME.CD_MERCADORIA = I.CD_MERCADOR' +
        'IA'
      
        'LEFT JOIN TDESCRICAO_MERCADORIA_DRAFT DM ON DM.CODIGO = ME.CD_DE' +
        'SC_MERCADORIA_DRAFT'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      ''
      '/*'
      'SELECT DISTINCT DM.TX_DESCRICAO_INGLES, DM.TX_DESCRICAO_ESPANHOL'
      'FROM TPROCESSO_EXP_ITEM I'
      
        'LEFT JOIN TMERCADORIA_EXP ME ON ME.CD_MERCADORIA = I.CD_MERCADOR' +
        'IA'
      
        'LEFT JOIN TDESCRICAO_MERCADORIA_DRAFT DM ON DM.CODIGO = ME.CD_DE' +
        'SC_MERCADORIA_DRAFT'
      'WHERE NR_PROCESSO = '#39'0102EM-002951-19'#39
      '*/')
    Left = 658
    Top = 698
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Value = '0102EM-002951-19'
      end>
    object qryDescricaoItemTX_DESCRICAO_INGLES: TMemoField
      FieldName = 'TX_DESCRICAO_INGLES'
      Origin = 'TX_DESCRICAO_INGLES'
      BlobType = ftMemo
      Size = 2147483647
    end
    object qryDescricaoItemTX_DESCRICAO_ESPANHOL: TMemoField
      FieldName = 'TX_DESCRICAO_ESPANHOL'
      Origin = 'TX_DESCRICAO_ESPANHOL'
      BlobType = ftMemo
      Size = 2147483647
    end
  end
  object qryDraftRetorno: TFDQuery
    Connection = FireDacMSSQLConnection.Connection
    SQL.Strings = (
      '')
    Left = 524
    Top = 253
  end
  object qryReferenciaCliente: TFDQuery
    Connection = FireDacMSSQLConnection.Connection
    SQL.Strings = (
      'SELECT DISTINCT CD_REFERENCIA'
      'FROM TREF_CLIENTE '
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 658
    Top = 754
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Value = '0102EM-002951-19'
      end>
  end
end
