object frm_recebimento_ag: Tfrm_recebimento_ag
  Left = 137
  Top = 113
  Width = 750
  Height = 550
  Caption = 'Recebimento de Clientes'
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
  PixelsPerInch = 96
  TextHeight = 13
  object btn_co_grupo: TSpeedButton
    Left = 632
    Top = 125
    Width = 25
    Height = 21
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
  object Label6: TLabel
    Left = 343
    Top = 111
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
      Left = 445
      Top = 4
      Width = 33
      Height = 38
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
      Left = 5
      Top = 4
      Width = 33
      Height = 38
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
      Left = 38
      Top = 4
      Width = 33
      Height = 38
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
    object btn_pesq: TSpeedButton
      Left = 392
      Top = 4
      Width = 33
      Height = 38
      Hint = 'Pesquisar'
      Enabled = False
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
      Visible = False
    end
    object btn_receber: TSpeedButton
      Left = 83
      Top = 4
      Width = 33
      Height = 38
      Hint = 'Receber'
      Enabled = False
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
      OnClick = btn_receberClick
    end
    object btn_efetuar: TSpeedButton
      Left = 116
      Top = 4
      Width = 33
      Height = 38
      Hint = 'Efetuar Recebimento'
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
      OnClick = btn_efetuarClick
    end
    object btn_aplic_tarifario: TSpeedButton
      Left = 353
      Top = 4
      Width = 33
      Height = 38
      Hint = 'Atulizar Tarif'#225'rio'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_aplic_tarifarioClick
    end
    object btn_canc_receb: TSpeedButton
      Left = 161
      Top = 4
      Width = 33
      Height = 38
      Hint = 'Canc.Recebimento'
      Enabled = False
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
      OnClick = btn_canc_recebClick
    end
    object btn_imprimir: TSpeedButton
      Left = 205
      Top = 4
      Width = 33
      Height = 38
      Hint = 'Impress'#227'o'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_lista_relClick
    end
    object Label1: TLabel
      Left = 485
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
      Left = 600
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
    object btn_lista_rel: TSpeedButton
      Left = 238
      Top = 4
      Width = 9
      Height = 38
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337F33333333333333033333333333333373F333333333333000333
        33333333337F7F33333333333300033333333333337373F33333333330000033
        3333333337FFFFF3333333333000003333333333373337333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_lista_relClick
    end
    object btn_devolucao: TSpeedButton
      Left = 259
      Top = 4
      Width = 33
      Height = 38
      Hint = 'Devolu'#231#227'o de Numer'#225'rios'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_devolucaoClick
    end
    object btn_pagto: TSpeedButton
      Left = 292
      Top = 4
      Width = 33
      Height = 38
      Hint = 'Gerar Solicita'#231#227'o de Pagamento'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
        555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
        05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
        FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
        FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
        FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
        05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
        555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
        9055575757575757775505050505055505557575757575557555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_pagtoClick
    end
    object edt_chave: TEdit
      Left = 486
      Top = 19
      Width = 110
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 601
      Top = 19
      Width = 134
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object pgctrl_recebimento_ag: TPageControl
    Left = 0
    Top = 47
    Width = 742
    Height = 457
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_recebimento_agChange
    OnChanging = pgctrl_recebimento_agChanging
    object ts_lista: TTabSheet
      BorderWidth = 2
      Caption = 'Pesquisa'
      ImageIndex = 3
      object dbgrid_pes_devolucao: TDBGrid
        Left = 0
        Top = 169
        Width = 730
        Height = 256
        Align = alClient
        DataSource = datm_recebimento_ag.ds_devolucao_
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
        Columns = <
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
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_DEVOLUCAO'
            Title.Caption = 'Devolu'#231#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_DEVOLUCAO'
            Title.Caption = 'Dt. Devolu'#231#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 134
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_DEVOLUCAO'
            Title.Caption = 'Vl. Devolu'#231#227'o'
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
            Expanded = False
            FieldName = 'NR_SOLIC_CH'
            Title.Caption = 'Solic. Pagamento'
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
            FieldName = 'Calc_Transferido'
            Title.Caption = 'Status'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 85
            Visible = True
          end>
      end
      object dbgrid_pes_recebimento: TDBGrid
        Left = 0
        Top = 169
        Width = 730
        Height = 256
        Align = alClient
        DataSource = datm_recebimento_ag.ds_list_receb
        PopupMenu = popFinalizarRecebimento
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
        OnDrawColumnCell = dbgrid_pes_recebimentoDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_RECEBIMENTO'
            Title.Caption = 'Recebimento'
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
            FieldName = 'NR_PROCESSO'
            Title.Caption = 'Processo'
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
            FieldName = 'DT_RECEBIMENTO'
            Title.Caption = 'Data'
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
            FieldName = 'VL_RECEBIMENTO'
            Title.Caption = 'Vlr Recebido'
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
            FieldName = 'NM_BANCO'
            Title.Caption = 'Banco'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 192
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_USUARIO'
            Title.Caption = 'Recebedor'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Status'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 74
            Visible = True
          end>
      end
      object dbgrid_pes_numerario: TDBGrid
        Left = 0
        Top = 169
        Width = 730
        Height = 256
        Align = alClient
        DataSource = datm_recebimento_ag.ds_pesq_notificacao
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrid_pes_numerarioDrawColumnCell
        OnDblClick = dbgrid_pes_numerarioDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_SOLICITACAO'
            Title.Caption = 'Solic.'
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
            Width = 127
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_SOLICITACAO'
            Title.Caption = 'Data'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_SOLICITADO'
            Title.Caption = 'Vl Solicitado'
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
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Title.Caption = 'Vl Recebido'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_EMISSAO'
            Title.Caption = 'Emiss'#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Status'
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
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 730
        Height = 169
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label30: TLabel
          Left = 12
          Top = 86
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
        object btn_list_cliente: TSpeedButton
          Left = 393
          Top = 98
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
          OnClick = btn_list_clienteClick
        end
        object Label31: TLabel
          Left = 431
          Top = 48
          Width = 106
          Height = 13
          Caption = 'Dt Inicio (emiss'#227'o)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 430
          Top = 85
          Width = 102
          Height = 13
          Caption = 'Dt Final (emiss'#227'o)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 431
          Top = 123
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
        object Label16: TLabel
          Left = 12
          Top = 123
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
        object btn_co_bc: TSpeedButton
          Left = 393
          Top = 136
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
          OnClick = btn_co_bcClick
        end
        object Label19: TLabel
          Left = 12
          Top = 11
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
        object btn_co_unid_neg: TSpeedButton
          Left = 234
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
          OnClick = btn_co_unid_negClick
        end
        object Label24: TLabel
          Left = 12
          Top = 49
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
        object SpeedButton1: TSpeedButton
          Left = 393
          Top = 62
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
          OnClick = SpeedButton1Click
        end
        object btn_co_produto2: TSpeedButton
          Left = 492
          Top = 24
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
          OnClick = btn_co_produto2Click
        end
        object Label26: TLabel
          Left = 270
          Top = 11
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
        object edt_list_cliente: TEdit
          Left = 59
          Top = 99
          Width = 333
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 12
        end
        object edt_list_bco: TEdit
          Left = 59
          Top = 136
          Width = 333
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 14
        end
        object edit_nm_unid_neg: TEdit
          Left = 59
          Top = 24
          Width = 174
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 2
        end
        object msk_cd_unid_neg: TMaskEdit
          Left = 12
          Top = 24
          Width = 48
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 1
          OnChange = msk_cd_unid_negChange
          OnExit = msk_cd_unid_negExit
          OnKeyDown = dbedt_cd_bco_agKeyDown
        end
        object msk_list_cliente: TMaskEdit
          Left = 12
          Top = 99
          Width = 48
          Height = 21
          EditMask = '99999;0; '
          MaxLength = 5
          TabOrder = 11
          OnChange = msk_list_clienteChange
          OnExit = msk_list_clienteExit
          OnKeyDown = dbedt_cd_bco_agKeyDown
        end
        object msk_list_bco: TMaskEdit
          Left = 12
          Top = 136
          Width = 48
          Height = 21
          EditMask = '999;0; '
          MaxLength = 3
          TabOrder = 13
          OnExit = msk_list_bcoExit
          OnKeyDown = dbedt_cd_bco_agKeyDown
        end
        object msk_dt_inicio: TMaskEdit
          Left = 431
          Top = 61
          Width = 85
          Height = 21
          BiDiMode = bdLeftToRight
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentBiDiMode = False
          TabOrder = 5
          Text = '  /  /    '
          OnExit = msk_valorExit
        end
        object msk_dt_fim: TMaskEdit
          Left = 430
          Top = 98
          Width = 86
          Height = 21
          BiDiMode = bdLeftToRight
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentBiDiMode = False
          TabOrder = 10
          Text = '  /  /    '
          OnExit = msk_valorExit
        end
        object msk_vl_receb: TMaskEdit
          Left = 430
          Top = 136
          Width = 85
          Height = 21
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          TabOrder = 15
          OnChange = msk_vl_recebChange
          OnExit = msk_valorExit
        end
        object rdgrp_tp_status: TRadioGroup
          Left = 541
          Top = 67
          Width = 151
          Height = 90
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'Aberto'
            'Baixado'
            'Cancelado       '
            'Parcial'
            'Todos')
          ParentFont = False
          TabOrder = 8
          OnClick = rdgrp_tp_statusClick
        end
        object rdgp_tp_pesquisa: TRadioGroup
          Left = 541
          Top = 8
          Width = 151
          Height = 59
          Caption = 'Numer'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'Notifica'#231#227'o'
            'Recebimento'
            'Devolu'#231#227'o')
          ParentFont = False
          TabOrder = 0
          OnClick = rdgp_tp_pesquisaClick
        end
        object Edit1: TEdit
          Left = 59
          Top = 62
          Width = 333
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 7
        end
        object MaskEdit1: TMaskEdit
          Left = 12
          Top = 62
          Width = 48
          Height = 21
          EditMask = '999;0; '
          MaxLength = 3
          TabOrder = 6
          OnChange = SpeedButton1Click
          OnExit = MaskEdit1Exit
          OnKeyDown = dbedt_cd_bco_agKeyDown
        end
        object pnlTodos: TPanel
          Left = 649
          Top = 77
          Width = 35
          Height = 62
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 9
          Visible = False
          object Shape6: TShape
            Left = 0
            Top = 3
            Width = 35
            Height = 14
            Brush.Color = 14869191
            Pen.Color = clGray
          end
          object Shape10: TShape
            Left = 0
            Top = 18
            Width = 35
            Height = 14
            Brush.Color = 14024661
            Pen.Color = clGray
          end
          object Shape19: TShape
            Left = 0
            Top = 48
            Width = 35
            Height = 14
            Brush.Color = 16767411
            Pen.Color = clGray
          end
          object Shape16: TShape
            Left = 0
            Top = 33
            Width = 35
            Height = 14
            Brush.Color = 13031935
            Pen.Color = clGray
          end
        end
        object edit_nm_produto: TEdit
          Left = 317
          Top = 24
          Width = 174
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 4
          Text = 'Todos'
        end
        object msk_cd_produto: TMaskEdit
          Left = 270
          Top = 24
          Width = 48
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 3
          OnChange = msk_cd_produtoChange
          OnExit = msk_cd_produtoExit
        end
      end
    end
    object ts_rec_pendentes: TTabSheet
      BorderWidth = 2
      Caption = 'Montar Recebimentos'
      object grid_remessa: TDBGrid
        Left = 0
        Top = 170
        Width = 730
        Height = 255
        Align = alClient
        Ctl3D = False
        DataSource = datm_recebimento_ag.ds_notif_pend
        FixedColor = clWindowFrame
        Options = [dgEditing, dgTitles, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentColor = True
        ParentCtl3D = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = grid_remessaCellClick
        OnDrawColumnCell = grid_remessaDrawColumnCell
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'IN_SELECIONADO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 20
            Visible = True
          end
          item
            Color = 15466470
            Expanded = False
            FieldName = 'NR_PROCESSO'
            Title.Caption = 'Processo'
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
            Alignment = taCenter
            Color = clWhite
            Expanded = False
            FieldName = 'NR_SOLICITACAO'
            Title.Caption = 'Notifica'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 80
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'NM_EMPRESA'
            Title.Caption = 'Cliente'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 308
            Visible = True
          end
          item
            Alignment = taRightJustify
            Color = clWhite
            Expanded = False
            FieldName = 'DT_SOLICITACAO'
            Title.Caption = 'Data'
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
            Color = clWhite
            Expanded = False
            FieldName = 'VL_SOLICITADO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Caption = 'Valor Solicitado (R$)'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 124
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 730
        Height = 166
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label3: TLabel
          Left = 12
          Top = 9
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
        object Label4: TLabel
          Left = 12
          Top = 46
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
        object Label5: TLabel
          Left = 12
          Top = 121
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
        object Label7: TLabel
          Left = 416
          Top = 9
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
        object Label8: TLabel
          Left = 416
          Top = 46
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
        object btn_co_unidade: TSpeedButton
          Left = 377
          Top = 22
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
          OnClick = btn_co_unidadeClick
        end
        object btn_co_produto: TSpeedButton
          Left = 377
          Top = 59
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
          OnClick = btn_co_produtoClick
        end
        object btn_co_cliente: TSpeedButton
          Left = 377
          Top = 134
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
          OnClick = btn_co_clienteClick
        end
        object btn_co_processo: TSpeedButton
          Left = 536
          Top = 21
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
        object Label25: TLabel
          Left = 12
          Top = 84
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
        object SpeedButton2: TSpeedButton
          Left = 377
          Top = 97
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
          OnClick = SpeedButton2Click
        end
        object edt_nm_unid_neg2: TEdit
          Left = 59
          Top = 22
          Width = 317
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 1
        end
        object edt_nm_produto2: TEdit
          Left = 59
          Top = 59
          Width = 317
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 4
        end
        object edt_nm_cliente: TEdit
          Left = 59
          Top = 134
          Width = 317
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 10
        end
        object msk_processo: TMaskEdit
          Left = 417
          Top = 22
          Width = 118
          Height = 21
          TabOrder = 2
          OnExit = msk_processoExit
        end
        object msk_valor: TMaskEdit
          Left = 417
          Top = 59
          Width = 97
          Height = 21
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          TabOrder = 5
          OnChange = msk_valorChange
          OnExit = msk_valorExit
        end
        object rdgp_tp_servico: TRadioGroup
          Left = 417
          Top = 91
          Width = 145
          Height = 64
          Caption = 'Classifica'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'Desembara'#231'o'
            'FI')
          ParentFont = False
          TabOrder = 6
          OnClick = rdgp_tp_servicoClick
        end
        object msk_cd_unid_neg2: TMaskEdit
          Left = 12
          Top = 22
          Width = 48
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 0
          OnChange = msk_cd_unid_neg2Change
          OnExit = msk_cd_unid_neg2Exit
          OnKeyDown = dbedt_cd_bco_agKeyDown
        end
        object msk_cd_produto2: TMaskEdit
          Left = 12
          Top = 59
          Width = 48
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 3
          OnChange = msk_cd_produto2Change
          OnExit = msk_cd_produto2Exit
          OnKeyDown = dbedt_cd_bco_agKeyDown
        end
        object msk_cd_cliente: TMaskEdit
          Left = 12
          Top = 134
          Width = 48
          Height = 21
          EditMask = '99999;0; '
          MaxLength = 5
          TabOrder = 9
          OnChange = msk_cd_clienteChange
          OnExit = msk_cd_clienteExit
          OnKeyDown = dbedt_cd_bco_agKeyDown
        end
        object Edit2: TEdit
          Left = 59
          Top = 97
          Width = 317
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 8
        end
        object MaskEdit2: TMaskEdit
          Left = 12
          Top = 97
          Width = 48
          Height = 21
          EditMask = '999;0; '
          MaxLength = 3
          TabOrder = 7
          OnChange = SpeedButton2Click
          OnExit = MaskEdit2Exit
          OnKeyDown = dbedt_cd_bco_agKeyDown
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 166
        Width = 730
        Height = 4
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
      end
    end
    object ts_rec_desemb: TTabSheet
      Caption = 'Recebimento'
      ImageIndex = 1
      DesignSize = (
        734
        429)
      object pnl_tarifariao_desembaraco: TPanel
        Left = 186
        Top = 72
        Width = 278
        Height = 137
        TabOrder = 2
        object DBGrid1: TDBGrid
          Left = 8
          Top = 8
          Width = 263
          Height = 77
          DataSource = datm_recebimento_ag.ds_moeda_tarifario
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_MOEDA'
              ReadOnly = True
              Title.Caption = 'C'#243'd.'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Look_nm_moeda'
              ReadOnly = True
              Title.Caption = 'Moeda'
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
              Color = clMenu
              Expanded = False
              FieldName = 'VL_TARIFARIO'
              ReadOnly = True
              Title.Caption = 'Tarif'#225'rio'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_MANUAL'
              Title.Caption = 'Taxa Manual'
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
        object Button1: TButton
          Left = 43
          Top = 96
          Width = 75
          Height = 25
          Caption = 'OK'
          TabOrder = 1
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 151
          Top = 97
          Width = 75
          Height = 25
          Caption = 'Sair'
          TabOrder = 2
          OnClick = Button2Click
        end
      end
      object dbg_numerario: TDBGrid
        Left = 0
        Top = 57
        Width = 734
        Height = 106
        Align = alTop
        DataSource = datm_recebimento_ag.ds_recb_processo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
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
            FieldName = 'NR_RECEBIMENTO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Nr Receb.'
            Title.Color = clBlack
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_processo'
            ReadOnly = True
            Title.Caption = 'Processo'
            Title.Color = clBlack
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_SOLICITADO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'V. Solicitado'
            Title.Color = clBlack
            Width = 81
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VL_UTILIZADO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'V. Receber'
            Title.Color = clBlack
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'V. Recebido'
            Title.Color = clBlack
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_ADICIONAL'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'V. Adicional'
            Title.Color = clBlack
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_PRIORIDADE'
            Title.Caption = 'Prioridade'
            Title.Color = clBlack
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            ReadOnly = True
            Title.Caption = 'Status'
            Title.Color = clBlack
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_TARIFARIO'
            Title.Caption = 'Tarif'#225'rio'
            Title.Color = clBlack
            Width = 74
            Visible = True
          end>
      end
      object dbgrid_item_des: TDBGrid
        Left = 0
        Top = 163
        Width = 734
        Height = 207
        Align = alClient
        DataSource = datm_recebimento_ag.DDS_RECB_PROC_ITEM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 4
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
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_nm_item'
            ReadOnly = True
            Title.Caption = 'Item'
            Title.Color = clBlack
            Width = 127
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_SOLICITADO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'V. Solicitado'
            Title.Color = clBlack
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_UTILIZADO'
            ReadOnly = True
            Title.Caption = 'V. Receber'
            Title.Color = clBlack
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'V. Recebido'
            Title.Color = clBlack
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_ADICIONAL_ITEM'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'V. Adicional'
            Title.Color = clBlack
            Width = 84
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'LooK_nm_banco'
            ReadOnly = True
            Title.Caption = 'Banco'
            Title.Color = clBlack
            Width = 137
            Visible = True
          end>
      end
      object pnl_recebimento: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 57
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Shape5: TShape
          Left = 177
          Top = 6
          Width = 121
          Height = 46
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label10: TLabel
          Left = 183
          Top = 12
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label11: TLabel
          Left = 302
          Top = 12
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
        object btn_co_banco: TSpeedButton
          Left = 599
          Top = 24
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
        object Label12: TLabel
          Left = 9
          Top = 12
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Receb.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 86
          Top = 12
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
        object Label27: TLabel
          Left = 632
          Top = 12
          Width = 16
          Height = 13
          Alignment = taRightJustify
          Caption = 'FP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_recebimento: TDBEdit
          Left = 184
          Top = 25
          Width = 107
          Height = 21
          DataField = 'VL_RECEBIMENTO'
          DataSource = datm_recebimento_ag.ds_recebimento
          MaxLength = 14
          TabOrder = 2
          OnChange = dbedt_dt_receb_agChange
        end
        object dbedt_nm_banco: TDBEdit
          Left = 340
          Top = 25
          Width = 258
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_BANCO'
          DataSource = datm_recebimento_ag.ds_recebimento
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_nr_recebimento: TDBEdit
          Left = 10
          Top = 25
          Width = 73
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_RECEBIMENTO'
          DataSource = datm_recebimento_ag.ds_recebimento
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_dt_recebimento: TDBEdit
          Left = 87
          Top = 25
          Width = 84
          Height = 21
          DataField = 'DT_RECEBIMENTO'
          DataSource = datm_recebimento_ag.ds_recebimento
          TabOrder = 1
          OnChange = dbedt_dt_receb_agChange
        end
        object dbedt_cd_banco: TDBEdit
          Left = 303
          Top = 25
          Width = 37
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_recebimento_ag.ds_recebimento
          TabOrder = 3
          OnExit = dbedt_cd_bancoExit
        end
        object DBEdit10: TDBEdit
          Left = 633
          Top = 25
          Width = 91
          Height = 21
          DataField = 'NR_FP'
          DataSource = datm_recebimento_ag.ds_recebimento
          TabOrder = 5
          OnExit = dbedt_cd_bancoExit
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 370
        Width = 734
        Height = 59
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 5
        DesignSize = (
          734
          59)
        object Shape1: TShape
          Left = 232
          Top = 6
          Width = 197
          Height = 47
          Anchors = [akRight, akBottom]
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label9: TLabel
          Left = 436
          Top = 13
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'Total Calculado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 539
          Top = 13
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'Total Adicional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 632
          Top = 13
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'Total Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb_restante2: TLabel
          Left = 339
          Top = 26
          Width = 76
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 248
          Top = 25
          Width = 89
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'Valor Restante:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape2: TShape
          Left = 431
          Top = 6
          Width = 297
          Height = 47
          Anchors = [akRight, akBottom]
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object dbradgrp_in_maior2: TDBRadioGroup
          Left = 8
          Top = 4
          Width = 219
          Height = 48
          Caption = 'Recebimento Maior'
          Columns = 2
          DataField = 'IN_MAIOR'
          DataSource = datm_recebimento_ag.ds_recebimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Processo'
            'Devolu'#231#227'o')
          ParentFont = False
          TabOrder = 0
          Values.Strings = (
            '0'
            '1')
          Visible = False
          OnChange = dbedt_dt_receb_agChange
        end
        object DBEdit5: TDBEdit
          Left = 437
          Top = 26
          Width = 95
          Height = 21
          Anchors = [akRight, akBottom]
          Color = clMenu
          DataField = 'VL_TOT_UTILIZADO'
          DataSource = datm_recebimento_ag.ds_recebimento
          MaxLength = 14
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 539
          Top = 26
          Width = 89
          Height = 21
          Anchors = [akRight, akBottom]
          Color = clMenu
          DataField = 'VL_TT_ADICIONAL'
          DataSource = datm_recebimento_ag.ds_recebimento
          MaxLength = 14
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit8: TDBEdit
          Left = 635
          Top = 26
          Width = 89
          Height = 21
          Anchors = [akRight, akBottom]
          Color = clMenu
          DataField = 'VL_RECEBIMENTO'
          DataSource = datm_recebimento_ag.ds_recebimento
          MaxLength = 14
          ReadOnly = True
          TabOrder = 3
        end
      end
      object pnl_efetiva_receb_des: TPanel
        Left = 227
        Top = 124
        Width = 271
        Height = 53
        Anchors = [akLeft, akRight]
        BevelInner = bvLowered
        Color = clGray
        TabOrder = 3
        Visible = False
        DesignSize = (
          271
          53)
        object Panel8: TPanel
          Left = 5
          Top = 5
          Width = 261
          Height = 43
          Anchors = [akLeft, akRight]
          BevelInner = bvLowered
          BorderWidth = 3
          TabOrder = 0
          DesignSize = (
            261
            43)
          object lb_demostrativo_des: TLabel
            Left = 6
            Top = 15
            Width = 248
            Height = 16
            Alignment = taCenter
            Anchors = [akLeft, akRight]
            AutoSize = False
            Caption = 'Baixando.....'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
        end
      end
    end
    object ts_rec_ag: TTabSheet
      Caption = 'Recebimento Ag'
      ImageIndex = 2
      object dbgrid_proc: TDBGrid
        Left = 0
        Top = 123
        Width = 734
        Height = 63
        Align = alTop
        DataSource = datm_recebimento_ag.ds_recb_processo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
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
            FieldName = 'NR_SOLICITACAO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Solic.'
            Title.Color = clBlack
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_processo'
            ReadOnly = True
            Title.Caption = 'Processo'
            Title.Color = clBlack
            Width = 85
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_TARIFARIO'
            Title.Alignment = taCenter
            Title.Caption = 'Data Tarifario'
            Title.Color = clBlack
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_SOLICITADO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'V. Solicitado'
            Title.Color = clBlack
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'V. Recebido'
            Title.Color = clBlack
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_ADICIONAL'
            ReadOnly = True
            Title.Caption = 'Vlr Adicional'
            Title.Color = clBlack
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_tt_processo'
            ReadOnly = True
            Title.Caption = 'Total'
            Title.Color = clBlack
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            ReadOnly = True
            Title.Caption = 'Status'
            Title.Color = clBlack
            Width = 65
            Visible = True
          end>
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 186
        Width = 734
        Height = 183
        Align = alClient
        DataSource = datm_recebimento_ag.DDS_RECB_PROC_ITEM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 3
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
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Look_nm_item'
            ReadOnly = True
            Title.Caption = 'Item'
            Title.Color = clBlack
            Width = 199
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_MOEDA_VENDA'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Width = 31
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Look_nm_moeda'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Moeda'
            Title.Color = clBlack
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_VENDA'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Vl Venda'
            Title.Color = clBlack
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_SOLICITADO'
            ReadOnly = True
            Title.Caption = 'Vlr Cobrado(R$)'
            Title.Color = clBlack
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr Recebido'
            Title.Color = clBlack
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_ADICIONAL_ITEM'
            Title.Caption = 'Vl Adicional'
            Title.Color = clBlack
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LooK_nm_banco'
            Title.Caption = 'Banco'
            Title.Color = clBlack
            Visible = False
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 123
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object Label14: TLabel
          Left = 9
          Top = 42
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
        object btn_co_bco_ag: TSpeedButton
          Left = 230
          Top = 55
          Width = 23
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
          OnClick = btn_co_bco_agClick
        end
        object Label15: TLabel
          Left = 9
          Top = 6
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Receb.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 87
          Top = 6
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Recebimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 167
          Top = 6
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 9
          Top = 79
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nr Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 132
          Top = 79
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt Faturamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 267
          Top = 6
          Width = 305
          Height = 13
          Caption = 'Para receber com uma taxa especifica, inclua abaixo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nm_bco_ag: TDBEdit
          Left = 45
          Top = 55
          Width = 184
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_BANCO'
          DataSource = datm_recebimento_ag.ds_recebimento
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit4: TDBEdit
          Left = 10
          Top = 19
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_RECEBIMENTO'
          DataSource = datm_recebimento_ag.ds_recebimento
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_dt_receb_ag: TDBEdit
          Left = 91
          Top = 19
          Width = 74
          Height = 21
          DataField = 'DT_RECEBIMENTO'
          DataSource = datm_recebimento_ag.ds_recebimento
          TabOrder = 1
          OnChange = dbedt_dt_receb_agChange
        end
        object DBEdit1: TDBEdit
          Left = 167
          Top = 19
          Width = 98
          Height = 21
          DataField = 'VL_RECEBIMENTO'
          DataSource = datm_recebimento_ag.ds_recebimento
          MaxLength = 14
          TabOrder = 2
          OnChange = dbedt_dt_receb_agChange
        end
        object DBEdit9: TDBEdit
          Left = 10
          Top = 92
          Width = 109
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_FATURA'
          DataSource = datm_recebimento_ag.ds_recebimento
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_dt_fatura: TDBEdit
          Left = 132
          Top = 92
          Width = 93
          Height = 21
          TabStop = False
          DataField = 'DT_FATURA'
          DataSource = datm_recebimento_ag.ds_recebimento
          TabOrder = 7
        end
        object dbedt_cd_bco_ag: TDBEdit
          Left = 10
          Top = 55
          Width = 36
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_recebimento_ag.ds_recebimento
          TabOrder = 4
          OnChange = dbedt_dt_receb_agChange
          OnExit = dbedt_cd_bco_agExit
          OnKeyDown = dbedt_cd_bco_agKeyDown
        end
        object dbgrd1: TDBGrid
          Left = 268
          Top = 19
          Width = 457
          Height = 95
          Ctl3D = False
          DataSource = datm_recebimento_ag.ds_moeda_tarifario
          ParentCtl3D = False
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_MOEDA'
              Title.Caption = 'C'#243'd.'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Look_nm_moeda'
              Title.Caption = 'Moeda'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 237
              Visible = True
            end
            item
              Color = clSilver
              Expanded = False
              FieldName = 'VL_TARIFARIO'
              ReadOnly = True
              Title.Caption = 'Tarif'#225'rio'
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
              FieldName = 'VL_MANUAL'
              Title.Caption = 'Vl. Manual'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 69
              Visible = True
            end>
        end
      end
      object pnl_efetiva_receb_ag: TPanel
        Left = 231
        Top = 145
        Width = 270
        Height = 37
        Color = clGray
        TabOrder = 2
        Visible = False
        object Panel3: TPanel
          Left = 6
          Top = 6
          Width = 259
          Height = 26
          BevelInner = bvLowered
          TabOrder = 0
          object lb_demostrativo: TLabel
            Left = 4
            Top = 7
            Width = 251
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Baixando.....'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 369
        Width = 734
        Height = 60
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 4
        object Shape3: TShape
          Left = 232
          Top = 6
          Width = 197
          Height = 47
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape4: TShape
          Left = 431
          Top = 6
          Width = 297
          Height = 47
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label17: TLabel
          Left = 436
          Top = 12
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Calculado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 632
          Top = 12
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 536
          Top = 12
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Adicional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 251
          Top = 25
          Width = 89
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Restante:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb_restante: TLabel
          Left = 342
          Top = 25
          Width = 69
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbradgrp_in_maior: TDBRadioGroup
          Left = 8
          Top = 3
          Width = 219
          Height = 50
          Caption = ' Recebimento Maior '
          Columns = 2
          DataField = 'IN_MAIOR'
          DataSource = datm_recebimento_ag.ds_recebimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Processo'
            'Devolu'#231#227'o')
          ParentFont = False
          TabOrder = 0
          Values.Strings = (
            '0'
            '1')
          Visible = False
          OnChange = dbedt_dt_receb_agChange
        end
        object DBEdit7: TDBEdit
          Left = 437
          Top = 26
          Width = 95
          Height = 21
          Color = clMenu
          DataField = 'VL_TOT_RECEBIDO'
          DataSource = datm_recebimento_ag.ds_recebimento
          MaxLength = 14
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Left = 633
          Top = 26
          Width = 89
          Height = 21
          Color = clMenu
          DataField = 'VL_RECEBIMENTO'
          DataSource = datm_recebimento_ag.ds_recebimento
          MaxLength = 14
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit3: TDBEdit
          Left = 538
          Top = 26
          Width = 89
          Height = 21
          Color = clMenu
          DataField = 'VL_TT_ADICIONAL'
          DataSource = datm_recebimento_ag.ds_recebimento
          MaxLength = 14
          ReadOnly = True
          TabOrder = 2
        end
      end
    end
  end
  object pnlDevolucao: TPanel
    Left = 166
    Top = 283
    Width = 399
    Height = 191
    BevelInner = bvLowered
    BorderWidth = 4
    TabOrder = 2
    Visible = False
    object Shape9: TShape
      Left = 13
      Top = 40
      Width = 372
      Height = 93
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Shape11: TShape
      Left = 140
      Top = 51
      Width = 235
      Height = 70
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Shape7: TShape
      Left = 8
      Top = 8
      Width = 380
      Height = 23
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Shape8: TShape
      Left = 10
      Top = 10
      Width = 380
      Height = 23
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object SpeedButton3: TSpeedButton
      Left = 312
      Top = 148
      Width = 73
      Height = 29
      Caption = 'Fechar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      ParentFont = False
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 238
      Top = 148
      Width = 73
      Height = 29
      Caption = 'Devolver'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton4Click
    end
    object Bevel1: TBevel
      Left = 13
      Top = 139
      Width = 372
      Height = 2
    end
    object Label36: TLabel
      Left = 14
      Top = 15
      Width = 141
      Height = 13
      Caption = 'Devolu'#231#227'o de Numer'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label38: TLabel
      Left = 22
      Top = 47
      Width = 47
      Height = 13
      Caption = 'Processo:'
    end
    object Label40: TLabel
      Left = 22
      Top = 89
      Width = 73
      Height = 13
      Caption = 'Valor Recebido'
    end
    object Label41: TLabel
      Left = 156
      Top = 68
      Width = 79
      Height = 13
      Caption = 'Valor a Devolver'
    end
    object lbl1: TLabel
      Left = 260
      Top = 68
      Width = 93
      Height = 13
      Caption = 'Data da Devolu'#231#227'o'
    end
    object edtProcesso: TEdit
      Left = 22
      Top = 60
      Width = 99
      Height = 21
      AutoSize = False
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtValorRecebido: TEdit
      Left = 22
      Top = 102
      Width = 99
      Height = 21
      AutoSize = False
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtValorDevolver: TEdit
      Left = 156
      Top = 81
      Width = 99
      Height = 22
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvNone
      Color = clWhite
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      OnExit = edtValorDevolverExit
    end
    object medt1: TMaskEdit
      Left = 260
      Top = 81
      Width = 97
      Height = 22
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 3
      Text = '  /  /    '
    end
  end
  object MainMenu1: TMainMenu
    Left = 636
    Top = 353
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
    object mi_receber: TMenuItem
      Caption = 'Rece&ber'
      OnClick = btn_receberClick
    end
    object mi_baixar_receb: TMenuItem
      Caption = '&Baixar Recebimento'
      Enabled = False
      OnClick = btn_efetuarClick
    end
    object mi_Pesquisar: TMenuItem
      Caption = '&Pesquisar'
    end
    object mi_atz_tarifa: TMenuItem
      Caption = '&Atualizar Tarifas'
      Enabled = False
      OnClick = btn_aplic_tarifarioClick
    end
    object mi_canc_receb: TMenuItem
      Caption = 'Canc. R&ecebimento'
      Enabled = False
      OnClick = btn_canc_recebClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object popmenu_lista_rel: TPopupMenu
    Left = 644
    Top = 290
    object mi_fat: TMenuItem
      Caption = 'Fatura'
      OnClick = mi_fatClick
    end
    object mi_recibo: TMenuItem
      Caption = 'Recibo'
      OnClick = mi_reciboClick
    end
  end
  object popFinalizarRecebimento: TPopupMenu
    Left = 84
    Top = 343
    object FinalizarRecebimento1: TMenuItem
      Caption = '&Finalizar Recebimento'
      OnClick = FinalizarRecebimento1Click
    end
  end
end
