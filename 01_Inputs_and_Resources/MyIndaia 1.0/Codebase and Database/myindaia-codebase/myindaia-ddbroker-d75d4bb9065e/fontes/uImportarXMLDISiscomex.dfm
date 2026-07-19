object frmImportarXMLDISiscomex: TfrmImportarXMLDISiscomex
  Left = 380
  Top = 214
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = ' Importar XML DI'
  ClientHeight = 416
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 416
    Align = alClient
    TabOrder = 0
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 643
      Height = 100
      Align = alTop
      TabOrder = 0
      DesignSize = (
        643
        100)
      object Label2: TLabel
        Left = 10
        Top = 6
        Width = 26
        Height = 13
        Caption = 'XML'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnSelecionarArquivo: TSpeedButton
        Left = 352
        Top = 24
        Width = 23
        Height = 21
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF05740BFF00FFFF00FFFF00FFFEFEFEFEFEFEFEFEFEFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFF00FFFF00FF2BACD8
          35B3DC23A9D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0574
          0B5BE78C05740BFF00FFFF00FF808080808080808080FEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FF42B4DC
          AFF6FC86EFFA49C2E449C2E449C2E434B4DD24AAD7FF00FFFF00FF05740B50D7
          7A45D26C31C14F05740BFF00FF808080FEFEFEFF00FF80808080808080808080
          8080808080FEFEFEFEFEFE808080FEFEFEFF00FFFF00FF808080FF00FF26A8D6
          A6E9F59EFFFF97FCFF99FBFF95F7FF8DF2FE83EAFA49C2E449C2E43AB8DF168C
          2330C14C169824FF00FFFF00FF808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF808080808080808080808080FEFEFE808080FEFEFEFF00FF31B1DB
          23A9D7ABFEFF90F8FF91F6FF90F5FF8FF5FF8FF4FF90F4FF95F6FF75DDF50C81
          161AAF2C088310FF00FFFF00FF808080808080FEFEFEFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFE808080FF00FFFF00FF47BEE1
          23A9D7AAF0FA91FAFF91F6FF90F5FF8EF4FF8DF2FE8BF1FE8CF1FF77DFF60C90
          170EA01AFF00FFFF00FFFF00FF808080808080FEFEFEFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF808080808080FEFEFEFF00FFFF00FF4CC0E2
          7BE5F423A9D79EFEFF8DF7FF8EF6FF8CF4FF8DF2FE8BF1FE8CF1FF0A89120EA1
          1A08810FFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
          00FFFEFEFEFEFEFEFEFEFE808080FEFEFE808080FEFEFEFF00FFFF00FF4BBFE1
          93F9FD23A9D7A8E9F5A8F0FAA4F1FBA1F7FF05710A09790F0B89160A8C13067A
          0D58CDEAFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFEFEFEFEFEFEFE
          FEFE808080808080808080808080808080808080FF00FFFEFEFEFF00FF4CC0E2
          9DFEFFB7818323A9D723A9D723A9D723A9D7AFF2FB6BD7ED88F2FF6CD9F381E9
          FB80EAFA1FA8D6FF00FFFF00FF808080FEFEFE80808080808080808080808080
          8080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFF00FF4CC0E2
          9AFCFFBA8E85FEFEFEFEFEFEF7E6D0F7E6D023A9D79FE3F4A7EDFA94E1F4A2EC
          FAADF6FF47BCE0FF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
          00FF808080FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE808080FEFEFEFF00FF50C2E3
          9BFDFFCB9A82FEFEFEFEFEFEFEFEFEF7E6D0F7E6D029A9D423A9D723A9D723A9
          D74BB8DE34AFDAFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
          00FFFF00FF808080808080808080808080808080808080FF00FFFF00FF52BFE1
          A4FFFFDCA887FEFEFEFEFEFEFEFEFEFEFEFEFAEBDBAED3D5F2E6CAB78183FF00
          FFFF00FFFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
          00FFFF00FFFF00FFFEFEFE808080FEFEFEFF00FFFF00FFFF00FFFF00FF25A8D6
          23A9D7DCA887FEFEFEFEFEFEFEFEFEFEFEFEFBF2E79E8891B78183B78183FF00
          FFFF00FFFF00FFFF00FFFF00FF808080808080808080FEFEFEFF00FFFF00FFFF
          00FFFF00FF808080808080808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFE3B18EFEFEFEFEFEFEFEFEFEFEFEFEF8F3EFB78183DFA262DA9062FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFF00FFFF00FFFF
          00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFEDBD92FEFEFEFEFEFEFEFEFEFEFEFEF5F3F5B78183DA9C7DFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFE808080808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFEDBD92DCA887DCA887DCA887DCA887DCA887B78183FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80808080808080808080808080
          8080808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object btnCarregar: TSpeedButton
        Left = 6
        Top = 57
        Width = 114
        Height = 27
        Caption = 'Carregar XML'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCarregarClick
      end
      object lblNrProcesso: TLabel
        Left = 459
        Top = 13
        Width = 154
        Height = 24
        Anchors = [akTop, akRight]
        Caption = 'NR_PROCESSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblGrupo: TLabel
        Left = 550
        Top = 40
        Width = 60
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'CD_GRUPO'
      end
      object lblCliente: TLabel
        Left = 459
        Top = 40
        Width = 66
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'CD_CLIENTE'
      end
      object Label5: TLabel
        Left = 256
        Top = 83
        Width = 313
        Height = 13
        Caption = 'Aten'#231#227'o!  A importa'#231#227'o apaga todos os dados da DI (caso exista).'
      end
      object lblceMercante: TLabel
        Left = 486
        Top = 57
        Width = 139
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'CEMERCANTE'
      end
      object Label6: TLabel
        Left = 459
        Top = 57
        Width = 20
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'CE: '
      end
      object edtCaminho: TEdit
        Left = 4
        Top = 25
        Width = 341
        Height = 21
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 377
      Width = 643
      Height = 38
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        643
        38)
      object btnImportarItens: TSpeedButton
        Left = 4
        Top = 4
        Width = 107
        Height = 30
        Caption = 'Importar DI'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btnImportarItensClick
      end
      object btnSair: TSpeedButton
        Left = 607
        Top = 4
        Width = 30
        Height = 30
        Hint = 'Sair'
        Anchors = [akTop, akRight]
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSairClick
      end
      object lblInfo: TLabel
        Left = 403
        Top = 13
        Width = 28
        Height = 13
        Caption = 'lblInfo'
      end
      object ProgressBar1: TProgressBar
        Left = 121
        Top = 10
        Width = 272
        Height = 17
        TabOrder = 0
      end
    end
    object pgPrincipal: TPageControl
      Left = 1
      Top = 101
      Width = 643
      Height = 276
      ActivePage = tbsDebug
      Align = alClient
      TabOrder = 2
      object tbsPrincipal: TTabSheet
        Caption = 'Resumo Importa'#231#227'o'
        object rMemo: TRichEdit
          Left = 0
          Top = 0
          Width = 635
          Height = 248
          Align = alClient
          TabOrder = 0
          OnChange = rMemoChange
        end
      end
      object tbsDebug: TTabSheet
        Caption = 'Dados XML'
        ImageIndex = 1
        object pgDados: TPageControl
          Left = 0
          Top = 0
          Width = 635
          Height = 248
          ActivePage = tbsDI
          Align = alClient
          TabOrder = 0
          object tbsDI: TTabSheet
            Caption = 'DI'
            object dbgridXMLDI: TDBGrid
              Left = 0
              Top = 24
              Width = 627
              Height = 196
              Align = alClient
              DataSource = dsDiXml_
              FixedColor = clBlack
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'id'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 41
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'tipoDeclaracaoCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'tipoDeclaracaoNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'modalidadeDespachoCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'modalidadeDespachoNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'numeroDI'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dataDesembaraco'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dataRegistro'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'operacaoFundap'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'urfDespachoCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'urfDespachoNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'localDescargaTotalDolares'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'localDescargaTotalReais'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'localEmbarqueTotalDolares'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'localEmbarqueTotalReais'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'viaTransporteCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'viaTransporteMultimodal'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'viaTransporteNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'viaTransporteNomeTransportador'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'viaTransportePaisTranspCod'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'viaTransportePaisTranspoNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'sequencialRetificacao'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'situacaoEntregaCarga'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'canalSelecaoParametrizada'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'caracterizacaoOpCodTipo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'caracterizacaoOperacaoDescTipo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cargaDataChegada'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cargaNumeroAgente'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cargaPaisProcedenciaCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cargaPaisProcedenciaNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cargaPesoBruto'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cargaPesoLiquido'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cargaUrfEntradaCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cargaUrfEntradaNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'conhecimentoCargaEmbarqueData'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'conhecimentoCargaEmbarqueLocal'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'conhecimentoCargaId'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'conhecimentoCargaIdMaster'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'conhecimentoCargaTipoCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'conhecimentoCargaTipoNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'conhecimentoCargaUtilizacao'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'conhecimentoCargaUtilizacaoNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valorTotalMultaARecolherAjust'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'seguroMoedaNegociadaCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'seguroMoedaNegociadaNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'seguroTotalDolares'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'seguroTotalMoedaNegociada'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'seguroTotalReais'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'freteCollect'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'freteEmTerritorioNacional'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'freteMoedaNegociadaCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'freteMoedaNegociadaNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fretePrepaid'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'freteTotalDolares'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'freteTotalMoeda'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'freteTotalReais'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'importadorCodigoTipo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'importadorCpfRepresentanteLegal'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'importadorEnderecoBairro'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'importadorEnderecoCep'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'importadorEnderecoLogradouro'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'importadorEnderecoMunicipio'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'importadorEnderecoNumero'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'importadorEnderecoUf'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'importadorNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'importadorNomeRepresLegal'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'importadorNumero'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'armazenamentoRecintoAduaCod'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'armazenamentoRecintoAduaNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'armazenamentoSetor'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'armazem_nomeArmazem'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'icms_agenciaIcms'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'icms_bancoIcms'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'icms_codigoTipoRecolhimentoIcms'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'icms_cpfResponsavelRegistro'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'icms_dataPagamentoIcms'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'icms_dataRegistro'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'icms_horaRegistro'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'icms_nomeTipoRecolhimentoIcms'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'icms_numeroSequencialIcms'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'icms_ufIcms'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'icms_valorTotalIcms'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'informacaoComplementar'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'totalAdicoes'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end>
            end
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 627
              Height = 24
              Align = alTop
              TabOrder = 1
              object lblTotalPlan: TLabel
                Left = 9
                Top = 6
                Width = 33
                Height = 13
                Caption = 'Total : '
              end
            end
          end
          object tbsAdicoes: TTabSheet
            Caption = 'DI - Adi'#231#245'es'
            ImageIndex = 2
            object dbgridXMLAdicoes: TDBGrid
              Left = 0
              Top = 24
              Width = 561
              Height = 203
              Align = alClient
              DataSource = dsAdicoesXml_
              FixedColor = clBlack
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'id'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'numeroAdicao'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'numeroDI'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'numeroLI'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'sequencialRetificacao'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosMercadoriaAplicacao'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosMercadoriaCodigoNaladiNCCA'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosMercadoriaCodigoNaladiSH'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosMercadoriaCodigoNcm'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosMercadoriaCondicao'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosMercadoriaMedidaEstatQt'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosMercadoriaMedidaEstatUnid'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosMercadoriaNomeNcm'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosMercadoriaPesoLiquido'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'paisAquisicaoMercadoriaCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'paisAquisicaoMercadoriaNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'paisOrigemMercadoriaCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'paisOrigemMercadoriaNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fornecedorCidade'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fornecedorComplemento'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fornecedorEstado'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fornecedorLogradouro'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fornecedorNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fornecedorNumero'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'codigoRelacaoCompradorVendedor'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'relacaoCompradorVendedor'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'codigoVinculoCompradorVendedor'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'vinculoCompradorVendedor'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosCambiaisCoberturaCambCod'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosCambiaisCoberturaCambialNm'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosCambiaisInstitFinancCod'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosCambiaisInstitFinancNm'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosCambiaisMotivoSemCoberCd'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosCambiaisMotivoSemCoberNm'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosCambiaisValorRealCambio'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosCargaPaisProcedenciaCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosCargaUrfEntradaCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dadosCargaViaTransporteCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'condicaoVendaLocal'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'condicaoVendaMetodoValoracCod'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'condicaoVendaMetodoValoracaoNm'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'condicaoVendaMoedaCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'condicaoVendaMoedaNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'condicaoVendaValorMoeda'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'condicaoVendaValorReais'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cideValorAliquotaEspecifica'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cideValorDevido'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cideValorRecolher'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dcrIdentificacao'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dcrCoeficienteReducao'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dcrValorDevido'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dcrValorDolar'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dcrValorReal'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dcrValorRecolher'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valorMultaARecolher'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valorMultaARecolherAjustado'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valorReaisFreteInternacional'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valorReaisSeguroInternacional'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valorTotalCondicaoVenda'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'freteMoedaNegociadaCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'freteValorMoedaNegociada'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'freteValorReais'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'seguroMoedaNegociadaCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'seguroValorMoedaNegociada'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'seguroValorReais'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'iiAcordoTarifarioTipoCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'iiAliquotaAcordo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'iiAliquotaAdValorem'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'iiAliquotaPercentualReducao'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'iiAliquotaReduzida'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'iiAliquotaValorCalculado'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'iiAliquotaValorDevido'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'iiAliquotaValorRecolher'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'iiAliquotaValorReduzido'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'iiBaseCalculo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'iiFundamentoLegalCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'iiMotivoAdmissaoTempCod'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'iiRegimeTributacaoCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'iiRegimeTributacaoNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ipiAliquotaAdValorem'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ipiAliquotaEspecificaCapacRecip'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ipiAliquotaEspecificaQtUnidMed'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ipiAliquotaEspecificaTpRecipCod'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ipiAliquotaEspecificaVlUnidMed'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ipiAliquotaNotaComplementarTIPI'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ipiAliquotaReduzida'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ipiAliquotaValorDevido'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ipiAliquotaValorRecolher'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ipiRegimeTributacaoCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ipiRegimeTributacaoNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cofinsAliquotaAdValorem'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cofinsAliquotaEspecificaQtUni'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cofinsAliquotaEspecificaValor'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cofinsAliquotaReduzida'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cofinsAliquotaValorDevido'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cofinsAliquotaValorRecolher'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pisCofinsBaseCalcAliquotaICMS'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pisCofinsBaseCalcFundLegalCod'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pisCofinsBaseCalcPercReducao'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pisCofinsBaseCalculoValor'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pisCofinsFundLegalReducaoCod'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pisCofinsRegimeTributacaoCodigo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pisCofinsRegimeTributacaoNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pisPasepAliquotaAdValorem'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pisPasepAliquotaEspecifQtUnid'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pisPasepAliquotaEspecificaValor'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pisPasepAliquotaReduzida'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pisPasepAliquotaValorDevido'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pisPasepAliquotaValorRecolher'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'condicaoVendaIncoterm'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fabricanteCidade'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fabricanteComplemento'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fabricanteEstado'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fabricanteLogradouro'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fabricanteNome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'fabricanteNumero'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'destaqueNcm_numeroDestaque'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end>
            end
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 561
              Height = 24
              Align = alTop
              TabOrder = 1
              object lblTotalItens: TLabel
                Left = 9
                Top = 6
                Width = 33
                Height = 13
                Caption = 'Total : '
              end
            end
          end
          object tbsMercadoria: TTabSheet
            Caption = 'DI - Adi'#231#245'es - Mercadorias'
            ImageIndex = 1
            object dbgridXMLMercadorias: TDBGrid
              Left = 0
              Top = 24
              Width = 561
              Height = 203
              Align = alClient
              DataSource = dsMercadoriasXml_
              FixedColor = clBlack
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'id'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'mercadoria_descricaoMercadoria'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 282
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'mercadoria_numeroSequencialItem'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'mercadoria_quantidade'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'mercadoria_unidadeMedida'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'mercadoria_valorUnitario'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'numeroAdicao'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'numeroDI'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end>
            end
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 561
              Height = 24
              Align = alTop
              TabOrder = 1
              object lblTotalMercadorias: TLabel
                Left = 9
                Top = 6
                Width = 33
                Height = 13
                Caption = 'Total : '
              end
            end
          end
          object tbsPagamentos: TTabSheet
            Caption = 'Pagamentos'
            ImageIndex = 4
            object dbgridXMLPagamentos: TDBGrid
              Left = 0
              Top = 24
              Width = 561
              Height = 203
              Align = alClient
              DataSource = dsPagamentosXml_
              FixedColor = clBlack
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'id'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pgmto_agenciaPagamento'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pgmto_bancoPagamento'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pgmto_codigoReceita'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pgmto_codigoTipoPagamento'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pgmto_contaPagamento'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pgmto_dataPagamento'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pgmto_nomeTipoPagamento'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pgmto_numeroRetificacao'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pgmto_valorJurosEncargos'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pgmto_valorMulta'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'pgmto_valorReceita'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end>
            end
            object Panel2: TPanel
              Left = 0
              Top = 0
              Width = 561
              Height = 24
              Align = alTop
              TabOrder = 1
              object Label1: TLabel
                Left = 9
                Top = 6
                Width = 33
                Height = 13
                Caption = 'Total : '
              end
            end
          end
          object tbsDocumentos: TTabSheet
            Caption = 'Documentos'
            ImageIndex = 5
            object dbgridXMLDocumentos: TDBGrid
              Left = 0
              Top = 24
              Width = 561
              Height = 203
              Align = alClient
              DataSource = dsDocumentosXml_
              FixedColor = clBlack
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'id'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'documento_codigoTipo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'documento_nome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'documentos_numero'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end>
            end
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 561
              Height = 24
              Align = alTop
              TabOrder = 1
              object Label3: TLabel
                Left = 9
                Top = 6
                Width = 33
                Height = 13
                Caption = 'Total : '
              end
            end
          end
          object tbsEmbalagens: TTabSheet
            Caption = 'Embalagens'
            ImageIndex = 6
            object dbgridXMLEmbalagens: TDBGrid
              Left = 0
              Top = 24
              Width = 561
              Height = 203
              Align = alClient
              DataSource = dsEmbalagensXml_
              FixedColor = clBlack
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'id'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'embalagem_codigoTipoEmbalagem'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'embalagem_nomeEmbalagem'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'embalagem_quantidadeVolume'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end>
            end
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 561
              Height = 24
              Align = alTop
              TabOrder = 1
              object Label4: TLabel
                Left = 9
                Top = 6
                Width = 33
                Height = 13
                Caption = 'Total : '
              end
            end
          end
        end
      end
    end
  end
  object cdsDIXml_: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 49
    Top = 253
    object cdsDIXml_id: TIntegerField
      FieldName = 'id'
    end
    object cdsDIXml_tipoDeclaracaoCodigo: TStringField
      FieldName = 'tipoDeclaracaoCodigo'
      Size = 2
    end
    object cdsDIXml_tipoDeclaracaoNome: TStringField
      FieldName = 'tipoDeclaracaoNome'
      Size = 15
    end
    object cdsDIXml_modalidadeDespachoCodigo: TStringField
      FieldName = 'modalidadeDespachoCodigo'
      Size = 2
    end
    object cdsDIXml_modalidadeDespachoNome: TStringField
      FieldName = 'modalidadeDespachoNome'
      Size = 15
    end
    object cdsDIXml_numeroDI: TStringField
      FieldName = 'numeroDI'
      Size = 10
    end
    object cdsDIXml_dataDesembaraco: TStringField
      FieldName = 'dataDesembaraco'
      Size = 8
    end
    object cdsDIXml_dataRegistro: TStringField
      FieldName = 'dataRegistro'
      Size = 8
    end
    object cdsDIXml_operacaoFundap: TStringField
      FieldName = 'operacaoFundap'
      Size = 1
    end
    object cdsDIXml_urfDespachoCodigo: TStringField
      FieldName = 'urfDespachoCodigo'
      Size = 8
    end
    object cdsDIXml_urfDespachoNome: TStringField
      FieldName = 'urfDespachoNome'
      Size = 100
    end
    object cdsDIXml_localDescargaTotalDolares: TStringField
      DisplayWidth = 15
      FieldName = 'localDescargaTotalDolares'
      Size = 15
    end
    object cdsDIXml_localDescargaTotalReais: TStringField
      FieldName = 'localDescargaTotalReais'
      Size = 15
    end
    object cdsDIXml_localEmbarqueTotalDolares: TStringField
      FieldName = 'localEmbarqueTotalDolares'
      Size = 15
    end
    object cdsDIXml_localEmbarqueTotalReais: TStringField
      FieldName = 'localEmbarqueTotalReais'
      Size = 15
    end
    object cdsDIXml_viaTransporteCodigo: TStringField
      FieldName = 'viaTransporteCodigo'
      Size = 2
    end
    object cdsDIXml_viaTransporteMultimodal: TStringField
      FieldName = 'viaTransporteMultimodal'
      Size = 1
    end
    object cdsDIXml_viaTransporteNome: TStringField
      FieldName = 'viaTransporteNome'
      Size = 15
    end
    object cdsDIXml_viaTransporteNomeTransportador: TStringField
      FieldName = 'viaTransporteNomeTransportador'
      Size = 100
    end
    object cdsDIXml_viaTransportePaisTranspCod: TStringField
      FieldName = 'viaTransportePaisTranspCod'
      Size = 3
    end
    object cdsDIXml_viaTransportePaisTranspoNome: TStringField
      FieldName = 'viaTransportePaisTranspoNome'
      Size = 60
    end
    object cdsDIXml_sequencialRetificacao: TStringField
      FieldName = 'sequencialRetificacao'
      Size = 2
    end
    object cdsDIXml_situacaoEntregaCarga: TStringField
      FieldName = 'situacaoEntregaCarga'
      Size = 200
    end
    object cdsDIXml_canalSelecaoParametrizada: TStringField
      FieldName = 'canalSelecaoParametrizada'
      Size = 3
    end
    object cdsDIXml_caracterizacaoOpCodTipo: TStringField
      FieldName = 'caracterizacaoOpCodTipo'
      Size = 1
    end
    object cdsDIXml_caracterizacaoOperacaoDescTipo: TStringField
      FieldName = 'caracterizacaoOperacaoDescTipo'
      Size = 60
    end
    object cdsDIXml_cargaDataChegada: TStringField
      FieldName = 'cargaDataChegada'
      Size = 8
    end
    object cdsDIXml_cargaNumeroAgente: TStringField
      FieldName = 'cargaNumeroAgente'
      Size = 14
    end
    object cdsDIXml_cargaPaisProcedenciaCodigo: TStringField
      FieldName = 'cargaPaisProcedenciaCodigo'
      Size = 3
    end
    object cdsDIXml_cargaPaisProcedenciaNome: TStringField
      FieldName = 'cargaPaisProcedenciaNome'
      Size = 60
    end
    object cdsDIXml_cargaPesoBruto: TStringField
      FieldName = 'cargaPesoBruto'
      Size = 15
    end
    object cdsDIXml_cargaPesoLiquido: TStringField
      FieldName = 'cargaPesoLiquido'
      Size = 15
    end
    object cdsDIXml_cargaUrfEntradaCodigo: TStringField
      FieldName = 'cargaUrfEntradaCodigo'
      Size = 7
    end
    object cdsDIXml_cargaUrfEntradaNome: TStringField
      FieldName = 'cargaUrfEntradaNome'
      Size = 60
    end
    object cdsDIXml_conhecimentoCargaEmbarqueData: TStringField
      FieldName = 'conhecimentoCargaEmbarqueData'
      Size = 8
    end
    object cdsDIXml_conhecimentoCargaEmbarqueLocal: TStringField
      FieldName = 'conhecimentoCargaEmbarqueLocal'
      Size = 60
    end
    object cdsDIXml_conhecimentoCargaId: TStringField
      FieldName = 'conhecimentoCargaId'
      Size = 5
    end
    object cdsDIXml_conhecimentoCargaIdMaster: TStringField
      FieldName = 'conhecimentoCargaIdMaster'
    end
    object cdsDIXml_conhecimentoCargaTipoCodigo: TStringField
      FieldName = 'conhecimentoCargaTipoCodigo'
      Size = 2
    end
    object cdsDIXml_conhecimentoCargaTipoNome: TStringField
      FieldName = 'conhecimentoCargaTipoNome'
      Size = 60
    end
    object cdsDIXml_conhecimentoCargaUtilizacao: TStringField
      FieldName = 'conhecimentoCargaUtilizacao'
      Size = 1
    end
    object cdsDIXml_conhecimentoCargaUtilizacaoNome: TStringField
      FieldName = 'conhecimentoCargaUtilizacaoNome'
      Size = 15
    end
    object cdsDIXml_valorTotalMultaARecolherAjust: TStringField
      FieldName = 'valorTotalMultaARecolherAjust'
      Size = 15
    end
    object cdsDIXml_seguroMoedaNegociadaCodigo: TStringField
      FieldName = 'seguroMoedaNegociadaCodigo'
      Size = 3
    end
    object cdsDIXml_seguroMoedaNegociadaNome: TStringField
      FieldName = 'seguroMoedaNegociadaNome'
      Size = 30
    end
    object cdsDIXml_seguroTotalDolares: TStringField
      FieldName = 'seguroTotalDolares'
      Size = 15
    end
    object cdsDIXml_seguroTotalMoedaNegociada: TStringField
      FieldName = 'seguroTotalMoedaNegociada'
      Size = 15
    end
    object cdsDIXml_seguroTotalReais: TStringField
      FieldName = 'seguroTotalReais'
      Size = 15
    end
    object cdsDIXml_freteCollect: TStringField
      FieldName = 'freteCollect'
      Size = 15
    end
    object cdsDIXml_freteEmTerritorioNacional: TStringField
      FieldName = 'freteEmTerritorioNacional'
      Size = 15
    end
    object cdsDIXml_freteMoedaNegociadaCodigo: TStringField
      FieldName = 'freteMoedaNegociadaCodigo'
      Size = 3
    end
    object cdsDIXml_freteMoedaNegociadaNome: TStringField
      FieldName = 'freteMoedaNegociadaNome'
      Size = 30
    end
    object cdsDIXml_fretePrepaid: TStringField
      FieldName = 'fretePrepaid'
      Size = 15
    end
    object cdsDIXml_freteTotalDolares: TStringField
      FieldName = 'freteTotalDolares'
      Size = 15
    end
    object cdsDIXml_freteTotalMoeda: TStringField
      FieldName = 'freteTotalMoeda'
      Size = 15
    end
    object cdsDIXml_freteTotalReais: TStringField
      FieldName = 'freteTotalReais'
      Size = 15
    end
    object cdsDIXml_importadorCodigoTipo: TStringField
      FieldName = 'importadorCodigoTipo'
      Size = 1
    end
    object cdsDIXml_importadorCpfRepresentanteLegal: TStringField
      FieldName = 'importadorCpfRepresentanteLegal'
      Size = 11
    end
    object cdsDIXml_importadorEnderecoBairro: TStringField
      DisplayWidth = 60
      FieldName = 'importadorEnderecoBairro'
      Size = 60
    end
    object cdsDIXml_importadorEnderecoCep: TStringField
      FieldName = 'importadorEnderecoCep'
      Size = 8
    end
    object cdsDIXml_importadorEnderecoLogradouro: TStringField
      FieldName = 'importadorEnderecoLogradouro'
      Size = 60
    end
    object cdsDIXml_importadorEnderecoMunicipio: TStringField
      FieldName = 'importadorEnderecoMunicipio'
      Size = 60
    end
    object cdsDIXml_importadorEnderecoNumero: TStringField
      FieldName = 'importadorEnderecoNumero'
      Size = 5
    end
    object cdsDIXml_importadorEnderecoUf: TStringField
      FieldName = 'importadorEnderecoUf'
      Size = 2
    end
    object cdsDIXml_importadorNome: TStringField
      FieldName = 'importadorNome'
      Size = 60
    end
    object cdsDIXml_importadorNomeRepresLegal: TStringField
      FieldName = 'importadorNomeRepresLegal'
      Size = 60
    end
    object cdsDIXml_importadorNumero: TStringField
      FieldName = 'importadorNumero'
      Size = 14
    end
    object cdsDIXml_armazenamentoRecintoAduaCod: TStringField
      FieldName = 'armazenamentoRecintoAduaCod'
      Size = 7
    end
    object cdsDIXml_armazenamentoRecintoAduaNome: TStringField
      FieldName = 'armazenamentoRecintoAduaNome'
      Size = 100
    end
    object cdsDIXml_armazenamentoSetor: TStringField
      FieldName = 'armazenamentoSetor'
      Size = 15
    end
    object cdsDIXml_armazem_nomeArmazem: TStringField
      FieldName = 'armazem_nomeArmazem'
      Size = 60
    end
    object cdsDIXml_icms_agenciaIcms: TStringField
      FieldName = 'icms_agenciaIcms'
      Size = 5
    end
    object cdsDIXml_icms_bancoIcms: TStringField
      FieldName = 'icms_bancoIcms'
      Size = 3
    end
    object cdsDIXml_icms_codigoTipoRecolhimentoIcms: TStringField
      FieldName = 'icms_codigoTipoRecolhimentoIcms'
      Size = 1
    end
    object cdsDIXml_icms_cpfResponsavelRegistro: TStringField
      FieldName = 'icms_cpfResponsavelRegistro'
      Size = 11
    end
    object cdsDIXml_icms_dataPagamentoIcms: TStringField
      FieldName = 'icms_dataPagamentoIcms'
      Size = 8
    end
    object cdsDIXml_icms_dataRegistro: TStringField
      FieldName = 'icms_dataRegistro'
      Size = 8
    end
    object cdsDIXml_icms_horaRegistro: TStringField
      FieldName = 'icms_horaRegistro'
      Size = 6
    end
    object cdsDIXml_icms_nomeTipoRecolhimentoIcms: TStringField
      FieldName = 'icms_nomeTipoRecolhimentoIcms'
      Size = 100
    end
    object cdsDIXml_icms_numeroSequencialIcms: TStringField
      FieldName = 'icms_numeroSequencialIcms'
      Size = 3
    end
    object cdsDIXml_icms_ufIcms: TStringField
      FieldName = 'icms_ufIcms'
      Size = 2
    end
    object cdsDIXml_icms_valorTotalIcms: TStringField
      FieldName = 'icms_valorTotalIcms'
      Size = 15
    end
    object cdsDIXml_informacaoComplementar: TStringField
      DisplayWidth = 9000
      FieldName = 'informacaoComplementar'
      Size = 9000
    end
    object cdsDIXml_totalAdicoes: TStringField
      FieldName = 'totalAdicoes'
      Size = 3
    end
    object cdsDIXml_documentoChegadaCargaCodigoTipo: TStringField
      FieldName = 'documentoChegadaCargaCodigoTipo'
      Size = 10
    end
    object cdsDIXml_documentoChegadaCargaNome: TStringField
      FieldName = 'documentoChegadaCargaNome'
      Size = 60
    end
    object cdsDIXml_documentoChegadaCargaNumero: TStringField
      FieldName = 'documentoChegadaCargaNumero'
      Size = 60
    end
  end
  object dsDiXml_: TDataSource
    DataSet = cdsDIXml_
    Left = 152
    Top = 250
  end
  object dsMercadoriasXml_: TDataSource
    DataSet = cdsMercadoriasXml_
    Left = 340
    Top = 299
  end
  object cdsAdicoesXml_: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 52
    Top = 209
    object cdsAdicoesXml_id: TIntegerField
      FieldName = 'id'
    end
    object cdsAdicoesXml_numeroAdicao: TStringField
      FieldName = 'numeroAdicao'
      Size = 3
    end
    object cdsAdicoesXml_numeroDI: TStringField
      FieldName = 'numeroDI'
      Size = 10
    end
    object cdsAdicoesXml_numeroLI: TStringField
      FieldName = 'numeroLI'
      Size = 10
    end
    object cdsAdicoesXml_sequencialRetificacao: TStringField
      FieldName = 'sequencialRetificacao'
      Size = 2
    end
    object cdsAdicoesXml_dadosMercadoriaAplicacao: TStringField
      FieldName = 'dadosMercadoriaAplicacao'
    end
    object cdsAdicoesXml_dadosMercadoriaCodigoNaladiNCCA: TStringField
      FieldName = 'dadosMercadoriaCodigoNaladiNCCA'
      Size = 7
    end
    object cdsAdicoesXml_dadosMercadoriaCodigoNaladiSH: TStringField
      FieldName = 'dadosMercadoriaCodigoNaladiSH'
      Size = 8
    end
    object cdsAdicoesXml_dadosMercadoriaCodigoNcm: TStringField
      FieldName = 'dadosMercadoriaCodigoNcm'
      Size = 8
    end
    object cdsAdicoesXml_dadosMercadoriaCondicao: TStringField
      FieldName = 'dadosMercadoriaCondicao'
    end
    object cdsAdicoesXml_dadosMercadoriaMedidaEstatQt: TStringField
      FieldName = 'dadosMercadoriaMedidaEstatQt'
      Size = 14
    end
    object cdsAdicoesXml_dadosMercadoriaMedidaEstatUnid: TStringField
      FieldName = 'dadosMercadoriaMedidaEstatUnid'
    end
    object cdsAdicoesXml_dadosMercadoriaNomeNcm: TStringField
      FieldName = 'dadosMercadoriaNomeNcm'
      Size = 60
    end
    object cdsAdicoesXml_dadosMercadoriaPesoLiquido: TStringField
      FieldName = 'dadosMercadoriaPesoLiquido'
      Size = 15
    end
    object cdsAdicoesXml_paisAquisicaoMercadoriaCodigo: TStringField
      FieldName = 'paisAquisicaoMercadoriaCodigo'
      Size = 3
    end
    object cdsAdicoesXml_paisAquisicaoMercadoriaNome: TStringField
      FieldName = 'paisAquisicaoMercadoriaNome'
      Size = 60
    end
    object cdsAdicoesXml_paisOrigemMercadoriaCodigo: TStringField
      FieldName = 'paisOrigemMercadoriaCodigo'
      Size = 3
    end
    object cdsAdicoesXml_paisOrigemMercadoriaNome: TStringField
      FieldName = 'paisOrigemMercadoriaNome'
      Size = 60
    end
    object cdsAdicoesXml_fornecedorCidade: TStringField
      FieldName = 'fornecedorCidade'
      Size = 80
    end
    object cdsAdicoesXml_fornecedorComplemento: TStringField
      FieldName = 'fornecedorComplemento'
      Size = 80
    end
    object cdsAdicoesXml_fornecedorEstado: TStringField
      FieldName = 'fornecedorEstado'
      Size = 60
    end
    object cdsAdicoesXml_fornecedorLogradouro: TStringField
      FieldName = 'fornecedorLogradouro'
      Size = 80
    end
    object cdsAdicoesXml_fornecedorNome: TStringField
      FieldName = 'fornecedorNome'
      Size = 80
    end
    object cdsAdicoesXml_fornecedorNumero: TStringField
      FieldName = 'fornecedorNumero'
      Size = 10
    end
    object cdsAdicoesXml_codigoRelacaoCompradorVendedor: TStringField
      FieldName = 'codigoRelacaoCompradorVendedor'
      Size = 1
    end
    object cdsAdicoesXml_relacaoCompradorVendedor: TStringField
      FieldName = 'relacaoCompradorVendedor'
      Size = 100
    end
    object cdsAdicoesXml_codigoVinculoCompradorVendedor: TStringField
      FieldName = 'codigoVinculoCompradorVendedor'
      Size = 1
    end
    object cdsAdicoesXml_vinculoCompradorVendedor: TStringField
      FieldName = 'vinculoCompradorVendedor'
      Size = 100
    end
    object cdsAdicoesXml_dadosCambiaisCoberturaCambCod: TStringField
      FieldName = 'dadosCambiaisCoberturaCambCod'
      Size = 1
    end
    object cdsAdicoesXml_dadosCambiaisCoberturaCambialNm: TStringField
      FieldName = 'dadosCambiaisCoberturaCambialNm'
      Size = 100
    end
    object cdsAdicoesXml_dadosCambiaisInstitFinancCod: TStringField
      FieldName = 'dadosCambiaisInstitFinancCod'
      Size = 2
    end
    object cdsAdicoesXml_dadosCambiaisInstitFinancNm: TStringField
      FieldName = 'dadosCambiaisInstitFinancNm'
      Size = 60
    end
    object cdsAdicoesXml_dadosCambiaisMotivoSemCoberCd: TStringField
      FieldName = 'dadosCambiaisMotivoSemCoberCd'
      Size = 2
    end
    object cdsAdicoesXml_dadosCambiaisMotivoSemCoberNm: TStringField
      FieldName = 'dadosCambiaisMotivoSemCoberNm'
      Size = 100
    end
    object cdsAdicoesXml_dadosCambiaisValorRealCambio: TStringField
      FieldName = 'dadosCambiaisValorRealCambio'
      Size = 15
    end
    object cdsAdicoesXml_dadosCargaPaisProcedenciaCodigo: TStringField
      FieldName = 'dadosCargaPaisProcedenciaCodigo'
      Size = 3
    end
    object cdsAdicoesXml_dadosCargaUrfEntradaCodigo: TStringField
      FieldName = 'dadosCargaUrfEntradaCodigo'
      Size = 48
    end
    object cdsAdicoesXml_dadosCargaViaTransporteCodigo: TStringField
      FieldName = 'dadosCargaViaTransporteCodigo'
      Size = 2
    end
    object cdsAdicoesXml_condicaoVendaLocal: TStringField
      FieldName = 'condicaoVendaLocal'
      Size = 60
    end
    object cdsAdicoesXml_condicaoVendaMetodoValoracCod: TStringField
      FieldName = 'condicaoVendaMetodoValoracCod'
      Size = 2
    end
    object cdsAdicoesXml_condicaoVendaMetodoValoracaoNm: TStringField
      FieldName = 'condicaoVendaMetodoValoracaoNm'
      Size = 60
    end
    object cdsAdicoesXml_condicaoVendaMoedaCodigo: TStringField
      FieldName = 'condicaoVendaMoedaCodigo'
      Size = 3
    end
    object cdsAdicoesXml_condicaoVendaMoedaNome: TStringField
      FieldName = 'condicaoVendaMoedaNome'
      Size = 60
    end
    object cdsAdicoesXml_condicaoVendaValorMoeda: TStringField
      FieldName = 'condicaoVendaValorMoeda'
      Size = 15
    end
    object cdsAdicoesXml_condicaoVendaValorReais: TStringField
      FieldName = 'condicaoVendaValorReais'
      Size = 15
    end
    object cdsAdicoesXml_cideValorAliquotaEspecifica: TStringField
      FieldName = 'cideValorAliquotaEspecifica'
      Size = 5
    end
    object cdsAdicoesXml_cideValorDevido: TStringField
      FieldName = 'cideValorDevido'
      Size = 15
    end
    object cdsAdicoesXml_cideValorRecolher: TStringField
      FieldName = 'cideValorRecolher'
      Size = 15
    end
    object cdsAdicoesXml_dcrIdentificacao: TStringField
      FieldName = 'dcrIdentificacao'
      Size = 8
    end
    object cdsAdicoesXml_dcrCoeficienteReducao: TStringField
      FieldName = 'dcrCoeficienteReducao'
      Size = 5
    end
    object cdsAdicoesXml_dcrValorDevido: TStringField
      FieldName = 'dcrValorDevido'
      Size = 15
    end
    object cdsAdicoesXml_dcrValorDolar: TStringField
      FieldName = 'dcrValorDolar'
      Size = 15
    end
    object cdsAdicoesXml_dcrValorReal: TStringField
      FieldName = 'dcrValorReal'
      Size = 15
    end
    object cdsAdicoesXml_dcrValorRecolher: TStringField
      FieldName = 'dcrValorRecolher'
      Size = 15
    end
    object cdsAdicoesXml_valorMultaARecolher: TStringField
      FieldName = 'valorMultaARecolher'
      Size = 15
    end
    object cdsAdicoesXml_valorMultaARecolherAjustado: TStringField
      FieldName = 'valorMultaARecolherAjustado'
      Size = 15
    end
    object cdsAdicoesXml_valorReaisFreteInternacional: TStringField
      FieldName = 'valorReaisFreteInternacional'
      Size = 15
    end
    object cdsAdicoesXml_valorReaisSeguroInternacional: TStringField
      FieldName = 'valorReaisSeguroInternacional'
      Size = 15
    end
    object cdsAdicoesXml_valorTotalCondicaoVenda: TStringField
      FieldName = 'valorTotalCondicaoVenda'
      Size = 15
    end
    object cdsAdicoesXml_freteMoedaNegociadaCodigo: TStringField
      FieldName = 'freteMoedaNegociadaCodigo'
      Size = 3
    end
    object cdsAdicoesXml_freteValorMoedaNegociada: TStringField
      FieldName = 'freteValorMoedaNegociada'
      Size = 15
    end
    object cdsAdicoesXml_freteValorReais: TStringField
      FieldName = 'freteValorReais'
      Size = 15
    end
    object cdsAdicoesXml_seguroMoedaNegociadaCodigo: TStringField
      FieldName = 'seguroMoedaNegociadaCodigo'
      Size = 3
    end
    object cdsAdicoesXml_seguroValorMoedaNegociada: TStringField
      FieldName = 'seguroValorMoedaNegociada'
      Size = 15
    end
    object cdsAdicoesXml_seguroValorReais: TStringField
      FieldName = 'seguroValorReais'
      Size = 15
    end
    object cdsAdicoesXml_iiAcordoTarifarioTipoCodigo: TStringField
      FieldName = 'iiAcordoTarifarioTipoCodigo'
      Size = 1
    end
    object cdsAdicoesXml_iiAliquotaAcordo: TStringField
      FieldName = 'iiAliquotaAcordo'
      Size = 5
    end
    object cdsAdicoesXml_iiAliquotaAdValorem: TStringField
      FieldName = 'iiAliquotaAdValorem'
      Size = 5
    end
    object cdsAdicoesXml_iiAliquotaPercentualReducao: TStringField
      FieldName = 'iiAliquotaPercentualReducao'
      Size = 5
    end
    object cdsAdicoesXml_iiAliquotaReduzida: TStringField
      FieldName = 'iiAliquotaReduzida'
      Size = 5
    end
    object cdsAdicoesXml_iiAliquotaValorCalculado: TStringField
      FieldName = 'iiAliquotaValorCalculado'
      Size = 15
    end
    object cdsAdicoesXml_iiAliquotaValorDevido: TStringField
      FieldName = 'iiAliquotaValorDevido'
      Size = 15
    end
    object cdsAdicoesXml_iiAliquotaValorRecolher: TStringField
      FieldName = 'iiAliquotaValorRecolher'
      Size = 15
    end
    object cdsAdicoesXml_iiAliquotaValorReduzido: TStringField
      FieldName = 'iiAliquotaValorReduzido'
      Size = 15
    end
    object cdsAdicoesXml_iiBaseCalculo: TStringField
      FieldName = 'iiBaseCalculo'
      Size = 15
    end
    object cdsAdicoesXml_iiFundamentoLegalCodigo: TStringField
      FieldName = 'iiFundamentoLegalCodigo'
      Size = 2
    end
    object cdsAdicoesXml_iiMotivoAdmissaoTempCod: TStringField
      FieldName = 'iiMotivoAdmissaoTempCod'
      Size = 2
    end
    object cdsAdicoesXml_iiRegimeTributacaoCodigo: TStringField
      FieldName = 'iiRegimeTributacaoCodigo'
      Size = 1
    end
    object cdsAdicoesXml_iiRegimeTributacaoNome: TStringField
      FieldName = 'iiRegimeTributacaoNome'
      Size = 60
    end
    object cdsAdicoesXml_ipiAliquotaAdValorem: TStringField
      FieldName = 'ipiAliquotaAdValorem'
      Size = 5
    end
    object cdsAdicoesXml_ipiAliquotaEspecificaCapacRecip: TStringField
      FieldName = 'ipiAliquotaEspecificaCapacRecip'
      Size = 5
    end
    object cdsAdicoesXml_ipiAliquotaEspecificaQtUnidMed: TStringField
      FieldName = 'ipiAliquotaEspecificaQtUnidMed'
      Size = 9
    end
    object cdsAdicoesXml_ipiAliquotaEspecificaTpRecipCod: TStringField
      FieldName = 'ipiAliquotaEspecificaTpRecipCod'
      Size = 2
    end
    object cdsAdicoesXml_ipiAliquotaEspecificaVlUnidMed: TStringField
      FieldName = 'ipiAliquotaEspecificaVlUnidMed'
      Size = 10
    end
    object cdsAdicoesXml_ipiAliquotaNotaComplementarTIPI: TStringField
      FieldName = 'ipiAliquotaNotaComplementarTIPI'
      Size = 2
    end
    object cdsAdicoesXml_ipiAliquotaReduzida: TStringField
      FieldName = 'ipiAliquotaReduzida'
      Size = 5
    end
    object cdsAdicoesXml_ipiAliquotaValorDevido: TStringField
      FieldName = 'ipiAliquotaValorDevido'
      Size = 15
    end
    object cdsAdicoesXml_ipiAliquotaValorRecolher: TStringField
      FieldName = 'ipiAliquotaValorRecolher'
      Size = 15
    end
    object cdsAdicoesXml_ipiRegimeTributacaoCodigo: TStringField
      FieldName = 'ipiRegimeTributacaoCodigo'
      Size = 1
    end
    object cdsAdicoesXml_ipiRegimeTributacaoNome: TStringField
      FieldName = 'ipiRegimeTributacaoNome'
      Size = 30
    end
    object cdsAdicoesXml_cofinsAliquotaAdValorem: TStringField
      FieldName = 'cofinsAliquotaAdValorem'
      Size = 5
    end
    object cdsAdicoesXml_cofinsAliquotaEspecificaQtUni: TStringField
      FieldName = 'cofinsAliquotaEspecificaQtUni'
      Size = 9
    end
    object cdsAdicoesXml_cofinsAliquotaEspecificaValor: TStringField
      FieldName = 'cofinsAliquotaEspecificaValor'
      Size = 10
    end
    object cdsAdicoesXml_cofinsAliquotaReduzida: TStringField
      FieldName = 'cofinsAliquotaReduzida'
      Size = 5
    end
    object cdsAdicoesXml_cofinsAliquotaValorDevido: TStringField
      FieldName = 'cofinsAliquotaValorDevido'
      Size = 15
    end
    object cdsAdicoesXml_cofinsAliquotaValorRecolher: TStringField
      FieldName = 'cofinsAliquotaValorRecolher'
      Size = 15
    end
    object cdsAdicoesXml_pisCofinsBaseCalcAliquotaICMS: TStringField
      FieldName = 'pisCofinsBaseCalcAliquotaICMS'
      Size = 5
    end
    object cdsAdicoesXml_pisCofinsBaseCalcFundLegalCod: TStringField
      FieldName = 'pisCofinsBaseCalcFundLegalCod'
      Size = 2
    end
    object cdsAdicoesXml_pisCofinsBaseCalcPercReducao: TStringField
      FieldName = 'pisCofinsBaseCalcPercReducao'
      Size = 5
    end
    object cdsAdicoesXml_pisCofinsBaseCalculoValor: TStringField
      FieldName = 'pisCofinsBaseCalculoValor'
      Size = 15
    end
    object cdsAdicoesXml_pisCofinsFundLegalReducaoCod: TStringField
      FieldName = 'pisCofinsFundLegalReducaoCod'
      Size = 2
    end
    object cdsAdicoesXml_pisCofinsRegimeTributacaoCodigo: TStringField
      FieldName = 'pisCofinsRegimeTributacaoCodigo'
      Size = 1
    end
    object cdsAdicoesXml_pisCofinsRegimeTributacaoNome: TStringField
      FieldName = 'pisCofinsRegimeTributacaoNome'
      Size = 60
    end
    object cdsAdicoesXml_pisPasepAliquotaAdValorem: TStringField
      FieldName = 'pisPasepAliquotaAdValorem'
      Size = 5
    end
    object cdsAdicoesXml_pisPasepAliquotaEspecifQtUnid: TStringField
      FieldName = 'pisPasepAliquotaEspecifQtUnid'
      Size = 9
    end
    object cdsAdicoesXml_pisPasepAliquotaEspecificaValor: TStringField
      FieldName = 'pisPasepAliquotaEspecificaValor'
      Size = 10
    end
    object cdsAdicoesXml_pisPasepAliquotaReduzida: TStringField
      FieldName = 'pisPasepAliquotaReduzida'
      Size = 5
    end
    object cdsAdicoesXml_pisPasepAliquotaValorDevido: TStringField
      FieldName = 'pisPasepAliquotaValorDevido'
      Size = 15
    end
    object cdsAdicoesXml_pisPasepAliquotaValorRecolher: TStringField
      FieldName = 'pisPasepAliquotaValorRecolher'
      Size = 15
    end
    object cdsAdicoesXml_condicaoVendaIncoterm: TStringField
      FieldName = 'condicaoVendaIncoterm'
      Size = 3
    end
    object cdsAdicoesXml_fabricanteCidade: TStringField
      FieldName = 'fabricanteCidade'
      Size = 60
    end
    object cdsAdicoesXml_fabricanteComplemento: TStringField
      FieldName = 'fabricanteComplemento'
      Size = 60
    end
    object cdsAdicoesXml_fabricanteEstado: TStringField
      FieldName = 'fabricanteEstado'
      Size = 60
    end
    object cdsAdicoesXml_fabricanteLogradouro: TStringField
      FieldName = 'fabricanteLogradouro'
      Size = 60
    end
    object cdsAdicoesXml_fabricanteNome: TStringField
      FieldName = 'fabricanteNome'
      Size = 100
    end
    object cdsAdicoesXml_fabricanteNumero: TStringField
      FieldName = 'fabricanteNumero'
      Size = 10
    end
    object cdsAdicoesXml_destaqueNcm_numeroDestaque: TStringField
      FieldName = 'destaqueNcm_numeroDestaque'
      Size = 60
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivos XML (*.xml)|*.XML'
    Left = 470
    Top = 252
  end
  object dsAdicoesXml_: TDataSource
    DataSet = cdsAdicoesXml_
    Left = 154
    Top = 211
  end
  object cdsMercadoriasXml_: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 296
    object cdsMercadoriasXml_id: TIntegerField
      FieldName = 'id'
    end
    object cdsMercadoriasXml_mercadoria_descricaoMercadoria: TStringField
      FieldName = 'mercadoria_descricaoMercadoria'
      Size = 2000
    end
    object cdsMercadoriasXml_mercadoria_numeroSequencialItem: TStringField
      FieldName = 'mercadoria_numeroSequencialItem'
      Size = 3
    end
    object cdsMercadoriasXml_mercadoria_quantidade: TStringField
      FieldName = 'mercadoria_quantidade'
      Size = 15
    end
    object cdsMercadoriasXml_mercadoria_unidadeMedida: TStringField
      FieldName = 'mercadoria_unidadeMedida'
    end
    object cdsMercadoriasXml_mercadoria_valorUnitario: TStringField
      FieldName = 'mercadoria_valorUnitario'
    end
    object cdsMercadoriasXml_numeroAdicao: TStringField
      FieldName = 'numeroAdicao'
      Size = 3
    end
    object cdsMercadoriasXml_numeroDI: TStringField
      FieldName = 'numeroDI'
      Size = 15
    end
  end
  object qryTemp: TQuery
    DatabaseName = 'DBBROKER'
    Left = 502
    Top = 204
  end
  object dsPagamentosXml_: TDataSource
    DataSet = cdsPagamentosXML_
    Left = 345
    Top = 207
  end
  object cdsPagamentosXML_: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 245
    Top = 207
    object cdsPagamentosXML_id: TIntegerField
      FieldName = 'id'
    end
    object cdsPagamentosXML_pgmto_agenciaPagamento: TStringField
      FieldName = 'pgmto_agenciaPagamento'
      Size = 5
    end
    object cdsPagamentosXML_pgmto_bancoPagamento: TStringField
      FieldName = 'pgmto_bancoPagamento'
      Size = 3
    end
    object cdsPagamentosXML_pgmto_codigoReceita: TStringField
      FieldName = 'pgmto_codigoReceita'
      Size = 4
    end
    object cdsPagamentosXML_pgmto_codigoTipoPagamento: TStringField
      FieldName = 'pgmto_codigoTipoPagamento'
      Size = 1
    end
    object cdsPagamentosXML_pgmto_contaPagamento: TStringField
      FieldName = 'pgmto_contaPagamento'
      Size = 19
    end
    object cdsPagamentosXML_pgmto_dataPagamento: TStringField
      FieldName = 'pgmto_dataPagamento'
      Size = 8
    end
    object cdsPagamentosXML_pgmto_nomeTipoPagamento: TStringField
      FieldName = 'pgmto_nomeTipoPagamento'
      Size = 30
    end
    object cdsPagamentosXML_pgmto_numeroRetificacao: TStringField
      FieldName = 'pgmto_numeroRetificacao'
      Size = 2
    end
    object cdsPagamentosXML_pgmto_valorJurosEncargos: TStringField
      FieldName = 'pgmto_valorJurosEncargos'
      Size = 9
    end
    object cdsPagamentosXML_pgmto_valorMulta: TStringField
      FieldName = 'pgmto_valorMulta'
      Size = 9
    end
    object cdsPagamentosXML_pgmto_valorReceita: TStringField
      FieldName = 'pgmto_valorReceita'
      Size = 15
    end
  end
  object cdsDocumentosXML_: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 252
    object cdsDocumentosXML_id: TIntegerField
      FieldName = 'id'
    end
    object cdsDocumentosXML_documento_codigoTipo: TStringField
      FieldName = 'documento_codigoTipo'
      Size = 2
    end
    object cdsDocumentosXML_documento_nome: TStringField
      DisplayWidth = 60
      FieldName = 'documento_nome'
      Size = 60
    end
    object cdsDocumentosXML_documentos_numero: TStringField
      FieldName = 'documentos_numero'
      Size = 25
    end
  end
  object dsDocumentosXml_: TDataSource
    DataSet = cdsDocumentosXML_
    Left = 344
    Top = 252
  end
  object cdsEmbalagensXml_: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 49
    Top = 293
    object cdsEmbalagensXml_embalagemid: TIntegerField
      FieldName = 'id'
    end
    object cdsEmbalagensXml_embalagem_codigoTipoEmbalagem: TStringField
      FieldName = 'embalagem_codigoTipoEmbalagem'
      Size = 2
    end
    object cdsEmbalagensXml_embalagem_nomeEmbalagem: TStringField
      FieldName = 'embalagem_nomeEmbalagem'
      Size = 60
    end
    object cdsEmbalagensXml_embalagem_quantidadeVolume: TStringField
      FieldName = 'embalagem_quantidadeVolume'
      Size = 5
    end
  end
  object dsEmbalagensXml_: TDataSource
    DataSet = cdsEmbalagensXml_
    Left = 153
    Top = 294
  end
  object cdsItensDI: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 414
    Top = 205
    object cdsItensDIID: TIntegerField
      FieldName = 'ID'
    end
    object cdsItensDICD_MERCADORIA: TStringField
      DisplayLabel = 'C'#243'digo Mercadoria'
      FieldName = 'CD_MERCADORIA'
      Size = 30
    end
    object cdsItensDICD_UN_MED_COMERC: TStringField
      DisplayLabel = 'Unid. Medida'
      FieldName = 'CD_UN_MED_COMERC'
      Size = 3
    end
    object cdsItensDICD_NCM_SH: TStringField
      DisplayLabel = 'NCM'
      FieldName = 'CD_NCM_SH'
    end
    object cdsItensDIQT_MERC_UN_COMERC: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QT_MERC_UN_COMERC'
    end
    object cdsItensDICD_EXPORTADOR: TStringField
      DisplayLabel = 'C'#243'digo Exportador'
      FieldName = 'CD_EXPORTADOR'
      Size = 5
    end
    object cdsItensDIVL_UNITARIO: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VL_UNITARIO'
    end
    object cdsItensDINR_DESTAQUE_NCM: TStringField
      DisplayLabel = 'Nr Destaque NCM'
      FieldName = 'NR_DESTAQUE_NCM'
      Size = 3
    end
    object cdsItensDICD_FABRICANTE: TStringField
      DisplayLabel = 'Fabricante'
      DisplayWidth = 5
      FieldName = 'CD_FABRICANTE'
      Size = 5
    end
    object cdsItensDICD_PAIS_ORIGEM: TStringField
      DisplayLabel = 'Pa'#237's Origem'
      FieldName = 'CD_PAIS_ORIGEM'
      Size = 3
    end
    object cdsItensDICD_MOEDA_NEGOCIADA: TStringField
      DisplayLabel = 'Moeda Negociada'
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Size = 10
    end
    object cdsItensDICD_INCOTERMS_VENDA: TStringField
      DisplayLabel = 'Incoterm'
      FieldName = 'CD_INCOTERMS_VENDA'
      Size = 3
    end
    object cdsItensDINR_ORDEM: TStringField
      DisplayLabel = 'Ordem'
      FieldName = 'NR_ORDEM'
      Size = 30
    end
    object cdsItensDINR_FATURA: TStringField
      DisplayLabel = 'Fatura'
      FieldName = 'NR_FATURA'
      Size = 30
    end
    object cdsItensDITX_DESC_DET_MERC: TMemoField
      DisplayLabel = 'Descri'#231#227'o Mercadoria'
      FieldName = 'TX_DESC_DET_MERC'
      BlobType = ftMemo
      Size = 2000
    end
    object cdsItensDICD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Size = 3
    end
    object cdsItensDICD_MOTIVO_ADM_TEMP: TStringField
      FieldName = 'CD_MOTIVO_ADM_TEMP'
      Size = 15
    end
    object cdsItensDICD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      Size = 15
    end
    object cdsItensDICD_FUND_LEGAL_PISCOFINS: TStringField
      FieldName = 'CD_FUND_LEGAL_PISCOFINS'
      Size = 15
    end
    object cdsItensDICD_TIPO_BENEF_PIS_COFINS: TStringField
      FieldName = 'CD_TIPO_BENEF_PIS_COFINS'
      Size = 15
    end
    object cdsItensDIPC_REDUCAO_PIS_COFINS: TFloatField
      FieldName = 'PC_REDUCAO_PIS_COFINS'
    end
    object cdsItensDIVL_CALC_IPT_ADVAL: TFloatField
      FieldName = 'VL_CALC_IPT_ADVAL'
    end
    object cdsItensDIVL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object cdsItensDIVL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object cdsItensDIVL_BASE_PIS: TFloatField
      FieldName = 'VL_BASE_PIS'
    end
    object cdsItensDIVL_ALIQUOTA_ESPECIFICA_PIS: TFloatField
      FieldName = 'VL_ALIQUOTA_ESPECIFICA_PIS'
    end
    object cdsItensDIALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object cdsItensDIQTD_UNID_ESPECIFICA_PIS: TFloatField
      FieldName = 'QTD_UNID_ESPECIFICA_PIS'
    end
    object cdsItensDIALIQ_COFINS_REDUZIDA: TFloatField
      FieldName = 'ALIQ_COFINS_REDUZIDA'
    end
    object cdsItensDIVL_ALIQUOTA_ESPECIFICA_COFINS: TFloatField
      FieldName = 'VL_ALIQUOTA_ESPECIFICA_COFINS'
    end
    object cdsItensDIQTD_UNID_ESPECIFICA_COFINS: TFloatField
      FieldName = 'QTD_UNID_ESPECIFICA_COFINS'
    end
    object cdsItensDIALIQ_PIS_REDUZIDA: TFloatField
      FieldName = 'ALIQ_PIS_REDUZIDA'
    end
    object cdsItensDIALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object cdsItensDIPC_ALIQ_NORM_ADVAL_IPI: TFloatField
      FieldName = 'PC_ALIQ_NORM_ADVAL_IPI'
    end
    object cdsItensDIVL_IPT_A_RECOLHER_IPI: TFloatField
      FieldName = 'VL_IPT_A_RECOLHER_IPI'
    end
    object cdsItensDIPC_ALIQ_REDUZIDA_IPI: TFloatField
      FieldName = 'PC_ALIQ_REDUZIDA_IPI'
    end
    object cdsItensDIVL_IMPOSTO_DEVIDO_IPI: TFloatField
      FieldName = 'VL_IMPOSTO_DEVIDO_IPI'
    end
    object cdsItensDIQT_ML_RECIPIENTE: TFloatField
      FieldName = 'QT_ML_RECIPIENTE'
    end
    object cdsItensDIQT_MERC_UN_ALIQ_ES: TFloatField
      FieldName = 'QT_MERC_UN_ALIQ_ES'
    end
    object cdsItensDIPC_ALIQ_NORM_ADVAL: TFloatField
      FieldName = 'PC_ALIQ_NORM_ADVAL'
    end
    object cdsItensDIPC_ALIQ_REDUZIDA: TFloatField
      FieldName = 'PC_ALIQ_REDUZIDA'
    end
    object cdsItensDIPC_REDUCAO_IPT_BLI: TFloatField
      FieldName = 'PC_REDUCAO_IPT_BLI'
    end
    object cdsItensDIPC_ALIQ_ACOR_TARIF: TFloatField
      FieldName = 'PC_ALIQ_ACOR_TARIF'
    end
    object cdsItensDIVL_BASE_CALC_ADVAL: TFloatField
      FieldName = 'VL_BASE_CALC_ADVAL'
    end
    object cdsItensDIVL_CALC_II_AC_TARI: TFloatField
      FieldName = 'VL_CALC_II_AC_TARI'
    end
    object cdsItensDIVL_IPT_A_RECOLHER: TFloatField
      FieldName = 'VL_IPT_A_RECOLHER'
    end
    object cdsItensDIVL_IMPOSTO_DEVIDO: TFloatField
      FieldName = 'VL_IMPOSTO_DEVIDO'
    end
    object cdsItensDICD_TIPO_BENEF_IPI: TStringField
      FieldName = 'CD_TIPO_BENEF_IPI'
      Size = 15
    end
    object cdsItensDICD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      Size = 15
    end
  end
  object dsItensDI: TDataSource
    DataSet = cdsItensDI
    Left = 451
    Top = 206
  end
  object qryTemp2: TQuery
    DatabaseName = 'DBBROKER'
    Left = 540
    Top = 204
  end
end
