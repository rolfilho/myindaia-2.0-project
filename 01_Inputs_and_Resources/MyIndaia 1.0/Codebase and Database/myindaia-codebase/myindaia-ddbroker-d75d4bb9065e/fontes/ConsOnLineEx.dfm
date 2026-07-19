object frmConsOnLineEx: TfrmConsOnLineEx
  Left = 153
  Top = 100
  BorderStyle = bsDialog
  Caption = 'Consulta onLine'
  ClientHeight = 523
  ClientWidth = 742
  Color = 13160660
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 68
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      742
      68)
    object Shape4: TShape
      Left = 5
      Top = 5
      Width = 520
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = 11711154
      Pen.Color = clGray
    end
    object Shape3: TShape
      Left = 5
      Top = 27
      Width = 520
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = 13424345
      Pen.Color = clGray
    end
    object Shape1: TShape
      Left = 526
      Top = 5
      Width = 211
      Height = 21
      Anchors = [akTop, akRight]
      Brush.Color = 11711154
      Pen.Color = clGray
    end
    object Label1: TLabel
      Left = 530
      Top = 9
      Width = 64
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pesquisa por:'
      Transparent = True
    end
    object lblCriterioPesquisa: TLabel
      Left = 599
      Top = 9
      Width = 134
      Height = 13
      Anchors = [akTop, akRight]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6316128
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Shape2: TShape
      Left = 526
      Top = 27
      Width = 211
      Height = 40
      Anchors = [akTop, akRight]
      Brush.Color = 13424345
      Pen.Color = clGray
    end
    object Label3: TLabel
      Left = 8
      Top = 9
      Width = 513
      Height = 13
      AutoSize = False
      Caption = 'Empresa Nacional'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 9
      Top = 10
      Width = 513
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Empresa Nacional'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4868682
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtPesquisa: TEdit
      Left = 533
      Top = 36
      Width = 197
      Height = 22
      Anchors = [akTop, akRight]
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvNone
      Color = 14221052
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnChange = edtPesquisaChange
    end
    object Panel4: TPanel
      Left = 6
      Top = 28
      Width = 518
      Height = 38
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      Color = 13424345
      TabOrder = 1
      DesignSize = (
        518
        38)
      object btn_sair: TSpeedButton
        Left = 480
        Top = 2
        Width = 36
        Height = 34
        Hint = 'Sai e n'#227'o retorna valor'
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
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
        OnClick = btn_sairClick
      end
      object btn_refresh: TSpeedButton
        Left = 438
        Top = 2
        Width = 36
        Height = 34
        Hint = 'Atualizar Resultado'
        Flat = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000220B0000220B0000000100000001000000840000088C
          0800108C080018941000219410001894180029941800219C2100299C210029A5
          2900E78C31005AA53900B56B4A006BAD4A0073AD4A008C6B5200946B5200E79C
          5200A5635A00A56B5A00BD7B5A0084B55A00FFB55A0063BD6300A5636B00A573
          6B00BD846B00C6846B00D6946B00A5B56B0073BD6B00DE9C7300CEB5730094BD
          73009CBD7300ADBD730073C673007BC6730084C6730094C673009CC67300E7AD
          7B00DEBD7B00EFBD7B009CC67B00EFC67B00EFBD84009CC68400EFC68400F7C6
          840084CE8400EFC68C00F7CE8C00B5AD9400ADB59400EFC69400A5CE9400C6CE
          9400D6CE9400E7CE9400F7CE9400BDCE9C00EFCE9C00BDD69C00EFCEA500ADD6
          A500BDD6A500F7D6A500A5DEA500EFD6AD00F7D6AD00B5DEAD00DECEB500F7D6
          B500F7DEB500F7DEBD00DEC6C600FFEFC600FFEFCE00E7E7D600F7EFD600FFEF
          DE00DEF7DE00E7F7DE00FFEFE700E7F7E700FFF7E700F7F7EF00FFF7EF00FFF7
          F700F7FFF700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005C5C18181818
          1818181818181818185C5C5C184D393A3E3B302E2B2E2E30185C5C5C184E2208
          0D04040B202B2B30185C5C5C12513D0200000000062A2B30185C5C5C12563D03
          0003230E000E2E30185C5C5C19584201000015401D0D3330185C5C5C195D4F38
          2F212245402C3733185C5C5C1A5D4454502F212122403E3C185C5C5C1A5D2441
          5426000001454043185C5C5C1C5D32002541050002494640185C5C5C1C5D5709
          00000000024E4835185C5C5C1F5D5D521707071E08101313185C5C5C1F5D5D5D
          5D52525B360F110A0C5C5C5C295D5D5D5D5D5D5D4C1316145C5C5C5C29575757
          575757574C131A5C5C5C5C5C291C1C1C1C1C1C1C1C135C5C5C5C}
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_refreshClick
      end
      object pnl_filtrar: TPanel
        Left = 39
        Top = 0
        Width = 39
        Height = 38
        Align = alLeft
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object btn_filtrar: TSpeedButton
          Left = 2
          Top = 2
          Width = 36
          Height = 34
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
            55555575555555775F55509999999901055557F55555557F75F5001111111101
            105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
            01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
            8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
            0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
            0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
            05555555575FF777755555555500055555555555557775555555}
          NumGlyphs = 2
          OnClick = btn_filtrarClick
        end
      end
      object pnl_incluir: TPanel
        Left = 0
        Top = 0
        Width = 39
        Height = 38
        Align = alLeft
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        Visible = False
        object btn_incluir: TSpeedButton
          Left = 3
          Top = 2
          Width = 36
          Height = 34
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
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
          OnClick = btn_incluirClick
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 68
    Width = 742
    Height = 428
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 1
    object gridConsOnLine: TDBGrid
      Left = 5
      Top = 72
      Width = 732
      Height = 351
      Hint = 
        'Duplo-clique para retornar o valor selecionado.'#13#10'Clique em Sair ' +
        'para n'#227'o retornar valor'
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsConOnLine
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = gridConsOnLineDblClick
      OnKeyDown = gridConsOnLineKeyDown
      OnKeyPress = gridConsOnLineKeyPress
      OnMouseMove = gridConsOnLineMouseMove
      OnTitleClick = gridConsOnLineTitleClick
    end
    object pnlFiltro: TPanel
      Left = 200
      Top = 119
      Width = 353
      Height = 194
      BorderWidth = 2
      TabOrder = 1
      Visible = False
      object Bevel1: TBevel
        Left = 8
        Top = 145
        Width = 337
        Height = 41
        Shape = bsFrame
        Style = bsRaised
      end
      object SpeedButton1: TSpeedButton
        Left = 249
        Top = 150
        Width = 91
        Height = 31
        Caption = '&Aplicar Filtros'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
          8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
          0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
          0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
          05555555575FF777755555555500055555555555557775555555}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 156
        Top = 150
        Width = 91
        Height = 31
        Caption = '&Cancelar'
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
        Spacing = 15
        OnClick = SpeedButton2Click
      end
      object Label4: TLabel
        Left = 18
        Top = 38
        Width = 116
        Height = 13
        Caption = 'Campos Dispon'#237'veis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 18
        Top = 94
        Width = 114
        Height = 13
        Caption = 'Crit'#233'rio de Pesquisa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape5: TShape
        Left = 9
        Top = 85
        Width = 336
        Height = 54
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label6: TLabel
        Left = 176
        Top = 94
        Width = 84
        Height = 13
        Caption = 'Palavra Chave'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape6: TShape
        Left = 9
        Top = 30
        Width = 336
        Height = 54
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Panel5: TPanel
        Left = 3
        Top = 3
        Width = 347
        Height = 19
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Filtragem de Registros da Consulta OnLine'
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object cmbCampos: TComboBox
        Left = 19
        Top = 52
        Width = 145
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 1
      end
      object cmbPesquisa: TComboBox
        Left = 19
        Top = 108
        Width = 145
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 2
        Items.Strings = (
          'que comece com'
          'que termine com'
          'igual a'
          'diferente de'
          'que contenha'
          'maior que'
          'menor que')
      end
      object edtPalavraChave: TEdit
        Left = 177
        Top = 108
        Width = 158
        Height = 21
        TabOrder = 3
      end
    end
    object pnl_texto_referencia: TPanel
      Left = 5
      Top = 5
      Width = 732
      Height = 67
      Align = alTop
      TabOrder = 2
      Visible = False
      object Label7: TLabel
        Left = 1
        Top = 1
        Width = 730
        Height = 15
        Align = alTop
        AutoSize = False
        Caption = 'Texto de Referencia'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object mem_texto_referencia: TMemo
        Left = 1
        Top = 16
        Width = 730
        Height = 50
        Align = alClient
        Color = 14548991
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 496
    Width = 742
    Height = 27
    Align = alBottom
    BevelInner = bvLowered
    Color = clSilver
    TabOrder = 2
    object lblNoOrder: TLabel
      Left = 7
      Top = 7
      Width = 233
      Height = 13
      Caption = '* N'#227'o '#233' poss'#237'vel reordenar o grid nessa consulta.'
      Visible = False
    end
    object shpVerde: TShape
      Left = 7
      Top = 7
      Width = 12
      Height = 13
      Brush.Color = 14548949
    end
    object lblOrdenadoPor: TLabel
      Left = 25
      Top = 7
      Width = 197
      Height = 13
      Caption = 'A consulta est'#225' ordenada por esta coluna'
    end
  end
  object qryConsOnLine: TQuery
    DatabaseName = 'DBBROKER'
    UpdateMode = upWhereChanged
    Left = 619
    Top = 148
  end
  object dsConOnLine: TDataSource
    DataSet = qryConsOnLine
    Left = 619
    Top = 92
  end
end
