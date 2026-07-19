inherited formMyCdRegraObservacoesAuto: TformMyCdRegraObservacoesAuto
  Caption = 'Observa'#231#245'es Autom'#225'ticas'
  ClientHeight = 615
  ExplicitHeight = 653
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlButton: TPanel
    Top = 595
    ExplicitTop = 595
  end
  inherited PageControl: TPageControl
    Height = 595
    ExplicitHeight = 595
    inherited tshGrid: TTabSheet
      ExplicitHeight = 561
      inherited pnlButtonGrid: TPanel
        Height = 561
        ExplicitHeight = 561
      end
      inherited pnlGrid: TPanel
        Height = 561
        ExplicitHeight = 561
        inherited SplitterGridDetail: TSplitter
          Top = 445
          ExplicitTop = 447
        end
        inherited cxGrid: TcxGrid
          Height = 441
          ExplicitHeight = 441
          inherited cxGridDBTableView: TcxGridDBTableView
            object cxGridDBTableViewCdRegra: TcxGridDBColumn
              Caption = 'Cod. Regra'
              DataBinding.FieldName = 'CdRegra'
              Width = 70
            end
            object cxGridDBTableViewNmRegra: TcxGridDBColumn
              Caption = 'Regra'
              DataBinding.FieldName = 'NmRegra'
              Width = 287
            end
            object cxGridDBTableViewCdGrupo: TcxGridDBColumn
              Caption = 'Cod. Grupo'
              DataBinding.FieldName = 'Grupo.CdGrupo'
              Width = 97
            end
            object cxGridDBTableViewGrupoNmGrupo: TcxGridDBColumn
              Caption = 'Grupo'
              DataBinding.FieldName = 'Grupo.NmGrupo'
              Width = 150
            end
            object cxGridDBTableViewCdObservacao: TcxGridDBColumn
              Caption = 'Cod. Observa'#231#227'o'
              DataBinding.FieldName = 'CdObservacao'
              Width = 95
            end
          end
        end
        inherited cxGridDetailList: TcxGrid
          Top = 449
          ExplicitTop = 449
          inherited cxGridDBTableViewDetailList: TcxGridDBTableView
            object cxGridDBTableViewDetailListCdRegraItem: TcxGridDBColumn
              Caption = 'Cod Item'
              DataBinding.FieldName = 'CdRegraItem'
              Width = 70
            end
            object cxGridDBTableViewDetailListNmRegraItem: TcxGridDBColumn
              Caption = 'Regra '
              DataBinding.FieldName = 'NmRegraItem'
              Width = 300
            end
          end
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 30
      ExplicitWidth = 915
      ExplicitHeight = 561
      inherited pnlEditButon: TPanel
        Height = 561
        ExplicitHeight = 561
      end
      inherited pnlFundo: TPanel
        Height = 561
        ExplicitHeight = 561
        inherited pnlDetails: TPanel
          Height = 557
          ExplicitHeight = 557
          inherited SplitterDetail: TSplitter
            Top = 336
            ExplicitTop = 273
          end
          inherited PanelDetail: TPanel
            Top = 340
            Height = 217
            ExplicitTop = 340
            ExplicitHeight = 217
            inherited pgDetails: TPageControl
              Height = 217
              ExplicitHeight = 217
              inherited tbsDetail1: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 30
                ExplicitWidth = 804
                ExplicitHeight = 183
                inherited PageControlDetail: TPageControl
                  Height = 183
                  ExplicitHeight = 183
                  inherited tshDetailGrid: TTabSheet
                    ExplicitHeight = 152
                    inherited pnlEditButonDetail: TPanel
                      Height = 152
                      ExplicitHeight = 152
                    end
                    inherited cxGridDetail: TcxGrid
                      Height = 152
                      ExplicitHeight = 152
                      inherited cxGridDBTableViewDetail: TcxGridDBTableView
                        object cxGridDBTableViewDetailCdRegraItem: TcxGridDBColumn
                          Caption = 'Cod. Item'
                          DataBinding.FieldName = 'CdRegraItem'
                          Width = 70
                        end
                        object cxGridDBTableViewDetailNmRegraItem: TcxGridDBColumn
                          Caption = 'Regra'
                          DataBinding.FieldName = 'NmRegraItem'
                          Width = 200
                        end
                        object cxGridDBTableViewDetailTabelaDsTabelaRegra: TcxGridDBColumn
                          Caption = 'Tabela'
                          DataBinding.FieldName = 'Tabela.DsTabelaRegra'
                          Width = 200
                        end
                        object cxGridDBTableViewDetailCampoDsCampo: TcxGridDBColumn
                          Caption = 'Campo'
                          DataBinding.FieldName = 'Campo.DsCampo'
                          Width = 200
                        end
                        object cxGridDBTableViewDetailNmValorCampo: TcxGridDBColumn
                          Caption = 'Valor'
                          DataBinding.FieldName = 'NmValorCampo'
                          Width = 200
                        end
                      end
                    end
                  end
                  inherited tshDetailEdit: TTabSheet
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 158
                    object Label6: TLabel [0]
                      Left = 14
                      Top = 18
                      Width = 57
                      Height = 16
                      Caption = 'Cd. Regra'
                    end
                    object Label7: TLabel [1]
                      Left = 14
                      Top = 58
                      Width = 55
                      Height = 16
                      Caption = 'Descri'#231#227'o'
                    end
                    object Label11: TLabel [2]
                      Left = 14
                      Top = 101
                      Width = 81
                      Height = 16
                      Caption = 'Tabela - Filtro'
                    end
                    object Label12: TLabel [3]
                      Left = 318
                      Top = 99
                      Width = 82
                      Height = 16
                      Caption = 'Campo - Filtro'
                    end
                    object Label13: TLabel [4]
                      Left = 15
                      Top = 149
                      Width = 92
                      Height = 16
                      Caption = 'Valor do Campo'
                    end
                    object btnPesquisaValorItem: TSpeedButton [5]
                      Left = 141
                      Top = 163
                      Width = 23
                      Height = 23
                      Glyph.Data = {
                        F6060000424DF606000000000000360000002800000018000000180000000100
                        180000000000C0060000C40E0000C40E0000000000000000000000BFBF00BFBF
                        00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                        BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                        BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                        00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                        BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                        BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                        00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                        BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                        BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                        00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                        BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                        BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                        00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                        BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                        BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFD5DAE0B1BBC5
                        E0E4E800BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                        BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFA3
                        AFBA38516B25405D8695A500BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                        00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                        BF00BFBF687B8E173452002041223E5AA4AFBB00BFBF00BFBF00BFBF00BFBF00
                        BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFB9C2CBC0C8D0
                        00BFBF00BFBFCED4DA2E4863062545002041445B74BAC3CC00BFBF00BFBF00BF
                        BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF78899A10
                        2E4D102E4D052445102E4DB4BDC70928480020410625457E8E9FE6E9EC00BFBF
                        00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                        BF77889A1E3A578191A100BFBF00BFBF6A7D900020410020412C4662D1D7DD00
                        BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                        00BFBF00BFBFC4CBD34159716C7E9100BFBF00BFBF00BFBF00BFBF4C627A586D
                        8300BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                        BFBF00BFBF00BFBF00BFBF00BFBFA4AFBB4E647B99A6B300BFBF00BFBF00BFBF
                        00BFBFA2AEBA102E4D00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                        BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFBBC4CC4F657C8191A100
                        BFBF00BFBF00BFBF00BFBF708294344D6800BFBF00BFBF00BFBF00BFBF00BFBF
                        00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFF3F5
                        F65A6F843E566FB2BCC600BFBF00BFBFAEB8C312304E98A5B200BFBF00BFBF00
                        BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                        00BFBF00BFBF00BFBFB0BAC44058713F57706175895D7186354E684B627900BF
                        BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                        BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFC7CED57586984B6279445B74
                        8393A300BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                        BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                        BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                        00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                        BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                        BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                        00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                        BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                        BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                        00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                        BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                        BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                        00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                        BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                        BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF}
                      OnClick = btnPesquisaValorItemClick
                    end
                    object lblpesquisaItem: TLabel [6]
                      Left = 170
                      Top = 170
                      Width = 123
                      Height = 11
                      Caption = 'Campo sem pesquisa definida'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      Visible = False
                    end
                    inherited Panel8: TPanel
                      Height = 152
                      ExplicitHeight = 158
                    end
                    object dbedCdRegraItem: TDBEdit
                      Left = 14
                      Top = 34
                      Width = 121
                      Height = 24
                      Color = 14935011
                      DataField = 'CdRegraItem'
                      DataSource = dtsDetail
                      Enabled = False
                      TabOrder = 1
                    end
                    object dbedtDescricaoItem: TDBEdit
                      Left = 14
                      Top = 74
                      Width = 200
                      Height = 24
                      DataField = 'NmRegraItem'
                      DataSource = dtsDetail
                      TabOrder = 2
                    end
                    object dbcbCdRegraTabelaItem: TDBLookupComboBox
                      Left = 14
                      Top = 118
                      Width = 272
                      Height = 24
                      DataField = 'Tabela'
                      DataSource = dtsDetail
                      KeyField = 'Self'
                      ListField = 'DsTabelaRegra'
                      ListSource = dsRegraTabelaItem
                      TabOrder = 3
                      OnClick = dbcbCdRegraTabelaItemClick
                    end
                    object dbedtNmValorCampo: TDBEdit
                      Left = 14
                      Top = 165
                      Width = 121
                      Height = 24
                      DataField = 'NmValorCampo'
                      DataSource = dtsDetail
                      TabOrder = 4
                    end
                    object dbcbCdRegraCampoItem: TDBLookupComboBox
                      Left = 318
                      Top = 118
                      Width = 272
                      Height = 24
                      DataField = 'Campo'
                      DataSource = dtsDetail
                      KeyField = 'Self'
                      ListField = 'DsCampo'
                      ListSource = dsRegraCampoItem
                      TabOrder = 5
                    end
                  end
                end
              end
            end
          end
          inherited pnlMaster: TPanel
            Height = 336
            ExplicitHeight = 336
            object Label1: TLabel
              Left = 18
              Top = 22
              Width = 57
              Height = 16
              Caption = 'Cd. Regra'
            end
            object Label2: TLabel
              Left = 18
              Top = 62
              Width = 55
              Height = 16
              Caption = 'Descri'#231#227'o'
            end
            object Label3: TLabel
              Left = 19
              Top = 102
              Width = 34
              Height = 16
              Caption = 'Grupo'
            end
            object Label4: TLabel
              Left = 18
              Top = 193
              Width = 81
              Height = 16
              Caption = 'Tabela - Filtro'
            end
            object Label5: TLabel
              Left = 322
              Top = 191
              Width = 82
              Height = 16
              Caption = 'Campo - Filtro'
            end
            object Label8: TLabel
              Left = 19
              Top = 241
              Width = 92
              Height = 16
              Caption = 'Valor do Campo'
            end
            object btnPesquisaValorMaster: TSpeedButton
              Left = 145
              Top = 255
              Width = 23
              Height = 23
              Glyph.Data = {
                F6060000424DF606000000000000360000002800000018000000180000000100
                180000000000C0060000C40E0000C40E0000000000000000000000BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFD5DAE0B1BBC5
                E0E4E800BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFA3
                AFBA38516B25405D8695A500BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF687B8E173452002041223E5AA4AFBB00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFB9C2CBC0C8D0
                00BFBF00BFBFCED4DA2E4863062545002041445B74BAC3CC00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF78899A10
                2E4D102E4D052445102E4DB4BDC70928480020410625457E8E9FE6E9EC00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF77889A1E3A578191A100BFBF00BFBF6A7D900020410020412C4662D1D7DD00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBFC4CBD34159716C7E9100BFBF00BFBF00BFBF00BFBF4C627A586D
                8300BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBFA4AFBB4E647B99A6B300BFBF00BFBF00BFBF
                00BFBFA2AEBA102E4D00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFBBC4CC4F657C8191A100
                BFBF00BFBF00BFBF00BFBF708294344D6800BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFF3F5
                F65A6F843E566FB2BCC600BFBF00BFBFAEB8C312304E98A5B200BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBFB0BAC44058713F57706175895D7186354E684B627900BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFC7CED57586984B6279445B74
                8393A300BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF}
              OnClick = btnPesquisaValorMasterClick
            end
            object Label9: TLabel
              Left = 18
              Top = 287
              Width = 67
              Height = 16
              Caption = 'Observa'#231#227'o'
            end
            object btnSelecionarObs: TSpeedButton
              Left = 145
              Top = 301
              Width = 23
              Height = 23
              Glyph.Data = {
                F6060000424DF606000000000000360000002800000018000000180000000100
                180000000000C0060000C40E0000C40E0000000000000000000000BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFD5DAE0B1BBC5
                E0E4E800BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFA3
                AFBA38516B25405D8695A500BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF687B8E173452002041223E5AA4AFBB00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFB9C2CBC0C8D0
                00BFBF00BFBFCED4DA2E4863062545002041445B74BAC3CC00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF78899A10
                2E4D102E4D052445102E4DB4BDC70928480020410625457E8E9FE6E9EC00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF77889A1E3A578191A100BFBF00BFBF6A7D900020410020412C4662D1D7DD00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBFC4CBD34159716C7E9100BFBF00BFBF00BFBF00BFBF4C627A586D
                8300BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBFA4AFBB4E647B99A6B300BFBF00BFBF00BFBF
                00BFBFA2AEBA102E4D00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFBBC4CC4F657C8191A100
                BFBF00BFBF00BFBF00BFBF708294344D6800BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFF3F5
                F65A6F843E566FB2BCC600BFBF00BFBFAEB8C312304E98A5B200BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBFB0BAC44058713F57706175895D7186354E684B627900BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFC7CED57586984B6279445B74
                8393A300BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF}
              OnClick = btnSelecionarObsClick
            end
            object lblpesquisa: TLabel
              Left = 174
              Top = 262
              Width = 123
              Height = 11
              Caption = 'Campo sem pesquisa definida'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object Label10: TLabel
              Left = 19
              Top = 150
              Width = 42
              Height = 16
              Caption = 'Servi'#231'o'
            end
            object SpeedButton1: TSpeedButton
              Left = 146
              Top = 164
              Width = 23
              Height = 23
              Glyph.Data = {
                F6060000424DF606000000000000360000002800000018000000180000000100
                180000000000C0060000C40E0000C40E0000000000000000000000BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFD5DAE0B1BBC5
                E0E4E800BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFA3
                AFBA38516B25405D8695A500BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF687B8E173452002041223E5AA4AFBB00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFB9C2CBC0C8D0
                00BFBF00BFBFCED4DA2E4863062545002041445B74BAC3CC00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF78899A10
                2E4D102E4D052445102E4DB4BDC70928480020410625457E8E9FE6E9EC00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF77889A1E3A578191A100BFBF00BFBF6A7D900020410020412C4662D1D7DD00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBFC4CBD34159716C7E9100BFBF00BFBF00BFBF00BFBF4C627A586D
                8300BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBFA4AFBB4E647B99A6B300BFBF00BFBF00BFBF
                00BFBFA2AEBA102E4D00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFBBC4CC4F657C8191A100
                BFBF00BFBF00BFBF00BFBF708294344D6800BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFF3F5
                F65A6F843E566FB2BCC600BFBF00BFBFAEB8C312304E98A5B200BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBFB0BAC44058713F57706175895D7186354E684B627900BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBFC7CED57586984B6279445B74
                8393A300BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF
                00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BF
                BF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00
                BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF00BFBF}
              OnClick = SpeedButton1Click
            end
            object dbedtCdRegra: TDBEdit
              Left = 18
              Top = 38
              Width = 121
              Height = 24
              Color = 14935011
              DataField = 'CdRegra'
              DataSource = dtsMain
              Enabled = False
              TabOrder = 0
            end
            object dbedtDescricao: TDBEdit
              Left = 18
              Top = 78
              Width = 200
              Height = 24
              DataField = 'NmRegra'
              DataSource = dtsMain
              TabOrder = 1
            end
            object dbcbCdRegraTabela: TDBLookupComboBox
              Left = 18
              Top = 210
              Width = 272
              Height = 24
              DataField = 'Tabela'
              DataSource = dtsMain
              KeyField = 'Self'
              ListField = 'DsTabelaRegra'
              ListSource = dsRegraTabela
              TabOrder = 2
              OnClick = dbcbCdRegraTabelaClick
            end
            object dbedtValorCampo: TDBEdit
              Left = 18
              Top = 257
              Width = 121
              Height = 24
              DataField = 'NmValorCampo'
              DataSource = dtsMain
              TabOrder = 3
            end
            object dbedtCD_OBS: TDBEdit
              Left = 18
              Top = 303
              Width = 121
              Height = 24
              DataField = 'CdObservacao'
              DataSource = dtsMain
              TabOrder = 4
            end
            object dbcbCdRegraCampo: TDBLookupComboBox
              Left = 322
              Top = 210
              Width = 272
              Height = 24
              DataField = 'Campo'
              DataSource = dtsMain
              KeyField = 'Self'
              ListField = 'DsCampo'
              ListSource = dsRegraCampo
              TabOrder = 5
            end
            object dbcbGrupo: TDBLookupComboBox
              Left = 19
              Top = 118
              Width = 66
              Height = 24
              DataField = 'Grupo'
              DataSource = dtsMain
              DropDownWidth = 272
              KeyField = 'Self'
              ListField = 'CdGrupo;NmGrupo'
              ListSource = dsGrupo
              NullValueKey = 16401
              TabOrder = 6
            end
            object dbcbNmGrupo: TDBLookupComboBox
              Left = 87
              Top = 118
              Width = 203
              Height = 24
              DataField = 'Grupo'
              DataSource = dtsMain
              DropDownWidth = 272
              KeyField = 'Self'
              ListField = 'NmGrupo'
              ListSource = dsGrupo
              NullValueKey = 16401
              TabOrder = 7
            end
            object dbedtServico: TDBEdit
              Left = 19
              Top = 166
              Width = 121
              Height = 24
              DataField = 'CdServico'
              DataSource = dtsMain
              TabOrder = 8
            end
          end
        end
      end
    end
  end
  inherited dtsMain: TDataSource
    AutoEdit = True
    Left = 776
    Top = 544
  end
  inherited dtsDetail: TDataSource
    AutoEdit = True
    Left = 680
    Top = 544
  end
  inherited adsMain: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdRegra'
        Attributes = [faReadonly, faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NmRegra'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NmValorCampo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CdObservacao'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CdServico'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Grupo'
        DataType = ftVariant
      end
      item
        Name = 'Grupo.CdGrupo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Grupo.NmGrupo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Grupo.DtInclusao'
        DataType = ftDateTime
      end
      item
        Name = 'Grupo.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Grupo.CnpjGrupo'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Grupo.DtNovoFollowupImp'
        DataType = ftDateTime
      end
      item
        Name = 'Grupo.DtNovoFollowupExp'
        DataType = ftDateTime
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
      end
      item
        Name = 'Campo'
        DataType = ftVariant
      end
      item
        Name = 'Campo.CdRegraCampo'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'Campo.NmCampo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Campo.DsCampo'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Campo.NmTabelaOrigem'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Campo.NmCampoCdOrigem'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Campo.NmCampoDsOrigem'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Campo.Tabela'
        DataType = ftVariant
      end
      item
        Name = 'Campo.Tabela.CdRegraTabela'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'Campo.Tabela.NmTabelaRegra'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Campo.Tabela.DsTabelaRegra'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Campo.Tabela.Campos'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'RegraItem'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    BeforeInsert = adsMainBeforeInsert
    BeforeEdit = adsMainBeforeEdit
    SubpropsDepth = 2
    Top = 544
    DesignClass = 'MyEntitiesBroker.TTregraObsAuto'
    object adsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsMainCdRegra: TIntegerField
      FieldName = 'CdRegra'
      ReadOnly = True
      Required = True
    end
    object adsMainNmRegra: TStringField
      FieldName = 'NmRegra'
      Size = 100
    end
    object adsMainNmValorCampo: TStringField
      FieldName = 'NmValorCampo'
      Size = 50
    end
    object adsMainCdObservacao: TStringField
      FieldName = 'CdObservacao'
      Size = 4
    end
    object adsMainCdServico: TStringField
      FieldName = 'CdServico'
      Size = 5
    end
    object adsMainGrupo: TAureliusEntityField
      FieldName = 'Grupo'
    end
    object adsMainGrupoCdGrupo: TStringField
      FieldName = 'Grupo.CdGrupo'
      Size = 3
    end
    object adsMainGrupoNmGrupo: TStringField
      FieldName = 'Grupo.NmGrupo'
      Size = 50
    end
    object adsMainGrupoDtInclusao: TDateTimeField
      FieldName = 'Grupo.DtInclusao'
    end
    object adsMainGrupoInAtivo: TStringField
      FieldName = 'Grupo.InAtivo'
      Size = 1
    end
    object adsMainGrupoCnpjGrupo: TStringField
      FieldName = 'Grupo.CnpjGrupo'
      Size = 14
    end
    object adsMainGrupoDtNovoFollowupImp: TDateTimeField
      FieldName = 'Grupo.DtNovoFollowupImp'
    end
    object adsMainGrupoDtNovoFollowupExp: TDateTimeField
      FieldName = 'Grupo.DtNovoFollowupExp'
    end
    object adsMainTabela: TAureliusEntityField
      FieldName = 'Tabela'
    end
    object adsMainTabelaCdRegraTabela: TIntegerField
      FieldName = 'Tabela.CdRegraTabela'
      ReadOnly = True
    end
    object adsMainTabelaNmTabelaRegra: TStringField
      FieldName = 'Tabela.NmTabelaRegra'
      Size = 50
    end
    object adsMainTabelaDsTabelaRegra: TStringField
      FieldName = 'Tabela.DsTabelaRegra'
      Size = 100
    end
    object adsMainTabelaCampos: TDataSetField
      FieldName = 'Tabela.Campos'
      ReadOnly = True
    end
    object adsMainCampo: TAureliusEntityField
      FieldName = 'Campo'
    end
    object adsMainCampoCdRegraCampo: TIntegerField
      FieldName = 'Campo.CdRegraCampo'
      ReadOnly = True
    end
    object adsMainCampoNmCampo: TStringField
      FieldName = 'Campo.NmCampo'
      Size = 50
    end
    object adsMainCampoDsCampo: TStringField
      FieldName = 'Campo.DsCampo'
      Size = 100
    end
    object adsMainCampoNmTabelaOrigem: TStringField
      FieldName = 'Campo.NmTabelaOrigem'
      Size = 50
    end
    object adsMainCampoNmCampoCdOrigem: TStringField
      FieldName = 'Campo.NmCampoCdOrigem'
      Size = 50
    end
    object adsMainCampoNmCampoDsOrigem: TStringField
      FieldName = 'Campo.NmCampoDsOrigem'
      Size = 50
    end
    object adsMainCampoTabela: TAureliusEntityField
      FieldName = 'Campo.Tabela'
    end
    object adsMainCampoTabelaCdRegraTabela: TIntegerField
      FieldName = 'Campo.Tabela.CdRegraTabela'
      ReadOnly = True
    end
    object adsMainCampoTabelaNmTabelaRegra: TStringField
      FieldName = 'Campo.Tabela.NmTabelaRegra'
      Size = 50
    end
    object adsMainCampoTabelaDsTabelaRegra: TStringField
      FieldName = 'Campo.Tabela.DsTabelaRegra'
      Size = 100
    end
    object adsMainCampoTabelaCampos: TDataSetField
      FieldName = 'Campo.Tabela.Campos'
      ReadOnly = True
    end
    object adsMainRegraItem: TDataSetField
      FieldName = 'RegraItem'
      ReadOnly = True
    end
  end
  inherited cxGridPopupMenu: TcxGridPopupMenu
    Left = 768
    Top = 272
  end
  inherited adsDetail: TAureliusDataset
    DatasetField = adsMainRegraItem
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdRegraItem'
        Attributes = [faReadonly, faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NmRegraItem'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NmValorCampo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Regra'
        DataType = ftVariant
      end
      item
        Name = 'Regra.CdRegra'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'Regra.NmRegra'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Regra.NmValorCampo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Regra.CdObservacao'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Regra.CdServico'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Regra.Grupo'
        DataType = ftVariant
      end
      item
        Name = 'Regra.Tabela'
        DataType = ftVariant
      end
      item
        Name = 'Regra.Campo'
        DataType = ftVariant
      end
      item
        Name = 'Regra.RegraItem'
        Attributes = [faReadonly]
        DataType = ftDataSet
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
      end
      item
        Name = 'Campo'
        DataType = ftVariant
      end
      item
        Name = 'Campo.CdRegraCampo'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'Campo.NmCampo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Campo.DsCampo'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Campo.NmTabelaOrigem'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Campo.NmCampoCdOrigem'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Campo.NmCampoDsOrigem'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Campo.Tabela'
        DataType = ftVariant
      end>
    BeforeInsert = adsDetailBeforeInsert
    BeforeEdit = adsDetailBeforeEdit
    IncludeUnmappedObjects = True
    SubpropsDepth = 1
    Left = 688
    Top = 544
    DesignClass = 'MyEntitiesBroker.TTregraObsAutoItem'
    object adsDetailSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsDetailCdRegraItem: TIntegerField
      FieldName = 'CdRegraItem'
      ReadOnly = True
      Required = True
    end
    object adsDetailNmRegraItem: TStringField
      FieldName = 'NmRegraItem'
      Size = 100
    end
    object adsDetailNmValorCampo: TStringField
      FieldName = 'NmValorCampo'
      Size = 50
    end
    object adsDetailRegra: TAureliusEntityField
      FieldName = 'Regra'
    end
    object adsDetailRegraCdRegra: TIntegerField
      FieldName = 'Regra.CdRegra'
      ReadOnly = True
    end
    object adsDetailRegraNmRegra: TStringField
      FieldName = 'Regra.NmRegra'
      Size = 100
    end
    object adsDetailRegraNmValorCampo: TStringField
      FieldName = 'Regra.NmValorCampo'
      Size = 50
    end
    object adsDetailRegraCdObservacao: TStringField
      FieldName = 'Regra.CdObservacao'
      Size = 4
    end
    object adsDetailRegraCdServico: TStringField
      FieldName = 'Regra.CdServico'
      Size = 5
    end
    object adsDetailRegraGrupo: TAureliusEntityField
      FieldName = 'Regra.Grupo'
    end
    object adsDetailRegraTabela: TAureliusEntityField
      FieldName = 'Regra.Tabela'
    end
    object adsDetailRegraCampo: TAureliusEntityField
      FieldName = 'Regra.Campo'
    end
    object adsDetailRegraRegraItem: TDataSetField
      FieldName = 'Regra.RegraItem'
      ReadOnly = True
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
    object adsDetailCampo: TAureliusEntityField
      FieldName = 'Campo'
    end
    object adsDetailCampoCdRegraCampo: TIntegerField
      FieldName = 'Campo.CdRegraCampo'
      ReadOnly = True
    end
    object adsDetailCampoNmCampo: TStringField
      FieldName = 'Campo.NmCampo'
      Size = 50
    end
    object adsDetailCampoDsCampo: TStringField
      FieldName = 'Campo.DsCampo'
      Size = 100
    end
    object adsDetailCampoNmTabelaOrigem: TStringField
      FieldName = 'Campo.NmTabelaOrigem'
      Size = 50
    end
    object adsDetailCampoNmCampoCdOrigem: TStringField
      FieldName = 'Campo.NmCampoCdOrigem'
      Size = 50
    end
    object adsDetailCampoNmCampoDsOrigem: TStringField
      FieldName = 'Campo.NmCampoDsOrigem'
      Size = 50
    end
    object adsDetailCampoTabela: TAureliusEntityField
      FieldName = 'Campo.Tabela'
    end
  end
  object adsRegraTabela: TAureliusDataset
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
      end>
    SubpropsDepth = 1
    Left = 264
    Top = 216
    DesignClass = 'MyEntitiesBroker.TTregraObsAutoTabelas'
    object adsRegraTabelaSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsRegraTabelaCdRegraTabela: TIntegerField
      FieldName = 'CdRegraTabela'
      ReadOnly = True
      Required = True
    end
    object adsRegraTabelaNmTabelaRegra: TStringField
      FieldName = 'NmTabelaRegra'
      Size = 50
    end
    object adsRegraTabelaDsTabelaRegra: TStringField
      FieldName = 'DsTabelaRegra'
      Size = 100
    end
  end
  object dsRegraTabela: TDataSource
    AutoEdit = False
    DataSet = adsRegraTabela
    Left = 240
    Top = 216
  end
  object adsRegraCampo: TAureliusDataset
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
      end>
    SubpropsDepth = 1
    Left = 560
    Top = 208
    DesignClass = 'MyEntitiesBroker.TTregraObsAutoTabelasCampos'
    object adsRegraCampoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsRegraCampoCdRegraCampo: TIntegerField
      FieldName = 'CdRegraCampo'
      ReadOnly = True
      Required = True
    end
    object adsRegraCampoNmCampo: TStringField
      FieldName = 'NmCampo'
      Size = 50
    end
    object adsRegraCampoDsCampo: TStringField
      FieldName = 'DsCampo'
      Size = 100
    end
    object adsRegraCampoNmTabelaOrigem: TStringField
      FieldName = 'NmTabelaOrigem'
      Size = 50
    end
    object adsRegraCampoNmCampoCdOrigem: TStringField
      FieldName = 'NmCampoCdOrigem'
      Size = 50
    end
    object adsRegraCampoNmCampoDsOrigem: TStringField
      FieldName = 'NmCampoDsOrigem'
      Size = 50
    end
    object adsRegraCampoTabela: TAureliusEntityField
      FieldName = 'Tabela'
    end
    object adsRegraCampoTabelaCdRegraTabela: TIntegerField
      FieldName = 'Tabela.CdRegraTabela'
      ReadOnly = True
    end
    object adsRegraCampoTabelaNmTabelaRegra: TStringField
      FieldName = 'Tabela.NmTabelaRegra'
      Size = 50
    end
    object adsRegraCampoTabelaDsTabelaRegra: TStringField
      FieldName = 'Tabela.DsTabelaRegra'
      Size = 100
    end
  end
  object dsRegraCampo: TDataSource
    AutoEdit = False
    DataSet = adsRegraCampo
    Left = 536
    Top = 208
  end
  object adsRegraTabelaItem: TAureliusDataset
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
    Left = 288
    Top = 448
    DesignClass = 'MyEntitiesBroker.TTregraObsAutoTabelas'
    object adsRegraTabelaItemSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsRegraTabelaItemCdRegraTabela: TIntegerField
      FieldName = 'CdRegraTabela'
      ReadOnly = True
      Required = True
    end
    object adsRegraTabelaItemNmTabelaRegra: TStringField
      FieldName = 'NmTabelaRegra'
      Size = 50
    end
    object adsRegraTabelaItemDsTabelaRegra: TStringField
      FieldName = 'DsTabelaRegra'
      Size = 100
    end
    object adsRegraTabelaItemCampos: TDataSetField
      FieldName = 'Campos'
      ReadOnly = True
    end
  end
  object dsRegraTabelaItem: TDataSource
    AutoEdit = False
    DataSet = adsRegraTabelaItem
    Left = 304
    Top = 448
  end
  object dsRegraCampoItem: TDataSource
    AutoEdit = False
    DataSet = adsRegraCampoItem
    Left = 504
    Top = 448
  end
  object adsRegraCampoItem: TAureliusDataset
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
        Name = 'Tabela'
        DataType = ftVariant
      end>
    Left = 512
    Top = 448
    DesignClass = 'MyEntitiesBroker.TTregraObsAutoTabelasCampos'
    object adsRegraCampoItemSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsRegraCampoItemCdRegraCampo: TIntegerField
      FieldName = 'CdRegraCampo'
      ReadOnly = True
      Required = True
    end
    object adsRegraCampoItemNmCampo: TStringField
      FieldName = 'NmCampo'
      Size = 50
    end
    object adsRegraCampoItemDsCampo: TStringField
      FieldName = 'DsCampo'
      Size = 100
    end
    object adsRegraCampoItemNmTabelaOrigem: TStringField
      FieldName = 'NmTabelaOrigem'
      Size = 50
    end
    object adsRegraCampoItemNmCampoCdOrigem: TStringField
      FieldName = 'NmCampoCdOrigem'
      Size = 50
    end
    object adsRegraCampoItemNmCampoDsOrigem: TStringField
      FieldName = 'NmCampoDsOrigem'
      Size = 50
    end
    object adsRegraCampoItemTabela: TAureliusEntityField
      FieldName = 'Tabela'
    end
  end
  object adsGrupo: TAureliusDataset
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
      end>
    SubpropsDepth = 1
    Left = 272
    Top = 128
    DesignClass = 'MyEntitiesBroker.TTgrupo'
    object adsGrupoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsGrupoCdGrupo: TStringField
      FieldName = 'CdGrupo'
      Required = True
      Size = 3
    end
    object adsGrupoNmGrupo: TStringField
      FieldName = 'NmGrupo'
      Required = True
      Size = 50
    end
    object adsGrupoDtInclusao: TDateTimeField
      FieldName = 'DtInclusao'
      Required = True
    end
    object adsGrupoInAtivo: TStringField
      FieldName = 'InAtivo'
      Required = True
      Size = 1
    end
    object adsGrupoCnpjGrupo: TStringField
      FieldName = 'CnpjGrupo'
      Size = 14
    end
    object adsGrupoDtNovoFollowupImp: TDateTimeField
      FieldName = 'DtNovoFollowupImp'
    end
    object adsGrupoDtNovoFollowupExp: TDateTimeField
      FieldName = 'DtNovoFollowupExp'
    end
  end
  object dsGrupo: TDataSource
    AutoEdit = False
    DataSet = adsGrupo
    Left = 248
    Top = 128
  end
end
