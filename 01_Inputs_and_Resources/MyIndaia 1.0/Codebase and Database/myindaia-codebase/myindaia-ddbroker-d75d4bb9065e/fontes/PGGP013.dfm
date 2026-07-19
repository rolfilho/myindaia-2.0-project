object frm_lib_ctaapagar: Tfrm_lib_ctaapagar
  Left = 138
  Top = 11
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Contas a &Pagar'
  ClientHeight = 646
  ClientWidth = 848
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  KeyPreview = True
  Menu = menu_cadastro
  OldCreateOrder = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 848
    Height = 48
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 365
      Top = 3
      Width = 38
      Height = 41
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
    object btn_liberar: TSpeedButton
      Left = 3
      Top = 3
      Width = 38
      Height = 41
      Hint = 'Liberar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
        333333333F777773FF333333008888800333333377333F3773F3333077870787
        7033333733337F33373F3308888707888803337F33337F33337F330777880887
        7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
        7703337F33377733337FB3088888888888033373FFFFFFFFFF733B3000000000
        0033333777777777773333BBBB3333080333333333F3337F7F33BBBB707BB308
        03333333373F337F7F3333BB08033308033333337F7F337F7F333B3B08033308
        033333337F73FF737F33B33B778000877333333373F777337333333B30888880
        33333333373FFFF73333333B3300000333333333337777733333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_liberarClick
    end
    object Label3: TLabel
      Left = 591
      Top = 6
      Width = 37
      Height = 13
      Caption = 'Ordem'
    end
    object btn_alt_banco: TSpeedButton
      Left = 41
      Top = 3
      Width = 38
      Height = 41
      Hint = 'Alterar Banco'
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
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_alt_bancoClick
    end
    object Label7: TLabel
      Left = 733
      Top = 6
      Width = 78
      Height = 13
      Caption = 'Dt Base Mov.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnDesmontar: TSpeedButton
      Left = 193
      Top = 3
      Width = 38
      Height = 41
      Hint = 'Desmonta a conta'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnDesmontarClick
    end
    object btnTED: TSpeedButton
      Left = 79
      Top = 3
      Width = 38
      Height = 41
      Hint = 'Chama tela do TED'
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
      OnClick = btnTEDClick
    end
    object BtnEmissaoCheque: TSpeedButton
      Left = 117
      Top = 3
      Width = 38
      Height = 41
      Hint = 'Chama tela de Emiss'#227'o de Cheques'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnEmissaoChequeClick
    end
    object SpeedButton1: TSpeedButton
      Left = 155
      Top = 3
      Width = 38
      Height = 41
      Hint = 'Chama tela do Financeiro'
      Flat = True
      Glyph.Data = {
        76080000424DB608000000000000B60000002800000020000000100000000100
        2000000000000008000000000000000000001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000000000000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        80007F7F7F00FFFFFF00FFFFFF00008080000080800000808000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        80000000FF000000000000808000008080000080800000808000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        80007F7F7F007F7F7F00FFFFFF00FFFFFF000080800000808000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        80000000FF000000FF000000000000808000008080000080800000808000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF0000808000000000000000
        0000000000000000000000000000000000000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000000000808000008080007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF0000000000008080007F7F7F00FFFF
        FF000080800000808000008080007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF00000000007F7F7F00FFFF
        FF0000808000FFFFFF00FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000FFFF
        FF000000000000000000FFFFFF00000000000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000FF0000000000008080007F7F7F00FFFF
        FF007F7F7F007F7F7F00008080007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000080800000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF000000000000808000008080007F7F7F00FFFF
        FF0000808000FFFFFF00FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F00008080000080800000000000FFFF
        FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00000000FF000000FF00000000000080800000808000008080007F7F7F00FFFF
        FF007F7F7F007F7F7F0000808000008080000080800000808000008080007F7F
        7F007F7F7F007F7F7F007F7F7F0000808000008080000080800000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00000000FF0000000000008080000080800000808000008080007F7F7F00FFFF
        FF0000808000FFFFFF00FFFFFF0000808000FFFFFF00FFFFFF00FFFFFF007F7F
        7F007F7F7F007F7F7F000080800000808000008080000080800000000000FFFF
        FF000000000000000000FFFFFF00000000000000000000000000000000000000
        00000000000000808000008080000080800000808000008080007F7F7F00FFFF
        FF007F7F7F007F7F7F00008080007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F00008080000080800000808000008080000080800000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00000000000080
        80000080800000808000008080000080800000808000008080007F7F7F00FFFF
        FF0000808000FFFFFF00FFFFFF007F7F7F00FFFFFF00008080007F7F7F000080
        800000808000008080000080800000808000008080000080800000000000FFFF
        FF0000000000BFBFBF00FFFFFF0000000000FFFFFF0000000000008080000080
        80000080800000808000008080000080800000808000008080007F7F7F00FFFF
        FF007F7F7F007F7F7F00008080007F7F7F00FFFFFF007F7F7F00008080000080
        800000808000008080000080800000808000008080000080800000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000808000008080000080
        80000080800000808000008080000080800000808000008080007F7F7F00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F7F0000808000008080000080
        8000008080000080800000808000008080000080800000808000000000000000
        0000000000000000000000000000000000000080800000808000008080000080
        80000080800000808000008080000080800000808000008080007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F000080800000808000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000008080000080800000808000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object dbnvg: TDBNavigator
      Left = 254
      Top = 13
      Width = 104
      Height = 25
      DataSource = datm_lib_ctaapagar.dts_ContasAgrupadas
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object rdgrp_lib: TRadioGroup
      Left = 408
      Top = 9
      Width = 172
      Height = 33
      Caption = 'Escopo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Individual'
        'Global')
      TabOrder = 1
      Visible = False
    end
    object cbo_ordem: TComboBox
      Left = 591
      Top = 19
      Width = 137
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
      OnClick = cbo_ordemClick
    end
    object EditDtBase: TDateEdit
      Left = 733
      Top = 19
      Width = 90
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 3
      OnEnter = EditDtBaseEnter
      OnExit = msk_dataExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 48
    Width = 848
    Height = 75
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object lbl_unidade: TLabel
      Left = 326
      Top = 25
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
    object btn_co_unidade: TSpeedButton
      Left = 626
      Top = 41
      Width = 25
      Height = 22
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
      OnClick = btn_co_unidadeClick
    end
    object lbl_dt_pagto: TLabel
      Left = 230
      Top = 25
      Width = 64
      Height = 13
      Caption = 'Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 654
      Top = 25
      Width = 37
      Height = 13
      Caption = 'Banco'
    end
    object btn_co_banco: TSpeedButton
      Left = 954
      Top = 41
      Width = 25
      Height = 22
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
      Visible = False
      OnClick = btn_co_bancoClick
    end
    object msk_cd_unidade: TMaskEdit
      Left = 326
      Top = 41
      Width = 34
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 2
      OnChange = btn_co_unidadeClick
      OnEnter = msk_cd_unidadeEnter
      OnExit = msk_cd_unidadeExit
      OnKeyDown = msk_cd_unidadeKeyDown
    end
    object edt_nm_unidade: TEdit
      Left = 361
      Top = 41
      Width = 262
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
      TabOrder = 3
    end
    object dbedt_cd_banco: TDBEdit
      Left = 654
      Top = 41
      Width = 34
      Height = 21
      Color = clMenu
      DataField = 'CD_BANCO'
      DataSource = datm_lib_ctaapagar.ds_ctaapagar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      OnChange = btn_co_bancoClick
      OnExit = dbedt_cd_bancoExit
      OnKeyDown = msk_cd_unidadeKeyDown
    end
    object dbedt_nm_banco: TEdit
      Left = 692
      Top = 41
      Width = 260
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
      TabOrder = 5
    end
    object msk_dt_pagto: TDateEdit
      Left = 230
      Top = 41
      Width = 90
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnExit = msk_dt_pagtoExit
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 208
      Height = 57
      Caption = 'Vencimento'
      TabOrder = 0
      object lbl_inicio: TLabel
        Left = 9
        Top = 15
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'In'#237'cio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_fim: TLabel
        Left = 111
        Top = 15
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object msk_dt_inicio: TDateEdit
        Left = 9
        Top = 31
        Width = 90
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
        OnEnter = msk_dataEnter
        OnExit = msk_dataExit
      end
      object msk_dt_fim: TDateEdit
        Left = 111
        Top = 31
        Width = 90
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
        OnEnter = msk_dt_fimEnter
        OnExit = msk_dataExit
      end
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 475
    Width = 848
    Height = 171
    Align = alClient
    DataSource = datm_lib_ctaapagar.DtsContasLancamento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_CT_CONTABIL'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_CT_CONTABIL'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 280
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
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 123
    Width = 848
    Height = 143
    Align = alTop
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 846
      Height = 141
      Align = alClient
      DataSource = datm_lib_ctaapagar.dts_ContasAgrupadas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'NR_REF'
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
          FieldName = 'calcLiberado'
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
          FieldName = 'NM_FAVORECIDO'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 324
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_LANCTO'
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
          FieldName = 'calcTpPagto'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 117
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_MONTAGEM'
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
          FieldName = 'DT_PAGAMENTO'
          Title.Caption = 'Dt. Emiss'#227'o Pagto'
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
          FieldName = 'calcStatus'
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
  object dbgrd_lista: TDBGrid
    Left = 0
    Top = 266
    Width = 848
    Height = 209
    Align = alTop
    Color = clWhite
    DataSource = datm_lib_ctaapagar.ds_ctaapagar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'DT_CTAAPAGAR'
        Title.Caption = 'Lan'#231'amento'
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
        FieldName = 'NR_CTAAPAGAR'
        Title.Caption = 'N.'#186
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_TITULO'
        Title.Caption = 'T'#237'tulo'
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
        FieldName = 'VL_LIQUIDO'
        Title.Caption = 'Valor'
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
        FieldName = 'DT_VENCIMENTO'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Look_Fornecedor'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_HISTORICO'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 500
        Visible = True
      end>
  end
  object pnl_insere_banco: TPanel
    Left = 323
    Top = 307
    Width = 340
    Height = 143
    BorderWidth = 3
    Color = clSilver
    TabOrder = 5
    Visible = False
    object Panel1: TPanel
      Left = 4
      Top = 4
      Width = 332
      Height = 135
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Shape1: TShape
        Left = 1
        Top = 1
        Width = 330
        Height = 24
        Brush.Color = clSilver
        Pen.Color = clGray
      end
      object btn_co_banco2: TSpeedButton
        Left = 281
        Top = 52
        Width = 25
        Height = 22
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
        OnClick = btn_co_banco2Click
      end
      object Label4: TLabel
        Left = 7
        Top = 6
        Width = 283
        Height = 13
        Caption = 'O preenchimento do campo "Banco" '#233' obrigat'#243'rio'
        Transparent = True
      end
      object Bevel1: TBevel
        Left = 3
        Top = 89
        Width = 326
        Height = 43
        Shape = bsFrame
        Style = bsRaised
      end
      object Label5: TLabel
        Left = 28
        Top = 39
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
      object msk_cd_banco: TMaskEdit
        Left = 29
        Top = 52
        Width = 36
        Height = 21
        EditMask = '999;0; '
        MaxLength = 3
        TabOrder = 0
        OnChange = btn_co_banco2Click
        OnExit = msk_cd_bancoExit
        OnKeyDown = msk_cd_unidadeKeyDown
      end
      object edt_nm_banco: TEdit
        Left = 65
        Top = 52
        Width = 215
        Height = 21
        Color = clMenu
        ReadOnly = True
        TabOrder = 1
      end
      object Button1: TButton
        Left = 82
        Top = 96
        Width = 86
        Height = 29
        Caption = 'Confirmar'
        TabOrder = 2
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 170
        Top = 96
        Width = 86
        Height = 29
        Caption = 'Cancelar'
        TabOrder = 3
        OnClick = Button2Click
      end
    end
  end
  object pnl_baixar: TPanel
    Left = 400
    Top = 320
    Width = 185
    Height = 41
    BevelInner = bvLowered
    TabOrder = 6
    Visible = False
    object Label6: TLabel
      Left = 17
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Label6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object menu_cadastro: TMainMenu
    Left = 321
    Top = 356
    object mi_liberar: TMenuItem
      Caption = '&Liberar'
      OnClick = btn_liberarClick
    end
    object mi_alt_banco: TMenuItem
      Caption = '&Alterar Banco'
      OnClick = btn_alt_bancoClick
    end
    object ED1: TMenuItem
      Caption = 'TED'
      OnClick = btnTEDClick
    end
    object EmissodeCheques1: TMenuItem
      Caption = 'Emiss'#227'o de Cheques'
      OnClick = BtnEmissaoChequeClick
    end
    object Financeiro1: TMenuItem
      Caption = 'Financeiro'
      OnClick = SpeedButton1Click
    end
    object Desmontar1: TMenuItem
      Caption = '&Desmontar'
    end
    object mi_pesq_liberacao: TMenuItem
      Caption = '&Pesquisar'
      Visible = False
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
