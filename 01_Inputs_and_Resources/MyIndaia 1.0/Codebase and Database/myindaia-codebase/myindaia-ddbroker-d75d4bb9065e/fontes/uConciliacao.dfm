object frm_conciliacao: Tfrm_conciliacao
  Left = 136
  Top = 120
  Width = 750
  Height = 548
  Caption = 'Concilia'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      47)
    object btn_sair: TSpeedButton
      Left = 698
      Top = 4
      Width = 38
      Height = 39
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
    object btn_cancelar: TSpeedButton
      Left = 46
      Top = 4
      Width = 38
      Height = 39
      Hint = 'Cancela data de concilia'#231#227'o'
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancelarClick
    end
    object btn_conciliar: TSpeedButton
      Left = 4
      Top = 4
      Width = 38
      Height = 39
      Hint = 'Concilia Lan'#231'amentos'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      OnClick = btn_conciliarClick
    end
    object btn_le: TSpeedButton
      Left = 88
      Top = 4
      Width = 38
      Height = 39
      Hint = 'L'#234' Arquivo'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_leClick
    end
    object btn_lanc: TSpeedButton
      Left = 130
      Top = 4
      Width = 38
      Height = 39
      Hint = 'Concilia Lan'#231'amentos'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555FFFFFFFFFF55555000000000055555577777777775FFFF00B8B8B8B8B0
        0000775F5555555777770B0B8B8B8B8B0FF07F75F555555575F70FB0B8B8B8B8
        B0F07F575FFFFFFFF7F70BFB0000000000F07F557777777777570FBFBF0FFFFF
        FFF07F55557F5FFFFFF70BFBFB0F000000F07F55557F777777570FBFBF0FFFFF
        FFF075F5557F5FFFFFF750FBFB0F000000F0575FFF7F777777575700000FFFFF
        FFF05577777F5FF55FF75555550F00FF00005555557F775577775555550FFFFF
        0F055555557F55557F755555550FFFFF00555555557FFFFF7755555555000000
        0555555555777777755555555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_lancClick
    end
    object btn_saltar: TSpeedButton
      Left = 229
      Top = 4
      Width = 38
      Height = 39
      Hint = 'Traz pr'#243'ximo registro'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333333333333333333333FF333333333333370733333333
        33333777F33333333333309073333333333337F77F3333F33333370907333733
        3333377F77F337F3333333709073003333333377F77F77F33333333709009033
        333333377F77373F33333333709999033333333377F3337F3333333330999903
        3333333337333373F333333309999990333333337FF33337F333333700999990
        33333337773FF3373F333333330099990333333333773FF37F33333333330099
        033333333333773F73F3333333333300903333333333337737F3333333333333
        0033333333333333773333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_saltarClick
    end
    object btn_conciliar_txt: TSpeedButton
      Left = 270
      Top = 4
      Width = 38
      Height = 39
      Hint = 'Concilia '
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
      Visible = False
      OnClick = btn_conciliar_txtClick
    end
    object btn_salvar: TSpeedButton
      Left = 311
      Top = 4
      Width = 38
      Height = 39
      Hint = 'Salvar lan'#231'amento'
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
      Visible = False
      OnClick = btn_salvarClick
    end
    object btn_buscar: TSpeedButton
      Left = 352
      Top = 4
      Width = 38
      Height = 39
      Hint = 'Busca'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_buscarClick
    end
    object btn_compor: TSpeedButton
      Left = 393
      Top = 4
      Width = 38
      Height = 39
      Hint = 'Comp'#245'e valores'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
        055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
        305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
        30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
        3055577777555557F7F555000555555999555577755555577755}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_buscarClick
    end
    object btn_retorna: TSpeedButton
      Left = 657
      Top = 4
      Width = 38
      Height = 39
      Hint = 'Retorna para Concilia'#231#227'o Manual'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333333333333333333333333333333333FF333333333333
        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
        000033333373FF77777733333330003333333333333777333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_retornaClick
    end
    object btn_retornar: TSpeedButton
      Left = 188
      Top = 4
      Width = 38
      Height = 39
      Hint = 'Traz registro anterior'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333FFF3333333333333707333333333333F777F3333333333370
        9033333333F33F7737F33333373337090733333337F3F7737733333330037090
        73333333377F7737733333333090090733333333373773773333333309999073
        333333337F333773333333330999903333333333733337F33333333099999903
        33333337F3333F7FF33333309999900733333337333FF7773333330999900333
        3333337F3FF7733333333309900333333333337FF77333333333309003333333
        333337F773333333333330033333333333333773333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_retornarClick
    end
  end
  object ntb_conc: TNotebook
    Left = 0
    Top = 47
    Width = 742
    Height = 455
    Align = alTop
    PageIndex = 1
    TabOrder = 1
    object TPage
      Left = 0
      Top = 0
      Caption = 'conc_manual'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 105
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        DesignSize = (
          742
          105)
        object Shape2: TShape
          Left = 4
          Top = 10
          Width = 485
          Height = 85
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label19: TLabel
          Left = 9
          Top = 53
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
          Left = 187
          Top = 64
          Width = 24
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
        object Label31: TLabel
          Left = 217
          Top = 15
          Width = 56
          Height = 13
          Caption = 'Dt. Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 397
          Top = 15
          Width = 88
          Height = 13
          Caption = 'Dt. Concilia'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 314
          Top = 55
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
        object Label2: TLabel
          Left = 314
          Top = 15
          Width = 53
          Height = 13
          Caption = 'N'#186' Docto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 9
          Top = 15
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
        object btn_co_unidade: TSpeedButton
          Left = 187
          Top = 26
          Width = 24
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
          OnClick = btn_co_unidadeClick
        end
        object Label34: TLabel
          Left = 217
          Top = 53
          Width = 49
          Height = 13
          Caption = 'Dt. Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edit_nm_banco: TEdit
          Left = 47
          Top = 66
          Width = 139
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 8
        end
        object rdgp_tp_pesquisa: TRadioGroup
          Left = 614
          Top = 5
          Width = 124
          Height = 90
          Caption = 'Lan'#231'amentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'N'#227'o Conciliados'
            'Conciliados'
            'Todos')
          ParentFont = False
          TabOrder = 7
          OnClick = rdgp_tp_pesquisaClick
        end
        object msk_cd_banco: TMaskEdit
          Left = 9
          Top = 66
          Width = 39
          Height = 21
          TabOrder = 1
          OnChange = msk_cd_bancoChange
          OnExit = msk_cd_bancoExit
          OnKeyDown = msk_cd_bancoKeyDown
        end
        object msk_valor: TMaskEdit
          Left = 314
          Top = 68
          Width = 99
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 5
          OnExit = msk_valorExit
        end
        object msk_n_docto: TMaskEdit
          Left = 314
          Top = 28
          Width = 78
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnExit = msk_n_doctoExit
        end
        object msk_dt_inicio: TDateEdit
          Left = 217
          Top = 28
          Width = 92
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 2
          OnExit = msk_dt_inicioExit
        end
        object msk_dt_fim: TDateEdit
          Left = 218
          Top = 66
          Width = 92
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 3
          OnExit = msk_dt_fimExit
        end
        object msk_cd_unidade: TMaskEdit
          Left = 9
          Top = 28
          Width = 38
          Height = 21
          TabOrder = 0
          OnChange = msk_cd_unidadeChange
          OnExit = msk_cd_unidadeExit
          OnKeyDown = msk_cd_bancoKeyDown
        end
        object edit_nm_unidade: TEdit
          Left = 47
          Top = 28
          Width = 139
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 9
        end
        object rdgp_pag: TRadioGroup
          Left = 490
          Top = 5
          Width = 124
          Height = 90
          Caption = 'Forma de Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Cheque'
            'DOC/D'#233'b Conta'
            'TED'
            'Dinheiro')
          ParentFont = False
          TabOrder = 10
          OnClick = rdgp_pagClick
        end
        object msk_dt_conciliacao_pe: TDateEdit
          Left = 397
          Top = 28
          Width = 91
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 6
          OnExit = msk_dt_conciliacao_peExit
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 383
        Width = 742
        Height = 72
        Align = alBottom
        TabOrder = 1
        DesignSize = (
          742
          72)
        object Label4: TLabel
          Left = 313
          Top = 3
          Width = 100
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Saldo no Per'#237'odo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox1: TGroupBox
          Left = 314
          Top = 14
          Width = 423
          Height = 53
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label5: TLabel
            Left = 6
            Top = 10
            Width = 60
            Height = 13
            Caption = 'Conciliado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 146
            Top = 10
            Width = 87
            Height = 13
            Caption = 'N'#227'o Conciliado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 284
            Top = 10
            Width = 30
            Height = 13
            Caption = 'Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object msk_conciliado: TMaskEdit
            Left = 7
            Top = 23
            Width = 130
            Height = 22
            AutoSize = False
            BiDiMode = bdRightToLeftReadingOnly
            Color = clBtnFace
            Ctl3D = False
            EditMask = '99;0; '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 2
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
          end
          object msk_nao_conciliado: TMaskEdit
            Left = 146
            Top = 23
            Width = 130
            Height = 22
            AutoSize = False
            BiDiMode = bdRightToLeftNoAlign
            Color = clBtnFace
            Ctl3D = False
            EditMask = '99;0; '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 2
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
          end
          object msk_total: TMaskEdit
            Left = 284
            Top = 23
            Width = 130
            Height = 22
            AutoSize = False
            Color = clBtnFace
            Ctl3D = False
            EditMask = '99;0; '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 2
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object pgctrl_lancamentos: TPageControl
        Left = 2
        Top = 105
        Width = 742
        Height = 278
        ActivePage = TabSheet1
        Align = alCustom
        TabOrder = 2
        OnChange = pgctrl_lancamentosChange
        object TabSheet1: TTabSheet
          Caption = 'Lan'#231'amentos'
          DesignSize = (
            734
            250)
          object dbgrid_pes_recebimento: TDBGrid
            Left = 0
            Top = 1
            Width = 734
            Height = 252
            Align = alCustom
            DataSource = datm_conciliacao.ds_caixa
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = dbgrid_pes_recebimentoDblClick
            Columns = <
              item
                Alignment = taCenter
                Color = clInfoBk
                Expanded = False
                FieldName = 'CalcStatus'
                Font.Charset = SYMBOL_CHARSET
                Font.Color = clTeal
                Font.Height = -11
                Font.Name = 'Wingdings'
                Font.Style = [fsBold]
                Title.Alignment = taCenter
                Title.Caption = 'Status'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 41
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'DT_MOVIMENTO'
                Title.Alignment = taCenter
                Title.Caption = 'Data Movimento'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 110
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CalcProcesso'
                Title.Alignment = taCenter
                Title.Caption = 'Processo'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 98
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_ITEM'
                Title.Alignment = taCenter
                Title.Caption = 'Item'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 114
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'NR_CHEQUE'
                Title.Alignment = taCenter
                Title.Caption = 'Cheque'
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
                FieldName = 'VL_LANCAMENTO'
                Title.Alignment = taCenter
                Title.Caption = 'Valor'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 100
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CD_UNID_NEG'
                Title.Alignment = taCenter
                Title.Caption = 'Unid.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'DT_CONCILIACAO'
                Title.Alignment = taCenter
                Title.Caption = 'Dt Compensa'#231#227'o'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 110
                Visible = True
              end>
          end
          object pnl_hint: TPanel
            Left = 3
            Top = 216
            Width = 400
            Height = 34
            Anchors = [akLeft, akBottom]
            BevelOuter = bvNone
            TabOrder = 0
            object shp_hint: TShape
              Left = 2
              Top = 6
              Width = 370
              Height = 25
              Brush.Color = clInfoBk
            end
            object lbl_emitidos: TLabel
              Left = 8
              Top = 9
              Width = 104
              Height = 21
              Caption = '2    '#252
              Font.Charset = SYMBOL_CHARSET
              Font.Color = clGreen
              Font.Height = -19
              Font.Name = 'Wingdings'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object btn_encolhe: TSpeedButton
              Left = 378
              Top = 2
              Width = 20
              Height = 30
              Caption = '<<'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = btn_encolheClick
            end
            object lbl_hint: TLabel
              Left = 22
              Top = 13
              Width = 343
              Height = 13
              Caption = 
                '- Conciliados            - Selecionados      (duplo-clique para ' +
                'alterar o status)'
              Transparent = True
            end
          end
          object pnl_dt_conciliacao: TPanel
            Left = 254
            Top = 48
            Width = 196
            Height = 111
            BevelInner = bvLowered
            BorderWidth = 2
            TabOrder = 2
            Visible = False
            object Label37: TLabel
              Left = 37
              Top = 20
              Width = 127
              Height = 13
              Caption = 'Data para Concilia'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_ok: TSpeedButton
              Left = 29
              Top = 79
              Width = 52
              Height = 22
              Hint = 'Concilia'
              Caption = '&OK'
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
              ShowHint = False
              OnClick = btn_okClick
            end
            object btn_sair_dt: TSpeedButton
              Left = 109
              Top = 79
              Width = 52
              Height = 22
              Hint = 'Sair da tela Data para Concilia'#231#227'o'
              Caption = '&Sair'
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
              ShowHint = False
              OnClick = btn_sair_dtClick
            end
            object msk_dt_conciliacao: TMaskEdit
              Left = 51
              Top = 39
              Width = 88
              Height = 21
              BiDiMode = bdLeftToRight
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              ParentBiDiMode = False
              TabOrder = 0
              Text = '  /  /    '
            end
          end
        end
        object ts_dados_basicos: TTabSheet
          Caption = 'Dados B'#225'sicos'
          ImageIndex = 1
          object Label113: TLabel
            Left = 217
            Top = 163
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
          object Label8: TLabel
            Left = 305
            Top = 4
            Width = 93
            Height = 13
            Caption = 'Data Movimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 630
            Top = 4
            Width = 70
            Height = 13
            Caption = 'Lan'#231'amento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 408
            Top = 4
            Width = 103
            Height = 13
            Caption = 'Valor Lan'#231'amento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 217
            Top = 208
            Width = 83
            Height = 13
            Caption = 'N'#186' Documento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 7
            Top = 4
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
          object Label14: TLabel
            Left = 7
            Top = 78
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
          object Label32: TLabel
            Left = 527
            Top = 4
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
          object Label43: TLabel
            Left = 7
            Top = 42
            Width = 82
            Height = 13
            Caption = 'Contra Partida'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 305
            Top = 42
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
          object Label44: TLabel
            Left = 408
            Top = 42
            Width = 30
            Height = 13
            Caption = 'INSS'
            FocusControl = dbedt_vl_inss
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label45: TLabel
            Left = 527
            Top = 42
            Width = 72
            Height = 13
            Caption = 'PIS/COFINS'
            FocusControl = dbedt_vl_pis_cofins
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label46: TLabel
            Left = 630
            Top = 42
            Width = 21
            Height = 13
            Caption = 'ISS'
            FocusControl = dbedt_vl_iss
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_contabiliza: TLabel
            Left = 408
            Top = 79
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
          object Label47: TLabel
            Left = 527
            Top = 79
            Width = 67
            Height = 13
            Caption = 'Concilia'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label48: TLabel
            Left = 630
            Top = 79
            Width = 98
            Height = 13
            Caption = 'Data Concilia'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_banco: TDBEdit
            Left = 217
            Top = 176
            Width = 50
            Height = 21
            TabStop = False
            DataField = 'CD_BANCO'
            DataSource = datm_conciliacao.ds_caixa
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_dt_movimento: TDBEdit
            Left = 305
            Top = 18
            Width = 79
            Height = 21
            TabStop = False
            DataField = 'DT_MOVIMENTO'
            DataSource = datm_conciliacao.ds_caixa
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_lancamento: TDBEdit
            Left = 630
            Top = 18
            Width = 56
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NR_LANCAMENTO'
            DataSource = datm_conciliacao.ds_caixa
            ReadOnly = True
            TabOrder = 2
          end
          object dbm_historico: TDBMemo
            Left = 7
            Top = 116
            Width = 387
            Height = 40
            TabStop = False
            DataField = 'NM_HISTORICO'
            DataSource = datm_conciliacao.ds_caixa
            ReadOnly = True
            TabOrder = 3
          end
          object dbedt_vl_lancamento: TDBEdit
            Left = 408
            Top = 18
            Width = 98
            Height = 21
            TabStop = False
            DataField = 'VL_LANCAMENTO'
            DataSource = datm_conciliacao.ds_caixa
            ReadOnly = True
            TabOrder = 4
          end
          object dbedt_cheque: TDBEdit
            Left = 217
            Top = 222
            Width = 88
            Height = 21
            TabStop = False
            DataField = 'NR_CHEQUE'
            DataSource = datm_conciliacao.ds_caixa
            ReadOnly = True
            TabOrder = 5
          end
          object dbedt_favorecido: TDBEdit
            Left = 7
            Top = 18
            Width = 45
            Height = 21
            TabStop = False
            DataField = 'CD_FAVORECIDO'
            DataSource = datm_conciliacao.ds_caixa
            ReadOnly = True
            TabOrder = 6
          end
          object dbedt_item: TDBEdit
            Left = 7
            Top = 91
            Width = 48
            Height = 21
            TabStop = False
            DataField = 'CD_ITEM'
            DataSource = datm_conciliacao.ds_caixa
            ReadOnly = True
            TabOrder = 7
          end
          object edt_nm_favorecido: TEdit
            Left = 55
            Top = 19
            Width = 220
            Height = 21
            TabStop = False
            Color = clMenu
            TabOrder = 8
          end
          object edt_nm_banco: TEdit
            Left = 270
            Top = 176
            Width = 229
            Height = 21
            TabStop = False
            Color = clMenu
            TabOrder = 9
          end
          object edt_nm_item: TEdit
            Left = 57
            Top = 92
            Width = 220
            Height = 21
            TabStop = False
            Color = clMenu
            TabOrder = 10
          end
          object dbedt_processo: TDBEdit
            Left = 527
            Top = 18
            Width = 80
            Height = 21
            TabStop = False
            DataField = 'CalcProcesso'
            DataSource = datm_conciliacao.ds_caixa
            ReadOnly = True
            TabOrder = 11
          end
          object dbedt_cta_partida: TDBEdit
            Left = 7
            Top = 56
            Width = 98
            Height = 21
            TabStop = False
            DataField = 'CD_CT_CONTABIL'
            DataSource = datm_conciliacao.ds_caixa
            ReadOnly = True
            TabOrder = 12
          end
          object edt_nm_cta_partida: TEdit
            Left = 108
            Top = 56
            Width = 169
            Height = 21
            TabStop = False
            Color = clMenu
            TabOrder = 13
          end
          object dbrdgrp_forma_pagto_contabil: TDBRadioGroup
            Left = 7
            Top = 157
            Width = 155
            Height = 94
            Caption = '&Forma de Pagamento'
            DataField = 'CalcForma'
            DataSource = datm_conciliacao.ds_caixa
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
            TabOrder = 14
            Values.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5')
          end
          object dbrdgrp_natureza: TDBRadioGroup
            Left = 527
            Top = 165
            Width = 181
            Height = 35
            Caption = 'Natureza'
            Columns = 2
            DataField = 'TP_NATUREZA'
            DataSource = datm_conciliacao.ds_caixa
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Items.Strings = (
              'Cr'#233'dito'
              'D'#233'bito')
            ParentFont = False
            TabOrder = 15
            Values.Strings = (
              'C'
              'D')
          end
          object dbedt_vl_ir_contabil: TDBEdit
            Left = 305
            Top = 55
            Width = 76
            Height = 21
            DataField = 'VL_IR'
            DataSource = datm_conciliacao.ds_caixa
            TabOrder = 16
          end
          object dbedt_vl_inss: TDBEdit
            Left = 408
            Top = 55
            Width = 80
            Height = 21
            DataField = 'VL_INSS'
            DataSource = datm_conciliacao.ds_caixa
            TabOrder = 17
          end
          object dbedt_vl_pis_cofins: TDBEdit
            Left = 527
            Top = 55
            Width = 80
            Height = 21
            DataField = 'VL_PISCOFINS'
            DataSource = datm_conciliacao.ds_caixa
            TabOrder = 18
          end
          object dbedt_vl_iss: TDBEdit
            Left = 630
            Top = 55
            Width = 80
            Height = 21
            DataField = 'VL_ISS'
            DataSource = datm_conciliacao.ds_caixa
            TabOrder = 19
          end
          object dbedt_contabiliza: TDBEdit
            Left = 408
            Top = 92
            Width = 47
            Height = 21
            DataField = 'CalcContabilizacao'
            DataSource = datm_conciliacao.ds_caixa
            TabOrder = 20
          end
          object dbedt_conciliacao: TDBEdit
            Left = 527
            Top = 92
            Width = 47
            Height = 21
            DataField = 'CalcConciliacao'
            DataSource = datm_conciliacao.ds_caixa
            TabOrder = 21
          end
          object dbedt_dt_conciliacao: TDBEdit
            Left = 630
            Top = 92
            Width = 79
            Height = 21
            TabStop = False
            DataField = 'DT_CONCILIACAO'
            DataSource = datm_conciliacao.ds_caixa
            ReadOnly = True
            TabOrder = 22
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'conc_txt'
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 105
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Shape3: TShape
          Left = 448
          Top = 10
          Width = 280
          Height = 85
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape1: TShape
          Left = 8
          Top = 10
          Width = 277
          Height = 85
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label35: TLabel
          Left = 23
          Top = 53
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
        object Label36: TLabel
          Left = 468
          Top = 15
          Width = 56
          Height = 13
          Caption = 'Dt. Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 596
          Top = 15
          Width = 83
          Height = 13
          Caption = 'N'#186' Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 23
          Top = 15
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
        object Label41: TLabel
          Left = 468
          Top = 51
          Width = 49
          Height = 13
          Caption = 'Dt. Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edit_nm_banco_c: TEdit
          Left = 61
          Top = 66
          Width = 214
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 6
        end
        object rdgp_pag_c: TRadioGroup
          Left = 292
          Top = 5
          Width = 149
          Height = 90
          Caption = 'Forma de Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'Cheque'
            'DOC / D'#233'bito Conta'
            'TED'
            'Taxas')
          ParentFont = False
          TabOrder = 5
          OnClick = rdgp_pag_cClick
        end
        object msk_cd_banco_c: TMaskEdit
          Left = 23
          Top = 66
          Width = 39
          Height = 21
          TabOrder = 1
        end
        object msk_nr_docto: TMaskEdit
          Left = 596
          Top = 28
          Width = 98
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnExit = msk_nr_doctoExit
        end
        object dt_inicial_c: TDateEdit
          Left = 468
          Top = 28
          Width = 95
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 2
          OnExit = dt_inicial_cExit
        end
        object dt_final_c: TDateEdit
          Left = 469
          Top = 66
          Width = 95
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 3
          OnExit = dt_final_cExit
        end
        object msk_cd_unidade_c: TMaskEdit
          Left = 23
          Top = 28
          Width = 38
          Height = 21
          TabOrder = 0
        end
        object edit_nm_unidade_c: TEdit
          Left = 61
          Top = 28
          Width = 216
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 7
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 107
        Width = 338
        Height = 347
        Align = alCustom
        BevelInner = bvLowered
        TabOrder = 1
        object Shape4: TShape
          Left = 8
          Top = 12
          Width = 308
          Height = 29
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object lbl_banco: TLabel
          Left = 23
          Top = 20
          Width = 109
          Height = 13
          Caption = 'Entradas no Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 12
          Top = 50
          Width = 85
          Height = 13
          Caption = 'Data Lan'#231'amento'
        end
        object Label20: TLabel
          Left = 12
          Top = 92
          Width = 86
          Height = 13
          Caption = 'Valor Lan'#231'amento'
        end
        object Label21: TLabel
          Left = 147
          Top = 50
          Width = 70
          Height = 13
          Caption = 'N'#186' Documento'
        end
        object Label22: TLabel
          Left = 146
          Top = 92
          Width = 43
          Height = 13
          Caption = 'Natureza'
        end
        object Label23: TLabel
          Left = 12
          Top = 133
          Width = 41
          Height = 13
          Caption = 'Hist'#243'rico'
        end
        object dbedt_dt_lanc: TDBEdit
          Left = 12
          Top = 193
          Width = 89
          Height = 21
          DataField = 'DT_LANCAMENTO'
          DataSource = datm_conciliacao.ds_conc_lanc_
          ReadOnly = True
          TabOrder = 0
          Visible = False
        end
        object dbedt_docto: TDBEdit
          Left = 147
          Top = 193
          Width = 103
          Height = 21
          DataField = 'NR_DOCUMENTO'
          DataSource = datm_conciliacao.ds_conc_lanc_
          ReadOnly = True
          TabOrder = 1
          Visible = False
        end
        object dbedt_vl_lan: TDBEdit
          Left = 12
          Top = 221
          Width = 103
          Height = 21
          DataField = 'VL_LANCAMENTO'
          DataSource = datm_conciliacao.ds_conc_lanc_
          ReadOnly = True
          TabOrder = 2
          Visible = False
        end
        object dbedt_historico: TDBEdit
          Left = 12
          Top = 257
          Width = 318
          Height = 21
          DataField = 'NM_HISTORICO'
          DataSource = datm_conciliacao.ds_conc_lanc_
          ReadOnly = True
          TabOrder = 3
          Visible = False
        end
        object dbedt_tp_natur: TDBEdit
          Left = 147
          Top = 221
          Width = 103
          Height = 21
          DataField = 'TP_NATUREZA'
          DataSource = datm_conciliacao.ds_conc_lanc_
          ReadOnly = True
          TabOrder = 4
          Visible = False
        end
        object edt_dt_lanc: TEdit
          Left = 13
          Top = 62
          Width = 92
          Height = 21
          TabOrder = 5
        end
        object edt_docto: TEdit
          Left = 147
          Top = 62
          Width = 92
          Height = 21
          TabOrder = 6
        end
        object edt_vl_lan: TEdit
          Left = 12
          Top = 105
          Width = 100
          Height = 21
          TabOrder = 7
        end
        object edt_tp_natur: TEdit
          Left = 146
          Top = 105
          Width = 101
          Height = 21
          TabOrder = 8
        end
        object edt_historico: TEdit
          Left = 12
          Top = 147
          Width = 319
          Height = 21
          TabOrder = 9
        end
      end
      object Panel4: TPanel
        Left = 337
        Top = 104
        Width = 404
        Height = 347
        Align = alCustom
        BevelInner = bvLowered
        TabOrder = 2
        object Shape5: TShape
          Left = 12
          Top = 12
          Width = 338
          Height = 29
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label24: TLabel
          Left = 23
          Top = 20
          Width = 96
          Height = 13
          Caption = 'Extrato MyIndaia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 12
          Top = 50
          Width = 85
          Height = 13
          Caption = 'Data Lan'#231'amento'
        end
        object Label26: TLabel
          Left = 147
          Top = 50
          Width = 70
          Height = 13
          Caption = 'N'#186' Documento'
        end
        object Label27: TLabel
          Left = 12
          Top = 92
          Width = 86
          Height = 13
          Caption = 'Valor Lan'#231'amento'
        end
        object Label28: TLabel
          Left = 147
          Top = 92
          Width = 43
          Height = 13
          Caption = 'Natureza'
        end
        object Label29: TLabel
          Left = 11
          Top = 133
          Width = 41
          Height = 13
          Caption = 'Hist'#243'rico'
        end
        object Label30: TLabel
          Left = 57
          Top = 318
          Width = 142
          Height = 13
          Caption = 'Valor Total Lan'#231'amentos'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Visible = False
        end
        object Label17: TLabel
          Left = 283
          Top = 50
          Width = 59
          Height = 13
          Caption = 'N'#186' Processo'
          Visible = False
        end
        object Label38: TLabel
          Left = 13
          Top = 98
          Width = 69
          Height = 13
          Caption = 'Conta Cont'#225'bil'
          Visible = False
        end
        object Label42: TLabel
          Left = 12
          Top = 170
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          Visible = False
        end
        object btn_conta: TSpeedButton
          Left = 311
          Top = 111
          Width = 24
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
          Visible = False
          OnClick = btn_contaClick
        end
        object Label15: TLabel
          Left = 12
          Top = 135
          Width = 76
          Height = 13
          Caption = 'Centro de Custo'
          Visible = False
        end
        object btn_custo: TSpeedButton
          Left = 314
          Top = 149
          Width = 24
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
          Visible = False
          OnClick = btn_custoClick
        end
        object dbedt_dt_lancamento: TDBEdit
          Left = 12
          Top = 255
          Width = 89
          Height = 21
          DataField = 'DT_MOVIMENTO'
          DataSource = datm_conciliacao.ds_caixa_docto
          ReadOnly = True
          TabOrder = 0
          Visible = False
        end
        object dbedt_nr_docto: TDBEdit
          Left = 147
          Top = 255
          Width = 103
          Height = 21
          DataField = 'NR_CHEQUE'
          DataSource = datm_conciliacao.ds_caixa_docto
          ReadOnly = True
          TabOrder = 1
          Visible = False
        end
        object dbedt_vl_lanc: TDBEdit
          Left = 12
          Top = 297
          Width = 103
          Height = 21
          DataField = 'VL_LANCAMENTO'
          DataSource = datm_conciliacao.ds_caixa_docto
          ReadOnly = True
          TabOrder = 2
          Visible = False
        end
        object dbedt_natur: TDBEdit
          Left = 147
          Top = 297
          Width = 99
          Height = 21
          DataField = 'TP_NATUREZA'
          DataSource = datm_conciliacao.ds_caixa_docto
          ReadOnly = True
          TabOrder = 3
          Visible = False
        end
        object dbgrd_caixa: TDBGrid
          Left = 7
          Top = 181
          Width = 386
          Height = 70
          DataSource = datm_conciliacao.ds_caixa_docto
          TabOrder = 5
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Visible = False
          Columns = <
            item
              Expanded = False
              FieldName = 'DT_MOVIMENTO'
              Title.Caption = 'Dt.Lan'#231
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_CHEQUE'
              Title.Caption = 'N'#186' Doc'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_LANCAMENTO'
              Title.Caption = 'Valor Lan'#231'.'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TP_NATUREZA'
              Title.Caption = 'Natureza'
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
              FieldName = 'NR_PROCESSO'
              Title.Caption = 'Processo'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 64
              Visible = True
            end>
        end
        object ed_valor_lancamentos: TEdit
          Left = 201
          Top = 314
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 6
          Visible = False
        end
        object pnl_aviso: TPanel
          Left = 73
          Top = 208
          Width = 236
          Height = 41
          BevelInner = bvLowered
          BorderWidth = 1
          Caption = 'Lan'#231'amento n'#227'o encontrado no Caixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          Visible = False
        end
        object dbedt_nr_processo: TDBEdit
          Left = 283
          Top = 255
          Width = 103
          Height = 21
          DataField = 'NR_PROCESSO'
          DataSource = datm_conciliacao.ds_caixa_docto
          ReadOnly = True
          TabOrder = 8
          Visible = False
        end
        object ed_conta: TEdit
          Left = 12
          Top = 110
          Width = 121
          Height = 21
          TabOrder = 9
          Visible = False
          OnExit = ed_contaExit
        end
        object ed_obs: TEdit
          Left = 12
          Top = 183
          Width = 360
          Height = 21
          TabOrder = 11
          Visible = False
        end
        object ed_nm_conta: TEdit
          Left = 136
          Top = 111
          Width = 169
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 12
          Visible = False
        end
        object dbedt_hist: TDBEdit
          Left = 162
          Top = 324
          Width = 363
          Height = 21
          DataField = 'NM_HISTORICO'
          DataSource = datm_conciliacao.ds_caixa_docto
          ReadOnly = True
          TabOrder = 4
          Visible = False
        end
        object edt_dt_lancamento: TEdit
          Left = 13
          Top = 62
          Width = 92
          Height = 21
          TabOrder = 13
        end
        object edt_nr_docto: TEdit
          Left = 147
          Top = 62
          Width = 92
          Height = 21
          TabOrder = 14
        end
        object edt_vl_lanc: TEdit
          Left = 12
          Top = 105
          Width = 100
          Height = 21
          TabOrder = 15
        end
        object edt_natur: TEdit
          Left = 146
          Top = 105
          Width = 101
          Height = 21
          TabOrder = 16
        end
        object edt_hist: TEdit
          Left = 12
          Top = 148
          Width = 319
          Height = 21
          TabOrder = 17
        end
        object edt_nr_processo: TEdit
          Left = 282
          Top = 63
          Width = 92
          Height = 21
          TabOrder = 18
        end
        object ed_custo: TEdit
          Left = 12
          Top = 148
          Width = 63
          Height = 21
          TabOrder = 10
          Visible = False
          OnExit = ed_custoExit
        end
        object ed_nm_custo: TEdit
          Left = 79
          Top = 149
          Width = 229
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 19
          Visible = False
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 484
    Top = 8
    object mi_conciliar: TMenuItem
      Caption = '&Concilia'
      Enabled = False
      OnClick = btn_conciliarClick
    end
    object mi_cancelar: TMenuItem
      Caption = 'C&ancela'
      Enabled = False
      OnClick = btn_cancelarClick
    end
    object mi_le: TMenuItem
      Caption = '&L'#234' Arquivo'
      OnClick = btn_leClick
    end
    object mi_lanc: TMenuItem
      Caption = 'Concilia &Lan'#231'.'
      OnClick = btn_lancClick
    end
    object mi_retornar: TMenuItem
      Caption = '&Retornar'
      Visible = False
      OnClick = btn_retornarClick
    end
    object mi_saltar: TMenuItem
      Caption = 'S&altar'
      Visible = False
      OnClick = btn_saltarClick
    end
    object mi_conciliar_txt: TMenuItem
      Caption = '&Conciliar'
      Visible = False
      OnClick = btn_conciliar_txtClick
    end
    object mi_salvar: TMenuItem
      Caption = 'Sal&var'
      Visible = False
      OnClick = btn_salvarClick
    end
    object mi_compor: TMenuItem
      Caption = 'Co&mpor'
      Visible = False
    end
    object mi_retorna: TMenuItem
      Caption = '&Retorna'
      Visible = False
      OnClick = btn_retornaClick
    end
    object mi_ignorar: TMenuItem
      Caption = '&Ignorar'
      Visible = False
      OnClick = mi_ignorarClick
    end
    object mi_sair: TMenuItem
      Caption = '&Sair'
      OnClick = btn_sairClick
    end
  end
  object open_file: TOpenDialog
    Filter = 'Arquivo texto|*.TXT;'
    InitialDir = 'C:\'
    Title = 'Selecione o arquivo para concilia'#231#227'o'
    Left = 520
    Top = 8
  end
end
