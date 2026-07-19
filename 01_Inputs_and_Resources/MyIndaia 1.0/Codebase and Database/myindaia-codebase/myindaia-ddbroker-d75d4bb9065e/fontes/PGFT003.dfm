object frm_fat_sol: Tfrm_fat_sol
  Left = 364
  Top = 114
  Width = 739
  Height = 550
  Caption = 'Solicita'#231#227'o de Faturamento'
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_botoes: TPanel
    Left = 0
    Top = 0
    Width = 731
    Height = 48
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 34
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
    object btn_sair: TSpeedButton
      Left = 693
      Top = 4
      Width = 34
      Height = 40
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
    object btn_salvar: TSpeedButton
      Left = 39
      Top = 4
      Width = 34
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
      Left = 73
      Top = 4
      Width = 34
      Height = 40
      Hint = 'Cancelar Opera'#231#227'o'
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
    object btn_excluir: TSpeedButton
      Left = 107
      Top = 4
      Width = 34
      Height = 40
      Hint = 'Excluir'
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
      Left = 148
      Top = 4
      Width = 34
      Height = 40
      Hint = 'C'#225'lculo da Solicita'#231#227'o'
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
    object btn_canc_sol: TSpeedButton
      Left = 249
      Top = 4
      Width = 34
      Height = 40
      Hint = 'Cancelar Solicita'#231#227'o / Fatura'
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
      OnClick = btn_canc_solClick
    end
    object btn_fechar: TSpeedButton
      Left = 283
      Top = 4
      Width = 34
      Height = 40
      Hint = 'Fechar Movimento'
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
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_fecharClick
    end
    object btn_refat: TSpeedButton
      Left = 216
      Top = 4
      Width = 33
      Height = 40
      Hint = 'Refaturar'
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
      OnClick = btn_refatClick
    end
    object btn_duplicar: TSpeedButton
      Left = 317
      Top = 4
      Width = 34
      Height = 40
      Hint = 'Duplicar Fatura'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFFCCCCCF333333333377777F33FFFFFFFFCC
        CCCF33333333337F337F333FFFFFFFCCCCCF33333333337F337F3333FFFFFFCC
        CCCF33333333337FFF7F33333FFFFFCCCCCF3333333333777773333333FFFFFF
        FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
        00FF33333333333777FF333333333F00000F33FFFFF33777777F3CCCCC333000
        0000377777F3377777773CCCCC33333000FF37F337F3333777F33CCCCC333330
        00FF37F337F3333777F33CCCCC33333000FF37FFF7F333F777333CCCCC333000
        03FF3777773337777333333333333333333F3333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_duplicarClick
    end
    object btnPreviewCalc: TSpeedButton
      Left = 182
      Top = 4
      Width = 34
      Height = 40
      Hint = 'C'#225'lculo da Solicita'#231#227'o em modo Preview'
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000008080008080
        8080808000008000008000008000008000000000000000000000000000000000
        0000000000000000000000808000808000808080808080808080808080808080
        8080808080808080808080808080008080FFFFFF008080008080008080008080
        800000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000008080008080808080FFFFFF008080FFFFFF008080FF
        FFFF008080FFFFFFFFFFFFFFFFFF808080FFFFFF008080008080008080008080
        800000C0C0C0800000C0C0C0800000C0C0C0000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000008080008080808080FFFFFF80808000808080808000
        8080808080808080808080008080808080FFFFFF008080008080008080008080
        800000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF0000000000000000
        00000000FFFFFF000000008080008080808080FFFFFF008080FFFFFF008080FF
        FFFF008080FFFFFF008080FFFFFF808080FFFFFF008080008080008080008080
        800000C0C0C0800000C0C0C0800000C0C0C0000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000008080008080808080FFFFFF80808000808080808000
        8080808080008080808080008080808080FFFFFF008080008080008080008080
        800000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF0000000000000000
        00000000FFFFFF000000008080008080808080FFFFFF008080FFFFFF008080FF
        FFFF008080FFFFFF008080FFFFFF808080FFFFFF008080008080008080008080
        800000C0C0C0800000C0C0C0800000C0C0C0000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000008080008080808080FFFFFF80808000808080808000
        8080808080008080808080008080808080FFFFFF008080008080008080008080
        800000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000008080008080808080FFFFFF008080FFFFFF008080FF
        FFFF008080FFFFFF008080FFFFFF808080FFFFFF008080008080008080008080
        800000C0C0C0800000C0C0C0800000C0C0C00000000000000000000000000000
        00000000000000000000008080008080808080FFFFFF80808000808080808000
        8080808080008080808080008080808080FFFFFF008080008080008080008080
        800000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08000
        00008080008080008080008080008080808080FFFFFF008080FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF008080008080008080008080
        800000C0C0C0800000800000800000800000800000800000800000C0C0C08000
        00008080008080008080008080008080808080FFFFFF80808080808080808080
        8080808080808080808080FFFFFF808080FFFFFF008080008080008080008080
        800000C0C0C0800000800000800000FFFF00800000FFFF00800000C0C0C08000
        00008080008080008080008080008080808080FFFFFF808080FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF808080FFFFFF808080FFFFFF008080008080008080008080
        800000C0C0C0800000800000800000800000800000800000800000C0C0C08000
        00008080008080008080008080008080808080FFFFFF80808080808080808080
        8080808080808080808080008080808080FFFFFF008080008080008080008080
        800000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08000
        00008080008080008080008080008080808080FFFFFF00808000808000808000
        8080008080008080008080008080808080FFFFFF008080008080008080008080
        800000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08000
        00008080008080008080008080008080808080008080FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080008080008080008080008080008080
        8080808000008000008000008000008000008000008000008000008000008080
        8000808000808000808000808000808000808080808080808080808080808080
        8080808080808080808080808080008080008080008080008080}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnPreviewCalcClick
    end
    object btn_manut_proc: TSpeedButton
      Left = 351
      Top = 4
      Width = 34
      Height = 40
      Hint = 'Manuten'#231#227'o do Processo - <F2>'
      Enabled = False
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
    object dbnvg: TDBNavigator
      Left = 389
      Top = 12
      Width = 80
      Height = 24
      DataSource = datm_fat_sol.ds_fat
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
  object pgctrl_fat_sol: TPageControl
    Left = 0
    Top = 95
    Width = 731
    Height = 409
    ActivePage = ts_dados_basicos
    Align = alClient
    HotTrack = True
    TabOrder = 1
    OnChange = pgctrl_fat_solChange
    OnChanging = pgctrl_fat_solChanging
    object ts_solicitacao: TTabSheet
      Caption = 'S&olicita'#231#245'es'
      object dbg_solicitacao: TDBGrid
        Left = 0
        Top = 0
        Width = 723
        Height = 381
        Align = alClient
        DataSource = datm_fat_sol.ds_fat
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
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CalcNrSolicitacao'
            Title.Caption = 'N'#186' Solic.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 66
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_SOLICITACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'look_nm_usuario'
            Title.Caption = 'Solicitante'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 163
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TP_TIPO_FAT'
            Title.Caption = 'F/N'
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
            FieldName = 'NR_NOTA_FATURA'
            Title.Caption = 'N'#186' Fat/Nota'
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
            FieldName = 'look_Calculado'
            Title.Caption = 'Calculado'
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
            FieldName = 'look_Cancelado'
            Title.Caption = 'Cancelado'
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
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados B'#225'sicos'
      object pnl_dados_basicos: TPanel
        Left = 0
        Top = 0
        Width = 723
        Height = 381
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object lbl_doc_hist: TLabel
          Left = 18
          Top = 204
          Width = 51
          Height = 13
          Caption = 'Hist'#243'rico'
          FocusControl = dbm_tx_observacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 221
          Top = 83
          Width = 93
          Height = 13
          Caption = 'N'#250'mero da Nota'
          FocusControl = dbedt_nr_nota
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 221
          Top = 122
          Width = 28
          Height = 13
          Caption = 'Data'
          FocusControl = dbedt_data_fatura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 546
          Top = 220
          Width = 98
          Height = 13
          Caption = 'Total de Cr'#233'ditos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 546
          Top = 264
          Width = 95
          Height = 13
          Caption = 'Total de D'#233'bitos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 546
          Top = 305
          Width = 33
          Height = 13
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 442
          Top = 151
          Width = 65
          Height = 13
          Caption = 'Cancelador'
          FocusControl = dbedt_nm_cancelador
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 442
          Top = 25
          Width = 97
          Height = 13
          Caption = 'Data de vencto.:'
          FocusControl = db_dt_venc_fat_
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_hist: TSpeedButton
          Left = 389
          Top = 217
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
          OnClick = btn_co_histClick
        end
        object Label30: TLabel
          Left = 221
          Top = 163
          Width = 46
          Height = 13
          Caption = 'Liquidar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbm_tx_observacao: TDBMemo
          Left = 18
          Top = 217
          Width = 369
          Height = 146
          DataField = 'TX_OBSERVACOES'
          DataSource = datm_fat_sol.ds_fat
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbm_tx_observacaoChange
          OnExit = dbm_tx_observacaoExit
        end
        object dbrg_tp_fatura: TDBRadioGroup
          Left = 16
          Top = 79
          Width = 193
          Height = 98
          Caption = 'Tipo de Faturamento'
          DataField = 'TP_TIPO_FAT'
          DataSource = datm_fat_sol.ds_fat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Fatura Cobran'#231'a'
            'Nota de Cr'#233'dito / D'#233'bito'
            'Demonstrativo de Despesas'
            'Dem. Desp. - Complementar')
          ParentFont = False
          TabOrder = 1
          Values.Strings = (
            'F'
            'N'
            'D'
            'C')
          OnClick = dbrg_tp_faturaClick
        end
        object dbedt_nr_nota: TDBEdit
          Left = 221
          Top = 96
          Width = 57
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_NOTA_FATURA'
          DataSource = datm_fat_sol.ds_fat
          ReadOnly = True
          TabOrder = 0
          OnChange = dbrg_tp_faturaClick
          OnKeyDown = dbedt_nr_notaKeyDown
        end
        object dbedt_data_fatura: TDBEdit
          Left = 221
          Top = 135
          Width = 64
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_FATURA'
          DataSource = datm_fat_sol.ds_fat
          ReadOnly = True
          TabOrder = 4
        end
        object Panel2: TPanel
          Left = 16
          Top = 16
          Width = 277
          Height = 56
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 5
          object Label4: TLabel
            Left = 12
            Top = 10
            Width = 44
            Height = 13
            Caption = 'N'#250'mero'
            FocusControl = db_nr_solicitacao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 90
            Top = 10
            Width = 32
            Height = 13
            Caption = 'Data '
            FocusControl = dbedt_dt_solicitacao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 170
            Top = 10
            Width = 44
            Height = 13
            Caption = 'Usu'#225'rio'
            FocusControl = dbedt_nm_solicitante
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object db_nr_solicitacao: TDBEdit
            Left = 13
            Top = 23
            Width = 60
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CalcNrSolicitacao'
            DataSource = datm_fat_sol.ds_fat
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_dt_solicitacao: TDBEdit
            Left = 90
            Top = 23
            Width = 64
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'DT_SOLICITACAO'
            DataSource = datm_fat_sol.ds_fat
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_nm_solicitante: TDBEdit
            Left = 170
            Top = 23
            Width = 93
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'look_nm_usuario'
            DataSource = datm_fat_sol.ds_fat
            ReadOnly = True
            TabOrder = 2
          end
        end
        object dbcb_calculado: TDBCheckBox
          Left = 442
          Top = 77
          Width = 136
          Height = 17
          TabStop = False
          Caption = 'Calculado          em:'
          Color = clMenu
          DataField = 'IN_CALCULADO'
          DataSource = datm_fat_sol.ds_fat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object msk_vl_cred_sol: TMaskEdit
          Left = 546
          Top = 234
          Width = 121
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 7
        end
        object msk_vl_deb_sol: TMaskEdit
          Left = 546
          Top = 276
          Width = 121
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 8
        end
        object msk_vl_saldo_sol: TMaskEdit
          Left = 546
          Top = 318
          Width = 121
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_dt_calculo: TDBEdit
          Left = 602
          Top = 76
          Width = 64
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_CALCULO'
          DataSource = datm_fat_sol.ds_fat
          ReadOnly = True
          TabOrder = 10
        end
        object DBCheckBox1: TDBCheckBox
          Left = 442
          Top = 101
          Width = 136
          Height = 17
          TabStop = False
          Caption = 'Emitido N.F.      em:'
          Color = clMenu
          DataField = 'IN_IMP_NF_SERV'
          DataSource = datm_fat_sol.ds_fat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbedt_dt_impressao: TDBEdit
          Left = 602
          Top = 100
          Width = 64
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_NF_SERV'
          DataSource = datm_fat_sol.ds_fat
          ReadOnly = True
          TabOrder = 12
        end
        object DBCheckBox3: TDBCheckBox
          Left = 442
          Top = 124
          Width = 136
          Height = 17
          TabStop = False
          Caption = 'Cancelado        em:'
          Color = clMenu
          DataField = 'IN_CANCELADO'
          DataSource = datm_fat_sol.ds_fat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbedt_dt_cancelamento: TDBEdit
          Left = 602
          Top = 123
          Width = 64
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_CANCELAMENTO'
          DataSource = datm_fat_sol.ds_fat
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_nm_cancelador: TDBEdit
          Left = 573
          Top = 148
          Width = 93
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_nm_cancelador'
          DataSource = datm_fat_sol.ds_fat
          ReadOnly = True
          TabOrder = 15
        end
        object db_dt_venc_fat_: TDBEdit
          Left = 546
          Top = 21
          Width = 120
          Height = 21
          DataField = 'DT_VENCTO_FATURA'
          DataSource = datm_fat_sol.ds_fat
          TabOrder = 16
          OnChange = dbrg_tp_faturaClick
          OnKeyPress = db_dt_venc_fat_KeyPress
        end
        object dblckpbox_in_liq_aut: TDBLookupComboBox
          Left = 221
          Top = 176
          Width = 50
          Height = 21
          DataField = 'IN_LIQ_AUT'
          DataSource = datm_fat_sol.ds_fat
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_fat_sol.ds_yesno_
          TabOrder = 3
          OnClick = dbrg_tp_faturaClick
        end
      end
    end
    object ts_processo: TTabSheet
      Caption = '&Processo'
      object lbl_cd_cliente: TLabel
        Left = 146
        Top = 6
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
      object lbl_cd_servico: TLabel
        Left = 408
        Top = 6
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
      object Label10: TLabel
        Left = 10
        Top = 209
        Width = 98
        Height = 13
        Caption = 'Total de Cr'#233'ditos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 10
        Top = 246
        Width = 95
        Height = 13
        Caption = 'Total de D'#233'bitos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 10
        Top = 282
        Width = 33
        Height = 13
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 9
        Top = 6
        Width = 44
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 75
        Top = 6
        Width = 32
        Height = 13
        Caption = 'Data '
        FocusControl = DBEdit3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_nr_processo: TLabel
        Left = 10
        Top = 319
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
        Left = 107
        Top = 332
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
        OnClick = btn_co_processoClick
      end
      object Label26: TLabel
        Left = 145
        Top = 335
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
      object btn_co_cliente: TSpeedButton
        Left = 527
        Top = 347
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
        OnClick = btn_co_clienteClick
      end
      object Label27: TLabel
        Left = 564
        Top = 335
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
      object Label28: TLabel
        Left = 647
        Top = 335
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
      object lbl_grupo: TLabel
        Left = 146
        Top = 298
        Width = 35
        Height = 13
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_grupo: TSpeedButton
        Left = 527
        Top = 310
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
        OnClick = btn_co_grupoClick
      end
      object Label7: TLabel
        Left = 612
        Top = 315
        Width = 7
        Height = 13
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label29: TLabel
        Left = 563
        Top = 298
        Width = 52
        Height = 13
        Caption = 'Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbg_processo: TDBGrid
        Left = 10
        Top = 47
        Width = 131
        Height = 154
        DataSource = datm_fat_sol.ds_fat_proc
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Calc_Nr_Processo'
            Title.Caption = 'Processo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 93
            Visible = True
          end>
      end
      object dbg_faturamento_cc: TDBGrid
        Left = 147
        Top = 46
        Width = 575
        Height = 243
        DataSource = datm_fat_sol.ds_fat_cc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_faturamento_ccDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'TX_YESNO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_LANCAMENTO'
            Title.Caption = 'N'#186
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 37
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_LANCAMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_nm_item'
            Title.Caption = 'Item'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 275
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_vl_lancamento'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 94
            Visible = True
          end>
      end
      object dbedt_nm_servico: TDBEdit
        Left = 449
        Top = 19
        Width = 272
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_SERVICO'
        DataSource = datm_fat_sol.ds_processo
        ReadOnly = True
        TabOrder = 11
      end
      object dbedt_nm_cliente: TDBEdit
        Left = 186
        Top = 19
        Width = 216
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'AP_EMPRESA'
        DataSource = datm_fat_sol.ds_processo
        ReadOnly = True
        TabOrder = 12
      end
      object msk_vl_cred_proc: TMaskEdit
        Left = 10
        Top = 222
        Width = 123
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 13
      end
      object msk_vl_saldo_proc: TMaskEdit
        Left = 10
        Top = 295
        Width = 123
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 14
      end
      object DBEdit1: TDBEdit
        Left = 10
        Top = 19
        Width = 59
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CalcNrSolicitacao'
        DataSource = datm_fat_sol.ds_fat
        ReadOnly = True
        TabOrder = 15
      end
      object DBEdit3: TDBEdit
        Left = 76
        Top = 19
        Width = 64
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'DT_SOLICITACAO'
        DataSource = datm_fat_sol.ds_fat
        ReadOnly = True
        TabOrder = 16
      end
      object msk_nr_processo: TMaskEdit
        Left = 10
        Top = 332
        Width = 97
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 18
        ParentFont = False
        TabOrder = 0
        OnExit = msk_nr_processoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_vl_deb_proc: TMaskEdit
        Left = 10
        Top = 259
        Width = 123
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 17
      end
      object edt_nm_cliente: TEdit
        Left = 189
        Top = 348
        Width = 337
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 18
      end
      object msk_dt_inicio: TMaskEdit
        Left = 564
        Top = 348
        Width = 75
        Height = 21
        EditMask = '00/00/0000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 5
        Text = '  /  /    '
        OnExit = msk_dt_inicioExit
      end
      object msk_dt_termino: TMaskEdit
        Left = 648
        Top = 348
        Width = 75
        Height = 21
        EditMask = '00/00/0000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 6
        Text = '  /  /    '
        OnExit = msk_dt_terminoExit
      end
      object edt_nm_grupo: TEdit
        Left = 189
        Top = 311
        Width = 337
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 19
      end
      object dbedt_nr_relatorio: TDBEdit
        Left = 564
        Top = 311
        Width = 45
        Height = 21
        DataField = 'NR_RELATORIO'
        DataSource = datm_fat_sol.ds_fat
        TabOrder = 1
        OnChange = dbrg_tp_faturaClick
      end
      object dbedt_nr_ano: TDBEdit
        Left = 623
        Top = 311
        Width = 45
        Height = 21
        DataField = 'NR_ANO'
        DataSource = datm_fat_sol.ds_fat
        TabOrder = 2
        OnChange = dbrg_tp_faturaClick
      end
      object dbedt_cd_servico: TDBEdit
        Left = 409
        Top = 19
        Width = 41
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_SERVICO'
        DataSource = datm_fat_sol.ds_processo
        ReadOnly = True
        TabOrder = 10
      end
      object dbedt_cd_cliente: TDBEdit
        Left = 147
        Top = 19
        Width = 40
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_CLIENTE'
        DataSource = datm_fat_sol.ds_processo
        ReadOnly = True
        TabOrder = 9
      end
      object msk_cd_grupo: TMaskEdit
        Left = 147
        Top = 311
        Width = 43
        Height = 21
        EditMask = '999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 3
        OnChange = msk_cd_grupoChange
        OnExit = msk_cd_grupoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_cliente: TMaskEdit
        Left = 146
        Top = 348
        Width = 44
        Height = 21
        EditMask = '99999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 4
        OnChange = msk_cd_clienteChange
        OnExit = msk_cd_clienteExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object chkProcessos: TCheckBox
        Left = 10
        Top = 354
        Width = 124
        Height = 17
        Caption = #218'ltimos Processos'
        Checked = True
        State = cbChecked
        TabOrder = 20
      end
    end
    object ts_item: TTabSheet
      Caption = ' I&tem'
      object Label18: TLabel
        Left = 12
        Top = 7
        Width = 44
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 80
        Top = 7
        Width = 32
        Height = 13
        Caption = 'Data '
        FocusControl = DBEdit5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 277
        Top = 7
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
      object Label22: TLabel
        Left = 166
        Top = 7
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
      object dbg_item: TDBGrid
        Left = 12
        Top = 47
        Width = 710
        Height = 191
        DataSource = datm_fat_sol.ds_fat_proc_item
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
            FieldName = 'calc_nm_item'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 316
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_INFORMADO'
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
            FieldName = 'VL_CALCULADO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 127
            Visible = True
          end>
      end
      object DBEdit4: TDBEdit
        Left = 12
        Top = 20
        Width = 60
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NR_SOLICITACAO'
        DataSource = datm_fat_sol.ds_fat
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit5: TDBEdit
        Left = 81
        Top = 20
        Width = 76
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'DT_SOLICITACAO'
        DataSource = datm_fat_sol.ds_fat
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit7: TDBEdit
        Left = 320
        Top = 20
        Width = 289
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'AP_EMPRESA'
        DataSource = datm_fat_sol.ds_processo
        ReadOnly = True
        TabOrder = 4
      end
      object pnl_item: TPanel
        Left = 12
        Top = 249
        Width = 710
        Height = 127
        BevelInner = bvLowered
        Enabled = False
        TabOrder = 5
        object lbl_item: TLabel
          Left = 18
          Top = 6
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
        object btn_co_item: TSpeedButton
          Left = 348
          Top = 18
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
          OnClick = btn_co_itemClick
        end
        object lbl_vl_lanc_fatur: TLabel
          Left = 510
          Top = 6
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Informado'
          FocusControl = dbedt_vl_inf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 510
          Top = 46
          Width = 90
          Height = 13
          Caption = 'Valor Calculado'
          FocusControl = dbedt_vl_inf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblAtivo: TLabel
          Left = 406
          Top = 7
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
        object Label24: TLabel
          Left = 18
          Top = 44
          Width = 87
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
          Left = 348
          Top = 56
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
        object Label31: TLabel
          Left = 18
          Top = 83
          Width = 100
          Height = 13
          AutoSize = False
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_centro_custo: TSpeedButton
          Left = 348
          Top = 95
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
          OnClick = btn_centro_custoClick
        end
        object dbedt_nm_item: TDBEdit
          Left = 67
          Top = 19
          Width = 280
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_nm_item'
          DataSource = datm_fat_sol.ds_fat_proc_item
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_vl_inf: TDBEdit
          Left = 510
          Top = 19
          Width = 101
          Height = 21
          DataField = 'VL_INFORMADO'
          DataSource = datm_fat_sol.ds_fat_proc_item
          TabOrder = 2
          OnChange = dbedt_cd_itemChange
        end
        object dbedt_vl_calc: TDBEdit
          Left = 510
          Top = 59
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_CALCULADO'
          DataSource = datm_fat_sol.ds_fat_proc_item
          ReadOnly = True
          TabOrder = 5
        end
        object dblkpcbox_restitui: TDBLookupComboBox
          Left = 406
          Top = 19
          Width = 77
          Height = 21
          DataField = 'IN_RESTITUI'
          DataSource = datm_fat_sol.ds_fat_proc_item
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_fat_sol.ds_yesno_
          TabOrder = 1
          OnClick = dbedt_cd_itemChange
        end
        object dbedt_nm_favorecido: TDBEdit
          Left = 67
          Top = 57
          Width = 280
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_nm_favorecido'
          DataSource = datm_fat_sol.ds_fat_proc_item
          ReadOnly = True
          TabOrder = 8
        end
        object dbchk_cliente: TDBCheckBox
          Left = 406
          Top = 61
          Width = 70
          Height = 17
          Caption = 'Cliente'
          DataField = 'IN_NAO_FAT'
          DataSource = datm_fat_sol.ds_fat_proc_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          ValueChecked = '*'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_itemChange
        end
        object dbedt_cd_item: TDBEdit
          Left = 18
          Top = 19
          Width = 50
          Height = 21
          DataField = 'CD_ITEM'
          DataSource = datm_fat_sol.ds_fat_proc_item
          TabOrder = 0
          OnChange = dbedt_cd_itemChange
          OnExit = dbedt_cd_itemExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_cd_favorecido: TDBEdit
          Left = 18
          Top = 57
          Width = 50
          Height = 21
          DataField = 'CD_FAVORECIDO'
          DataSource = datm_fat_sol.ds_fat_proc_item
          MaxLength = 3
          TabOrder = 3
          OnChange = dbedt_cd_itemChange
          OnExit = dbedt_cd_favorecidoExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_cd_ct_custo: TDBEdit
          Left = 18
          Top = 96
          Width = 50
          Height = 21
          DataField = 'CD_CT_CUSTO'
          DataSource = datm_fat_sol.ds_fat_proc_item
          MaxLength = 3
          TabOrder = 6
          OnChange = btn_centro_custoClick
          OnExit = dbedt_cd_favorecidoExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_ct_custo: TEdit
          Left = 67
          Top = 96
          Width = 280
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 9
        end
      end
      object dbedt_nr_processo: TDBEdit
        Left = 167
        Top = 20
        Width = 101
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Calc_Nr_Processo'
        DataSource = datm_fat_sol.ds_fat_proc
        MaxLength = 18
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit6: TDBEdit
        Left = 278
        Top = 20
        Width = 43
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_CLIENTE'
        DataSource = datm_fat_sol.ds_processo
        ReadOnly = True
        TabOrder = 3
      end
    end
    object ts_calculo: TTabSheet
      Caption = 'Ite&m X '#193'rea'
      object dbgrd_item_area: TDBGrid
        Left = 6
        Top = 8
        Width = 721
        Height = 311
        DataSource = datm_fat_sol.ds_calculo_rateio_desp
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
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Calc_Nr_Processo'
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
            FieldName = 'OBS'
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
            FieldName = 'LookNmItem'
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
            FieldName = 'LookNmArea'
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
            FieldName = 'LookNmRateioDesp'
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
            FieldName = 'NR_PROC_PO_NR_ITEM_PO'
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
            FieldName = 'CD_REFERENCIA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object btn_item: TButton
        Left = 288
        Top = 332
        Width = 129
        Height = 37
        Caption = '&Cadastro Item'
        TabOrder = 1
        OnClick = btn_itemClick
      end
    end
    object ts_docto: TTabSheet
      Caption = 'Documentos'
      ImageIndex = 5
      object DBGrid1: TDBGrid
        Left = 7
        Top = 6
        Width = 715
        Height = 314
        DataSource = datm_fat_sol.ds_fat_docto
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
            FieldName = 'CD_DOCUMENTO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookDocumento'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 339
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookFormaDocto'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_DOCTO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 99
            Visible = True
          end>
      end
      object pnl_documento: TPanel
        Left = 7
        Top = 328
        Width = 715
        Height = 46
        BevelOuter = bvLowered
        Enabled = False
        TabOrder = 1
        object lbl_documento: TLabel
          Left = 11
          Top = 3
          Width = 65
          Height = 13
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_documento: TSpeedButton
          Left = 339
          Top = 17
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
          OnClick = btn_co_documentoClick
        end
        object lbl_nr_docto: TLabel
          Left = 537
          Top = 3
          Width = 57
          Height = 13
          Caption = 'N'#186' Docto.'
          FocusControl = dbedt_nr_docto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_forma: TLabel
          Left = 383
          Top = 4
          Width = 37
          Height = 13
          Caption = 'Enviar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_documento: TDBEdit
          Left = 11
          Top = 18
          Width = 45
          Height = 21
          DataField = 'CD_DOCUMENTO'
          DataSource = datm_fat_sol.ds_fat_docto
          TabOrder = 0
          OnChange = dbedt_cd_documentoChange
          OnExit = dbedt_cd_documentoExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_documento: TDBEdit
          Left = 59
          Top = 18
          Width = 275
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookDocumento'
          DataSource = datm_fat_sol.ds_fat_docto
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nr_docto: TDBEdit
          Left = 537
          Top = 18
          Width = 96
          Height = 21
          DataField = 'NR_DOCTO'
          DataSource = datm_fat_sol.ds_fat_docto
          TabOrder = 2
          OnChange = dbedt_cd_documentoChange
        end
        object dblckpbox_forma_docto: TDBLookupComboBox
          Left = 383
          Top = 18
          Width = 128
          Height = 21
          DataField = 'CD_FORMA_DOC'
          DataSource = datm_fat_sol.ds_fat_docto
          DropDownRows = 3
          KeyField = 'CD_FORMA_DOC'
          ListField = 'NM_FORMA_DOC'
          ListSource = datm_fat_sol.ds_tp_forma_doc
          TabOrder = 1
          OnClick = dbedt_cd_documentoChange
        end
      end
    end
  end
  object pnl_selecao: TPanel
    Left = 0
    Top = 48
    Width = 731
    Height = 47
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      Left = 223
      Top = 6
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
      Left = 401
      Top = 18
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
    object lbl_cd_unid_neg: TLabel
      Left = 8
      Top = 6
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
      Left = 193
      Top = 18
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
    object lbl_dt_solic_ch: TLabel
      Left = 433
      Top = 7
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object msk_cd_produto: TMaskEdit
      Left = 223
      Top = 19
      Width = 24
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
      OnEnter = msk_cd_produtoEnter
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 247
      Top = 19
      Width = 153
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 8
      Top = 19
      Width = 24
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 32
      Top = 19
      Width = 160
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object msk_dt_movimento: TMaskEdit
      Left = 433
      Top = 19
      Width = 67
      Height = 21
      EditMask = '00/00/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 4
      Text = '  /  /    '
      OnEnter = msk_dt_movimentoEnter
      OnExit = msk_dt_movimentoExit
    end
    object DBEdit2: TDBEdit
      Left = 112
      Top = 56
      Width = 64
      Height = 21
      DataField = 'DT_SOLICITACAO'
      DataSource = datm_fat_sol.ds_fat
      TabOrder = 5
    end
    object Panel1: TPanel
      Left = 522
      Top = 0
      Width = 209
      Height = 47
      Align = alRight
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 6
      object Label1: TLabel
        Left = 4
        Top = 5
        Width = 56
        Height = 13
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 86
        Top = 5
        Width = 37
        Height = 13
        Caption = 'Ordem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_chave: TEdit
        Left = 4
        Top = 18
        Width = 81
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
      end
      object cb_ordem: TComboBox
        Left = 87
        Top = 18
        Width = 116
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 662
    Top = 100
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      Hint = ' '
      OnClick = btn_incluirClick
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
    object mi_solicitacao: TMenuItem
      Caption = 'S&olicita'#231#227'o'
      object mi_calcular: TMenuItem
        Caption = 'C&alcular'
        OnClick = btn_calculoClick
      end
      object mi_canc_sol: TMenuItem
        Caption = 'Ca&ncelar Solic. / Fatura'
        OnClick = btn_canc_solClick
      end
      object mi_fechar: TMenuItem
        Caption = '&Fechar Movimento'
        OnClick = btn_fecharClick
      end
      object mi_refat: TMenuItem
        Caption = 'Re&faturar'
        OnClick = btn_refatClick
      end
      object mi_duplicar: TMenuItem
        Caption = '&Duplicar'
        OnClick = btn_duplicarClick
      end
    end
    object mi_emissao: TMenuItem
      Caption = '&Emiss'#227'o'
      object mi_nf_serv: TMenuItem
        Caption = 'Nota &Fiscal de Servi'#231'o'
        OnClick = mi_nf_servClick
      end
      object mi_nota_deb_cred: TMenuItem
        Caption = '&Nota de D'#233'bito/Cr'#233'dito'
        OnClick = mi_nota_deb_credClick
      end
      object DemonstrativoDespesas1: TMenuItem
        Caption = 'Demonstrativo Despesas'
        OnClick = DemonstrativoDespesas1Click
      end
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
