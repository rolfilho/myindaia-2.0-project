object frmArmazenagem: TfrmArmazenagem
  Left = 156
  Top = 114
  Width = 750
  Height = 550
  Caption = 'Controle de Despesas no Armaz'#233'm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    742
    523)
  PixelsPerInch = 96
  TextHeight = 13
  object scbBaseGeral: TScrollBox
    Left = 0
    Top = 51
    Width = 742
    Height = 411
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 3
  end
  object pnlCancelamentoDespesas: TPanel
    Left = 204
    Top = 88
    Width = 329
    Height = 321
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    Visible = False
    object pnl3: TPanel
      Left = 2
      Top = 2
      Width = 323
      Height = 38
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object lbl4: TLabel
        Left = 7
        Top = 6
        Width = 308
        Height = 26
        Caption = 
          'Selecione as despesas que n'#227'o devem ser calculadas para o proces' +
          'so e confirme.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 276
      Width = 323
      Height = 41
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 1
      object btnConfirmaCancelamento: TSpeedButton
        Left = 232
        Top = 6
        Width = 84
        Height = 29
        Caption = 'Confirmar'
        Flat = True
        OnClick = btnConfirmaCancelamentoClick
      end
      object btnCancelaCancelamento: TSpeedButton
        Left = 146
        Top = 6
        Width = 84
        Height = 29
        Caption = 'Cancelar'
        Flat = True
        OnClick = btnCancelaCancelamentoClick
      end
    end
    object scbCancelamento: TScrollBox
      Left = 8
      Top = 48
      Width = 185
      Height = 41
      BorderStyle = bsNone
      TabOrder = 2
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 51
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object lbl_cd_unid_neg: TLabel
      Left = 9
      Top = 8
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
    object btnConsUnidade: TSpeedButton
      Left = 245
      Top = 20
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
      OnClick = btnConsUnidadeClick
    end
    object lbl_cd_produto: TLabel
      Left = 281
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
    object btnConsProduto: TSpeedButton
      Left = 513
      Top = 21
      Width = 25
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
      OnClick = btnConsProdutoClick
    end
    object lbl_nr_processo: TLabel
      Left = 549
      Top = 8
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
    object btnConsProcesso: TSpeedButton
      Left = 634
      Top = 21
      Width = 25
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
      OnClick = btnConsProcessoClick
    end
    object edt_nm_unid_neg: TEdit
      Left = 37
      Top = 21
      Width = 207
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object edtUnidade: TEdit
      Left = 9
      Top = 21
      Width = 29
      Height = 21
      MaxLength = 2
      TabOrder = 0
      OnChange = btnConsUnidadeClick
      OnExit = edtUnidadeExit
    end
    object edt_nm_produto: TEdit
      Left = 309
      Top = 21
      Width = 203
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object edtProduto: TEdit
      Left = 281
      Top = 21
      Width = 29
      Height = 21
      MaxLength = 2
      TabOrder = 2
      OnChange = btnConsProdutoClick
      OnExit = edtProdutoExit
    end
    object edtProcesso: TEdit
      Left = 549
      Top = 21
      Width = 84
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 4
      OnExit = btnRefreshClick
    end
    object chkProcessos: TCheckBox
      Left = 665
      Top = 17
      Width = 71
      Height = 29
      Caption = #218'ltimos Processos'
      Checked = True
      State = cbChecked
      TabOrder = 5
      WordWrap = True
    end
  end
  object pnlTotais: TPanel
    Left = 0
    Top = 462
    Width = 742
    Height = 61
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object shp12: TShape
      Left = 417
      Top = 8
      Width = 38
      Height = 44
      Pen.Color = clGray
    end
    object shp11: TShape
      Left = 264
      Top = 11
      Width = 150
      Height = 40
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp9: TShape
      Left = 498
      Top = 8
      Width = 94
      Height = 18
      Pen.Color = clGray
    end
    object shp3: TShape
      Left = 593
      Top = 8
      Width = 142
      Height = 18
      Pen.Color = clGray
    end
    object lbl11: TLabel
      Left = 501
      Top = 12
      Width = 89
      Height = 13
      Caption = 'Qtde. Registros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object shp4: TShape
      Left = 498
      Top = 27
      Width = 94
      Height = 25
      Brush.Color = 14286809
      Pen.Color = clGray
    end
    object lbl14: TLabel
      Left = 595
      Top = 12
      Width = 138
      Height = 13
      Caption = 'Total Geral do Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object shp6: TShape
      Left = 593
      Top = 27
      Width = 142
      Height = 25
      Brush.Color = 16771797
      Pen.Color = clGray
    end
    object lblQtdeContainers: TLabel
      Left = 502
      Top = 32
      Width = 86
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblTotalGeralProcesso: TLabel
      Left = 597
      Top = 32
      Width = 134
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object shp2: TShape
      Left = 8
      Top = 11
      Width = 149
      Height = 41
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp5: TShape
      Left = 81
      Top = 8
      Width = 73
      Height = 18
      Pen.Color = clGray
    end
    object lbl1: TLabel
      Left = 90
      Top = 11
      Width = 60
      Height = 13
      Caption = 'Exibir na tela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object shp7: TShape
      Left = 159
      Top = 11
      Width = 103
      Height = 41
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp8: TShape
      Left = 203
      Top = 8
      Width = 56
      Height = 18
      Pen.Color = clGray
    end
    object lbl2: TLabel
      Left = 214
      Top = 11
      Width = 41
      Height = 13
      Caption = 'Previs'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lbl3: TLabel
      Left = 203
      Top = 33
      Width = 52
      Height = 13
      Caption = 'dias a mais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object btnRefresh: TSpeedButton
      Left = 423
      Top = 22
      Width = 26
      Height = 28
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
      OnClick = btnRefreshClick
    end
    object btnContainerCarga: TSpeedButton
      Left = 385
      Top = 27
      Width = 24
      Height = 20
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
      OnClick = btnContainerCargaClick
    end
    object shpContainerCarga: TShape
      Left = 310
      Top = 8
      Width = 101
      Height = 18
      Pen.Color = clGray
    end
    object lblContainerCarga: TLabel
      Left = 315
      Top = 11
      Width = 92
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Apenas o container'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lbl5: TLabel
      Left = 424
      Top = 11
      Width = 25
      Height = 13
      Caption = 'Filtrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object shp10: TShape
      Left = 457
      Top = 8
      Width = 38
      Height = 44
      Pen.Color = clGray
    end
    object lbl6: TLabel
      Left = 460
      Top = 11
      Width = 33
      Height = 13
      Caption = 'Config.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object btnCancelaDespesas: TSpeedButton
      Left = 463
      Top = 22
      Width = 26
      Height = 28
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
        000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
        99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
        0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
        FFFF3333337F337F333333333307B70FFFFF33333373FF733F333333333000FF
        0FFF3333333777337FF3333333333FF000FF33FFFFF3333777FF300000333300
        000F377777F33377777F30EEE0333000000037F337F33777777730EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F3333777F3300000333330
        00FF3777773333F77733333333333000033F3333333337777333}
      NumGlyphs = 2
      OnClick = btnCancelaDespesasClick
    end
    object rbContainer: TRadioButton
      Left = 12
      Top = 31
      Width = 63
      Height = 17
      Caption = 'Container'
      TabOrder = 0
      OnClick = rbContainerClick
    end
    object rbCargaSolta: TRadioButton
      Left = 80
      Top = 31
      Width = 74
      Height = 17
      Caption = 'Carga Solta'
      TabOrder = 1
      OnClick = rbCargaSoltaClick
    end
    object seDiasMais: TSpinEdit
      Left = 165
      Top = 24
      Width = 36
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
    object rbTudo: TRadioButton
      Left = 12
      Top = 15
      Width = 47
      Height = 17
      Caption = 'Tudo'
      Checked = True
      TabOrder = 3
      TabStop = True
      OnClick = rbTudoClick
    end
    object edtContainerCarga: TEdit
      Left = 269
      Top = 27
      Width = 115
      Height = 20
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvNone
      CharCase = ecUpperCase
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 14
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
  end
  object pnlAguarde: TPanel
    Left = 256
    Top = 188
    Width = 225
    Height = 72
    BevelOuter = bvNone
    BorderWidth = 2
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 221
      Height = 68
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object shp1: TShape
        Left = 4
        Top = 4
        Width = 213
        Height = 60
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lbl18: TLabel
        Left = 76
        Top = 9
        Width = 71
        Height = 16
        Caption = 'aguarde...'
      end
      object lbl19: TLabel
        Left = 15
        Top = 30
        Width = 191
        Height = 26
        Alignment = taCenter
        Caption = 'o sistema est'#225' desenhando a tela'#13#10'e realizando os c'#225'lculos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object pnlMostraCalculo: TPanel
    Left = 383
    Top = 317
    Width = 353
    Height = 137
    Anchors = [akRight, akBottom]
    BevelInner = bvLowered
    Color = clMoneyGreen
    TabOrder = 5
    Visible = False
    object ScrollBox1: TScrollBox
      Left = 11
      Top = 28
      Width = 335
      Height = 101
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clWhite
      ParentColor = False
      TabOrder = 0
      object lblCalculos: TLabel
        Left = 0
        Top = 4
        Width = 335
        Height = 13
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object pnl6: TPanel
        Left = 0
        Top = 0
        Width = 335
        Height = 4
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
      end
    end
    object pnl5: TPanel
      Left = 6
      Top = 5
      Width = 341
      Height = 21
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 1
      object shp13: TShape
        Left = 0
        Top = 0
        Width = 341
        Height = 21
        Align = alClient
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lbl8: TLabel
        Left = 4
        Top = 5
        Width = 294
        Height = 13
        Caption = 'Veja como foi calculado o per'#237'odo desse container:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnl4: TPanel
      Left = 324
      Top = 3
      Width = 25
      Height = 25
      BevelInner = bvLowered
      Color = clMoneyGreen
      TabOrder = 2
      object btnFecharClaculos: TSpeedButton
        Left = 6
        Top = 5
        Width = 15
        Height = 15
        Caption = 'X'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnFecharClaculosClick
      end
    end
    object pnl7: TPanel
      Left = 7
      Top = 28
      Width = 4
      Height = 101
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 3
    end
  end
end
