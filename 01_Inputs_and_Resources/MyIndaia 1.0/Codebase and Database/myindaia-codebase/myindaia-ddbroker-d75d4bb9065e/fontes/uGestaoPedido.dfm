object frmGestaoPedido: TfrmGestaoPedido
  Left = 452
  Top = 178
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Gest'#227'o Pedido de Importa'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = mmGestaoPedido
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSeparador: TBevel
    Left = 0
    Top = 47
    Width = 742
    Height = 5
    Align = alTop
    Shape = bsSpacer
  end
  object pnlGestaoCadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    Color = clSilver
    TabOrder = 0
    TabStop = True
    DesignSize = (
      742
      47)
    object shpNavigator: TShape
      Left = 531
      Top = 15
      Width = 94
      Height = 24
      Anchors = [akTop, akRight]
      Brush.Style = bsClear
      Pen.Color = clGray
      Visible = False
    end
    object btnSalvar: TSpeedButton
      Left = 42
      Top = 5
      Width = 37
      Height = 37
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
      OnClick = btnSalvarClick
    end
    object btnCancelar: TSpeedButton
      Left = 79
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Cancelar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      OnClick = btnCancelarClick
    end
    object btnSair: TSpeedButton
      Left = 700
      Top = 5
      Width = 37
      Height = 37
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
      OnClick = btnSairClick
    end
    object btnIncluir: TSpeedButton
      Left = 5
      Top = 5
      Width = 37
      Height = 37
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
    object btnProcRealiza: TSpeedButton
      Left = 160
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Realiza'#231#227'o por Processo'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnProcRealizaClick
    end
    object btnExcluir: TSpeedButton
      Left = 116
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Excluir'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      Visible = False
      OnClick = btnExcluirClick
    end
    object btnManutPedido: TSpeedButton
      Left = 197
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Manuten'#231#227'o do PO'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FF555FFFFFFF5FF0075500000005000775F57777777F7770B0550CC0090
        50E07F7F57FF77F7F7F70B055000000050E07F75F7777777F7F70B7750CC0090
        50E075F7F7F577F7F7F777B050CC009050E057F7F7F577F7F7F750B050CC0090
        50E057F757F577F7F7F750B770CC009050E0575F77F577F7F7F7577B00CC0090
        50E0557F77F577F7F7F7550B30CC00905000557F57FF77F7F777550B30000090
        50E05575F77777F7F7F7557000CC00905000555777FF77F7F777555550000090
        55555555577777F7F5555555555550005555555555555777F555555555555090
        55555555555557F7F55555555555500055555555555557775555}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnManutPedidoClick
    end
    object lblPedidoCriado: TLabel
      Left = 441
      Top = 6
      Width = 61
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Nr. Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lblProcessoCriado: TLabel
      Left = 349
      Top = 6
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
      Transparent = True
      Visible = False
    end
    object BtnBaixa: TSpeedButton
      Left = 234
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Baixa Parcial'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnBaixaClick
    end
    object lblItensPo: TLabel
      Left = 629
      Top = 6
      Width = 25
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object dbnavItemPedido: TDBNavigator
      Left = 532
      Top = 16
      Width = 92
      Height = 22
      DataSource = dsPoItem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
    object txtNrPedido: TStaticText
      Left = 441
      Top = 20
      Width = 85
      Height = 19
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkFlat
      BevelOuter = bvSpace
      BorderStyle = sbsSingle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object txtNrProcesso: TStaticText
      Left = 349
      Top = 20
      Width = 85
      Height = 19
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkFlat
      BevelOuter = bvSpace
      BorderStyle = sbsSingle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Visible = False
    end
    object txtItensPo: TStaticText
      Left = 630
      Top = 20
      Width = 65
      Height = 19
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      BevelInner = bvSpace
      BevelKind = bkFlat
      BevelOuter = bvSpace
      BorderStyle = sbsSingle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
  end
  object pnlAtencaoLI: TPanel
    Left = 0
    Top = 483
    Width = 742
    Height = 21
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    Visible = False
    object lblAtencaoLI: TLabel
      Left = 6
      Top = 4
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pgctrlGestaoPedido: TPageControl
    Left = 0
    Top = 52
    Width = 742
    Height = 431
    ActivePage = tsPedidoItem
    Align = alClient
    TabOrder = 1
    OnChange = pgctrlGestaoPedidoChange
    OnChanging = pgctrlGestaoPedidoChanging
    object tsPedido: TTabSheet
      Caption = 'Pedido'
      ImageIndex = 1
      object bvlPedido: TBevel
        Left = 0
        Top = 0
        Width = 734
        Height = 403
        Align = alClient
        Shape = bsFrame
      end
      object lblUnidade: TLabel
        Left = 17
        Top = 10
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaUnidade: TSpeedButton
        Left = 403
        Top = 23
        Width = 25
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaUnidadeClick
      end
      object lblProduto: TLabel
        Left = 17
        Top = 50
        Width = 45
        Height = 13
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaProduto: TSpeedButton
        Left = 403
        Top = 63
        Width = 25
        Height = 23
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaProdutoClick
      end
      object lblCliente: TLabel
        Left = 17
        Top = 92
        Width = 40
        Height = 13
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaCliente: TSpeedButton
        Left = 403
        Top = 104
        Width = 25
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaClienteClick
      end
      object lblServico: TLabel
        Left = 17
        Top = 130
        Width = 44
        Height = 13
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaServico: TSpeedButton
        Left = 403
        Top = 143
        Width = 25
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaServicoClick
      end
      object btnAtualizaServico: TSpeedButton
        Left = 429
        Top = 143
        Width = 25
        Height = 23
        Hint = 
          'Atualiza FollowUp com esse servi'#231'o. Esta a'#231#227'o ir'#225' limpar as data' +
          's de realiza'#231#227'o existentes hoje.'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF33339993707399933333773337F3777FF3399933000339
          9933377333777F3377F3399333707333993337733337333337FF993333333333
          399377F33333F333377F993333303333399377F33337FF333373993333707333
          333377F333777F333333993333101333333377F333777F3FFFFF993333000399
          999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
          99933773FF777F3F777F339993707399999333773F373F77777F333999999999
          3393333777333777337333333999993333333333377777333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnAtualizaServicoClick
      end
      object lblNrPedido: TLabel
        Left = 17
        Top = 169
        Width = 61
        Height = 13
        Caption = 'Nr. Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNrProcesso: TLabel
        Left = 169
        Top = 170
        Width = 74
        Height = 13
        Caption = 'Nr. Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaPedido: TSpeedButton
        Left = 134
        Top = 181
        Width = 25
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaPedidoClick
      end
      object btnConsultaProcesso: TSpeedButton
        Left = 286
        Top = 182
        Width = 25
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaProcessoClick
      end
      object lblArea: TLabel
        Left = 18
        Top = 208
        Width = 27
        Height = 13
        Caption = #193'rea'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaArea: TSpeedButton
        Left = 403
        Top = 221
        Width = 25
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaAreaClick
      end
      object lblImportador: TLabel
        Left = 17
        Top = 247
        Width = 61
        Height = 13
        Caption = 'Importador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaImportador: TSpeedButton
        Left = 404
        Top = 259
        Width = 25
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaImportadorClick
      end
      object lblExportador: TLabel
        Left = 17
        Top = 286
        Width = 62
        Height = 13
        Caption = 'Exportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaExportador: TSpeedButton
        Left = 403
        Top = 298
        Width = 25
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaExportadorClick
      end
      object lblatencao: TLabel
        Left = 19
        Top = 320
        Width = 364
        Height = 13
        Caption = 'Aten'#231#227'o - Exportador necessita de uma Declara'#231#227'o do Detentor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object mskCodigoUnidade: TMaskEdit
        Left = 17
        Top = 24
        Width = 34
        Height = 21
        EditMask = '!99;0; '
        MaxLength = 2
        TabOrder = 0
        OnChange = btnConsultaUnidadeClick
        OnExit = mskCodigoUnidadeExit
        OnKeyDown = mskCodigoUnidadeKeyDown
      end
      object edtNomeUnidade: TEdit
        Left = 51
        Top = 24
        Width = 350
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 1
      end
      object mskCodigoProduto: TMaskEdit
        Left = 17
        Top = 64
        Width = 34
        Height = 21
        TabStop = False
        Enabled = False
        EditMask = '!99;0; '
        MaxLength = 2
        ReadOnly = True
        TabOrder = 2
        OnChange = btnConsultaProdutoClick
        OnExit = mskCodigoProdutoExit
        OnKeyDown = mskCodigoUnidadeKeyDown
      end
      object edtNomeProduto: TEdit
        Left = 51
        Top = 64
        Width = 350
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 3
      end
      object mskNrPedido: TMaskEdit
        Left = 17
        Top = 182
        Width = 115
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 8
        OnChange = mskNrPedidoChange
        OnEnter = mskNrPedidoEnter
        OnExit = mskNrPedidoExit
        OnKeyDown = mskCodigoUnidadeKeyDown
      end
      object mskNrProcesso: TMaskEdit
        Left = 169
        Top = 183
        Width = 115
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 9
        OnExit = mskNrProcessoExit
        OnKeyDown = mskCodigoUnidadeKeyDown
      end
      object chkUltimosProcessos: TCheckBox
        Left = 315
        Top = 185
        Width = 109
        Height = 17
        TabStop = False
        Caption = #218'ltimos Processos'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object dbedtCodigoServico: TDBEdit
        Left = 17
        Top = 144
        Width = 49
        Height = 21
        DataField = 'CD_SERVICO'
        DataSource = dsProcesso
        TabOrder = 6
        OnChange = btnConsultaServicoClick
        OnEnter = dbedtCodigoServicoEnter
        OnExit = dbedtCodigoServicoExit
        OnKeyDown = mskCodigoUnidadeKeyDown
      end
      object edtNomeCliente: TEdit
        Left = 66
        Top = 105
        Width = 335
        Height = 21
        TabStop = False
        Color = clSilver
        ReadOnly = True
        TabOrder = 5
      end
      object edtNomeServico: TEdit
        Left = 66
        Top = 144
        Width = 335
        Height = 21
        TabStop = False
        Color = clSilver
        ReadOnly = True
        TabOrder = 7
      end
      object edtNomeArea: TEdit
        Left = 66
        Top = 222
        Width = 335
        Height = 21
        TabStop = False
        Color = clSilver
        ReadOnly = True
        TabOrder = 12
      end
      object dbedtCodigoArea: TDBEdit
        Left = 17
        Top = 222
        Width = 50
        Height = 21
        DataField = 'CD_AREA'
        DataSource = dsProcesso
        TabOrder = 11
        OnChange = btnConsultaAreaClick
        OnExit = dbedtCodigoAreaExit
        OnKeyDown = mskCodigoUnidadeKeyDown
      end
      object dbedtCodigoImportador: TDBEdit
        Left = 17
        Top = 260
        Width = 49
        Height = 21
        DataField = 'CD_IMPORTADOR'
        DataSource = dsProcesso
        TabOrder = 13
        OnChange = btnConsultaImportadorClick
        OnExit = dbedtCodigoImportadorExit
        OnKeyDown = mskCodigoUnidadeKeyDown
      end
      object edtNomeImportador: TEdit
        Left = 66
        Top = 260
        Width = 335
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 14
      end
      object dbedtCodigoExportador: TDBEdit
        Left = 17
        Top = 299
        Width = 49
        Height = 21
        DataField = 'CD_EXPORTADOR'
        DataSource = dsProcesso
        TabOrder = 15
        OnChange = btnConsultaExportadorClick
        OnExit = dbedtCodigoExportadorExit
        OnKeyDown = mskCodigoUnidadeKeyDown
      end
      object edtNomeExportador: TEdit
        Left = 66
        Top = 299
        Width = 335
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 16
      end
      object edtCodigoCliente: TEdit
        Left = 18
        Top = 105
        Width = 48
        Height = 21
        MaxLength = 5
        TabOrder = 4
        OnChange = btnConsultaClienteClick
        OnExit = dbedtCodigoClienteExit
        OnKeyDown = mskCodigoUnidadeKeyDown
        OnKeyPress = edtCodigoClienteKeyPress
      end
    end
    object tsDadosBasicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      ImageIndex = 2
      object bvlDadosBasicos: TBevel
        Left = 0
        Top = 0
        Width = 734
        Height = 403
        Align = alClient
        Shape = bsFrame
      end
      object lblNrPedido1: TLabel
        Left = 9
        Top = 48
        Width = 61
        Height = 13
        Caption = 'Nr. Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNrProcesso1: TLabel
        Left = 119
        Top = 48
        Width = 53
        Height = 13
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblContato: TLabel
        Left = 9
        Top = 88
        Width = 45
        Height = 13
        Caption = 'Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaContato: TSpeedButton
        Left = 335
        Top = 100
        Width = 25
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaContatoClick
      end
      object lblAnalista: TLabel
        Left = 9
        Top = 128
        Width = 85
        Height = 13
        Caption = 'Analista Indai'#225
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaAnalista: TSpeedButton
        Left = 335
        Top = 141
        Width = 25
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaAnalistaClick
      end
      object lblTipoPedido: TLabel
        Left = 9
        Top = 206
        Width = 87
        Height = 13
        Caption = 'Tipo de Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNrOrdem: TLabel
        Left = 9
        Top = 246
        Width = 76
        Height = 13
        Caption = 'Nr. de Ordem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblIncoterm: TLabel
        Left = 9
        Top = 167
        Width = 50
        Height = 13
        Caption = 'Incoterm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object shpDadosBasicos: TShape
        Left = 369
        Top = 42
        Width = 355
        Height = 347
        Brush.Color = clBtnFace
        Pen.Color = clGray
      end
      object lblLocalDesembarque: TLabel
        Left = 378
        Top = 88
        Width = 131
        Height = 13
        Caption = 'Local de Desembarque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaLocalDesembarque: TSpeedButton
        Left = 689
        Top = 101
        Width = 25
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaLocalDesembarqueClick
      end
      object lblEmbarcacao: TLabel
        Left = 378
        Top = 128
        Width = 34
        Height = 13
        Caption = 'Navio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaEmbarcacao: TSpeedButton
        Left = 689
        Top = 141
        Width = 25
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaEmbarcacaoClick
      end
      object lblNrViagem: TLabel
        Left = 378
        Top = 206
        Width = 42
        Height = 13
        Caption = 'Viagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaNrViagem: TSpeedButton
        Left = 430
        Top = 219
        Width = 25
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaNrViagemClick
      end
      object lblNrVoo: TLabel
        Left = 378
        Top = 245
        Width = 62
        Height = 13
        Caption = 'Nr. do V'#244'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNrConhecimento: TLabel
        Left = 378
        Top = 324
        Width = 55
        Height = 13
        Caption = 'Nr. do BL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object shpDadosIguaisItem: TShape
        Left = 369
        Top = 8
        Width = 355
        Height = 36
        Brush.Color = clBtnFace
        Pen.Color = clGray
      end
      object lblNomeUnidade: TLabel
        Left = 9
        Top = 8
        Width = 48
        Height = 13
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeProduto: TLabel
        Left = 121
        Top = 8
        Width = 45
        Height = 13
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDataAbertura1: TLabel
        Left = 232
        Top = 48
        Width = 80
        Height = 13
        Caption = 'Data Abertura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblAgenteCarga: TLabel
        Left = 378
        Top = 167
        Width = 96
        Height = 13
        Caption = 'Agente de Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaAgenteCarga: TSpeedButton
        Left = 689
        Top = 180
        Width = 25
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaAgenteCargaClick
      end
      object lblNrCourrier: TLabel
        Left = 378
        Top = 285
        Width = 84
        Height = 13
        Caption = 'Nr. do Courrier'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDataPedido1: TLabel
        Left = 232
        Top = 7
        Width = 66
        Height = 13
        Caption = 'Modalidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNrRefExportador: TLabel
        Left = 9
        Top = 286
        Width = 111
        Height = 13
        Caption = 'Nr. Ref. Exportador'
        FocusControl = dbedtNrRefExportador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPaisOrigem: TLabel
        Left = 378
        Top = 49
        Width = 88
        Height = 13
        Caption = 'Pa'#237's de Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaPaisOrigem: TSpeedButton
        Left = 689
        Top = 62
        Width = 25
        Height = 23
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnConsultaPaisOrigemClick
      end
      object dbedtNrPedido: TDBEdit
        Left = 9
        Top = 62
        Width = 105
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NR_REFERENCIA'
        DataSource = dsProcesso
        ReadOnly = True
        TabOrder = 3
      end
      object dbedtNrProcesso: TDBEdit
        Left = 120
        Top = 62
        Width = 105
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'calcNrProcesso'
        DataSource = dsProcesso
        ReadOnly = True
        TabOrder = 4
      end
      object edtNomeContato: TEdit
        Left = 58
        Top = 102
        Width = 275
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 27
      end
      object edtNomeAnalista: TEdit
        Left = 58
        Top = 142
        Width = 275
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 29
      end
      object dblckTipoPedido: TDBLookupComboBox
        Left = 9
        Top = 220
        Width = 126
        Height = 21
        DataField = 'CD_TP_PEDIDO'
        DataSource = dsProcesso
        DropDownWidth = 200
        KeyField = 'CD_PEDIDO'
        ListField = 'NM_PEDIDO'
        ListSource = dsTipoPedido
        TabOrder = 9
      end
      object dbedtNrOrdem: TDBEdit
        Left = 9
        Top = 260
        Width = 127
        Height = 21
        DataField = 'NR_ORDEM'
        DataSource = dsProcesso
        TabOrder = 10
      end
      object dblckIncoterm: TDBLookupComboBox
        Left = 9
        Top = 181
        Width = 126
        Height = 21
        DataField = 'CD_INCOTERM'
        DataSource = dsProcesso
        DropDownWidth = 200
        KeyField = 'CODIGO'
        ListField = 'CODIGO;DESCRICAO'
        ListSource = dsIncoterm
        TabOrder = 8
      end
      object dbedtCodigoContato: TDBEdit
        Left = 9
        Top = 102
        Width = 50
        Height = 21
        DataField = 'CD_ANALISTA_CLIENTE'
        DataSource = dsProcesso
        TabOrder = 6
        OnChange = btnConsultaContatoClick
        OnExit = dbedtCodigoContatoExit
        OnKeyDown = mskCodigoUnidadeKeyDown
      end
      object dbedtCodigoAnalista: TDBEdit
        Left = 9
        Top = 142
        Width = 50
        Height = 21
        DataField = 'CD_ANALISTA_COMISSARIA'
        DataSource = dsProcesso
        TabOrder = 7
        OnChange = btnConsultaAnalistaClick
        OnExit = dbedtCodigoAnalistaExit
        OnKeyDown = mskCodigoUnidadeKeyDown
      end
      object edtNomeLocalDesembarque: TEdit
        Left = 427
        Top = 102
        Width = 260
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 25
      end
      object edtNomeEmbarcacao: TEdit
        Left = 427
        Top = 142
        Width = 260
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 26
      end
      object dbedtNrViagem: TDBEdit
        Left = 378
        Top = 220
        Width = 50
        Height = 21
        DataField = 'NR_VIAGEM'
        DataSource = dsProcesso
        TabOrder = 17
        OnExit = dbedtNrViagemExit
        OnKeyDown = mskCodigoUnidadeKeyDown
      end
      object dbedtNrVoo: TDBEdit
        Left = 378
        Top = 259
        Width = 175
        Height = 21
        DataField = 'NR_VOO'
        DataSource = dsProcesso
        TabOrder = 18
      end
      object dbedtNrConhecimento: TDBEdit
        Left = 378
        Top = 338
        Width = 175
        Height = 21
        DataField = 'NR_CONHECIMENTO'
        DataSource = dsProcesso
        TabOrder = 20
      end
      object dbedtCodigoLocalDesembarque: TDBEdit
        Left = 378
        Top = 102
        Width = 50
        Height = 21
        DataField = 'CD_LOCAL_DESEMBARQUE'
        DataSource = dsProcesso
        TabOrder = 14
        OnChange = btnConsultaLocalDesembarqueClick
        OnExit = dbedtCodigoLocalDesembarqueExit
        OnKeyDown = mskCodigoUnidadeKeyDown
      end
      object dbedtCodigoEmbarcacao: TDBEdit
        Left = 378
        Top = 142
        Width = 50
        Height = 21
        DataField = 'CD_EMBARCACAO'
        DataSource = dsProcesso
        TabOrder = 15
        OnChange = btnConsultaEmbarcacaoClick
        OnExit = dbedtCodigoEmbarcacaoExit
        OnKeyDown = mskCodigoUnidadeKeyDown
      end
      object dbedtNomeUnidade: TDBEdit
        Left = 9
        Top = 22
        Width = 105
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'calcNomeUnidade'
        DataSource = dsProcesso
        ReadOnly = True
        TabOrder = 0
      end
      object dbedtNomeProduto: TDBEdit
        Left = 121
        Top = 22
        Width = 105
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'calcNomeProduto'
        DataSource = dsProcesso
        TabOrder = 1
      end
      object dbedtDataAbertura: TDBEdit
        Left = 232
        Top = 62
        Width = 125
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'DT_ABERTURA'
        DataSource = dsProcesso
        ReadOnly = True
        TabOrder = 5
      end
      object edtNomeAgenteCarga: TEdit
        Left = 427
        Top = 181
        Width = 260
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 28
      end
      object dbedtNrCourrier: TDBEdit
        Left = 378
        Top = 299
        Width = 175
        Height = 21
        DataField = 'NR_COURRIER'
        DataSource = dsProcesso
        TabOrder = 19
      end
      object dbchkInConsolidado: TDBCheckBox
        Left = 493
        Top = 366
        Width = 110
        Height = 17
        Caption = 'Consolidado'
        DataField = 'IN_CONSOLIDADO'
        DataSource = dsProcesso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 22
        ValueChecked = '1'
        ValueUnchecked = '0'
        Visible = False
      end
      object dbchkInUrgente: TDBCheckBox
        Left = 378
        Top = 366
        Width = 110
        Height = 17
        Caption = 'Urgente'
        DataField = 'IN_URGENTE'
        DataSource = dsProcesso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 21
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchkInSeguro: TDBCheckBox
        Left = 608
        Top = 366
        Width = 110
        Height = 17
        Caption = 'Seguro/Hermes'
        DataField = 'IN_SEGURO'
        DataSource = dsProcesso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 23
        ValueChecked = '1'
        ValueUnchecked = '0'
        Visible = False
      end
      object dbchkInDadosIguaisItem: TDBCheckBox
        Left = 378
        Top = 18
        Width = 220
        Height = 17
        Caption = 'Dados Iguais nos Itens do Pedido?'
        DataField = 'IN_DADOS_IGUAIS_ITENS'
        DataSource = dsProcesso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 24
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = dbchkInDadosIguaisItemClick
      end
      object dbedtDataPedido: TDBEdit
        Left = 232
        Top = 21
        Width = 125
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'calcModalidade'
        DataSource = dsProcesso
        ReadOnly = True
        TabOrder = 2
      end
      object dbedtNrRefExportador: TDBEdit
        Left = 9
        Top = 300
        Width = 127
        Height = 21
        DataField = 'NR_REF_EXPORTADOR'
        DataSource = dsProcesso
        TabOrder = 11
      end
      object edtNmPaisOrigem: TEdit
        Left = 427
        Top = 63
        Width = 260
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 30
      end
      object dbedtCodigoAgenteCarga: TDBEdit
        Left = 378
        Top = 181
        Width = 50
        Height = 21
        DataField = 'CD_AGENTE'
        DataSource = dsProcesso
        TabOrder = 16
        OnChange = btnConsultaAgenteCargaClick
        OnExit = dbedtCodigoAgenteCargaExit
        OnKeyDown = mskCodigoUnidadeKeyDown
      end
      object dbedtCodPaisOrigem: TDBEdit
        Left = 378
        Top = 63
        Width = 50
        Height = 21
        DataField = 'CD_PAIS_ORIGEM'
        DataSource = dsProcesso
        TabOrder = 13
        OnChange = btnConsultaPaisOrigemClick
        OnExit = dbedtCodPaisOrigemExit
        OnKeyDown = mskCodigoUnidadeKeyDown
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 326
        Width = 352
        Height = 65
        Caption = 'Condi'#231#227'o de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        object Label12: TLabel
          Left = 9
          Top = 20
          Width = 60
          Height = 13
          Caption = 'Condi'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 74
          Top = 39
          Width = 57
          Height = 13
          Caption = 'dias do(a)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BtnLimpaCondicao: TSpeedButton
          Left = 315
          Top = 34
          Width = 23
          Height = 21
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          OnClick = BtnLimpaCondicaoClick
        end
        object CmbCondicao: TRxDBComboBox
          Left = 10
          Top = 36
          Width = 57
          Height = 21
          Style = csDropDownList
          DataField = 'DIAS_CONDICAO_PAGTO'
          DataSource = dsProcesso
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '10'
            '15'
            '30'
            '45'
            '60'
            '75'
            '90'
            '120'
            '180'
            '240')
          TabOrder = 0
          Values.Strings = (
            '10'
            '15'
            '30'
            '45'
            '60'
            '75'
            '90'
            '120'
            '180'
            '240')
        end
        object CmbCondicaoTipo: TRxDBComboBox
          Left = 144
          Top = 35
          Width = 169
          Height = 21
          Style = csDropDownList
          DataField = 'CONDICAO_PAGTO'
          DataSource = dsProcesso
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'INVOICE Especial'
            'Registro da DI'
            'Conhecimento Embarque'
            'INVOICE'
            'PROFORMA'
            'ANTECIPADO'
            'A Vista'
            'SEM COBERTURA CAMBIAL')
          TabOrder = 1
          Values.Strings = (
            'E'
            'R'
            'C'
            'I'
            'P'
            'A'
            'V'
            'S')
        end
      end
    end
    object tsPedidoItem: TTabSheet
      Caption = 'Itens'
      ImageIndex = 3
      object pgctrlItem: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 403
        ActivePage = tsAnalise
        Align = alClient
        Style = tsButtons
        TabOrder = 0
        object tsAnalise: TTabSheet
          Caption = 'Lista'
          ImageIndex = 1
          object Label15: TLabel
            Left = 320
            Top = 1
            Width = 3
            Height = 13
          end
          object dbgrdNecessitaLI: TDBGrid
            Left = 0
            Top = 0
            Width = 726
            Height = 217
            Align = alTop
            DataSource = dsPoItem
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = dbgrdNecessitaLIDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'NR_ITEM_CLIENTE'
                Title.Caption = 'Item Cliente'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_MERCADORIA'
                Title.Caption = 'Part Number'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calcMercadoria'
                Title.Caption = 'Mercadoria'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 290
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_NCM_SH'
                Title.Caption = 'NCM/SH'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 80
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'calcNecessitaLI'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGreen
                Font.Height = -15
                Font.Name = 'Wingdings'
                Font.Style = []
                Title.Caption = 'Incide LI'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 60
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'calcHabilitaDrawBack'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGreen
                Font.Height = -15
                Font.Name = 'Wingdings'
                Font.Style = []
                Title.Caption = 'Habilitar DrawBack'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QT_INICIAL'
                Title.Caption = 'Qtd. Dispon'#237'vel'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindow
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end>
          end
          object Panel1: TPanel
            Left = 0
            Top = 238
            Width = 726
            Height = 18
            Align = alTop
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Label3: TLabel
              Left = 33
              Top = 3
              Width = 20
              Height = 13
              Caption = 'Alt.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 103
              Top = 3
              Width = 80
              Height = 13
              Caption = 'Data Abertura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 316
              Top = 3
              Width = 78
              Height = 13
              Caption = 'Desembara'#231'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 515
              Top = 3
              Width = 92
              Height = 13
              Caption = 'Qtd. Embarcada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 193
              Top = 3
              Width = 107
              Height = 13
              Caption = 'Instru'#231#227'o Desemb.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 56
              Top = 3
              Width = 29
              Height = 13
              Caption = 'Excl.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 415
              Top = 3
              Width = 43
              Height = 13
              Caption = 'Invoice'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label13: TLabel
              Left = 639
              Top = 3
              Width = 63
              Height = 13
              Caption = 'Valor Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object PnlBaixa: TPanel
            Left = 168
            Top = 27
            Width = 387
            Height = 145
            BevelInner = bvRaised
            TabOrder = 2
            Visible = False
            object lbl_ct_gerencial: TLabel
              Left = 247
              Top = 35
              Width = 105
              Height = 13
              Caption = 'Qtd. a ser baixada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btnSalvarEtapa: TSpeedButton
              Left = 220
              Top = 108
              Width = 77
              Height = 26
              Hint = 'Salvar'
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
              OnClick = btnSalvarEtapaClick
            end
            object btnCancelarEtapa: TSpeedButton
              Left = 300
              Top = 108
              Width = 77
              Height = 26
              Hint = 'Cancelar'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
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
              OnClick = btnCancelarEtapaClick
            end
            object shp46: TShape
              Left = 2
              Top = 2
              Width = 383
              Height = 21
              Align = alTop
              Brush.Color = clGray
              Pen.Color = clGray
            end
            object lblTitulo: TLabel
              Left = 8
              Top = 6
              Width = 75
              Height = 13
              Alignment = taCenter
              Caption = 'Baixa Parcial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label8: TLabel
              Left = 14
              Top = 35
              Width = 90
              Height = 13
              Caption = 'Invoice N'#250'mero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 138
              Top = 35
              Width = 86
              Height = 13
              Caption = 'Data da Fatura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EditQTD: TEdit
              Left = 247
              Top = 53
              Width = 105
              Height = 21
              TabOrder = 2
              OnKeyPress = EditQTDKeyPress
            end
            object EditInvoiceNumeroParcial: TEdit
              Left = 14
              Top = 53
              Width = 119
              Height = 21
              MaxLength = 50
              TabOrder = 0
            end
            object EditDtFatura: TDateEdit
              Left = 138
              Top = 53
              Width = 96
              Height = 21
              NumGlyphs = 2
              TabOrder = 1
            end
          end
          object DBCtrlGrid1: TDBCtrlGrid
            Left = 0
            Top = 256
            Width = 726
            Height = 175
            Align = alTop
            DataSource = dtsPoItemParciais
            PanelBorder = gbNone
            PanelHeight = 25
            PanelWidth = 710
            TabOrder = 3
            RowCount = 7
            object DBText1: TDBText
              Left = 103
              Top = 5
              Width = 82
              Height = 17
              DataField = 'DT_ABERTURA_ITEM'
              DataSource = dtsPoItemParciais
            end
            object DBText2: TDBText
              Left = 317
              Top = 5
              Width = 119
              Height = 17
              DataField = 'NR_PROCESSO_DES'
              DataSource = dtsPoItemParciais
            end
            object DBText3: TDBText
              Left = 497
              Top = 5
              Width = 107
              Height = 17
              Alignment = taRightJustify
              DataField = 'QT_INICIAL'
              DataSource = dtsPoItemParciais
            end
            object Image1: TImage
              Left = 57
              Top = 4
              Width = 17
              Height = 16
              Cursor = crHandPoint
              Picture.Data = {
                07544269746D617076010000424D760100000000000076000000280000002000
                000010000000010004000000000000010000130B0000130B0000100000000000
                0000000000000000800000800000008080008000000080008000808000007F7F
                7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00333333333333333333333333333333333333333333333333333FFF33FF33
                3FFF339993370733999333777FF37FF377733339993000399933333777F777F7
                773333339997079993333333777F737773333333399939993333333337773777
                33333333339909933333333333737F73333333333331013333333333333777FF
                3333333333910193333333333337773FF3333333399000993333333337377737
                FF3333339990009993333333773777377FF333399930003999333337773777F7
                77FF339993370733999333777333733377733333333333333333333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333}
              Transparent = True
              OnClick = Image1Click
            end
            object Shape3: TShape
              Left = 0
              Top = 24
              Width = 710
              Height = 1
              Align = alBottom
              Pen.Color = clGray
            end
            object DBText4: TDBText
              Left = 0
              Top = 5
              Width = 20
              Height = 17
              DataField = 'NR_PARCIAL'
              DataSource = dtsPoItemParciais
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText5: TDBText
              Left = 193
              Top = 5
              Width = 82
              Height = 17
              DataField = 'ID_CODIGO_INSTR_DESEMB'
              DataSource = dtsPoItemParciais
            end
            object Image2: TImage
              Left = 34
              Top = 4
              Width = 17
              Height = 16
              Cursor = crHandPoint
              Picture.Data = {
                07544269746D617076010000424D760100000000000076000000280000002000
                000010000000010004000000000000010000120B0000120B0000100000000000
                0000000000000000800000800000008080008000000080008000808000007F7F
                7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00555555555555555555555555555555555555555555555555555555555555
                5555555555555555555555555555555555555555555555555555555FFFFFFFFF
                F55555000000000055555577777777775F55500B8B8B8B8B05555775F5555555
                75F550F0B8B8B8B8B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFF
                FF7F50FBF0000000000557F557777777777550BFBFBFBFB0555557F555555557
                F55550FBFBFBFBF0555557F555555FF7555550BFBFBF00055555575F55557775
                5555550BFBF0555555555575FFF7555555555570000755555555555777755555
                5555555555555555555555555555555555555555555555555555555555555555
                5555}
              Transparent = True
              OnClick = Image2Click
            end
            object DBText6: TDBText
              Left = 415
              Top = 5
              Width = 88
              Height = 17
              DataField = 'NR_FATURA'
              DataSource = dtsPoItemParciais
            end
            object DBText7: TDBText
              Left = 610
              Top = 5
              Width = 90
              Height = 17
              Alignment = taRightJustify
              DataField = 'VL_TOTAL'
              DataSource = dtsPoItemParciais
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 217
            Width = 726
            Height = 21
            Align = alTop
            Alignment = taLeftJustify
            Caption = '  Parciais'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
          end
        end
        object tsGestao: TTabSheet
          Caption = 'Dados'
          object bvlGestaoItem: TBevel
            Left = 0
            Top = 0
            Width = 726
            Height = 372
            Align = alClient
            Shape = bsFrame
            Style = bsRaised
          end
          object shp10: TShape
            Left = 396
            Top = 8
            Width = 323
            Height = 357
            Brush.Color = clBtnFace
            Pen.Color = clGray
          end
          object lblLocalDesembarqueItem: TLabel
            Left = 406
            Top = 48
            Width = 131
            Height = 13
            Alignment = taRightJustify
            Caption = 'Local de Desembarque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnConsultaLocalDesembarqueItem: TSpeedButton
            Left = 683
            Top = 60
            Width = 25
            Height = 23
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
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
            OnClick = btnConsultaLocalDesembarqueItemClick
          end
          object lblEmbarcacaoItem: TLabel
            Left = 406
            Top = 86
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Navio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnConsultaEmbarcacaoItem: TSpeedButton
            Left = 683
            Top = 98
            Width = 25
            Height = 23
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
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
            OnClick = btnConsultaEmbarcacaoItemClick
          end
          object lblNrViagemItem: TLabel
            Left = 406
            Top = 161
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Viagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnConsultaNrViagemItem: TSpeedButton
            Left = 458
            Top = 173
            Width = 25
            Height = 23
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
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
            OnClick = btnConsultaNrViagemItemClick
          end
          object lblNrVooItem: TLabel
            Left = 406
            Top = 198
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nr V'#244'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblNrConhecimentoItem: TLabel
            Left = 406
            Top = 236
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nr. do BL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblAreaItem: TLabel
            Left = 105
            Top = 10
            Width = 27
            Height = 13
            Caption = #193'rea'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object btnConsultaAreaItem: TSpeedButton
            Left = 356
            Top = 23
            Width = 25
            Height = 23
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
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
            ParentFont = False
            OnClick = btnConsultaAreaItemClick
          end
          object lblNrItemAnalise: TLabel
            Left = 8
            Top = 10
            Width = 68
            Height = 13
            Caption = 'Item Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPartNumber: TLabel
            Left = 8
            Top = 53
            Width = 64
            Height = 13
            Caption = 'Mercadoria'
            FocusControl = dbedtNrItemCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnConsultaMercadoria: TSpeedButton
            Left = 356
            Top = 66
            Width = 25
            Height = 23
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
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
            OnClick = btnConsultaMercadoriaClick
          end
          object lblEmbalagem: TLabel
            Left = 8
            Top = 99
            Width = 51
            Height = 13
            Caption = 'NCM/SH'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblQuantidade: TLabel
            Left = 8
            Top = 142
            Width = 66
            Height = 13
            Caption = 'Quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblTipoCalculo: TLabel
            Left = 8
            Top = 227
            Width = 72
            Height = 13
            Caption = 'Tipo C'#225'lculo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblAgenteCargaItem: TLabel
            Left = 406
            Top = 123
            Width = 96
            Height = 13
            Caption = 'Agente de Carga'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnConsultaAgenteCargaItem: TSpeedButton
            Left = 683
            Top = 135
            Width = 25
            Height = 23
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
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
            OnClick = btnConsultaAgenteCargaItemClick
          end
          object lblNrCourrierItem: TLabel
            Left = 406
            Top = 273
            Width = 84
            Height = 13
            Caption = 'Nr. do Courrier'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblValorUnitario: TLabel
            Left = 199
            Top = 184
            Width = 78
            Height = 13
            Caption = 'Valor Unit'#225'rio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblValorItem: TLabel
            Left = 294
            Top = 184
            Width = 76
            Height = 13
            Caption = 'Valor do Item'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnRepassaItens: TSpeedButton
            Left = 603
            Top = 337
            Width = 113
            Height = 25
            Caption = 'Copiar do Pedido'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
              333333333333337FF3333333333333903333333333333377FF33333333333399
              03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
              99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
              99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
              03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
              33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
              33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
              3333777777333333333333333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = btnRepassaItensClick
          end
          object lblUnidMedida: TLabel
            Left = 130
            Top = 141
            Width = 111
            Height = 13
            Caption = 'Unidade de Medida'
            FocusControl = dbedtCodigoUnidMed
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnConsultaUnidMed: TSpeedButton
            Left = 356
            Top = 154
            Width = 25
            Height = 23
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
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
            ParentFont = False
            OnClick = btnConsultaUnidMedClick
          end
          object lblNumeroInvoice: TLabel
            Left = 170
            Top = 227
            Width = 90
            Height = 13
            Caption = 'Invoice Numero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblCodMercFornec: TLabel
            Left = 170
            Top = 273
            Width = 149
            Height = 13
            Caption = 'C'#243'd. Merc. no Fornecedor'
            FocusControl = dbedtCodMercFornec
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 8
            Top = 183
            Width = 39
            Height = 13
            Caption = 'Moeda'
            FocusControl = dbedt_moeda_negociada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_moeda_negociada: TSpeedButton
            Left = 165
            Top = 196
            Width = 25
            Height = 23
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
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
            ParentFont = False
            OnClick = btn_moeda_negociadaClick
          end
          object lblPaisOrigemItem: TLabel
            Left = 406
            Top = 11
            Width = 88
            Height = 13
            Caption = 'Pa'#237's de Origem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnConsultaPaisOrigemItem: TSpeedButton
            Left = 683
            Top = 23
            Width = 25
            Height = 23
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
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
            ParentFont = False
            OnClick = btnConsultaPaisOrigemItemClick
          end
          object lbl_fabricante: TLabel
            Left = 170
            Top = 315
            Width = 61
            Height = 13
            Caption = 'Fabricante'
            FocusControl = dbedt_fabricante
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_nm_fabric: TSpeedButton
            Left = 365
            Top = 332
            Width = 26
            Height = 22
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
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
            OnClick = btn_co_nm_fabricClick
          end
          object edtNomeLocalDesembarqueItem: TEdit
            Left = 456
            Top = 61
            Width = 225
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 27
          end
          object edtNomeEmbarcacaoItem: TEdit
            Left = 456
            Top = 99
            Width = 225
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 29
          end
          object dbedtNrVooItem: TDBEdit
            Left = 406
            Top = 211
            Width = 181
            Height = 21
            DataField = 'NR_VOO'
            DataSource = dsPoItem
            TabOrder = 20
          end
          object dbedtNrConhecimentoItem: TDBEdit
            Left = 406
            Top = 249
            Width = 181
            Height = 21
            DataField = 'NR_CONHECIMENTO'
            DataSource = dsPoItem
            TabOrder = 21
          end
          object dbchkInUrgenteItem: TDBCheckBox
            Left = 406
            Top = 314
            Width = 113
            Height = 17
            Caption = 'Urgente'
            DataField = 'IN_URGENTE'
            DataSource = dsPoItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 23
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object edtNomeAreaItem: TEdit
            Left = 154
            Top = 24
            Width = 200
            Height = 21
            TabStop = False
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 26
          end
          object dbedtNrItemCliente: TDBEdit
            Left = 8
            Top = 24
            Width = 91
            Height = 21
            Color = clMenu
            DataField = 'NR_ITEM_CLIENTE'
            DataSource = dsPoItem
            ReadOnly = True
            TabOrder = 0
            OnExit = dbedtNrItemClienteExit
            OnKeyPress = dbedtNrItemClienteKeyPress
          end
          object dbedtCodigoNcmSh: TDBEdit
            Left = 8
            Top = 113
            Width = 115
            Height = 21
            DataField = 'CD_NCM_SH'
            DataSource = dsPoItem
            Enabled = False
            MaxLength = 4
            TabOrder = 3
          end
          object dbchkIncideLI: TDBCheckBox
            Left = 131
            Top = 114
            Width = 115
            Height = 17
            Caption = 'Necessita de LI'
            DataField = 'IN_NECESSITA_LI'
            DataSource = dsPoItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbedtQtdeMercadoria: TDBEdit
            Left = 8
            Top = 155
            Width = 115
            Height = 21
            DataField = 'QT_INICIAL'
            DataSource = dsPoItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 17
            ParentFont = False
            TabOrder = 5
            OnEnter = dbedtQtdeMercadoriaEnter
            OnExit = dbedtQtdeMercadoriaExit
          end
          object dblckTipoCalculoItem: TDBLookupComboBox
            Left = 8
            Top = 241
            Width = 155
            Height = 21
            DataField = 'TP_CALCULO'
            DataSource = dsPoItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyField = 'CD_TIPO_CALCULO_ITEM'
            ListField = 'DESCRICAO'
            ListSource = dsTipoCalculoItem
            ParentFont = False
            TabOrder = 10
            OnClick = dblckTipoCalculoItemClick
          end
          object edtNomeAgenteCargaItem: TEdit
            Left = 456
            Top = 136
            Width = 225
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 30
          end
          object dbedtNrCourrierItem: TDBEdit
            Left = 406
            Top = 286
            Width = 181
            Height = 21
            DataField = 'NR_COURRIER'
            DataSource = dsPoItem
            TabOrder = 22
          end
          object edtApelidoMercadoria: TEdit
            Left = 98
            Top = 67
            Width = 256
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 28
          end
          object dbedtNrViagemItem: TDBEdit
            Left = 406
            Top = 174
            Width = 50
            Height = 21
            DataField = 'NR_VIAGEM'
            DataSource = dsPoItem
            TabOrder = 19
            OnExit = dbedtNrViagemItemExit
            OnKeyDown = mskCodigoUnidadeKeyDown
          end
          object dbedtValorUnitario: TDBEdit
            Left = 198
            Top = 197
            Width = 89
            Height = 21
            DataField = 'VL_UNITARIO'
            DataSource = dsPoItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            OnEnter = dbedtValorUnitarioEnter
            OnExit = dbedtValorUnitarioExit
          end
          object dbedtValorItem: TDBEdit
            Left = 294
            Top = 197
            Width = 89
            Height = 21
            TabStop = False
            DataField = 'VL_TOTAL'
            DataSource = dsPoItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
            OnEnter = dbedtValorItemEnter
          end
          object edtNomeUnidMed: TEdit
            Left = 172
            Top = 155
            Width = 182
            Height = 21
            TabStop = False
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 31
          end
          object dbedtNrFatura: TDBEdit
            Left = 170
            Top = 241
            Width = 95
            Height = 21
            DataField = 'NR_FATURA'
            DataSource = dsPoItem
            TabOrder = 11
          end
          object dbrgTpDrawback: TDBRadioGroup
            Left = 8
            Top = 276
            Width = 155
            Height = 86
            Caption = 'Drawback'
            DataField = 'TP_DRAWBACK'
            DataSource = dsPoItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Items.Strings = (
              'Nenhum'
              'Isen'#231#227'o'
              'Suspen'#231#227'o')
            ParentFont = False
            TabOrder = 12
            Values.Strings = (
              '0'
              '1'
              '2')
          end
          object dbedtCodMercFornec: TDBEdit
            Left = 170
            Top = 287
            Width = 185
            Height = 21
            DataField = 'CD_MERC_FORNEC'
            DataSource = dsPoItem
            TabOrder = 13
          end
          object edt_moeda_negociada: TEdit
            Left = 50
            Top = 197
            Width = 113
            Height = 21
            TabStop = False
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 32
          end
          object edtNmPaisOrigemItem: TEdit
            Left = 456
            Top = 24
            Width = 225
            Height = 21
            TabStop = False
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 33
          end
          object dbchkInConsolidadoItem: TDBCheckBox
            Left = 506
            Top = 314
            Width = 110
            Height = 17
            Caption = 'Consolidado'
            DataField = 'IN_CONSOLIDADO'
            DataSource = dsPoItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 24
            ValueChecked = '1'
            ValueUnchecked = '0'
            Visible = False
          end
          object dbchkInSeguroItem: TDBCheckBox
            Left = 606
            Top = 314
            Width = 110
            Height = 17
            Caption = 'Seguro/Hermes'
            DataField = 'IN_SEGURO'
            DataSource = dsPoItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 25
            ValueChecked = '1'
            ValueUnchecked = '0'
            Visible = False
          end
          object dbedtCodPaisOrigemItem: TDBEdit
            Left = 406
            Top = 24
            Width = 50
            Height = 21
            DataField = 'CD_PAIS_ORIGEM'
            DataSource = dsPoItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
            OnChange = btnConsultaPaisOrigemItemClick
            OnExit = dbedtCodPaisOrigemItemExit
            OnKeyDown = mskCodigoUnidadeKeyDown
          end
          object dbedtCodigoLocalDesembarqueItem: TDBEdit
            Left = 406
            Top = 61
            Width = 50
            Height = 21
            DataField = 'CD_LOCAL_DESEMBARQUE'
            DataSource = dsPoItem
            TabOrder = 16
            OnChange = btnConsultaLocalDesembarqueItemClick
            OnExit = dbedtCodigoLocalDesembarqueItemExit
            OnKeyDown = mskCodigoUnidadeKeyDown
          end
          object dbedtCodigoEmbarcacaoItem: TDBEdit
            Left = 406
            Top = 99
            Width = 50
            Height = 21
            DataField = 'CD_EMBARCACAO'
            DataSource = dsPoItem
            TabOrder = 17
            OnChange = btnConsultaEmbarcacaoItemClick
            OnExit = dbedtCodigoEmbarcacaoItemExit
            OnKeyDown = mskCodigoUnidadeKeyDown
          end
          object dbedtCodigoAgenteCargaItem: TDBEdit
            Left = 406
            Top = 136
            Width = 50
            Height = 21
            DataField = 'CD_AGENTE'
            DataSource = dsPoItem
            TabOrder = 18
            OnChange = btnConsultaAgenteCargaItemClick
            OnExit = dbedtCodigoAgenteCargaItemExit
            OnKeyDown = mskCodigoUnidadeKeyDown
          end
          object dbedtCodigoAreaItem: TDBEdit
            Left = 105
            Top = 24
            Width = 50
            Height = 21
            DataField = 'CD_AREA'
            DataSource = dsPoItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = btnConsultaAreaItemClick
            OnExit = dbedtCodigoAreaItemExit
            OnKeyDown = mskCodigoUnidadeKeyDown
          end
          object dbedtCodigoMercadoria: TDBEdit
            Left = 8
            Top = 67
            Width = 91
            Height = 21
            DataField = 'CD_MERCADORIA'
            DataSource = dsPoItem
            TabOrder = 2
            OnChange = btnConsultaMercadoriaClick
            OnExit = dbedtCodigoMercadoriaExit
            OnKeyDown = mskCodigoUnidadeKeyDown
          end
          object dbedtCodigoUnidMed: TDBEdit
            Left = 130
            Top = 155
            Width = 43
            Height = 21
            DataField = 'CD_UNID_MEDIDA'
            DataSource = dsPoItem
            TabOrder = 6
            OnChange = btnConsultaUnidMedClick
            OnExit = dbedtCodigoUnidMedExit
            OnKeyDown = mskCodigoUnidadeKeyDown
            OnKeyPress = dbedtCodigoUnidMedKeyPress
          end
          object dbedt_moeda_negociada: TDBEdit
            Left = 8
            Top = 197
            Width = 43
            Height = 21
            DataField = 'CD_MOEDA_NEGOCIADA'
            DataSource = dsPoItem
            TabOrder = 7
            OnChange = btn_moeda_negociadaClick
            OnExit = dbedt_moeda_negociadaExit
            OnKeyDown = mskCodigoUnidadeKeyDown
            OnKeyPress = dbedt_moeda_negociadaKeyPress
          end
          object dbedt_fabricante: TDBEdit
            Left = 170
            Top = 332
            Width = 54
            Height = 21
            DataField = 'CD_FABRICANTE'
            DataSource = dsPoItem
            TabOrder = 14
            OnChange = btn_co_nm_fabricClick
            OnExit = dbedt_fabricanteExit
            OnKeyDown = mskCodigoUnidadeKeyDown
          end
          object EditNmFabricante: TEdit
            Left = 225
            Top = 332
            Width = 141
            Height = 21
            TabStop = False
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 34
          end
          object dbchkdrawback: TDBCheckBox
            Left = 249
            Top = 114
            Width = 136
            Height = 17
            Caption = 'Habilitar Draw Back'
            DataField = 'IN_DRAWBACK'
            DataSource = dsPoItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 35
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
    end
    object tsIntegracao: TTabSheet
      Caption = 'Integra'#231#227'o Planilha SG'
      ImageIndex = 3
      TabVisible = False
      object Shape1: TShape
        Left = 24
        Top = 105
        Width = 686
        Height = 48
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lblSimbolo: TLabel
        Left = 229
        Top = 223
        Width = 275
        Height = 30
        Caption = '6         6'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clTeal
        Font.Height = -27
        Font.Name = 'Wingdings'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object btnExecuta: TSpeedButton
        Left = 598
        Top = 113
        Width = 105
        Height = 33
        Caption = 'Integrar'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
          FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
          00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
          F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
          00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
          F033777777777337F73309999990FFF0033377777777FFF77333099999000000
          3333777777777777333333399033333333333337773333333333333903333333
          3333333773333333333333303333333333333337333333333333}
        NumGlyphs = 2
        Spacing = 15
        OnClick = btnExecutaClick
      end
      object lbl1: TLabel
        Left = 23
        Top = 57
        Width = 296
        Height = 13
        Caption = 
          'Escolha o arquivo a ser integrado (ex.: c:\planilha\planilha.xls' +
          '):'
      end
      object btnDialog: TSpeedButton
        Left = 685
        Top = 72
        Width = 25
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        OnClick = btnDialogClick
      end
      object lblAviso: TLabel
        Left = 262
        Top = 230
        Width = 209
        Height = 16
        Caption = 'Integrando arquivo ... Aguarde!'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Shape2: TShape
        Left = 24
        Top = 25
        Width = 686
        Height = 24
        Brush.Color = clSilver
        Pen.Color = clGray
      end
      object Label2: TLabel
        Left = 30
        Top = 31
        Width = 289
        Height = 13
        Caption = 'Integra'#231#227'o de Planilhas da Saint Gobain Abrasives'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblStatus: TLabel
        Left = 40
        Top = 352
        Width = 3
        Height = 13
      end
      object btnSalvarLog: TSpeedButton
        Left = 648
        Top = 345
        Width = 49
        Height = 17
        Caption = 'Salvar'
        Flat = True
        OnClick = btnSalvarLogClick
      end
      object lstResultado: TListBox
        Left = 40
        Top = 171
        Width = 651
        Height = 171
        Ctl3D = False
        IntegralHeight = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 1
      end
      object edtPath: TEdit
        Left = 24
        Top = 72
        Width = 659
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object pbStatus: TProgressBar
        Left = 40
        Top = 368
        Width = 651
        Height = 16
        Step = 1
        TabOrder = 2
      end
    end
  end
  object mmGestaoPedido: TMainMenu
    Left = 635
    Top = 5
    object mniIncluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      OnClick = btnIncluirClick
    end
    object mniSalvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = btnSalvarClick
    end
    object mniCancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      OnClick = btnCancelarClick
    end
    object mniExcluir: TMenuItem
      Caption = '&Excluir'
      Enabled = False
      Visible = False
      OnClick = btnExcluirClick
    end
    object mniProcRealiza: TMenuItem
      Caption = 'Realiza'#231#227'o por &Processo'
      Enabled = False
      OnClick = btnProcRealizaClick
    end
    object mniManutPedido: TMenuItem
      Caption = '&Manuten'#231#227'o da PO'
      Enabled = False
      OnClick = btnManutPedidoClick
    end
    object mniSair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btnSairClick
    end
  end
  object dsPo: TDataSource
    DataSet = qryPo
    Left = 142
    Top = 397
  end
  object dsProcesso: TDataSource
    DataSet = qryProcesso
    OnStateChange = dsProcessoStateChange
    Left = 109
    Top = 397
  end
  object qryPo: TQuery
    CachedUpdates = True
    AfterPost = qryProcessoAfterPost
    AfterDelete = qryProcessoAfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_IMPORTADOR, CD_EXPORTADOR, CD_VIA_TRANSP,' +
        ' CD_PAIS_ORIGEM,'
      
        '  CD_INCOTERM, CD_AREA, CD_LOCAL_DESEMBARQUE, NR_DOC_HOUSE, NR_O' +
        'RDEM, IN_SEGURO,'
      
        '  DT_ABERTURA, NR_VIAGEM, CD_SERVICO, CD_PAIS_AQUISICAO, CD_FABR' +
        'ICANTE, IN_FABR_EXPOR_IMP,'
      '  CD_EMPRESA'
      'FROM TPO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND CD_EMPRESA = :CD_EMPRESA')
    UpdateObject = updPo
    Left = 140
    Top = 409
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
      end>
    object qryPoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryPoCD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'DBBROKER.TPO.CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qryPoCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'DBBROKER.TPO.CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qryPoCD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'DBBROKER.TPO.CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qryPoCD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'DBBROKER.TPO.CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qryPoCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'DBBROKER.TPO.CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qryPoCD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'DBBROKER.TPO.CD_AREA'
      FixedChar = True
      Size = 2
    end
    object qryPoCD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'DBBROKER.TPO.CD_LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qryPoNR_DOC_HOUSE: TStringField
      FieldName = 'NR_DOC_HOUSE'
      Origin = 'DBBROKER.TPO.NR_DOC_HOUSE'
      FixedChar = True
      Size = 30
    end
    object qryPoNR_ORDEM: TStringField
      FieldName = 'NR_ORDEM'
      Origin = 'DBBROKER.TPO.NR_ORDEM'
      FixedChar = True
      Size = 18
    end
    object qryPoIN_SEGURO: TStringField
      FieldName = 'IN_SEGURO'
      Origin = 'DBBROKER.TPO.IN_SEGURO'
      FixedChar = True
      Size = 1
    end
    object qryPoDT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'DBBROKER.TPO.DT_ABERTURA'
    end
    object qryPoCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'DBBROKER.TPO.CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qryPoNR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'DBBROKER.TPO.NR_VIAGEM'
      FixedChar = True
      Size = 4
    end
    object qryPoCD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'DBBROKER.TPO.CD_PAIS_AQUISICAO'
      FixedChar = True
      Size = 3
    end
    object qryPoCD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'DBBROKER.TPO.CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qryPoIN_FABR_EXPOR_IMP: TStringField
      FieldName = 'IN_FABR_EXPOR_IMP'
      Origin = 'DBBROKER.TPO.IN_FABR_EXPOR_IMP'
      FixedChar = True
      Size = 1
    end
    object qryPoCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TPO.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
  end
  object qryProcesso: TQuery
    CachedUpdates = True
    AfterPost = qryProcessoAfterPost
    AfterDelete = qryProcessoAfterDelete
    AfterScroll = qryProcessoAfterScroll
    OnCalcFields = qryProcessoCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      
        '  NR_PROCESSO, NR_REFERENCIA, CD_UNID_NEG, CD_PRODUTO, CD_CLIENT' +
        'E, CD_SERVICO, CD_USUARIO,'
      
        '  DT_ABERTURA, HR_ABERTURA, DT_PEDIDO, HR_PEDIDO, CD_IMPORTADOR,' +
        ' CD_EXPORTADOR, CD_AREA,'
      
        '  CD_ANALISTA_COMISSARIA, CD_ANALISTA_CLIENTE, CD_INCOTERM, NR_O' +
        'RDEM, NR_VOO, NR_VIAGEM,'
      
        '  CD_LOCAL_DESEMBARQUE, CD_EMBARCACAO, NR_CONHECIMENTO, CD_TP_PE' +
        'DIDO, IN_CANCELADO,'
      
        '  IN_LIBERADO, IN_CONSOLIDADO, IN_SEGURO, IN_URGENTE, IN_DADOS_I' +
        'GUAIS_ITENS, CD_GRUPO,'
      
        '  CD_AGENTE, NR_COURRIER, NR_REF_EXPORTADOR, CD_PAIS_ORIGEM, CD_' +
        'TERMO_PAGTO,'
      '  DIAS_CONDICAO_PAGTO, CONDICAO_PAGTO'
      'FROM TPROCESSO ( NOLOCK) '
      'WHERE NR_REFERENCIA = :NR_REFERENCIA'
      '  AND CD_CLIENTE = :CD_CLIENTE'
      '  AND CD_UNID_NEG   = :CD_UNID_NEG'
      '  AND CD_PRODUTO    = :CD_PRODUTO')
    UpdateObject = updProcesso
    Left = 110
    Top = 409
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_REFERENCIA'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
        Size = 2
      end>
    object qryProcessoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryProcessoNR_REFERENCIA: TStringField
      FieldName = 'NR_REFERENCIA'
      Origin = 'DBBROKER.TPROCESSO.NR_REFERENCIA'
      FixedChar = True
      Size = 18
    end
    object qryProcessoCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TPROCESSO.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qryProcessoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TPROCESSO.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryProcessoCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TPROCESSO.CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qryProcessoCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'DBBROKER.TPROCESSO.CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TPROCESSO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryProcessoDT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'DBBROKER.TPROCESSO.DT_ABERTURA'
    end
    object qryProcessoHR_ABERTURA: TDateTimeField
      FieldName = 'HR_ABERTURA'
      Origin = 'DBBROKER.TPROCESSO.HR_ABERTURA'
    end
    object qryProcessoDT_PEDIDO: TDateTimeField
      FieldName = 'DT_PEDIDO'
      Origin = 'DBBROKER.TPROCESSO.DT_PEDIDO'
    end
    object qryProcessoHR_PEDIDO: TDateTimeField
      FieldName = 'HR_PEDIDO'
      Origin = 'DBBROKER.TPROCESSO.HR_PEDIDO'
    end
    object qryProcessoCD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'DBBROKER.TPROCESSO.CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qryProcessoCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'DBBROKER.TPROCESSO.CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qryProcessoCD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'DBBROKER.TPROCESSO.CD_AREA'
      FixedChar = True
      Size = 2
    end
    object qryProcessoCD_ANALISTA_COMISSARIA: TStringField
      FieldName = 'CD_ANALISTA_COMISSARIA'
      Origin = 'DBBROKER.TPROCESSO.CD_ANALISTA_COMISSARIA'
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_ANALISTA_CLIENTE: TStringField
      FieldName = 'CD_ANALISTA_CLIENTE'
      Origin = 'DBBROKER.TPROCESSO.CD_ANALISTA_CLIENTE'
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'DBBROKER.TPROCESSO.CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qryProcessoNR_ORDEM: TStringField
      FieldName = 'NR_ORDEM'
      Origin = 'DBBROKER.TPROCESSO.NR_ORDEM'
      FixedChar = True
      Size = 30
    end
    object qryProcessoNR_VOO: TStringField
      FieldName = 'NR_VOO'
      Origin = 'DBBROKER.TPROCESSO.NR_VOO'
      FixedChar = True
      Size = 18
    end
    object qryProcessoNR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'DBBROKER.TPROCESSO.NR_VIAGEM'
      FixedChar = True
      Size = 15
    end
    object qryProcessoCD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'DBBROKER.TPROCESSO.CD_LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'DBBROKER.TPROCESSO.CD_EMBARCACAO'
      FixedChar = True
      Size = 4
    end
    object qryProcessoNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'DBBROKER.TPROCESSO.NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qryProcessoCD_TP_PEDIDO: TStringField
      FieldName = 'CD_TP_PEDIDO'
      Origin = 'DBBROKER.TPROCESSO.CD_TP_PEDIDO'
      FixedChar = True
      Size = 3
    end
    object qryProcessoIN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'DBBROKER.TPROCESSO.IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Origin = 'DBBROKER.TPROCESSO.IN_LIBERADO'
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_CONSOLIDADO: TStringField
      FieldName = 'IN_CONSOLIDADO'
      Origin = 'DBBROKER.TPROCESSO.IN_CONSOLIDADO'
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_SEGURO: TStringField
      FieldName = 'IN_SEGURO'
      Origin = 'DBBROKER.TPROCESSO.IN_SEGURO'
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_URGENTE: TStringField
      FieldName = 'IN_URGENTE'
      Origin = 'DBBROKER.TPROCESSO.IN_URGENTE'
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_DADOS_IGUAIS_ITENS: TStringField
      FieldName = 'IN_DADOS_IGUAIS_ITENS'
      Origin = 'DBBROKER.TPROCESSO.IN_DADOS_IGUAIS_ITENS'
      FixedChar = True
      Size = 1
    end
    object qryProcessoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TPROCESSO.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'DBBROKER.TPROCESSO.CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qryProcessoNR_COURRIER: TStringField
      FieldName = 'NR_COURRIER'
      Origin = 'DBBROKER.TPROCESSO.NR_COURRIER'
      FixedChar = True
      Size = 15
    end
    object qryProcessocalcNrProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNrProcesso'
      Size = 18
      Calculated = True
    end
    object qryProcessocalcNomeUnidade: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNomeUnidade'
      Size = 50
      Calculated = True
    end
    object qryProcessocalcNomeProduto: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNomeProduto'
      Size = 50
      Calculated = True
    end
    object qryProcessocalcModalidade: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcModalidade'
      Calculated = True
    end
    object qryProcessoNR_REF_EXPORTADOR: TStringField
      DisplayLabel = 'Nr. Ref. Exportador'
      FieldName = 'NR_REF_EXPORTADOR'
      Origin = 'DBBROKER.TPROCESSO.NR_REF_EXPORTADOR'
      FixedChar = True
      Size = 30
    end
    object qryProcessoCD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'DBBROKER.TPROCESSO.CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_TERMO_PAGTO: TStringField
      FieldName = 'CD_TERMO_PAGTO'
      Origin = 'DBBROKER.TPROCESSO.CD_TERMO_PAGTO'
      FixedChar = True
      Size = 6
    end
    object qryProcessoDIAS_CONDICAO_PAGTO: TStringField
      FieldName = 'DIAS_CONDICAO_PAGTO'
      Origin = 'DBBROKER.TPROCESSO.DIAS_CONDICAO_PAGTO'
      FixedChar = True
      Size = 3
    end
    object qryProcessoCONDICAO_PAGTO: TStringField
      FieldName = 'CONDICAO_PAGTO'
      Origin = 'DBBROKER.TPROCESSO.CONDICAO_PAGTO'
      FixedChar = True
      Size = 1
    end
  end
  object updPo: TUpdateSQL
    ModifySQL.Strings = (
      'update TPO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_IMPORTADOR = :CD_IMPORTADOR,'
      '  CD_FABRICANTE = :CD_FABRICANTE,'
      '  CD_EXPORTADOR = :CD_EXPORTADOR,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  CD_PAIS_ORIGEM = :CD_PAIS_ORIGEM,'
      '  CD_PAIS_AQUISICAO = :CD_PAIS_AQUISICAO,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  DT_ABERTURA = :DT_ABERTURA,'
      '  IN_FABR_EXPOR_IMP = :IN_FABR_EXPOR_IMP,'
      '  IN_SEGURO = :IN_SEGURO,'
      '  NR_DOC_HOUSE = :NR_DOC_HOUSE,'
      '  CD_AREA = :CD_AREA,'
      '  CD_LOCAL_DESEMBARQUE = :CD_LOCAL_DESEMBARQUE,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  NR_ORDEM = :NR_ORDEM,'
      '  NR_VIAGEM = :NR_VIAGEM,'
      '  CD_EMPRESA = :CD_EMPRESA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA')
    InsertSQL.Strings = (
      'insert into TPO'
      '  (NR_PROCESSO, CD_IMPORTADOR, CD_FABRICANTE, CD_EXPORTADOR, '
      'CD_VIA_TRANSP, '
      '   CD_PAIS_ORIGEM, CD_PAIS_AQUISICAO, CD_INCOTERM, DT_ABERTURA, '
      'IN_FABR_EXPOR_IMP, '
      '   IN_SEGURO, NR_DOC_HOUSE, CD_AREA, CD_LOCAL_DESEMBARQUE, '
      'CD_SERVICO, '
      '   NR_ORDEM, NR_VIAGEM, CD_EMPRESA)'
      'values'
      
        '  (:NR_PROCESSO, :CD_IMPORTADOR, :CD_FABRICANTE, :CD_EXPORTADOR,' +
        ' '
      ':CD_VIA_TRANSP, '
      
        '   :CD_PAIS_ORIGEM, :CD_PAIS_AQUISICAO, :CD_INCOTERM, :DT_ABERTU' +
        'RA, '
      ':IN_FABR_EXPOR_IMP, '
      '   :IN_SEGURO, :NR_DOC_HOUSE, :CD_AREA, :CD_LOCAL_DESEMBARQUE, '
      ':CD_SERVICO, '
      '   :NR_ORDEM, :NR_VIAGEM, :CD_EMPRESA)')
    DeleteSQL.Strings = (
      'delete from TPO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA')
    Left = 140
    Top = 437
  end
  object updProcesso: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  DT_ABERTURA = :DT_ABERTURA,'
      '  IN_CANCELADO = :IN_CANCELADO,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  CD_EMBARCACAO = :CD_EMBARCACAO,'
      '  NR_VOO = :NR_VOO,'
      '  NR_CONHECIMENTO = :NR_CONHECIMENTO,'
      '  CD_PAIS_ORIGEM = :CD_PAIS_ORIGEM,'
      '  CD_LOCAL_DESEMBARQUE = :CD_LOCAL_DESEMBARQUE,'
      '  IN_LIBERADO = :IN_LIBERADO,'
      '  IN_URGENTE = :IN_URGENTE,'
      '  CD_ANALISTA_CLIENTE = :CD_ANALISTA_CLIENTE,'
      '  CD_ANALISTA_COMISSARIA = :CD_ANALISTA_COMISSARIA,'
      '  NR_VIAGEM = :NR_VIAGEM,'
      '  CD_AREA = :CD_AREA,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  CD_IMPORTADOR = :CD_IMPORTADOR,'
      '  CD_EXPORTADOR = :CD_EXPORTADOR,'
      '  CD_GRUPO = :CD_GRUPO,'
      '  NR_REFERENCIA = :NR_REFERENCIA,'
      '  DT_PEDIDO = :DT_PEDIDO,'
      '  HR_PEDIDO = :HR_PEDIDO,'
      '  HR_ABERTURA = :HR_ABERTURA,'
      '  CD_TP_PEDIDO = :CD_TP_PEDIDO,'
      '  NR_REF_EXPORTADOR = :NR_REF_EXPORTADOR,'
      '  NR_ORDEM = :NR_ORDEM,'
      '  IN_CONSOLIDADO = :IN_CONSOLIDADO,'
      '  IN_SEGURO = :IN_SEGURO,'
      '  IN_DADOS_IGUAIS_ITENS = :IN_DADOS_IGUAIS_ITENS,'
      '  NR_COURRIER = :NR_COURRIER,'
      '  CD_TERMO_PAGTO = :CD_TERMO_PAGTO,'
      '  DIAS_CONDICAO_PAGTO = :DIAS_CONDICAO_PAGTO,'
      '  CONDICAO_PAGTO = :CONDICAO_PAGTO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPROCESSO'
      
        '  (NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, CD_SERVICO,' +
        ' CD_USUARIO, '
      
        '   DT_ABERTURA, IN_CANCELADO, CD_AGENTE, CD_EMBARCACAO, NR_VOO, ' +
        'NR_CONHECIMENTO, '
      
        '   CD_PAIS_ORIGEM, CD_LOCAL_DESEMBARQUE, IN_LIBERADO, IN_URGENTE' +
        ', CD_ANALISTA_CLIENTE, '
      
        '   CD_ANALISTA_COMISSARIA, NR_VIAGEM, CD_AREA, CD_INCOTERM, CD_I' +
        'MPORTADOR, '
      
        '   CD_EXPORTADOR, CD_GRUPO, NR_REFERENCIA, DT_PEDIDO, HR_PEDIDO,' +
        ' HR_ABERTURA, '
      
        '   CD_TP_PEDIDO, NR_REF_EXPORTADOR, NR_ORDEM, IN_CONSOLIDADO, IN' +
        '_SEGURO, '
      
        '   IN_DADOS_IGUAIS_ITENS, NR_COURRIER, CD_TERMO_PAGTO, DIAS_COND' +
        'ICAO_PAGTO, '
      '   CONDICAO_PAGTO)'
      'values'
      
        '  (:NR_PROCESSO, :CD_UNID_NEG, :CD_PRODUTO, :CD_CLIENTE, :CD_SER' +
        'VICO, :CD_USUARIO, '
      
        '   :DT_ABERTURA, :IN_CANCELADO, :CD_AGENTE, :CD_EMBARCACAO, :NR_' +
        'VOO, :NR_CONHECIMENTO, '
      
        '   :CD_PAIS_ORIGEM, :CD_LOCAL_DESEMBARQUE, :IN_LIBERADO, :IN_URG' +
        'ENTE, :CD_ANALISTA_CLIENTE, '
      
        '   :CD_ANALISTA_COMISSARIA, :NR_VIAGEM, :CD_AREA, :CD_INCOTERM, ' +
        ':CD_IMPORTADOR, '
      
        '   :CD_EXPORTADOR, :CD_GRUPO, :NR_REFERENCIA, :DT_PEDIDO, :HR_PE' +
        'DIDO, :HR_ABERTURA, '
      
        '   :CD_TP_PEDIDO, :NR_REF_EXPORTADOR, :NR_ORDEM, :IN_CONSOLIDADO' +
        ', :IN_SEGURO, '
      
        '   :IN_DADOS_IGUAIS_ITENS, :NR_COURRIER, :CD_TERMO_PAGTO, :DIAS_' +
        'CONDICAO_PAGTO, '
      '   :CONDICAO_PAGTO)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 110
    Top = 437
  end
  object qryClienteHabilitacao: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      
        '  H.CD_CLIENTE, H.CD_UNID_NEG, H.CD_PRODUTO, H.IN_ATIVO, H.DT_VA' +
        'LID_CRED_RF,'
      
        '  E.IN_COMPRADOR, E.NM_EMPRESA, E.CD_GRUPO, E.IN_IMPORTADOR, E.I' +
        'N_RESTRICAO'
      'FROM   TCLIENTE_HABILITACAO H (NOLOCK), TEMPRESA_NAC E (NOLOCK)'
      'WHERE H.CD_CLIENTE  =  E.CD_EMPRESA'
      '  AND H.CD_CLIENTE  = :CD_CLIENTE'
      '  AND H.CD_UNID_NEG = :CD_UNID_NEG'
      '  AND H.CD_PRODUTO  = :CD_PRODUTO')
    Left = 679
    Top = 95
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
        Size = 2
      end>
    object qryClienteHabilitacaoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
    object qryClienteHabilitacaoCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qryClienteHabilitacaoCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qryClienteHabilitacaoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qryClienteHabilitacaoNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object qryClienteHabilitacaoIN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object qryClienteHabilitacaoIN_RESTRICAO: TStringField
      FieldName = 'IN_RESTRICAO'
      Size = 1
    end
    object qryClienteHabilitacaoIN_COMPRADOR: TBooleanField
      FieldName = 'IN_COMPRADOR'
    end
    object qryClienteHabilitacaoIN_IMPORTADOR: TBooleanField
      FieldName = 'IN_IMPORTADOR'
    end
    object qryClienteHabilitacaoDT_VALID_CRED_RF: TDateTimeField
      FieldName = 'DT_VALID_CRED_RF'
    end
  end
  object qryClienteServico: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      '  C.CD_CLIENTE, C.CD_UNID_NEG, C.CD_PRODUTO, C.CD_SERVICO,'
      '  C.CD_PREFIXO, C.IN_ATIVO, C.DT_CAPTACAO, C.PZ_PROPOSTA'
      'FROM   TCLIENTE_SERVICO C (NOLOCK)'
      'WHERE C.CD_CLIENTE  = :CD_CLIENTE'
      '  AND C.CD_SERVICO  = :CD_SERVICO'
      '  AND C.CD_UNID_NEG = :CD_UNID_NEG'
      '  AND C.CD_PRODUTO  = :CD_PRODUTO')
    Left = 682
    Top = 271
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qryClienteServicoCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
      Size = 5
    end
    object qryClienteServicoCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_SERVICO.CD_UNID_NEG'
      Size = 2
    end
    object qryClienteServicoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_SERVICO.CD_PRODUTO'
      Size = 2
    end
    object qryClienteServicoCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TCLIENTE_SERVICO.CD_SERVICO'
      Size = 3
    end
    object qryClienteServicoCD_PREFIXO: TStringField
      FieldName = 'CD_PREFIXO'
      Origin = 'TCLIENTE_SERVICO.CD_PREFIXO'
      Size = 2
    end
    object qryClienteServicoIN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TCLIENTE_SERVICO.IN_ATIVO'
      Size = 1
    end
    object qryClienteServicoDT_CAPTACAO: TDateTimeField
      FieldName = 'DT_CAPTACAO'
      Origin = 'TCLIENTE_SERVICO.DT_CAPTACAO'
    end
    object qryClienteServicoPZ_PROPOSTA: TIntegerField
      FieldName = 'PZ_PROPOSTA'
      Origin = 'TCLIENTE_SERVICO.PZ_PROPOSTA'
    end
  end
  object dsPoItem: TDataSource
    DataSet = qryPoItem
    OnStateChange = dsPoItemStateChange
    Left = 617
    Top = 213
  end
  object qryPoItem: TQuery
    CachedUpdates = True
    AfterOpen = qryPoItemAfterOpen
    AfterInsert = qryPoItemAfterInsert
    AfterPost = qryPoItemAfterPost
    AfterDelete = qryPoItemAfterDelete
    AfterScroll = qryPoItemAfterScroll
    OnCalcFields = qryPoItemCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_ITEM, NR_ITEM_CLIENTE, CD_MERCADORIA, CD_' +
        'NCM_SH, QT_INICIAL, IN_NECESSITA_LI,IN_DRAWBACK,'
      
        '  CD_AREA, CD_LOCAL_DESEMBARQUE, CD_EMBARCACAO, CD_AGENTE, NR_VI' +
        'AGEM, NR_VOO, NR_CONHECIMENTO,'
      
        '  NR_COURRIER, IN_CONSOLIDADO, IN_URGENTE, IN_SEGURO, VL_UNITARI' +
        'O, TP_CALCULO, PL_ITEM, CD_UNID_MEDIDA,'
      
        '  CD_NALADI_SH, CD_NALADI_NCCA, CD_FABRICANTE, CD_PAIS_ORIGEM, V' +
        'L_TOTAL, PC_DESCONTO, VL_DESCONTO,'
      
        '  IN_REEIMPORTACAO, QT_BAIXADA_DI, QT_BAIXADA_LI, IN_MONTADO, CD' +
        '_EXPORTADOR, CD_PAIS_AQUISICAO,'
      
        '  IN_FABR_EXP_PROD, TX_MERCADORIA, TP_DRAWBACK, NR_FATURA, CD_ME' +
        'RC_FORNEC, CD_MOEDA_NEGOCIADA,'
      
        '  NR_PARCIAL, QT_DISPONIVEL, DT_ABERTURA_ITEM, DT_FATURA, CD_EMP' +
        'RESA'
      'FROM TPO_ITEM ( NOLOCK )'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND CD_EMPRESA = :CD_EMPRESA'
      '  AND NR_PARCIAL = 0'
      'ORDER BY NR_ITEM_CLIENTE'
      ''
      ''
      '')
    UpdateObject = updPoItem
    Left = 618
    Top = 174
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInputOutput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qryPoItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPO_ITEM.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryPoItemNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'DBBROKER.TPO_ITEM.NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryPoItemNR_ITEM_CLIENTE: TStringField
      FieldName = 'NR_ITEM_CLIENTE'
      Origin = 'DBBROKER.TPO_ITEM.NR_ITEM_CLIENTE'
      OnSetText = qryPoItemNR_ITEM_CLIENTESetText
      FixedChar = True
      Size = 4
    end
    object qryPoItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TPO_ITEM.CD_MERCADORIA'
      FixedChar = True
      Size = 30
    end
    object qryPoItemCD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'DBBROKER.TPO_ITEM.CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
    object qryPoItemQT_INICIAL: TFloatField
      FieldName = 'QT_INICIAL'
      Origin = 'DBBROKER.TPO_ITEM.QT_INICIAL'
      DisplayFormat = '#0.00000'
    end
    object qryPoItemIN_NECESSITA_LI: TBooleanField
      FieldName = 'IN_NECESSITA_LI'
      Origin = 'DBBROKER.TPO_ITEM.IN_NECESSITA_LI'
    end
    object qryPoItemCD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'DBBROKER.TPO_ITEM.CD_AREA'
      FixedChar = True
      Size = 2
    end
    object qryPoItemCD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'DBBROKER.TPO_ITEM.CD_LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qryPoItemCD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'DBBROKER.TPO_ITEM.CD_EMBARCACAO'
      FixedChar = True
      Size = 4
    end
    object qryPoItemCD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'DBBROKER.TPO_ITEM.CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qryPoItemNR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'DBBROKER.TPO_ITEM.NR_VIAGEM'
      FixedChar = True
      Size = 15
    end
    object qryPoItemNR_VOO: TStringField
      FieldName = 'NR_VOO'
      Origin = 'DBBROKER.TPO_ITEM.NR_VOO'
      FixedChar = True
      Size = 18
    end
    object qryPoItemNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'DBBROKER.TPO_ITEM.NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qryPoItemNR_COURRIER: TStringField
      FieldName = 'NR_COURRIER'
      Origin = 'DBBROKER.TPO_ITEM.NR_COURRIER'
      FixedChar = True
      Size = 15
    end
    object qryPoItemIN_CONSOLIDADO: TStringField
      FieldName = 'IN_CONSOLIDADO'
      Origin = 'DBBROKER.TPO_ITEM.IN_CONSOLIDADO'
      FixedChar = True
      Size = 1
    end
    object qryPoItemIN_URGENTE: TStringField
      FieldName = 'IN_URGENTE'
      Origin = 'DBBROKER.TPO_ITEM.IN_URGENTE'
      FixedChar = True
      Size = 1
    end
    object qryPoItemIN_SEGURO: TStringField
      FieldName = 'IN_SEGURO'
      Origin = 'DBBROKER.TPO_ITEM.IN_SEGURO'
      FixedChar = True
      Size = 1
    end
    object qryPoItemVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'DBBROKER.TPO_ITEM.VL_UNITARIO'
      DisplayFormat = '#0.00000'
    end
    object qryPoItemTP_CALCULO: TStringField
      FieldName = 'TP_CALCULO'
      Origin = 'DBBROKER.TPO_ITEM.TP_CALCULO'
      FixedChar = True
      Size = 1
    end
    object qryPoItemPL_ITEM: TFloatField
      FieldName = 'PL_ITEM'
      Origin = 'DBBROKER.TPO_ITEM.PL_ITEM'
    end
    object qryPoItemCD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'DBBROKER.TPO_ITEM.CD_UNID_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qryPoItemCD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'DBBROKER.TPO_ITEM.CD_NALADI_SH'
      FixedChar = True
      Size = 8
    end
    object qryPoItemCD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'DBBROKER.TPO_ITEM.CD_NALADI_NCCA'
      FixedChar = True
      Size = 7
    end
    object qryPoItemCD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'DBBROKER.TPO_ITEM.CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qryPoItemCD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'DBBROKER.TPO_ITEM.CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qryPoItemVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      Origin = 'DBBROKER.TPO_ITEM.VL_TOTAL'
      DisplayFormat = '#0,.00000'
    end
    object qryPoItemPC_DESCONTO: TFloatField
      FieldName = 'PC_DESCONTO'
      Origin = 'DBBROKER.TPO_ITEM.PC_DESCONTO'
    end
    object qryPoItemVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'DBBROKER.TPO_ITEM.VL_DESCONTO'
    end
    object qryPoItemIN_REEIMPORTACAO: TStringField
      FieldName = 'IN_REEIMPORTACAO'
      Origin = 'DBBROKER.TPO_ITEM.IN_REEIMPORTACAO'
      FixedChar = True
      Size = 1
    end
    object qryPoItemQT_BAIXADA_DI: TFloatField
      FieldName = 'QT_BAIXADA_DI'
      Origin = 'DBBROKER.TPO_ITEM.QT_BAIXADA_DI'
    end
    object qryPoItemQT_BAIXADA_LI: TFloatField
      FieldName = 'QT_BAIXADA_LI'
      Origin = 'DBBROKER.TPO_ITEM.QT_BAIXADA_LI'
    end
    object qryPoItemIN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'DBBROKER.TPO_ITEM.IN_MONTADO'
      FixedChar = True
      Size = 1
    end
    object qryPoItemCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'DBBROKER.TPO_ITEM.CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qryPoItemCD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'DBBROKER.TPO_ITEM.CD_PAIS_AQUISICAO'
      FixedChar = True
      Size = 3
    end
    object qryPoItemIN_FABR_EXP_PROD: TStringField
      FieldName = 'IN_FABR_EXP_PROD'
      Origin = 'DBBROKER.TPO_ITEM.IN_FABR_EXP_PROD'
      FixedChar = True
      Size = 1
    end
    object qryPoItemTX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'DBBROKER.TPO_ITEM.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qryPoItemTP_DRAWBACK: TStringField
      FieldName = 'TP_DRAWBACK'
      Origin = 'DBBROKER.TPO_ITEM.TP_DRAWBACK'
      FixedChar = True
      Size = 1
    end
    object qryPoItemNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'DBBROKER.TPO_ITEM.NR_FATURA'
      FixedChar = True
      Size = 50
    end
    object qryPoItemcalcNecessitaLI: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNecessitaLI'
      Size = 1
      Calculated = True
    end
    object qryPoItemcalcHabilitaDrawBack: TStringField
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'calcHabilitaDrawBack'
      Size = 1
      Calculated = True
    end
    object qryPoItemcalcMercadoria: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcMercadoria'
      Size = 25
      Calculated = True
    end
    object qryPoItemcalcNomeArea: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNomeArea'
      Size = 50
      Calculated = True
    end
    object qryPoItemCD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Origin = 'DBBROKER.TPO_ITEM.CD_MOEDA_NEGOCIADA'
      FixedChar = True
      Size = 3
    end
    object qryPoItemNR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
      Origin = 'DBBROKER.TPO_ITEM.NR_PARCIAL'
    end
    object qryPoItemQT_DISPONIVEL: TFloatField
      FieldName = 'QT_DISPONIVEL'
      Origin = 'DBBROKER.TPO_ITEM.QT_DISPONIVEL'
    end
    object qryPoItemDT_ABERTURA_ITEM: TDateTimeField
      FieldName = 'DT_ABERTURA_ITEM'
      Origin = 'DBBROKER.TPO_ITEM.DT_ABERTURA_ITEM'
    end
    object qryPoItemDT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'DBBROKER.TPO_ITEM.DT_FATURA'
    end
    object qryPoItemCD_MERC_FORNEC: TStringField
      FieldName = 'CD_MERC_FORNEC'
      Origin = 'DBBROKER.TPO_ITEM.CD_MERC_FORNEC'
      FixedChar = True
      Size = 30
    end
    object qryPoItemCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TPO_ITEM.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qryPoItemIN_DRAWBACK: TStringField
      FieldName = 'IN_DRAWBACK'
      Origin = 'DBBROKER.TPO_ITEM.IN_DRAWBACK'
      FixedChar = True
      Size = 1
    end
  end
  object updPoItem: TUpdateSQL
    ModifySQL.Strings = (
      'update TPO_ITEM'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ITEM = :NR_ITEM,'
      '  NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE,'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  CD_NCM_SH = :CD_NCM_SH,'
      '  QT_INICIAL = :QT_INICIAL,'
      '  IN_NECESSITA_LI = :IN_NECESSITA_LI,'
      '  IN_DRAWBACK = :IN_DRAWBACK,'
      '  CD_AREA = :CD_AREA,'
      '  CD_LOCAL_DESEMBARQUE = :CD_LOCAL_DESEMBARQUE,'
      '  CD_EMBARCACAO = :CD_EMBARCACAO,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  NR_VIAGEM = :NR_VIAGEM,'
      '  NR_VOO = :NR_VOO,'
      '  NR_CONHECIMENTO = :NR_CONHECIMENTO,'
      '  NR_COURRIER = :NR_COURRIER,'
      '  IN_CONSOLIDADO = :IN_CONSOLIDADO,'
      '  IN_URGENTE = :IN_URGENTE,'
      '  IN_SEGURO = :IN_SEGURO,'
      '  VL_UNITARIO = :VL_UNITARIO,'
      '  TP_CALCULO = :TP_CALCULO,'
      '  PL_ITEM = :PL_ITEM,'
      '  CD_UNID_MEDIDA = :CD_UNID_MEDIDA,'
      '  CD_NALADI_SH = :CD_NALADI_SH,'
      '  CD_NALADI_NCCA = :CD_NALADI_NCCA,'
      '  CD_FABRICANTE = :CD_FABRICANTE,'
      '  CD_PAIS_ORIGEM = :CD_PAIS_ORIGEM,'
      '  VL_TOTAL = :VL_TOTAL,'
      '  PC_DESCONTO = :PC_DESCONTO,'
      '  VL_DESCONTO = :VL_DESCONTO,'
      '  IN_REEIMPORTACAO = :IN_REEIMPORTACAO,'
      '  QT_BAIXADA_DI = :QT_BAIXADA_DI,'
      '  QT_BAIXADA_LI = :QT_BAIXADA_LI,'
      '  IN_MONTADO = :IN_MONTADO,'
      '  CD_EXPORTADOR = :CD_EXPORTADOR,'
      '  CD_PAIS_AQUISICAO = :CD_PAIS_AQUISICAO,'
      '  IN_FABR_EXP_PROD = :IN_FABR_EXP_PROD,'
      '  TX_MERCADORIA = :TX_MERCADORIA,'
      '  TP_DRAWBACK = :TP_DRAWBACK,'
      '  NR_FATURA = :NR_FATURA,'
      '  CD_MERC_FORNEC = :CD_MERC_FORNEC,'
      '  CD_MOEDA_NEGOCIADA = :CD_MOEDA_NEGOCIADA,'
      '  NR_PARCIAL = :NR_PARCIAL,'
      '  QT_DISPONIVEL = :QT_DISPONIVEL,'
      '  DT_ABERTURA_ITEM = :DT_ABERTURA_ITEM,'
      '  DT_FATURA = :DT_FATURA,'
      '  CD_EMPRESA = :CD_EMPRESA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  NR_PARCIAL = :OLD_NR_PARCIAL and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA')
    InsertSQL.Strings = (
      'insert into TPO_ITEM'
      
        '  (NR_PROCESSO, NR_ITEM, NR_ITEM_CLIENTE, CD_MERCADORIA, CD_NCM_' +
        'SH, QT_INICIAL, '
      
        '   IN_NECESSITA_LI, IN_DRAWBACK, CD_AREA, CD_LOCAL_DESEMBARQUE, ' +
        'CD_EMBARCACAO, '
      
        '   CD_AGENTE, NR_VIAGEM, NR_VOO, NR_CONHECIMENTO, NR_COURRIER, I' +
        'N_CONSOLIDADO, '
      
        '   IN_URGENTE, IN_SEGURO, VL_UNITARIO, TP_CALCULO, PL_ITEM, CD_U' +
        'NID_MEDIDA, '
      
        '   CD_NALADI_SH, CD_NALADI_NCCA, CD_FABRICANTE, CD_PAIS_ORIGEM, ' +
        'VL_TOTAL, '
      
        '   PC_DESCONTO, VL_DESCONTO, IN_REEIMPORTACAO, QT_BAIXADA_DI, QT' +
        '_BAIXADA_LI, '
      
        '   IN_MONTADO, CD_EXPORTADOR, CD_PAIS_AQUISICAO, IN_FABR_EXP_PRO' +
        'D, TX_MERCADORIA, '
      
        '   TP_DRAWBACK, NR_FATURA, CD_MERC_FORNEC, CD_MOEDA_NEGOCIADA, N' +
        'R_PARCIAL, '
      '   QT_DISPONIVEL, DT_ABERTURA_ITEM, DT_FATURA, CD_EMPRESA)'
      'values'
      
        '  (:NR_PROCESSO, :NR_ITEM, :NR_ITEM_CLIENTE, :CD_MERCADORIA, :CD' +
        '_NCM_SH, '
      
        '   :QT_INICIAL, :IN_NECESSITA_LI, :IN_DRAWBACK, :CD_AREA, :CD_LO' +
        'CAL_DESEMBARQUE, '
      
        '   :CD_EMBARCACAO, :CD_AGENTE, :NR_VIAGEM, :NR_VOO, :NR_CONHECIM' +
        'ENTO, :NR_COURRIER, '
      
        '   :IN_CONSOLIDADO, :IN_URGENTE, :IN_SEGURO, :VL_UNITARIO, :TP_C' +
        'ALCULO, '
      
        '   :PL_ITEM, :CD_UNID_MEDIDA, :CD_NALADI_SH, :CD_NALADI_NCCA, :C' +
        'D_FABRICANTE, '
      
        '   :CD_PAIS_ORIGEM, :VL_TOTAL, :PC_DESCONTO, :VL_DESCONTO, :IN_R' +
        'EEIMPORTACAO, '
      
        '   :QT_BAIXADA_DI, :QT_BAIXADA_LI, :IN_MONTADO, :CD_EXPORTADOR, ' +
        ':CD_PAIS_AQUISICAO, '
      
        '   :IN_FABR_EXP_PROD, :TX_MERCADORIA, :TP_DRAWBACK, :NR_FATURA, ' +
        ':CD_MERC_FORNEC, '
      
        '   :CD_MOEDA_NEGOCIADA, :NR_PARCIAL, :QT_DISPONIVEL, :DT_ABERTUR' +
        'A_ITEM, '
      '   :DT_FATURA, :CD_EMPRESA)')
    DeleteSQL.Strings = (
      'delete from TPO_ITEM'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  NR_PARCIAL = :OLD_NR_PARCIAL and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA')
    Left = 616
    Top = 262
  end
  object sp_atz_ev_flp_po: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_ev_flp_po'
    Left = 300
    Top = 410
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = '@cd_empresa'
        ParamType = ptInput
        Value = ''
      end>
  end
  object qryTipoPedido: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PEDIDO, NM_PEDIDO'
      'FROM   TTP_PEDIDO (NOLOCK)')
    Left = 242
    Top = 409
  end
  object qryIncoterm: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM   TINCOTERMS_VENDA (NOLOCK)'
      '')
    Left = 208
    Top = 408
  end
  object dsIncoterm: TDataSource
    DataSet = qryIncoterm
    Left = 194
    Top = 397
  end
  object dsTipoPedido: TDataSource
    DataSet = qryTipoPedido
    Left = 681
    Top = 142
  end
  object dsTipoCalculoItem: TDataSource
    AutoEdit = False
    DataSet = qryTipoCalculoItem
    Left = 169
    Top = 397
  end
  object sp_po_apaga_renum_itens: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_po_apaga_renum_itens'
    Left = 270
    Top = 410
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = '@cd_empresa'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = '@nr_item'
        ParamType = ptInput
        Value = ''
      end>
  end
  object qryTipoCalculoItem: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TIPO_CALCULO_ITEM, DESCRICAO'
      'FROM TTP_CALCULO_ITEM (NOLOCK)'
      'ORDER BY DESCRICAO')
    Left = 169
    Top = 409
  end
  object sp_atz_ev_flp_po_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_ev_flp_po_item'
    Left = 330
    Top = 410
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = '@cd_empresa'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = '@nr_item'
        ParamType = ptInput
        Value = ''
      end>
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '.xls'
    InitialDir = 'c:\'
    Left = 42
    Top = 392
  end
  object qryPoItemParciais: TQuery
    CachedUpdates = True
    OnCalcFields = qryPoItemParciaisCalcFields
    DatabaseName = 'DBBROKER'
    DataSource = dsPoItem
    SQL.Strings = (
      'SELECT A.*, B.DT_ULT_ALTERACAO, B.NR_PROCESSO_DES'
      'FROM TPO_ITEM A ( NOLOCK )'
      
        'LEFT JOIN TESTAGIO_PROCESSO B( NOLOCK ) on B.NR_REFERENCIA   = A' +
        '.NR_PROCESSO and'
      #9#9#9#9#9#9#9#9#9#9'   B.NR_ITEM_CLIENTE = A.NR_ITEM_CLIENTE and'
      
        '                                                                ' +
        '                                                                ' +
        '                                   B.CD_EMPRESA = A.CD_EMPRESA a' +
        'nd'
      #9#9#9#9#9#9#9#9#9#9'   B.NR_PARCIAL      = A.NR_PARCIAL and'
      #9#9#9#9#9#9#9#9#9#9'   B.IN_SUBSTITUIDO = '#39'0'#39
      'WHERE'
      
        '  A.NR_PROCESSO = :NR_PROCESSO AND A.CD_EMPRESA = :CD_EMPRESA an' +
        'd A.NR_ITEM_CLIENTE =:NR_ITEM_CLIENTE and A.NR_PARCIAL <> 0'
      '')
    Left = 683
    Top = 170
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInputOutput
        Size = 19
      end
      item
        DataType = ftUnknown
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_ITEM_CLIENTE'
        ParamType = ptUnknown
        Size = 5
      end>
    object qryPoItemParciaisNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryPoItemParciaisNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisNR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
      DisplayFormat = '00'
      EditFormat = '00'
    end
    object qryPoItemParciaisCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qryPoItemParciaisCD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      FixedChar = True
      Size = 8
    end
    object qryPoItemParciaisCD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 30
    end
    object qryPoItemParciaisCD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qryPoItemParciaisCD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisCD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
    object qryPoItemParciaisCD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      FixedChar = True
      Size = 7
    end
    object qryPoItemParciaisCD_MET_VALOR_ADUANEIRA: TStringField
      FieldName = 'CD_MET_VALOR_ADUANEIRA'
      FixedChar = True
      Size = 2
    end
    object qryPoItemParciaisCD_DISP_LEGAL_EXONERA: TStringField
      FieldName = 'CD_DISP_LEGAL_EXONERA'
      FixedChar = True
      Size = 4
    end
    object qryPoItemParciaisCD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisCD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisCD_REG_TRIB_II: TStringField
      FieldName = 'CD_REG_TRIB_II'
      FixedChar = True
      Size = 6
    end
    object qryPoItemParciaisCD_FUND_LEGAL_II: TStringField
      FieldName = 'CD_FUND_LEGAL_II'
      FixedChar = True
      Size = 2
    end
    object qryPoItemParciaisCD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisCD_UNID_MED_II: TStringField
      FieldName = 'CD_UNID_MED_II'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisCD_UNID_MED_IPI: TStringField
      FieldName = 'CD_UNID_MED_IPI'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisCD_UNID_MED_AD: TStringField
      FieldName = 'CD_UNID_MED_AD'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisCD_AGENTE_CAMBIO: TStringField
      FieldName = 'CD_AGENTE_CAMBIO'
      FixedChar = True
      Size = 4
    end
    object qryPoItemParciaisCD_MOD_PAGTO: TStringField
      FieldName = 'CD_MOD_PAGTO'
      FixedChar = True
      Size = 2
    end
    object qryPoItemParciaisCD_TX_JUROS: TStringField
      FieldName = 'CD_TX_JUROS'
      FixedChar = True
      Size = 4
    end
    object qryPoItemParciaisCD_INSTITUICAO_FINANC: TStringField
      FieldName = 'CD_INSTITUICAO_FINANC'
      FixedChar = True
      Size = 2
    end
    object qryPoItemParciaisCD_MOT_SEM_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_MOT_SEM_COBERT_CAMBIAL'
      FixedChar = True
      Size = 2
    end
    object qryPoItemParciaisCD_EX_II: TStringField
      FieldName = 'CD_EX_II'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisCD_EX_IPI: TStringField
      FieldName = 'CD_EX_IPI'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisCD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qryPoItemParciaisCD_PAIS_PROCEDENCIA: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisCD_URF_ENTRADA: TStringField
      FieldName = 'CD_URF_ENTRADA'
      FixedChar = True
      Size = 7
    end
    object qryPoItemParciaisIN_NECESSITA_LI: TBooleanField
      FieldName = 'IN_NECESSITA_LI'
    end
    object qryPoItemParciaisIN_INDICADOR_COND_MERC: TBooleanField
      FieldName = 'IN_INDICADOR_COND_MERC'
    end
    object qryPoItemParciaisIN_COND_MERC: TStringField
      FieldName = 'IN_COND_MERC'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisIN_APLIC_MERC: TStringField
      FieldName = 'IN_APLIC_MERC'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisNM_ORGAO_EMISSOR_AL_EX_NALADI: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_AL_EX_NALADI'
      FixedChar = True
      Size = 9
    end
    object qryPoItemParciaisNM_AL_EX_NALADI: TStringField
      FieldName = 'NM_AL_EX_NALADI'
      FixedChar = True
      Size = 9
    end
    object qryPoItemParciaisNM_ORGAO_EMISSOR_AL_NCM: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_AL_NCM'
      FixedChar = True
      Size = 9
    end
    object qryPoItemParciaisNM_AL_EX_NALADI_NCCA: TStringField
      FieldName = 'NM_AL_EX_NALADI_NCCA'
      FixedChar = True
      Size = 9
    end
    object qryPoItemParciaisNM_ORG_EMISSOR_EX_NALADI_NCCA: TStringField
      FieldName = 'NM_ORG_EMISSOR_EX_NALADI_NCCA'
      FixedChar = True
      Size = 9
    end
    object qryPoItemParciaisNM_AL_II: TStringField
      FieldName = 'NM_AL_II'
      FixedChar = True
      Size = 9
    end
    object qryPoItemParciaisNM_ORGAO_EMISSOR_II: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_II'
      FixedChar = True
      Size = 9
    end
    object qryPoItemParciaisNM_ORGAO_EMISSOR_IPI: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_IPI'
      FixedChar = True
      Size = 9
    end
    object qryPoItemParciaisNM_AL_IPI: TStringField
      FieldName = 'NM_AL_IPI'
      FixedChar = True
      Size = 9
    end
    object qryPoItemParciaisNM_AL_AD: TStringField
      FieldName = 'NM_AL_AD'
      FixedChar = True
      Size = 9
    end
    object qryPoItemParciaisNM_ORGAO_EMISSOR_AD: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_AD'
      FixedChar = True
      Size = 9
    end
    object qryPoItemParciaisNM_IDENTIFICACAO: TStringField
      FieldName = 'NM_IDENTIFICACAO'
      FixedChar = True
      Size = 9
    end
    object qryPoItemParciaisNR_ANO_EMISSAO_AL_EX_NALADI: TStringField
      FieldName = 'NR_ANO_EMISSAO_AL_EX_NALADI'
      FixedChar = True
      Size = 4
    end
    object qryPoItemParciaisNR_AL_EX_NALADI: TStringField
      FieldName = 'NR_AL_EX_NALADI'
      FixedChar = True
      Size = 6
    end
    object qryPoItemParciaisNR_EX_NCM: TStringField
      FieldName = 'NR_EX_NCM'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisNR_AL_EX_NCM: TStringField
      FieldName = 'NR_AL_EX_NCM'
      FixedChar = True
      Size = 9
    end
    object qryPoItemParciaisNR_ANO_EMISSAO_AL: TStringField
      FieldName = 'NR_ANO_EMISSAO_AL'
      FixedChar = True
      Size = 4
    end
    object qryPoItemParciaisNR_ATO_LEGAL: TStringField
      FieldName = 'NR_ATO_LEGAL'
      FixedChar = True
      Size = 6
    end
    object qryPoItemParciaisNR_EX_NALADI: TStringField
      FieldName = 'NR_EX_NALADI'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisNR_EX_NALADI_NCCA: TStringField
      FieldName = 'NR_EX_NALADI_NCCA'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisNR_ANO_EMISSAO_EX_NALADI_NCCA: TStringField
      FieldName = 'NR_ANO_EMISSAO_EX_NALADI_NCCA'
      FixedChar = True
      Size = 4
    end
    object qryPoItemParciaisNR_AL_EX_NALADI_NCCA: TStringField
      FieldName = 'NR_AL_EX_NALADI_NCCA'
      FixedChar = True
      Size = 6
    end
    object qryPoItemParciaisNR_ANO_II: TStringField
      FieldName = 'NR_ANO_II'
      FixedChar = True
      Size = 4
    end
    object qryPoItemParciaisNR_AL_II: TStringField
      FieldName = 'NR_AL_II'
      FixedChar = True
      Size = 6
    end
    object qryPoItemParciaisNR_ALIQ_NORMAL_II: TStringField
      FieldName = 'NR_ALIQ_NORMAL_II'
      FixedChar = True
      Size = 10
    end
    object qryPoItemParciaisNR_ALIQ_ACORDO_II: TStringField
      FieldName = 'NR_ALIQ_ACORDO_II'
      FixedChar = True
      Size = 10
    end
    object qryPoItemParciaisNR_ALIQ_REDUZIDA_II: TStringField
      FieldName = 'NR_ALIQ_REDUZIDA_II'
      FixedChar = True
      Size = 10
    end
    object qryPoItemParciaisNR_ALIQ_PERC_RED_II: TStringField
      FieldName = 'NR_ALIQ_PERC_RED_II'
      FixedChar = True
      Size = 10
    end
    object qryPoItemParciaisNR_ANO_IPI: TStringField
      FieldName = 'NR_ANO_IPI'
      FixedChar = True
      Size = 4
    end
    object qryPoItemParciaisNR_AL_IPI: TStringField
      FieldName = 'NR_AL_IPI'
      FixedChar = True
      Size = 6
    end
    object qryPoItemParciaisNR_NOTA_COMPL_IPI: TStringField
      FieldName = 'NR_NOTA_COMPL_IPI'
      FixedChar = True
      Size = 2
    end
    object qryPoItemParciaisNR_ALIQ_NORMAL_IPI: TStringField
      FieldName = 'NR_ALIQ_NORMAL_IPI'
      FixedChar = True
      Size = 10
    end
    object qryPoItemParciaisNR_ALIQ_REDUZIDA_IPI: TStringField
      FieldName = 'NR_ALIQ_REDUZIDA_IPI'
      FixedChar = True
      Size = 10
    end
    object qryPoItemParciaisNR_ALIQ_PERC_RED_IPI: TStringField
      FieldName = 'NR_ALIQ_PERC_RED_IPI'
      FixedChar = True
      Size = 10
    end
    object qryPoItemParciaisNR_PROC_LI: TStringField
      FieldName = 'NR_PROC_LI'
      FixedChar = True
      Size = 18
    end
    object qryPoItemParciaisNR_EX_AD: TStringField
      FieldName = 'NR_EX_AD'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisNR_ANO_AD: TStringField
      FieldName = 'NR_ANO_AD'
      FixedChar = True
      Size = 4
    end
    object qryPoItemParciaisNR_AL_AD: TStringField
      FieldName = 'NR_AL_AD'
      FixedChar = True
      Size = 6
    end
    object qryPoItemParciaisNR_ALIQ_AD: TStringField
      FieldName = 'NR_ALIQ_AD'
      FixedChar = True
      Size = 10
    end
    object qryPoItemParciaisNR_BASE_CALC_AD: TFloatField
      FieldName = 'NR_BASE_CALC_AD'
    end
    object qryPoItemParciaisNR_PARCELAS: TStringField
      FieldName = 'NR_PARCELAS'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisNR_PERIODICIDADE: TStringField
      FieldName = 'NR_PERIODICIDADE'
      FixedChar = True
      Size = 3
    end
    object qryPoItemParciaisNR_ROF_BACEN: TStringField
      FieldName = 'NR_ROF_BACEN'
      FixedChar = True
      Size = 8
    end
    object qryPoItemParciaisNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 50
    end
    object qryPoItemParciaisPC_DESCONTO: TFloatField
      FieldName = 'PC_DESCONTO'
    end
    object qryPoItemParciaisPC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
    end
    object qryPoItemParciaisPC_ICMS_REDUCAO: TFloatField
      FieldName = 'PC_ICMS_REDUCAO'
    end
    object qryPoItemParciaisPC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
    end
    object qryPoItemParciaisPL_ITEM: TFloatField
      FieldName = 'PL_ITEM'
    end
    object qryPoItemParciaisQT_INICIAL: TFloatField
      FieldName = 'QT_INICIAL'
      DisplayFormat = '#0.00000'
    end
    object qryPoItemParciaisQT_BAIXADA_DI: TFloatField
      FieldName = 'QT_BAIXADA_DI'
    end
    object qryPoItemParciaisQT_BAIXADA_LI: TFloatField
      FieldName = 'QT_BAIXADA_LI'
    end
    object qryPoItemParciaisQT_ESPEC_II: TFloatField
      FieldName = 'QT_ESPEC_II'
    end
    object qryPoItemParciaisQT_ESPEC_IPI: TFloatField
      FieldName = 'QT_ESPEC_IPI'
    end
    object qryPoItemParciaisQT_AD: TFloatField
      FieldName = 'QT_AD'
    end
    object qryPoItemParciaisQT_MED_ESTATISTICA: TFloatField
      FieldName = 'QT_MED_ESTATISTICA'
    end
    object qryPoItemParciaisTP_CALCULO: TStringField
      FieldName = 'TP_CALCULO'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisTP_COMISSAO: TStringField
      FieldName = 'TP_COMISSAO'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisTP_ACORDO_TARIFARIO: TStringField
      FieldName = 'TP_ACORDO_TARIFARIO'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisTP_TRIBUTACAO_IPI: TStringField
      FieldName = 'TP_TRIBUTACAO_IPI'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisTP_CAMBIO: TStringField
      FieldName = 'TP_CAMBIO'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisTP_IND_TX_JUROS: TBooleanField
      FieldName = 'TP_IND_TX_JUROS'
    end
    object qryPoItemParciaisTP_IND_PERIODICIDADE: TStringField
      FieldName = 'TP_IND_PERIODICIDADE'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisTP_RECIPIENTE: TStringField
      FieldName = 'TP_RECIPIENTE'
      FixedChar = True
      Size = 2
    end
    object qryPoItemParciaisTP_IND_MULTIMODAL: TStringField
      FieldName = 'TP_IND_MULTIMODAL'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisTX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qryPoItemParciaisTX_JUROS_CAMBIO: TFloatField
      FieldName = 'TX_JUROS_CAMBIO'
    end
    object qryPoItemParciaisVL_DESPESA_MOEDA: TFloatField
      FieldName = 'VL_DESPESA_MOEDA'
    end
    object qryPoItemParciaisVL_DESCONTO_MOEDA: TFloatField
      FieldName = 'VL_DESCONTO_MOEDA'
    end
    object qryPoItemParciaisVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
    end
    object qryPoItemParciaisVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object qryPoItemParciaisVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object qryPoItemParciaisVL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
    end
    object qryPoItemParciaisVL_ESPEC_II: TFloatField
      FieldName = 'VL_ESPEC_II'
    end
    object qryPoItemParciaisVL_ESPEC_IPI: TFloatField
      FieldName = 'VL_ESPEC_IPI'
    end
    object qryPoItemParciaisVL_ESPEC_AD: TFloatField
      FieldName = 'VL_ESPEC_AD'
    end
    object qryPoItemParciaisVL_TOTAL_PARCELAS: TFloatField
      FieldName = 'VL_TOTAL_PARCELAS'
    end
    object qryPoItemParciaisVL_COBERT_ACIMA_360: TFloatField
      FieldName = 'VL_COBERT_ACIMA_360'
    end
    object qryPoItemParciaisVL_PAGTO_ANTECIPADO: TFloatField
      FieldName = 'VL_PAGTO_ANTECIPADO'
    end
    object qryPoItemParciaisVL_PAGTO_AVISTA: TFloatField
      FieldName = 'VL_PAGTO_AVISTA'
    end
    object qryPoItemParciaisVL_FRETE_NAC_MOEDA: TFloatField
      FieldName = 'VL_FRETE_NAC_MOEDA'
    end
    object qryPoItemParciaisVL_SEGURO_MOEDA: TFloatField
      FieldName = 'VL_SEGURO_MOEDA'
    end
    object qryPoItemParciaisVL_ACRESC_MOEDA: TFloatField
      FieldName = 'VL_ACRESC_MOEDA'
    end
    object qryPoItemParciaisVL_DEDUC_MOEDA: TFloatField
      FieldName = 'VL_DEDUC_MOEDA'
    end
    object qryPoItemParciaisVL_FRETE_PREPAID_MOEDA: TFloatField
      FieldName = 'VL_FRETE_PREPAID_MOEDA'
    end
    object qryPoItemParciaisVL_FRETE_COLLECT: TFloatField
      FieldName = 'VL_FRETE_COLLECT'
    end
    object qryPoItemParciaisIN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisQT_BAIXAR: TFloatField
      FieldName = 'QT_BAIXAR'
    end
    object qryPoItemParciaisQT_DISPONIVEL: TFloatField
      FieldName = 'QT_DISPONIVEL'
    end
    object qryPoItemParciaisIN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisIN_FABR_EXP_PROD: TStringField
      FieldName = 'IN_FABR_EXP_PROD'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisNR_ANO_EX_NCM: TStringField
      FieldName = 'NR_ANO_EX_NCM'
      FixedChar = True
      Size = 4
    end
    object qryPoItemParciaisNR_NUM_EX_NCM: TStringField
      FieldName = 'NR_NUM_EX_NCM'
      FixedChar = True
      Size = 6
    end
    object qryPoItemParciaisIN_IND_COND_MERC: TBooleanField
      FieldName = 'IN_IND_COND_MERC'
    end
    object qryPoItemParciaisNM_LOCAL_INCOTERM: TStringField
      FieldName = 'NM_LOCAL_INCOTERM'
      FixedChar = True
      Size = 10
    end
    object qryPoItemParciaisNM_TIPO_AL_AD: TStringField
      FieldName = 'NM_TIPO_AL_AD'
      FixedChar = True
      Size = 10
    end
    object qryPoItemParciaisIN_IND_PERIODICIDADE: TStringField
      FieldName = 'IN_IND_PERIODICIDADE'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisIN_REG_TRIB_IPI: TStringField
      FieldName = 'IN_REG_TRIB_IPI'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisQT_INICIAL_EST: TFloatField
      FieldName = 'QT_INICIAL_EST'
    end
    object qryPoItemParciaisCD_USUARIO_MONTA: TStringField
      FieldName = 'CD_USUARIO_MONTA'
      FixedChar = True
      Size = 4
    end
    object qryPoItemParciaisCD_MODALIDADE: TStringField
      FieldName = 'CD_MODALIDADE'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisNR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      FixedChar = True
      Size = 13
    end
    object qryPoItemParciaisIN_AVISO_DB: TStringField
      FieldName = 'IN_AVISO_DB'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisNR_ITEM_CLIENTE: TStringField
      FieldName = 'NR_ITEM_CLIENTE'
      FixedChar = True
      Size = 4
    end
    object qryPoItemParciaisTX_OBSERVACAO: TMemoField
      FieldName = 'TX_OBSERVACAO'
      BlobType = ftMemo
    end
    object qryPoItemParciaisIN_REEIMPORTACAO: TStringField
      FieldName = 'IN_REEIMPORTACAO'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisCD_AREA: TStringField
      FieldName = 'CD_AREA'
      FixedChar = True
      Size = 2
    end
    object qryPoItemParciaisCD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qryPoItemParciaisCD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      FixedChar = True
      Size = 4
    end
    object qryPoItemParciaisCD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qryPoItemParciaisNR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      FixedChar = True
      Size = 15
    end
    object qryPoItemParciaisNR_VOO: TStringField
      FieldName = 'NR_VOO'
      FixedChar = True
      Size = 18
    end
    object qryPoItemParciaisNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qryPoItemParciaisNR_COURRIER: TStringField
      FieldName = 'NR_COURRIER'
      FixedChar = True
      Size = 15
    end
    object qryPoItemParciaisIN_CONSOLIDADO: TStringField
      FieldName = 'IN_CONSOLIDADO'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisIN_URGENTE: TStringField
      FieldName = 'IN_URGENTE'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisIN_SEGURO: TStringField
      FieldName = 'IN_SEGURO'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisCD_MERC_FORNEC: TStringField
      FieldName = 'CD_MERC_FORNEC'
      FixedChar = True
      Size = 15
    end
    object qryPoItemParciaisTP_DRAWBACK: TStringField
      FieldName = 'TP_DRAWBACK'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisDT_ULT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ULT_ALTERACAO'
    end
    object qryPoItemParciaisNR_PROCESSO_DES: TStringField
      FieldName = 'NR_PROCESSO_DES'
      FixedChar = True
      Size = 18
    end
    object qryPoItemParciaisDT_ABERTURA_ITEM: TDateTimeField
      FieldName = 'DT_ABERTURA_ITEM'
    end
    object qryPoItemParciaiscalcNR_PROCESSO_DES: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNR_PROCESSO_DES'
      Size = 18
      Calculated = True
    end
    object qryPoItemParciaisIN_UTILIZADO_INSTR_DESEMB: TStringField
      FieldName = 'IN_UTILIZADO_INSTR_DESEMB'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisID_CODIGO_INSTR_DESEMB: TStringField
      FieldName = 'ID_CODIGO_INSTR_DESEMB'
      FixedChar = True
      Size = 13
    end
    object qryPoItemParciaisDT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
    end
    object qryPoItemParciaisIN_CORRECAO: TStringField
      FieldName = 'IN_CORRECAO'
      FixedChar = True
      Size = 1
    end
    object qryPoItemParciaisCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
  end
  object dtsPoItemParciais: TDataSource
    DataSet = qryPoItemParciais
    OnStateChange = dsProcessoStateChange
    Left = 684
    Top = 216
  end
  object qryTermoPagto: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TERMO_PAGTO, NM_TERMO_PAGTO FROM TTERMO_PAGTO(nolock)')
    Left = 309
    Top = 41
  end
  object dtsTermoPagto: TDataSource
    DataSet = qryTipoPedido
    Left = 391
    Top = 51
  end
end
