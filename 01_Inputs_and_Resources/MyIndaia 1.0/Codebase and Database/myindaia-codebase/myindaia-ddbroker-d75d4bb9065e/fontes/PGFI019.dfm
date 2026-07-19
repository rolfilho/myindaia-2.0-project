object frm_pesq_fin: Tfrm_pesq_fin
  Left = 289
  Top = 148
  Width = 750
  Height = 550
  Caption = 'Pesquisa Financeiro'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_pesq_adm: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 43
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      43)
    object btn_sair: TSpeedButton
      Left = 700
      Top = 4
      Width = 36
      Height = 35
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
      OnClick = btn_sairClick
    end
    object btn_pesquisa: TSpeedButton
      Left = 5
      Top = 4
      Width = 36
      Height = 35
      Hint = 'Pesquisar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
        BB0BBBBBBBBBBBBBBF8FBBBBBBBBBBBBB000BBBBBBBBBBBBF888BBBBBBBBBBBB
        000BBBBBBBBBBBBF888BBBBBBBBBBBB000BBBBBBBBBBBBF888BBBBBBBBBBBB00
        0BBBBBBBBFFFBF888BBBBBB80008BB80BBBBBBBF8883F888BBBBBB08888800BB
        BBBBBB887778888BBBBBB08FFFFF80BBBBBBB8F7777778FBBBBB88FFFFFFF88B
        BBBBB8777777783FBBBB08FFFFFFF80BBBBB8F777777778FBBBB08FFFFFFF80B
        BBBB8F777777778FBBBB08FFFFFFF80BBBBB83F77777778BBBBB88FFFFFFF88B
        BBBBB8F7777778FBBBBBB08FFFFF80BBBBBBB83FF777F8BBBBBBBB0888880BBB
        BBBBBB883FF88BBBBBBBBBB80008BBBBBBBBBBBB888BBBBBBBBB}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_pesquisaClick
    end
  end
  object pgctrl_pesq_fin: TPageControl
    Left = 0
    Top = 43
    Width = 742
    Height = 461
    ActivePage = ts_filtros
    Align = alClient
    HotTrack = True
    TabOrder = 1
    OnChanging = pgctrl_pesq_finChanging
    object ts_filtros: TTabSheet
      Caption = 'Filtros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object lbl_favorecido: TLabel
        Left = 339
        Top = 194
        Width = 64
        Height = 13
        Caption = 'Favorecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_favorecido: TSpeedButton
        Left = 621
        Top = 206
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
        OnClick = btn_co_favorecidoClick
      end
      object lbl_unid_neg: TLabel
        Left = 21
        Top = 15
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
      object btn_co_unid_neg: TSpeedButton
        Left = 295
        Top = 27
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
        OnClick = btn_co_unid_negClick
      end
      object lbl_banco: TLabel
        Left = 21
        Top = 194
        Width = 37
        Height = 13
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_banco: TSpeedButton
        Left = 295
        Top = 206
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
        OnClick = btn_co_bancoClick
      end
      object lbl_valor: TLabel
        Left = 22
        Top = 104
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_nr_docto: TLabel
        Left = 148
        Top = 104
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'N'#186' Docto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_historico: TLabel
        Left = 22
        Top = 238
        Width = 51
        Height = 13
        Caption = 'Hist'#243'rico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_historico: TSpeedButton
        Left = 295
        Top = 250
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
        OnClick = btn_co_historicoClick
      end
      object btn_co_ct_contabil: TSpeedButton
        Left = 409
        Top = 71
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
        OnClick = btn_co_ct_contabilClick
      end
      object lbl_ct_contabil: TLabel
        Left = 21
        Top = 59
        Width = 84
        Height = 13
        Caption = 'Conta Cont'#225'bil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_inicio: TLabel
        Left = 22
        Top = 149
        Width = 34
        Height = 13
        Caption = 'In'#237'cio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_fim: TLabel
        Left = 149
        Top = 149
        Width = 20
        Height = 13
        Caption = 'Fim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_produto: TLabel
        Left = 338
        Top = 15
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
      object btn_co_produto: TSpeedButton
        Left = 610
        Top = 27
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
        OnClick = btn_co_produtoClick
      end
      object lbl_item: TLabel
        Left = 276
        Top = 104
        Width = 25
        Height = 13
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item: TSpeedButton
        Left = 552
        Top = 116
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
        OnClick = btn_co_itemClick
      end
      object lbl_processo: TLabel
        Left = 276
        Top = 149
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
      object btn_co_processo: TSpeedButton
        Left = 382
        Top = 161
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
        OnClick = btn_co_processoClick
      end
      object edt_nm_favorecido: TEdit
        Left = 387
        Top = 207
        Width = 233
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
      end
      object edt_nm_unid_neg: TEdit
        Left = 61
        Top = 28
        Width = 233
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
      end
      object edt_nm_banco: TEdit
        Left = 68
        Top = 207
        Width = 226
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 17
      end
      object edt_nm_historico: TEdit
        Left = 68
        Top = 251
        Width = 226
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
      end
      object edt_nm_ct_contabil: TEdit
        Left = 99
        Top = 72
        Width = 309
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 19
      end
      object rdgrp_tp_natureza: TRadioGroup
        Left = 22
        Top = 289
        Width = 167
        Height = 107
        Caption = 'Natureza'
        Items.Strings = (
          'Ambos'
          'Cr'#233'dito'
          'D'#233'bito')
        TabOrder = 12
        OnExit = msk_cd_unid_negExit
      end
      object edt_nm_produto: TEdit
        Left = 376
        Top = 28
        Width = 233
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 20
      end
      object edt_nm_item: TEdit
        Left = 318
        Top = 117
        Width = 233
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 21
      end
      object rdgrp_tp_lancamento: TRadioGroup
        Left = 206
        Top = 289
        Width = 166
        Height = 107
        Caption = 'Tipo de Lan'#231'amento'
        Items.Strings = (
          'Ambos'
          'Administrativo'
          'Faturamento')
        TabOrder = 13
        TabStop = True
        OnExit = msk_cd_unid_negExit
      end
      object rdgrp_tp_forma_pagto: TRadioGroup
        Left = 389
        Top = 289
        Width = 324
        Height = 107
        Caption = 'Tipo de Pagamento'
        Columns = 3
        Items.Strings = (
          'Todas'
          'Dinheiro'
          'Cheque'
          'TED'
          'DOC/D'#233'b. Conta'
          'L&&P'
          'Outros')
        TabOrder = 14
        TabStop = True
        OnExit = msk_cd_unid_negExit
      end
      object msk_dt_inicio: TDateEdit
        Left = 22
        Top = 162
        Width = 106
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 6
        OnExit = msk_dt_inicioExit
      end
      object msk_dt_fim: TDateEdit
        Left = 149
        Top = 162
        Width = 106
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 7
        OnEnter = msk_dt_fimEnter
        OnExit = msk_dt_fimExit
      end
      object msk_cd_unid_neg: TMaskEdit
        Left = 22
        Top = 28
        Width = 40
        Height = 21
        EditMask = '!99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 2
        ParentFont = False
        TabOrder = 0
        OnChange = btn_co_unid_negClick
        OnEnter = msk_cd_unid_negEnter
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_produto: TMaskEdit
        Left = 339
        Top = 28
        Width = 38
        Height = 21
        EditMask = '!99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 2
        ParentFont = False
        TabOrder = 1
        OnChange = btn_co_produtoClick
        OnEnter = msk_cd_produtoEnter
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_ct_contabil: TMaskEdit
        Left = 22
        Top = 72
        Width = 78
        Height = 21
        EditMask = '999.99.99999;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 12
        ParentFont = False
        TabOrder = 2
        OnChange = btn_co_ct_contabilClick
        OnEnter = msk_cd_ct_contabilEnter
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_valor: TMaskEdit
        Left = 22
        Top = 117
        Width = 105
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnExit = msk_valorExit
      end
      object msk_nr_docto: TMaskEdit
        Left = 149
        Top = 117
        Width = 105
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 6
        ParentFont = False
        TabOrder = 4
      end
      object msk_cd_item: TMaskEdit
        Left = 276
        Top = 117
        Width = 43
        Height = 21
        EditMask = '!999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 5
        OnChange = btn_co_itemClick
        OnEnter = msk_cd_itemEnter
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_nr_processo: TMaskEdit
        Left = 276
        Top = 162
        Width = 105
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnEnter = msk_nr_processoEnter
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_banco: TMaskEdit
        Left = 22
        Top = 207
        Width = 47
        Height = 21
        EditMask = '!999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 9
        OnChange = btn_co_bancoClick
        OnEnter = msk_cd_bancoEnter
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_historico: TMaskEdit
        Left = 22
        Top = 251
        Width = 47
        Height = 21
        EditMask = '!999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 11
        OnChange = btn_co_historicoClick
        OnEnter = msk_cd_historicoEnter
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_favorecido: TMaskEdit
        Left = 339
        Top = 207
        Width = 49
        Height = 21
        EditMask = '!99999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 10
        OnChange = btn_co_favorecidoClick
        OnEnter = msk_cd_favorecidoEnter
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
    end
    object ts_adm: TTabSheet
      BorderWidth = 2
      Caption = 'Administrativo'
      OnEnter = ts_admEnter
      object shp1: TShape
        Left = 0
        Top = 0
        Width = 730
        Height = 54
        Align = alTop
        Brush.Style = bsClear
      end
      object Label12: TLabel
        Left = 11
        Top = 9
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
      object dbedt_nm_unid_neg_adm: TDBEdit
        Left = 53
        Top = 22
        Width = 260
        Height = 21
        TabStop = False
        DataField = 'LookUnidNeg'
        DataSource = ds_adm
        ParentColor = True
        TabOrder = 0
      end
      object dbedt_cd_unid_neg_adm: TDBEdit
        Left = 11
        Top = 22
        Width = 43
        Height = 21
        TabStop = False
        DataField = 'CD_UNID_NEG'
        DataSource = ds_adm
        ParentColor = True
        TabOrder = 1
      end
      object pgctrl_contabil: TPageControl
        Left = 0
        Top = 61
        Width = 730
        Height = 368
        ActivePage = ts_dados_contabil
        Align = alClient
        HotTrack = True
        TabOrder = 2
        object ts_lista_contabil: TTabSheet
          Caption = '    &Lista    '
          object dbg_contabil: TDBGrid
            Left = 0
            Top = 0
            Width = 722
            Height = 340
            Align = alClient
            Color = clWhite
            DataSource = ds_adm
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = dbg_contabilDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'NR_LANCAMENTO'
                Title.Caption = 'Lan'#231'.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 54
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_LANCAMENTO_SELECIONADO'
                Title.Caption = 'Lan'#231'.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 54
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_CT_CONTABIL'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 86
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookCtContabil'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_LANCAMENTO'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookNatureza'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_MOVIMENTO'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookCancelado'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calcIN_SELECIONADO'
                Font.Charset = SYMBOL_CHARSET
                Font.Color = clTeal
                Font.Height = -12
                Font.Name = 'Wingdings'
                Font.Style = [fsBold]
                Title.Caption = 'Selec.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end>
          end
        end
        object ts_dados_contabil: TTabSheet
          Caption = '   &Dados B'#225'sicos   '
          object pnl_caixa_contabil: TPanel
            Left = 0
            Top = 0
            Width = 722
            Height = 340
            Align = alClient
            BevelInner = bvLowered
            Enabled = False
            TabOrder = 0
            object lbl_nr_lanc_contabil: TLabel
              Left = 631
              Top = 20
              Width = 70
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lan'#231'amento'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label1: TLabel
              Left = 136
              Top = 55
              Width = 82
              Height = 13
              Caption = 'Contra Partida'
              FocusControl = dbedt_nm_ct_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_historico_contabil: TLabel
              Left = 20
              Top = 94
              Width = 51
              Height = 13
              Caption = 'Hist'#243'rico'
              FocusControl = dbedt_nm_historico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_vl_lanc_contabil: TLabel
              Left = 16
              Top = 187
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor'
              FocusControl = dbedt_vl_lanc_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_cd_ct_custo: TLabel
              Left = 334
              Top = 289
              Width = 33
              Height = 13
              Caption = 'Custo'
              FocusControl = dbedt_nm_ct_custo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_banco_contabil: TLabel
              Left = 219
              Top = 246
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Banco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_nr_cheque_contabil: TLabel
              Left = 219
              Top = 289
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Docto N'#186
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_favorecido_adm: TLabel
              Left = 19
              Top = 16
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Favorecido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 147
              Top = 187
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'IR-Fonte'
              FocusControl = dbedt_vl_ir_contabil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_acesso: TLabel
              Left = 20
              Top = 55
              Width = 42
              Height = 13
              Caption = 'Acesso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_aux: TLabel
              Left = 79
              Top = 55
              Width = 22
              Height = 13
              Caption = 'Aux'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_contabiliza: TLabel
              Left = 464
              Top = 188
              Width = 63
              Height = 13
              Caption = 'Contabiliza'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_cancelado: TLabel
              Left = 544
              Top = 188
              Width = 61
              Height = 13
              Caption = 'Cancelado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 503
              Top = 245
              Width = 88
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dt. Concilia'#231#227'o'
              FocusControl = dbedt_dt_conc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_nr_lanc_contabil: TDBEdit
              Left = 634
              Top = 33
              Width = 64
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NR_LANCAMENTO'
              DataSource = ds_adm
              MaxLength = 3
              ReadOnly = True
              TabOrder = 12
            end
            object dbedt_nm_ct_contabil: TDBEdit
              Left = 215
              Top = 68
              Width = 269
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookCtContabil'
              DataSource = ds_adm
              ReadOnly = True
              TabOrder = 13
            end
            object dbedt_nm_historico: TDBEdit
              Left = 98
              Top = 107
              Width = 357
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookHistorico'
              DataSource = ds_adm
              ReadOnly = True
              TabOrder = 14
            end
            object dbedt_cd_historico: TDBEdit
              Left = 20
              Top = 107
              Width = 79
              Height = 21
              DataField = 'CD_HIST_PADRAO'
              DataSource = ds_adm
              MaxLength = 8
              TabOrder = 4
            end
            object dbedt_vl_lanc_contabil: TDBEdit
              Left = 16
              Top = 200
              Width = 101
              Height = 21
              DataField = 'VL_LANCAMENTO'
              DataSource = ds_adm
              TabOrder = 5
            end
            object dbrdgrp_natureza: TDBRadioGroup
              Left = 269
              Top = 187
              Width = 181
              Height = 49
              Caption = 'Natureza'
              Columns = 2
              DataField = 'TP_NATUREZA'
              DataSource = ds_adm
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Cr'#233'dito'
                'D'#233'bito')
              ParentFont = False
              TabOrder = 7
              Values.Strings = (
                'C'
                'D')
            end
            object dbedt_nm_ct_custo: TDBEdit
              Left = 371
              Top = 302
              Width = 217
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookCtCusto'
              DataSource = ds_adm
              ReadOnly = True
              TabOrder = 15
            end
            object dbedt_nm_banco_contabil: TDBEdit
              Left = 257
              Top = 259
              Width = 235
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookBanco'
              DataSource = ds_adm
              ReadOnly = True
              TabOrder = 16
            end
            object dbedt_cd_banco_contabil: TDBEdit
              Left = 220
              Top = 259
              Width = 38
              Height = 21
              DataField = 'CD_BANCO'
              DataSource = ds_adm
              TabOrder = 9
            end
            object dbedt_nr_cheque_contabil: TDBEdit
              Left = 220
              Top = 302
              Width = 104
              Height = 21
              DataField = 'NR_CHEQUE'
              DataSource = ds_adm
              TabOrder = 10
            end
            object dbrdgrp_forma_pagto_contabil: TDBRadioGroup
              Left = 17
              Top = 232
              Width = 188
              Height = 91
              Caption = '&Forma de Pagamento'
              DataField = 'TP_PAGAMENTO'
              DataSource = ds_adm
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Dinheiro'
                'Cheque'
                'TED'
                'DOC / D'#233'bito Conta')
              ParentFont = False
              TabOrder = 8
              Values.Strings = (
                '$'
                'C'
                'T'
                'D')
            end
            object dbedt_nm_favorecido_adm: TDBEdit
              Left = 68
              Top = 29
              Width = 387
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookFavorecido'
              DataSource = ds_adm
              ReadOnly = True
              TabOrder = 17
            end
            object dbedt_vl_ir_contabil: TDBEdit
              Left = 148
              Top = 200
              Width = 101
              Height = 21
              DataField = 'VL_IR'
              DataSource = ds_adm
              TabOrder = 6
            end
            object dbedt_cd_favorecido_adm: TDBEdit
              Left = 20
              Top = 29
              Width = 49
              Height = 21
              DataField = 'CD_FAVORECIDO'
              DataSource = ds_adm
              TabOrder = 0
            end
            object dbedt_cd_acesso: TDBEdit
              Left = 20
              Top = 68
              Width = 32
              Height = 21
              DataField = 'CD_ACESSO'
              DataSource = ds_adm
              TabOrder = 1
            end
            object dbedt_cd_aux: TDBEdit
              Left = 78
              Top = 68
              Width = 32
              Height = 21
              DataField = 'CD_AUX'
              DataSource = ds_adm
              TabOrder = 2
            end
            object DBComboBox2: TDBComboBox
              Left = 465
              Top = 201
              Width = 63
              Height = 21
              DataField = 'LookContabiliza'
              DataSource = ds_adm
              ItemHeight = 13
              TabOrder = 18
            end
            object DBComboBox3: TDBComboBox
              Left = 545
              Top = 201
              Width = 63
              Height = 21
              DataField = 'LookCancelado'
              DataSource = ds_adm
              ItemHeight = 13
              TabOrder = 19
            end
            object dbedt_dt_conc: TDBEdit
              Left = 504
              Top = 258
              Width = 76
              Height = 21
              DataField = 'DT_CONCILIACAO'
              DataSource = ds_adm
              TabOrder = 20
            end
            object dbedt_cd_ct_custo: TDBEdit
              Left = 335
              Top = 302
              Width = 37
              Height = 21
              DataField = 'CD_CT_CUSTO'
              DataSource = ds_adm
              TabOrder = 11
            end
            object dbedt_cd_ct_contabil: TDBEdit
              Left = 137
              Top = 68
              Width = 79
              Height = 21
              DataField = 'CD_CT_CONTABIL'
              DataSource = ds_adm
              TabOrder = 3
            end
          end
          object dbm_nm_hist_contabil: TDBMemo
            Left = 98
            Top = 128
            Width = 357
            Height = 49
            AutoDisplay = False
            DataField = 'NM_HISTORICO'
            DataSource = ds_adm
            MaxLength = 180
            TabOrder = 1
          end
        end
      end
      object pnl1: TPanel
        Left = 0
        Top = 54
        Width = 730
        Height = 7
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
      end
    end
    object ts_fat: TTabSheet
      Caption = 'Faturamento'
      OnEnter = ts_fatEnter
      object shp2: TShape
        Left = 0
        Top = 0
        Width = 734
        Height = 54
        Align = alTop
        Brush.Style = bsClear
      end
      object Label4: TLabel
        Left = 10
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
      object dbedt_nm_unid_neg_fat: TDBEdit
        Left = 53
        Top = 23
        Width = 260
        Height = 21
        TabStop = False
        DataField = 'LookUnidNeg'
        DataSource = ds_fat
        ParentColor = True
        TabOrder = 0
      end
      object dbedt_cd_unid_neg_fat: TDBEdit
        Left = 11
        Top = 23
        Width = 43
        Height = 21
        TabStop = False
        DataField = 'CD_UNID_NEG'
        DataSource = ds_fat
        ParentColor = True
        TabOrder = 1
      end
      object pgctrl_fatur: TPageControl
        Left = 0
        Top = 61
        Width = 734
        Height = 372
        ActivePage = ts_dados_fatur
        Align = alClient
        HotTrack = True
        TabOrder = 2
        object ts_lista_fatur: TTabSheet
          Caption = '    &Lista    '
          object dbg_fatur: TDBGrid
            Left = 0
            Top = 0
            Width = 726
            Height = 344
            Align = alClient
            Color = clWhite
            DataSource = ds_fat
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = dbg_faturDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'NR_LANCAMENTO'
                Title.Caption = 'Lan'#231'.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 54
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_LANCAMENTO_SELECIONADO'
                Title.Caption = 'Lan'#231'.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 54
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookFavorecido'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 172
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CalcNrProcesso'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 62
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookItem'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 137
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_LANCAMENTO'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 91
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_MOVIMENTO'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 76
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calcIN_SELECIONADO'
                Font.Charset = SYMBOL_CHARSET
                Font.Color = clTeal
                Font.Height = -12
                Font.Name = 'Wingdings'
                Font.Style = [fsBold]
                Title.Caption = 'Selec.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end>
          end
        end
        object ts_dados_fatur: TTabSheet
          Caption = '   &Dados B'#225'sicos   '
          object pnl_caixa_fatur: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 344
            Align = alClient
            BevelInner = bvLowered
            Enabled = False
            TabOrder = 0
            object lbl_nr_lanc_fatur: TLabel
              Left = 636
              Top = 10
              Width = 70
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lan'#231'amento'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label5: TLabel
              Left = 18
              Top = 13
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Favorecido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 18
              Top = 91
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Processo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_cliente: TLabel
              Left = 160
              Top = 92
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 19
              Top = 131
              Width = 25
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Item'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_vl_lanc_fatur: TLabel
              Left = 19
              Top = 173
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor'
              FocusControl = dbedt_vl_lanc_fatur
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_vl_ir: TLabel
              Left = 148
              Top = 173
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'IR-Fonte'
              FocusControl = dbedt_vl_ir
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_despachante: TLabel
              Left = 273
              Top = 173
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = 'Despachante'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_vl_assist: TLabel
              Left = 538
              Top = 173
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'C.Assist.'
              FocusControl = dbedt_vl_assist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_banco_fatur: TLabel
              Left = 225
              Top = 216
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Banco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_nr_cheque_fatur: TLabel
              Left = 225
              Top = 256
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cheque N'#186
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label13: TLabel
              Left = 301
              Top = 131
              Width = 79
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Complemento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblAtivo: TLabel
              Left = 570
              Top = 131
              Width = 44
              Height = 13
              Caption = 'Restitui'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_cancelado_fat: TLabel
              Left = 309
              Top = 12
              Width = 61
              Height = 13
              Caption = 'Cancelado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 18
              Top = 52
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
            object lbl_produto_fat: TLabel
              Left = 329
              Top = 52
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel
              Left = 356
              Top = 256
              Width = 82
              Height = 13
              Caption = 'Contra Partida'
              FocusControl = dbedt_nm_ct_contabilF
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl1: TLabel
              Left = 522
              Top = 216
              Width = 88
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dt. Concilia'#231#227'o'
              FocusControl = dbedt_vl_assist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_nr_lanc_fatur: TDBEdit
              Left = 639
              Top = 25
              Width = 66
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NR_LANCAMENTO'
              DataSource = ds_fat
              MaxLength = 3
              ReadOnly = True
              TabOrder = 10
            end
            object dbedt_nm_favorecido: TDBEdit
              Left = 67
              Top = 26
              Width = 218
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookFavorecido'
              DataSource = ds_fat
              ReadOnly = True
              TabOrder = 11
            end
            object dbedt_nm_item: TDBEdit
              Left = 56
              Top = 144
              Width = 228
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookItem'
              DataSource = ds_fat
              ReadOnly = True
              TabOrder = 12
            end
            object dbedt_nm_hist_fatur: TDBEdit
              Left = 306
              Top = 144
              Width = 237
              Height = 21
              DataField = 'NM_HISTORICO'
              DataSource = ds_fat
              MaxLength = 30
              TabOrder = 2
            end
            object dbedt_vl_lanc_fatur: TDBEdit
              Left = 19
              Top = 186
              Width = 101
              Height = 21
              DataField = 'VL_LANCAMENTO'
              DataSource = ds_fat
              TabOrder = 3
            end
            object dbedt_vl_ir: TDBEdit
              Left = 148
              Top = 186
              Width = 101
              Height = 21
              DataField = 'VL_IR'
              DataSource = ds_fat
              TabOrder = 4
            end
            object dbedt_nm_despachante: TDBEdit
              Left = 309
              Top = 186
              Width = 206
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookDespachante'
              DataSource = ds_fat
              ReadOnly = True
              TabOrder = 13
            end
            object dbedt_vl_assist: TDBEdit
              Left = 539
              Top = 186
              Width = 82
              Height = 21
              DataField = 'VL_ASSIST'
              DataSource = ds_fat
              TabOrder = 6
            end
            object dbrdgrp_forma_pagto_fatur: TDBRadioGroup
              Left = 19
              Top = 219
              Width = 189
              Height = 109
              Caption = '&Forma de Pagamento'
              DataField = 'TP_PAGAMENTO'
              DataSource = ds_fat
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Dinheiro'
                'Cheque'
                'TED'
                'DOC / D'#233'bito Conta'
                'L&&P'
                'Outros')
              ParentFont = False
              TabOrder = 7
              Values.Strings = (
                '$'
                'C'
                'T'
                'D'
                'L'
                'O')
            end
            object dbedt_nm_banco_fatur: TDBEdit
              Left = 263
              Top = 229
              Width = 235
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookBanco'
              DataSource = ds_fat
              ReadOnly = True
              TabOrder = 14
            end
            object dbedt_nr_cheque_fatur: TDBEdit
              Left = 226
              Top = 269
              Width = 104
              Height = 21
              DataField = 'NR_CHEQUE'
              DataSource = ds_fat
              TabOrder = 9
            end
            object dbedtr_nm_unid_neg: TDBEdit
              Left = 51
              Top = 65
              Width = 254
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookUnidNeg'
              DataSource = ds_fat
              TabOrder = 16
            end
            object dbedt_nm_produto: TDBEdit
              Left = 364
              Top = 65
              Width = 243
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookProduto'
              DataSource = ds_fat
              TabOrder = 18
            end
            object dbedt_nr_processo: TDBEdit
              Left = 19
              Top = 104
              Width = 120
              Height = 21
              DataField = 'NR_PROCESSO'
              DataSource = ds_fat
              TabOrder = 19
            end
            object dbedt_nm_cliente: TDBEdit
              Left = 206
              Top = 105
              Width = 254
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookCliente'
              DataSource = ds_fat
              TabOrder = 21
            end
            object dbcbo_fat_cancelado: TDBComboBox
              Left = 310
              Top = 25
              Width = 57
              Height = 21
              DataField = 'LookCancelado'
              DataSource = ds_fat
              ItemHeight = 13
              TabOrder = 22
            end
            object DBComboBox1: TDBComboBox
              Left = 571
              Top = 144
              Width = 57
              Height = 21
              DataField = 'LookRestitui'
              DataSource = ds_fat
              ItemHeight = 13
              TabOrder = 23
            end
            object dbedt_nm_ct_contabilF: TDBEdit
              Left = 436
              Top = 269
              Width = 194
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookContabil'
              DataSource = ds_fat
              ReadOnly = True
              TabOrder = 25
            end
            object dbedtDtConc: TDBEdit
              Left = 523
              Top = 229
              Width = 76
              Height = 21
              DataField = 'DT_CONCILIACAO'
              DataSource = ds_fat
              TabOrder = 26
            end
            object dbedt_cd_ct_contabilF: TDBEdit
              Left = 358
              Top = 269
              Width = 79
              Height = 21
              DataField = 'CD_CT_CONTABIL'
              DataSource = ds_fat
              TabOrder = 24
            end
            object dbedt_cd_banco_fatur: TDBEdit
              Left = 226
              Top = 229
              Width = 38
              Height = 21
              DataField = 'CD_BANCO'
              DataSource = ds_fat
              TabOrder = 8
            end
            object dbedt_cd_despachante: TDBEdit
              Left = 274
              Top = 186
              Width = 36
              Height = 21
              DataField = 'CD_DESPACHANTE'
              DataSource = ds_fat
              TabOrder = 5
            end
            object dbedt_cd_item: TDBEdit
              Left = 19
              Top = 144
              Width = 38
              Height = 21
              DataField = 'CD_ITEM'
              DataSource = ds_fat
              TabOrder = 1
            end
            object dbedt_cd_cliente: TDBEdit
              Left = 160
              Top = 105
              Width = 47
              Height = 21
              TabStop = False
              DataField = 'LookCdCliente'
              DataSource = ds_fat
              TabOrder = 20
            end
            object dbedt_cd_unid_neg: TDBEdit
              Left = 19
              Top = 65
              Width = 33
              Height = 21
              TabStop = False
              DataField = 'CD_UNID_NEG'
              DataSource = ds_fat
              TabOrder = 15
            end
            object dbedt_cd_favorecido: TDBEdit
              Left = 19
              Top = 26
              Width = 49
              Height = 21
              DataField = 'CD_FAVORECIDO'
              DataSource = ds_fat
              TabOrder = 0
            end
            object dbedt_cd_produto: TDBEdit
              Left = 330
              Top = 65
              Width = 35
              Height = 21
              TabStop = False
              DataField = 'LookCdProduto'
              DataSource = ds_fat
              TabOrder = 17
            end
          end
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 54
        Width = 734
        Height = 7
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 540
    Top = 4
    object mi_manut_proc: TMenuItem
      Caption = '&Pesquisar'
      OnClick = btn_pesquisaClick
    end
    object mi_sair: TMenuItem
      Caption = '&Sair'
      OnClick = btn_sairClick
    end
  end
  object qry_adm_: TQuery
    OnCalcFields = qry_adm_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_COLIGADA, DT_MOVIMENTO, NR_LANCAMENTO, NR_LANCAMENTO_S' +
        'ELECIONADO, CD_UNID_NEG,'
      
        '       IN_CANCELADO, IN_TRANSFERIDO, CD_HIST_PADRAO, NM_HISTORIC' +
        'O,'
      '       VL_LANCAMENTO, TP_NATUREZA, TP_PAGAMENTO, CD_BANCO,'
      
        '       NR_CHEQUE, CD_CT_CONTABIL, CD_CT_CUSTO, TP_LANCAMENTO, IN' +
        '_CONTABILIZA,'
      
        '       TP_PROCEDENCIA, CD_FAVORECIDO, VL_IR, CD_ACESSO, CD_AUX, ' +
        'DT_CANCELADO, DT_CONCILIACAO, IN_SELECIONADO'
      'FROM   TCAIXA (NOLOCK)'
      'WHERE  1 = 0'
      '')
    Left = 77
    Top = 20
    object qry_adm_DT_MOVIMENTO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCAIXA.DT_MOVIMENTO'
    end
    object qry_adm_NR_LANCAMENTO: TStringField
      DisplayLabel = 'N'#186' Lan'#231'.'
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCAIXA.NR_LANCAMENTO'
      Size = 6
    end
    object qry_adm_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TCAIXA.CD_FAVORECIDO'
      Size = 5
    end
    object qry_adm_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCAIXA.CD_UNID_NEG'
      Size = 2
    end
    object qry_adm_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TCAIXA.IN_CANCELADO'
      Size = 1
    end
    object qry_adm_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'TCAIXA.IN_TRANSFERIDO'
      Size = 1
    end
    object qry_adm_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCAIXA.NM_HISTORICO'
      Size = 180
    end
    object qry_adm_VL_LANCAMENTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCAMENTO'
      Origin = 'TCAIXA.VL_LANCAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_adm_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TCAIXA.TP_NATUREZA'
      Size = 1
    end
    object qry_adm_TP_PAGAMENTO: TStringField
      FieldName = 'TP_PAGAMENTO'
      Origin = 'TCAIXA.TP_PAGAMENTO'
      Size = 1
    end
    object qry_adm_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TCAIXA.CD_BANCO'
      Size = 3
    end
    object qry_adm_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TCAIXA.NR_CHEQUE'
      Size = 6
    end
    object qry_adm_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TCAIXA.CD_COLIGADA'
      Size = 1
    end
    object qry_adm_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TCAIXA.DT_MOVIMENTO'
      Size = 3
    end
    object qry_adm_CD_CT_CONTABIL: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCAIXA.CD_COLIGADA'
      EditMask = '999.99.99999;0;_'
      Size = 10
    end
    object qry_adm_CD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'TCAIXA.CD_CT_CUSTO'
      Size = 3
    end
    object qry_adm_TP_LANCAMENTO: TStringField
      FieldName = 'TP_LANCAMENTO'
      Origin = 'TCAIXA.TP_LANCAMENTO'
      Size = 1
    end
    object qry_adm_VL_IR: TFloatField
      FieldName = 'VL_IR'
      Origin = 'TCAIXA.VL_IR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_adm_TP_PROCEDENCIA: TStringField
      FieldName = 'TP_PROCEDENCIA'
      Origin = 'TCAIXA.TP_PROCEDENCIA'
      Size = 1
    end
    object qry_adm_CD_HIST_PADRAO: TStringField
      FieldName = 'CD_HIST_PADRAO'
      Origin = 'TCAIXA.CD_COLIGADA'
      Size = 3
    end
    object qry_adm_DT_CANCELADO: TDateTimeField
      FieldName = 'DT_CANCELADO'
      Origin = 'TCAIXA.CD_COLIGADA'
    end
    object qry_adm_IN_CONTABILIZA: TStringField
      FieldName = 'IN_CONTABILIZA'
      Origin = 'TCAIXA.CD_COLIGADA'
      Size = 1
    end
    object qry_adm_LookCtContabil: TStringField
      DisplayLabel = 'Contra Partida'
      FieldKind = fkCalculated
      FieldName = 'LookCtContabil'
      Size = 40
      Calculated = True
    end
    object qry_adm_LookNatureza: TStringField
      DisplayLabel = 'Natureza'
      FieldKind = fkCalculated
      FieldName = 'LookNatureza'
      Size = 10
      Calculated = True
    end
    object qry_adm_LookContabiliza: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookContabiliza'
      Size = 3
      Calculated = True
    end
    object qry_adm_LookCancelado: TStringField
      DisplayLabel = 'Cancelado'
      FieldKind = fkCalculated
      FieldName = 'LookCancelado'
      Size = 3
      Calculated = True
    end
    object qry_adm_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldKind = fkCalculated
      FieldName = 'LookFavorecido'
      Size = 50
      Calculated = True
    end
    object qry_adm_LookHistorico: TStringField
      DisplayLabel = 'Hist'#243'rico'
      DisplayWidth = 58
      FieldKind = fkCalculated
      FieldName = 'LookHistorico'
      Size = 58
      Calculated = True
    end
    object qry_adm_LookBanco: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookBanco'
      Size = 40
      Calculated = True
    end
    object qry_adm_LookCtCusto: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookCtCusto'
      Size = 40
      Calculated = True
    end
    object qry_adm_LookUnidNeg: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookUnidNeg'
      Size = 50
      Calculated = True
    end
    object qry_adm_DT_CONCILIACAO: TDateTimeField
      FieldName = 'DT_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.DT_CONCILIACAO'
    end
    object qry_adm_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'DBBROKER.TCAIXA.IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_adm_calcIN_SELECIONADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcIN_SELECIONADO'
      Size = 1
      Calculated = True
    end
    object qry_adm_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'DBBROKER.TCAIXA.CD_COLIGADA'
      FixedChar = True
      Size = 2
    end
    object qry_adm_NR_LANCAMENTO_SELECIONADO: TStringField
      FieldName = 'NR_LANCAMENTO_SELECIONADO'
      Origin = 'DBBROKER.TCAIXA.NR_LANCAMENTO_SELECIONADO'
      FixedChar = True
      Size = 6
    end
  end
  object qry_fat_: TQuery
    OnCalcFields = qry_fat_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DT_MOVIMENTO, NR_LANCAMENTO, NR_LANCAMENTO_SELECIONADO, C' +
        'D_COLIGADA, CD_UNID_NEG, TP_PROCEDENCIA,'
      
        '       IN_CANCELADO, IN_TRANSFERIDO, NM_HISTORICO, VL_LANCAMENTO' +
        ', TP_NATUREZA,'
      
        '       TP_PAGAMENTO, CD_BANCO, NR_CHEQUE, CD_FAVORECIDO, NR_PROC' +
        'ESSO, CD_ITEM,'
      
        '       VL_IR, VL_ASSIST, CD_DESPACHANTE, TP_LANCAMENTO, IN_RESTI' +
        'TUI, CD_CT_CONTABIL, DT_CONCILIACAO, IN_SELECIONADO'
      'FROM   TCAIXA (NOLOCK)'
      'WHERE  1 = 0'
      '')
    Left = 116
    Top = 20
    object qry_fat_DT_MOVIMENTO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCAIXA.DT_MOVIMENTO'
    end
    object qry_fat_NR_LANCAMENTO: TStringField
      DisplayLabel = 'N'#186' Lan'#231'.'
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCAIXA.NR_LANCAMENTO'
      Size = 6
    end
    object qry_fat_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCAIXA.CD_UNID_NEG'
      Size = 2
    end
    object qry_fat_TP_LANCAMENTO: TStringField
      FieldName = 'TP_LANCAMENTO'
      Origin = 'TCAIXA.DT_MOVIMENTO'
      Size = 1
    end
    object qry_fat_TP_PROCEDENCIA: TStringField
      FieldName = 'TP_PROCEDENCIA'
      Origin = 'TCAIXA.TP_PROCEDENCIA'
      Size = 1
    end
    object qry_fat_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TCAIXA.IN_CANCELADO'
      Size = 1
    end
    object qry_fat_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'TCAIXA.IN_TRANSFERIDO'
      Size = 1
    end
    object qry_fat_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCAIXA.NM_HISTORICO'
      Size = 180
    end
    object qry_fat_VL_LANCAMENTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCAMENTO'
      Origin = 'TCAIXA.VL_LANCAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TCAIXA.TP_NATUREZA'
      Size = 1
    end
    object qry_fat_TP_PAGAMENTO: TStringField
      FieldName = 'TP_PAGAMENTO'
      Origin = 'TCAIXA.TP_PAGAMENTO'
      Size = 1
    end
    object qry_fat_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TCAIXA.CD_BANCO'
      Size = 3
    end
    object qry_fat_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TCAIXA.NR_CHEQUE'
      Size = 6
    end
    object qry_fat_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TCAIXA.CD_FAVORECIDO'
      Size = 5
    end
    object qry_fat_NR_PROCESSO: TStringField
      DisplayLabel = 'N'#186' Proc.'
      FieldName = 'NR_PROCESSO'
      Origin = 'TCAIXA.NR_PROCESSO'
      Size = 18
    end
    object qry_fat_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TCAIXA.CD_ITEM'
      Size = 3
    end
    object qry_fat_VL_IR: TFloatField
      FieldName = 'VL_IR'
      Origin = 'TCAIXA.VL_IR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_VL_ASSIST: TFloatField
      FieldName = 'VL_ASSIST'
      Origin = 'TCAIXA.VL_ASSIST'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TCAIXA.CD_DESPACHANTE'
      Size = 3
    end
    object qry_fat_IN_RESTITUI: TStringField
      FieldName = 'IN_RESTITUI'
      Origin = 'TCAIXA.CD_COLIGADA'
      Size = 1
    end
    object qry_fat_LookUnidNeg: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookUnidNeg'
      Size = 50
      Calculated = True
    end
    object qry_fat_LookCdProduto: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookCdProduto'
      Size = 2
      Calculated = True
    end
    object qry_fat_LookProduto: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookProduto'
      Size = 40
      Calculated = True
    end
    object qry_fat_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldKind = fkCalculated
      FieldName = 'LookFavorecido'
      Size = 50
      Calculated = True
    end
    object qry_fat_LookBanco: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookBanco'
      Size = 40
      Calculated = True
    end
    object qry_fat_LookCancelado: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookCancelado'
      Size = 3
      Calculated = True
    end
    object qry_fat_LookItem: TStringField
      DisplayLabel = 'Item'
      FieldKind = fkCalculated
      FieldName = 'LookItem'
      Size = 30
      Calculated = True
    end
    object qry_fat_LookDespachante: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookDespachante'
      Size = 50
      Calculated = True
    end
    object qry_fat_CalcNrProcesso: TStringField
      DisplayLabel = 'N'#186' Proc.'
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 14
      Calculated = True
    end
    object qry_fat_LookRestitui: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookRestitui'
      Size = 3
      Calculated = True
    end
    object qry_fat_LookCdCliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookCdCliente'
      Size = 5
      Calculated = True
    end
    object qry_fat_LookCliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookCliente'
      Size = 50
      Calculated = True
    end
    object qry_fat_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCAIXA.DT_MOVIMENTO'
      Size = 10
    end
    object qry_fat_LookContabil: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookContabil'
      Size = 40
      Calculated = True
    end
    object qry_fat_DT_CONCILIACAO: TDateTimeField
      FieldName = 'DT_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.DT_CONCILIACAO'
    end
    object qry_fat_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'DBBROKER.TCAIXA.IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_fat_calcIN_SELECIONADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcIN_SELECIONADO'
      Size = 1
      Calculated = True
    end
    object qry_fat_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'DBBROKER.TCAIXA.CD_COLIGADA'
      FixedChar = True
      Size = 2
    end
    object qry_fat_NR_LANCAMENTO_SELECIONADO: TStringField
      FieldName = 'NR_LANCAMENTO_SELECIONADO'
      Origin = 'DBBROKER.TCAIXA.NR_LANCAMENTO_SELECIONADO'
      FixedChar = True
      Size = 6
    end
  end
  object ds_fat: TDataSource
    DataSet = qry_fat_
    Left = 122
    Top = 58
  end
  object ds_adm: TDataSource
    DataSet = qry_adm_
    Left = 76
    Top = 58
  end
end
