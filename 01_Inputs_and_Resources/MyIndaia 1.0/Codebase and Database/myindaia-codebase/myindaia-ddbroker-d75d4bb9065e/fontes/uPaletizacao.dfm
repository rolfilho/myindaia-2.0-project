object frmPaletizacao: TfrmPaletizacao
  Left = 192
  Top = 107
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Paletiza'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    742
    523)
  PixelsPerInch = 96
  TextHeight = 13
  object scbMain: TScrollBox
    Left = 0
    Top = 50
    Width = 742
    Height = 473
    Align = alClient
    BorderStyle = bsNone
    Color = clInfoBk
    ParentColor = False
    TabOrder = 1
    object pnlEspaco: TPanel
      Left = 0
      Top = 0
      Width = 1
      Height = 1
      BevelOuter = bvNone
      TabOrder = 0
    end
    object pnlLabels: TPanel
      Left = 0
      Top = 0
      Width = 742
      Height = 18
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 1
      object pnlExibeNivel: TPanel
        Left = 0
        Top = 3
        Width = 1
        Height = 14
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
      end
    end
  end
  object pnlProcessoItem: TPanel
    Left = 63
    Top = 110
    Width = 615
    Height = 350
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    BorderWidth = 2
    Constraints.MinHeight = 100
    Constraints.MinWidth = 500
    TabOrder = 3
    Visible = False
    DesignSize = (
      615
      350)
    object shp1: TShape
      Left = 2
      Top = 2
      Width = 611
      Height = 346
      Align = alClient
      Brush.Style = bsClear
      Pen.Color = clNavy
    end
    object btnBaixaItem: TSpeedButton
      Left = 4
      Top = 4
      Width = 25
      Height = 25
      Hint = 'Baixa os itens selecionados para a caixa'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnBaixaItemClick
    end
    object btnCancelaBaixa: TSpeedButton
      Left = 29
      Top = 4
      Width = 25
      Height = 25
      Hint = 'Cancela a baixa de itens para a caixa'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelaBaixaClick
    end
    object lblPesqMercIns: TLabel
      Left = 422
      Top = 6
      Width = 53
      Height = 26
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'#13#10'Mercadoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 58
      Top = 5
      Width = 202
      Height = 13
      Caption = 'Palet/Caixa - Selecione os itens para baixa'
    end
    object lblCaixaBaixar: TLabel
      Left = 58
      Top = 19
      Width = 65
      Height = 13
      Caption = 'lblCaixaBaixar'
    end
    object dbgrdProcessoItem: TDBGrid
      Left = 11
      Top = 34
      Width = 593
      Height = 305
      Anchors = [akLeft, akTop, akRight, akBottom]
      Ctl3D = False
      DataSource = dsProcessoExpItem
      Options = [dgTitles, dgIndicator, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgMultiSelect]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = 15662830
          Expanded = False
          FieldName = 'NR_ITEM'
          Title.Caption = 'Item'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_MERCADORIA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AP_MERCADORIA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 200
          Visible = True
        end
        item
          Color = 15662846
          Expanded = False
          FieldName = 'QT_MERCADORIA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 85
          Visible = True
        end
        item
          Color = 15662846
          Expanded = False
          FieldName = 'QT_BAIXADA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 85
          Visible = True
        end
        item
          Color = 14540287
          Expanded = False
          FieldName = 'calcQtdeDisponivel'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 85
          Visible = True
        end>
    end
    object edtPesqMercInc: TEdit
      Left = 479
      Top = 9
      Width = 125
      Height = 19
      TabStop = False
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnChange = edtPesqMercIncChange
    end
  end
  object pnlShowItensCaixa: TPanel
    Left = 116
    Top = 110
    Width = 510
    Height = 250
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    BorderWidth = 2
    Constraints.MinHeight = 100
    Constraints.MinWidth = 330
    TabOrder = 5
    Visible = False
    DesignSize = (
      510
      250)
    object shp2: TShape
      Left = 2
      Top = 2
      Width = 506
      Height = 246
      Align = alClient
      Brush.Style = bsClear
      Pen.Color = clNavy
    end
    object btnEstornaItem: TSpeedButton
      Left = 4
      Top = 4
      Width = 25
      Height = 25
      Hint = 'Estorna os itens selecionados abaixo'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        300033FFFFFF3333377739999993333333333777777F3333333F399999933333
        3300377777733333337733333333333333003333333333333377333333333333
        3333333333333333333F333333333333330033333F33333333773333C3333333
        330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
        333333377333333333FF3333C333333330003333733333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnEstornaItemClick
    end
    object btnCancelaEstorno: TSpeedButton
      Left = 29
      Top = 4
      Width = 25
      Height = 25
      Hint = 'Cancela o estorno de itens'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelaEstornoClick
    end
    object lblPesqMercEst: TLabel
      Left = 318
      Top = 7
      Width = 53
      Height = 26
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'#13#10'Mercadoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblCaixaEstorno: TLabel
      Left = 58
      Top = 19
      Width = 72
      Height = 13
      Caption = 'lblCaixaEstorno'
    end
    object lbl1: TLabel
      Left = 58
      Top = 5
      Width = 200
      Height = 13
      Caption = 'Palet/Caixa - Selecione os itens a estornar'
    end
    object dbgrdShowItens: TDBGrid
      Left = 11
      Top = 35
      Width = 487
      Height = 205
      Anchors = [akLeft, akTop, akRight, akBottom]
      Ctl3D = False
      DataSource = dsShowItens
      Options = [dgTitles, dgIndicator, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgMultiSelect]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = 15662830
          Expanded = False
          FieldName = 'NR_ITEM'
          Title.Caption = 'Item'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_MERCADORIA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AP_MERCADORIA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 200
          Visible = True
        end
        item
          Color = 15662846
          Expanded = False
          FieldName = 'QT_MERCADORIA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_PESO_LIQUIDO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end>
    end
    object edtPesqMercEst: TEdit
      Left = 372
      Top = 10
      Width = 125
      Height = 19
      TabStop = False
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnChange = edtPesqMercEstChange
    end
  end
  object pnlCadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 50
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      50)
    object shp4: TShape
      Left = 178
      Top = 5
      Width = 411
      Height = 40
      Anchors = [akTop, akRight, akBottom]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object btnIncluir: TSpeedButton
      Left = 6
      Top = 5
      Width = 40
      Height = 40
      Hint = 'Incluir'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnIncluirClick
    end
    object btnSair: TSpeedButton
      Left = 697
      Top = 5
      Width = 40
      Height = 40
      Hint = 'Sair'
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
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSairClick
    end
    object btnSalvar: TSpeedButton
      Left = 46
      Top = 5
      Width = 40
      Height = 40
      Hint = 'Salvar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSalvarClick
    end
    object btnCancelar: TSpeedButton
      Left = 86
      Top = 5
      Width = 40
      Height = 40
      Hint = 'Cancelar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelarClick
    end
    object btn1: TSpeedButton
      Left = 671
      Top = 5
      Width = 23
      Height = 22
      Flat = True
      Visible = False
      OnClick = btn1Click
    end
    object btnPackingList: TSpeedButton
      Left = 132
      Top = 5
      Width = 40
      Height = 40
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnPackingListClick
    end
    object lblUnidade: TLabel
      Left = 186
      Top = 9
      Width = 48
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnUnidade: TSpeedButton
      Left = 317
      Top = 20
      Width = 23
      Height = 21
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = btnUnidadeClick
    end
    object lblProcesso: TLabel
      Left = 348
      Top = 9
      Width = 74
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Nr. Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnProcesso: TSpeedButton
      Left = 449
      Top = 20
      Width = 23
      Height = 21
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = btnProcessoClick
    end
    object btnZerar: TSpeedButton
      Left = 590
      Top = 5
      Width = 40
      Height = 40
      Hint = 'Incluir'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnZerarClick
    end
    object mskUnidade: TMaskEdit
      Left = 186
      Top = 21
      Width = 30
      Height = 19
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnChange = btnUnidadeClick
      OnExit = mskUnidadeExit
    end
    object edtUnidade: TEdit
      Left = 216
      Top = 21
      Width = 100
      Height = 19
      TabStop = False
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Color = clSilver
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object mskNrProcesso: TMaskEdit
      Left = 348
      Top = 21
      Width = 100
      Height = 19
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 14
      ParentCtl3D = False
      TabOrder = 2
      OnExit = mskNrProcessoExit
    end
    object chkProcessos: TCheckBox
      Left = 476
      Top = 22
      Width = 107
      Height = 17
      TabStop = False
      Anchors = [akTop, akRight]
      Caption = #218'ltimos Processos'
      TabOrder = 3
    end
  end
  object dbgrdDebug: TDBGrid
    Left = 0
    Top = 523
    Width = 742
    Height = 0
    Align = alBottom
    DataSource = dsPalets
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object pnlQtdeItens: TPanel
    Left = 214
    Top = 148
    Width = 314
    Height = 121
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 4
    Visible = False
    object shp3: TShape
      Left = 2
      Top = 2
      Width = 310
      Height = 117
      Align = alClient
      Brush.Style = bsClear
      Pen.Color = clNavy
    end
    object lblnrItem: TLabel
      Left = 11
      Top = 9
      Width = 46
      Height = 13
      Caption = 'Nr. Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMercadoria: TLabel
      Left = 67
      Top = 9
      Width = 64
      Height = 13
      Caption = 'Mercadoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblQtdeItem: TLabel
      Left = 11
      Top = 50
      Width = 59
      Height = 13
      Caption = 'Qtde. a ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblQtdeDisp: TLabel
      Left = 206
      Top = 50
      Width = 97
      Height = 13
      Caption = 'Qtde. Dispon'#237'vel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPesoLiq: TLabel
      Left = 113
      Top = 50
      Width = 76
      Height = 13
      Caption = 'Peso L'#237'quido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOk: TBitBtn
      Left = 151
      Top = 89
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnOkClick
    end
    object mskQtdeItem: TCurrencyEdit
      Left = 11
      Top = 64
      Width = 95
      Height = 19
      AutoSize = False
      Ctl3D = False
      DisplayFormat = ' ,0.00;- ,0.00'
      ParentCtl3D = False
      TabOrder = 0
    end
    object mskQtdeDisp: TCurrencyEdit
      Left = 206
      Top = 64
      Width = 97
      Height = 19
      TabStop = False
      AutoSize = False
      Color = clSilver
      Ctl3D = False
      DisplayFormat = ' ,0.00;- ,0.00'
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtNrItem: TEdit
      Left = 11
      Top = 23
      Width = 50
      Height = 19
      TabStop = False
      Color = clSilver
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtMercadoria: TEdit
      Left = 68
      Top = 23
      Width = 235
      Height = 19
      TabStop = False
      Color = clSilver
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 6
    end
    object mskPesoLiq: TCurrencyEdit
      Left = 113
      Top = 64
      Width = 86
      Height = 19
      AutoSize = False
      Ctl3D = False
      DisplayFormat = ' ,0.0000;- ,0.0000'
      ParentCtl3D = False
      TabOrder = 1
    end
    object btnCancelBaixaEstorno: TBitBtn
      Left = 231
      Top = 89
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnCancelBaixaEstornoClick
    end
    object chkAlterPesoLiq: TCheckBox
      Left = 11
      Top = 93
      Width = 134
      Height = 17
      TabStop = False
      Caption = 'alterar s'#243' o peso l'#237'quido'
      TabOrder = 7
      OnClick = chkAlterPesoLiqClick
    end
  end
  object dsPalets: TDataSource
    DataSet = mtblPalets
    Left = 654
    Top = 144
  end
  object mtblPalets: TMemoryTable
    AfterPost = mtblPaletsAfterPost
    Left = 683
    Top = 144
    object mtblPaletsCD_PALET: TIntegerField
      FieldName = 'CD_PALET'
    end
    object mtblPaletsCD_NIVEL: TIntegerField
      FieldName = 'CD_NIVEL'
    end
    object mtblPaletsCD_CAIXA: TIntegerField
      FieldName = 'CD_CAIXA'
    end
    object mtblPaletsTX_NOME_CAIXA: TStringField
      FieldName = 'TX_NOME_CAIXA'
    end
    object mtblPaletsVL_QTD_FILHO: TIntegerField
      FieldName = 'VL_QTD_FILHO'
    end
    object mtblPaletsTX_NOME_PAI: TStringField
      FieldName = 'TX_NOME_PAI'
    end
    object mtblPaletsTX_ITENS_PROCESSO: TStringField
      FieldName = 'TX_ITENS_PROCESSO'
      Size = 500
    end
    object mtblPaletsTX_CAMINHO: TStringField
      FieldName = 'TX_CAMINHO'
      Size = 500
    end
    object mtblPaletsTX_EDIT_CAIXA: TStringField
      FieldName = 'TX_EDIT_CAIXA'
      Size = 50
    end
    object mtblPaletsVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object mtblPaletsVL_CUBAGEM: TFloatField
      FieldName = 'VL_CUBAGEM'
    end
    object mtblPaletsVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
    end
  end
  object dsProcessoExpItem: TDataSource
    DataSet = qryProcessoExpItem
    Left = 654
    Top = 84
  end
  object qryProcessoExpItem: TQuery
    CachedUpdates = True
    AfterPost = qryProcessoExpItemAfterPost
    OnCalcFields = qryProcessoExpItemCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT EI.NR_PROCESSO, EI.NR_ITEM, EI.CD_MERCADORIA, EI.QT_MERCA' +
        'DORIA, EI.QT_BAIXADA, ME.AP_MERCADORIA, EI.VL_PESO_LIQ_UNIT'
      'FROM TPROCESSO_EXP_ITEM EI (NOLOCK)'
      
        '  INNER JOIN TMERCADORIA_EXP ME (NOLOCK) ON (ME.CD_MERCADORIA = ' +
        'EI.CD_MERCADORIA)'
      'WHERE EI.NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY ME.AP_MERCADORIA')
    UpdateObject = updProcessoExpItem
    Left = 683
    Top = 84
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end>
    object qryProcessoExpItemNR_PROCESSO: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'BROKER.TPROCESSO_EXP_ITEM.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryProcessoExpItemNR_ITEM: TStringField
      DisplayLabel = 'Nr. Item'
      FieldName = 'NR_ITEM'
      Origin = 'BROKER.TPROCESSO_EXP_ITEM.NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryProcessoExpItemCD_MERCADORIA: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_MERCADORIA'
      Origin = 'BROKER.TPROCESSO_EXP_ITEM.CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object qryProcessoExpItemAP_MERCADORIA: TStringField
      DisplayLabel = 'Mercadoria'
      FieldName = 'AP_MERCADORIA'
      FixedChar = True
      Size = 25
    end
    object qryProcessoExpItemQT_MERCADORIA: TFloatField
      DisplayLabel = 'Qtde. Total'
      FieldName = 'QT_MERCADORIA'
      Origin = 'BROKER.TPROCESSO_EXP_ITEM.QT_MERCADORIA'
    end
    object qryProcessoExpItemQT_BAIXADA: TFloatField
      DisplayLabel = 'Qtde. Baixada'
      FieldName = 'QT_BAIXADA'
      Origin = 'DBBROKER.TPROCESSO_EXP_ITEM.QT_BAIXADA'
    end
    object qryProcessoExpItemVL_PESO_LIQ_UNIT: TFloatField
      FieldName = 'VL_PESO_LIQ_UNIT'
    end
    object qryProcessoExpItemcalcQtdeDisponivel: TFloatField
      DisplayLabel = 'Qtde. Dispon'#237'vel'
      FieldKind = fkCalculated
      FieldName = 'calcQtdeDisponivel'
      Calculated = True
    end
    object qryProcessoExpItemcalcPesoLiquido: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcPesoLiquido'
      Calculated = True
    end
  end
  object updProcessoExpItem: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_EXP_ITEM'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ITEM = :NR_ITEM,'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  QT_MERCADORIA = :QT_MERCADORIA,'
      '  QT_BAIXADA = :QT_BAIXADA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM')
    InsertSQL.Strings = (
      'insert into TPROCESSO_EXP_ITEM'
      '  (NR_PROCESSO, NR_ITEM, CD_MERCADORIA, QT_MERCADORIA, '
      'QT_BAIXADA)'
      'values'
      '  (:NR_PROCESSO, :NR_ITEM, :CD_MERCADORIA, :QT_MERCADORIA, '
      ':QT_BAIXADA)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_EXP_ITEM'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM')
    Left = 712
    Top = 84
  end
  object dsProcessoPaletizacao: TDataSource
    DataSet = qryProcessoPaletizacao
    Left = 654
    Top = 54
  end
  object qryProcessoPaletizacao: TQuery
    CachedUpdates = True
    AfterPost = qryProcessoExpItemAfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT PP.NR_PROCESSO, PP.CD_CAMINHO, PP.TX_CAMINHO, PP.NR_ITEM,' +
        ' PP.VL_QTDE, PP.VL_PESO_BRUTO, PP.VL_M3,'
      
        '  ISNULL(PP.VL_PESO_LIQUIDO, 0) VL_PESO_LIQUIDO, PP.CD_MERCADORI' +
        'A, ME.AP_MERCADORIA'
      'FROM TPROCESSO_PALETIZACAO PP (NOLOCK)'
      
        '  INNER JOIN TMERCADORIA_EXP ME (NOLOCK) ON (ME.CD_MERCADORIA = ' +
        'PP.CD_MERCADORIA)'
      'WHERE PP.NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY PP.TX_CAMINHO, ME.AP_MERCADORIA')
    UpdateObject = updProcessoPaletizacao
    Left = 683
    Top = 54
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end>
    object qryProcessoPaletizacaoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO_PALETIZACAO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryProcessoPaletizacaoCD_CAMINHO: TIntegerField
      FieldName = 'CD_CAMINHO'
      Origin = 'DBBROKER.TPROCESSO_PALETIZACAO.CD_CAMINHO'
    end
    object qryProcessoPaletizacaoTX_CAMINHO: TStringField
      FieldName = 'TX_CAMINHO'
      Origin = 'DBBROKER.TPROCESSO_PALETIZACAO.TX_CAMINHO'
      FixedChar = True
      Size = 255
    end
    object qryProcessoPaletizacaoNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'DBBROKER.TPROCESSO_PALETIZACAO.NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryProcessoPaletizacaoVL_QTDE: TFloatField
      FieldName = 'VL_QTDE'
      Origin = 'DBBROKER.TPROCESSO_PALETIZACAO.VL_QTDE'
    end
    object qryProcessoPaletizacaoVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qryProcessoPaletizacaoVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
    end
    object qryProcessoPaletizacaoVL_M3: TFloatField
      FieldName = 'VL_M3'
    end
    object qryProcessoPaletizacaoCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object qryProcessoPaletizacaoAP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      FixedChar = True
      Size = 25
    end
  end
  object updProcessoPaletizacao: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_PALETIZACAO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_CAMINHO = :CD_CAMINHO,'
      '  TX_CAMINHO = :TX_CAMINHO,'
      '  NR_ITEM = :NR_ITEM,'
      '  VL_QTDE = :VL_QTDE,'
      '  VL_PESO_BRUTO = :VL_PESO_BRUTO,'
      '  VL_PESO_LIQUIDO = :VL_PESO_LIQUIDO,'
      '  VL_M3 = :VL_M3,'
      '  CD_MERCADORIA = :CD_MERCADORIA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_CAMINHO = :OLD_CD_CAMINHO')
    InsertSQL.Strings = (
      'insert into TPROCESSO_PALETIZACAO'
      '  (NR_PROCESSO, CD_CAMINHO, TX_CAMINHO, NR_ITEM, VL_QTDE, '
      'CD_MERCADORIA, VL_PESO_BRUTO, VL_PESO_LIQUIDO, VL_M3)'
      'values'
      '  (:NR_PROCESSO, :CD_CAMINHO, :TX_CAMINHO, :NR_ITEM, :VL_QTDE, '
      ':CD_MERCADORIA, :VL_PESO_BRUTO, :VL_PESO_LIQUIDO, :VL_M3)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_PALETIZACAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_CAMINHO = :OLD_CD_CAMINHO')
    Left = 712
    Top = 54
  end
  object mtblShowItens: TMemoryTable
    Left = 683
    Top = 174
    object mtblShowItensNR_ITEM: TStringField
      DisplayLabel = 'Nr. Item'
      FieldName = 'NR_ITEM'
      Size = 3
    end
    object mtblShowItensCD_MERCADORIA: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'CD_MERCADORIA'
      Size = 15
    end
    object mtblShowItensAP_MERCADORIA: TStringField
      DisplayLabel = 'Mercadoria'
      FieldName = 'AP_MERCADORIA'
      Size = 25
    end
    object mtblShowItensQT_MERCADORIA: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QT_MERCADORIA'
    end
    object mtblShowItensVL_PESO_LIQUIDO: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'VL_PESO_LIQUIDO'
      DisplayFormat = '#,#.0000'
    end
  end
  object dsShowItens: TDataSource
    DataSet = mtblShowItens
    Left = 654
    Top = 174
  end
  object qryUltimoCodigo: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_CAMINHO) AS ULTIMO'
      'FROM TPROCESSO_PALETIZACAO (NOLOCK)'
      '')
    Left = 683
    Top = 114
    object qryUltimoCodigoULTIMO: TIntegerField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TPROCESSO_PALETIZACAO.CD_CAMINHO'
    end
  end
  object popPaletizacao: TPopupMenu
    Left = 683
    Top = 204
    object mniExcluir: TMenuItem
      Caption = 'E&xcluir'
      OnClick = mniExcluirClick
    end
    object mniCancelar: TMenuItem
      Caption = '&Cancelar'
    end
  end
end
