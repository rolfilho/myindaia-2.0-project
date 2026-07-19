object frmDocumentosExportacao: TfrmDocumentosExportacao
  Left = 429
  Top = 172
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Documentos Exporta'#231#227'o'
  ClientHeight = 239
  ClientWidth = 500
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
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      500
      41)
    object SpeedButton1: TSpeedButton
      Left = 459
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
  object pgPrincipal: TPageControl
    Left = 0
    Top = 41
    Width = 500
    Height = 79
    ActivePage = tbProcesso
    Align = alTop
    TabOrder = 1
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
        ListSource = datm_DocumentosExportacao.dsUnidadeNeg
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
        Left = 242
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
        ListSource = datm_DocumentosExportacao.dsProduto
        ParentFont = False
        TabOrder = 4
        TabStop = False
        OnCloseUp = cbProdutoCloseUp
        OnExit = cbProdutoExit
        OnKeyDown = cbProdutoKeyDown
      end
    end
  end
  object pgDocumentos: TPageControl
    Left = 0
    Top = 120
    Width = 500
    Height = 82
    ActivePage = tbsPackingList
    Align = alClient
    TabOrder = 2
    object tbsFaturaComercial: TTabSheet
      Caption = 'Fatura Comercial'
      object rgIdiomaFaturaComercial: TRadioGroup
        Left = 2
        Top = 4
        Width = 250
        Height = 43
        Caption = 'Idioma'
        Columns = 3
        ItemIndex = 1
        Items.Strings = (
          'Ingles'
          'Espanhol'
          'Portugues')
        TabOrder = 0
      end
      object rgTipoFatura: TRadioGroup
        Left = 273
        Top = 4
        Width = 215
        Height = 43
        Caption = 'Tipo'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Fatura Comercial'
          'Proforma')
        TabOrder = 1
      end
    end
    object tbsPackingList: TTabSheet
      Caption = 'Packing List'
      ImageIndex = 1
      object rgIdiomaPackingList: TRadioGroup
        Left = 2
        Top = 4
        Width = 250
        Height = 43
        Caption = 'Idioma'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Ingles'
          'Espanhol'
          'Portugues')
        TabOrder = 0
      end
    end
  end
  object pnlGerarRelatorio: TPanel
    Left = 0
    Top = 202
    Width = 500
    Height = 37
    Align = alBottom
    Anchors = [akLeft, akRight]
    TabOrder = 3
    DesignSize = (
      500
      37)
    object btnGerarRelatorio: TSpeedButton
      Left = 377
      Top = 6
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
      OnClick = btnGerarRelatorioClick
    end
  end
end
