object frm_pesq_adm: Tfrm_pesq_adm
  Left = 378
  Top = 259
  Width = 750
  Height = 550
  Caption = 'Pesquisa de Pagamentos'
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvl1: TBevel
    Left = 0
    Top = 49
    Width = 742
    Height = 5
    Align = alTop
    Shape = bsSpacer
  end
  object pnl_pesq_adm: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 688
      Top = 2
      Width = 45
      Height = 45
      Hint = 'Sair'
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
      Left = 9
      Top = 2
      Width = 45
      Height = 45
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
    object shpNav: TShape
      Left = 563
      Top = 11
      Width = 102
      Height = 27
      Pen.Color = clGray
    end
    object dbnvg: TDBNavigator
      Left = 564
      Top = 12
      Width = 100
      Height = 25
      DataSource = datm_pesq_adm.ds_pesq
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
    end
  end
  object pgctrl_pesq_adm: TPageControl
    Left = 0
    Top = 54
    Width = 742
    Height = 450
    ActivePage = ts_lista
    Align = alClient
    HotTrack = True
    TabOrder = 1
    OnChange = pgctrl_pesq_admChange
    OnChanging = pgctrl_pesq_admChanging
    object ts_filtros: TTabSheet
      Caption = 'Filtros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object lbl_favorecido: TLabel
        Left = 2
        Top = 184
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
        Left = 412
        Top = 196
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
        OnClick = btn_co_favorecidoClick
      end
      object btn_co_usuario: TSpeedButton
        Left = 411
        Top = 234
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
        OnClick = btn_co_usuarioClick
      end
      object lbl_usuario: TLabel
        Left = 2
        Top = 223
        Width = 44
        Height = 13
        Caption = 'Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_unid_neg: TLabel
        Left = 2
        Top = 1
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
        Left = 321
        Top = 13
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
        Left = 2
        Top = 147
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
        Left = 411
        Top = 160
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
        OnClick = btn_co_bancoClick
      end
      object lbl_status: TLabel
        Left = 2
        Top = 378
        Width = 122
        Height = 13
        Alignment = taRightJustify
        Caption = 'Status da Solicita'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_vl_vencto: TLabel
        Left = 2
        Top = 299
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
        Left = 3
        Top = 336
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
        Left = 2
        Top = 261
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
        Left = 412
        Top = 273
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
        OnClick = btn_co_historicoClick
      end
      object lbl_acesso: TLabel
        Left = 2
        Top = 37
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
        Left = 48
        Top = 36
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
      object btn_co_ct_contabil: TSpeedButton
        Left = 491
        Top = 50
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
        Left = 85
        Top = 36
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
      object msk_cd_favorecido: TMaskEdit
        Left = 2
        Top = 197
        Width = 46
        Height = 21
        EditMask = '!99999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 8
        OnClick = btn_co_favorecidoClick
        OnExit = msk_cd_favorecidoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_favorecido: TEdit
        Left = 50
        Top = 197
        Width = 359
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
        TabOrder = 14
      end
      object edt_nm_usuario: TEdit
        Left = 50
        Top = 235
        Width = 359
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
      object msk_cd_unid_neg: TMaskEdit
        Left = 2
        Top = 15
        Width = 33
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
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_unid_neg: TEdit
        Left = 38
        Top = 15
        Width = 280
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
      object msk_cd_banco: TMaskEdit
        Left = 2
        Top = 159
        Width = 46
        Height = 21
        EditMask = '!999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 7
        OnChange = btn_co_bancoClick
        OnExit = msk_cd_bancoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_banco: TEdit
        Left = 50
        Top = 159
        Width = 359
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
      object dblckbox_cd_status: TDBLookupComboBox
        Left = 2
        Top = 393
        Width = 189
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'CODIGO'
        ListField = 'DESCRICAO'
        ListSource = datm_pesq_adm.ds_status_solic_adm
        ParentFont = False
        TabOrder = 13
        OnClick = dblckbox_cd_statusClick
      end
      object msk_vl_lancto: TMaskEdit
        Left = 2
        Top = 313
        Width = 101
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        OnExit = msk_vl_lanctoExit
      end
      object msk_nr_docto: TMaskEdit
        Left = 2
        Top = 349
        Width = 102
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object msk_cd_usuario: TMaskEdit
        Left = 2
        Top = 235
        Width = 46
        Height = 21
        EditMask = '9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        TabOrder = 9
        OnChange = btn_co_usuarioClick
        OnExit = msk_cd_usuarioExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_historico: TMaskEdit
        Left = 2
        Top = 274
        Width = 46
        Height = 21
        EditMask = '!999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 10
        OnChange = btn_co_historicoClick
        OnExit = msk_cd_historicoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_historico: TEdit
        Left = 50
        Top = 274
        Width = 359
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
      object msk_cd_acesso: TMaskEdit
        Left = 2
        Top = 50
        Width = 34
        Height = 21
        EditMask = '!9;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 2
        OnEnter = msk_cd_acessoEnter
        OnExit = msk_cd_acessoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_aux: TMaskEdit
        Left = 48
        Top = 49
        Width = 34
        Height = 21
        EditMask = '!999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 3
        OnEnter = msk_cd_auxEnter
        OnExit = msk_cd_auxExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_ct_contabil: TEdit
        Left = 162
        Top = 50
        Width = 324
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
      object msk_cd_ct_contabil: TMaskEdit
        Left = 85
        Top = 50
        Width = 73
        Height = 21
        EditMask = '999.99.99999;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 12
        ParentFont = False
        TabOrder = 4
        OnEnter = msk_cd_ct_contabilEnter
        OnExit = msk_cd_ct_contabilExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object grp_pagto: TGroupBox
        Left = 224
        Top = 77
        Width = 217
        Height = 64
        Caption = 'Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        TabStop = True
        object Label10: TLabel
          Left = 5
          Top = 18
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
        object Label11: TLabel
          Left = 105
          Top = 18
          Width = 46
          Height = 13
          Caption = 'T'#233'rmino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object msk_dt_inicio_pagto: TMaskEdit
          Left = 5
          Top = 32
          Width = 90
          Height = 21
          EditMask = '!99/99/9999;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Text = '  /  /    '
          OnExit = msk_dt_inicio_pagtoExit
        end
        object msk_dt_termino_pagto: TMaskEdit
          Left = 105
          Top = 32
          Width = 92
          Height = 21
          EditMask = '!99/99/9999;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Text = '  /  /    '
          OnEnter = msk_dt_termino_pagtoEnter
          OnExit = msk_dt_termino_pagtoExit
        end
      end
      object rdgrp_tp_natureza: TRadioGroup
        Left = 360
        Top = 0
        Width = 153
        Height = 39
        Caption = 'Natureza'
        Columns = 2
        Items.Strings = (
          'Cr'#233'dito'
          'D'#233'bito')
        TabOrder = 1
        OnExit = rdgrp_tp_naturezaExit
      end
      object grp_vencto: TGroupBox
        Left = 2
        Top = 77
        Width = 215
        Height = 64
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        TabStop = True
        object lbl_dt_inicio: TLabel
          Left = 5
          Top = 17
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
        object lbl_dt_termino: TLabel
          Left = 106
          Top = 17
          Width = 46
          Height = 13
          Caption = 'T'#233'rmino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object msk_dt_inicio_vencto: TMaskEdit
          Left = 5
          Top = 31
          Width = 90
          Height = 21
          EditMask = '!99/99/9999;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Text = '  /  /    '
          OnExit = msk_dt_inicio_venctoExit
        end
        object msk_dt_termino_vencto: TMaskEdit
          Left = 106
          Top = 31
          Width = 92
          Height = 21
          EditMask = '!99/99/9999;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Text = '  /  /    '
          OnEnter = msk_dt_termino_venctoEnter
          OnExit = msk_dt_termino_venctoExit
        end
      end
    end
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object dbg_lib_proc: TDBGrid
        Left = 0
        Top = 55
        Width = 734
        Height = 212
        Align = alClient
        DataSource = datm_pesq_adm.ds_pesq
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_lib_procDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_LANCAMENTO'
            Title.Caption = 'Lancto.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_LANCAMENTO_SELECIONADO'
            Title.Caption = 'Lancto.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_CT_CONTABIL'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookCtContabil'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 171
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_LANCTO'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookStatus'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 230
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calcIN_SELECIONADO'
            Font.Charset = SYMBOL_CHARSET
            Font.Color = clTeal
            Font.Height = -16
            Font.Name = 'Wingdings'
            Font.Style = [fsBold]
            Title.Caption = 'Selec.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 267
        Width = 734
        Height = 155
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object lbl_ct_contabil2: TLabel
          Left = 99
          Top = 3
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = 'Conta Cont'#225'bil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 594
          Top = 3
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor'
          FocusControl = dbedt_vl_lancto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 7
          Top = 38
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
        object lbl_dt_pagto_recebto: TLabel
          Left = 594
          Top = 38
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Pagto'
          FocusControl = dbedt_dt_pagto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_dt_vencto: TLabel
          Left = 421
          Top = 38
          Width = 62
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Vencto'
          FocusControl = dbedt_dt_vencto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_acesso2: TLabel
          Left = 7
          Top = 3
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
        object lbl_aux2: TLabel
          Left = 57
          Top = 3
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
        object Label15: TLabel
          Left = 7
          Top = 76
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hist'#243'rico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 7
          Top = 111
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
        object Label2: TLabel
          Left = 422
          Top = 111
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usu'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 596
          Top = 76
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#186' Docto'
          FocusControl = dbedt_nr_docto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nr_lancamento: TLabel
          Left = 525
          Top = 38
          Width = 58
          Height = 13
          Caption = 'N'#186' Lancto'
          FocusControl = dbedt_nr_lancamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_lancto: TDBEdit
          Left = 594
          Top = 16
          Width = 124
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_LANCTO'
          DataSource = datm_pesq_adm.ds_pesq
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit2: TDBEdit
          Left = 7
          Top = 51
          Width = 47
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_FAVORECIDO'
          DataSource = datm_pesq_adm.ds_pesq
          MaxLength = 4
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_nm_ct_contabil: TDBEdit
          Left = 175
          Top = 16
          Width = 405
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCtContabil'
          DataSource = datm_pesq_adm.ds_pesq
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_ct_contabil: TDBEdit
          Left = 99
          Top = 16
          Width = 73
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_CT_CONTABIL'
          DataSource = datm_pesq_adm.ds_pesq
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit3: TDBEdit
          Left = 57
          Top = 51
          Width = 355
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookFavorecido'
          DataSource = datm_pesq_adm.ds_pesq
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_dt_pagto: TDBEdit
          Left = 594
          Top = 51
          Width = 124
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_PAGTO'
          DataSource = datm_pesq_adm.ds_pesq
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_dt_vencto: TDBEdit
          Left = 421
          Top = 51
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_VENCTO'
          DataSource = datm_pesq_adm.ds_pesq
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_cd_acesso: TDBEdit
          Left = 7
          Top = 16
          Width = 32
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_ACESSO'
          DataSource = datm_pesq_adm.ds_pesq
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_cd_aux: TDBEdit
          Left = 57
          Top = 16
          Width = 32
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_AUX'
          DataSource = datm_pesq_adm.ds_pesq
          ReadOnly = True
          TabOrder = 1
        end
        object dbrdgrp_tp_natureza: TDBRadioGroup
          Left = 421
          Top = 76
          Width = 161
          Height = 33
          Caption = 'Natureza'
          Columns = 2
          DataField = 'TP_NATUREZA'
          DataSource = datm_pesq_adm.ds_pesq
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Cr'#233'dito'
            'D'#233'bito')
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          Values.Strings = (
            'C'
            'D')
        end
        object dbedt_cd_historico: TDBEdit
          Left = 7
          Top = 90
          Width = 47
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_HISTORICO'
          DataSource = datm_pesq_adm.ds_pesq
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_nm_historico: TDBEdit
          Left = 57
          Top = 90
          Width = 355
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookHistorico'
          DataSource = datm_pesq_adm.ds_pesq
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_cd_banco: TDBEdit
          Left = 7
          Top = 125
          Width = 47
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_adm.ds_pesq
          ReadOnly = True
          TabOrder = 12
        end
        object dbedt_nm_banco: TDBEdit
          Left = 57
          Top = 125
          Width = 355
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_adm.ds_pesq
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_nm_usuario: TDBEdit
          Left = 460
          Top = 125
          Width = 261
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUsuario'
          DataSource = datm_pesq_adm.ds_pesq
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_cd_usuario: TDBEdit
          Left = 422
          Top = 125
          Width = 35
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_USUARIO_SOLIC'
          DataSource = datm_pesq_adm.ds_pesq
          MaxLength = 3
          ReadOnly = True
          TabOrder = 15
        end
        object dbedt_nr_docto: TDBEdit
          Left = 594
          Top = 90
          Width = 124
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_DOCTO'
          DataSource = datm_pesq_adm.ds_pesq
          ReadOnly = True
          TabOrder = 16
        end
        object dbedt_nr_lancamento: TDBEdit
          Left = 525
          Top = 51
          Width = 40
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_LANCAMENTO'
          DataSource = datm_pesq_adm.ds_pesq
          ReadOnly = True
          TabOrder = 17
        end
      end
      object pnlTop: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 55
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 3
        TabOrder = 2
        object shpColor: TShape
          Left = 3
          Top = 3
          Width = 728
          Height = 49
          Align = alClient
          Pen.Color = clGray
        end
        object Label12: TLabel
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
          Transparent = True
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 8
          Top = 23
          Width = 40
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'CD_UNID_NEG'
          DataSource = datm_pesq_adm.ds_pesq
          TabOrder = 0
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 50
          Top = 23
          Width = 260
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'LookUnidNeg'
          DataSource = datm_pesq_adm.ds_pesq
          TabOrder = 1
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 500
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
end
