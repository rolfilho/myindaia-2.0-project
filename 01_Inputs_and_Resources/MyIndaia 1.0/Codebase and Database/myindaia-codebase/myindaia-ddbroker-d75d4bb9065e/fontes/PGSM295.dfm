object frm_notificacao: Tfrm_notificacao
  Left = 207
  Top = 200
  Width = 791
  Height = 550
  Caption = 'Numer'#225'rio/Notifica'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 51
    Align = alTop
    BevelInner = bvLowered
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Wingdings 3'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      775
      51)
    object btn_sair: TSpeedButton
      Left = 739
      Top = 5
      Width = 38
      Height = 41
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
    object btn_salvar: TSpeedButton
      Left = 43
      Top = 5
      Width = 38
      Height = 41
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
      Left = 81
      Top = 5
      Width = 38
      Height = 41
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
    object btn_incluir: TSpeedButton
      Left = 6
      Top = 5
      Width = 37
      Height = 41
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
    object btn_cancela_numerario: TSpeedButton
      Left = 215
      Top = 5
      Width = 36
      Height = 41
      Hint = 'Cancelar Solicita'#231#227'o de Numer'#225'rio'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancela_numerarioClick
    end
    object btn_print_: TSpeedButton
      Left = 264
      Top = 5
      Width = 36
      Height = 41
      Hint = 'Impress'#227'o de solicita'#231#227'o'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_print_Click
    end
    object btn_excluir: TSpeedButton
      Left = 119
      Top = 5
      Width = 36
      Height = 41
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
    object btn_duplica: TSpeedButton
      Left = 167
      Top = 5
      Width = 36
      Height = 41
      Hint = 'Duplica'#231#227'o '
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_duplicaClick
    end
    object btnDuplicaSolic: TSpeedButton
      Left = 300
      Top = 5
      Width = 36
      Height = 41
      Hint = 'Duplica itens para este processo/solicita'#231#227'o'
      Enabled = False
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
      OnClick = btnDuplicaSolicClick
    end
    object BtnIncluirObs: TSpeedButton
      Left = 336
      Top = 5
      Width = 36
      Height = 41
      Hint = 'Inclui observa'#231#245'es da DI automaticamente'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
        00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
        00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
        F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
        F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
        FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
        0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
        00337777FFFF77FF7733EEEE0000000003337777777777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnIncluirObsClick
    end
    object btnPreCalculo: TSpeedButton
      Left = 385
      Top = 5
      Width = 36
      Height = 41
      Hint = 'Pr'#233' C'#225'lculo'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337444444444
        73333337777777773F333348888888884333337F3F3F3FFF7F33334848489998
        4333337F737377737F333348888888884333337F3F3F3F3F7F33334848484848
        4333337F737373737F333348888888884333337F3F3F3F3F7F33334848484848
        4333337F737373737F333348888888884333337F3F3F3F3F7F33334848484848
        4333337F737373737F333348888888884333337F3FFFFFFF7F33334844444448
        4333337F7777777F7F333348444E4E484333337F7FFFFF7F7F33334844444448
        4333337F777777737F333348888888884333337F333333337F33334888888888
        43333373FFFFFFFF733333744444444473333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnPreCalculoClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 51
    Width = 775
    Height = 100
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object lbl_cd_unid_neg: TLabel
      Left = 16
      Top = 14
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
    object btn_cd_unid_neg: TSpeedButton
      Left = 249
      Top = 26
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
      OnClick = btn_cd_unid_negClick
    end
    object Label1: TLabel
      Left = 290
      Top = 14
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
    object btn_cd_produto: TSpeedButton
      Left = 530
      Top = 26
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
      OnClick = btn_cd_produtoClick
    end
    object lbl_nr_processo: TLabel
      Left = 571
      Top = 14
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
    object btn_processo: TSpeedButton
      Left = 684
      Top = 26
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
      OnClick = btn_processoClick
    end
    object lbl_cd_servico: TLabel
      Left = 236
      Top = 51
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
    object lbl_cd_cliente: TLabel
      Left = 16
      Top = 51
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
    object Label18: TLabel
      Left = 623
      Top = 51
      Width = 113
      Height = 13
      Caption = 'Processo Vinculado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object edt_nm_unid_neg: TEdit
      Left = 59
      Top = 27
      Width = 189
      Height = 21
      TabStop = False
      ParentColor = True
      ReadOnly = True
      TabOrder = 2
    end
    object edt_nm_produto: TEdit
      Left = 331
      Top = 27
      Width = 198
      Height = 21
      TabStop = False
      ParentColor = True
      ReadOnly = True
      TabOrder = 4
    end
    object dbedt_nm_servico: TDBEdit
      Left = 276
      Top = 64
      Width = 177
      Height = 21
      TabStop = False
      DataField = 'NM_SERVICO'
      DataSource = datm_notificacao.ds_processo
      ParentColor = True
      ReadOnly = True
      TabOrder = 5
    end
    object dbedt_cd_servico: TDBEdit
      Left = 236
      Top = 64
      Width = 41
      Height = 21
      TabStop = False
      DataField = 'CD_SERVICO'
      DataSource = datm_notificacao.ds_processo
      ParentColor = True
      ReadOnly = True
      TabOrder = 6
    end
    object dbedt_nm_cliente: TDBEdit
      Left = 57
      Top = 64
      Width = 167
      Height = 21
      TabStop = False
      DataField = 'NM_EMPRESA'
      DataSource = datm_notificacao.ds_processo
      ParentColor = True
      ReadOnly = True
      TabOrder = 7
    end
    object dbedt_cd_cliente: TDBEdit
      Left = 16
      Top = 64
      Width = 42
      Height = 21
      TabStop = False
      DataField = 'CD_CLIENTE'
      DataSource = datm_notificacao.ds_processo
      ParentColor = True
      ReadOnly = True
      TabOrder = 8
    end
    object dbrdgrp_base_calculo: TDBRadioGroup
      Left = 463
      Top = 55
      Width = 151
      Height = 31
      Caption = 'Calcular pela'
      Columns = 2
      DataField = 'CD_BASE_CALCULO'
      DataSource = datm_notificacao.ds_notifica
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'D.I.'
        'Previs'#227'o')
      ParentFont = False
      TabOrder = 9
      Values.Strings = (
        '0'
        '1')
      Visible = False
      OnChange = dbedt_cd_favorecidoChange
      OnClick = dbrdgrp_base_calculoClick
    end
    object msk_nr_processo: TMaskEdit
      Left = 571
      Top = 27
      Width = 112
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object DBEdit11: TDBEdit
      Left = 624
      Top = 64
      Width = 108
      Height = 21
      TabStop = False
      DataField = 'NR_PROCESSO_VINC'
      DataSource = datm_notificacao.ds_processo
      ParentColor = True
      ReadOnly = True
      TabOrder = 10
      Visible = False
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 16
      Top = 27
      Width = 44
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_produto: TMaskEdit
      Left = 291
      Top = 27
      Width = 41
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 3
      OnChange = msk_cd_produtoChange
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
  end
  object pgctrl_notif_numerario: TPageControl
    Left = 0
    Top = 151
    Width = 775
    Height = 341
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 2
    OnChange = pgctrl_notif_numerarioChange
    OnChanging = pgctrl_notif_numerarioChanging
    object ts_lista: TTabSheet
      Caption = 'Solicita'#231#227'o/Notifica'#231#227'o'
      object dbg_solicitacao: TDBGrid
        Left = 0
        Top = 0
        Width = 767
        Height = 313
        Align = alClient
        DataSource = datm_notificacao.ds_notifica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NR_SOLICITACAO'
            Title.Caption = 'Solic.'
            Title.Color = clBlack
            Width = 45
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_SOLICITACAO'
            Title.Caption = 'Data'
            Title.Color = clBlack
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Look_nm_usuario'
            Title.Caption = 'Usuario'
            Title.Color = clBlack
            Width = 117
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_SOLICITADO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Caption = 'Solicitado'
            Title.Color = clBlack
            Width = 111
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_EMISSAO'
            Title.Caption = 'Emiss'#227'o'
            Title.Color = clBlack
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Caption = 'Recebido'
            Title.Color = clBlack
            Width = 109
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Look_status'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Status'
            Title.Color = clBlack
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calcDT_BAIXA'
            Title.Color = clBlack
            Width = 89
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Itens Notificados'
      ImageIndex = 1
      TabVisible = False
      object dbg_itens: TDBGrid
        Left = 3
        Top = 26
        Width = 616
        Height = 272
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_SOLICITACAO'
            Title.Caption = 'Solic.'
            Title.Color = clBlack
            Width = 35
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Caption = 'C'#243'd'
            Title.Color = clBlack
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_NM_ITEM'
            Title.Caption = 'Item'
            Title.Color = clBlack
            Width = 134
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookTpDestino'
            Title.Caption = 'Moeda'
            Title.Color = clBlack
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Valor Notificado'
            Title.Color = clBlack
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Title.Caption = 'Valor Recebido'
            Title.Color = clBlack
            Width = 104
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'LK_NM_STATUS'
            Title.Caption = 'Status'
            Title.Color = clBlack
            Width = 77
            Visible = True
          end>
      end
    end
    object ts_notificacao: TTabSheet
      Caption = 'Itens Notificados'
      ImageIndex = 2
      object DBGrid1: TDBGrid
        Left = 0
        Top = 99
        Width = 767
        Height = 214
        Align = alClient
        DataSource = datm_notificacao.ds_notifica_item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_nm_item'
            Title.Caption = 'Item'
            Title.Color = clBlack
            Width = 329
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_MOEDA_VENDA'
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Look_moeda'
            Title.Caption = 'Moeda'
            Title.Color = clBlack
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'VL_VENDA'
            Title.Caption = 'Valor Venda'
            Title.Color = clBlack
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'VL_SOLICITADO'
            Title.Caption = 'Solicitado (R$)'
            Title.Color = clBlack
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Title.Caption = 'Recebido (R$)'
            Title.Color = clBlack
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_nm_banco'
            Title.Caption = 'Banco'
            Title.Color = clBlack
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Look_nm_status'
            Title.Caption = 'Status'
            Title.Color = clBlack
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_tp_destino'
            Title.Caption = 'Tipo do Destino'
            Title.Color = clBlack
            Visible = False
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 767
        Height = 99
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label11: TLabel
          Left = 14
          Top = 10
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
        object Label12: TLabel
          Left = 313
          Top = 51
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
        object Label13: TLabel
          Left = 14
          Top = 51
          Width = 97
          Height = 13
          Caption = 'Moeda de Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 152
          Top = 51
          Width = 88
          Height = 13
          Caption = 'Valor de Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 452
          Top = 10
          Width = 91
          Height = 13
          Caption = 'Tipo de Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 313
          Top = 10
          Width = 50
          Height = 13
          Caption = 'Nr Lanc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 648
          Top = 64
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
          OnClick = SpeedButton1Click
        end
        object DBEdit1: TDBEdit
          Left = 47
          Top = 23
          Width = 252
          Height = 21
          Color = clMenu
          DataField = 'Look_nm_item'
          DataSource = datm_notificacao.ds_notifica_item
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 351
          Top = 64
          Width = 296
          Height = 21
          Color = clMenu
          DataField = 'Look_nm_banco'
          DataSource = datm_notificacao.ds_notifica_item
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit4: TDBEdit
          Left = 314
          Top = 64
          Width = 38
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_notificacao.ds_notifica_item
          TabOrder = 7
          OnExit = DBEdit4Exit
        end
        object DBEdit5: TDBEdit
          Left = 47
          Top = 64
          Width = 89
          Height = 21
          Color = clMenu
          DataField = 'Look_moeda'
          DataSource = datm_notificacao.ds_notifica_item
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit7: TDBEdit
          Left = 151
          Top = 64
          Width = 148
          Height = 21
          Color = clMenu
          DataField = 'VL_VENDA'
          DataSource = datm_notificacao.ds_notifica_item
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit9: TDBEdit
          Left = 314
          Top = 23
          Width = 122
          Height = 21
          Color = clMenu
          DataField = 'NR_LANCAMENTO'
          DataSource = datm_notificacao.ds_notifica_item
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit6: TDBEdit
          Left = 14
          Top = 64
          Width = 34
          Height = 21
          Color = clMenu
          DataField = 'CD_MOEDA_VENDA'
          DataSource = datm_notificacao.ds_notifica_item
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit2: TDBEdit
          Left = 14
          Top = 23
          Width = 34
          Height = 21
          Color = clMenu
          DataField = 'CD_ITEM'
          DataSource = datm_notificacao.ds_notifica_item
          ReadOnly = True
          TabOrder = 0
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 452
          Top = 23
          Width = 159
          Height = 21
          DataField = 'Look_tp_destino'
          DataSource = datm_notificacao.ds_notifica_item
          ListField = 'NM_TP_DESTINO'
          TabOrder = 3
          OnClick = dblckpbox_tp_destinoClick
        end
      end
    end
    object ts_numerario: TTabSheet
      Caption = 'Itens Solicitados'
      ImageIndex = 3
      object dbgrid_numerario: TDBGrid
        Left = 0
        Top = 156
        Width = 767
        Height = 157
        Align = alClient
        DataSource = datm_notificacao.ds_notifica_item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_SOLICITACAO'
            Title.Caption = 'Solic.'
            Title.Color = clBlack
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_nm_item'
            Title.Alignment = taCenter
            Title.Caption = 'Descri'#231#227'o'
            Title.Color = clBlack
            Width = 261
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_SOLICITADO'
            Title.Alignment = taCenter
            Title.Caption = 'Solicitado'
            Title.Color = clBlack
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Title.Alignment = taCenter
            Title.Caption = 'Recebido'
            Title.Color = clBlack
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Look_nm_status'
            Title.Alignment = taCenter
            Title.Caption = 'Status'
            Title.Color = clBlack
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_tp_destino'
            Title.Caption = 'Tipo do Destino'
            Title.Color = clBlack
            Width = 129
            Visible = True
          end>
      end
      object nbDados: TNotebook
        Left = 0
        Top = 0
        Width = 767
        Height = 156
        Align = alTop
        TabOrder = 1
        object TPage
          Left = 0
          Top = 0
          Caption = 'Dados'
          object pnl_item: TPanel
            Left = 0
            Top = 0
            Width = 767
            Height = 150
            Align = alTop
            BevelInner = bvLowered
            Color = clMenu
            TabOrder = 0
            object Label3: TLabel
              Left = 13
              Top = 12
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
            object Label5: TLabel
              Left = 396
              Top = 12
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = 'Vl Solicitado'
              FocusControl = dbedt_vl_solicitado
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 13
              Top = 57
              Width = 58
              Height = 13
              AutoSize = False
              Caption = 'Banco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_banco: TSpeedButton
              Left = 354
              Top = 69
              Width = 26
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
            object Label6: TLabel
              Left = 485
              Top = 12
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = 'Vl Calculado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_item: TSpeedButton
              Left = 354
              Top = 25
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
              OnClick = btn_co_itemClick
            end
            object lbl_favorecido: TLabel
              Left = 13
              Top = 102
              Width = 71
              Height = 13
              AutoSize = False
              Caption = 'Favorecido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_favorecido: TSpeedButton
              Left = 354
              Top = 114
              Width = 26
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
            end
            object Label4: TLabel
              Left = 588
              Top = 12
              Width = 91
              Height = 13
              AutoSize = False
              Caption = 'Tipo de Destino'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 256
              Top = 100
              Width = 5
              Height = 13
              Alignment = taRightJustify
              FocusControl = dbedt_vl_solicitado
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label17: TLabel
              Left = 736
              Top = 41
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object dbedt_vl_solicitado: TDBEdit
              Left = 395
              Top = 25
              Width = 79
              Height = 21
              DataField = 'VL_SOLICITADO'
              DataSource = datm_notificacao.ds_notifica_item
              TabOrder = 2
              OnChange = dbedt_cd_favorecidoChange
            end
            object dbedt_nm_banco: TDBEdit
              Left = 52
              Top = 70
              Width = 301
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'Look_nm_banco'
              DataSource = datm_notificacao.ds_notifica_item
              ReadOnly = True
              TabOrder = 8
            end
            object dbedt_vl_calculado: TDBEdit
              Left = 485
              Top = 25
              Width = 92
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_ITEM_CALCULADO'
              DataSource = datm_notificacao.ds_notifica_item
              ReadOnly = True
              TabOrder = 3
            end
            object dbedt_nm_item: TDBEdit
              Left = 67
              Top = 25
              Width = 286
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'Look_nm_item'
              DataSource = datm_notificacao.ds_notifica_item
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_nm_favorecido: TDBEdit
              Left = 67
              Top = 115
              Width = 286
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'Look_nm_favorecido'
              DataSource = datm_notificacao.ds_notifica_item
              ReadOnly = True
              TabOrder = 10
            end
            object dblckpbox_tp_destino: TDBLookupComboBox
              Left = 588
              Top = 25
              Width = 133
              Height = 21
              DataField = 'Look_tp_destino'
              DataSource = datm_notificacao.ds_notifica_item
              ListField = 'NM_TP_DESTINO'
              TabOrder = 4
              OnClick = dblckpbox_tp_destinoClick
            end
            object Panel2: TPanel
              Left = 395
              Top = 60
              Width = 325
              Height = 76
              BevelInner = bvLowered
              BevelOuter = bvSpace
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              object Label10: TLabel
                Left = 21
                Top = 27
                Width = 61
                Height = 13
                Caption = 'Comiss'#225'ria'
                FocusControl = dbedt_vl_solicitado
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label2: TLabel
                Left = 169
                Top = 27
                Width = 40
                Height = 13
                Caption = 'Cliente'
                FocusControl = dbedt_vl_solicitado
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Shape1: TShape
                Left = 2
                Top = 2
                Width = 321
                Height = 19
                Align = alTop
                Brush.Color = clSilver
                Pen.Color = clGray
                Pen.Style = psClear
              end
              object Label9: TLabel
                Left = 5
                Top = 5
                Width = 36
                Height = 13
                Caption = 'Totais'
                FocusControl = dbedt_vl_solicitado
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object edt_deb_comiss: TEdit
                Left = 21
                Top = 41
                Width = 130
                Height = 22
                TabStop = False
                AutoSize = False
                BevelInner = bvLowered
                BevelKind = bkSoft
                BevelOuter = bvNone
                BiDiMode = bdRightToLeft
                Color = clBtnFace
                Ctl3D = False
                ParentBiDiMode = False
                ParentCtl3D = False
                ReadOnly = True
                TabOrder = 0
              end
              object edt_tt_deb_conta: TEdit
                Left = 169
                Top = 41
                Width = 132
                Height = 22
                TabStop = False
                AutoSize = False
                BevelInner = bvLowered
                BevelKind = bkSoft
                BevelOuter = bvNone
                BiDiMode = bdRightToLeft
                Color = clBtnFace
                Ctl3D = False
                ParentBiDiMode = False
                ParentCtl3D = False
                ReadOnly = True
                TabOrder = 1
              end
            end
            object DBEdit10: TDBEdit
              Left = 734
              Top = 56
              Width = 92
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'calc_origem'
              DataSource = datm_notificacao.ds_notifica_item
              ReadOnly = True
              TabOrder = 5
              Visible = False
            end
            object dbedt_cd_item: TDBEdit
              Left = 13
              Top = 25
              Width = 55
              Height = 21
              DataField = 'CD_ITEM'
              DataSource = datm_notificacao.ds_notifica_item
              TabOrder = 0
              OnChange = dbedt_cd_favorecidoChange
              OnExit = dbedt_cd_itemExit
              OnKeyDown = dbedt_cd_itemKeyDown
            end
            object dbedt_cd_banco: TDBEdit
              Left = 13
              Top = 70
              Width = 40
              Height = 21
              DataField = 'CD_BANCO'
              DataSource = datm_notificacao.ds_notifica_item
              TabOrder = 7
              OnChange = dbedt_cd_favorecidoChange
              OnExit = dbedt_cd_bancoExit
              OnKeyDown = msk_cd_unid_negKeyDown
            end
            object dbedt_cd_favorecido: TDBEdit
              Left = 13
              Top = 115
              Width = 55
              Height = 21
              DataField = 'CD_FAVORECIDO'
              DataSource = datm_notificacao.ds_notifica_item
              TabOrder = 9
              OnChange = dbedt_cd_favorecidoChange
              OnExit = dbedt_cd_favorecidoExit
              OnKeyDown = msk_cd_unid_negKeyDown
            end
          end
        end
        object TPage
          Left = 0
          Top = 0
          HelpContext = 1
          Caption = 'Msg'
          object lbl8: TLabel
            Left = 72
            Top = 68
            Width = 556
            Height = 18
            Caption = 
              'Clique no bot'#227'o Incluir para inserir um novo item nesta solicita' +
              #231#227'o!'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object bvl1: TBevel
            Left = 0
            Top = 0
            Width = 734
            Height = 150
            Align = alTop
            Shape = bsFrame
          end
        end
      end
    end
    object ts_obs: TTabSheet
      Caption = 'Observa'#231#227'o'
      ImageIndex = 4
      object DBMemo1: TDBMemo
        Left = 0
        Top = 31
        Width = 775
        Height = 294
        Align = alClient
        DataField = 'TX_NUMERARIO_OBS'
        DataSource = datm_notificacao.ds_notifica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DBMemo1Change
        OnClick = DBMemo1Click
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 775
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          767
          31)
        object SpeedButton2: TSpeedButton
          Left = 625
          Top = 1
          Width = 136
          Height = 27
          Cursor = crHandPoint
          Hint = 'Importar da DI ou do Pr'#233'-Calculo.'
          Anchors = [akTop, akRight]
          Caption = 'Importar Impostos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFB78183B78183B78183B78183B78183B78183B78183FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB78183EED8C2FAEBD1B3D19DCE
            D6A9EDDAB4F1D2B0B78183B78183B78183B78183FF00FFFF00FFFF00FFFF00FF
            FF00FFB78183EED7C4F9E8D228A9482BAA4958B662E0D7ADFBDDB8EAD7A9DBD2
            9BE6CE9AB78183B78183FF00FFFF00FFFF00FFBA8E85F6D9C5FBECD933AD4F10
            A33821A843D2D3A9FFDCBECACD9C33AC4C17A73FA9C67EB78183FF00FF43B4D8
            43B4D8BA8E85F5D9C6FCEFDEC9DBB461BA6D79BF79F0DEBFFBDEBFDAD3A744B0
            5506A2369EC37CB7818343B4D87DD9F291E1FDCB9A82F3DBC9FBF1E3FFEDE2DD
            DFC06FBE75EFE0C3FEE1C7F6DBBC61B766A4C586EED5A7B7818343B4D894E4F9
            B8EEFFCB9A82F4DDCEFCF4E9F9ECDCFFECDDAACF9E9FCC93D8D9B6A5C99281BF
            79F7D9B7F7D9B0B7818343B4D89AE6F9D4F9FFDCA887F3DFD1FCF7EFFAEFE2FD
            ECDFEEE5CF50B56225A94555B563E7DAB6F9DCBCF5DBB4B7818343B4D899E6F9
            DAFBFFE3B18EF4E1D3FEFAF4FAF1E8FEF0E4ECE7D140B158039F2F4AB25CEDDE
            BFF8DEC0F6DDB9B7818343B4D899E6F9D9FBFFEDBD92F7E7DDFFFFFFFEFAF4FE
            F7EFF5F1E1A3D4A286CA8CA8D29FF3E5CAF8E4C7F9E3C2B7818343B4D899E6F9
            D9FBFFEDBD92DCA887DCA887DCA887DCA887DCA887DCA887DCA887DCA887DCA8
            87DCA887DCA887B7818343B4D89BE7FAE0FAFFD3E3E5ABD3D3A2D3D48DCBD343
            B4D8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF43B4D892E3F7
            C4EBF9ACE8FD7BE3FE74E6FF6BE1FC43B4D8FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF43B4D843B4D840B4D840B4D840B4D840B4D843B4D843
            B4D8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF43B4D843B4D8
            7FD8EF7CDDF374DBF467D3EE38B1D743B4D8FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF43B4D843B4D843B4D843B4D83FB3D843B4D8FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton2Click
        end
      end
    end
  end
  object pnlDuplica: TPanel
    Left = 199
    Top = 291
    Width = 401
    Height = 161
    BevelOuter = bvNone
    BorderWidth = 3
    Caption = 'pnlDuplica'
    Color = clBlack
    TabOrder = 3
    Visible = False
    object pnlDuplica2: TPanel
      Left = 3
      Top = 3
      Width = 395
      Height = 155
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Shape2: TShape
        Left = 5
        Top = 41
        Width = 383
        Height = 73
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape4: TShape
        Left = 363
        Top = 5
        Width = 25
        Height = 22
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape3: TShape
        Left = 5
        Top = 5
        Width = 357
        Height = 22
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object dbtxtProcesso: TDBText
        Left = 74
        Top = 10
        Width = 101
        Height = 15
        DataField = 'NR_PROCESSO'
        DataSource = datm_notificacao.ds_notifica
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object dbtxtSolic: TDBText
        Left = 226
        Top = 10
        Width = 81
        Height = 15
        DataField = 'NR_SOLICITACAO'
        DataSource = datm_notificacao.ds_notifica
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 10
        Top = 10
        Width = 62
        Height = 17
        AutoSize = False
        Caption = 'Processo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object lbl3: TLabel
        Left = 182
        Top = 10
        Width = 42
        Height = 17
        AutoSize = False
        Caption = 'Solic.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object lbl4: TLabel
        Left = 95
        Top = 61
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
      object btnCoProcesso: TSpeedButton
        Left = 208
        Top = 75
        Width = 24
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
        OnClick = btnCoProcessoClick
      end
      object lbl5: TLabel
        Left = 245
        Top = 61
        Width = 64
        Height = 13
        Caption = 'Solicita'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFechar: TLabel
        Left = 370
        Top = 8
        Width = 10
        Height = 16
        Caption = 'X'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = lblFecharClick
      end
      object btnDuplicar: TSpeedButton
        Left = 296
        Top = 120
        Width = 92
        Height = 27
        Hint = 'Duplica Solicita'#231#227'o de Numer'#225'rio'
        Caption = 'Duplicar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnDuplicarClick
      end
      object lbl6: TLabel
        Left = 22
        Top = 61
        Width = 31
        Height = 13
        Caption = 'Unid.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl7: TLabel
        Left = 58
        Top = 61
        Width = 31
        Height = 13
        Caption = 'Prod.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 8
        Top = 33
        Width = 341
        Height = 17
        AutoSize = False
        Caption = ' Escolha o Processo/Solicita'#231#227'o que deseja trazer os itens: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object medtProcesso: TMaskEdit
        Left = 95
        Top = 75
        Width = 112
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
        OnExit = medtProcessoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object medtSolic: TMaskEdit
        Left = 246
        Top = 75
        Width = 69
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 3
        TabOrder = 3
        OnExit = medtSolicExit
      end
      object dbedtUnid: TDBEdit
        Left = 23
        Top = 75
        Width = 35
        Height = 21
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        DataField = 'CD_UNID_NEG'
        DataSource = datm_notificacao.ds_processo
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedtProd: TDBEdit
        Left = 59
        Top = 75
        Width = 35
        Height = 21
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        DataField = 'CD_PRODUTO'
        DataSource = datm_notificacao.ds_processo
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 688
    Top = 190
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      OnClick = btn_incluirClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      OnClick = btn_excluirClick
    end
    object mi_cancela_numerario: TMenuItem
      Caption = 'C&anc. Numer'#225'rio'
      OnClick = btn_cancela_numerarioClick
    end
    object mi_impri_: TMenuItem
      Caption = 'Im&primir'
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
