object frmRelatoriosNestle: TfrmRelatoriosNestle
  Left = 441
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rios Nestl'#233' - '
  ClientHeight = 718
  ClientWidth = 987
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 987
    Height = 718
    Align = alClient
    TabOrder = 0
    object pnlGerarRelatorio: TPanel
      Left = 1
      Top = 675
      Width = 985
      Height = 42
      Align = alBottom
      Anchors = [akLeft, akRight]
      TabOrder = 0
      DesignSize = (
        985
        42)
      object btnVisualizar: TSpeedButton
        Left = 861
        Top = 8
        Width = 118
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Visualizar'
        Flat = True
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DD000DDDDDDDDDD000DD0000D000
          000000000000000D0000D0F8888888888888880D0000D0F8888888888888880D
          0000D0F8888888822899880D0000D0FFFFFFFFFFFFFFFF0D0000D70077777777
          7777007D0000DDD00000000000000DDD0000DDD00FFFFFFFFFF00DDD0000DDDD
          0F00000000F0DDDD0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00000000F0DDDD
          0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00FFFFFFF0DDDD0000DDDD0FFFFFFF
          FFF0DDDD0000DDDD000000000000DDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
          DDDDDDDDDDDDDDDD0000}
        Layout = blGlyphRight
        ParentShowHint = False
        ShowHint = True
        OnClick = btnVisualizarClick
      end
      object SpeedButton3: TSpeedButton
        Left = 731
        Top = 8
        Width = 118
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Enviar por e-Mail'
        Flat = True
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777000000070000000000077777000000070FFFFFFFFF0777770000000700F
          FFFFF00000000000000070F0FFFFF0FF77770000000070FF0FFF00B800870000
          000070F0F000F0F07F0700000000700F7F7F70B07B070000000070F7F7F7F0F0
          7F0700000000770F7F7F70B07B07000000007770F7F7F0F07F07000000007777
          0F7F00B07BFB000000007777700070008800000000007777777777707F077000
          0000777777777778007770000000777777777777777770000000777777777777
          777770000000}
        Layout = blGlyphRight
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton3Click
      end
      object lblMensagens: TLabel
        Left = 4
        Top = 11
        Width = 331
        Height = 18
        Caption = 'N'#227'o foram encontrados resultados para a consulta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 985
      Height = 41
      Align = alTop
      TabOrder = 1
      DesignSize = (
        985
        41)
      object SpeedButton1: TSpeedButton
        Left = 944
        Top = 0
        Width = 38
        Height = 41
        Hint = 'Sa'#237'da'
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
          0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
          0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
          0333337F777FFFFF7F3333000000000003333377777777777333}
        Layout = blGlyphBottom
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object lblNomeRelatorio: TLabel
        Left = 8
        Top = 12
        Width = 65
        Height = 16
        Caption = 'Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pgFiltros: TPageControl
      Left = 1
      Top = 121
      Width = 985
      Height = 554
      ActivePage = tbFaturaComercial
      Align = alClient
      TabOrder = 2
      object tbProgramacaoRodoviaria: TTabSheet
        Caption = 'Programa'#231#227'o Rodoviaria'
        object lblObservacoesProgRodoviaria: TLabel
          Left = 8
          Top = 1
          Width = 63
          Height = 13
          Caption = 'Observa'#231#245'es'
        end
        object mmObservacoesProgRodoviaria: TMemo
          Left = 8
          Top = 16
          Width = 404
          Height = 43
          MaxLength = 152
          TabOrder = 0
        end
      end
      object tbsSaque: TTabSheet
        Tag = 1
        Caption = 'Saque'
        ImageIndex = 8
      end
      object TabSheet1: TTabSheet
        Tag = 2
        Caption = 'Certificado de Aptid'#227'o'
        ImageIndex = 9
      end
      object tbBordero: TTabSheet
        Tag = 3
        Caption = 'Bordero'
        ImageIndex = 1
        object Label19: TLabel
          Left = 8
          Top = 25
          Width = 63
          Height = 13
          Caption = 'Observa'#231#245'es'
        end
        object gbAvisoPor: TGroupBox
          Left = 8
          Top = 86
          Width = 155
          Height = 74
          Caption = 'Aviso Por'
          TabOrder = 0
          object chbTelegrama: TCheckBox
            Left = 6
            Top = 18
            Width = 110
            Height = 17
            Caption = 'Telegrama P/AFC'
            TabOrder = 0
          end
          object chbViaAerea: TCheckBox
            Left = 6
            Top = 37
            Width = 69
            Height = 17
            Caption = 'Via a'#233'rea'
            TabOrder = 1
          end
        end
        object gbObseracao1: TGroupBox
          Left = 168
          Top = 86
          Width = 189
          Height = 74
          TabOrder = 1
          object chbFaltaAceitePagamento: TCheckBox
            Left = 8
            Top = 14
            Width = 175
            Height = 17
            Caption = 'Falta de aceite e/ou pagamento'
            TabOrder = 0
          end
          object chbPagamentoEfetuado: TCheckBox
            Left = 8
            Top = 33
            Width = 177
            Height = 17
            Caption = 'Pagamento efetuado'
            TabOrder = 1
          end
          object chbRemessaFundos: TCheckBox
            Left = 8
            Top = 53
            Width = 169
            Height = 17
            Caption = 'Remessa de fundos'
            TabOrder = 2
          end
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 161
          Width = 349
          Height = 259
          Caption = 'Instru'#231#245'es Para Cobran'#231'a'
          TabOrder = 2
          object chbEnviarDocBancoExterior: TCheckBox
            Left = 8
            Top = 21
            Width = 330
            Height = 17
            Caption = 'Enviar os documentos para o banco interveniente no exterior'
            TabOrder = 0
          end
          object chbEntregarDocumentosContaPgmto: TCheckBox
            Left = 8
            Top = 40
            Width = 330
            Height = 17
            Caption = 'Entregar os documentos contra o pagamento'
            TabOrder = 1
          end
          object chbEntregarDocumentosContraAceite: TCheckBox
            Left = 8
            Top = 60
            Width = 330
            Height = 17
            Caption = 'Entregar os documentos contra aceite'
            TabOrder = 2
          end
          object chbNaoProtestar: TCheckBox
            Left = 8
            Top = 79
            Width = 330
            Height = 17
            Caption = 'N'#227'o protestar'
            TabOrder = 3
          end
          object chbProtestarFaltaAceite: TCheckBox
            Left = 8
            Top = 98
            Width = 330
            Height = 17
            Caption = 'Protestar por falta de aceite'
            TabOrder = 4
          end
          object chbProtestarFaltaPgmto: TCheckBox
            Left = 8
            Top = 118
            Width = 330
            Height = 17
            Caption = 'Protestar por falta de pagamento, ap'#243's o vencimento'
            TabOrder = 5
          end
          object chbCobrarJuros: TCheckBox
            Left = 8
            Top = 137
            Width = 330
            Height = 32
            Caption = 
              'Em caso de atraso de pagamento, cobrar juros do sacado a taxa Li' +
              'bor mais 5% de "spread" at'#233' o dia do pagamento'
            TabOrder = 6
            WordWrap = True
          end
          object chbDespesasCorrespondenteSacado: TCheckBox
            Left = 8
            Top = 173
            Width = 330
            Height = 17
            Caption = 'As despesas de seu correspondente ser'#227'o por conta do Sacado'
            TabOrder = 7
          end
          object chbDespesasSacado: TCheckBox
            Left = 8
            Top = 193
            Width = 330
            Height = 17
            Caption = 'Suas despesas serao por conta do Sacado'
            TabOrder = 8
          end
          object chbTodasDespesasNossaConta: TCheckBox
            Left = 8
            Top = 233
            Width = 330
            Height = 17
            Caption = 'Todas as despesas ser'#227'o por nossa conta'
            TabOrder = 10
          end
          object chbDespesasNossaConta: TCheckBox
            Left = 8
            Top = 213
            Width = 330
            Height = 17
            Caption = 'Suas despesas ser'#227'o por nossa conta'
            TabOrder = 9
          end
        end
        object GroupBox2: TGroupBox
          Left = 368
          Top = 36
          Width = 193
          Height = 384
          Caption = 'Documentos Anexos'
          TabOrder = 3
          object chbSaque: TCheckBox
            Left = 8
            Top = 40
            Width = 170
            Height = 17
            Caption = 'Saque'
            TabOrder = 0
          end
          object chbFaturaComercial: TCheckBox
            Left = 8
            Top = 64
            Width = 170
            Height = 17
            Caption = 'Fatura Comercial'
            TabOrder = 1
          end
          object chbCertificadoOrigem: TCheckBox
            Left = 8
            Top = 88
            Width = 170
            Height = 17
            Caption = 'Certificado de Origem'
            TabOrder = 2
          end
          object chbCertificadoSeguro: TCheckBox
            Left = 8
            Top = 112
            Width = 170
            Height = 17
            Caption = 'Certificado de Seguro'
            TabOrder = 3
          end
          object chbConhecimento: TCheckBox
            Left = 8
            Top = 136
            Width = 170
            Height = 17
            Caption = 'Conhecimento de Embarque'
            TabOrder = 4
          end
          object chbPackingList: TCheckBox
            Left = 8
            Top = 160
            Width = 170
            Height = 17
            Caption = 'Packing List'
            TabOrder = 5
          end
          object chbCertificadoInspecao: TCheckBox
            Left = 8
            Top = 184
            Width = 170
            Height = 17
            Caption = 'Certificado de Inspe'#231#227'o'
            TabOrder = 6
            WordWrap = True
          end
          object chbCertificadoQualidade: TCheckBox
            Left = 8
            Top = 208
            Width = 170
            Height = 17
            Caption = 'Certificado de Qualidade'
            TabOrder = 7
          end
          object chbCartaCredito: TCheckBox
            Left = 8
            Top = 232
            Width = 170
            Height = 17
            Caption = 'Carta de Cr'#233'dito'
            TabOrder = 8
          end
          object chbCartaCliente: TCheckBox
            Left = 8
            Top = 280
            Width = 170
            Height = 17
            Caption = 'Carta ao Cliente'
            TabOrder = 10
          end
          object chbEmendaLC: TCheckBox
            Left = 8
            Top = 256
            Width = 170
            Height = 17
            Caption = 'Emenda da L/C'
            TabOrder = 9
          end
          object chbExtra3: TCheckBox
            Left = 8
            Top = 352
            Width = 170
            Height = 17
            TabOrder = 15
          end
          object chbExtra2: TCheckBox
            Left = 8
            Top = 328
            Width = 170
            Height = 17
            TabOrder = 13
          end
          object chbExtra1: TCheckBox
            Left = 8
            Top = 304
            Width = 170
            Height = 17
            TabOrder = 11
          end
          object edtExtra1: TEdit
            Left = 26
            Top = 304
            Width = 121
            Height = 21
            TabOrder = 12
          end
          object edtExtra2: TEdit
            Left = 26
            Top = 328
            Width = 121
            Height = 21
            TabOrder = 14
          end
          object edtExtra3: TEdit
            Left = 26
            Top = 352
            Width = 121
            Height = 21
            TabOrder = 16
          end
        end
        object GroupBox3: TGroupBox
          Left = 563
          Top = 36
          Width = 112
          Height = 384
          Caption = 'Quantidade'
          TabOrder = 4
          object Label3: TLabel
            Left = 14
            Top = 15
            Width = 35
            Height = 13
            Caption = 'Original'
          end
          object Label4: TLabel
            Left = 67
            Top = 15
            Width = 27
            Height = 13
            Caption = 'C'#243'pia'
          end
          object edtCertificadoOrigemOriginal: TEdit
            Left = 13
            Top = 88
            Width = 38
            Height = 21
            TabOrder = 4
          end
          object edtCertificadoOrigemCopia: TEdit
            Left = 65
            Top = 88
            Width = 38
            Height = 21
            TabOrder = 5
          end
          object edtCertificadoSeguroOriginal: TEdit
            Left = 13
            Top = 112
            Width = 38
            Height = 21
            TabOrder = 6
          end
          object edtCertificadoSeguroCopia: TEdit
            Left = 65
            Top = 112
            Width = 38
            Height = 21
            TabOrder = 7
          end
          object edtConhecimentoEmbarqueOriginal: TEdit
            Left = 13
            Top = 136
            Width = 38
            Height = 21
            TabOrder = 8
          end
          object edtConhecimentoEmbarqueCopia: TEdit
            Left = 65
            Top = 136
            Width = 38
            Height = 21
            TabOrder = 9
          end
          object edtPackingListOriginal: TEdit
            Left = 13
            Top = 160
            Width = 38
            Height = 21
            TabOrder = 10
          end
          object edtPackingListCopia: TEdit
            Left = 65
            Top = 160
            Width = 38
            Height = 21
            TabOrder = 11
          end
          object edtCertificadoInspecaoOriginal: TEdit
            Left = 13
            Top = 184
            Width = 38
            Height = 21
            TabOrder = 12
          end
          object edtCertificadoInspecaoCopia: TEdit
            Left = 65
            Top = 184
            Width = 38
            Height = 21
            TabOrder = 13
          end
          object edtCertificadoQualidadeOriginal: TEdit
            Left = 13
            Top = 208
            Width = 38
            Height = 21
            TabOrder = 14
          end
          object edtCertificadoQualidadeCopia: TEdit
            Left = 65
            Top = 208
            Width = 38
            Height = 21
            TabOrder = 15
          end
          object edtCartaCreditoOriginal: TEdit
            Left = 13
            Top = 232
            Width = 38
            Height = 21
            TabOrder = 16
          end
          object edtCartaCreditoCopia: TEdit
            Left = 65
            Top = 232
            Width = 38
            Height = 21
            TabOrder = 17
          end
          object edtEmendaLCOriginal: TEdit
            Left = 13
            Top = 256
            Width = 38
            Height = 21
            TabOrder = 18
          end
          object edtEmendaLCCopia: TEdit
            Left = 65
            Top = 256
            Width = 38
            Height = 21
            TabOrder = 19
          end
          object edtCartaClienteOriginal: TEdit
            Left = 13
            Top = 280
            Width = 38
            Height = 21
            TabOrder = 20
          end
          object edtCartaClienteCopia: TEdit
            Left = 65
            Top = 280
            Width = 38
            Height = 21
            TabOrder = 21
          end
          object edtExtra1Original: TEdit
            Left = 13
            Top = 304
            Width = 38
            Height = 21
            TabOrder = 22
          end
          object edtExtra1Copia: TEdit
            Left = 65
            Top = 304
            Width = 38
            Height = 21
            TabOrder = 23
          end
          object edtExtra2Original: TEdit
            Left = 13
            Top = 328
            Width = 38
            Height = 21
            TabOrder = 24
          end
          object edtExtra2Copia: TEdit
            Left = 65
            Top = 328
            Width = 38
            Height = 21
            TabOrder = 25
          end
          object edtExtra3Original: TEdit
            Left = 13
            Top = 352
            Width = 38
            Height = 21
            TabOrder = 26
          end
          object edtExtra3Copia: TEdit
            Left = 65
            Top = 352
            Width = 38
            Height = 21
            TabOrder = 27
          end
          object edtFaturaComercialOriginal: TEdit
            Left = 13
            Top = 64
            Width = 38
            Height = 21
            TabOrder = 2
          end
          object edtFaturaComercialCopia: TEdit
            Left = 65
            Top = 64
            Width = 38
            Height = 21
            TabOrder = 3
          end
          object edtSaqueOriginal: TEdit
            Left = 13
            Top = 40
            Width = 38
            Height = 21
            TabOrder = 0
          end
          object edtSaqueCopia: TEdit
            Left = 65
            Top = 40
            Width = 38
            Height = 21
            TabOrder = 1
          end
        end
        object GroupBox4: TGroupBox
          Left = 8
          Top = 420
          Width = 668
          Height = 72
          TabOrder = 5
          object chbEncaminharDocCarteira: TCheckBox
            Left = 8
            Top = 13
            Width = 649
            Height = 28
            Caption = 
              'Encaminharemos anexo copia dos documentos para serem mantidos em' +
              ' carteira, pois o importador far'#225' a liquida'#231#227'o por ordem de paga' +
              'mento. Os documentos originais foram encaminhados diretamente ao' +
              ' importador pela Nestle Brasil LTDA.'
            TabOrder = 0
            WordWrap = True
          end
          object chbEnviadoExteriorCourier: TCheckBox
            Left = 8
            Top = 47
            Width = 649
            Height = 20
            Caption = 
              'Ser enviados ao exterior via courier: DHL(Informar nossa C/C xxx' +
              'xx + nr. Fatura Comercial).)'
            TabOrder = 1
          end
        end
        object chbImprimirUsuarioBordero: TCheckBox
          Left = 7
          Top = 5
          Width = 140
          Height = 17
          Caption = 'Imprimir nome do usu'#225'rio'
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object mmObservacaoBordero: TMemo
          Left = 8
          Top = 40
          Width = 348
          Height = 43
          MaxLength = 1000
          TabOrder = 7
        end
      end
      object tsCaricom: TTabSheet
        Tag = 4
        Caption = 'CARICOM'
        ImageIndex = 6
        object Label17: TLabel
          Left = 101
          Top = 11
          Width = 61
          Height = 13
          Caption = 'Coordenador'
        end
        object Label18: TLabel
          Left = 138
          Top = 39
          Width = 20
          Height = 13
          Caption = 'CPF'
        end
        object rgVersaoCaricom: TRadioGroup
          Left = 4
          Top = 1
          Width = 76
          Height = 63
          Caption = 'Vers'#227'o'
          ItemIndex = 0
          Items.Strings = (
            'Original'
            'C'#243'pia')
          TabOrder = 0
        end
        object edtCoordenador: TEdit
          Left = 171
          Top = 7
          Width = 225
          Height = 21
          MaxLength = 50
          TabOrder = 1
        end
        object edtCpfCaricom: TEdit
          Left = 171
          Top = 33
          Width = 225
          Height = 21
          MaxLength = 14
          TabOrder = 2
        end
      end
      object tbInstrucaoEmbarque: TTabSheet
        Tag = 5
        Caption = 'Instru'#231#227'o de Embarque'
        ImageIndex = 5
        object Label15: TLabel
          Left = 7
          Top = 2
          Width = 86
          Height = 13
          Caption = 'RAPs Dispon'#237'veis'
        end
        object Label16: TLabel
          Left = 367
          Top = 2
          Width = 94
          Height = 13
          Caption = 'RAPs Selecionadas'
        end
        object dbgDisponiveis: TDBGrid
          Left = 2
          Top = 16
          Width = 319
          Height = 120
          DataSource = datm_RelatorioNestle.dsRapsImpressao
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgDisponiveisDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_RAP'
              Title.Caption = 'Cod RAP'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_RAP_ANO'
              Title.Caption = 'Ano RAP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_FORNECIMENTO'
              Title.Caption = 'Fornecimento'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_INSERCAO'
              Title.Caption = 'Data Inclus'#227'o'
              Width = 80
              Visible = True
            end>
        end
        object btnSeleciona: TBitBtn
          Left = 327
          Top = 15
          Width = 28
          Height = 25
          TabOrder = 1
          OnClick = btnSelecionaClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000666666666666666666666666666666666666000066666688886666666666
            6666888866666666000066666F44448666666666666F88888666666600006666
            66F44448666666666666F8888866666600006666666F44448666666666666F88
            88866666000066666666F44448666666666666F8888866660000666666666F44
            448666666666666F888886660000666666666F44448666666666666F88888666
            000066666666F44448666666666666F88888666600006666666F444486666666
            66666F88888666660000666666F44448666666666666F8888866666600006666
            6F44448666666666666F888886666666000066666FFFF66666666666666FFFF6
            6666666600006666666666666666666666666666666666660000666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000}
          NumGlyphs = 2
        end
        object btnVoltaTodos: TBitBtn
          Left = 327
          Top = 110
          Width = 28
          Height = 25
          TabOrder = 2
          OnClick = btnVoltaTodosClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000666666666666666666666666666666666666000066666688886666888866
            666688886666888800006666F4444866F444486666F8888866F888880000666F
            4444866F444486666F8888866F888886000066F4444866F444486666F8888866
            F888886600006F4444866F444486666F8888866F888886660000F4444866F444
            486666F8888866F8888866660000F4444866F444486666F8888866F888886666
            00006F4444866F444486666F8888866F88888666000066F4444866F444486666
            F8888866F88888660000666F4444866F444486666F8888866F88888600006666
            F4444866F444486666F8888866F88888000066666FFFF6666FFFF666666FFFF6
            666FFFF600006666666666666666666666666666666666660000666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000}
          NumGlyphs = 2
        end
        object btnSelecionaTodos: TBitBtn
          Left = 327
          Top = 42
          Width = 28
          Height = 25
          TabOrder = 3
          OnClick = btnSelecionaTodosClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000666666666666666666666666666666666666000068888666688886666668
            88866668888666660000F4444866F444486666F8888866F88888666600006F44
            44866F444486666F8888866F88888666000066F4444866F444486666F8888866
            F88888660000666F4444866F444486666F8888866F88888600006666F4444866
            F444486666F8888866F8888800006666F4444866F444486666F8888866F88888
            0000666F4444866F444486666F8888866F888886000066F4444866F444486666
            F8888866F888886600006F4444866F444486666F8888866F888886660000F444
            4866F444486666F8888866F8888866660000FFFF6666FFFF666666FFFF6666FF
            FF66666600006666666666666666666666666666666666660000666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000}
          NumGlyphs = 2
        end
        object btnVolta: TBitBtn
          Left = 327
          Top = 83
          Width = 28
          Height = 25
          TabOrder = 4
          OnClick = btnVoltaClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000666666666666666666666666666666666666000066666666688886666666
            666666688886666600006666666F44448666666666666F888886666600006666
            66F44448666666666666F88888666666000066666F44448666666666666F8888
            8666666600006666F44448666666666666F88888666666660000666F44448666
            666666666F888886666666660000666F44448666666666666F88888666666666
            00006666F44448666666666666F8888866666666000066666F44448666666666
            666F8888866666660000666666F44448666666666666F8888866666600006666
            666F44448666666666666F8888866666000066666666FFFF66666666666666FF
            FF66666600006666666666666666666666666666666666660000666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000}
          NumGlyphs = 2
        end
        object dbgSelecionadas: TDBGrid
          Left = 362
          Top = 16
          Width = 318
          Height = 120
          DataSource = datm_RelatorioNestle.dsRapsSelecionadas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 5
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgSelecionadasDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_RAP'
              Title.Caption = 'Cod RAP'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_RAP_ANO'
              Title.Caption = 'Ano RAP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_FORNECIMENTO'
              Title.Caption = 'Fornecimento'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_INSERCAO'
              Title.Caption = 'Data Inclus'#227'o'
              Width = 80
              Visible = True
            end>
        end
      end
      object tbPackingList: TTabSheet
        Tag = 6
        Caption = 'Packing List'
        ImageIndex = 2
        object rgLotePackingList: TRadioGroup
          Left = 210
          Top = 1
          Width = 89
          Height = 63
          Caption = 'Incluir Lote'
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'N'#227'o')
          TabOrder = 0
        end
        object rgIdiomaPackingList: TRadioGroup
          Left = 6
          Top = 1
          Width = 85
          Height = 63
          Caption = 'Idioma'
          ItemIndex = 0
          Items.Strings = (
            'Ingles'
            'Espanhol')
          TabOrder = 1
        end
        object rgTitulo: TRadioGroup
          Left = 97
          Top = 1
          Width = 106
          Height = 63
          Caption = 'T'#237'tulo (Ingles)'
          ItemIndex = 0
          Items.Strings = (
            'Packing List'
            'Bath Mark List')
          TabOrder = 2
        end
        object rgVersaoPackingList: TRadioGroup
          Left = 305
          Top = 1
          Width = 76
          Height = 63
          Caption = 'Vers'#227'o'
          ItemIndex = 0
          Items.Strings = (
            'Ambos'
            'Original'
            'C'#243'pia')
          TabOrder = 3
        end
        object chbImprimirUsuarioPackingList: TCheckBox
          Left = 7
          Top = 69
          Width = 140
          Height = 17
          Caption = 'Imprimir nome do usu'#225'rio'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object rgTipoAgrupamento: TRadioGroup
          Left = 387
          Top = 1
          Width = 290
          Height = 63
          Caption = 'Tipo Agrupamento'
          ItemIndex = 0
          Items.Strings = (
            'Nr Fatura'
            'Nr Container - Todos'
            'Nr Container - '#218'nico')
          TabOrder = 5
          OnClick = rgTipoAgrupamentoClick
        end
        object dblkContainers: TDBLookupComboBox
          Left = 523
          Top = 39
          Width = 150
          Height = 21
          Enabled = False
          KeyField = 'NR_CNTR'
          ListField = 'CONTAINER'
          ListSource = datm_RelatorioNestle.dsContainers
          TabOrder = 6
        end
      end
      object tbFaturaComercial: TTabSheet
        Tag = 7
        Caption = 'Fatura Comercial'
        ImageIndex = 3
        object rgIdioma: TRadioGroup
          Left = 0
          Top = 1
          Width = 76
          Height = 100
          Caption = 'Idioma'
          ItemIndex = 0
          Items.Strings = (
            'Ingles'
            'Espanhol')
          TabOrder = 0
        end
        object rgTipo: TRadioGroup
          Left = 80
          Top = 1
          Width = 112
          Height = 100
          Caption = 'Tipo'
          ItemIndex = 0
          Items.Strings = (
            'Proforma'
            'Fatura Comercial'
            'Fatura'
            'Proforma 5%')
          TabOrder = 1
          OnClick = rgTipoClick
        end
        object rgVersao: TRadioGroup
          Left = 195
          Top = 1
          Width = 71
          Height = 100
          Caption = 'Vers'#227'o'
          ItemIndex = 0
          Items.Strings = (
            'Ambos'
            'Original'
            'C'#243'pia')
          TabOrder = 2
        end
        object chbImprimirUsuarioFaturaComercial: TCheckBox
          Left = 3
          Top = 133
          Width = 140
          Height = 17
          Caption = 'Imprimir nome do usu'#225'rio'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object rgImprimirNCM: TRadioGroup
          Left = 271
          Top = 1
          Width = 99
          Height = 100
          Caption = 'Agrupar por NCM'
          ItemIndex = 1
          Items.Strings = (
            'N'#227'o'
            'Sim')
          TabOrder = 4
        end
        object rgIsentoRegistro: TRadioGroup
          Left = 376
          Top = 1
          Width = 100
          Height = 100
          Caption = 'Isento de Registro'
          ItemIndex = 0
          Items.Strings = (
            'N'#227'o'
            'Sim')
          TabOrder = 5
        end
        object rgControle: TRadioGroup
          Left = 648
          Top = 1
          Width = 146
          Height = 100
          Caption = ' Controle '
          ItemIndex = 0
          Items.Strings = (
            'N'#250'mero do Embarque'
            'Pedido')
          TabOrder = 6
        end
        object cxGroupBox1: TcxGroupBox
          Left = 482
          Top = 0
          PanelStyle.OfficeBackgroundKind = pobkGradient
          Style.BorderStyle = ebs3D
          TabOrder = 7
          Height = 100
          Width = 160
          object dblkMercadoriasFatura: TDBLookupComboBox
            Left = 15
            Top = 72
            Width = 141
            Height = 21
            Enabled = False
            KeyField = 'CD_MERCADORIA'
            ListField = 'MERCADORIA'
            ListSource = datm_RelatorioNestle.dsMercadorias
            TabOrder = 0
            Visible = False
          end
          object dblkContainersFatura: TDBLookupComboBox
            Left = 7
            Top = 72
            Width = 141
            Height = 21
            Enabled = False
            KeyField = 'NR_CNTR'
            ListField = 'CONTAINER'
            ListSource = datm_RelatorioNestle.dsContainers
            TabOrder = 1
          end
          object rgIFaturaPorCntrOuMerc: TRadioGroup
            Left = 0
            Top = 1
            Width = 160
            Height = 64
            Caption = ' Fatura por: '
            ItemIndex = 0
            Items.Strings = (
              'Nenhum'
              'Container'
              'Mercadoria')
            TabOrder = 2
            OnClick = rgIFaturaPorCntrOuMercClick
          end
        end
      end
      object tbShippingInstructions: TTabSheet
        Tag = 8
        Caption = 'Shipping Instructions'
        ImageIndex = 4
        object lblShipOwners: TLabel
          Left = 8
          Top = 8
          Width = 147
          Height = 13
          Caption = 'Shipowners/Freight Forwarding'
        end
        object edtShipOwners: TEdit
          Left = 8
          Top = 24
          Width = 305
          Height = 21
          MaxLength = 100
          TabOrder = 0
        end
      end
      object tbsVigilanciaSanitaria: TTabSheet
        Tag = 9
        Caption = 'Certificado - Vigil'#226'ncia Sanit'#225'ria'
        ImageIndex = 7
        object rgIdiomaCertificadoVigilanciaSanitaria: TRadioGroup
          Left = 0
          Top = 1
          Width = 150
          Height = 85
          Caption = 'Idioma'
          ItemIndex = 0
          Items.Strings = (
            'Ingles'
            'Espanhol'
            'Espanhol - Colombia')
          TabOrder = 0
        end
      end
    end
    object pgPrincipal: TPageControl
      Left = 1
      Top = 42
      Width = 985
      Height = 79
      ActivePage = tbInstrucao
      Align = alTop
      TabOrder = 3
      object tbProcesso: TTabSheet
        Caption = 'Processo'
        object lblNrProcesso: TLabel
          Left = 359
          Top = 8
          Width = 61
          Height = 13
          Caption = 'Nr. Processo'
        end
        object lblUnidadeNeg: TLabel
          Left = 8
          Top = 9
          Width = 40
          Height = 13
          Caption = 'Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 211
          Top = 9
          Width = 37
          Height = 13
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edtNrProcesso: TEdit
          Left = 359
          Top = 24
          Width = 84
          Height = 21
          MaxLength = 12
          TabOrder = 0
          OnChange = edtNrProcessoChange
        end
        object edUnidade: TEdit
          Left = 8
          Top = 25
          Width = 27
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 1
          OnExit = edUnidadeExit
          OnKeyDown = edUnidadeKeyDown
        end
        object cbUnidade: TDBLookupComboBox
          Left = 38
          Top = 25
          Width = 163
          Height = 21
          DropDownWidth = 200
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_UNID_NEG'
          ListField = 'NM_UNID_NEG'
          ListSource = datm_RelatorioNestle.dsUnidadeNeg
          ParentFont = False
          TabOrder = 2
          TabStop = False
          OnCloseUp = cbUnidadeCloseUp
          OnExit = cbUnidadeExit
          OnKeyDown = cbUnidadeKeyDown
        end
        object edtProduto: TEdit
          Left = 211
          Top = 25
          Width = 27
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 3
          OnExit = edtProdutoExit
          OnKeyDown = edtProdutoKeyDown
        end
        object cbProduto: TDBLookupComboBox
          Left = 241
          Top = 25
          Width = 106
          Height = 21
          DropDownWidth = 200
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_PRODUTO'
          ListField = 'NM_PRODUTO'
          ListSource = datm_RelatorioNestle.dsProduto
          ParentFont = False
          TabOrder = 4
          TabStop = False
          OnCloseUp = cbProdutoCloseUp
          OnExit = cbProdutoExit
          OnKeyDown = cbProdutoKeyDown
        end
      end
      object tbInstrucao: TTabSheet
        Caption = 'Instru'#231#227'o de Embarque'
        ImageIndex = 1
        object Label1: TLabel
          Left = 16
          Top = 8
          Width = 104
          Height = 13
          Caption = 'N'#250'mero Fornecimento'
        end
        object Label10: TLabel
          Left = 159
          Top = 8
          Width = 30
          Height = 13
          Caption = 'Status'
        end
        object Label11: TLabel
          Left = 334
          Top = 8
          Width = 66
          Height = 13
          Caption = 'Data Inclus'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 318
          Top = 32
          Width = 14
          Height = 13
          Caption = 'De'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 411
          Top = 32
          Width = 16
          Height = 13
          Caption = 'At'#233
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 531
          Top = 33
          Width = 61
          Height = 13
          Caption = 'Qt. Registros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edtNumeroFornecimento: TEdit
          Left = 16
          Top = 24
          Width = 121
          Height = 21
          MaxLength = 20
          TabOrder = 0
        end
        object btnPesquisar: TBitBtn
          Left = 596
          Top = 1
          Width = 41
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnPesquisarClick
          Glyph.Data = {
            52020000424D5202000000000000520100002800000010000000100000000100
            08000000000000010000340B0000340B00004700000047000000405058009860
            580031486000EAAB6A00A17373008F7B7300B67B7300A1847300AB847300F4AB
            7300AB7B7B00B67B7B00C07B7B00B6847B00C0987B00F4C07B00B68F8400C08F
            8400CA8F8400B6988400C0988400CA988400F4C08400F4CA840031608F00C098
            8F00CAA18F00D4AB8F00F4CA8F00D4AB9800D4B69800E0B69800FFD49800FFE0
            9800C0A1A100F4D4A100F4E0A100FFE0A100FFEAA100CAABAB00D4CAAB00E0D4
            AB00FFE0AB005084B600EAD4B600FFEAB600FFF4B600F4E0C000FFF4C000F4EA
            CA00F4F4CA00FFF4CA00FFFFCA00116AD400F4F4D400FFFFD4000B6AE0000B73
            E000FFFFE0000B73EA001173EA00A1CAEA00F4F4EA00FFF4EA00FFFFEA00FFFF
            F400FF00FF0031A1FF0038A1FF0038ABFF00FFFFFF0042020A42424242424242
            4242424242422B39180B42424242424242424242424243443C180B4242424242
            42424242424242444438180B424242424242424242424242444339180A424242
            424242424242424242444335004201101A114242424242424242453D05072F34
            3434291942424242424242221A2D34343437403E0442424242424206231C3034
            37404146284242424242421B210F30373A414140310D42424242421F20032434
            373A3A37321342424242421D25030F2D37373737311042424242420D2D2D1C16
            2430333429424242424242421E463F0F0316252E08424242424242424227312D
            21252314424242424242424242420E141B1B42424242}
        end
        object cbStatus: TComboBox
          Left = 157
          Top = 24
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 2
          Items.Strings = (
            'Nova'
            'Embarque Montado'
            'Integrada')
        end
        object DataInclusaoInicial: TMaskEdit
          Left = 338
          Top = 24
          Width = 67
          Height = 21
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 3
          Text = '  /  /    '
        end
        object DataInclusaoFinal: TMaskEdit
          Left = 434
          Top = 24
          Width = 69
          Height = 21
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 4
          Text = '  /  /    '
        end
        object edtQtRegistros: TEdit
          Left = 596
          Top = 27
          Width = 42
          Height = 21
          TabOrder = 5
          Text = '50'
        end
      end
    end
  end
end
