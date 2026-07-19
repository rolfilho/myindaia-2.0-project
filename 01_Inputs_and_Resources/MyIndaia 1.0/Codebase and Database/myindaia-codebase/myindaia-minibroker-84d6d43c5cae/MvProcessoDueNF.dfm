inherited formMvProcessoDueNF: TformMvProcessoDueNF
  Hint = 'Preenche os valores de VMLE, VMCV e Peso L'#237'quido'
  Caption = 'Processo DUE - NF'
  ClientHeight = 742
  ClientWidth = 1088
  ExplicitWidth = 1104
  ExplicitHeight = 781
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlButton: TPanel
    Top = 714
    Width = 1088
    Height = 28
    BevelOuter = bvRaised
    ParentBiDiMode = False
    ExplicitTop = 714
    ExplicitWidth = 1088
    ExplicitHeight = 28
    object lblProgressoNF: TLabel
      Left = 6
      Top = 8
      Width = 288
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = 'Calculando ...                    Notas Fiscais: 000/000'
      ParentBiDiMode = False
    end
    object lblProgressoNFItens: TLabel
      Left = 393
      Top = 9
      Width = 84
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = 'Itens: 000/000'
      ParentBiDiMode = False
    end
    object pgbProgressoNFItens: TProgressBar
      Left = 482
      Top = 6
      Width = 200
      Height = 17
      MarqueeInterval = 2
      TabOrder = 0
    end
    object pgbProgressoNF: TProgressBar
      Left = 245
      Top = 6
      Width = 129
      Height = 17
      MarqueeInterval = 2
      TabOrder = 1
    end
  end
  inherited PageControl: TPageControl
    Width = 1088
    Height = 714
    ExplicitWidth = 1088
    ExplicitHeight = 714
    inherited tshGrid: TTabSheet
      ExplicitWidth = 1080
      ExplicitHeight = 680
      inherited pnlButtonGrid: TPanel
        Left = 977
        Height = 680
        ExplicitLeft = 977
        ExplicitHeight = 680
        object Bevel3: TBevel [0]
          Left = 15
          Top = 127
          Width = 80
          Height = 2
        end
        inherited btnIncluir: TButton
          Width = 83
          Enabled = False
          ExplicitWidth = 83
        end
        inherited btnAlterar: TButton
          Width = 83
          ExplicitWidth = 83
        end
        inherited btnConsultar: TButton
          Width = 83
          Enabled = False
          ExplicitWidth = 83
        end
        inherited btnExcluir: TButton
          Width = 83
          ExplicitWidth = 83
        end
        object btnCalcular: TButton [5]
          Left = 15
          Top = 194
          Width = 83
          Height = 25
          Hint = 'Preencher valores de VMLE, VMCV e Peso L'#237'quido'
          Anchors = [akTop, akRight]
          Caption = 'Calcular'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = btnCalcularClick
        end
        inherited cbxAltRapida: TCheckBox
          Left = 15
          Top = 384
          Width = 91
          TabOrder = 5
          ExplicitLeft = 15
          ExplicitTop = 384
          ExplicitWidth = 91
        end
        object btnIncluirNFSefaz: TButton
          Left = 15
          Top = 133
          Width = 83
          Height = 25
          Hint = 'Incluir NF e Itens'
          Anchors = [akTop, akRight]
          Caption = '+ Nota Fiscal'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = btnIncluirNFSefazClick
        end
        object btnLerXML: TButton
          Left = 15
          Top = 164
          Width = 83
          Height = 25
          Hint = 'Incluir NF e Itens'
          Anchors = [akTop, akRight]
          Caption = 'Ler XML'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = btnLerXMLClick
        end
        object btnIntegracaoPirelli: TButton
          Left = 15
          Top = 223
          Width = 83
          Height = 42
          Hint = 'Preencher valores de VMLE, VMCV e Peso L'#237'quido'
          Anchors = [akTop, akRight]
          Caption = 'Integra'#231#227'o Pirelli'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          Visible = False
          WordWrap = True
          OnClick = btnIntegracaoPirelliClick
        end
        object Button1: TButton
          Left = 15
          Top = 407
          Width = 83
          Height = 47
          Hint = 'Preencher valores de VMLE, VMCV e Peso L'#237'quido'
          Anchors = [akTop, akRight]
          Caption = 'TESTE C'#225'lculo (NF)'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          WordWrap = True
          OnClick = Button1Click
        end
        object btnIntegracaoCargill: TButton
          Left = 15
          Top = 270
          Width = 83
          Height = 42
          Hint = 'Preencher valores de VMLE,  Peso L'#237'quido e Ato Concess'#243'rio.'
          Anchors = [akTop, akRight]
          Caption = 'Integra'#231#227'o Cargill'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          Visible = False
          WordWrap = True
          OnClick = btnIntegracaoCargillClick
        end
        object btnIntegracaoNotasReferenciadasLote: TButton
          Left = 15
          Top = 317
          Width = 83
          Height = 42
          Hint = 'Integrar as Notas Referenciadas em Lote.'
          Anchors = [akTop, akRight]
          Caption = 'Integra'#231#227'o NF Ref.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          WordWrap = True
          OnClick = btnIntegracaoNotasReferenciadasLoteClick
        end
      end
      inherited pnlGrid: TPanel
        Width = 977
        Height = 680
        ExplicitWidth = 977
        ExplicitHeight = 680
        inherited SplitterGridDetail: TSplitter
          Top = 305
          Width = 977
          ExplicitTop = 219
          ExplicitWidth = 971
        end
        inherited cxGrid: TcxGrid
          Width = 977
          Height = 301
          ExplicitWidth = 977
          ExplicitHeight = 301
          inherited cxGridDBTableView: TcxGridDBTableView
            DataController.DataModeController.GridMode = False
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Kind = skSum
                Position = spFooter
                Column = cxGridDBTableViewPlMercadoriaTotal
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '#,##0.00000'
                Kind = skSum
                Column = cxGridDBTableViewPlMercadoriaTotal
              end
              item
                Format = '#,##0.00000'
                Kind = skSum
                Column = cxGridDBTableViewQtTributavelTotal
              end
              item
                Format = '#,##0.00000'
                Kind = skSum
                Column = cxGridDBTableViewQtComercialTotal
              end
              item
                Format = '#,##0.00'
                Kind = skSum
                Column = cxGridDBTableViewVlLocalEmbarqueTotal
              end
              item
                Format = '#,##0.00'
                Kind = skSum
                Column = cxGridDBTableViewVlCondicaoVendaTotal
              end
              item
                Kind = skCount
                Column = cxGridDBTableViewNrNf
              end>
            OptionsBehavior.FocusCellOnTab = True
            OptionsView.Footer = True
            object cxGridDBTableViewNrProcesso: TcxGridDBColumn
              DataBinding.FieldName = 'NrProcesso'
            end
            object cxGridDBTableViewDtNota: TcxGridDBColumn
              DataBinding.FieldName = 'DtNota'
            end
            object cxGridDBTableViewNrNf: TcxGridDBColumn
              DataBinding.FieldName = 'NrNf'
            end
            object cxGridDBTableViewChaveNota: TcxGridDBColumn
              DataBinding.FieldName = 'ChaveNota'
            end
            object cxGridDBTableViewPlMercadoriaTotal: TcxGridDBColumn
              DataBinding.FieldName = 'PlMercadoriaTotal'
              Width = 120
            end
            object cxGridDBTableViewVlLocalEmbarqueTotal: TcxGridDBColumn
              DataBinding.FieldName = 'VlLocalEmbarqueTotal'
              Width = 120
            end
            object cxGridDBTableViewVlCondicaoVendaTotal: TcxGridDBColumn
              DataBinding.FieldName = 'VlCondicaoVendaTotal'
              Width = 120
            end
            object cxGridDBTableViewQtComercialTotal: TcxGridDBColumn
              DataBinding.FieldName = 'QtComercialTotal'
              Width = 120
            end
            object cxGridDBTableViewQtTributavelTotal: TcxGridDBColumn
              DataBinding.FieldName = 'QtTributavelTotal'
              Width = 120
            end
            object cxGridDBTableViewSelf: TcxGridDBColumn
              DataBinding.FieldName = 'Self'
              Visible = False
            end
            object cxGridDBTableViewVlNota: TcxGridDBColumn
              DataBinding.FieldName = 'VlNota'
              Visible = False
            end
            object cxGridDBTableViewNfSerie: TcxGridDBColumn
              DataBinding.FieldName = 'NfSerie'
              Visible = False
            end
            object cxGridDBTableViewVlTaxa: TcxGridDBColumn
              DataBinding.FieldName = 'VlTaxa'
              Visible = False
            end
            object cxGridDBTableViewNrRe: TcxGridDBColumn
              DataBinding.FieldName = 'NrRe'
              Visible = False
            end
            object cxGridDBTableViewVlTotalProdutos: TcxGridDBColumn
              DataBinding.FieldName = 'VlTotalProdutos'
              Visible = False
            end
            object cxGridDBTableViewVlFrete: TcxGridDBColumn
              DataBinding.FieldName = 'VlFrete'
              Visible = False
            end
            object cxGridDBTableViewVlSeguro: TcxGridDBColumn
              DataBinding.FieldName = 'VlSeguro'
              Visible = False
            end
            object cxGridDBTableViewVlTotalDescontos: TcxGridDBColumn
              DataBinding.FieldName = 'VlTotalDescontos'
              Visible = False
            end
            object cxGridDBTableViewVlOutrasDespesas: TcxGridDBColumn
              DataBinding.FieldName = 'VlOutrasDespesas'
              Visible = False
            end
            object cxGridDBTableViewVlMleMneg: TcxGridDBColumn
              DataBinding.FieldName = 'VlMleMneg'
              Visible = False
            end
            object cxGridDBTableViewProcessoExpNfItem: TcxGridDBColumn
              DataBinding.FieldName = 'ProcessoExpNfItem'
              Visible = False
            end
          end
        end
        inherited cxGridDetailList: TcxGrid
          Top = 309
          Width = 977
          Height = 371
          ExplicitTop = 309
          ExplicitWidth = 977
          ExplicitHeight = 371
          inherited cxGridDBTableViewDetailList: TcxGridDBTableView
            DataController.DataModeController.DetailInSQLMode = True
            DataController.DataModeController.GridMode = False
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '#,##0.00000'
                Kind = skSum
                Column = cxGridDBTableViewDetailListPlMercadoria
              end
              item
                Format = '#,##0.00000'
                Kind = skSum
                Column = cxGridDBTableViewDetailListQtComercial
              end
              item
                Format = '#,##0.00000'
                Kind = skSum
                Column = cxGridDBTableViewDetailListQtTributavel
              end
              item
                Format = '#,##0.00'
                Kind = skSum
                Column = cxGridDBTableViewDetailListVlLocalEmbarque
              end
              item
                Format = '#,##0.00'
                Kind = skSum
                Column = cxGridDBTableViewDetailListVlCondicaoVenda
              end
              item
                Format = '#,##0.00'
                Kind = skSum
                Column = cxGridDBTableViewDetailListVlItem
              end
              item
                Kind = skCount
                Column = cxGridDBTableViewDetailListNrItemNf
              end>
            OptionsView.Footer = True
            object cxGridDBTableViewDetailListNrItemNf: TcxGridDBColumn
              DataBinding.FieldName = 'NrItemNf'
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListNrItemDue: TcxGridDBColumn
              DataBinding.FieldName = 'NrItemDue'
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListNcmCodigo: TcxGridDBColumn
              DataBinding.FieldName = 'Ncm.Codigo'
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListNmSituacaoNcmAtributo: TcxGridDBColumn
              DataBinding.FieldName = 'NmSituacaoNcmAtributo'
              Width = 200
            end
            object cxGridDBTableViewDetailListCdNcmDestaqueDominio: TcxGridDBColumn
              DataBinding.FieldName = 'CdNcmDestaqueDominio'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListApMercadoria: TcxGridDBColumn
              DataBinding.FieldName = 'ApMercadoria'
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListCdMercadoria: TcxGridDBColumn
              DataBinding.FieldName = 'CdMercadoria'
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListPlMercadoria: TcxGridDBColumn
              DataBinding.FieldName = 'PlMercadoria'
              Options.Editing = False
              Width = 120
            end
            object cxGridDBTableViewDetailListVlLocalEmbarque: TcxGridDBColumn
              DataBinding.FieldName = 'VlLocalEmbarque'
              Options.Editing = False
              Width = 120
            end
            object cxGridDBTableViewDetailListVlCondicaoVenda: TcxGridDBColumn
              DataBinding.FieldName = 'VlCondicaoVenda'
              Options.Editing = False
              Width = 120
            end
            object cxGridDBTableViewDetailListVlItem: TcxGridDBColumn
              DataBinding.FieldName = 'VlItem'
              Options.Editing = False
              Width = 65
            end
            object cxGridDBTableViewDetailListQtComercial: TcxGridDBColumn
              DataBinding.FieldName = 'QtComercial'
              Options.Editing = False
              Width = 120
            end
            object cxGridDBTableViewDetailListUnComercial: TcxGridDBColumn
              DataBinding.FieldName = 'UnComercial'
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListQtTributavel: TcxGridDBColumn
              DataBinding.FieldName = 'QtTributavel'
              Options.Editing = False
              Width = 120
            end
            object cxGridDBTableViewDetailListUnTributavel: TcxGridDBColumn
              DataBinding.FieldName = 'UnTributavel'
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListNrItem: TcxGridDBColumn
              DataBinding.FieldName = 'NrItem'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListSelf: TcxGridDBColumn
              DataBinding.FieldName = 'Self'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListNmMercadoria: TcxGridDBColumn
              DataBinding.FieldName = 'NmMercadoria'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListCdUnMed: TcxGridDBColumn
              DataBinding.FieldName = 'CdUnMed'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListQtUnidadeEstatistica: TcxGridDBColumn
              DataBinding.FieldName = 'QtUnidadeEstatistica'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListVlOutrasDesp: TcxGridDBColumn
              DataBinding.FieldName = 'VlOutrasDesp'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListVlDesconto: TcxGridDBColumn
              DataBinding.FieldName = 'VlDesconto'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListVlTotalFrete: TcxGridDBColumn
              DataBinding.FieldName = 'VlTotalFrete'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListVlSeguro: TcxGridDBColumn
              DataBinding.FieldName = 'VlSeguro'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListCdTratamentoPrioritario: TcxGridDBColumn
              DataBinding.FieldName = 'CdTratamentoPrioritario'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListVlItemMneg: TcxGridDBColumn
              DataBinding.FieldName = 'VlItemMneg'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListVlOutrasDespMneg: TcxGridDBColumn
              DataBinding.FieldName = 'VlOutrasDespMneg'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListVlDescontoMneg: TcxGridDBColumn
              DataBinding.FieldName = 'VlDescontoMneg'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListVlTotalFreteMneg: TcxGridDBColumn
              DataBinding.FieldName = 'VlTotalFreteMneg'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListVlSeguroMneg: TcxGridDBColumn
              DataBinding.FieldName = 'VlSeguroMneg'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListTxLog: TcxGridDBColumn
              DataBinding.FieldName = 'TxLog'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListProcessoExpNf: TcxGridDBColumn
              DataBinding.FieldName = 'ProcessoExpNf'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListProcessoExpNfNrProcesso: TcxGridDBColumn
              DataBinding.FieldName = 'ProcessoExpNf.NrProcesso'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListProcessoExpNfNrNf: TcxGridDBColumn
              DataBinding.FieldName = 'ProcessoExpNf.NrNf'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListNcmDescricao: TcxGridDBColumn
              DataBinding.FieldName = 'Ncm.Descricao'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListNcmUnidadeMedida: TcxGridDBColumn
              DataBinding.FieldName = 'Ncm.UnidadeMedida'
              Visible = False
              Options.Editing = False
            end
            object cxGridDBTableViewDetailListNcmCdAtributo: TcxGridDBColumn
              DataBinding.FieldName = 'Ncm.CdAtributo'
              Visible = False
              Options.Editing = False
            end
          end
        end
        inherited pnlStyle1: TPanel
          Width = 977
          ExplicitWidth = 977
        end
      end
    end
    inherited tshEdit: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 30
      ExplicitWidth = 1080
      ExplicitHeight = 680
      inherited pnlEditButon: TPanel
        Left = 977
        Height = 680
        ExplicitLeft = 977
        ExplicitHeight = 680
        inherited btnSalvar: TButton
          Default = False
        end
      end
      inherited pnlFundo: TPanel
        Width = 977
        Height = 680
        ExplicitWidth = 977
        ExplicitHeight = 680
        inherited pnlStyle2: TPanel
          Width = 977
          ExplicitWidth = 977
        end
        inherited pnlDetails: TPanel
          Width = 977
          Height = 676
          ExplicitWidth = 977
          ExplicitHeight = 676
          inherited SplitterDetail: TSplitter
            Top = 167
            Width = 977
            ExplicitTop = 300
            ExplicitWidth = 970
          end
          inherited PanelDetail: TPanel
            Top = 171
            Width = 977
            Height = 505
            ExplicitTop = 171
            ExplicitWidth = 977
            ExplicitHeight = 505
            inherited pgDetails: TPageControl
              Width = 977
              Height = 505
              ExplicitWidth = 977
              ExplicitHeight = 505
              inherited tbsDetail1: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 30
                ExplicitWidth = 969
                ExplicitHeight = 471
                inherited PageControlDetail: TPageControl
                  Width = 969
                  Height = 471
                  ActivePage = tshDetailEdit
                  ExplicitWidth = 969
                  ExplicitHeight = 471
                  inherited tshDetailGrid: TTabSheet
                    ExplicitWidth = 961
                    ExplicitHeight = 440
                    inherited pnlEditButonDetail: TPanel
                      Left = 862
                      Width = 99
                      Height = 440
                      ExplicitLeft = 862
                      ExplicitWidth = 99
                      ExplicitHeight = 440
                      object Bevel1: TBevel [0]
                        Left = 16
                        Top = 152
                        Width = 72
                        Height = 2
                      end
                      object btnInformacaoReexportacao: TImage [1]
                        Left = 54
                        Top = 191
                        Width = 27
                        Height = 28
                        Picture.Data = {
                          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
                          000000180806000000E0773DF8000000017352474200AECE1CE9000000046741
                          4D410000B18F0BFC6105000000097048597300000EC400000EC401952B0E1B00
                          00054449444154484B7556496C1C45147D5DBD4CCFE6B1C7369EAC7644082626
                          2244282198841B02212EC001092404417003A1C02112070EE402071645394442
                          1120387120108E80228209012538A0208B2C5EE238CBD8F1CC78969EEEE9E6FD
                          EAB14982FD35D5E5EEAE7AFFD7FBEFFFB611D1B082B5FC3A2AB500E727673179
                          A988F9720DB66DA2279FC55D03ABD0D793402693E54A23DEB08CADE8E0D8C819
                          9C180B70F26C0553F319B48C240CA510861147134EB480C1D5011EDE92C3E33B
                          7258D7BFA1BDF356FB9F03AF5AC4E12363383ADA8599B910FA652473885AB305
                          9B4E1209930F155A1C169FE7DD26DE7EA68EDDBB8665F52D768B83F18949ECFF
                          7412A357FA50AB56E03A4A9F9E41C3B115B60F667179CEC33FD31E1C4B213264
                          2B1D450A4160E0859DD7F1E64B0FF199A5F1C488105BB3364BF0099CB972077C
                          6F0149821B4AB835D00C22EC79A20F1FBFB60187F66E447FC1050F03C5D3985C
                          E358115CD7C01727BB71E0F39F63C0B62D39F8E4EB318CCE14D0F4AAB0B851E7
                          2DE2454E6028ACED4DE875F9AC856CCAD2D4490086C9C1D93443384907077FCA
                          E3FCDFA7F45A314DD1B19151BC7FC4C6F84C034997FC0AB85CF88B0C038D2637
                          93F7277774E2DC8C873F2ED4914D9BDCCC2574A003D15B22F8511203E9697CB9
                          EF1ED8A92EA830A8E397B110D3B3AD25CEE3C82346694032D4C9A86D027D757C
                          1E67A73CE432965694C13C1826F7C8296C038AF7B6E9E19ADF831F7F9FD03E55
                          B91AE0574AD160A48B91EBE4F13E20BA43A7C73F1CC2D17737E1FBF7EEC637EF
                          6CC4E6FE248AE516AA5E84853AD5C5B9DAE0E0DCF02314AB0A27CE850CB40975
                          6EA2884B37D2040EE3E0256E46A7C8ABC5C8EA5E8883DF5E458D00852E1BEB7A
                          1DF24DD5482C8C583926148B4F59A48C832FF9B7833F2FD6502A2F404D4ECF22
                          542C22D1BA9C82C0926389A6B410626EA185BD872EE1AFF1BA40226845507420
                          156DE9C15AA0139B39B2DB7322A930EF29AA8F58A54A5D47AC55D14E58713E40
                          A91220600188DE0B3D0E8B6B49700C92AA113082DB16F3431AB593B653711418
                          167CCA5B59040849971CBB413A668A9E9E25325328E0731972B8455316E96352
                          05D46C47AE1D50818B2771DD9866D5CBC605F6961AA578FD86CFEDDC48007929
                          8997532951C94D1E442D26F9D6D14AD48E4531C4B325A749D8E84C4654144FB0
                          71A00F7EA384EB7381D04F30BA68830BB08E4292B268B286F7026E6AFEDBF468
                          703981ADE5BBBADB4292EFD5AA1E1703DD0DF2CDEC6BC0B845C4C0F1BD3E0D87
                          36264BE88C4105D0D445E82425B974C2BFD38910F7AF3391CA7640A5331D7874
                          7B9E8A0B28D4D8341B72919FD4D16D3910DA2407262519AB4880996C829B8904
                          56677D6C5D13775C6E37F0D423DD18E80D292BE147EB49FF24720A0157CB013C
                          1690985C2B1E506A40AB48E7829408B8D441AE90427FFD14EEDDB259AFD7E4AE
                          593B800F5E0CC0A0D00AD96ADBE01EABA9876DE2A33DABB0657DDCECA4653CF7
                          601AAFEECAA2424DE88453C2A66323D79B427AEA14F63DBF832BE3232F656F78
                          78186F3C56868A02F677E9E7F2E58A90491A787A674ED7C4856B3EC68B3E060B
                          16766F4AB02D903E7227DF8B54071D54C6F1CA761770BB6250DA6D5FB4160E7C
                          3682FDDF65D909D3FC26F84CA442266D33D2B62C19ADF02DDC1BB6038B2D3AD7
                          9744F6F269BCFC40025BDBD42CDAB2DFE48B63A378FD7015E3952ED45BA20E17
                          0E0B4757AE6BEBA42AC74007832D647CDCD91CC55BCF6E63E4F936C27FB6AC03
                          B1A0318F1F7E9BC2083FFC6727EB28B1B7F8A033566B672AC49ABC896DEB1DDC
                          B756616868903B62CE6FB7151D2C59E4A1CC7F57A471E9DEC2E44B85BA5484E8
                          FCA6342E63C0BFAC92D586E6F7C0230000000049454E44AE426082}
                        Visible = False
                        OnClick = btnInformacaoReexportacaoClick
                      end
                      inherited btnDetailIncluir: TButton
                        Left = 16
                        Enabled = False
                        ExplicitLeft = 16
                      end
                      inherited btnDetailAlterar: TButton
                        Left = 16
                        ExplicitLeft = 16
                      end
                      inherited btnDetailConsultar: TButton
                        Left = 16
                        Enabled = False
                        ExplicitLeft = 16
                      end
                      inherited btnDetailExcluir: TButton
                        Left = 16
                        Enabled = False
                        ExplicitLeft = 16
                      end
                      inherited cbxAltRapidaDetail: TCheckBox
                        Left = 13
                        Width = 80
                        Hint = 
                          'Quando seleciondo e pressionado o bot'#227'o de alterar, libera o cam' +
                          'po peso l'#237'quido do item seleciondo para altera'#231#227'o no grid.'
                        ParentShowHint = False
                        ShowHint = True
                        Visible = True
                        ExplicitLeft = 13
                        ExplicitWidth = 80
                      end
                      object btnIntegrarPlanilhaReexportacao: TButton
                        Left = 16
                        Top = 160
                        Width = 75
                        Height = 25
                        Anchors = [akTop, akRight]
                        Caption = 'Integrar'
                        TabOrder = 5
                        Visible = False
                        OnClick = btnIntegrarPlanilhaReexportacaoClick
                      end
                    end
                    inherited cxGridDetail: TcxGrid
                      Width = 862
                      Height = 440
                      ExplicitWidth = 862
                      ExplicitHeight = 440
                      inherited cxGridDBTableViewDetail: TcxGridDBTableView
                        DataController.Summary.FooterSummaryItems = <
                          item
                            Format = '0.00000'
                            Kind = skSum
                            Column = cxGridDBTableViewDetailPlMercadoria
                          end
                          item
                            Format = '0.00000'
                            Kind = skSum
                            Column = cxGridDBTableViewDetailQtComercial
                          end
                          item
                            Format = '0.00000'
                            Kind = skSum
                            Column = cxGridDBTableViewDetailQtTributavel
                          end
                          item
                            Format = '0.00'
                            Kind = skSum
                            Column = cxGridDBTableViewDetailVlItem
                          end
                          item
                            Format = '0.00'
                            Kind = skSum
                            Column = cxGridDBTableViewDetailVlCondicaoVenda
                          end
                          item
                            Format = '0.00'
                            Kind = skSum
                            Column = cxGridDBTableViewDetailVlLocalEmbarque
                          end
                          item
                            Kind = skCount
                            Column = cxGridDBTableViewDetailNrItemNf
                          end>
                        OptionsView.Footer = True
                        object cxGridDBTableViewDetailNrItemNf: TcxGridDBColumn
                          DataBinding.FieldName = 'NrItemNf'
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailNrItemDue: TcxGridDBColumn
                          DataBinding.FieldName = 'NrItemDue'
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailNcmCodigo: TcxGridDBColumn
                          DataBinding.FieldName = 'Ncm.Codigo'
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailNmSituacaoNcmAtributo: TcxGridDBColumn
                          DataBinding.FieldName = 'NmSituacaoNcmAtributo'
                          Width = 200
                        end
                        object cxGridDBTableViewDetailCdNcmDestaqueDominio: TcxGridDBColumn
                          DataBinding.FieldName = 'CdNcmDestaqueDominio'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailApMercadoria: TcxGridDBColumn
                          DataBinding.FieldName = 'ApMercadoria'
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailCdMercadoria: TcxGridDBColumn
                          DataBinding.FieldName = 'CdMercadoria'
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailPlMercadoria: TcxGridDBColumn
                          DataBinding.FieldName = 'PlMercadoria'
                        end
                        object cxGridDBTableViewDetailVlLocalEmbarque: TcxGridDBColumn
                          DataBinding.FieldName = 'VlLocalEmbarque'
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailVlCondicaoVenda: TcxGridDBColumn
                          DataBinding.FieldName = 'VlCondicaoVenda'
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailVlItem: TcxGridDBColumn
                          DataBinding.FieldName = 'VlItem'
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailQtComercial: TcxGridDBColumn
                          DataBinding.FieldName = 'QtComercial'
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailUnComercial: TcxGridDBColumn
                          DataBinding.FieldName = 'UnComercial'
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailQtTributavel: TcxGridDBColumn
                          DataBinding.FieldName = 'QtTributavel'
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailUnTributavel: TcxGridDBColumn
                          DataBinding.FieldName = 'UnTributavel'
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailNrItem: TcxGridDBColumn
                          DataBinding.FieldName = 'NrItem'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailSelf: TcxGridDBColumn
                          DataBinding.FieldName = 'Self'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailNmMercadoria: TcxGridDBColumn
                          DataBinding.FieldName = 'NmMercadoria'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailCdUnMed: TcxGridDBColumn
                          DataBinding.FieldName = 'CdUnMed'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailQtUnidadeEstatistica: TcxGridDBColumn
                          DataBinding.FieldName = 'QtUnidadeEstatistica'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailVlOutrasDesp: TcxGridDBColumn
                          DataBinding.FieldName = 'VlOutrasDesp'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailVlDesconto: TcxGridDBColumn
                          DataBinding.FieldName = 'VlDesconto'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailVlTotalFrete: TcxGridDBColumn
                          DataBinding.FieldName = 'VlTotalFrete'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailVlSeguro: TcxGridDBColumn
                          DataBinding.FieldName = 'VlSeguro'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailCdTratamentoPrioritario: TcxGridDBColumn
                          DataBinding.FieldName = 'CdTratamentoPrioritario'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailVlItemMneg: TcxGridDBColumn
                          DataBinding.FieldName = 'VlItemMneg'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailVlOutrasDespMneg: TcxGridDBColumn
                          DataBinding.FieldName = 'VlOutrasDespMneg'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailVlDescontoMneg: TcxGridDBColumn
                          DataBinding.FieldName = 'VlDescontoMneg'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailVlTotalFreteMneg: TcxGridDBColumn
                          DataBinding.FieldName = 'VlTotalFreteMneg'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailVlSeguroMneg: TcxGridDBColumn
                          DataBinding.FieldName = 'VlSeguroMneg'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailTxLog: TcxGridDBColumn
                          DataBinding.FieldName = 'TxLog'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailProcessoExpNf: TcxGridDBColumn
                          DataBinding.FieldName = 'ProcessoExpNf'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailProcessoExpNfNrProcesso: TcxGridDBColumn
                          DataBinding.FieldName = 'ProcessoExpNf.NrProcesso'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailProcessoExpNfNrNf: TcxGridDBColumn
                          DataBinding.FieldName = 'ProcessoExpNf.NrNf'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailNcm: TcxGridDBColumn
                          DataBinding.FieldName = 'Ncm'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailNcmDescricao: TcxGridDBColumn
                          DataBinding.FieldName = 'Ncm.Descricao'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailNcmUnidadeMedida: TcxGridDBColumn
                          DataBinding.FieldName = 'Ncm.UnidadeMedida'
                          Visible = False
                          Options.Editing = False
                        end
                        object cxGridDBTableViewDetailNcmCdAtributo: TcxGridDBColumn
                          DataBinding.FieldName = 'Ncm.CdAtributo'
                          Visible = False
                          Options.Editing = False
                        end
                      end
                    end
                  end
                  inherited tshDetailEdit: TTabSheet
                    ExplicitWidth = 961
                    ExplicitHeight = 440
                    inherited Panel8: TPanel
                      Left = 870
                      Height = 440
                      ExplicitLeft = 870
                      ExplicitHeight = 440
                      DesignSize = (
                        91
                        440)
                      inherited btnDetailSalvar: TButton
                        Default = False
                      end
                    end
                    object PageEditDetailNfDue: TPageControl
                      Left = 0
                      Top = 0
                      Width = 870
                      Height = 440
                      ActivePage = tshDetailEditPrincipal
                      Align = alClient
                      TabOrder = 1
                      object tshDetailEditPrincipal: TTabSheet
                        Caption = 'Principal'
                        object pnlDetailEditPrincipal: TPanel
                          Left = 0
                          Top = 0
                          Width = 862
                          Height = 409
                          Align = alClient
                          TabOrder = 0
                          object lblCodigoMercadoria: TLabel
                            Left = 16
                            Top = 40
                            Width = 126
                            Height = 16
                            Caption = 'C'#243'digo da mercadoria'
                            FocusControl = edtCodigoMercadoria
                          end
                          object lblDescricaoMercadoria: TLabel
                            Left = 15
                            Top = 119
                            Width = 142
                            Height = 16
                            Caption = 'Descri'#231#227'o da mercadoria'
                            FocusControl = edtDescricaoMercadoria
                          end
                          object lblNumeroItem: TLabel
                            Left = 15
                            Top = 2
                            Width = 92
                            Height = 16
                            Caption = 'N'#250'mero do item'
                            FocusControl = edtNumeroItem
                          end
                          object lblNCM: TLabel
                            Left = 16
                            Top = 80
                            Width = 25
                            Height = 16
                            Caption = 'Ncm'
                          end
                          object lblTratamentoPrioritario: TLabel
                            Left = 203
                            Top = 40
                            Width = 127
                            Height = 16
                            Caption = 'Tratamento priorit'#225'rio'
                          end
                          object lblPesoLiquido: TLabel
                            Left = 15
                            Top = 196
                            Width = 126
                            Height = 16
                            Caption = 'Peso l'#237'quido total (KG)'
                            FocusControl = edtPesoLiquido
                          end
                          object lblVMLE: TLabel
                            Left = 510
                            Top = 197
                            Width = 77
                            Height = 16
                            Caption = 'VMLE (MNeg)'
                            FocusControl = edtVMLE
                          end
                          object lblVMCV: TLabel
                            Left = 345
                            Top = 197
                            Width = 80
                            Height = 16
                            Caption = 'VMCV (MNeg)'
                            FocusControl = edtVMCV
                          end
                          object lblValorItem: TLabel
                            Left = 180
                            Top = 196
                            Width = 59
                            Height = 16
                            Caption = 'Valor (R$)'
                            FocusControl = edtValorItem
                          end
                          object lblUnidadeComercial: TLabel
                            Left = 345
                            Top = 157
                            Width = 135
                            Height = 16
                            Caption = 'Unidade comercializada'
                            FocusControl = edtUnidadeComercial
                          end
                          object lblQuantidadeComercial: TLabel
                            Left = 510
                            Top = 157
                            Width = 154
                            Height = 16
                            Caption = 'Quantidade comercializada'
                            FocusControl = edtQuantidadeComercial
                          end
                          object lblUnidadeEstatistica: TLabel
                            Left = 15
                            Top = 159
                            Width = 107
                            Height = 16
                            Caption = 'Unidade estat'#237'stica'
                            FocusControl = edtUnidadeEstatistica
                          end
                          object lblQuantidadeEstatistica: TLabel
                            Left = 180
                            Top = 159
                            Width = 126
                            Height = 16
                            Caption = 'Quantidade estat'#237'stica'
                            FocusControl = edtQuantidadeEstatistica
                          end
                          object lblDescricaoComplMercadoria: TLabel
                            Left = 16
                            Top = 277
                            Width = 228
                            Height = 16
                            Caption = 'Descri'#231#227'o complementar da mercadoria'
                          end
                          object Label7: TLabel
                            Left = 16
                            Top = 237
                            Width = 31
                            Height = 16
                            Caption = 'CFOP'
                            FocusControl = edtCFOP
                          end
                          object edtCodigoMercadoria: TDBEdit
                            Left = 16
                            Top = 56
                            Width = 177
                            Height = 24
                            DataField = 'CdMercadoria'
                            DataSource = dtsDetail
                            ReadOnly = True
                            TabOrder = 1
                          end
                          object edtDescricaoMercadoria: TDBEdit
                            Left = 15
                            Top = 134
                            Width = 655
                            Height = 24
                            DataField = 'ApMercadoria'
                            DataSource = dtsDetail
                            ReadOnly = True
                            TabOrder = 2
                          end
                          object edtNumeroItem: TDBEdit
                            Left = 15
                            Top = 17
                            Width = 177
                            Height = 24
                            DataField = 'NrItem'
                            DataSource = dtsDetail
                            ReadOnly = True
                            TabOrder = 0
                          end
                          object cbxTratamentoPrioritarioCod: TDBLookupComboBox
                            Left = 205
                            Top = 56
                            Width = 81
                            Height = 24
                            DataField = 'TratamentoPrioritario'
                            DataSource = dtsDetail
                            KeyField = 'Self'
                            ListField = 'Codigo'
                            ListSource = dscTratamentoPrioritario
                            TabOrder = 12
                          end
                          object cbxTratamentoPrioritarioNome: TDBLookupComboBox
                            Left = 285
                            Top = 56
                            Width = 266
                            Height = 24
                            DataField = 'TratamentoPrioritario'
                            DataSource = dtsDetail
                            KeyField = 'Self'
                            ListField = 'Descricao'
                            ListSource = dscTratamentoPrioritario
                            TabOrder = 13
                          end
                          object edtPesoLiquido: TDBEdit
                            Left = 15
                            Top = 212
                            Width = 160
                            Height = 24
                            DataField = 'PlMercadoria'
                            DataSource = dtsDetail
                            TabOrder = 7
                          end
                          object edtVMLE: TDBEdit
                            Left = 510
                            Top = 212
                            Width = 160
                            Height = 24
                            DataField = 'VlLocalEmbarque'
                            DataSource = dtsDetail
                            TabOrder = 10
                          end
                          object edtVMCV: TDBEdit
                            Left = 345
                            Top = 212
                            Width = 160
                            Height = 24
                            DataField = 'VlCondicaoVenda'
                            DataSource = dtsDetail
                            TabOrder = 9
                          end
                          object edtValorItem: TDBEdit
                            Left = 180
                            Top = 212
                            Width = 160
                            Height = 24
                            DataField = 'VlItem'
                            DataSource = dtsDetail
                            ReadOnly = True
                            TabOrder = 8
                          end
                          object edtUnidadeComercial: TDBEdit
                            Left = 345
                            Top = 173
                            Width = 160
                            Height = 24
                            DataField = 'UnComercial'
                            DataSource = dtsDetail
                            ReadOnly = True
                            TabOrder = 5
                          end
                          object edtQuantidadeComercial: TDBEdit
                            Left = 510
                            Top = 173
                            Width = 160
                            Height = 24
                            DataField = 'QtComercial'
                            DataSource = dtsDetail
                            ReadOnly = True
                            TabOrder = 6
                          end
                          object edtUnidadeEstatistica: TDBEdit
                            Left = 15
                            Top = 174
                            Width = 160
                            Height = 24
                            DataField = 'UnTributavel'
                            DataSource = dtsDetail
                            ReadOnly = True
                            TabOrder = 3
                          end
                          object edtQuantidadeEstatistica: TDBEdit
                            Left = 180
                            Top = 174
                            Width = 160
                            Height = 24
                            DataField = 'QtTributavel'
                            DataSource = dtsDetail
                            ReadOnly = True
                            TabOrder = 4
                          end
                          inline FrameNCMDestaque: TFrameNCMDestaque
                            Left = 205
                            Top = 84
                            Width = 268
                            Height = 35
                            AutoSize = True
                            Color = clWhite
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Height = -12
                            Font.Name = 'Tahoma'
                            Font.Style = []
                            ParentBackground = False
                            ParentColor = False
                            ParentFont = False
                            TabOrder = 14
                            Visible = False
                            ExplicitLeft = 205
                            ExplicitTop = 84
                            ExplicitHeight = 35
                            inherited edtCodigo: TEdit
                              Top = 13
                              ExplicitTop = 13
                            end
                            inherited DBLookupComboBox: TDBLookupComboBox
                              Top = 13
                              DataField = 'CdNcmDestaqueDominio'
                              DataSource = dtsDetail
                              KeyField = 'CdDominio'
                              ListField = 'NmDominio'
                              ListSource = dsNCMDestaque
                              ExplicitTop = 13
                            end
                          end
                          object edtDescricaoComplMercadoria: TDBMemo
                            Left = 16
                            Top = 294
                            Width = 654
                            Height = 89
                            DataField = 'NmMercadoria'
                            DataSource = dtsDetail
                            ScrollBars = ssVertical
                            TabOrder = 11
                          end
                          object DBCheckBox1: TDBCheckBox
                            Left = 496
                            Top = 97
                            Width = 142
                            Height = 17
                            Caption = 'Verifica'#231#227'o estat'#237'stica'
                            DataField = 'InVerificacaoEstatistica'
                            DataSource = dtsDetail
                            TabOrder = 15
                          end
                          object cbxNCM: TDBLookupComboBox
                            Left = 16
                            Top = 95
                            Width = 177
                            Height = 24
                            DataField = 'Ncm'
                            DataSource = dtsDetail
                            KeyField = 'Self'
                            ListField = 'Codigo'
                            ListSource = dsNCM
                            TabOrder = 16
                          end
                          object grbReexportacao: TGroupBox
                            Left = 677
                            Top = 2
                            Width = 185
                            Height = 111
                            Caption = ' Reexporta'#231#227'o '
                            TabOrder = 17
                            object lblNumeroDiImp: TLabel
                              Left = 10
                              Top = 23
                              Width = 61
                              Height = 16
                              Caption = 'N'#250'mero DI'
                              FocusControl = dbeNumeroDiImp
                              Visible = False
                            end
                            object lblNumeroAdicaoImp: TLabel
                              Left = 10
                              Top = 62
                              Width = 87
                              Height = 16
                              Caption = 'N'#250'mero Adi'#231#227'o'
                              FocusControl = dbeNumeroAdicaoImp
                              Visible = False
                            end
                            object dbeNumeroDiImp: TDBEdit
                              Left = 10
                              Top = 38
                              Width = 160
                              Height = 24
                              DataField = 'NrDeclaracaoImp'
                              DataSource = dtsDetail
                              TabOrder = 0
                              Visible = False
                            end
                            object dbeNumeroAdicaoImp: TDBEdit
                              Left = 10
                              Top = 77
                              Width = 160
                              Height = 24
                              DataField = 'NrAdicaoImp'
                              DataSource = dtsDetail
                              TabOrder = 1
                              Visible = False
                            end
                          end
                          object edtCFOP: TDBEdit
                            Left = 16
                            Top = 253
                            Width = 160
                            Height = 24
                            DataField = 'CdCfop'
                            DataSource = dtsDetail
                            TabOrder = 18
                          end
                        end
                      end
                      object tshNcmAtributo: TTabSheet
                        Caption = 'Atributos de NCM'
                        ImageIndex = 6
                        object pnlGeralNcmAtributos: TPanel
                          Left = 0
                          Top = 0
                          Width = 862
                          Height = 409
                          Align = alClient
                          BevelOuter = bvNone
                          TabOrder = 0
                          object pnlNcmAtributoEdit: TPanel
                            Left = 0
                            Top = 0
                            Width = 862
                            Height = 85
                            Align = alTop
                            BevelOuter = bvNone
                            TabOrder = 0
                            Visible = False
                            object Shape1: TShape
                              Left = 0
                              Top = 0
                              Width = 862
                              Height = 2
                              Align = alTop
                              Brush.Color = clMedGray
                              Pen.Style = psClear
                              ExplicitTop = 8
                              ExplicitWidth = 856
                            end
                            object Panel10: TPanel
                              Left = 757
                              Top = 2
                              Width = 105
                              Height = 83
                              Align = alRight
                              BevelOuter = bvNone
                              TabOrder = 0
                              object BitBtn4: TBitBtn
                                Left = 14
                                Top = 10
                                Width = 75
                                Height = 25
                                Caption = 'Ok'
                                TabOrder = 0
                                OnClick = BitBtn4Click
                              end
                              object BitBtn5: TBitBtn
                                Left = 14
                                Top = 41
                                Width = 75
                                Height = 25
                                Caption = 'Cancelar'
                                TabOrder = 1
                                OnClick = BitBtn5Click
                              end
                            end
                            object Panel11: TPanel
                              Left = 0
                              Top = 2
                              Width = 757
                              Height = 83
                              Align = alClient
                              BevelOuter = bvNone
                              TabOrder = 1
                              object Label4: TLabel
                                Left = 12
                                Top = 10
                                Width = 93
                                Height = 16
                                Caption = 'Atributo de NCM'
                              end
                              object Label5: TLabel
                                Left = 285
                                Top = 10
                                Width = 145
                                Height = 16
                                Caption = 'Valor do Atributo de NCM'
                              end
                              object cbxAtributoNcmItemDescricao: TDBLookupComboBox
                                Left = 365
                                Top = 27
                                Width = 393
                                Height = 24
                                DataField = 'CdAtributoValor'
                                DataSource = dscItensNfNcmAtributos
                                KeyField = 'CdAtributoValor'
                                ListField = 'NmAtributoValor'
                                ListSource = dscNcmAtributoValor
                                TabOrder = 0
                              end
                              object cbxAtributoNcmItemCodigo: TDBLookupComboBox
                                Left = 285
                                Top = 27
                                Width = 81
                                Height = 24
                                DataField = 'CdAtributoValor'
                                DataSource = dscItensNfNcmAtributos
                                KeyField = 'CdAtributoValor'
                                ListField = 'CdAtributoValor'
                                ListSource = dscNcmAtributoValor
                                TabOrder = 1
                              end
                              object cbxAtributoNcmCodigo: TDBLookupComboBox
                                Left = 12
                                Top = 27
                                Width = 81
                                Height = 24
                                DataField = 'CdAtributo'
                                DataSource = dscItensNfNcmAtributos
                                KeyField = 'CdAtributo'
                                ListField = 'CdAtributo'
                                ListSource = dscNcmAtributos
                                TabOrder = 2
                                OnExit = cbxAtributoNcmCodigoExit
                              end
                              object cbxAtributoNcmDescricao: TDBLookupComboBox
                                Left = 92
                                Top = 27
                                Width = 184
                                Height = 24
                                DataField = 'CdAtributo'
                                DataSource = dscItensNfNcmAtributos
                                KeyField = 'CdAtributo'
                                ListField = 'NmAtributo'
                                ListSource = dscNcmAtributos
                                TabOrder = 3
                                OnExit = cbxAtributoNcmDescricaoExit
                              end
                            end
                          end
                          object Panel5: TPanel
                            Left = 0
                            Top = 85
                            Width = 862
                            Height = 324
                            Align = alClient
                            BevelOuter = bvNone
                            Padding.Left = 10
                            Padding.Top = 10
                            Padding.Right = 10
                            Padding.Bottom = 10
                            TabOrder = 1
                            object Panel7: TPanel
                              Left = 10
                              Top = 10
                              Width = 748
                              Height = 304
                              Align = alClient
                              BevelOuter = bvNone
                              TabOrder = 0
                              object DBGrid1: TDBGrid
                                Left = 0
                                Top = 0
                                Width = 748
                                Height = 304
                                Align = alClient
                                DataSource = dscItensNfNcmAtributos
                                TabOrder = 0
                                TitleFont.Charset = DEFAULT_CHARSET
                                TitleFont.Color = clWindowText
                                TitleFont.Height = -13
                                TitleFont.Name = 'Tahoma'
                                TitleFont.Style = []
                                Columns = <
                                  item
                                    Expanded = False
                                    FieldName = 'CdAtributo'
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'NM_ATRIBUTO'
                                    Width = 200
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'CdAtributoValor'
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'NM_ATRIBUTO_VALOR'
                                    Width = 350
                                    Visible = True
                                  end>
                              end
                            end
                            object pnlBotoesPesquisaAtributoNcm: TPanel
                              Left = 758
                              Top = 10
                              Width = 94
                              Height = 304
                              Align = alRight
                              BevelOuter = bvNone
                              TabOrder = 1
                              object btnIncluirAtributoNcm: TBitBtn
                                Left = 13
                                Top = 8
                                Width = 75
                                Height = 25
                                Caption = 'Incluir'
                                TabOrder = 0
                                OnClick = btnIncluirAtributoNcmClick
                              end
                              object btnAlterarAtributoNcm: TBitBtn
                                Left = 13
                                Top = 38
                                Width = 75
                                Height = 25
                                Caption = 'Alterar'
                                TabOrder = 1
                                OnClick = btnAlterarAtributoNcmClick
                              end
                              object btnExcluirAtributoNcm: TBitBtn
                                Left = 13
                                Top = 69
                                Width = 75
                                Height = 25
                                Caption = 'Excluir'
                                TabOrder = 2
                                OnClick = btnExcluirAtributoNcmClick
                              end
                            end
                          end
                        end
                      end
                      object tshDetailEditEnquadramentos: TTabSheet
                        Caption = 'Enquadramentos'
                        ImageIndex = 2
                        object pnlDetailEditEnquadramentos: TPanel
                          Left = 0
                          Top = 0
                          Width = 862
                          Height = 409
                          Align = alClient
                          TabOrder = 0
                          object btnAjudaAtoConcessorioLote: TImage
                            Left = 397
                            Top = 140
                            Width = 27
                            Height = 28
                            Picture.Data = {
                              0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
                              000000180806000000E0773DF8000000017352474200AECE1CE9000000046741
                              4D410000B18F0BFC6105000000097048597300000EC400000EC401952B0E1B00
                              00054449444154484B7556496C1C45147D5DBD4CCFE6B1C7369EAC7644082626
                              2244282198841B02212EC001092404417003A1C02112070EE402071645394442
                              1120387120108E80228209012538A0208B2C5EE238CBD8F1CC78969EEEE9E6FD
                              EAB14982FD35D5E5EEAE7AFFD7FBEFFFB611D1B082B5FC3A2AB500E727673179
                              A988F9720DB66DA2279FC55D03ABD0D793402693E54A23DEB08CADE8E0D8C819
                              9C180B70F26C0553F319B48C240CA510861147134EB480C1D5011EDE92C3E33B
                              7258D7BFA1BDF356FB9F03AF5AC4E12363383ADA8599B910FA652473885AB305
                              9B4E1209930F155A1C169FE7DD26DE7EA68EDDBB8665F52D768B83F18949ECFF
                              7412A357FA50AB56E03A4A9F9E41C3B115B60F667179CEC33FD31E1C4B213264
                              2B1D450A4160E0859DD7F1E64B0FF199A5F1C488105BB3364BF0099CB972077C
                              6F0149821B4AB835D00C22EC79A20F1FBFB60187F66E447FC1050F03C5D3985C
                              E358115CD7C01727BB71E0F39F63C0B62D39F8E4EB318CCE14D0F4AAB0B851E7
                              2DE2454E6028ACED4DE875F9AC856CCAD2D4490086C9C1D93443384907077FCA
                              E3FCDFA7F45A314DD1B19151BC7FC4C6F84C034997FC0AB85CF88B0C038D2637
                              93F7277774E2DC8C873F2ED4914D9BDCCC2574A003D15B22F8511203E9697CB9
                              EF1ED8A92EA830A8E397B110D3B3AD25CEE3C82346694032D4C9A86D027D757C
                              1E67A73CE432965694C13C1826F7C8296C038AF7B6E9E19ADF831F7F9FD03E55
                              B91AE0574AD160A48B91EBE4F13E20BA43A7C73F1CC2D17737E1FBF7EEC637EF
                              6CC4E6FE248AE516AA5E84853AD5C5B9DAE0E0DCF02314AB0A27CE850CB40975
                              6EA2884B37D2040EE3E0256E46A7C8ABC5C8EA5E8883DF5E458D00852E1BEB7A
                              1DF24DD5482C8C583926148B4F59A48C832FF9B7833F2FD6502A2F404D4ECF22
                              542C22D1BA9C82C0926389A6B410626EA185BD872EE1AFF1BA40226845507420
                              156DE9C15AA0139B39B2DB7322A930EF29AA8F58A54A5D47AC55D14E58713E40
                              A91220600188DE0B3D0E8B6B49700C92AA113082DB16F3431AB593B653711418
                              167CCA5B59040849971CBB413A668A9E9E25325328E0731972B8455316E96352
                              05D46C47AE1D50818B2771DD9866D5CBC605F6961AA578FD86CFEDDC48007929
                              8997532951C94D1E442D26F9D6D14AD48E4531C4B325A749D8E84C4654144FB0
                              71A00F7EA384EB7381D04F30BA68830BB08E4292B268B286F7026E6AFEDBF468
                              703981ADE5BBBADB4292EFD5AA1E1703DD0DF2CDEC6BC0B845C4C0F1BD3E0D87
                              36264BE88C4105D0D445E82425B974C2BFD38910F7AF3391CA7640A5331D7874
                              7B9E8A0B28D4D8341B72919FD4D16D3910DA2407262519AB4880996C829B8904
                              56677D6C5D13775C6E37F0D423DD18E80D292BE147EB49FF24720A0157CB013C
                              1690985C2B1E506A40AB48E7829408B8D441AE90427FFD14EEDDB259AFD7E4AE
                              593B800F5E0CC0A0D00AD96ADBE01EABA9876DE2A33DABB0657DDCECA4653CF7
                              601AAFEECAA2424DE88453C2A66323D79B427AEA14F63DBF832BE3232F656F78
                              78186F3C56868A02F677E9E7F2E58A90491A787A674ED7C4856B3EC68B3E060B
                              16766F4AB02D903E7227DF8B54071D54C6F1CA761770BB6250DA6D5FB4160E7C
                              3682FDDF65D909D3FC26F84CA442266D33D2B62C19ADF02DDC1BB6038B2D3AD7
                              9744F6F269BCFC40025BDBD42CDAB2DFE48B63A378FD7015E3952ED45BA20E17
                              0E0B4757AE6BEBA42AC74007832D647CDCD91CC55BCF6E63E4F936C27FB6AC03
                              B1A0318F1F7E9BC2083FFC6727EB28B1B7F8A033566B672AC49ABC896DEB1DDC
                              B756616868903B62CE6FB7151D2C59E4A1CC7F57A471E9DEC2E44B85BA5484E8
                              FCA6342E63C0BFAC92D586E6F7C0230000000049454E44AE426082}
                            OnClick = btnAjudaAtoConcessorioLoteClick
                          end
                          object pgcNfItemEnq: TPageControl
                            Left = 8
                            Top = 8
                            Width = 455
                            Height = 119
                            ActivePage = tshListaEnq
                            TabOrder = 0
                            object tshListaEnq: TTabSheet
                              Caption = 'Lista'
                              object DBGrid3: TDBGrid
                                Left = 0
                                Top = 0
                                Width = 361
                                Height = 88
                                Align = alClient
                                DataSource = dscNfItemEnq
                                ReadOnly = True
                                TabOrder = 0
                                TitleFont.Charset = DEFAULT_CHARSET
                                TitleFont.Color = clWindowText
                                TitleFont.Height = -13
                                TitleFont.Name = 'Tahoma'
                                TitleFont.Style = []
                                Columns = <
                                  item
                                    Expanded = False
                                    FieldName = 'CdEnquadramento'
                                    Width = 150
                                    Visible = True
                                  end>
                              end
                              object pnlEnquadramento: TPanel
                                Left = 361
                                Top = 0
                                Width = 86
                                Height = 88
                                Align = alRight
                                BevelOuter = bvNone
                                TabOrder = 1
                                object btnIncluirNfItemEnq: TBitBtn
                                  Left = 5
                                  Top = 0
                                  Width = 75
                                  Height = 25
                                  Caption = 'Incluir'
                                  TabOrder = 0
                                  OnClick = btnIncluirNfItemEnqClick
                                end
                                object btnAlterarNfItemEnq: TBitBtn
                                  Left = 6
                                  Top = 30
                                  Width = 75
                                  Height = 25
                                  Caption = 'Alterar'
                                  TabOrder = 1
                                  OnClick = btnAlterarNfItemEnqClick
                                end
                                object btnExcluirNfItemEnq: TBitBtn
                                  Left = 5
                                  Top = 61
                                  Width = 75
                                  Height = 25
                                  Caption = 'Excluir'
                                  TabOrder = 2
                                  OnClick = btnExcluirNfItemEnqClick
                                end
                              end
                            end
                            object tshEditEnq: TTabSheet
                              Caption = 'tshEditEnq'
                              ImageIndex = 1
                              object Panel25: TPanel
                                Left = 362
                                Top = 0
                                Width = 85
                                Height = 88
                                Align = alRight
                                BevelOuter = bvNone
                                TabOrder = 0
                                object btnSalvarNfItemEnq: TBitBtn
                                  Left = 3
                                  Top = 0
                                  Width = 75
                                  Height = 25
                                  Caption = 'Salvar'
                                  TabOrder = 0
                                  OnClick = btnSalvarNfItemEnqClick
                                end
                                object btnCancelarNfItemEnq: TBitBtn
                                  Left = 3
                                  Top = 31
                                  Width = 75
                                  Height = 25
                                  Caption = 'Cancelar'
                                  TabOrder = 1
                                  OnClick = btnCancelarNfItemEnqClick
                                end
                                object btnVoltarNfItemEnq: TBitBtn
                                  Left = 3
                                  Top = 62
                                  Width = 75
                                  Height = 25
                                  Caption = 'Voltar'
                                  TabOrder = 2
                                  OnClick = btnVoltarNfItemEnqClick
                                end
                              end
                              object DBLookupComboBox16: TDBLookupComboBox
                                Left = 9
                                Top = 1
                                Width = 79
                                Height = 24
                                DataField = 'CdEnquadramento'
                                DataSource = dscNfItemEnq
                                KeyField = 'CdEnquadOp'
                                ListField = 'CdEnquadOp'
                                ListSource = dscEnquadramento
                                TabOrder = 1
                              end
                              object DBLookupComboBox17: TDBLookupComboBox
                                Left = 87
                                Top = 1
                                Width = 200
                                Height = 24
                                DataField = 'CdEnquadramento'
                                DataSource = dscNfItemEnq
                                KeyField = 'CdEnquadOp'
                                ListField = 'NmEnquadOp'
                                ListSource = dscEnquadramento
                                TabOrder = 2
                              end
                            end
                          end
                          object grbAtoConcessorio: TGroupBox
                            Left = 480
                            Top = 24
                            Width = 331
                            Height = 377
                            Caption = ' Ato concess'#243'rio '
                            TabOrder = 1
                            object lblAtoConcessorio: TLabel
                              Left = 12
                              Top = 24
                              Width = 159
                              Height = 16
                              Caption = 'N'#250'mero do Ato Concess'#243'rio'
                            end
                            object lblNrItemAtoConcessorio: TLabel
                              Left = 12
                              Top = 66
                              Width = 188
                              Height = 16
                              Caption = 'N'#250'mero item do Ato Concess'#243'rio'
                            end
                            object lblCNPJAtoConcessorio: TLabel
                              Left = 13
                              Top = 112
                              Width = 142
                              Height = 16
                              Caption = 'CNPJ do Ato Concess'#243'rio'
                            end
                            object lblNcmAC: TLabel
                              Left = 12
                              Top = 160
                              Width = 111
                              Height = 16
                              Caption = 'NCM do item do AC'
                            end
                            object lblQuantidadeAc: TLabel
                              Left = 12
                              Top = 202
                              Width = 116
                              Height = 16
                              Caption = 'Quantidade utilizada'
                            end
                            object lblVmleComCoberturaAC: TLabel
                              Left = 13
                              Top = 248
                              Width = 166
                              Height = 16
                              Caption = 'VMLE com cobertura cambial'
                            end
                            object lblVmleSemCoberturaAC: TLabel
                              Left = 12
                              Top = 293
                              Width = 166
                              Height = 16
                              Caption = 'VMLE sem cobertura cambial'
                            end
                            object dbeNumeroAtoConcessorio: TDBEdit
                              Left = 12
                              Top = 41
                              Width = 300
                              Height = 24
                              DataField = 'NrAtoConcessorioDrawback'
                              DataSource = dtsDetail
                              TabOrder = 0
                              OnExit = dbeNumeroAtoConcessorioExit
                            end
                            object dbeNumeroItemAtoConcessorio: TDBEdit
                              Left = 12
                              Top = 83
                              Width = 300
                              Height = 24
                              DataField = 'NrItemAtoConcessorioDrawback'
                              DataSource = dtsDetail
                              TabOrder = 1
                            end
                            object dbeCNPJAtoConcessorio: TDBEdit
                              Left = 13
                              Top = 127
                              Width = 300
                              Height = 24
                              DataField = 'CnpjAtoConcessorioDrawback'
                              DataSource = dtsDetail
                              TabOrder = 2
                              OnExit = dbeCNPJAtoConcessorioExit
                            end
                            object edtNcmAC: TDBEdit
                              Left = 12
                              Top = 177
                              Width = 300
                              Height = 24
                              DataField = 'NrNcmAtoConcessorioDrawback'
                              DataSource = dtsDetail
                              TabOrder = 3
                            end
                            object edtQuantidadeAc: TDBEdit
                              Left = 12
                              Top = 219
                              Width = 180
                              Height = 24
                              DataField = 'QtUtilizadaAtoConcessorioDrawback'
                              DataSource = dtsDetail
                              ReadOnly = True
                              TabOrder = 4
                            end
                            object edtVmleComCoberturaAC: TDBEdit
                              Left = 13
                              Top = 263
                              Width = 180
                              Height = 24
                              DataField = 'VmleCCobertCambialAtoConcessorio'
                              DataSource = dtsDetail
                              ReadOnly = True
                              TabOrder = 5
                            end
                            object edtVmleSemCoberturaAC: TDBEdit
                              Left = 12
                              Top = 308
                              Width = 180
                              Height = 24
                              DataField = 'VmleSCobertCambialAtoConcessorio'
                              DataSource = dtsDetail
                              ReadOnly = True
                              TabOrder = 6
                            end
                          end
                          object chkExportadorBeneficiariodoAC: TDBCheckBox
                            Left = 8
                            Top = 139
                            Width = 272
                            Height = 17
                            Caption = 'Exportador '#233' o benefici'#225'rio do AC?'
                            DataField = 'InExportBeneficAtoConcessorio'
                            DataSource = dtsDetail
                            TabOrder = 2
                            Visible = False
                            OnClick = chkExportadorBeneficiariodoACClick
                          end
                          object grbNFsAC: TGroupBox
                            Left = 8
                            Top = 167
                            Width = 453
                            Height = 234
                            Caption = ' Notas Fiscais de Venda '
                            TabOrder = 3
                            Visible = False
                            object pgcNfItemNfsACDrawback: TPageControl
                              Left = 7
                              Top = 20
                              Width = 442
                              Height = 204
                              ActivePage = tshListaNfsACDrawback
                              TabOrder = 0
                              Visible = False
                              object tshListaNfsACDrawback: TTabSheet
                                Caption = 'Lista'
                                object DBGrid4: TDBGrid
                                  Left = 0
                                  Top = 0
                                  Width = 348
                                  Height = 173
                                  Align = alClient
                                  DataSource = dsNFsEnquadramentoAC
                                  ReadOnly = True
                                  TabOrder = 0
                                  TitleFont.Charset = DEFAULT_CHARSET
                                  TitleFont.Color = clWindowText
                                  TitleFont.Height = -13
                                  TitleFont.Name = 'Tahoma'
                                  TitleFont.Style = []
                                  Columns = <
                                    item
                                      Expanded = False
                                      FieldName = 'NrChaveAcessoNf'
                                      Title.Caption = 'Chave de Acesso'
                                      Width = 108
                                      Visible = True
                                    end
                                    item
                                      Expanded = False
                                      FieldName = 'QuantidadeNf'
                                      Title.Caption = 'Qtde'
                                      Visible = True
                                    end
                                    item
                                      Expanded = False
                                      FieldName = 'DataNf'
                                      Title.Caption = 'Data'
                                      Width = 76
                                      Visible = True
                                    end
                                    item
                                      Expanded = False
                                      FieldName = 'ValorMoedaNegociacaoNf'
                                      Title.Caption = 'Valor'
                                      Width = 75
                                      Visible = True
                                    end>
                                end
                                object Panel3: TPanel
                                  Left = 348
                                  Top = 0
                                  Width = 86
                                  Height = 173
                                  Align = alRight
                                  BevelOuter = bvNone
                                  TabOrder = 1
                                  object btnIncluirNfItemNFsACDrawback: TBitBtn
                                    Left = 5
                                    Top = 0
                                    Width = 75
                                    Height = 25
                                    Caption = 'Incluir'
                                    TabOrder = 0
                                    OnClick = btnIncluirNfItemNFsACDrawbackClick
                                  end
                                  object btnAlterarNfItemNFsACDrawback: TBitBtn
                                    Left = 5
                                    Top = 30
                                    Width = 75
                                    Height = 25
                                    Caption = 'Alterar'
                                    TabOrder = 1
                                    OnClick = btnAlterarNfItemNFsACDrawbackClick
                                  end
                                  object btnExcluirNfItemNFsACDrawback: TBitBtn
                                    Left = 5
                                    Top = 61
                                    Width = 75
                                    Height = 25
                                    Caption = 'Excluir'
                                    TabOrder = 2
                                    OnClick = btnExcluirNfItemNFsACDrawbackClick
                                  end
                                end
                              end
                              object tshEditNfsACDrawback: TTabSheet
                                Caption = 'tshEditEnq'
                                ImageIndex = 1
                                object Label12: TLabel
                                  Left = 3
                                  Top = 8
                                  Width = 163
                                  Height = 16
                                  Caption = 'N'#250'mero da Chave de acesso'
                                  FocusControl = DBEdit8
                                end
                                object Label13: TLabel
                                  Left = 3
                                  Top = 48
                                  Width = 65
                                  Height = 16
                                  Caption = 'Quantidade'
                                  FocusControl = DBEdit9
                                end
                                object Label14: TLabel
                                  Left = 4
                                  Top = 88
                                  Width = 26
                                  Height = 16
                                  Caption = 'Data'
                                  FocusControl = DBEdit10
                                end
                                object Label15: TLabel
                                  Left = 4
                                  Top = 130
                                  Width = 141
                                  Height = 16
                                  Caption = 'Valor Moeda Negocia'#231#227'o'
                                  FocusControl = DBEdit11
                                end
                                object Panel9: TPanel
                                  Left = 349
                                  Top = 0
                                  Width = 85
                                  Height = 173
                                  Align = alRight
                                  BevelOuter = bvNone
                                  TabOrder = 0
                                  object btnSalvarNfItemNFsACDrawback: TBitBtn
                                    Left = 3
                                    Top = 0
                                    Width = 75
                                    Height = 25
                                    Caption = 'Salvar'
                                    TabOrder = 0
                                    OnClick = btnSalvarNfItemNFsACDrawbackClick
                                  end
                                  object btnCancelarNfItemNFsACDrawback: TBitBtn
                                    Left = 3
                                    Top = 31
                                    Width = 75
                                    Height = 25
                                    Caption = 'Cancelar'
                                    TabOrder = 1
                                    OnClick = btnCancelarNfItemNFsACDrawbackClick
                                  end
                                  object btnVoltarNfItemNFsACDrawback: TBitBtn
                                    Left = 3
                                    Top = 62
                                    Width = 75
                                    Height = 25
                                    Caption = 'Voltar'
                                    TabOrder = 2
                                    OnClick = btnVoltarNfItemNFsACDrawbackClick
                                  end
                                end
                                object DBEdit8: TDBEdit
                                  Left = 3
                                  Top = 24
                                  Width = 258
                                  Height = 24
                                  DataField = 'NrChaveAcessoNf'
                                  DataSource = dsNFsEnquadramentoAC
                                  TabOrder = 1
                                end
                                object DBEdit9: TDBEdit
                                  Left = 3
                                  Top = 63
                                  Width = 150
                                  Height = 24
                                  DataField = 'QuantidadeNf'
                                  DataSource = dsNFsEnquadramentoAC
                                  TabOrder = 2
                                end
                                object DBEdit10: TDBEdit
                                  Left = 4
                                  Top = 104
                                  Width = 150
                                  Height = 24
                                  DataField = 'DataNf'
                                  DataSource = dsNFsEnquadramentoAC
                                  TabOrder = 3
                                end
                                object DBEdit11: TDBEdit
                                  Left = 4
                                  Top = 146
                                  Width = 150
                                  Height = 24
                                  DataField = 'ValorMoedaNegociacaoNf'
                                  DataSource = dsNFsEnquadramentoAC
                                  TabOrder = 4
                                end
                              end
                            end
                          end
                          object btnIntegrarPlanilhaACDrawback: TBitBtn
                            Left = 280
                            Top = 136
                            Width = 111
                            Height = 30
                            Caption = 'Integrar planilha'
                            TabOrder = 4
                            Visible = False
                            OnClick = btnIntegrarPlanilhaACDrawbackClick
                          end
                        end
                      end
                      object tshDetailEditLPCO: TTabSheet
                        Caption = 'LPCO'
                        ImageIndex = 3
                        object pnlDetailEditLPCO: TPanel
                          Left = 0
                          Top = 0
                          Width = 862
                          Height = 409
                          Align = alClient
                          TabOrder = 0
                          object pgcLPCO: TPageControl
                            Left = 8
                            Top = 8
                            Width = 394
                            Height = 119
                            ActivePage = tbsEditLPCO
                            TabOrder = 0
                            object tbsListaLPCO: TTabSheet
                              Caption = 'ListaLPCO'
                              object DBGrid2: TDBGrid
                                Left = 0
                                Top = 0
                                Width = 300
                                Height = 88
                                Align = alClient
                                DataSource = dscLPCO
                                ReadOnly = True
                                TabOrder = 0
                                TitleFont.Charset = DEFAULT_CHARSET
                                TitleFont.Color = clWindowText
                                TitleFont.Height = -13
                                TitleFont.Name = 'Tahoma'
                                TitleFont.Style = []
                                Columns = <
                                  item
                                    Expanded = False
                                    FieldName = 'CdLpco'
                                    Title.Caption = 'C'#243'digo'
                                    Width = 150
                                    Visible = True
                                  end>
                              end
                              object Panel29: TPanel
                                Left = 300
                                Top = 0
                                Width = 86
                                Height = 88
                                Align = alRight
                                BevelOuter = bvNone
                                TabOrder = 1
                                object btnIncluirNfItemLPCO: TBitBtn
                                  Left = 5
                                  Top = 0
                                  Width = 75
                                  Height = 25
                                  Caption = 'Incluir'
                                  TabOrder = 0
                                  OnClick = btnIncluirNfItemLPCOClick
                                end
                                object btnAlterarNfItemLPCO: TBitBtn
                                  Left = 5
                                  Top = 30
                                  Width = 75
                                  Height = 25
                                  Caption = 'Alterar'
                                  TabOrder = 1
                                  OnClick = btnAlterarNfItemLPCOClick
                                end
                                object btnExcluirNfItemLPCO: TBitBtn
                                  Left = 5
                                  Top = 61
                                  Width = 75
                                  Height = 25
                                  Caption = 'Excluir'
                                  TabOrder = 2
                                  OnClick = btnExcluirNfItemLPCOClick
                                end
                              end
                            end
                            object tbsEditLPCO: TTabSheet
                              Caption = 'EditLPCO'
                              ImageIndex = 1
                              object Label65: TLabel
                                Left = 6
                                Top = 0
                                Width = 30
                                Height = 16
                                Caption = 'LPCO'
                                FocusControl = dbeNumeroLPCO
                              end
                              object Panel30: TPanel
                                Left = 299
                                Top = 0
                                Width = 87
                                Height = 88
                                Align = alRight
                                BevelOuter = bvNone
                                TabOrder = 0
                                object btnSalvarNfItemLPCO: TBitBtn
                                  Left = 6
                                  Top = 0
                                  Width = 75
                                  Height = 25
                                  Caption = 'Salvar'
                                  TabOrder = 0
                                  OnClick = btnSalvarNfItemLPCOClick
                                end
                                object btnCancelarNfItemLPCO: TBitBtn
                                  Left = 6
                                  Top = 31
                                  Width = 75
                                  Height = 25
                                  Caption = 'Cancelar'
                                  TabOrder = 1
                                  OnClick = btnCancelarNfItemLPCOClick
                                end
                                object btnVoltarNfItemLPCO: TBitBtn
                                  Left = 6
                                  Top = 62
                                  Width = 75
                                  Height = 25
                                  Caption = 'Voltar'
                                  TabOrder = 2
                                  OnClick = btnVoltarNfItemLPCOClick
                                end
                              end
                              object dbeNumeroLPCO: TDBEdit
                                Left = 6
                                Top = 16
                                Width = 187
                                Height = 24
                                DataField = 'CdLpco'
                                DataSource = dscLPCO
                                TabOrder = 1
                              end
                            end
                          end
                        end
                      end
                      object tshNotasReferenciadas: TTabSheet
                        Caption = 'Notas Referenciadas'
                        ImageIndex = 4
                        object pnlNotasReferenciadas: TPanel
                          Left = 0
                          Top = 0
                          Width = 862
                          Height = 409
                          Align = alClient
                          TabOrder = 0
                          object pgcNotasReferenciadas: TPageControl
                            Left = 1
                            Top = 1
                            Width = 860
                            Height = 407
                            ActivePage = tshNotasReferencidasLista
                            Align = alClient
                            TabOrder = 0
                            object tshNotasReferencidasLista: TTabSheet
                              Caption = 'Lista'
                              object Panel1: TPanel
                                Left = 766
                                Top = 0
                                Width = 86
                                Height = 376
                                Align = alRight
                                BevelOuter = bvNone
                                TabOrder = 0
                                object Bevel2: TBevel
                                  Left = 7
                                  Top = 93
                                  Width = 72
                                  Height = 2
                                end
                                object btnInformacaoNotasReferenciadas: TImage
                                  Left = 54
                                  Top = 163
                                  Width = 27
                                  Height = 28
                                  Picture.Data = {
                                    0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
                                    000000180806000000E0773DF8000000017352474200AECE1CE9000000046741
                                    4D410000B18F0BFC6105000000097048597300000EC400000EC401952B0E1B00
                                    00054449444154484B7556496C1C45147D5DBD4CCFE6B1C7369EAC7644082626
                                    2244282198841B02212EC001092404417003A1C02112070EE402071645394442
                                    1120387120108E80228209012538A0208B2C5EE238CBD8F1CC78969EEEE9E6FD
                                    EAB14982FD35D5E5EEAE7AFFD7FBEFFFB611D1B082B5FC3A2AB500E727673179
                                    A988F9720DB66DA2279FC55D03ABD0D793402693E54A23DEB08CADE8E0D8C819
                                    9C180B70F26C0553F319B48C240CA510861147134EB480C1D5011EDE92C3E33B
                                    7258D7BFA1BDF356FB9F03AF5AC4E12363383ADA8599B910FA652473885AB305
                                    9B4E1209930F155A1C169FE7DD26DE7EA68EDDBB8665F52D768B83F18949ECFF
                                    7412A357FA50AB56E03A4A9F9E41C3B115B60F667179CEC33FD31E1C4B213264
                                    2B1D450A4160E0859DD7F1E64B0FF199A5F1C488105BB3364BF0099CB972077C
                                    6F0149821B4AB835D00C22EC79A20F1FBFB60187F66E447FC1050F03C5D3985C
                                    E358115CD7C01727BB71E0F39F63C0B62D39F8E4EB318CCE14D0F4AAB0B851E7
                                    2DE2454E6028ACED4DE875F9AC856CCAD2D4490086C9C1D93443384907077FCA
                                    E3FCDFA7F45A314DD1B19151BC7FC4C6F84C034997FC0AB85CF88B0C038D2637
                                    93F7277774E2DC8C873F2ED4914D9BDCCC2574A003D15B22F8511203E9697CB9
                                    EF1ED8A92EA830A8E397B110D3B3AD25CEE3C82346694032D4C9A86D027D757C
                                    1E67A73CE432965694C13C1826F7C8296C038AF7B6E9E19ADF831F7F9FD03E55
                                    B91AE0574AD160A48B91EBE4F13E20BA43A7C73F1CC2D17737E1FBF7EEC637EF
                                    6CC4E6FE248AE516AA5E84853AD5C5B9DAE0E0DCF02314AB0A27CE850CB40975
                                    6EA2884B37D2040EE3E0256E46A7C8ABC5C8EA5E8883DF5E458D00852E1BEB7A
                                    1DF24DD5482C8C583926148B4F59A48C832FF9B7833F2FD6502A2F404D4ECF22
                                    542C22D1BA9C82C0926389A6B410626EA185BD872EE1AFF1BA40226845507420
                                    156DE9C15AA0139B39B2DB7322A930EF29AA8F58A54A5D47AC55D14E58713E40
                                    A91220600188DE0B3D0E8B6B49700C92AA113082DB16F3431AB593B653711418
                                    167CCA5B59040849971CBB413A668A9E9E25325328E0731972B8455316E96352
                                    05D46C47AE1D50818B2771DD9866D5CBC605F6961AA578FD86CFEDDC48007929
                                    8997532951C94D1E442D26F9D6D14AD48E4531C4B325A749D8E84C4654144FB0
                                    71A00F7EA384EB7381D04F30BA68830BB08E4292B268B286F7026E6AFEDBF468
                                    703981ADE5BBBADB4292EFD5AA1E1703DD0DF2CDEC6BC0B845C4C0F1BD3E0D87
                                    36264BE88C4105D0D445E82425B974C2BFD38910F7AF3391CA7640A5331D7874
                                    7B9E8A0B28D4D8341B72919FD4D16D3910DA2407262519AB4880996C829B8904
                                    56677D6C5D13775C6E37F0D423DD18E80D292BE147EB49FF24720A0157CB013C
                                    1690985C2B1E506A40AB48E7829408B8D441AE90427FFD14EEDDB259AFD7E4AE
                                    593B800F5E0CC0A0D00AD96ADBE01EABA9876DE2A33DABB0657DDCECA4653CF7
                                    601AAFEECAA2424DE88453C2A66323D79B427AEA14F63DBF832BE3232F656F78
                                    78186F3C56868A02F677E9E7F2E58A90491A787A674ED7C4856B3EC68B3E060B
                                    16766F4AB02D903E7227DF8B54071D54C6F1CA761770BB6250DA6D5FB4160E7C
                                    3682FDDF65D909D3FC26F84CA442266D33D2B62C19ADF02DDC1BB6038B2D3AD7
                                    9744F6F269BCFC40025BDBD42CDAB2DFE48B63A378FD7015E3952ED45BA20E17
                                    0E0B4757AE6BEBA42AC74007832D647CDCD91CC55BCF6E63E4F936C27FB6AC03
                                    B1A0318F1F7E9BC2083FFC6727EB28B1B7F8A033566B672AC49ABC896DEB1DDC
                                    B756616868903B62CE6FB7151D2C59E4A1CC7F57A471E9DEC2E44B85BA5484E8
                                    FCA6342E63C0BFAC92D586E6F7C0230000000049454E44AE426082}
                                  OnClick = btnInformacaoNotasReferenciadasClick
                                end
                                object btnIncluirNotaReferenciada: TBitBtn
                                  Left = 5
                                  Top = 0
                                  Width = 75
                                  Height = 25
                                  Caption = 'Incluir'
                                  Enabled = False
                                  TabOrder = 0
                                  OnClick = btnIncluirNotaReferenciadaClick
                                end
                                object btnAlterarNotaReferenciada: TBitBtn
                                  Left = 5
                                  Top = 30
                                  Width = 75
                                  Height = 25
                                  Caption = 'Alterar'
                                  TabOrder = 1
                                  OnClick = btnAlterarNotaReferenciadaClick
                                end
                                object btnExcluirNotaReferenciada: TBitBtn
                                  Left = 5
                                  Top = 61
                                  Width = 75
                                  Height = 25
                                  Caption = 'Excluir'
                                  Enabled = False
                                  TabOrder = 2
                                  OnClick = btnExcluirNotaReferenciadaClick
                                end
                                object btnIntegracaoPlanilhaNotasReferenciadas: TBitBtn
                                  Left = 6
                                  Top = 101
                                  Width = 75
                                  Height = 25
                                  Caption = 'Integrar'
                                  TabOrder = 3
                                  OnClick = btnIntegracaoPlanilhaNotasReferenciadasClick
                                end
                                object btnExcluirTodasNotasReferenciadas: TBitBtn
                                  Left = 6
                                  Top = 132
                                  Width = 75
                                  Height = 25
                                  Caption = 'Exluir tudo'
                                  TabOrder = 4
                                  OnClick = btnExcluirTodasNotasReferenciadasClick
                                end
                              end
                              object grdNotasReferenciadas: TcxGrid
                                Left = 0
                                Top = 0
                                Width = 766
                                Height = 376
                                Align = alClient
                                TabOrder = 1
                                object grdNotasRerenciadas: TcxGridDBTableView
                                  OnKeyDown = cxGridDBTableViewKeyDown
                                  Navigator.Buttons.CustomButtons = <>
                                  FilterBox.CustomizeDialog = False
                                  DataController.DataSource = dtsNotasReferenciadas
                                  DataController.Options = []
                                  DataController.Summary.DefaultGroupSummaryItems = <
                                    item
                                      Kind = skSum
                                      Position = spFooter
                                    end>
                                  DataController.Summary.FooterSummaryItems = <
                                    item
                                      Format = '0.00000'
                                      Kind = skSum
                                    end
                                    item
                                      Format = '0.00000'
                                      Kind = skSum
                                    end
                                    item
                                      Format = '0.00000'
                                      Kind = skSum
                                    end
                                    item
                                      Format = '0.00'
                                      Kind = skSum
                                    end
                                    item
                                      Format = '0.00'
                                      Kind = skSum
                                    end
                                    item
                                      Kind = skCount
                                    end
                                    item
                                      Format = '0.00000'
                                      Kind = skSum
                                      Column = grdNotasRerenciadasQtTributavel
                                    end
                                    item
                                      Kind = skCount
                                      Column = grdNotasRerenciadasNrItemNfRef
                                    end>
                                  DataController.Summary.SummaryGroups = <>
                                  Filtering.ColumnAddValueItems = False
                                  Filtering.ColumnMRUItemsList = False
                                  OptionsView.Footer = True
                                  OptionsView.GroupByBox = False
                                  OptionsView.Indicator = True
                                  Preview.AutoHeight = False
                                  object grdNotasRerenciadasNrItemNfRef: TcxGridDBColumn
                                    DataBinding.FieldName = 'NrItemNfRef'
                                  end
                                  object grdNotasRerenciadasChaveAcesso: TcxGridDBColumn
                                    DataBinding.FieldName = 'ChaveAcesso'
                                    Width = 300
                                  end
                                  object grdNotasRerenciadasQtTributavel: TcxGridDBColumn
                                    DataBinding.FieldName = 'QtTributavel'
                                    Width = 80
                                  end
                                  object grdNotasRerenciadasNrItemNfRefItem: TcxGridDBColumn
                                    DataBinding.FieldName = 'NrItemNfRefItem'
                                    Width = 125
                                  end
                                  object grdNotasRerenciadasNrCpfCnpjSubmitter: TcxGridDBColumn
                                    Caption = 'Cpf/Cnpj Submitter'
                                    DataBinding.FieldName = 'NrCpfCnpjSubmitter'
                                    Width = 150
                                  end
                                end
                                object cxGridLevel1: TcxGridLevel
                                  GridView = grdNotasRerenciadas
                                end
                              end
                            end
                            object tshNotasReferenciadasEdit: TTabSheet
                              Caption = 'Edit'
                              ImageIndex = 1
                              object Label1: TLabel
                                Left = 16
                                Top = 16
                                Width = 26
                                Height = 16
                                Caption = 'Item'
                              end
                              object Label2: TLabel
                                Left = 16
                                Top = 56
                                Width = 97
                                Height = 16
                                Caption = 'Chave de Acesso'
                              end
                              object Label3: TLabel
                                Left = 16
                                Top = 96
                                Width = 65
                                Height = 16
                                Caption = 'Quantidade'
                              end
                              object lblItemNfReferenciada: TLabel
                                Left = 16
                                Top = 138
                                Width = 124
                                Height = 16
                                Caption = 'Item NF Referenciada'
                              end
                              object Label6: TLabel
                                Left = 16
                                Top = 183
                                Width = 115
                                Height = 16
                                Caption = 'CPF/CNPJ Submitter'
                              end
                              object Panel2: TPanel
                                Left = 765
                                Top = 0
                                Width = 87
                                Height = 376
                                Align = alRight
                                BevelOuter = bvNone
                                TabOrder = 0
                                object btnSalvarNotaReferenciada: TBitBtn
                                  Left = 6
                                  Top = 0
                                  Width = 75
                                  Height = 25
                                  Caption = 'Salvar'
                                  TabOrder = 0
                                  OnClick = btnSalvarNotaReferenciadaClick
                                end
                                object btnCancelarNotaReferenciada: TBitBtn
                                  Left = 6
                                  Top = 31
                                  Width = 75
                                  Height = 25
                                  Caption = 'Cancelar'
                                  TabOrder = 1
                                  OnClick = btnCancelarNotaReferenciadaClick
                                end
                                object btnVoltarNotaReferenciada: TBitBtn
                                  Left = 6
                                  Top = 62
                                  Width = 75
                                  Height = 25
                                  Caption = 'Voltar'
                                  TabOrder = 2
                                  OnClick = btnVoltarNotaReferenciadaClick
                                end
                              end
                              object DBEdit1: TDBEdit
                                Left = 16
                                Top = 32
                                Width = 121
                                Height = 24
                                DataField = 'NrItemNfRef'
                                DataSource = dtsNotasReferenciadas
                                TabOrder = 1
                              end
                              object DBEdit2: TDBEdit
                                Left = 16
                                Top = 71
                                Width = 433
                                Height = 24
                                DataField = 'ChaveAcesso'
                                DataSource = dtsNotasReferenciadas
                                TabOrder = 2
                              end
                              object edtQtdNotaReferenciada: TDBEdit
                                Left = 16
                                Top = 112
                                Width = 121
                                Height = 24
                                DataField = 'QtTributavel'
                                DataSource = dtsNotasReferenciadas
                                TabOrder = 3
                              end
                              object edtItemNfReferenciada: TDBEdit
                                Left = 16
                                Top = 153
                                Width = 121
                                Height = 24
                                DataField = 'NrItemNfRefItem'
                                DataSource = dtsNotasReferenciadas
                                TabOrder = 4
                              end
                              object DBEdit3: TDBEdit
                                Left = 16
                                Top = 199
                                Width = 121
                                Height = 24
                                DataField = 'NrCpfCnpjSubmitter'
                                DataSource = dtsNotasReferenciadas
                                TabOrder = 5
                              end
                            end
                          end
                        end
                      end
                      object tshNFComplementar: TTabSheet
                        Caption = 'NFs Complementares'
                        ImageIndex = 5
                        object pnlNFComplementar: TPanel
                          Left = 0
                          Top = 0
                          Width = 862
                          Height = 409
                          Align = alClient
                          TabOrder = 0
                          object pgcNFsComplementares: TPageControl
                            Left = 1
                            Top = 1
                            Width = 860
                            Height = 407
                            ActivePage = tshNFsComplementaresLista
                            Align = alClient
                            TabOrder = 0
                            object tshNFsComplementaresLista: TTabSheet
                              Caption = 'Lista'
                              object Panel4: TPanel
                                Left = 766
                                Top = 0
                                Width = 86
                                Height = 376
                                Align = alRight
                                BevelOuter = bvNone
                                TabOrder = 0
                                object btnIncluirNFComplementar: TBitBtn
                                  Left = 5
                                  Top = 0
                                  Width = 75
                                  Height = 25
                                  Caption = 'Incluir'
                                  TabOrder = 0
                                  OnClick = btnIncluirNFComplementarClick
                                end
                                object btnAlterarNFComplementar: TBitBtn
                                  Left = 5
                                  Top = 30
                                  Width = 75
                                  Height = 25
                                  Caption = 'Alterar'
                                  TabOrder = 1
                                  OnClick = btnAlterarNFComplementarClick
                                end
                                object btnExcluirNFComplementar: TBitBtn
                                  Left = 5
                                  Top = 61
                                  Width = 75
                                  Height = 25
                                  Caption = 'Excluir'
                                  TabOrder = 2
                                  OnClick = btnExcluirNFComplementarClick
                                end
                              end
                              object grdNFsComplementares: TcxGrid
                                Left = 0
                                Top = 0
                                Width = 766
                                Height = 376
                                Align = alClient
                                TabOrder = 1
                                object cxGridDBTableView1: TcxGridDBTableView
                                  OnKeyDown = cxGridDBTableViewKeyDown
                                  Navigator.Buttons.CustomButtons = <>
                                  FilterBox.CustomizeDialog = False
                                  DataController.DataSource = dtsNFsComplementares
                                  DataController.Options = []
                                  DataController.Summary.DefaultGroupSummaryItems = <
                                    item
                                      Kind = skSum
                                      Position = spFooter
                                    end>
                                  DataController.Summary.FooterSummaryItems = <
                                    item
                                      Format = '0.00000'
                                      Kind = skSum
                                    end
                                    item
                                      Format = '0.00000'
                                      Kind = skSum
                                    end
                                    item
                                      Format = '0.00000'
                                      Kind = skSum
                                    end
                                    item
                                      Format = '0.00'
                                      Kind = skSum
                                    end
                                    item
                                      Format = '0.00'
                                      Kind = skSum
                                    end
                                    item
                                      Kind = skCount
                                    end
                                    item
                                      Format = '0.00000'
                                      Kind = skSum
                                    end
                                    item
                                      Kind = skCount
                                    end>
                                  DataController.Summary.SummaryGroups = <>
                                  Filtering.ColumnAddValueItems = False
                                  Filtering.ColumnMRUItemsList = False
                                  OptionsView.Footer = True
                                  OptionsView.GroupByBox = False
                                  OptionsView.Indicator = True
                                  Preview.AutoHeight = False
                                  object cxGridDBTableView1Self: TcxGridDBColumn
                                    DataBinding.FieldName = 'Self'
                                    Visible = False
                                  end
                                  object cxGridDBTableView1NrProcesso: TcxGridDBColumn
                                    DataBinding.FieldName = 'NrProcesso'
                                    Visible = False
                                  end
                                  object cxGridDBTableView1NrNf: TcxGridDBColumn
                                    DataBinding.FieldName = 'NrNf'
                                    Visible = False
                                  end
                                  object cxGridDBTableView1NrItem: TcxGridDBColumn
                                    DataBinding.FieldName = 'NrItem'
                                    Visible = False
                                  end
                                  object cxGridDBTableView1ChaveAcesso: TcxGridDBColumn
                                    DataBinding.FieldName = 'ChaveAcesso'
                                  end
                                  object cxGridDBTableView1NrItemNfComplementarItem: TcxGridDBColumn
                                    DataBinding.FieldName = 'NrItemNfComplementarItem'
                                    Width = 130
                                  end
                                end
                                object cxGridLevel2: TcxGridLevel
                                  GridView = cxGridDBTableView1
                                end
                              end
                            end
                            object tshNFsComplementaresEdit: TTabSheet
                              Caption = 'Edit'
                              ImageIndex = 1
                              object lblChaveAcessoNFComplementar: TLabel
                                Left = 16
                                Top = 9
                                Width = 97
                                Height = 16
                                Caption = 'Chave de Acesso'
                              end
                              object lblItemNFComplementarItem: TLabel
                                Left = 16
                                Top = 51
                                Width = 133
                                Height = 16
                                Caption = 'Item NF Complementar'
                              end
                              object Panel6: TPanel
                                Left = 765
                                Top = 0
                                Width = 87
                                Height = 376
                                Align = alRight
                                BevelOuter = bvNone
                                TabOrder = 0
                                object btnSalvarNFComplementar: TBitBtn
                                  Left = 6
                                  Top = 0
                                  Width = 75
                                  Height = 25
                                  Caption = 'Salvar'
                                  TabOrder = 0
                                  OnClick = btnSalvarNFComplementarClick
                                end
                                object btnCancelarNFComplementar: TBitBtn
                                  Left = 6
                                  Top = 31
                                  Width = 75
                                  Height = 25
                                  Caption = 'Cancelar'
                                  TabOrder = 1
                                  OnClick = btnCancelarNFComplementarClick
                                end
                                object btnVoltarNFComplementar: TBitBtn
                                  Left = 6
                                  Top = 62
                                  Width = 75
                                  Height = 25
                                  Caption = 'Voltar'
                                  TabOrder = 2
                                  OnClick = btnVoltarNFComplementarClick
                                end
                              end
                              object dbeChaveAcessoNFComplementar: TDBEdit
                                Left = 16
                                Top = 24
                                Width = 433
                                Height = 24
                                DataField = 'ChaveAcesso'
                                DataSource = dtsNFsComplementares
                                TabOrder = 1
                              end
                              object dbeItemNFComplementarItem: TDBEdit
                                Left = 16
                                Top = 66
                                Width = 121
                                Height = 24
                                DataField = 'NrItemNfComplementarItem'
                                DataSource = dtsNFsComplementares
                                TabOrder = 2
                              end
                            end
                          end
                        end
                      end
                      object tshDetailEditVlCompl: TTabSheet
                        Caption = 'Valores complementares'
                        ImageIndex = 4
                        object pnlDetailEditVlCompl: TPanel
                          Left = 0
                          Top = 0
                          Width = 862
                          Height = 409
                          Align = alClient
                          TabOrder = 0
                          object Label27: TLabel
                            Left = 15
                            Top = 42
                            Width = 156
                            Height = 16
                            Caption = 'Valor outras despesas (R$)'
                            FocusControl = DBEdit22
                          end
                          object Label30: TLabel
                            Left = 15
                            Top = 82
                            Width = 132
                            Height = 16
                            Caption = 'Valor do desconto (R$)'
                            FocusControl = DBEdit25
                          end
                          object Label50: TLabel
                            Left = 15
                            Top = 122
                            Width = 137
                            Height = 16
                            Caption = 'Valor total do frete (R$)'
                            FocusControl = DBEdit42
                          end
                          object Label51: TLabel
                            Left = 203
                            Top = 2
                            Width = 123
                            Height = 16
                            Caption = 'Valor do item (MNeg)'
                            FocusControl = DBEdit43
                          end
                          object Label52: TLabel
                            Left = 203
                            Top = 42
                            Width = 173
                            Height = 16
                            Caption = 'Valor outras despesas (MNeg)'
                            FocusControl = DBEdit44
                          end
                          object Label53: TLabel
                            Left = 203
                            Top = 82
                            Width = 149
                            Height = 16
                            Caption = 'Valor do desconto (MNeg)'
                            FocusControl = DBEdit45
                          end
                          object Label54: TLabel
                            Left = 203
                            Top = 122
                            Width = 154
                            Height = 16
                            Caption = 'Valor total do frete (MNeg)'
                            FocusControl = DBEdit46
                          end
                          object Label55: TLabel
                            Left = 203
                            Top = 162
                            Width = 137
                            Height = 16
                            Caption = 'Valor do seguro (MNeg)'
                            FocusControl = DBEdit47
                          end
                          object Label56: TLabel
                            Left = 15
                            Top = 162
                            Width = 120
                            Height = 16
                            Caption = 'Valor do seguro (R$)'
                            FocusControl = DBEdit48
                          end
                          object Label58: TLabel
                            Left = 16
                            Top = 201
                            Width = 20
                            Height = 16
                            Caption = 'Log'
                            FocusControl = DBEdit49
                          end
                          object DBEdit22: TDBEdit
                            Left = 15
                            Top = 58
                            Width = 180
                            Height = 24
                            DataField = 'VlOutrasDesp'
                            DataSource = dtsDetail
                            TabOrder = 0
                          end
                          object DBEdit25: TDBEdit
                            Left = 15
                            Top = 98
                            Width = 180
                            Height = 24
                            DataField = 'VlDesconto'
                            DataSource = dtsDetail
                            TabOrder = 1
                          end
                          object DBEdit42: TDBEdit
                            Left = 15
                            Top = 138
                            Width = 180
                            Height = 24
                            DataField = 'VlTotalFrete'
                            DataSource = dtsDetail
                            TabOrder = 2
                          end
                          object DBEdit43: TDBEdit
                            Left = 203
                            Top = 18
                            Width = 180
                            Height = 24
                            DataField = 'VlItemMneg'
                            DataSource = dtsDetail
                            TabOrder = 3
                          end
                          object DBEdit44: TDBEdit
                            Left = 203
                            Top = 58
                            Width = 180
                            Height = 24
                            DataField = 'VlOutrasDespMneg'
                            DataSource = dtsDetail
                            TabOrder = 4
                          end
                          object DBEdit45: TDBEdit
                            Left = 203
                            Top = 98
                            Width = 180
                            Height = 24
                            DataField = 'VlDescontoMneg'
                            DataSource = dtsDetail
                            TabOrder = 5
                          end
                          object DBEdit46: TDBEdit
                            Left = 203
                            Top = 138
                            Width = 180
                            Height = 24
                            DataField = 'VlTotalFreteMneg'
                            DataSource = dtsDetail
                            TabOrder = 6
                          end
                          object DBEdit47: TDBEdit
                            Left = 203
                            Top = 178
                            Width = 180
                            Height = 24
                            DataField = 'VlSeguroMneg'
                            DataSource = dtsDetail
                            TabOrder = 7
                          end
                          object DBEdit48: TDBEdit
                            Left = 15
                            Top = 178
                            Width = 180
                            Height = 24
                            DataField = 'VlSeguro'
                            DataSource = dtsDetail
                            TabOrder = 8
                          end
                          object DBEdit49: TDBEdit
                            Left = 15
                            Top = 217
                            Width = 610
                            Height = 24
                            DataField = 'TxLog'
                            DataSource = dtsDetail
                            TabOrder = 9
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
          inherited pnlMaster: TPanel
            Width = 977
            Height = 167
            ExplicitWidth = 977
            ExplicitHeight = 167
            object lblNumeroProcesso: TLabel
              Left = 16
              Top = 5
              Width = 118
              Height = 16
              Caption = 'N'#250'mero do processo'
              FocusControl = edtNumeroProcesso
            end
            object lblNumeroNf: TLabel
              Left = 182
              Top = 5
              Width = 82
              Height = 16
              Caption = 'N'#250'mero da NF'
              FocusControl = edtNumeroNf
            end
            object lblDataNf: TLabel
              Left = 322
              Top = 6
              Width = 26
              Height = 16
              Caption = 'Data'
              FocusControl = edtDataNf
            end
            object lblSerieNf: TLabel
              Left = 514
              Top = 6
              Width = 30
              Height = 16
              Caption = 'S'#233'rie'
              FocusControl = edtSerieNf
            end
            object lblTaxa: TLabel
              Left = 514
              Top = 45
              Width = 80
              Height = 16
              Caption = 'Taxa (Moeda)'
              FocusControl = edtTaxa
            end
            object lblChave: TLabel
              Left = 16
              Top = 45
              Width = 72
              Height = 16
              Caption = 'Chave da NF'
              FocusControl = edtChave
            end
            object lblValorTotalProdutos: TLabel
              Left = 16
              Top = 84
              Width = 137
              Height = 16
              Caption = 'Valor total dos produtos'
              FocusControl = edtValorTotalProdutos
            end
            object lblValorFrete: TLabel
              Left = 514
              Top = 124
              Width = 79
              Height = 16
              Caption = 'Valor do frete'
              FocusControl = edtValorFrete
            end
            object lblValorSeguro: TLabel
              Left = 348
              Top = 122
              Width = 91
              Height = 16
              Caption = 'Valor do seguro'
              FocusControl = edtValorSeguro
            end
            object lblValorTotalDesconto: TLabel
              Left = 16
              Top = 124
              Width = 103
              Height = 16
              Caption = 'Valor de desconto'
              FocusControl = edtValorTotalDesconto
            end
            object lblValorOutrasDespesas: TLabel
              Left = 182
              Top = 124
              Width = 110
              Height = 16
              Caption = 'Valor de acrescimo'
              FocusControl = edtValorOutrasDespesas
            end
            object lblFobMNeg: TLabel
              Left = 182
              Top = 85
              Width = 69
              Height = 16
              Caption = 'Fob M. Neg.'
              FocusControl = edtFobMNeg
            end
            object edtNumeroProcesso: TDBEdit
              Left = 16
              Top = 21
              Width = 160
              Height = 24
              DataField = 'NrProcesso'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 0
            end
            object edtNumeroNf: TDBEdit
              Left = 182
              Top = 21
              Width = 134
              Height = 24
              DataField = 'NrNf'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 1
            end
            object edtDataNf: TDBEdit
              Left = 322
              Top = 21
              Width = 186
              Height = 24
              DataField = 'DtNota'
              DataSource = dtsMain
              TabOrder = 2
            end
            object edtSerieNf: TDBEdit
              Left = 514
              Top = 21
              Width = 160
              Height = 24
              DataField = 'NfSerie'
              DataSource = dtsMain
              TabOrder = 3
            end
            object edtTaxa: TDBEdit
              Left = 514
              Top = 60
              Width = 160
              Height = 24
              DataField = 'VlTaxa'
              DataSource = dtsMain
              TabOrder = 5
            end
            object edtChave: TDBEdit
              Left = 16
              Top = 60
              Width = 492
              Height = 24
              DataField = 'ChaveNota'
              DataSource = dtsMain
              TabOrder = 4
            end
            object edtValorTotalProdutos: TDBEdit
              Left = 16
              Top = 99
              Width = 160
              Height = 24
              DataField = 'VlTotalProdutos'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 6
            end
            object edtValorFrete: TDBEdit
              Left = 514
              Top = 139
              Width = 160
              Height = 24
              DataField = 'VlFrete'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 11
            end
            object edtValorSeguro: TDBEdit
              Left = 348
              Top = 139
              Width = 160
              Height = 24
              DataField = 'VlSeguro'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 10
            end
            object edtValorTotalDesconto: TDBEdit
              Left = 16
              Top = 139
              Width = 160
              Height = 24
              DataField = 'VlTotalDescontos'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 8
            end
            object edtValorOutrasDespesas: TDBEdit
              Left = 182
              Top = 139
              Width = 160
              Height = 24
              DataField = 'VlOutrasDespesas'
              DataSource = dtsMain
              ReadOnly = True
              TabOrder = 9
            end
            object edtFobMNeg: TDBEdit
              Left = 182
              Top = 99
              Width = 160
              Height = 24
              DataField = 'VlMleMneg'
              DataSource = dtsMain
              TabOrder = 7
            end
          end
        end
      end
    end
  end
  inherited dtsMain: TDataSource
    Left = 996
    Top = 551
  end
  inherited dtsDetail: TDataSource
    Left = 1000
    Top = 600
  end
  inherited adsMain: TAureliusDataset
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
        Name = 'NrNf'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DtNota'
        DataType = ftDateTime
      end
      item
        Name = 'VlNota'
        DataType = ftFloat
      end
      item
        Name = 'NfSerie'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'VlTaxa'
        DataType = ftFloat
      end
      item
        Name = 'NrRe'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'ChaveNota'
        DataType = ftString
        Size = 44
      end
      item
        Name = 'VlTotalProdutos'
        DataType = ftFloat
      end
      item
        Name = 'VlFrete'
        DataType = ftFloat
      end
      item
        Name = 'VlSeguro'
        DataType = ftFloat
      end
      item
        Name = 'VlTotalDescontos'
        DataType = ftFloat
      end
      item
        Name = 'VlOutrasDespesas'
        DataType = ftFloat
      end
      item
        Name = 'PlMercadoriaTotal'
        DataType = ftFloat
      end
      item
        Name = 'QtComercialTotal'
        DataType = ftFloat
      end
      item
        Name = 'QtTributavelTotal'
        DataType = ftFloat
      end
      item
        Name = 'VlMleMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlLocalEmbarqueTotal'
        DataType = ftFloat
      end
      item
        Name = 'VlCondicaoVendaTotal'
        DataType = ftFloat
      end
      item
        Name = 'InNfRetificacao'
        DataType = ftBoolean
      end
      item
        Name = 'ProcessoExpNfItem'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    Left = 1029
    Top = 555
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNf'
    object adsMainNrProcesso: TStringField
      DisplayLabel = 'N'#250'mero do Processo'
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object adsMainDtNota: TDateTimeField
      DisplayLabel = 'Data NF'
      DisplayWidth = 10
      FieldName = 'DtNota'
    end
    object adsMainNrNf: TStringField
      DisplayLabel = 'N'#250'm. NF'
      DisplayWidth = 7
      FieldName = 'NrNf'
      Required = True
      Size = 10
    end
    object adsMainChaveNota: TStringField
      DisplayLabel = 'Chave da NF'
      DisplayWidth = 46
      FieldName = 'ChaveNota'
      Size = 44
    end
    object adsMainPlMercadoriaTotal: TFloatField
      DisplayLabel = 'Peso L'#237'q.'
      DisplayWidth = 7
      FieldName = 'PlMercadoriaTotal'
      DisplayFormat = '#,##0.00000'
      EditFormat = '###0.00000'
    end
    object adsMainQtComercialTotal: TFloatField
      DisplayLabel = 'Qtd. Comercial'
      DisplayWidth = 7
      FieldName = 'QtComercialTotal'
      DisplayFormat = '#,##0.00000'
      EditFormat = '###0.00000'
    end
    object adsMainQtTributavelTotal: TFloatField
      DisplayLabel = 'Qtd. Tribut'#225'vel'
      DisplayWidth = 7
      FieldName = 'QtTributavelTotal'
      DisplayFormat = '#,##0.00000'
      EditFormat = '###0.00000'
    end
    object adsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object adsMainVlNota: TFloatField
      FieldName = 'VlNota'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainNfSerie: TStringField
      FieldName = 'NfSerie'
      Visible = False
      Size = 3
    end
    object adsMainVlTaxa: TFloatField
      FieldName = 'VlTaxa'
      Visible = False
      DisplayFormat = '#,##0.0000'
      EditFormat = '###0.0000'
    end
    object adsMainNrRe: TStringField
      FieldName = 'NrRe'
      Visible = False
      Size = 12
    end
    object adsMainVlTotalProdutos: TFloatField
      FieldName = 'VlTotalProdutos'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainVlFrete: TFloatField
      FieldName = 'VlFrete'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainVlSeguro: TFloatField
      FieldName = 'VlSeguro'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainVlTotalDescontos: TFloatField
      FieldName = 'VlTotalDescontos'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainVlOutrasDespesas: TFloatField
      FieldName = 'VlOutrasDespesas'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainVlMleMneg: TFloatField
      FieldName = 'VlMleMneg'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainProcessoExpNfItem: TDataSetField
      FieldName = 'ProcessoExpNfItem'
      LookupDataSet = adsDetail
      ReadOnly = True
      Visible = False
    end
    object adsMainVlLocalEmbarqueTotal: TFloatField
      DisplayLabel = 'VMLE'
      FieldName = 'VlLocalEmbarqueTotal'
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainVlCondicaoVendaTotal: TFloatField
      DisplayLabel = 'VMCV'
      FieldName = 'VlCondicaoVendaTotal'
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsMainInNfRetificacao: TBooleanField
      FieldName = 'InNfRetificacao'
    end
  end
  inherited cxGridPopupMenu: TcxGridPopupMenu
    Left = 212
    Top = 172
  end
  inherited adsDetail: TAureliusDataset
    DatasetField = adsMainProcessoExpNfItem
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'PlMercadoria'
        DataType = ftFloat
      end
      item
        Name = 'CdMercadoria'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NmMercadoria'
        DataType = ftMemo
      end
      item
        Name = 'ApMercadoria'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'VlLocalEmbarque'
        DataType = ftFloat
      end
      item
        Name = 'VlCondicaoVenda'
        DataType = ftFloat
      end
      item
        Name = 'VlItem'
        DataType = ftFloat
      end
      item
        Name = 'VlOutrasDesp'
        DataType = ftFloat
      end
      item
        Name = 'VlDesconto'
        DataType = ftFloat
      end
      item
        Name = 'VlTotalFrete'
        DataType = ftFloat
      end
      item
        Name = 'VlSeguro'
        DataType = ftFloat
      end
      item
        Name = 'UnComercial'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'QtComercial'
        DataType = ftFloat
      end
      item
        Name = 'UnTributavel'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'QtTributavel'
        DataType = ftFloat
      end
      item
        Name = 'VlItemMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlOutrasDespMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlDescontoMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlTotalFreteMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlSeguroMneg'
        DataType = ftFloat
      end
      item
        Name = 'TxLog'
        DataType = ftMemo
      end
      item
        Name = 'CdNcmDestaqueDominio'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrItemNf'
        DataType = ftInteger
      end
      item
        Name = 'NrItemDue'
        DataType = ftInteger
      end
      item
        Name = 'InVerificacaoEstatistica'
        DataType = ftBoolean
      end
      item
        Name = 'NrDeclaracaoImp'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrAdicaoImp'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrAtoConcessorioDrawback'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'NrItemAtoConcessorioDrawback'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CnpjAtoConcessorioDrawback'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'NmSituacaoNcmAtributo'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TratamentoPrioritario'
        DataType = ftVariant
      end
      item
        Name = 'TratamentoPrioritario.Codigo'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'TratamentoPrioritario.Descricao'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ProcessoExpNf'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'ProcessoExpNf.NrProcesso'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ProcessoExpNf.NrNf'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ProcessoExpNf.DtNota'
        DataType = ftDateTime
      end
      item
        Name = 'ProcessoExpNf.VlNota'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.NfSerie'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ProcessoExpNf.VlTaxa'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.NrRe'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'ProcessoExpNf.ChaveNota'
        DataType = ftString
        Size = 44
      end
      item
        Name = 'ProcessoExpNf.VlTotalProdutos'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.VlFrete'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.VlSeguro'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.VlTotalDescontos'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.VlOutrasDespesas'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.PlMercadoriaTotal'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.QtComercialTotal'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.QtTributavelTotal'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.VlMleMneg'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.VlLocalEmbarqueTotal'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.VlCondicaoVendaTotal'
        DataType = ftFloat
      end
      item
        Name = 'ProcessoExpNf.InNfRetificacao'
        DataType = ftBoolean
      end
      item
        Name = 'ProcessoExpNf.ProcessoExpNfItem'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'Ncm'
        DataType = ftVariant
      end
      item
        Name = 'Ncm.Codigo'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Ncm.Descricao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Ncm.UnidadeMedida'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Ncm.CdAtributo'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CdCfop'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'InExportBeneficAtoConcessorio'
        DataType = ftBoolean
      end
      item
        Name = 'NrNcmAtoConcessorioDrawback'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'QtUtilizadaAtoConcessorioDrawback'
        DataType = ftFloat
      end
      item
        Name = 'VmleCCobertCambialAtoConcessorio'
        DataType = ftFloat
      end
      item
        Name = 'VmleSCobertCambialAtoConcessorio'
        DataType = ftFloat
      end>
    BeforeEdit = adsDetailBeforeEdit
    IncludeUnmappedObjects = True
    SubpropsDepth = 1
    Left = 1032
    Top = 605
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNfItem'
    object adsDetailNrItemNf: TIntegerField
      DisplayWidth = 8
      FieldName = 'NrItemNf'
    end
    object adsDetailNrItemDue: TIntegerField
      DisplayLabel = 'Item Due'
      DisplayWidth = 8
      FieldName = 'NrItemDue'
    end
    object adsDetailNmSituacaoNcmAtributo: TStringField
      DisplayLabel = 'Atributo de NCM'
      FieldName = 'NmSituacaoNcmAtributo'
      Size = 40
    end
    object adsDetailCdNcmDestaqueDominio: TStringField
      DisplayLabel = 'C'#243'd. Destaque'
      DisplayWidth = 10
      FieldName = 'CdNcmDestaqueDominio'
      Visible = False
      Size = 2
    end
    object adsDetailApMercadoria: TStringField
      DisplayWidth = 25
      FieldName = 'ApMercadoria'
      Size = 200
    end
    object adsDetailCdMercadoria: TStringField
      DisplayLabel = 'C'#243'd. Mercadoria'
      DisplayWidth = 22
      FieldName = 'CdMercadoria'
      Size = 30
    end
    object adsDetailPlMercadoria: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      DisplayWidth = 12
      FieldName = 'PlMercadoria'
      DisplayFormat = '#,##0.00000'
      EditFormat = '###0.00000'
    end
    object adsDetailVlLocalEmbarque: TFloatField
      DisplayLabel = 'VMLE'
      DisplayWidth = 12
      FieldName = 'VlLocalEmbarque'
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailVlCondicaoVenda: TFloatField
      DisplayLabel = 'VMCV'
      DisplayWidth = 12
      FieldName = 'VlCondicaoVenda'
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailVlItem: TFloatField
      DisplayLabel = 'Valor (R$)'
      DisplayWidth = 12
      FieldName = 'VlItem'
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailQtComercial: TFloatField
      DisplayLabel = 'Qtd. Com.'
      DisplayWidth = 12
      FieldName = 'QtComercial'
      DisplayFormat = '#,##0.00000'
      EditFormat = '###0.00000'
    end
    object adsDetailUnComercial: TStringField
      DisplayLabel = 'Un. Com.'
      FieldName = 'UnComercial'
      Size = 3
    end
    object adsDetailQtTributavel: TFloatField
      DisplayLabel = 'Qtd. Estat'#237'stica'
      DisplayWidth = 12
      FieldName = 'QtTributavel'
      DisplayFormat = '#,##0.00000'
      EditFormat = '##0.00000'
    end
    object adsDetailUnTributavel: TStringField
      DisplayLabel = 'Un. Est.'
      FieldName = 'UnTributavel'
      Size = 3
    end
    object adsDetailSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object adsDetailNmMercadoria: TStringField
      DisplayLabel = 'Descri'#231#227'o da Mercadoria'
      DisplayWidth = 1500
      FieldName = 'NmMercadoria'
      Visible = False
      Size = 1500
    end
    object adsDetailCdUnMed: TStringField
      FieldName = 'CdUnMed'
      Visible = False
      Size = 3
    end
    object adsDetailQtUnidadeEstatistica: TFloatField
      FieldName = 'QtUnidadeEstatistica'
      Visible = False
      DisplayFormat = '#,##0.00000'
      EditFormat = '###0.00000'
    end
    object adsDetailVlOutrasDesp: TFloatField
      FieldName = 'VlOutrasDesp'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailVlDesconto: TFloatField
      FieldName = 'VlDesconto'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailVlTotalFrete: TFloatField
      FieldName = 'VlTotalFrete'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailVlSeguro: TFloatField
      FieldName = 'VlSeguro'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailCdTratamentoPrioritario: TAureliusEntityField
      FieldName = 'CdTratamentoPrioritario'
      Visible = False
    end
    object adsDetailVlItemMneg: TFloatField
      FieldName = 'VlItemMneg'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailVlOutrasDespMneg: TFloatField
      FieldName = 'VlOutrasDespMneg'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailVlDescontoMneg: TFloatField
      FieldName = 'VlDescontoMneg'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailVlTotalFreteMneg: TFloatField
      FieldName = 'VlTotalFreteMneg'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailVlSeguroMneg: TFloatField
      FieldName = 'VlSeguroMneg'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object adsDetailTxLog: TStringField
      FieldName = 'TxLog'
      Visible = False
      Size = 255
    end
    object adsDetailProcessoExpNf: TAureliusEntityField
      FieldName = 'ProcessoExpNf'
      Required = True
      Visible = False
    end
    object adsDetailProcessoExpNfNrProcesso: TStringField
      FieldName = 'ProcessoExpNf.NrProcesso'
      Visible = False
      Size = 18
    end
    object adsDetailProcessoExpNfNrNf: TStringField
      FieldName = 'ProcessoExpNf.NrNf'
      Visible = False
      Size = 10
    end
    object adsDetailNrItem: TStringField
      FieldName = 'NrItem'
      Required = True
      Size = 3
    end
    object adsDetailNcm: TAureliusEntityField
      FieldName = 'Ncm'
    end
    object adsDetailNcmCodigo: TStringField
      FieldName = 'Ncm.Codigo'
      Size = 8
    end
    object adsDetailNcmDescricao: TStringField
      FieldName = 'Ncm.Descricao'
      Size = 120
    end
    object adsDetailNcmUnidadeMedida: TStringField
      FieldName = 'Ncm.UnidadeMedida'
      Size = 4
    end
    object adsDetailNcmCdAtributo: TStringField
      FieldName = 'Ncm.CdAtributo'
      Size = 10
    end
    object adsDetailInVerificacaoEstatistica: TBooleanField
      FieldName = 'InVerificacaoEstatistica'
    end
    object adsDetailTratamentoPrioritario: TAureliusEntityField
      FieldName = 'TratamentoPrioritario'
      Visible = False
    end
    object adsDetailTratamentoPrioritarioCodigo: TStringField
      FieldName = 'TratamentoPrioritario.Codigo'
      Visible = False
      Size = 4
    end
    object adsDetailTratamentoPrioritarioDescricao: TStringField
      FieldName = 'TratamentoPrioritario.Descricao'
      Visible = False
      Size = 200
    end
    object adsDetailNrDeclaracaoImp: TStringField
      FieldName = 'NrDeclaracaoImp'
      Size = 10
    end
    object adsDetailNrAdicaoImp: TStringField
      FieldName = 'NrAdicaoImp'
      Size = 3
    end
    object adsDetailNrAtoConcessorioDrawback: TStringField
      FieldName = 'NrAtoConcessorioDrawback'
      Size = 14
    end
    object adsDetailNrItemAtoConcessorioDrawback: TStringField
      FieldName = 'NrItemAtoConcessorioDrawback'
      Size = 3
    end
    object adsDetailCnpjAtoConcessorioDrawback: TStringField
      FieldName = 'CnpjAtoConcessorioDrawback'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object adsDetailCdCfop: TStringField
      FieldName = 'CdCfop'
      Size = 4
    end
    object adsDetailInExportBeneficAtoConcessorio: TBooleanField
      FieldName = 'InExportBeneficAtoConcessorio'
    end
    object adsDetailNrNcmAtoConcessorioDrawback: TStringField
      FieldName = 'NrNcmAtoConcessorioDrawback'
      Size = 14
    end
    object adsDetailQtUtilizadaAtoConcessorioDrawback: TFloatField
      FieldName = 'QtUtilizadaAtoConcessorioDrawback'
      DisplayFormat = '##0.00000'
      EditFormat = '##0.00000'
    end
    object adsDetailVmleCCobertCambialAtoConcessorio: TFloatField
      FieldName = 'VmleCCobertCambialAtoConcessorio'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object adsDetailVmleSCobertCambialAtoConcessorio: TFloatField
      FieldName = 'VmleSCobertCambialAtoConcessorio'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
  end
  object adsExportacaoItem: TAureliusDataset
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
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CdMercadoria'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'QtMercadoria'
        DataType = ftFloat
      end
      item
        Name = 'VlTotPesoLiq'
        DataType = ftFloat
      end
      item
        Name = 'VlMle'
        DataType = ftFloat
      end
      item
        Name = 'InAcordo'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'CdUnidMedida'
        DataType = ftVariant
      end
      item
        Name = 'CdUnidMedida.CdUnidMedida'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CdUnidMedida.NmUnidMedida'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CdUnidMedida.InAtivo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CdUnidMedida.CdGiplite'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CdUnidMedida.NmSigla'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CdUnidMedida.CdScxExp'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CdUnidMedida.NmUnidMedidaIng'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CdUnidMedida.NmUnidMedidaEsp'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CdUnidMedida.NmSiglaIng'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CdUnidMedida.NmSiglaEsp'
        DataType = ftString
        Size = 3
      end>
    SubpropsDepth = 2
    Left = 874
    Top = 144
    DesignClass = 'MyEntitiesBroker.TTprocessoExpItem'
    object adsExportacaoItemSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsExportacaoItemNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object adsExportacaoItemNrItem: TStringField
      FieldName = 'NrItem'
      Required = True
      Size = 3
    end
    object adsExportacaoItemCdMercadoria: TStringField
      FieldName = 'CdMercadoria'
      Size = 40
    end
    object adsExportacaoItemQtMercadoria: TFloatField
      FieldName = 'QtMercadoria'
    end
    object adsExportacaoItemVlTotPesoLiq: TFloatField
      FieldName = 'VlTotPesoLiq'
    end
    object adsExportacaoItemInAcordo: TBooleanField
      FieldName = 'InAcordo'
      Required = True
    end
    object adsExportacaoItemCdUnidMedida: TAureliusEntityField
      FieldName = 'CdUnidMedida'
    end
    object adsExportacaoItemCdUnidMedidaCdUnidMedida: TStringField
      FieldName = 'CdUnidMedida.CdUnidMedida'
      Size = 3
    end
    object adsExportacaoItemCdUnidMedidaNmUnidMedida: TStringField
      FieldName = 'CdUnidMedida.NmUnidMedida'
      Size = 50
    end
    object adsExportacaoItemCdUnidMedidaInAtivo: TStringField
      FieldName = 'CdUnidMedida.InAtivo'
      Size = 1
    end
    object adsExportacaoItemCdUnidMedidaCdGiplite: TStringField
      FieldName = 'CdUnidMedida.CdGiplite'
      Size = 2
    end
    object adsExportacaoItemCdUnidMedidaNmSigla: TStringField
      FieldName = 'CdUnidMedida.NmSigla'
      Size = 3
    end
    object adsExportacaoItemCdUnidMedidaCdScxExp: TStringField
      FieldName = 'CdUnidMedida.CdScxExp'
      Size = 2
    end
    object adsExportacaoItemCdUnidMedidaNmUnidMedidaIng: TStringField
      FieldName = 'CdUnidMedida.NmUnidMedidaIng'
      Size = 50
    end
    object adsExportacaoItemCdUnidMedidaNmUnidMedidaEsp: TStringField
      FieldName = 'CdUnidMedida.NmUnidMedidaEsp'
      Size = 50
    end
    object adsExportacaoItemCdUnidMedidaNmSiglaIng: TStringField
      FieldName = 'CdUnidMedida.NmSiglaIng'
      Size = 3
    end
    object adsExportacaoItemCdUnidMedidaNmSiglaEsp: TStringField
      FieldName = 'CdUnidMedida.NmSiglaEsp'
      Size = 3
    end
    object adsExportacaoItemVlMle: TFloatField
      FieldName = 'VlMle'
    end
  end
  object adsNfItensAux: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'PlMercadoria'
        DataType = ftFloat
      end
      item
        Name = 'CdMercadoria'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NmMercadoria'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ApMercadoria'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'CdNcm'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'VlLocalEmbarque'
        DataType = ftFloat
      end
      item
        Name = 'VlCondicaoVenda'
        DataType = ftFloat
      end
      item
        Name = 'VlItem'
        DataType = ftFloat
      end
      item
        Name = 'VlOutrasDesp'
        DataType = ftFloat
      end
      item
        Name = 'VlDesconto'
        DataType = ftFloat
      end
      item
        Name = 'VlTotalFrete'
        DataType = ftFloat
      end
      item
        Name = 'VlSeguro'
        DataType = ftFloat
      end
      item
        Name = 'UnComercial'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'QtComercial'
        DataType = ftFloat
      end
      item
        Name = 'UnTributavel'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'QtTributavel'
        DataType = ftFloat
      end
      item
        Name = 'VlItemMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlOutrasDespMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlDescontoMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlTotalFreteMneg'
        DataType = ftFloat
      end
      item
        Name = 'VlSeguroMneg'
        DataType = ftFloat
      end
      item
        Name = 'TxLog'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CdNcmDestaqueDominio'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NrItemNf'
        DataType = ftInteger
      end
      item
        Name = 'NrItemDue'
        DataType = ftInteger
      end
      item
        Name = 'CdTratamentoPrioritario'
        DataType = ftVariant
      end
      item
        Name = 'ProcessoExpNf'
        Attributes = [faRequired]
        DataType = ftVariant
      end>
    Left = 904
    Top = 152
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNfItem'
    object AureliusEntityField3: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object StringField14: TStringField
      FieldName = 'NrItem'
      Required = True
      Size = 3
    end
    object FloatField3: TFloatField
      FieldName = 'PlMercadoria'
    end
    object StringField15: TStringField
      FieldName = 'CdMercadoria'
      Size = 30
    end
    object StringField16: TStringField
      FieldName = 'NmMercadoria'
      Size = 255
    end
    object StringField17: TStringField
      FieldName = 'ApMercadoria'
      Size = 200
    end
    object StringField18: TStringField
      FieldName = 'CdNcm'
      Size = 11
    end
    object FloatField4: TFloatField
      FieldName = 'VlLocalEmbarque'
    end
    object FloatField5: TFloatField
      FieldName = 'VlCondicaoVenda'
    end
    object FloatField6: TFloatField
      FieldName = 'VlItem'
    end
    object FloatField7: TFloatField
      FieldName = 'VlOutrasDesp'
    end
    object FloatField8: TFloatField
      FieldName = 'VlDesconto'
    end
    object FloatField9: TFloatField
      FieldName = 'VlTotalFrete'
    end
    object FloatField10: TFloatField
      FieldName = 'VlSeguro'
    end
    object StringField19: TStringField
      FieldName = 'UnComercial'
      Size = 3
    end
    object FloatField11: TFloatField
      FieldName = 'QtComercial'
    end
    object StringField20: TStringField
      FieldName = 'UnTributavel'
      Size = 3
    end
    object FloatField12: TFloatField
      FieldName = 'QtTributavel'
    end
    object FloatField13: TFloatField
      FieldName = 'VlItemMneg'
    end
    object FloatField14: TFloatField
      FieldName = 'VlOutrasDespMneg'
    end
    object FloatField15: TFloatField
      FieldName = 'VlDescontoMneg'
    end
    object FloatField16: TFloatField
      FieldName = 'VlTotalFreteMneg'
    end
    object FloatField17: TFloatField
      FieldName = 'VlSeguroMneg'
    end
    object StringField21: TStringField
      FieldName = 'TxLog'
      Size = 255
    end
    object StringField22: TStringField
      FieldName = 'CdNcmDestaqueDominio'
      Size = 2
    end
    object IntegerField1: TIntegerField
      FieldName = 'NrItemNf'
    end
    object IntegerField2: TIntegerField
      FieldName = 'NrItemDue'
    end
    object AureliusEntityField4: TAureliusEntityField
      FieldName = 'CdTratamentoPrioritario'
    end
    object AureliusEntityField5: TAureliusEntityField
      FieldName = 'ProcessoExpNf'
      Required = True
    end
  end
  object adsNCMDestaque: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CodigoNcm'
        Attributes = [faRequired]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CdAtributo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CdDominio'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NmDominio'
        DataType = ftString
        Size = 200
      end>
    Left = 949
    Top = 435
    DesignClass = 'MyEntitiesBroker.TTncmExpDestaque'
    object adsNCMDestaqueSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsNCMDestaqueCodigoNcm: TStringField
      FieldName = 'CodigoNcm'
      Required = True
      Size = 8
    end
    object adsNCMDestaqueCdAtributo: TStringField
      FieldName = 'CdAtributo'
      Required = True
      Size = 10
    end
    object adsNCMDestaqueCdDominio: TStringField
      FieldName = 'CdDominio'
      Required = True
      Size = 2
    end
    object adsNCMDestaqueNmDominio: TStringField
      FieldName = 'NmDominio'
      Size = 200
    end
  end
  object dsNCMDestaque: TDataSource
    DataSet = adsNCMDestaque
    Left = 917
    Top = 424
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'xml'
    Filter = 'Arquivos XML (*.xml)|*.XML;'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 460
    Top = 336
  end
  object dscEnquadramento: TDataSource
    DataSet = adsEnquadramento
    Left = 913
    Top = 323
  end
  object dscLPCO: TDataSource
    DataSet = dtsLPCO
    Left = 995
    Top = 504
  end
  object dtsLPCO: TAureliusDataset
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
        Name = 'NrNf'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrSeqLpco'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CdLpco'
        Attributes = [faRequired]
        DataType = ftString
        Size = 11
      end>
    SubpropsDepth = 2
    Left = 1029
    Top = 508
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNfItemLpco'
    object dtsLPCOSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object dtsLPCONrProcesso: TStringField
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object dtsLPCONrNf: TStringField
      FieldName = 'NrNf'
      Required = True
      Size = 10
    end
    object dtsLPCONrItem: TStringField
      FieldName = 'NrItem'
      Required = True
      Size = 3
    end
    object dtsLPCOCdLpco: TStringField
      FieldName = 'CdLpco'
      Required = True
      Size = 11
    end
    object dtsLPCONrSeqLpco: TIntegerField
      FieldName = 'NrSeqLpco'
      Required = True
    end
  end
  object dscNfItemEnq: TDataSource
    DataSet = dtsNfItemEnq
    Left = 917
    Top = 478
  end
  object dtsNfItemEnq: TAureliusDataset
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
        Name = 'NrNf'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrSeqEnquadramento'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CdEnquadramento'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end>
    AfterScroll = dtsNfItemEnqAfterScroll
    Left = 949
    Top = 485
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNfItemEnquadramento'
    object dtsNfItemEnqSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object dtsNfItemEnqNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object dtsNfItemEnqNrNf: TStringField
      FieldName = 'NrNf'
      Required = True
      Size = 10
    end
    object dtsNfItemEnqNrItem: TStringField
      FieldName = 'NrItem'
      Required = True
      Size = 3
    end
    object dtsNfItemEnqCdEnquadramento: TStringField
      FieldName = 'CdEnquadramento'
      Required = True
      Size = 5
    end
    object dtsNfItemEnqNrSeqEnquadramento: TIntegerField
      FieldName = 'NrSeqEnquadramento'
      Required = True
    end
  end
  object adsEnquadramento: TAureliusDataset
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
    IncludeUnmappedObjects = True
    Left = 946
    Top = 328
    DesignClass = 'MyEntitiesBroker.TTenquadOp'
    object adsEnquadramentoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object adsEnquadramentoCdEnquadOp: TStringField
      FieldName = 'CdEnquadOp'
      Required = True
      Size = 5
    end
    object adsEnquadramentoNmEnquadOp: TStringField
      FieldName = 'NmEnquadOp'
      Required = True
      Size = 60
    end
    object adsEnquadramentoInAtivo: TStringField
      FieldName = 'InAtivo'
      Required = True
      Size = 1
    end
  end
  object dtsTratamentoPrioritario: TAureliusDataset
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
        Size = 4
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 200
      end>
    SubpropsDepth = 2
    Left = 947
    Top = 380
    DesignClass = 'MyEntitiesBroker.TTratamentoPrioritario'
    object dtsTratamentoPrioritarioSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object dtsTratamentoPrioritarioCodigo: TStringField
      FieldName = 'Codigo'
      Required = True
      Size = 4
    end
    object dtsTratamentoPrioritarioDescricao: TStringField
      FieldName = 'Descricao'
      Size = 200
    end
  end
  object dscTratamentoPrioritario: TDataSource
    AutoEdit = False
    DataSet = dtsTratamentoPrioritario
    Left = 915
    Top = 371
  end
  object dsNCM: TDataSource
    DataSet = adsNCM
    Left = 95
    Top = 341
  end
  object adsNCM: TAureliusDataset
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
        Size = 8
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'UnidadeMedida'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CdAtributo'
        DataType = ftString
        Size = 10
      end>
    SubpropsDepth = 2
    Left = 132
    Top = 341
    DesignClass = 'MyEntitiesBroker.TTncm'
    object adsNCMSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsNCMCodigo: TStringField
      FieldName = 'Codigo'
      Required = True
      Size = 8
    end
    object adsNCMDescricao: TStringField
      FieldName = 'Descricao'
      Size = 120
    end
    object adsNCMUnidadeMedida: TStringField
      FieldName = 'UnidadeMedida'
      Size = 4
    end
    object adsNCMCdAtributo: TStringField
      FieldName = 'CdAtributo'
      Size = 10
    end
  end
  object adsNotasReferenciadas: TAureliusDataset
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
        Name = 'NrNf'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrItemNfRef'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ChaveAcesso'
        Attributes = [faRequired]
        DataType = ftString
        Size = 44
      end
      item
        Name = 'QtTributavel'
        DataType = ftFloat
      end
      item
        Name = 'NrItemNfRefItem'
        DataType = ftInteger
      end
      item
        Name = 'NrCpfCnpjSubmitter'
        DataType = ftString
        Size = 14
      end>
    Left = 692
    Top = 439
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNfItemNotaReferenciada'
    object adsNotasReferenciadasSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsNotasReferenciadasNrItemNfRef: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'NrItemNfRef'
      Required = True
    end
    object adsNotasReferenciadasChaveAcesso: TStringField
      DisplayLabel = 'Chave Acesso'
      FieldName = 'ChaveAcesso'
      Required = True
      Size = 44
    end
    object adsNotasReferenciadasQtTributavel: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QtTributavel'
    end
    object adsNotasReferenciadasNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object adsNotasReferenciadasNrNf: TStringField
      FieldName = 'NrNf'
      Required = True
      Size = 10
    end
    object adsNotasReferenciadasNrItem: TStringField
      FieldName = 'NrItem'
      Required = True
      Size = 3
    end
    object adsNotasReferenciadasNrItemNfRefItem: TIntegerField
      DisplayLabel = 'Item NF Referenciada'
      FieldName = 'NrItemNfRefItem'
    end
    object adsNotasReferenciadasNrCpfCnpjSubmitter: TStringField
      FieldName = 'NrCpfCnpjSubmitter'
      Size = 14
    end
  end
  object dtsNotasReferenciadas: TDataSource
    AutoEdit = False
    DataSet = adsNotasReferenciadas
    Left = 616
    Top = 453
  end
  object OpenDialogExcel: TOpenDialog
    DefaultExt = 'xls'
    Filter = 'Arquivos Excel (*.xls)|*.XLS;*.XLSX; *.XLSB'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 532
    Top = 336
  end
  object adsNFsComplementares: TAureliusDataset
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
        Name = 'NrNf'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ChaveAcesso'
        Attributes = [faRequired]
        DataType = ftString
        Size = 44
      end
      item
        Name = 'NrItemNfComplementarItem'
        DataType = ftInteger
      end>
    Left = 692
    Top = 383
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNfItemNfComplementar'
    object adsNFsComplementaresSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object adsNFsComplementaresNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Required = True
      Visible = False
      Size = 18
    end
    object adsNFsComplementaresNrNf: TStringField
      FieldName = 'NrNf'
      Required = True
      Visible = False
      Size = 10
    end
    object adsNFsComplementaresNrItem: TStringField
      FieldName = 'NrItem'
      Required = True
      Visible = False
      Size = 3
    end
    object adsNFsComplementaresChaveAcesso: TStringField
      DisplayLabel = 'Chave Acesso'
      FieldName = 'ChaveAcesso'
      Required = True
      Size = 44
    end
    object adsNFsComplementaresNrItemNfComplementarItem: TIntegerField
      DisplayLabel = 'Item NF Complementar'
      FieldName = 'NrItemNfComplementarItem'
    end
  end
  object dtsNFsComplementares: TDataSource
    AutoEdit = False
    DataSet = adsNFsComplementares
    Left = 616
    Top = 397
  end
  object dscNcmAtributos: TDataSource
    AutoEdit = False
    DataSet = adsNcmAtributos
    Left = 848
    Top = 12
  end
  object adsNcmAtributos: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdNcm'
        Attributes = [faRequired]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CdAtributo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NmAtributo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NmFormaPreenchimento'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'InObrigatorio'
        DataType = ftBoolean
      end
      item
        Name = 'DtInicioVigencia'
        DataType = ftDateTime
      end>
    BeforeEdit = adsDetailBeforeEdit
    IncludeUnmappedObjects = True
    SubpropsDepth = 1
    Left = 904
    Top = 25
    DesignClass = 'MyEntitiesBroker.TTncmExpAtributo'
    object adsNcmAtributosSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsNcmAtributosCdNcm: TStringField
      FieldName = 'CdNcm'
      Required = True
      Size = 8
    end
    object adsNcmAtributosCdAtributo: TStringField
      FieldName = 'CdAtributo'
      Required = True
      Size = 15
    end
    object adsNcmAtributosNmAtributo: TStringField
      FieldName = 'NmAtributo'
      Size = 50
    end
    object adsNcmAtributosNmFormaPreenchimento: TStringField
      FieldName = 'NmFormaPreenchimento'
      Size = 50
    end
    object adsNcmAtributosInObrigatorio: TBooleanField
      FieldName = 'InObrigatorio'
    end
    object adsNcmAtributosDtInicioVigencia: TDateTimeField
      FieldName = 'DtInicioVigencia'
    end
  end
  object dscNcmAtributoValor: TDataSource
    AutoEdit = False
    DataSet = adsNcmAtributoValor
    Left = 848
    Top = 56
  end
  object adsNcmAtributoValor: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'CdNcm'
        Attributes = [faRequired]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CdAtributo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CdAtributoValor'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NmAtributoValor'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'NmAtributo'
        DataType = ftString
        Size = 50
      end>
    BeforeEdit = adsDetailBeforeEdit
    IncludeUnmappedObjects = True
    SubpropsDepth = 1
    Left = 904
    Top = 69
    DesignClass = 'MyEntitiesBroker.TTncmExpAtributoValor'
    object adsNcmAtributoValorSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsNcmAtributoValorCdNcm: TStringField
      FieldName = 'CdNcm'
      Required = True
      Size = 8
    end
    object adsNcmAtributoValorCdAtributo: TStringField
      FieldName = 'CdAtributo'
      Required = True
      Size = 15
    end
    object adsNcmAtributoValorCdAtributoValor: TStringField
      FieldName = 'CdAtributoValor'
      Required = True
      Size = 3
    end
    object adsNcmAtributoValorNmAtributoValor: TStringField
      FieldName = 'NmAtributoValor'
      Size = 200
    end
    object adsNcmAtributoValorNmAtributo: TStringField
      FieldName = 'NmAtributo'
      Size = 50
    end
  end
  object dscItensNfNcmAtributos: TDataSource
    AutoEdit = False
    DataSet = adsItensNfNcmAtributos
    Left = 848
    Top = 99
  end
  object adsItensNfNcmAtributos: TAureliusDataset
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
        Name = 'NrNf'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CdNcm'
        Attributes = [faRequired]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CdAtributo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CdAtributoValor'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end>
    BeforeEdit = adsDetailBeforeEdit
    IncludeUnmappedObjects = True
    SubpropsDepth = 1
    Left = 904
    Top = 112
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNfItemNcmAtributo'
    object adsItensNfNcmAtributosSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsItensNfNcmAtributosNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object adsItensNfNcmAtributosNrNf: TStringField
      FieldName = 'NrNf'
      Required = True
      Size = 10
    end
    object adsItensNfNcmAtributosNrItem: TStringField
      FieldName = 'NrItem'
      Required = True
      Size = 3
    end
    object adsItensNfNcmAtributosCdNcm: TStringField
      FieldName = 'CdNcm'
      Required = True
      Size = 8
    end
    object adsItensNfNcmAtributosCdAtributo: TStringField
      DisplayLabel = 'C'#243'd do atributo'
      FieldName = 'CdAtributo'
      Required = True
      Size = 15
    end
    object adsItensNfNcmAtributosCdAtributoValor: TStringField
      DisplayLabel = 'C'#243'd do valor'
      FieldName = 'CdAtributoValor'
      Required = True
      Size = 3
    end
    object adsItensNfNcmAtributosNM_ATRIBUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o do atributo'
      FieldKind = fkCalculated
      FieldName = 'NM_ATRIBUTO'
      OnGetText = adsItensNfNcmAtributosNM_ATRIBUTOGetText
      Size = 30
      Calculated = True
    end
    object adsItensNfNcmAtributosNM_ATRIBUTO_VALOR: TStringField
      DisplayLabel = 'Valor do atributo'
      FieldKind = fkCalculated
      FieldName = 'NM_ATRIBUTO_VALOR'
      OnGetText = adsItensNfNcmAtributosNM_ATRIBUTO_VALORGetText
      Size = 100
      Calculated = True
    end
  end
  object qryLPCO: TFDQuery
    Connection = FireDacMSSQLConnection.Connection
    Left = 744
    Top = 553
  end
  object dsNFsEnquadramentoAC: TDataSource
    DataSet = adsNFsEnquadramentoAC
    Left = 915
    Top = 296
  end
  object adsNFsEnquadramentoAC: TAureliusDataset
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
        Name = 'NrNf'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NrItem'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NrSeqNfDrawback'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NrChaveAcessoNf'
        Attributes = [faRequired]
        DataType = ftString
        Size = 44
      end
      item
        Name = 'QuantidadeNf'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'DataNf'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'ValorMoedaNegociacaoNf'
        Attributes = [faRequired]
        DataType = ftFloat
      end>
    SubpropsDepth = 2
    Left = 949
    Top = 300
    DesignClass = 'MyEntitiesBroker.TTprocessoExpNfItemNfDrawback'
    object adsNFsEnquadramentoACSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsNFsEnquadramentoACNrProcesso: TStringField
      FieldName = 'NrProcesso'
      Required = True
      Size = 18
    end
    object adsNFsEnquadramentoACNrNf: TStringField
      FieldName = 'NrNf'
      Required = True
      Size = 10
    end
    object adsNFsEnquadramentoACNrItem: TStringField
      FieldName = 'NrItem'
      Required = True
      Size = 3
    end
    object adsNFsEnquadramentoACNrSeqNfDrawback: TIntegerField
      FieldName = 'NrSeqNfDrawback'
      Required = True
    end
    object adsNFsEnquadramentoACNrChaveAcessoNf: TStringField
      FieldName = 'NrChaveAcessoNf'
      Required = True
      Size = 44
    end
    object adsNFsEnquadramentoACQuantidadeNf: TFloatField
      FieldName = 'QuantidadeNf'
      Required = True
      DisplayFormat = '##0.00000'
      EditFormat = '##0.00000'
    end
    object adsNFsEnquadramentoACDataNf: TDateField
      FieldName = 'DataNf'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000'
    end
    object adsNFsEnquadramentoACValorMoedaNegociacaoNf: TFloatField
      FieldName = 'ValorMoedaNegociacaoNf'
      Required = True
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
  end
  object qryInsertAcDrawback: TFDQuery
    Connection = FireDacMSSQLConnection.Connection
    Left = 744
    Top = 601
  end
  object qryConsultaItemACDrawback: TFDQuery
    Connection = FireDacMSSQLConnection.Connection
    Left = 760
    Top = 617
  end
end
