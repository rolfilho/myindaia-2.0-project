object frm_account: Tfrm_account
  Left = 314
  Top = 217
  Width = 750
  Height = 550
  Caption = 'Account'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = main_menu_proc
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_house: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 47
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      47)
    object Shape1: TShape
      Left = 520
      Top = 5
      Width = 220
      Height = 38
      Anchors = [akTop, akRight]
      Pen.Color = clGray
    end
    object btn_sair: TSpeedButton
      Left = 476
      Top = 3
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
      OnClick = btn_sairClick
    end
    object btn_bloc_proc: TSpeedButton
      Left = 326
      Top = 4
      Width = 40
      Height = 40
      Hint = 'Operacional'
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
      OnClick = btn_bloc_procClick
    end
    object btn_aprovar_proc: TSpeedButton
      Left = 206
      Top = 4
      Width = 40
      Height = 40
      Hint = 'Aprovar Account'
      Flat = True
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_aprovar_procClick
    end
    object btn_verif_acc: TSpeedButton
      Left = 166
      Top = 4
      Width = 40
      Height = 40
      Hint = 'Verificar Account'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_verif_accClick
    end
    object btn_emissao_fat: TSpeedButton
      Left = 246
      Top = 4
      Width = 40
      Height = 40
      Hint = 'Emiss'#227'o Fatura'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
        0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
        0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
        0005555555575FF7777555555555000555555555555577755555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_emissao_fatClick
    end
    object btn_remessa: TSpeedButton
      Left = 286
      Top = 4
      Width = 40
      Height = 40
      Hint = 'Gerar Remessa'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_remessaClick
    end
    object Label1: TLabel
      Left = 527
      Top = 6
      Width = 56
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 622
      Top = 6
      Width = 37
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Ordem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 4
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
      OnClick = btn_incluirClick
    end
    object btn_excluir: TSpeedButton
      Left = 124
      Top = 4
      Width = 40
      Height = 40
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
      OnClick = btn_excluirClick
    end
    object btn_salvar: TSpeedButton
      Left = 44
      Top = 4
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
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 84
      Top = 4
      Width = 40
      Height = 40
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
      OnClick = btn_cancelarClick
    end
    object dbnavg: TDBNavigator
      Left = 371
      Top = 11
      Width = 100
      Height = 25
      DataSource = datm_account.ds_processo
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      TabOrder = 0
    end
    object edt_chave: TEdit
      Left = 527
      Top = 19
      Width = 93
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 622
      Top = 20
      Width = 114
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
      TabStop = False
      OnChange = cb_ordemChange
    end
  end
  object pnl_master: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      742
      47)
    object Shape2: TShape
      Left = 462
      Top = 5
      Width = 277
      Height = 39
      Anchors = [akTop, akRight]
      Pen.Color = clGray
    end
    object SpeedButton3: TSpeedButton
      Left = 414
      Top = 4
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
      OnClick = btn_sairClick
    end
    object btn_salvar2: TSpeedButton
      Left = 44
      Top = 4
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
      OnClick = btn_salvarClick
    end
    object btn_Cancelar2: TSpeedButton
      Left = 84
      Top = 4
      Width = 40
      Height = 40
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
      OnClick = btn_cancelarClick
    end
    object btn_bloc_proc2: TSpeedButton
      Left = 327
      Top = 4
      Width = 40
      Height = 40
      Hint = 'Operacional'
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
      OnClick = btn_bloc_proc2Click
    end
    object btn_aprovar_proc2: TSpeedButton
      Left = 207
      Top = 4
      Width = 40
      Height = 40
      Hint = 'Aprovar Account'
      Flat = True
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_aprovar_proc2Click
    end
    object btn_verif_acc2: TSpeedButton
      Left = 167
      Top = 4
      Width = 40
      Height = 40
      Hint = 'Verificar Account'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_verif_acc2Click
    end
    object btn_emissao_fat2: TSpeedButton
      Left = 247
      Top = 4
      Width = 40
      Height = 40
      Hint = 'Emiss'#227'o Fatura'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
        0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
        0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
        0005555555575FF7777555555555000555555555555577755555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_emissao_fat2Click
    end
    object btn_remessa2: TSpeedButton
      Left = 287
      Top = 4
      Width = 40
      Height = 40
      Hint = 'Gerar Remessa'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_remessaClick
    end
    object Label41: TLabel
      Left = 467
      Top = 7
      Width = 56
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label42: TLabel
      Left = 589
      Top = 6
      Width = 37
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Ordem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_incluir2: TSpeedButton
      Left = 4
      Top = 4
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
      OnClick = btn_incluir2Click
    end
    object btn_excluir2: TSpeedButton
      Left = 124
      Top = 4
      Width = 40
      Height = 40
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
      OnClick = btn_excluir2Click
    end
    object btn_retorna_acc: TSpeedButton
      Left = 367
      Top = 4
      Width = 40
      Height = 40
      Hint = 'Restaurar Master'
      Enabled = False
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_retorna_accClick
    end
    object edt_chave2: TEdit
      Left = 467
      Top = 20
      Width = 116
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edt_chave2Change
    end
    object cb_ordem2: TComboBox
      Left = 589
      Top = 20
      Width = 145
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 1
      TabStop = False
      OnChange = cb_ordem2Change
    end
  end
  object pgctrl_account: TPageControl
    Left = 0
    Top = 47
    Width = 742
    Height = 457
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_accountChange
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 53
        Width = 734
        Height = 376
        Align = alClient
        DataSource = datm_account.ds_processo
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_MASTER'
            Title.Caption = 'Master'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_HOUSE'
            Title.Caption = 'House'
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
            FieldName = 'calc_processo'
            Title.Caption = 'Processo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_AGENTE'
            Title.Caption = 'Agente'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 144
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CLIENTE'
            Title.Caption = 'Cliente'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_status'
            Title.Caption = 'Status'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_recebido'
            Title.Caption = 'Recebimento'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 82
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 53
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label5: TLabel
          Left = 9
          Top = 9
          Width = 52
          Height = 13
          Caption = 'Unidade '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_unid_pesq: TSpeedButton
          Left = 317
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
          OnClick = btn_co_unid_pesqClick
        end
        object Label6: TLabel
          Left = 355
          Top = 9
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
        object btn_co_prod_pesq: TSpeedButton
          Left = 665
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
          OnClick = btn_co_prod_pesqClick
        end
        object edt_nm_unid_pesq: TEdit
          Left = 46
          Top = 22
          Width = 270
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object edt_nm_prod_pesq: TEdit
          Left = 392
          Top = 22
          Width = 272
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object msk_unid_pesq: TMaskEdit
          Left = 10
          Top = 22
          Width = 37
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 0
          OnChange = btn_co_unid_pesqClick
          OnExit = msk_unid_pesqExit
          OnKeyDown = msk_prod_pesqKeyDown
        end
        object msk_prod_pesq: TMaskEdit
          Left = 356
          Top = 22
          Width = 37
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 2
          OnChange = btn_co_prod_pesqClick
          OnExit = msk_prod_pesqExit
          OnKeyDown = msk_prod_pesqKeyDown
        end
      end
    end
    object ts_dados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      object Label7: TLabel
        Left = 0
        Top = 124
        Width = 734
        Height = 13
        Align = alTop
        Caption = ' Faturas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgrid_faturas: TDBGrid
        Left = 0
        Top = 137
        Width = 734
        Height = 193
        Align = alClient
        Color = clInfoBk
        DataSource = datm_account.ds_fatura_ag
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Look_tp_fatura'
            PickList.Strings = (
              'N'
              'A')
            Title.Alignment = taCenter
            Title.Caption = 'Emissor/Fatura '
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_FATURA'
            Title.Caption = 'N'#186' Fatura'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 176
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_FATURA'
            Title.Caption = 'Data'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_vl_fatura'
            Title.Caption = 'Valor'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 108
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 124
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label3: TLabel
          Left = 8
          Top = 5
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
        object Label4: TLabel
          Left = 8
          Top = 80
          Width = 81
          Height = 13
          Caption = 'Valor Account'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 220
          Top = 80
          Width = 39
          Height = 13
          Caption = 'Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 117
          Top = 5
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
        object Label14: TLabel
          Left = 418
          Top = 5
          Width = 41
          Height = 13
          Caption = 'Agente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 8
          Top = 43
          Width = 40
          Height = 13
          Caption = 'Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 418
          Top = 43
          Width = 44
          Height = 13
          Caption = 'Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 419
          Top = 80
          Width = 37
          Height = 13
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nr_processo: TDBEdit
          Left = 8
          Top = 19
          Width = 98
          Height = 21
          Color = clMenu
          DataField = 'calc_processo'
          DataSource = datm_account.ds_processo
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_vl_account: TDBEdit
          Left = 8
          Top = 94
          Width = 196
          Height = 21
          Color = clMenu
          DataField = 'VL_ACCOUNT'
          DataSource = datm_account.ds_processo
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit2: TDBEdit
          Left = 219
          Top = 94
          Width = 189
          Height = 21
          Color = clMenu
          DataField = 'AP_MOEDA'
          DataSource = datm_account.ds_processo
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit3: TDBEdit
          Left = 116
          Top = 19
          Width = 292
          Height = 21
          Color = clMenu
          DataField = 'NM_CLIENTE'
          DataSource = datm_account.ds_processo
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 418
          Top = 19
          Width = 309
          Height = 21
          Color = clMenu
          DataField = 'NM_AGENTE'
          DataSource = datm_account.ds_processo
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit5: TDBEdit
          Left = 8
          Top = 56
          Width = 400
          Height = 21
          Color = clMenu
          DataField = 'NM_ORIGEM'
          DataSource = datm_account.ds_processo
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit6: TDBEdit
          Left = 418
          Top = 56
          Width = 309
          Height = 21
          Color = clMenu
          DataField = 'NM_DESTINO'
          DataSource = datm_account.ds_processo
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit1: TDBEdit
          Left = 418
          Top = 94
          Width = 174
          Height = 21
          Color = clMenu
          DataField = 'calc_status'
          DataSource = datm_account.ds_processo
          ReadOnly = True
          TabOrder = 7
        end
      end
      object TPanel
        Left = 0
        Top = 330
        Width = 734
        Height = 99
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 2
        object Label8: TLabel
          Left = 219
          Top = 30
          Width = 54
          Height = 13
          Caption = 'Nr Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 418
          Top = 30
          Width = 28
          Height = 13
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 600
          Top = 30
          Width = 30
          Height = 13
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_ajuste: TDBEdit
          Left = 600
          Top = 44
          Width = 127
          Height = 21
          DataField = 'VL_AJUSTE'
          DataSource = datm_account.ds_fatura_ag
          TabOrder = 5
          OnChange = dbedt_nr_faturaChange
        end
        object dbedt_cre_agente: TDBEdit
          Left = 600
          Top = 44
          Width = 127
          Height = 21
          DataField = 'VL_CRE_AGENTE'
          DataSource = datm_account.ds_fatura_ag
          TabOrder = 4
          OnChange = dbedt_nr_faturaChange
        end
        object dbedt_deb_agente: TDBEdit
          Left = 600
          Top = 44
          Width = 127
          Height = 21
          DataField = 'VL_DEB_AGENTE'
          DataSource = datm_account.ds_fatura_ag
          TabOrder = 7
          OnChange = dbedt_nr_faturaChange
        end
        object dbedt_cre_brasil: TDBEdit
          Left = 600
          Top = 44
          Width = 127
          Height = 21
          Color = clMenu
          DataField = 'VL_CRE_BRASIL'
          DataSource = datm_account.ds_fatura_ag
          ReadOnly = True
          TabOrder = 6
          OnChange = dbedt_nr_faturaChange
        end
        object dbedt_deb_brasil: TDBEdit
          Left = 600
          Top = 44
          Width = 127
          Height = 21
          Color = clMenu
          DataField = 'VL_DEB_BRASIL'
          DataSource = datm_account.ds_fatura_ag
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_nr_faturaChange
        end
        object dbrgp_tp_fatura: TDBRadioGroup
          Left = 10
          Top = 7
          Width = 199
          Height = 81
          DataField = 'TP_FATURA'
          DataSource = datm_account.ds_fatura_ag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Agente /Cr'#233'dito'
            'Agente /D'#233'bito'
            'Brasil /Ajuste')
          ParentFont = False
          TabOrder = 0
          Values.Strings = (
            '0'
            '1'
            '4')
          OnChange = dbrgp_tp_faturaChange
        end
        object dbedt_nr_fatura: TDBEdit
          Left = 219
          Top = 44
          Width = 189
          Height = 21
          DataField = 'NR_FATURA'
          DataSource = datm_account.ds_fatura_ag
          TabOrder = 1
          OnChange = dbedt_nr_faturaChange
        end
        object dbedt_dt_fatura: TDBEdit
          Left = 418
          Top = 44
          Width = 174
          Height = 21
          DataField = 'DT_FATURA'
          DataSource = datm_account.ds_fatura_ag
          TabOrder = 2
          OnChange = dbedt_nr_faturaChange
        end
      end
    end
    object ts_lista_master: TTabSheet
      Caption = 'Lista'
      ImageIndex = 2
      object dbgri_master: TDBGrid
        Left = 0
        Top = 55
        Width = 734
        Height = 374
        Align = alClient
        DataSource = datm_account.ds_master
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_MASTER'
            Title.Caption = 'Registro'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_MASTER'
            Title.Caption = 'Master'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_AGENTE'
            Title.Caption = 'C'#243'd.'
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
            FieldName = 'NM_AGENTE'
            Title.Caption = 'Agente'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 161
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ORIGEM'
            Title.Caption = 'Origem'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_DESTINO'
            Title.Caption = 'Destino'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_MOEDA'
            Title.Caption = 'Moeda'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_VIA_TRANSP'
            Title.Caption = 'Transporte'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_status'
            Title.Caption = 'Status'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 101
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 55
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label17: TLabel
          Left = 10
          Top = 10
          Width = 52
          Height = 13
          Caption = 'Unidade '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_unid_master: TSpeedButton
          Left = 242
          Top = 24
          Width = 25
          Height = 20
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
          OnClick = btn_co_unid_masterClick
        end
        object Label18: TLabel
          Left = 277
          Top = 10
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
        object btn_co_prod_master: TSpeedButton
          Left = 502
          Top = 24
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
          OnClick = btn_co_prod_masterClick
        end
        object Label46: TLabel
          Left = 556
          Top = 26
          Width = 169
          Height = 13
          Caption = 'Visualizar todos os Processos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_nm_unid_master: TEdit
          Left = 47
          Top = 24
          Width = 194
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object edt_nm_prod_master: TEdit
          Left = 309
          Top = 24
          Width = 192
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object rb_todos: TCheckBox
          Left = 539
          Top = 24
          Width = 16
          Height = 17
          TabOrder = 4
          OnClick = rb_todosClick
        end
        object msk_unid_master: TMaskEdit
          Left = 11
          Top = 24
          Width = 37
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 0
          OnChange = btn_co_unid_masterClick
          OnExit = msk_unid_masterExit
          OnKeyDown = msk_prod_pesqKeyDown
        end
        object msk_prod_master: TMaskEdit
          Left = 277
          Top = 24
          Width = 33
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 2
          OnExit = msk_prod_masterExit
          OnKeyDown = msk_prod_pesqKeyDown
        end
      end
    end
    object ts_dados_master: TTabSheet
      Caption = 'Dados'
      ImageIndex = 3
      object Label25: TLabel
        Left = 0
        Top = 126
        Width = 734
        Height = 13
        Align = alTop
        Caption = ' Faturas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 126
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label19: TLabel
          Left = 8
          Top = 6
          Width = 39
          Height = 13
          Caption = 'Master'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 292
          Top = 5
          Width = 41
          Height = 13
          Caption = 'Agente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 590
          Top = 5
          Width = 39
          Height = 13
          Caption = 'Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 8
          Top = 45
          Width = 40
          Height = 13
          Caption = 'Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 365
          Top = 45
          Width = 44
          Height = 13
          Caption = 'Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 589
          Top = 82
          Width = 81
          Height = 13
          Caption = 'Valor Account'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 8
          Top = 82
          Width = 95
          Height = 13
          Caption = 'Transportador Itl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Left = 291
          Top = 82
          Width = 102
          Height = 13
          Caption = 'Via de Transporte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label45: TLabel
          Left = 140
          Top = 5
          Width = 48
          Height = 13
          Caption = 'Registro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label47: TLabel
          Left = 462
          Top = 82
          Width = 37
          Height = 13
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_nr_master: TDBEdit
          Left = 8
          Top = 18
          Width = 123
          Height = 21
          Color = clMenu
          DataField = 'NR_MASTER'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit9: TDBEdit
          Left = 335
          Top = 18
          Width = 248
          Height = 21
          Color = clMenu
          DataField = 'NM_AGENTE'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit10: TDBEdit
          Left = 632
          Top = 18
          Width = 92
          Height = 21
          Color = clMenu
          DataField = 'AP_MOEDA'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit11: TDBEdit
          Left = 589
          Top = 18
          Width = 44
          Height = 21
          Color = clMenu
          DataField = 'CD_MOEDA'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit13: TDBEdit
          Left = 52
          Top = 58
          Width = 301
          Height = 21
          Color = clMenu
          DataField = 'NM_ORIGEM'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit14: TDBEdit
          Left = 408
          Top = 58
          Width = 315
          Height = 21
          Color = clMenu
          DataField = 'NM_DESTINO'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit15: TDBEdit
          Left = 364
          Top = 58
          Width = 45
          Height = 21
          Color = clMenu
          DataField = 'CD_DESTINO'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit16: TDBEdit
          Left = 589
          Top = 95
          Width = 136
          Height = 21
          Color = clMenu
          DataField = 'VL_ACCOUNT'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 15
        end
        object DBEdit40: TDBEdit
          Left = 53
          Top = 95
          Width = 228
          Height = 21
          Color = clMenu
          DataField = 'NM_TRANSPORTADOR'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 11
        end
        object DBEdit42: TDBEdit
          Left = 323
          Top = 95
          Width = 136
          Height = 21
          Color = clMenu
          DataField = 'NM_VIA_TRANSP'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 13
        end
        object DBEdit7: TDBEdit
          Left = 140
          Top = 18
          Width = 141
          Height = 21
          Color = clMenu
          DataField = 'CD_MASTER'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit17: TDBEdit
          Left = 462
          Top = 95
          Width = 124
          Height = 21
          Color = clMenu
          DataField = 'calc_status'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 14
        end
        object DBEdit8: TDBEdit
          Left = 291
          Top = 18
          Width = 45
          Height = 21
          Color = clMenu
          DataField = 'CD_AGENTE'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit12: TDBEdit
          Left = 8
          Top = 58
          Width = 44
          Height = 21
          Color = clMenu
          DataField = 'CD_ORIGEM'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit39: TDBEdit
          Left = 8
          Top = 95
          Width = 45
          Height = 21
          Color = clMenu
          DataField = 'COD_TRANSPORTADOR'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit41: TDBEdit
          Left = 291
          Top = 95
          Width = 32
          Height = 21
          Color = clMenu
          DataField = 'CD_VIA_TRANSP'
          DataSource = datm_account.ds_master
          ReadOnly = True
          TabOrder = 12
        end
      end
      object TPanel
        Left = 0
        Top = 338
        Width = 734
        Height = 91
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 2
        object Label26: TLabel
          Left = 288
          Top = 22
          Width = 54
          Height = 13
          Caption = 'Nr Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 462
          Top = 22
          Width = 28
          Height = 13
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 589
          Top = 22
          Width = 30
          Height = 13
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb_Contabililzada: TLabel
          Left = 569
          Top = 72
          Width = 144
          Height = 16
          Caption = 'Fatura Contabilizada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object dbedt_deb_br_master: TDBEdit
          Left = 589
          Top = 36
          Width = 138
          Height = 21
          Color = clMenu
          DataField = 'VL_DEB_BRASIL'
          DataSource = datm_account.ds_master_fat_ag
          ReadOnly = True
          TabOrder = 5
          OnChange = dbedt_nr_fat_masterChange
        end
        object dbedt_ajuste_master: TDBEdit
          Left = 589
          Top = 36
          Width = 138
          Height = 21
          DataField = 'VL_AJUSTE'
          DataSource = datm_account.ds_master_fat_ag
          TabOrder = 4
          OnChange = dbedt_nr_fat_masterChange
        end
        object dbedt_cre_ag_master: TDBEdit
          Left = 589
          Top = 36
          Width = 138
          Height = 21
          DataField = 'VL_CRE_AGENTE'
          DataSource = datm_account.ds_master_fat_ag
          TabOrder = 7
          OnChange = dbedt_nr_fat_masterChange
        end
        object dbedt_deb_ag_master: TDBEdit
          Left = 589
          Top = 36
          Width = 138
          Height = 21
          DataField = 'VL_DEB_AGENTE'
          DataSource = datm_account.ds_master_fat_ag
          TabOrder = 6
          OnChange = dbedt_nr_fat_masterChange
        end
        object dbedt_cre_br_master: TDBEdit
          Left = 589
          Top = 36
          Width = 138
          Height = 21
          Color = clMenu
          DataField = 'VL_CRE_BRASIL'
          DataSource = datm_account.ds_master_fat_ag
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_nr_fat_masterChange
        end
        object dbrdgp_tp_fat_master: TDBRadioGroup
          Left = 10
          Top = 6
          Width = 155
          Height = 76
          DataField = 'TP_FATURA'
          DataSource = datm_account.ds_master_fat_ag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Agente /Cr'#233'dito'
            'Agente /D'#233'bito'
            'Brasil /Ajuste')
          ParentFont = False
          TabOrder = 0
          Values.Strings = (
            '0'
            '1'
            '4')
          OnChange = dbrdgp_tp_fat_masterChange
        end
        object dbedt_nr_fat_master: TDBEdit
          Left = 291
          Top = 36
          Width = 167
          Height = 21
          DataField = 'NR_FATURA'
          DataSource = datm_account.ds_master_fat_ag
          TabOrder = 1
          OnChange = dbedt_nr_fat_masterChange
        end
        object dbedt_dt_fat_master: TDBEdit
          Left = 462
          Top = 36
          Width = 124
          Height = 21
          DataField = 'DT_FATURA'
          DataSource = datm_account.ds_master_fat_ag
          TabOrder = 2
          OnChange = dbedt_nr_fat_masterChange
        end
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 139
        Width = 734
        Height = 199
        Align = alClient
        Color = clInfoBk
        DataSource = datm_account.ds_master_fat_ag
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Look_tp_fatura'
            PickList.Strings = (
              'N'
              'A')
            Title.Alignment = taCenter
            Title.Caption = 'Emissor/Fatura '
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_FATURA'
            Title.Caption = 'N'#186' Fatura'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 176
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_FATURA'
            Title.Caption = 'Data'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_vl_fatura'
            Title.Caption = 'Valor'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 108
            Visible = True
          end>
      end
    end
    object ts_processos: TTabSheet
      Caption = 'Houses'
      ImageIndex = 4
      object pgctrl_proc: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        ActivePage = ts_dados_proc
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_procChange
        object ts_lista_proc: TTabSheet
          Caption = 'Lista'
          object DBGrid4: TDBGrid
            Left = 0
            Top = 0
            Width = 726
            Height = 401
            Align = alClient
            DataSource = datm_account.ds_processo
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'calc_processo'
                Title.Caption = 'Processo'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 69
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_CLIENTE'
                Title.Caption = 'Cliente'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 158
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calc_status'
                Title.Caption = 'Status'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 74
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calc_recebido'
                Title.Caption = 'Recebimento'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 106
                Visible = True
              end>
          end
        end
        object ts_dados_proc: TTabSheet
          Caption = 'Dados do Processo'
          ImageIndex = 1
          object Label37: TLabel
            Left = 0
            Top = 124
            Width = 726
            Height = 13
            Align = alTop
            Caption = ' Faturas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 124
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label29: TLabel
              Left = 8
              Top = 5
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
            object Label30: TLabel
              Left = 8
              Top = 79
              Width = 81
              Height = 13
              Caption = 'Valor Account'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label31: TLabel
              Left = 219
              Top = 79
              Width = 39
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label32: TLabel
              Left = 118
              Top = 5
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
            object Label33: TLabel
              Left = 418
              Top = 5
              Width = 41
              Height = 13
              Caption = 'Agente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label34: TLabel
              Left = 8
              Top = 42
              Width = 40
              Height = 13
              Caption = 'Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label35: TLabel
              Left = 418
              Top = 42
              Width = 44
              Height = 13
              Caption = 'Destino'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label36: TLabel
              Left = 418
              Top = 79
              Width = 37
              Height = 13
              Caption = 'Status'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit24: TDBEdit
              Left = 8
              Top = 19
              Width = 98
              Height = 21
              Color = clMenu
              DataField = 'calc_processo'
              DataSource = datm_account.ds_processo
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit25: TDBEdit
              Left = 8
              Top = 94
              Width = 196
              Height = 21
              Color = clMenu
              DataField = 'VL_ACCOUNT'
              DataSource = datm_account.ds_processo
              ReadOnly = True
              TabOrder = 5
            end
            object DBEdit26: TDBEdit
              Left = 219
              Top = 94
              Width = 189
              Height = 21
              Color = clMenu
              DataField = 'AP_MOEDA'
              DataSource = datm_account.ds_processo
              ReadOnly = True
              TabOrder = 6
            end
            object DBEdit27: TDBEdit
              Left = 116
              Top = 19
              Width = 292
              Height = 21
              Color = clMenu
              DataField = 'NM_CLIENTE'
              DataSource = datm_account.ds_processo
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit28: TDBEdit
              Left = 418
              Top = 19
              Width = 300
              Height = 21
              Color = clMenu
              DataField = 'NM_AGENTE'
              DataSource = datm_account.ds_processo
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit29: TDBEdit
              Left = 8
              Top = 56
              Width = 400
              Height = 21
              Color = clMenu
              DataField = 'NM_ORIGEM'
              DataSource = datm_account.ds_processo
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit30: TDBEdit
              Left = 418
              Top = 56
              Width = 300
              Height = 21
              Color = clMenu
              DataField = 'NM_DESTINO'
              DataSource = datm_account.ds_processo
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit31: TDBEdit
              Left = 418
              Top = 93
              Width = 155
              Height = 21
              Color = clMenu
              DataField = 'calc_status'
              DataSource = datm_account.ds_processo
              ReadOnly = True
              TabOrder = 7
            end
          end
          object DBGrid5: TDBGrid
            Left = 0
            Top = 137
            Width = 726
            Height = 179
            Align = alClient
            Color = clInfoBk
            DataSource = datm_account.ds_fatura_ag
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Look_tp_fatura'
                PickList.Strings = (
                  'N'
                  'A')
                Title.Alignment = taCenter
                Title.Caption = 'Emissor/Fatura '
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_FATURA'
                Title.Caption = 'N'#186' Fatura'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 176
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_FATURA'
                Title.Caption = 'Data'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 111
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calc_vl_fatura'
                Title.Caption = 'Valor'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 108
                Visible = True
              end>
          end
          object TPanel
            Left = 0
            Top = 316
            Width = 726
            Height = 85
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 2
            object Label38: TLabel
              Left = 219
              Top = 30
              Width = 54
              Height = 13
              Caption = 'Nr Fatura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label39: TLabel
              Left = 421
              Top = 30
              Width = 28
              Height = 13
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label40: TLabel
              Left = 591
              Top = 30
              Width = 30
              Height = 13
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_ajuste_proc: TDBEdit
              Left = 590
              Top = 44
              Width = 130
              Height = 21
              Color = clMenu
              DataField = 'VL_AJUSTE'
              DataSource = datm_account.ds_fatura_ag
              ReadOnly = True
              TabOrder = 5
              OnChange = dbedt_nr_faturaChange
            end
            object dbedt_cre_ag_proc: TDBEdit
              Left = 590
              Top = 44
              Width = 130
              Height = 21
              Color = clMenu
              DataField = 'VL_CRE_AGENTE'
              DataSource = datm_account.ds_fatura_ag
              ReadOnly = True
              TabOrder = 4
              OnChange = dbedt_nr_faturaChange
            end
            object dbedt_deb_ag_proc: TDBEdit
              Left = 590
              Top = 44
              Width = 130
              Height = 21
              Color = clMenu
              DataField = 'VL_DEB_AGENTE'
              DataSource = datm_account.ds_fatura_ag
              ReadOnly = True
              TabOrder = 7
              OnChange = dbedt_nr_faturaChange
            end
            object dbedt_cre_br_proc: TDBEdit
              Left = 590
              Top = 44
              Width = 130
              Height = 21
              Color = clMenu
              DataField = 'VL_CRE_BRASIL'
              DataSource = datm_account.ds_fatura_ag
              ReadOnly = True
              TabOrder = 6
              OnChange = dbedt_nr_faturaChange
            end
            object dbedt_deb_br_proc: TDBEdit
              Left = 590
              Top = 44
              Width = 130
              Height = 21
              Color = clMenu
              DataField = 'VL_DEB_BRASIL'
              DataSource = datm_account.ds_fatura_ag
              ReadOnly = True
              TabOrder = 3
              OnChange = dbedt_nr_faturaChange
            end
            object DBRadioGroup2: TDBRadioGroup
              Left = 9
              Top = 4
              Width = 155
              Height = 73
              DataField = 'TP_FATURA'
              DataSource = datm_account.ds_fatura_ag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Agente /Cr'#233'dito'
                'Agente /D'#233'bito'
                'Brasil /Ajuste')
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Values.Strings = (
                '0'
                '1'
                '4')
              OnChange = dbrgp_tp_faturaChange
            end
            object DBEdit37: TDBEdit
              Left = 219
              Top = 44
              Width = 189
              Height = 21
              Color = clMenu
              DataField = 'NR_FATURA'
              DataSource = datm_account.ds_fatura_ag
              ReadOnly = True
              TabOrder = 1
              OnChange = dbedt_nr_faturaChange
            end
            object DBEdit38: TDBEdit
              Left = 418
              Top = 44
              Width = 155
              Height = 21
              Color = clMenu
              DataField = 'DT_FATURA'
              DataSource = datm_account.ds_fatura_ag
              ReadOnly = True
              TabOrder = 2
              OnChange = dbedt_nr_faturaChange
            end
          end
        end
      end
    end
  end
  object main_menu_proc: TMainMenu
    Left = 668
    Top = 290
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
    end
    object TMenuItem
    end
    object mi_verif_acc: TMenuItem
      Caption = 'Verificar Account'
      Enabled = False
      OnClick = btn_verif_accClick
    end
    object mi_aprov_proc: TMenuItem
      Caption = '&Aprovar Account'
    end
    object mi_emissao_fat: TMenuItem
      Caption = '&Emiss'#227'o Fatura'
      Enabled = False
    end
    object mi_remessa: TMenuItem
      Caption = '&Gerar Remessa'
      OnClick = btn_remessaClick
    end
    object mi_bloc_proc: TMenuItem
      Caption = 'Operacional'
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object main_menu_master: TMainMenu
    Left = 668
    Top = 248
    object mi_salvar2: TMenuItem
      Caption = '&Salvar'
    end
    object mi_Cancelar2: TMenuItem
      Caption = '&Cancelar'
    end
    object mi_verif_acc2: TMenuItem
      Caption = 'Verificar Account'
      Enabled = False
      OnClick = btn_verif_accClick
    end
    object mi_aprov_proc2: TMenuItem
      Caption = '&Aprovar Account'
    end
    object mi_emissao_fat2: TMenuItem
      Caption = '&Emiss'#227'o Fatura'
      Enabled = False
    end
    object mi_remessa2: TMenuItem
      Caption = '&Gerar Remessa'
      OnClick = btn_remessaClick
    end
    object mi_bloc_proc2: TMenuItem
      Caption = 'Operacional'
    end
    object Mi_retorna_acc: TMenuItem
      Caption = 'Restaurar Master'
    end
    object MenuItem8: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
    object TMenuItem
    end
  end
end
