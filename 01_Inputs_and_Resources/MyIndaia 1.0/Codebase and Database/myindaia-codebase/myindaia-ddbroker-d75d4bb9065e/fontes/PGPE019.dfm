object frm_exp_itens: Tfrm_exp_itens
  Left = 335
  Top = 107
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Processo de Exporta'#231#227'o '
  ClientHeight = 566
  ClientWidth = 797
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_manut_cadastro
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 48
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      797
      48)
    object shpPesquisa: TShape
      Left = 428
      Top = 4
      Width = 331
      Height = 39
      Anchors = [akTop, akRight]
      Brush.Color = clBtnFace
      Pen.Color = clGray
    end
    object btn_sair: TSpeedButton
      Left = 762
      Top = 6
      Width = 31
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_sairClick
    end
    object btn_salvar: TSpeedButton
      Left = 41
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 78
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancelarClick
    end
    object btn_novo_item: TSpeedButton
      Left = 3
      Top = 5
      Width = 36
      Height = 37
      Hint = 'Novo Item'
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
      OnClick = btn_novo_itemClick
    end
    object btn_capa_exp: TSpeedButton
      Left = 201
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Capa do Processo'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_capa_expClick
    end
    object btn_duplicar: TSpeedButton
      Left = 158
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Duplica'#231#227'o de Item'
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
      OnClick = btn_duplicarClick
    end
    object btn_excluir: TSpeedButton
      Left = 115
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Excluir item'
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
    object btn_calculo: TSpeedButton
      Left = 238
      Top = 5
      Width = 37
      Height = 37
      Hint = 'C'#225'lculo do Processo'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      OnClick = btn_calculoClick
    end
    object btn_manut_proc: TSpeedButton
      Left = 281
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Manuten'#231#227'o do Processo - <F2>'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
        1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
        1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
        193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
        11155557F755F777777555000755033305555577755F75F77F55555555503335
        0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
        05555757F75F75557F5505000333555505557F777FF755557F55000000355557
        07557777777F55557F5555000005555707555577777FF5557F55553000075557
        0755557F7777FFF5755555335000005555555577577777555555}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_manut_procClick
    end
    object btn_repassa_ncm_naladi_doc: TSpeedButton
      Left = 361
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Repassa NCM/Naladi Doctos.'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
        00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
        0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
        03FF3777773337777333333333333333333F3333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_repassa_ncm_naladi_docClick
    end
    object Label6: TLabel
      Left = 656
      Top = 17
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
      Transparent = True
    end
    object Label17: TLabel
      Left = 714
      Top = 18
      Width = 7
      Height = 13
      Anchors = [akTop, akRight]
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_re: TSpeedButton
      Left = 318
      Top = 5
      Width = 37
      Height = 37
      Hint = 'RE'
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
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_reClick
    end
    object shpNavigator: TShape
      Left = 567
      Top = 12
      Width = 85
      Height = 24
      Anchors = [akTop, akRight]
      Brush.Color = clBlack
      Pen.Color = clWhite
    end
    object dbedt_nm_item_inicial_li: TDBEdit
      Left = 683
      Top = 14
      Width = 31
      Height = 19
      TabStop = False
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkFlat
      Color = clMenu
      Ctl3D = False
      DataField = 'NR_ITEM'
      DataSource = datm_exp_itens.ds_exp_itens
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbedt_item_final_li: TDBEdit
      Left = 721
      Top = 14
      Width = 31
      Height = 19
      TabStop = False
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkFlat
      Color = clMenu
      Ctl3D = False
      DataField = 'QT_TOTAL_ITENS'
      DataSource = datm_exp_itens.ds_exp
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBNavigator: TDBNavigator
      Left = 570
      Top = 15
      Width = 80
      Height = 19
      DataSource = datm_exp_itens.ds_exp_itens
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      Hints.Strings = (
        'Primeiro item'
        'Item Anterior'
        'Pr'#243'ximo item'
        #218'ltimo item')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object dbedt_nr_processo: TDBEdit
      Left = 468
      Top = 15
      Width = 91
      Height = 19
      TabStop = False
      BevelOuter = bvNone
      BevelKind = bkSoft
      Color = clMenu
      Ctl3D = False
      DataField = 'CalcNrProcesso'
      DataSource = datm_exp_itens.ds_exp
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object pgctrl_Item: TPageControl
    Left = 0
    Top = 48
    Width = 797
    Height = 518
    ActivePage = ts_item1
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_ItemChange
    OnChanging = pgctrl_ItemChanging
    object ts_item1: TTabSheet
      Caption = '&Mercadoria'
      DesignSize = (
        789
        490)
      object bvlMercadoria: TBevel
        Left = 0
        Top = 0
        Width = 789
        Height = 490
        Align = alClient
        Shape = bsFrame
        Style = bsRaised
      end
      object Label35: TLabel
        Left = 13
        Top = 55
        Width = 64
        Height = 13
        Caption = 'Mercadoria'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_mercadoria: TSpeedButton
        Left = 750
        Top = 67
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
        OnClick = btn_co_mercadoriaClick
      end
      object Label37: TLabel
        Left = 183
        Top = 194
        Width = 72
        Height = 13
        Caption = 'Unid.Medida'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label38: TLabel
        Left = 13
        Top = 194
        Width = 66
        Height = 13
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label39: TLabel
        Left = 475
        Top = 194
        Width = 78
        Height = 13
        Caption = 'Valor Unit'#225'rio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label41: TLabel
        Left = 13
        Top = 95
        Width = 93
        Height = 13
        Caption = 'NCM (Siscomex)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label42: TLabel
        Left = 13
        Top = 136
        Width = 134
        Height = 13
        Caption = 'NALADI/SH (Siscomex)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_unid_medida: TSpeedButton
        Left = 421
        Top = 206
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
        OnClick = btn_co_unid_medidaClick
      end
      object btn_co_naladi: TSpeedButton
        Left = 130
        Top = 148
        Width = 25
        Height = 23
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
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
        OnClick = btn_co_naladiClick
      end
      object btn_co_ncm: TSpeedButton
        Left = 130
        Top = 107
        Width = 25
        Height = 23
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
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
        OnClick = btn_co_ncmClick
      end
      object Label43: TLabel
        Left = 619
        Top = 194
        Width = 87
        Height = 13
        Caption = 'Peso L'#237'q. Unit.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label46: TLabel
        Left = 13
        Top = 5
        Width = 73
        Height = 13
        Caption = 'Nr. Remessa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label47: TLabel
        Left = 13
        Top = 407
        Width = 202
        Height = 13
        Caption = 'Descri'#231#227'o Comercial da Mercadoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_norma: TLabel
        Left = 391
        Top = 278
        Width = 37
        Height = 13
        Caption = 'Norma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_normas: TSpeedButton
        Left = 718
        Top = 290
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
        OnClick = btn_co_normasClick
      end
      object Label8: TLabel
        Left = 222
        Top = 5
        Width = 128
        Height = 13
        Caption = 'Pedido do Imp./Fatura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_fabr_prod: TLabel
        Left = 233
        Top = 332
        Width = 123
        Height = 13
        Caption = 'Fabricante / Produtor'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_fabr_item: TSpeedButton
        Left = 476
        Top = 345
        Width = 25
        Height = 23
        Enabled = False
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
        OnClick = btn_co_fabr_itemClick
      end
      object lbl_pais: TLabel
        Left = 234
        Top = 370
        Width = 88
        Height = 13
        Caption = 'Pa'#237's de Origem'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_pais_origem: TSpeedButton
        Left = 476
        Top = 382
        Width = 25
        Height = 23
        Enabled = False
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
        OnClick = btn_co_pais_origemClick
      end
      object Label11: TLabel
        Left = 13
        Top = 278
        Width = 41
        Height = 13
        Caption = 'Acordo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_ncm_doc: TLabel
        Left = 162
        Top = 95
        Width = 110
        Height = 13
        Caption = 'NCM (Documentos)'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ncm_doc: TSpeedButton
        Left = 750
        Top = 107
        Width = 25
        Height = 23
        Enabled = False
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
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
        OnClick = btn_co_ncm_docClick
      end
      object lbl_naladi_doc: TLabel
        Left = 162
        Top = 136
        Width = 147
        Height = 13
        Caption = 'NALADI/SH(Documentos)'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_naladi_doc: TSpeedButton
        Left = 750
        Top = 147
        Width = 25
        Height = 23
        Enabled = False
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
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
        OnClick = btn_co_naladi_docClick
      end
      object btn_co_acordo: TSpeedButton
        Left = 352
        Top = 290
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
        OnClick = btn_co_acordoClick
      end
      object lbl_anexo: TLabel
        Left = 469
        Top = 5
        Width = 65
        Height = 13
        Caption = 'Anexo Scx.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_ato_concessorio: TLabel
        Left = 544
        Top = 5
        Width = 93
        Height = 13
        Caption = 'Ato Concess'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 127
        Top = 5
        Width = 83
        Height = 13
        Caption = 'Data Remessa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 364
        Top = 5
        Width = 50
        Height = 13
        Caption = 'N'#186' Order'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bvlLinha1: TBevel
        Left = 2
        Top = 40
        Width = 786
        Height = 6
        Anchors = [akLeft, akTop, akRight]
        Shape = bsBottomLine
        Style = bsRaised
      end
      object bvlLinha2: TBevel
        Left = 2
        Top = 176
        Width = 786
        Height = 6
        Anchors = [akLeft, akTop, akRight]
        Shape = bsBottomLine
        Style = bsRaised
      end
      object shpTotais: TShape
        Left = 527
        Top = 337
        Width = 248
        Height = 144
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label59: TLabel
        Left = 538
        Top = 356
        Width = 76
        Height = 13
        Caption = 'Total do Item'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 657
        Top = 356
        Width = 74
        Height = 13
        Caption = 'Frete Interno'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label60: TLabel
        Left = 538
        Top = 395
        Width = 67
        Height = 13
        Caption = 'P.Liq. Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label61: TLabel
        Left = 657
        Top = 395
        Width = 76
        Height = 13
        Caption = 'P.Bruto Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label44: TLabel
        Left = 538
        Top = 434
        Width = 59
        Height = 13
        Caption = 'Valor MLE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label40: TLabel
        Left = 657
        Top = 434
        Width = 60
        Height = 13
        Caption = 'Valor MCV'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label15: TLabel
        Left = 660
        Top = 5
        Width = 86
        Height = 13
        Caption = 'Nr. Nota Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnCoNF: TSpeedButton
        Left = 750
        Top = 17
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
        OnClick = btnCoNFClick
      end
      object Label22: TLabel
        Left = 183
        Top = 236
        Width = 109
        Height = 13
        Caption = 'Unid.Medida Estat.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_cd_unid_medida_estat: TSpeedButton
        Left = 421
        Top = 248
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
      end
      object Label23: TLabel
        Left = 13
        Top = 237
        Width = 148
        Height = 13
        Caption = 'Qtde. Unid. Medida Estat.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label63: TLabel
        Left = 475
        Top = 236
        Width = 33
        Height = 13
        Caption = 'CFOP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_cd_cfop: TSpeedButton
        Left = 718
        Top = 249
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
        OnClick = btn_co_cd_cfopClick
      end
      object Bevel1: TBevel
        Left = 3
        Top = 320
        Width = 786
        Height = 6
        Anchors = [akLeft, akTop, akRight]
        Shape = bsBottomLine
        Style = bsRaised
      end
      object edt_nm_ncm_doc: TEdit
        Left = 271
        Top = 108
        Width = 477
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object edt_nm_naladi_doc: TEdit
        Left = 271
        Top = 149
        Width = 477
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 17
      end
      object dbrdgrp_fabr_expo: TDBRadioGroup
        Left = 13
        Top = 330
        Width = 213
        Height = 72
        Color = clBtnFace
        Ctl3D = True
        DataField = 'CD_FABR_EXPO'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          '&Fabr./Prod. '#233' o exportador'
          'Fabr./Prod. n'#227'o '#233' o e&xportador'
          'Fabr./Prod. '#233' &desconhecido')
        ParentColor = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 30
        TabStop = True
        Values.Strings = (
          '1'
          '2'
          '3')
        OnChange = dbrdgrp_fabr_expoChange
      end
      object dbedt_qt_mercadoria: TDBEdit
        Left = 13
        Top = 207
        Width = 145
        Height = 21
        DataField = 'QT_MERCADORIA'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 17
        ParentFont = False
        TabOrder = 18
        OnEnter = dbedt_qt_mercadoriaEnter
        OnExit = dbedt_qt_mercadoriaExit
      end
      object dbedt_vl_unitario: TDBEdit
        Left = 475
        Top = 207
        Width = 100
        Height = 21
        DataField = 'VL_UNITARIO'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 24
        OnEnter = dbedt_vl_unitarioEnter
        OnExit = dbedt_vl_unitarioExit
      end
      object dbedt_cd_ncm: TDBEdit
        Left = 13
        Top = 108
        Width = 83
        Height = 21
        DataField = 'CD_NCM'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnExit = dbedt_cd_ncmExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_cd_naladi: TDBEdit
        Left = 13
        Top = 149
        Width = 115
        Height = 21
        DataField = 'CD_NALADI_SH'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        OnExit = dbedt_cd_ncmExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_peso_liquido: TDBEdit
        Left = 619
        Top = 207
        Width = 125
        Height = 21
        DataField = 'VL_PESO_LIQ_UNIT'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 25
        OnExit = dbedt_peso_liquidoExit
      end
      object dbedt_vl_mcv: TDBEdit
        Left = 657
        Top = 447
        Width = 110
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'VL_MCV'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 41
        Visible = False
      end
      object edt_nm_mercadoria: TEdit
        Left = 162
        Top = 68
        Width = 586
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object dbedt_nr_ped_imp: TDBEdit
        Left = 13
        Top = 18
        Width = 104
        Height = 21
        DataField = 'NR_PEDIDO_IMP'
        DataSource = datm_exp_itens.ds_exp_itens
        MaxLength = 18
        TabOrder = 0
        OnExit = dbedt_nr_ped_impExit
      end
      object dbm_descr_mercadoria: TDBMemo
        Left = 13
        Top = 420
        Width = 491
        Height = 55
        DataField = 'TX_MERCADORIA'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 33
      end
      object dbedt_nr_pedido: TDBEdit
        Left = 222
        Top = 18
        Width = 128
        Height = 21
        DataField = 'NR_PEDIDO'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 2
      end
      object dbedt_nr_anexo: TDBEdit
        Left = 469
        Top = 18
        Width = 63
        Height = 21
        DataField = 'NR_ANEXO'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 4
      end
      object dbedt_nr_ato_concessorio: TDBEdit
        Left = 544
        Top = 18
        Width = 105
        Height = 21
        DataField = 'NR_ATO_CONCESSORIO'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 5
      end
      object dbedt_dt_remessa: TDBDateEdit
        Left = 127
        Top = 18
        Width = 84
        Height = 21
        DataField = 'DT_REMESSA'
        DataSource = datm_exp_itens.ds_exp_itens
        DialogTitle = 'Selecione a Data'
        NumGlyphs = 2
        TabOrder = 1
      end
      object dbedt_cd_mercadoria: TDBEdit
        Left = 13
        Top = 68
        Width = 150
        Height = 21
        DataField = 'CD_MERCADORIA'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnChange = btn_co_mercadoriaClick
        OnExit = dbedt_cd_mercadoriaExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object DBEdit3: TDBEdit
        Left = 364
        Top = 18
        Width = 94
        Height = 21
        DataField = 'NR_ORDER'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 3
      end
      object dbedt_vl_exw: TDBEdit
        Left = 538
        Top = 369
        Width = 110
        Height = 21
        DataField = 'VL_TOT_ITEM'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 36
      end
      object dbedt_vl_fretei: TDBEdit
        Left = 657
        Top = 369
        Width = 110
        Height = 21
        Color = clMenu
        DataField = 'VL_FRETE_INT'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 37
      end
      object dbedt_peso_liq_total: TDBEdit
        Left = 538
        Top = 408
        Width = 110
        Height = 21
        DataField = 'VL_TOT_PESO_LIQ'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 38
      end
      object dbedt_peso_bruto_total: TDBEdit
        Left = 657
        Top = 408
        Width = 110
        Height = 21
        DataField = 'VL_TOT_PESO_BRUTO'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 39
      end
      object dbedt_vl_mle: TDBEdit
        Left = 538
        Top = 447
        Width = 110
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'VL_MLE'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 40
      end
      object edt_nm_unid_medida: TEdit
        Left = 219
        Top = 207
        Width = 200
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 20
      end
      object edt_nm_acordo: TEdit
        Left = 102
        Top = 291
        Width = 248
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 27
      end
      object edt_nm_norma: TEdit
        Left = 480
        Top = 291
        Width = 236
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 29
      end
      object edt_nm_fabr_item: TEdit
        Left = 283
        Top = 346
        Width = 192
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 32
      end
      object edt_nm_pais_origem: TEdit
        Left = 283
        Top = 383
        Width = 192
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 35
      end
      object dbedtNrSeqNCMDoc: TDBEdit
        Left = 252
        Top = 108
        Width = 20
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NR_SEQ_NCM_DOC'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        Visible = False
        OnChange = dbedtNrSeqNCMDocChange
      end
      object dbedtNrSeqNALADIDoc: TDBEdit
        Left = 252
        Top = 149
        Width = 20
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NR_SEQ_NALADI_DOC'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
        Visible = False
        OnChange = dbedtNrSeqNALADIDocChange
      end
      object dbedt_cd_unid_medida: TDBEdit
        Left = 183
        Top = 207
        Width = 37
        Height = 21
        DataField = 'CD_UNID_MEDIDA'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 19
        OnChange = btn_co_unid_medidaClick
        OnExit = dbedt_cd_unid_medidaExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_cd_acordo: TDBEdit
        Left = 13
        Top = 291
        Width = 90
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CD_ACORDO'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 26
        OnChange = btn_co_acordoClick
        OnExit = dbedt_cd_acordoExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_cd_norma: TDBEdit
        Left = 391
        Top = 291
        Width = 90
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CD_NORMAS'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 28
        OnChange = btn_co_normasClick
        OnExit = dbedt_cd_ncmExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_cd_fabr_item: TDBEdit
        Left = 234
        Top = 346
        Width = 50
        Height = 21
        TabStop = False
        DataField = 'CD_FABRICANTE'
        DataSource = datm_exp_itens.ds_exp_itens
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 31
        OnChange = btn_co_fabr_itemClick
        OnExit = dbedt_cd_ncmExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_cd_pais_origem: TDBEdit
        Left = 234
        Top = 383
        Width = 50
        Height = 21
        TabStop = False
        DataField = 'CD_PAIS_ORIGEM'
        DataSource = datm_exp_itens.ds_exp_itens
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 34
        OnChange = btn_co_pais_origemClick
        OnExit = dbedt_cd_ncmExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_cd_ncm_doc: TDBEdit
        Left = 162
        Top = 108
        Width = 91
        Height = 21
        DataField = 'CD_NCM_DOC'
        DataSource = datm_exp_itens.ds_exp_itens
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        OnChange = dbedtNrSeqNCMDocChange
        OnExit = dbedt_cd_ncm_docExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_cd_naladi_doc: TDBEdit
        Left = 162
        Top = 149
        Width = 91
        Height = 21
        DataField = 'CD_NALADI_DOC'
        DataSource = datm_exp_itens.ds_exp_itens
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        OnChange = dbedtNrSeqNALADIDocChange
        OnExit = dbedt_cd_naladi_docExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_nr_nf: TDBEdit
        Left = 660
        Top = 18
        Width = 87
        Height = 21
        DataField = 'NR_NF'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 6
        OnChange = dbedt_nr_nfChange
      end
      object dbedt_cd_sulf_ncm: TDBEdit
        Left = 97
        Top = 108
        Width = 31
        Height = 21
        DataField = 'CD_SULF_NCM'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object dbedt_cd_unid_medida_estat: TDBEdit
        Left = 183
        Top = 249
        Width = 37
        Height = 21
        DataField = 'CD_UNID_MEDIDA_ESTAT'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 21
        OnChange = dbedt_cd_unid_medida_estatChange
        OnExit = dbedt_cd_unid_medida_estatExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object edt_nm_unidade_medida_estat: TEdit
        Left = 219
        Top = 249
        Width = 200
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 22
      end
      object dbedt_qt_unid_medida_estat: TDBEdit
        Left = 13
        Top = 250
        Width = 145
        Height = 21
        DataField = 'QT_UNID_MEDIDA_ESTAT'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 23
        OnEnter = dbedt_vl_unitarioEnter
        OnExit = dbedt_vl_unitarioExit
      end
      object dbedtCFOP: TDBEdit
        Left = 475
        Top = 249
        Width = 78
        Height = 21
        DataField = 'CD_CFOP'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 42
        OnChange = dbedtCFOPChange
      end
      object edtCFOP: TEdit
        Left = 527
        Top = 249
        Width = 189
        Height = 21
        Color = clMenu
        ReadOnly = True
        TabOrder = 43
      end
    end
    object ts_embalagem: TTabSheet
      Caption = 'Embalagem'
      DesignSize = (
        789
        490)
      object bvlEmbalagem: TBevel
        Left = 0
        Top = 0
        Width = 789
        Height = 490
        Align = alClient
        Shape = bsFrame
        Style = bsRaised
      end
      object Label13: TLabel
        Left = 13
        Top = 10
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
      object Label16: TLabel
        Left = 13
        Top = 66
        Width = 65
        Height = 13
        Caption = 'Embalagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_embalagem: TSpeedButton
        Left = 405
        Top = 78
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
        OnClick = btn_co_embalagemClick
      end
      object Label18: TLabel
        Left = 438
        Top = 66
        Width = 110
        Height = 13
        Caption = 'Classif. Embalagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 13
        Top = 110
        Width = 118
        Height = 13
        Caption = 'Qtde por Embalagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 146
        Top = 110
        Width = 118
        Height = 13
        Caption = 'Qtde de Embalagens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 278
        Top = 110
        Width = 120
        Height = 13
        Caption = 'Valor por Embalagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 13
        Top = 294
        Width = 65
        Height = 13
        Caption = 'Embalagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_emb_sup: TSpeedButton
        Left = 405
        Top = 306
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
        OnClick = btn_co_emb_supClick
      end
      object Label5: TLabel
        Left = 438
        Top = 294
        Width = 110
        Height = 13
        Caption = 'Classif. Embalagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 13
        Top = 337
        Width = 118
        Height = 13
        Caption = 'Qtde por Embalagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 145
        Top = 337
        Width = 118
        Height = 13
        Caption = 'Qtde de Embalagens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 277
        Top = 337
        Width = 120
        Height = 13
        Caption = 'Valor por Embalagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 13
        Top = 264
        Width = 120
        Height = 13
        Caption = 'Embalagem Superior:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label55: TLabel
        Left = 13
        Top = 172
        Width = 73
        Height = 13
        Caption = 'Comprimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label56: TLabel
        Left = 13
        Top = 200
        Width = 44
        Height = 13
        Caption = 'Largura'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label58: TLabel
        Left = 241
        Top = 200
        Width = 29
        Height = 13
        Caption = 'Peso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label57: TLabel
        Left = 241
        Top = 172
        Width = 34
        Height = 13
        Caption = 'Altura'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label62: TLabel
        Left = 438
        Top = 183
        Width = 53
        Height = 13
        Caption = 'Cubagem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 13
        Top = 401
        Width = 211
        Height = 13
        Caption = 'Nome da Embalagem no Packing List'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bvlLinha4: TBevel
        Left = 0
        Top = 151
        Width = 786
        Height = 5
        Anchors = [akLeft, akTop, akRight]
        Shape = bsBottomLine
        Style = bsRaised
      end
      object bvlLinha5: TBevel
        Left = 0
        Top = 250
        Width = 786
        Height = 5
        Anchors = [akLeft, akTop, akRight]
        Shape = bsBottomLine
        Style = bsRaised
      end
      object bvlLinha6: TBevel
        Left = 0
        Top = 378
        Width = 786
        Height = 5
        Anchors = [akLeft, akTop, akRight]
        Shape = bsBottomLine
        Style = bsRaised
      end
      object dbedt_nr_processo_emb: TDBEdit
        Left = 13
        Top = 24
        Width = 126
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CalcNrProcesso'
        DataSource = datm_exp_itens.ds_exp
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedt_classif_embal: TDBEdit
        Left = 438
        Top = 79
        Width = 110
        Height = 21
        DataField = 'CD_CLASSIF_EMBALAGEM'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 3
      end
      object dbedt_qt_por_embalagem: TDBEdit
        Left = 13
        Top = 123
        Width = 125
        Height = 21
        DataField = 'QT_POR_EMB'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 4
        OnExit = dbedt_qt_por_embalagemExit
      end
      object dbedt_qt_de_emb: TDBEdit
        Left = 145
        Top = 123
        Width = 125
        Height = 21
        DataField = 'QT_EMBALAGEM'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 5
      end
      object dbedt_vl_por_emb: TDBEdit
        Left = 278
        Top = 123
        Width = 125
        Height = 21
        TabStop = False
        DataField = 'VL_POR_EMB'
        DataSource = datm_exp_itens.ds_exp_itens
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_class_emb_sup: TDBEdit
        Left = 438
        Top = 308
        Width = 110
        Height = 21
        DataField = 'CD_CLASSIF_EMBALAGEM_SUP'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 14
      end
      object dbedt_qt_por_emb_sup: TDBEdit
        Left = 13
        Top = 350
        Width = 125
        Height = 21
        DataField = 'QT_POR_EMB_SUP'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 15
        OnExit = dbedt_qt_por_emb_supExit
      end
      object dbedt_qt_de_emb_sup: TDBEdit
        Left = 144
        Top = 350
        Width = 125
        Height = 21
        DataField = 'QT_EMBALAGEM_SUP'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 16
      end
      object dbedt_vl_por_emb_sub: TDBEdit
        Left = 277
        Top = 350
        Width = 125
        Height = 21
        DataField = 'VL_POR_EMB_SUP'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 17
      end
      object dbedt_peso_emb: TDBEdit
        Left = 278
        Top = 196
        Width = 125
        Height = 21
        DataField = 'VL_PESO_EMB'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object dbedt_alt_emb: TDBEdit
        Left = 278
        Top = 168
        Width = 125
        Height = 21
        DataField = 'VL_ALTURA_EMB'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnExit = dbedt_alt_embExit
      end
      object dbedt_larg_emb: TDBEdit
        Left = 88
        Top = 196
        Width = 125
        Height = 21
        DataField = 'VL_LARGURA_EMB'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnExit = dbedt_alt_embExit
      end
      object dbedt_compr_emb: TDBEdit
        Left = 88
        Top = 168
        Width = 125
        Height = 21
        DataField = 'VL_COMPRIMENTO_EMB'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnExit = dbedt_alt_embExit
      end
      object dbedt_vl_cubagem: TDBEdit
        Left = 438
        Top = 196
        Width = 125
        Height = 21
        DataField = 'VL_CUBAGEM'
        DataSource = datm_exp_itens.ds_exp_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object dbedtNmEmbPacking: TDBEdit
        Left = 13
        Top = 414
        Width = 220
        Height = 21
        DataField = 'NM_EMB_PACKING'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 18
      end
      object edt_nm_embalagem: TEdit
        Left = 62
        Top = 79
        Width = 341
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edt_nm_emb_sup: TEdit
        Left = 62
        Top = 307
        Width = 341
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object dbedt_cd_embalagem: TDBEdit
        Left = 13
        Top = 79
        Width = 50
        Height = 21
        DataField = 'CD_EMBALAGEM'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 1
        OnChange = btn_co_embalagemClick
        OnExit = dbedt_cd_embalagemExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_cd_emb_sup: TDBEdit
        Left = 13
        Top = 307
        Width = 50
        Height = 21
        DataField = 'CD_EMBALAGEM_SUP'
        DataSource = datm_exp_itens.ds_exp_itens
        TabOrder = 12
        OnChange = btn_co_emb_supClick
        OnExit = dbedt_cd_ncmExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
    end
    object tbsLotes: TTabSheet
      Caption = 'Lote'
      ImageIndex = 2
      object Label24: TLabel
        Left = 6
        Top = 5
        Width = 47
        Height = 13
        Caption = 'Nr. Lote'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 196
        Top = 6
        Width = 85
        Height = 13
        Caption = 'Dt. Fabrica'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label26: TLabel
        Left = 294
        Top = 6
        Width = 88
        Height = 13
        Caption = 'Dt. Vencimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label27: TLabel
        Left = 6
        Top = 46
        Width = 85
        Height = 13
        Caption = 'Qt. Mercadoria'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 101
        Top = 46
        Width = 76
        Height = 13
        Caption = 'Peso L'#237'quido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label29: TLabel
        Left = 196
        Top = 46
        Width = 63
        Height = 13
        Caption = 'Peso Bruto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label30: TLabel
        Left = 294
        Top = 46
        Width = 68
        Height = 13
        Caption = 'Chave Nota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgLotes: TDBGrid
        Left = 0
        Top = 96
        Width = 789
        Height = 394
        Align = alBottom
        DataSource = datm_exp_itens.dsLotes
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_LOTE'
            Title.Caption = 'Nr. Lote'
            Title.Color = clBackground
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_FABRICACAO'
            Title.Caption = 'Dt. Fabrica'#231#227'o'
            Title.Color = clBackground
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_VENCIMENTO'
            Title.Caption = 'Dt. Vencimento'
            Title.Color = clBackground
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_MERCADORIA'
            Title.Caption = 'Qt. Mercadoria'
            Title.Color = clBackground
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_PESO_LIQ'
            Title.Caption = 'Peso Liq'
            Title.Color = clBackground
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_PESO_BRUTO'
            Title.Caption = 'Peso Bruto'
            Title.Color = clBackground
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAVE_NOTA'
            Title.Caption = 'Chave Nota'
            Title.Color = clBackground
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 248
            Visible = True
          end>
      end
      object dbedtCD_LOTE: TDBEdit
        Left = 6
        Top = 21
        Width = 168
        Height = 21
        DataField = 'CD_LOTE'
        DataSource = datm_exp_itens.dsLotes
        TabOrder = 1
      end
      object dbedtDT_FABRICACAO: TDBEdit
        Left = 196
        Top = 21
        Width = 80
        Height = 21
        DataField = 'DT_FABRICACAO'
        DataSource = datm_exp_itens.dsLotes
        TabOrder = 2
      end
      object dbedtDT_VENCIMENTO: TDBEdit
        Left = 294
        Top = 21
        Width = 80
        Height = 21
        DataField = 'DT_VENCIMENTO'
        DataSource = datm_exp_itens.dsLotes
        TabOrder = 3
      end
      object dbedtQT_MERCADORIA: TDBEdit
        Left = 6
        Top = 61
        Width = 72
        Height = 21
        DataField = 'QT_MERCADORIA'
        DataSource = datm_exp_itens.dsLotes
        TabOrder = 4
      end
      object dbedtQT_PESO_LIQ: TDBEdit
        Left = 101
        Top = 61
        Width = 73
        Height = 21
        DataField = 'QT_PESO_LIQ'
        DataSource = datm_exp_itens.dsLotes
        TabOrder = 5
      end
      object dbedtQT_PESO_BRUTO: TDBEdit
        Left = 196
        Top = 61
        Width = 72
        Height = 21
        DataField = 'QT_PESO_BRUTO'
        DataSource = datm_exp_itens.dsLotes
        TabOrder = 6
      end
      object dbedtCHAVE_NOTA: TDBEdit
        Left = 294
        Top = 61
        Width = 298
        Height = 21
        DataField = 'CHAVE_NOTA'
        DataSource = datm_exp_itens.dsLotes
        TabOrder = 7
      end
    end
    object tbContainers: TTabSheet
      Caption = 'Container'
      ImageIndex = 3
      object Label103: TLabel
        Left = 7
        Top = 65
        Width = 66
        Height = 13
        Caption = 'Quantidade'
        FocusControl = dbedtQtMercadoria
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTemp: TLabel
        Left = 137
        Top = 65
        Width = 63
        Height = 13
        Hint = 'Temperatura'
        Caption = 'Peso Bruto'
        FocusControl = dbedtPesoBruto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label31: TLabel
        Left = 7
        Top = 7
        Width = 55
        Height = 13
        Caption = 'Container'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label32: TLabel
        Left = 245
        Top = 65
        Width = 42
        Height = 13
        Hint = 'Temperatura'
        Caption = 'Volume'
        FocusControl = dbedtVolume
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label33: TLabel
        Left = 8
        Top = 46
        Width = 429
        Height = 13
        Caption = 
          'O container pode ser vinculado ao pedido. Capa do processo de ex' +
          'porta'#231#227'o > aba pedido.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbgrd_cntr: TDBGrid
        Left = 0
        Top = 104
        Width = 789
        Height = 386
        Align = alBottom
        Ctl3D = False
        DataSource = datm_exp_itens.ds_Exp_Itens_Cntr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ParentCtl3D = False
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
            FieldName = 'NR_CONTR'
            Title.Caption = 'Container'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_MERCADORIA'
            Title.Caption = 'Qt. Mercadoria'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 121
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_PESO_BRUTO'
            Title.Caption = 'Peso Bruto'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_CUBAGEM'
            Title.Caption = 'Valor Cubagem'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 137
            Visible = True
          end>
      end
      object dbedtQtMercadoria: TDBEdit
        Left = 8
        Top = 78
        Width = 118
        Height = 19
        Ctl3D = False
        DataField = 'QT_MERCADORIA'
        DataSource = datm_exp_itens.ds_Exp_Itens_Cntr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object dbedtPesoBruto: TDBEdit
        Left = 137
        Top = 78
        Width = 95
        Height = 19
        Ctl3D = False
        DataField = 'QT_PESO_BRUTO'
        DataSource = datm_exp_itens.ds_Exp_Itens_Cntr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object dbcbContainer: TDBLookupComboBox
        Left = 7
        Top = 21
        Width = 119
        Height = 21
        DataField = 'NR_CONTR'
        DataSource = datm_exp_itens.ds_Exp_Itens_Cntr
        KeyField = 'NR_CNTR'
        ListField = 'NR_CNTR'
        ListSource = datm_exp_itens.dsProcContainer
        TabOrder = 0
      end
      object dbedtVolume: TDBEdit
        Left = 245
        Top = 78
        Width = 95
        Height = 19
        Ctl3D = False
        DataField = 'VL_CUBAGEM'
        DataSource = datm_exp_itens.ds_Exp_Itens_Cntr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object btnCarregarTotais: TBitBtn
        Left = 350
        Top = 76
        Width = 32
        Height = 23
        Hint = 'Carregar totais da mercadoria'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = btnCarregarTotaisClick
        Glyph.Data = {
          62050000424D62050000000000003604000028000000110000000F0000000100
          0800000000002C010000C30E0000C30E00000001000000000000000000007B00
          0000BD000000FF0000007B7B000000FF0000FFFF000000315A0008427300084A
          730000007B007B007B00084A7B0008527B0021527B00007B7B007B7B7B00004A
          840008528400105284002963840008528C00085A8C00185A8C0018638C002963
          8C0008529400185A9400296B9400316B94002973940031739400085A9C001863
          9C0018739C0029739C0031739C0031849C00005AA5002173A5003973A500297B
          A500186BAD00106BB500317BB5002984B5004A8CB500086BBD000073BD001073
          BD001873BD00217BBD004284BD00318CBD004A8CBD005294BD005A9CBD00BDBD
          BD001073C600007BC600217BC600428CC6004A8CC6005A9CC6000084CE000884
          CE00398CCE005A9CCE00639CCE001884D6002184D600088CD600108CD6004294
          D600399CD6004A9CD600529CD6005A9CD6005AA5D60063ADD6001884DE002184
          DE00188CDE001094DE001894DE003194DE00299CDE004AA5DE005AA5DE004AB5
          DE00189CE700219CE700429CE7005AA5E7005AADE70063ADE7006BB5E70021A5
          EF0029A5EF0031A5EF0063B5EF006BBDEF0029ADF70031ADF7006BBDF7000000
          FF00FF00FF0031B5FF0039B5FF0042B5FF0039BDFF0042BDFF0042C6FF004AC6
          FF006BC6FF004ACEFF0052CEFF0052D6FF005ADEFF0063E7FF0000FFFF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00390000000000
          0000000000000039393939000000390079797979797979797979003939393900
          0000390079030379030303030379003939393900000039007979797979797979
          7979003939393900000039007903037903030303037900393939390000003900
          7979797979797979797900393939390000003900797979797979790079790039
          3939390000003900790000797979007800790039393900000000390079007900
          7900780079000000390000000000390079790078007800790079787900000000
          0000390000000000790079007978797879000000000039393939393900780079
          7879787978000000000039393939393939007978797879780000000000003939
          3939393939390000000000003900000000003939393939393939393939393939
          393939000000}
      end
    end
  end
  object menu_manut_cadastro: TMainMenu
    Left = 731
    Top = 386
    object mi_novo_item: TMenuItem
      Caption = '&Novo'
      Enabled = False
      OnClick = btn_novo_itemClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      OnClick = btn_cancelarClick
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Enabled = False
      OnClick = btn_excluirClick
    end
    object mi_duplicar: TMenuItem
      Caption = '&Duplicar'
      Enabled = False
      OnClick = btn_duplicarClick
    end
    object mi_calcular: TMenuItem
      Caption = 'C&alcular'
      OnClick = btn_calculoClick
    end
    object mi_manut_proc: TMenuItem
      Caption = '&Manuten'#231#227'o do Processo'
      ShortCut = 113
      OnClick = btn_manut_procClick
    end
    object mi_re: TMenuItem
      Caption = '&RE'
      OnClick = btn_reClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
