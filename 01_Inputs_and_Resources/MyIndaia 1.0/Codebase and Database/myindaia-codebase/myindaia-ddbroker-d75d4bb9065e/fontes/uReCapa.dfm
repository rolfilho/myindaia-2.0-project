object frm_re_capa: Tfrm_re_capa
  Left = 274
  Top = 159
  Width = 816
  Height = 650
  Caption = 'Registro de Exporta'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 44
    Align = alTop
    BevelInner = bvLowered
    Color = clSilver
    TabOrder = 1
    DesignSize = (
      800
      44)
    object Shape37: TShape
      Left = 397
      Top = 5
      Width = 113
      Height = 33
      Anchors = [akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 3
      Width = 35
      Height = 38
      Hint = 'Novo'
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
    object btn_salvar: TSpeedButton
      Left = 39
      Top = 3
      Width = 35
      Height = 38
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
      Left = 74
      Top = 3
      Width = 36
      Height = 38
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
    object btn_excluir: TSpeedButton
      Left = 110
      Top = 3
      Width = 35
      Height = 38
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
    object btn_sair: TSpeedButton
      Left = 294
      Top = 3
      Width = 33
      Height = 38
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
    object Shape1: TShape
      Left = 624
      Top = 5
      Width = 170
      Height = 33
      Anchors = [akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object btn_classifica: TSpeedButton
      Left = 401
      Top = 9
      Width = 106
      Height = 26
      Hint = 'Reclassifica'#231#227'o dos Itens'
      Anchors = [akTop, akRight]
      Caption = 'Classificar Itens'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      OnClick = btn_classificaClick
    end
    object SpeedButton1: TSpeedButton
      Left = 146
      Top = 3
      Width = 35
      Height = 38
      Hint = 'Gera arquivo para Siscomex'
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
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 181
      Top = 3
      Width = 34
      Height = 38
      Hint = 'Consulta RE (SISCOMEX)'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object SpeedButton4: TSpeedButton
      Left = 249
      Top = 3
      Width = 34
      Height = 38
      Hint = 'Consulta'
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
      Visible = False
      OnClick = SpeedButton4Click
    end
    object SpeedButton8: TSpeedButton
      Left = 215
      Top = 3
      Width = 34
      Height = 38
      Hint = 'Extrato RE'
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
      OnClick = SpeedButton8Click
    end
    object noteNavegacao: TNotebook
      Left = 632
      Top = 6
      Width = 154
      Height = 29
      Anchors = [akTop, akRight]
      PageIndex = 2
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Anexo'
        DesignSize = (
          154
          29)
        object Shape6: TShape
          Left = 107
          Top = 2
          Width = 85
          Height = 25
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object dbAnexo: TDBText
          Left = 112
          Top = 9
          Width = 28
          Height = 13
          Cursor = crHandPoint
          Hint = 'Clique para posicionar-se em outro Anexo.'
          Alignment = taCenter
          Color = 15790320
          DataField = 'CD_RE_ANEXO'
          DataSource = datm_re_capa.ds_re_anexo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          Transparent = False
          ShowHint = True
          OnClick = dbAnexoClick
        end
        object Label2: TLabel
          Left = 147
          Top = 8
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblQtTotalAnexos: TLabel
          Left = 160
          Top = 9
          Width = 28
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = '0'
        end
        object DBNavigator1: TDBNavigator
          Left = 195
          Top = 5
          Width = 88
          Height = 20
          DataSource = datm_re_capa.ds_re_anexo
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Flat = True
          TabOrder = 0
        end
        object edt_anexo: TEdit
          Left = -20
          Top = 6
          Width = 31
          Height = 17
          Anchors = [akTop, akRight]
          AutoSize = False
          Color = clWhite
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          Visible = False
          OnExit = edt_anexoExit
          OnKeyPress = edt_anexoKeyPress
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Capa'
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Lista'
        object Label72: TLabel
          Left = 13
          Top = 8
          Width = 38
          Height = 13
          Caption = 'Ordenar'
        end
        object cb_ordem: TComboBox
          Left = 53
          Top = 4
          Width = 94
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = cb_ordemChange
          OnClick = cb_ordemClick
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 44
    Width = 800
    Height = 568
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 0
    DesignSize = (
      800
      568)
    object pgRe: TPageControl
      Left = 2
      Top = 2
      Width = 796
      Height = 564
      ActivePage = tabLista
      Align = alClient
      TabOrder = 0
      OnChange = pgReChange
      OnChanging = pgReChanging
      object tabLista: TTabSheet
        BorderWidth = 4
        Caption = 'Lista'
        object ntbHistorico: TNotebook
          Left = 0
          Top = 0
          Width = 780
          Height = 528
          Align = alClient
          TabOrder = 0
          OnExit = ntbHistoricoExit
          object TPage
            Left = 0
            Top = 0
            Caption = 'ntbSituacao'
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 780
              Height = 157
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                780
                157)
              object shpSituacao: TShape
                Left = 213
                Top = 0
                Width = 536
                Height = 39
                Anchors = [akLeft, akTop, akRight]
                Brush.Color = 13027009
                Pen.Color = 9737364
              end
              object lblSituacao: TDBText
                Left = 218
                Top = 20
                Width = 361
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                DataField = 'TX_SITUACAO_RE'
                DataSource = datm_re_capa.ds_re_capa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clTeal
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                WordWrap = True
              end
              object Bevel1: TBevel
                Left = 0
                Top = 0
                Width = 176
                Height = 39
                Shape = bsFrame
                Style = bsRaised
              end
              object Label43: TLabel
                Left = 8
                Top = 2
                Width = 43
                Height = 13
                Caption = 'Unidade:'
              end
              object btn_co_unidade: TSpeedButton
                Left = 147
                Top = 15
                Width = 25
                Height = 22
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
                OnClick = btn_co_unidadeClick
              end
              object lblTitSituacao: TLabel
                Left = 220
                Top = 4
                Width = 228
                Height = 18
                AutoSize = False
                Caption = 'Situa'#231#227'o do RE (                            )'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object lblDataSituacao: TDBText
                Left = 318
                Top = 5
                Width = 112
                Height = 13
                Alignment = taCenter
                DataField = 'DT_ULT_CONSULTA'
                DataSource = datm_re_capa.ds_re_capa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clTeal
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Label84: TLabel
                Left = 570
                Top = 2
                Width = 37
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'Produto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Visible = False
              end
              object btn_co_produto: TSpeedButton
                Left = 714
                Top = 15
                Width = 30
                Height = 22
                Anchors = [akTop, akRight]
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
                OnClick = btn_co_produtoClick
              end
              object edt_nm_unidade: TEdit
                Left = 42
                Top = 15
                Width = 104
                Height = 21
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
                TabOrder = 1
              end
              object Panel9: TPanel
                Left = 0
                Top = 0
                Width = 3
                Height = 157
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 2
              end
              object edt_nm_produto: TEdit
                Left = 603
                Top = 15
                Width = 103
                Height = 21
                TabStop = False
                Anchors = [akTop, akRight]
                Color = clMenu
                ReadOnly = True
                TabOrder = 4
                Visible = False
              end
              object edt_cd_unidade: TEdit
                Left = 8
                Top = 15
                Width = 35
                Height = 21
                MaxLength = 2
                TabOrder = 0
                OnChange = btn_co_unidadeClick
                OnEnter = edt_cd_unidadeEnter
                OnExit = edt_cd_unidadeExit
                OnKeyDown = edt_cd_unidadeKeyDown
              end
              object msk_cd_produto: TMaskEdit
                Left = 571
                Top = 15
                Width = 32
                Height = 21
                Anchors = [akTop, akRight]
                Color = clWhite
                EditMask = '!99;0; '
                MaxLength = 2
                TabOrder = 3
                Visible = False
                OnEnter = msk_cd_produtoEnter
                OnExit = msk_cd_produtoExit
                OnKeyDown = msk_cd_produtoKeyDown
              end
              object Panel15: TPanel
                Left = 0
                Top = 61
                Width = 780
                Height = 95
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 5
                object Label90: TLabel
                  Left = 264
                  Top = 72
                  Width = 14
                  Height = 13
                  Caption = 'De'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label91: TLabel
                  Left = 360
                  Top = 72
                  Width = 16
                  Height = 13
                  Caption = 'At'#233
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lblDataConsulta: TLabel
                  Left = 265
                  Top = 49
                  Width = 65
                  Height = 13
                  Caption = 'Data Registro'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label92: TLabel
                  Left = 676
                  Top = 40
                  Width = 61
                  Height = 13
                  Caption = 'Qt. Registros'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label71: TLabel
                  Left = 15
                  Top = 49
                  Width = 44
                  Height = 13
                  Caption = 'Processo'
                end
                object Label93: TLabel
                  Left = 136
                  Top = 49
                  Width = 53
                  Height = 13
                  Caption = 'Nr Registro'
                end
                object lblExportador: TLabel
                  Left = 15
                  Top = 8
                  Width = 51
                  Height = 13
                  Caption = 'Exportador'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lblLimpar: TLabel
                  Left = 358
                  Top = 12
                  Width = 74
                  Height = 13
                  Caption = 'Ctrl Para Limpar'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object cbRegistrados: TCheckBox
                  Left = 474
                  Top = 72
                  Width = 124
                  Height = 13
                  Caption = 'Exibir Registrados'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = cbRegistradosClick
                end
                object ck_ult_proc: TCheckBox
                  Left = 444
                  Top = 29
                  Width = 124
                  Height = 13
                  Caption = #218'ltimos Processos'
                  Checked = True
                  Ctl3D = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentCtl3D = False
                  ParentFont = False
                  State = cbChecked
                  TabOrder = 1
                  OnClick = ck_ult_procClick
                end
                object edtDataConsultaInicial: TMaskEdit
                  Left = 284
                  Top = 64
                  Width = 67
                  Height = 21
                  EditMask = '!99/99/9999;1;_'
                  MaxLength = 10
                  TabOrder = 2
                  Text = '  /  /    '
                  OnExit = edtDataConsultaInicialExit
                end
                object edtDataConsultaFinal: TMaskEdit
                  Left = 381
                  Top = 64
                  Width = 69
                  Height = 21
                  EditMask = '!99/99/9999;1;_'
                  MaxLength = 10
                  TabOrder = 3
                  Text = '  /  /    '
                  OnExit = edtDataConsultaFinalExit
                end
                object edrQtRegistros: TEdit
                  Left = 689
                  Top = 59
                  Width = 35
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  MaxLength = 4
                  ParentFont = False
                  TabOrder = 4
                  Text = '100'
                  OnKeyPress = edrQtRegistrosKeyPress
                end
                object btnPesquisar: TBitBtn
                  Left = 662
                  Top = 12
                  Width = 86
                  Height = 26
                  Caption = 'Buscar'
                  TabOrder = 5
                  OnClick = btnPesquisarClick
                  Glyph.Data = {
                    52020000424D5202000000000000520100002800000010000000100000000100
                    08000000000000010000340B0000340B00004700000047000000405058009860
                    580031486000EAAB6A00A17373008F7B7300B67B7300A1847300AB847300F4AB
                    7300AB7B7B00B67B7B00C07B7B00B6847B00C0987B00F4C07B00B68F8400C08F
                    8400CA8F8400B6988400C0988400CA988400F4C08400F4CA840031608F00C098
                    8F00CAA18F00D4AB8F00F4CA8F00D4AB9800D4B69800E0B69800FFD49800FFE0
                    9800C0A1A100F4D4A100F4E0A100FFE0A100FFEAA100CAABAB00D4CAAB00E0D4
                    AB00FFE0AB005084B600EAD4B600FFEAB600FFF4B600F4E0C000FFF4C000F4EA
                    CA00F4F4CA00FFF4CA00FFFFCA00116AD400F4F4D400FFFFD4000B6AE0000B73
                    E000FFFFE0000B73EA001173EA00A1CAEA00F4F4EA00FFF4EA00FFFFEA00FFFF
                    F400FF00FF0031A1FF0038A1FF0038ABFF00FFFFFF0042020A42424242424242
                    4242424242422B39180B42424242424242424242424243443C180B4242424242
                    42424242424242444438180B424242424242424242424242444339180A424242
                    424242424242424242444335004201101A114242424242424242453D05072F34
                    3434291942424242424242221A2D34343437403E0442424242424206231C3034
                    37404146284242424242421B210F30373A414140310D42424242421F20032434
                    373A3A37321342424242421D25030F2D37373737311042424242420D2D2D1C16
                    2430333429424242424242421E463F0F0316252E08424242424242424227312D
                    21252314424242424242424242420E141B1B42424242}
                end
                object edtExportador: TEdit
                  Left = 16
                  Top = 24
                  Width = 41
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  MaxLength = 5
                  ParentFont = False
                  TabOrder = 6
                  OnExit = edtExportadorExit
                  OnKeyDown = edtExportadorKeyDown
                end
                object cbExportador: TDBLookupComboBox
                  Left = 61
                  Top = 25
                  Width = 374
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  KeyField = 'CD_GRUPO'
                  ListField = 'NM_GRUPO'
                  ListSource = datm_re_capa.dsGrupo
                  ParentFont = False
                  TabOrder = 7
                  OnCloseUp = cbExportadorCloseUp
                  OnExit = cbExportadorExit
                  OnKeyDown = cbExportadorKeyDown
                end
                object mskNrProcesso: TMaskEdit
                  Left = 16
                  Top = 64
                  Width = 93
                  Height = 21
                  MaxLength = 20
                  TabOrder = 8
                end
                object mskNrRegistro: TMaskEdit
                  Left = 137
                  Top = 64
                  Width = 91
                  Height = 21
                  EditMask = '99/9999999-999;1;_'
                  MaxLength = 14
                  TabOrder = 9
                  Text = '  /       -   '
                end
              end
            end
            object DBGrid1: TDBGrid
              Left = 0
              Top = 160
              Width = 780
              Height = 368
              Align = alClient
              Ctl3D = False
              DataSource = datm_re_capa.ds_re_capa
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentCtl3D = False
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnDblClick = DBGrid1DblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'PROCESSO_REDUZIDO_COMPLEMENTO'
                  Title.Caption = 'Processo'
                  Width = 110
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Color = 16440779
                  Expanded = False
                  FieldName = 'NR_RE_SISCOMEX'
                  Title.Caption = 'N'#250'mero do Registro'
                  Width = 101
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DT_DATA'
                  Title.Caption = 'Data do Registro'
                  Width = 116
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EXPORTADOR'
                  Title.Caption = 'Exportador'
                  Width = 216
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DT_DATA_RE'
                  Title.Caption = 'Data de Abertura'
                  Width = 115
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IMPORTADOR'
                  Title.Caption = 'Importador'
                  Visible = True
                end>
            end
            object Panel3: TPanel
              Left = 0
              Top = 157
              Width = 780
              Height = 3
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 2
            end
            object captura_telas: TMemo
              Left = 11
              Top = 456
              Width = 653
              Height = 31
              TabOrder = 3
              Visible = False
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'ntbVisualizacao'
            object Shape52: TShape
              Left = 0
              Top = 419
              Width = 722
              Height = 25
              Align = alBottom
              Brush.Color = clSilver
              Pen.Color = clGray
            end
            object DBText4: TDBText
              Left = 5
              Top = 393
              Width = 428
              Height = 14
              DataField = 'TX_SITUACAO_RE'
              DataSource = datm_re_capa.ds_re_capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object DBText6: TDBText
              Left = 541
              Top = 393
              Width = 130
              Height = 14
              Alignment = taRightJustify
              DataField = 'DT_DATA'
              DataSource = datm_re_capa.ds_re_capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Shape53: TShape
              Left = 0
              Top = 36
              Width = 722
              Height = 383
              Align = alClient
              Brush.Color = clSilver
              Pen.Color = clGray
            end
            object Shape54: TShape
              Left = 0
              Top = 36
              Width = 722
              Height = 383
              Align = alClient
              Brush.Color = clBlack
              Pen.Color = clGray
            end
            object Panel14: TPanel
              Left = 0
              Top = 0
              Width = 722
              Height = 36
              Align = alTop
              BevelInner = bvLowered
              Color = clSilver
              TabOrder = 0
              object SpeedButton5: TSpeedButton
                Left = 35
                Top = 5
                Width = 29
                Height = 26
                Hint = 'Imprimir Tela'
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
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
                OnClick = SpeedButton5Click
              end
              object SpeedButton6: TSpeedButton
                Left = 6
                Top = 5
                Width = 29
                Height = 26
                Hint = 'Gravar altera'#231#245'es'
                Enabled = False
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
                  7700333333337777777733333333008088003333333377F73377333333330088
                  88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
                  000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
                  FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
                  99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
                  99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
                  99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
                  93337FFFF7737777733300000033333333337777773333333333}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton6Click
              end
              object SpeedButton7: TSpeedButton
                Left = 689
                Top = 5
                Width = 27
                Height = 26
                Hint = 'Voltar para listagem'
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333FF3333333333333003333333333333F77F33333333333009033
                  333333333F7737F333333333009990333333333F773337FFFFFF330099999000
                  00003F773333377777770099999999999990773FF33333FFFFF7330099999000
                  000033773FF33777777733330099903333333333773FF7F33333333333009033
                  33333333337737F3333333333333003333333333333377333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton7Click
              end
            end
            object DBMemo3: TDBMemo
              Left = 32
              Top = 51
              Width = 670
              Height = 345
              BorderStyle = bsNone
              Color = clBlack
              DataField = 'TX_DOCUMENTO_SISCOMEX'
              DataSource = datm_re_capa.ds_re_capa
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Fixedsys'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 1
            end
          end
        end
        object btnRetornoRE: TBitBtn
          Left = 213
          Top = 41
          Width = 92
          Height = 17
          Hint = 'Gera Retorno das RE'#39's Registradas Hoje '
          Caption = 'Gera Retorno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Visible = False
          OnClick = btnRetornoREClick
          Layout = blGlyphRight
        end
      end
      object tabReBasicas: TTabSheet
        Caption = 'Informa'#231#245'es B'#225'sicas'
        ImageIndex = 1
        DesignSize = (
          788
          536)
        object Shape40: TShape
          Left = 2
          Top = 3
          Width = 785
          Height = 30
          Anchors = [akLeft, akTop, akRight]
          Brush.Color = clSilver
        end
        object btnImportarDados: TSpeedButton
          Left = 552
          Top = 7
          Width = 188
          Height = 23
          Caption = 'Importar dados de outro processo'
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
          OnClick = btnImportarDadosClick
        end
        object Shape2: TShape
          Left = 2
          Top = 34
          Width = 785
          Height = 74
          Anchors = [akLeft, akTop, akRight]
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape4: TShape
          Left = 2
          Top = 257
          Width = 785
          Height = 256
          Anchors = [akLeft, akTop, akRight]
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape3: TShape
          Left = 2
          Top = 130
          Width = 785
          Height = 126
          Anchors = [akLeft, akTop, akRight]
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape16: TShape
          Left = 2
          Top = 109
          Width = 785
          Height = 20
          Anchors = [akLeft, akTop, akRight]
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Shape29: TShape
          Left = 2
          Top = 130
          Width = 725
          Height = 31
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label4: TLabel
          Left = 7
          Top = 43
          Width = 55
          Height = 13
          Caption = 'N'#250'mero RE'
          FocusControl = DBEdit3
        end
        object Label5: TLabel
          Left = 265
          Top = 43
          Width = 75
          Height = 13
          Caption = 'Situa'#231#227'o do RE'
          FocusControl = DBEdit4
        end
        object Label6: TLabel
          Left = 104
          Top = 138
          Width = 9
          Height = 13
          Caption = '1-'
          FocusControl = edt_cd_enquad1
        end
        object Label7: TLabel
          Left = 208
          Top = 138
          Width = 9
          Height = 13
          Caption = '2-'
          FocusControl = edt_cd_enquad2
        end
        object Label8: TLabel
          Left = 312
          Top = 138
          Width = 9
          Height = 13
          Caption = '3-'
          FocusControl = edt_cd_enquad3
        end
        object Label9: TLabel
          Left = 416
          Top = 138
          Width = 9
          Height = 13
          Caption = '4-'
          FocusControl = edt_cd_enquad4
        end
        object Label10: TLabel
          Left = 520
          Top = 138
          Width = 9
          Height = 13
          Caption = '5-'
          FocusControl = edt_cd_enquad5
        end
        object Label11: TLabel
          Left = 624
          Top = 138
          Width = 9
          Height = 13
          Caption = '6-'
          FocusControl = edt_cd_enquad6
        end
        object btn_co_enquad1: TSpeedButton
          Left = 170
          Top = 135
          Width = 25
          Height = 22
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
          OnClick = btn_co_enquad1Click
        end
        object btn_co_enquad2: TSpeedButton
          Left = 274
          Top = 135
          Width = 25
          Height = 22
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
          OnClick = btn_co_enquad2Click
        end
        object btn_co_enquad4: TSpeedButton
          Left = 482
          Top = 135
          Width = 25
          Height = 22
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
          OnClick = btn_co_enquad4Click
        end
        object btn_co_enquad3: TSpeedButton
          Left = 378
          Top = 135
          Width = 25
          Height = 22
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
          OnClick = btn_co_enquad3Click
        end
        object btn_co_enquad5: TSpeedButton
          Left = 586
          Top = 135
          Width = 25
          Height = 22
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
          OnClick = btn_co_enquad5Click
        end
        object btn_co_enquad6: TSpeedButton
          Left = 690
          Top = 135
          Width = 25
          Height = 22
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
          OnClick = btn_co_enquad6Click
        end
        object Label12: TLabel
          Left = 11
          Top = 113
          Width = 161
          Height = 13
          Caption = '02 - Enquadramento da Opera'#231#227'o'
          Transparent = True
        end
        object Label13: TLabel
          Left = 11
          Top = 288
          Width = 94
          Height = 13
          Caption = '04 - URF Embarque'
          FocusControl = edt_cd_urf_embarque
        end
        object Label14: TLabel
          Left = 11
          Top = 267
          Width = 95
          Height = 13
          Caption = '03 - URF Despacho'
          FocusControl = edt_cd_urf_despacho
        end
        object btn_co_urf_despacho: TSpeedButton
          Left = 695
          Top = 264
          Width = 25
          Height = 22
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
          OnClick = btn_co_urf_despachoClick
        end
        object btn_co_urf_embarque: TSpeedButton
          Left = 695
          Top = 286
          Width = 25
          Height = 22
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
          OnClick = btn_co_urf_embarqueClick
        end
        object Label15: TLabel
          Left = 12
          Top = 311
          Width = 71
          Height = 13
          Caption = '05 - Importador'
          FocusControl = edt_cd_importador
        end
        object btn_co_importador: TSpeedButton
          Left = 695
          Top = 308
          Width = 25
          Height = 22
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
          OnClick = btn_co_importadorClick
        end
        object Label16: TLabel
          Left = 24
          Top = 169
          Width = 70
          Height = 13
          Caption = 'b - N'#250'mero RV'
          FocusControl = DBEdit14
        end
        object Label17: TLabel
          Left = 24
          Top = 190
          Width = 70
          Height = 13
          Caption = 'c - N'#250'mero RC'
          FocusControl = DBEdit15
        end
        object Label18: TLabel
          Left = 24
          Top = 211
          Width = 120
          Height = 13
          Caption = 'd - GE/RE/DE Vinculado'
          FocusControl = DBEdit16
        end
        object Label19: TLabel
          Left = 24
          Top = 232
          Width = 92
          Height = 13
          Caption = 'e - DI/RI Vinculado'
          FocusControl = DBEdit17
        end
        object Label20: TLabel
          Left = 24
          Top = 334
          Width = 195
          Height = 13
          Caption = 'a - Dados do Importador para o Siscomex'
          FocusControl = edt_cd_importador
        end
        object Label21: TLabel
          Left = 24
          Top = 418
          Width = 48
          Height = 13
          Caption = 'b - Cidade'
        end
        object Label22: TLabel
          Left = 382
          Top = 418
          Width = 37
          Height = 13
          Caption = 'c - Pa'#237's'
        end
        object Label23: TLabel
          Left = 133
          Top = 43
          Width = 30
          Height = 13
          Caption = 'Fatura'
          FocusControl = DBEdit18
        end
        object Label24: TLabel
          Left = 405
          Top = 169
          Width = 65
          Height = 13
          Caption = 'f - Data Limite'
          FocusControl = DBEdit19
        end
        object Label25: TLabel
          Left = 405
          Top = 190
          Width = 129
          Height = 13
          Caption = 'g - Margem n'#227'o sacada (%)'
          FocusControl = DBEdit20
        end
        object Label26: TLabel
          Left = 405
          Top = 211
          Width = 114
          Height = 13
          Caption = 'h - N'#250'mero do Processo'
          FocusControl = DBEdit21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 12
          Top = 82
          Width = 72
          Height = 13
          Caption = '01 - Exportador'
          FocusControl = edt_cd_exportador
        end
        object btn_co_exportador: TSpeedButton
          Left = 514
          Top = 79
          Width = 25
          Height = 22
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
          OnClick = btn_co_exportadorClick
        end
        object Label44: TLabel
          Left = 554
          Top = 83
          Width = 58
          Height = 13
          Caption = 'CNPJ / CPF'
          FocusControl = edt_nr_cnpj_exp
        end
        object btn_co_processo: TSpeedButton
          Left = 250
          Top = 7
          Width = 25
          Height = 22
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
          OnClick = btn_co_processoClick
        end
        object Label74: TLabel
          Left = 12
          Top = 10
          Width = 71
          Height = 16
          Caption = 'Processo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Shape41: TShape
          Left = 99
          Top = 7
          Width = 113
          Height = 22
          Brush.Color = clScrollBar
          Pen.Color = clGray
        end
        object Label70: TLabel
          Left = 24
          Top = 139
          Width = 48
          Height = 13
          Caption = 'a - C'#243'digo'
          FocusControl = DBEdit14
        end
        object btn_co_destino: TSpeedButton
          Left = 693
          Top = 415
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
          OnClick = btn_co_destinoClick
        end
        object shp1: TShape
          Left = 213
          Top = 7
          Width = 35
          Height = 22
          Brush.Color = clScrollBar
          Pen.Color = clGray
        end
        object btnIntegraRE: TSpeedButton
          Left = 551
          Top = 4
          Width = 190
          Height = 27
          Cursor = crHandPoint
          Hint = 'Integra'#231#227'o de RE via arquivo texto'
          Caption = 'Importar RE (arquivo.dat)'
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
          OnClick = btnIntegraREClick
        end
        object edt_nr_processo: TDBEdit
          Left = 102
          Top = 10
          Width = 107
          Height = 16
          TabStop = False
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = clWhite
          DataField = 'PROCESSO_REDUZIDO'
          DataSource = datm_re_capa.ds_re_capa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnExit = edt_nr_processoExit
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object DBEdit3: TDBEdit
          Left = 7
          Top = 56
          Width = 114
          Height = 21
          DataField = 'NR_RE_SISCOMEX'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 3
          OnExit = DBEdit3Exit
        end
        object DBEdit4: TDBEdit
          Left = 265
          Top = 56
          Width = 456
          Height = 21
          DataField = 'TX_SITUACAO_RE'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 5
        end
        object edt_cd_enquad1: TDBEdit
          Left = 118
          Top = 135
          Width = 52
          Height = 21
          DataField = 'CD_ENQUAD1'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 9
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object edt_cd_enquad2: TDBEdit
          Left = 222
          Top = 135
          Width = 52
          Height = 21
          DataField = 'CD_ENQUAD2'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 10
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object edt_cd_enquad3: TDBEdit
          Left = 326
          Top = 135
          Width = 52
          Height = 21
          DataField = 'CD_ENQUAD3'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 11
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object edt_cd_enquad4: TDBEdit
          Left = 430
          Top = 135
          Width = 52
          Height = 21
          DataField = 'CD_ENQUAD4'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 12
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object edt_cd_enquad5: TDBEdit
          Left = 534
          Top = 135
          Width = 52
          Height = 21
          DataField = 'CD_ENQUAD5'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 13
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object edt_cd_enquad6: TDBEdit
          Left = 638
          Top = 135
          Width = 52
          Height = 21
          DataField = 'CD_ENQUAD6'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 14
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object edt_cd_urf_embarque: TDBEdit
          Left = 113
          Top = 286
          Width = 86
          Height = 21
          DataField = 'CD_URF_EMBARQUE'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 24
          OnChange = btn_co_urf_embarqueClick
          OnExit = edt_cd_urf_embarqueExit
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object edt_cd_urf_despacho: TDBEdit
          Left = 113
          Top = 265
          Width = 86
          Height = 21
          DataField = 'CD_URF_DESPACHO'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 22
          OnChange = btn_co_urf_despachoClick
          OnExit = edt_cd_urf_despachoExit
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object edt_nm_urf_despacho: TEdit
          Left = 199
          Top = 265
          Width = 495
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 23
        end
        object edt_nm_urf_embarque: TEdit
          Left = 199
          Top = 286
          Width = 495
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 25
        end
        object edt_cd_importador: TDBEdit
          Left = 113
          Top = 308
          Width = 58
          Height = 21
          DataField = 'CD_IMPORTADOR'
          DataSource = datm_re_capa.ds_re_capa
          MaxLength = 5
          TabOrder = 26
          OnChange = btn_co_importadorClick
          OnExit = edt_cd_importadorExit
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object edt_nm_importador: TEdit
          Left = 171
          Top = 308
          Width = 523
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 27
        end
        object DBEdit14: TDBEdit
          Left = 152
          Top = 166
          Width = 182
          Height = 21
          DataField = 'NR_REG_VENDA'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 15
        end
        object DBEdit15: TDBEdit
          Left = 152
          Top = 187
          Width = 182
          Height = 21
          DataField = 'NR_REG_CREDITO'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 17
        end
        object DBEdit16: TDBEdit
          Left = 152
          Top = 208
          Width = 182
          Height = 21
          DataField = 'NR_RE_VINCULADA'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 19
        end
        object DBEdit17: TDBEdit
          Left = 152
          Top = 229
          Width = 182
          Height = 21
          DataField = 'NR_DI_VINCULADA'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 21
        end
        object edt_cidade_importador: TEdit
          Left = 113
          Top = 415
          Width = 256
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 29
        end
        object edt_nm_pais: TEdit
          Left = 470
          Top = 415
          Width = 222
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 31
        end
        object DBEdit18: TDBEdit
          Left = 133
          Top = 56
          Width = 120
          Height = 21
          DataField = 'NR_OUTRA_REF'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 4
        end
        object DBEdit19: TDBEdit
          Left = 543
          Top = 166
          Width = 178
          Height = 21
          DataField = 'DT_LIMITE_OPERACAO'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 16
        end
        object DBEdit20: TDBEdit
          Left = 543
          Top = 187
          Width = 178
          Height = 21
          DataField = 'PC_MARGEM_NAO_SACADA'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 18
        end
        object DBEdit21: TDBEdit
          Left = 543
          Top = 208
          Width = 178
          Height = 21
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 20
        end
        object edt_cd_exportador: TDBEdit
          Left = 113
          Top = 80
          Width = 59
          Height = 21
          DataField = 'CD_EXPORTADOR'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 6
          OnChange = btn_co_exportadorClick
          OnExit = edt_cd_exportadorExit
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object edt_nm_exportador: TEdit
          Left = 172
          Top = 80
          Width = 341
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 7
        end
        object edt_nr_cnpj_exp: TEdit
          Left = 618
          Top = 80
          Width = 103
          Height = 21
          TabStop = False
          TabOrder = 8
        end
        object mem_end_importador: TDBMemo
          Left = 24
          Top = 349
          Width = 695
          Height = 57
          DataField = 'TX_END_IMPORTADOR'
          DataSource = datm_re_capa.ds_re_capa
          MaxLength = 110
          TabOrder = 28
        end
        object edt_pais_importador: TDBEdit
          Left = 426
          Top = 415
          Width = 45
          Height = 21
          DataField = 'CD_PAIS_IMPORTADOR'
          DataSource = datm_re_capa.ds_re_capa
          TabOrder = 30
          OnChange = edt_pais_importadorChange
          OnExit = edt_pais_importadorExit
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object chkProcessos: TCheckBox
          Left = 282
          Top = 10
          Width = 124
          Height = 17
          Caption = #218'ltimos Processos'
          Checked = True
          Color = clSilver
          ParentColor = False
          State = cbChecked
          TabOrder = 2
        end
        object dbedt_nr_processo_complemento: TDBEdit
          Left = 216
          Top = 10
          Width = 29
          Height = 16
          TabStop = False
          AutoSize = False
          BorderStyle = bsNone
          Color = clWhite
          DataField = 'NR_PROCESSO_COMPLEMENTO'
          DataSource = datm_re_capa.ds_re_capa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnExit = edt_nr_processoExit
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object Panel10: TPanel
          Left = 203
          Top = 100
          Width = 332
          Height = 118
          BevelOuter = bvNone
          BorderWidth = 2
          Caption = 'Panel10'
          Color = clBlack
          TabOrder = 32
          Visible = False
          object Panel13: TPanel
            Left = 2
            Top = 2
            Width = 328
            Height = 114
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Shape49: TShape
              Left = 2
              Top = 2
              Width = 306
              Height = 22
              Brush.Color = clSilver
              Pen.Style = psClear
            end
            object SpeedButton9: TSpeedButton
              Left = 126
              Top = 36
              Width = 25
              Height = 22
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
              OnClick = SpeedButton9Click
            end
            object Shape47: TShape
              Left = 12
              Top = 35
              Width = 113
              Height = 24
              Brush.Color = clScrollBar
              Pen.Color = clGray
            end
            object Label3: TLabel
              Left = 7
              Top = 6
              Width = 293
              Height = 13
              Caption = 'Escolha o processo com as informa'#231#245'es desejadas:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Bevel2: TBevel
              Left = 9
              Top = 72
              Width = 317
              Height = 4
            end
            object btnImportar: TSpeedButton
              Left = 243
              Top = 81
              Width = 80
              Height = 27
              Caption = 'Importar'
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
              OnClick = btnImportarClick
            end
            object lbl1: TLabel
              Left = 158
              Top = 29
              Width = 143
              Height = 33
              Caption = 
                '* s'#243' ser'#225' permitido importar'#13#10'  de processos come'#231'ados'#13#10'  direto' +
                ' no RE.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Small Fonts'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblSair: TLabel
              Left = 310
              Top = 2
              Width = 15
              Height = 13
              Caption = '[x]'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = lblSairClick
            end
            object edtProcessoImportar: TEdit
              Left = 14
              Top = 37
              Width = 110
              Height = 19
              BevelInner = bvLowered
              BevelKind = bkFlat
              BevelOuter = bvNone
              CharCase = ecUpperCase
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
            end
          end
        end
        object pnl_dat: TPanel
          Left = 90
          Top = 113
          Width = 521
          Height = 134
          BevelInner = bvLowered
          BorderWidth = 3
          Color = clSilver
          TabOrder = 33
          Visible = False
          OnExit = pnl_datExit
          DesignSize = (
            521
            134)
          object Label88: TLabel
            Left = 4
            Top = 3
            Width = 513
            Height = 20
            Alignment = taCenter
            AutoSize = False
            Caption = 'Escolha o arquivo.dat para Integra'#231#227'o do RE'
            Color = clYellow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
          end
          object Label89: TLabel
            Left = 498
            Top = 6
            Width = 15
            Height = 13
            Cursor = crHandPoint
            Hint = 'fechar'
            Anchors = [akTop, akRight]
            Caption = '[x]'
            Color = 14211288
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Transparent = True
            OnClick = pnl_datExit
          end
          object SpeedButton10: TSpeedButton
            Left = 493
            Top = 43
            Width = 19
            Height = 17
            Cursor = crHandPoint
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
            OnClick = SpeedButton10Click
          end
          object Bevel3: TBevel
            Left = 18
            Top = 77
            Width = 492
            Height = 3
          end
          object btnConfirmaIntegraRE: TSpeedButton
            Left = 420
            Top = 91
            Width = 90
            Height = 29
            Cursor = crHandPoint
            Caption = 'Importar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
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
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnConfirmaIntegraJP
          end
          object edt_dat: TEdit
            Left = 6
            Top = 42
            Width = 485
            Height = 19
            BevelInner = bvLowered
            BevelKind = bkFlat
            BevelOuter = bvNone
            CharCase = ecUpperCase
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
          end
        end
      end
      object tabReCompl: TTabSheet
        Caption = 'Informa'#231#245'es Complementares'
        ImageIndex = 2
        DesignSize = (
          788
          536)
        object Shape5: TShape
          Left = 2
          Top = 3
          Width = 775
          Height = 510
          Anchors = [akLeft, akTop, akRight]
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape38: TShape
          Left = 14
          Top = 10
          Width = 756
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          Brush.Color = clSilver
        end
        object Label73: TLabel
          Left = 20
          Top = 15
          Width = 57
          Height = 13
          Caption = 'Processo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object DBText5: TDBText
          Left = 83
          Top = 15
          Width = 118
          Height = 14
          DataField = 'PROCESSO_REDUZIDO'
          DataSource = datm_re_capa.ds_re_capa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Panel6: TPanel
          Left = 14
          Top = 34
          Width = 756
          Height = 365
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          BorderWidth = 1
          TabOrder = 0
          DesignSize = (
            756
            365)
          object Shape39: TShape
            Left = 0
            Top = 0
            Width = 756
            Height = 365
            Anchors = [akLeft, akTop, akRight]
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Shape30: TPanel
            Left = 1
            Top = 338
            Width = 754
            Height = 26
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 14
            object Label33: TLabel
              Left = 22
              Top = 6
              Width = 111
              Height = 13
              Caption = 'm - Valor Financeiro RC'
              FocusControl = DBEdit28
            end
            object Label75: TLabel
              Left = 369
              Top = 5
              Width = 103
              Height = 13
              Caption = '* - Peso L'#237'quido Total'
              FocusControl = DBEdit28
            end
            object DBEdit28: TDBEdit
              Left = 159
              Top = 2
              Width = 150
              Height = 21
              DataField = 'VL_VALOR_FINANCEIRO_RC'
              DataSource = datm_re_capa.ds_re_capa
              TabOrder = 0
            end
            object DBEdit1: TDBEdit
              Left = 513
              Top = 2
              Width = 136
              Height = 21
              DataField = 'PESO_LIQUIDO_TOTAL'
              DataSource = datm_re_capa.ds_re_capa
              TabOrder = 1
            end
          end
          object Shape31: TPanel
            Left = 1
            Top = 312
            Width = 754
            Height = 26
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 13
            object Label31: TLabel
              Left = 22
              Top = 6
              Width = 117
              Height = 13
              Caption = 'j - Valor em Consigna'#231#227'o'
              FocusControl = DBEdit26
            end
            object Label32: TLabel
              Left = 371
              Top = 6
              Width = 135
              Height = 13
              Caption = 'l - Valor s/ Cobertura C'#226'mbio'
              FocusControl = EditValSemCobCambio
            end
            object DBEdit26: TDBEdit
              Left = 159
              Top = 2
              Width = 150
              Height = 21
              DataField = 'VL_VALOR_CONSIGNACAO'
              DataSource = datm_re_capa.ds_re_capa
              TabOrder = 0
            end
            object EditValSemCobCambio: TDBEdit
              Left = 513
              Top = 2
              Width = 136
              Height = 21
              DataField = 'VL_VALOR_COBER_CAMBIAL'
              DataSource = datm_re_capa.ds_re_capa
              TabOrder = 1
            end
          end
          object Shape32: TPanel
            Left = 1
            Top = 286
            Width = 754
            Height = 26
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 12
            object Label30: TLabel
              Left = 22
              Top = 7
              Width = 125
              Height = 13
              Caption = 'i - Valor marg. n'#227'o Sacada'
              FocusControl = DBEdit25
            end
            object Label81: TLabel
              Left = 314
              Top = 7
              Width = 72
              Height = 13
              Caption = '( calculado )'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit25: TDBEdit
              Left = 159
              Top = 3
              Width = 150
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'VL_MARGEM_NAO_SACADA'
              DataSource = datm_re_capa.ds_re_capa
              ReadOnly = True
              TabOrder = 0
            end
          end
          object Shape33: TPanel
            Left = 1
            Top = 260
            Width = 754
            Height = 26
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 11
            object Label42: TLabel
              Left = 22
              Top = 7
              Width = 93
              Height = 13
              Caption = 'h - Valor da Parcela'
              FocusControl = DBEdit37
            end
            object DBEdit37: TDBEdit
              Left = 159
              Top = 3
              Width = 150
              Height = 21
              DataField = 'VL_PARCELA'
              DataSource = datm_re_capa.ds_re_capa
              TabOrder = 0
            end
          end
          object Shape34: TPanel
            Left = 1
            Top = 234
            Width = 754
            Height = 26
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 10
            object Label40: TLabel
              Left = 22
              Top = 7
              Width = 76
              Height = 13
              Caption = 'f - Periodicidade'
              FocusControl = DBEdit35
            end
            object Label41: TLabel
              Left = 257
              Top = 7
              Width = 59
              Height = 13
              Caption = 'g - Indicador'
              FocusControl = dbedt_tp_indicador
            end
            object DBEdit35: TDBEdit
              Left = 159
              Top = 3
              Width = 74
              Height = 21
              DataField = 'NR_PERIODICIDADE'
              DataSource = datm_re_capa.ds_re_capa
              TabOrder = 0
            end
            object dbedt_tp_indicador: TDBEdit
              Left = 329
              Top = 3
              Width = 25
              Height = 21
              DataField = 'TP_INDICADOR'
              DataSource = datm_re_capa.ds_re_capa
              TabOrder = 1
            end
          end
          object Shape25: TPanel
            Left = 1
            Top = 208
            Width = 754
            Height = 26
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 9
            object Label39: TLabel
              Left = 22
              Top = 7
              Width = 111
              Height = 13
              Caption = 'e - N'#250'mero de Parcelas'
              FocusControl = DBEdit34
            end
            object DBEdit34: TDBEdit
              Left = 159
              Top = 3
              Width = 88
              Height = 21
              DataField = 'NR_PARCELAS'
              DataSource = datm_re_capa.ds_re_capa
              TabOrder = 0
            end
          end
          object Shape26: TPanel
            Left = 1
            Top = 182
            Width = 754
            Height = 26
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 7
            object Label38: TLabel
              Left = 22
              Top = 7
              Width = 105
              Height = 13
              Caption = 'd - Valor Pagto '#224' Vista'
              FocusControl = DBEdit33
            end
            object DBEdit33: TDBEdit
              Left = 159
              Top = 3
              Width = 193
              Height = 21
              DataField = 'VL_PAGT_VISTA'
              DataSource = datm_re_capa.ds_re_capa
              TabOrder = 0
            end
          end
          object Shape27: TPanel
            Left = 1
            Top = 156
            Width = 754
            Height = 26
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 6
            object Label37: TLabel
              Left = 22
              Top = 7
              Width = 127
              Height = 13
              Caption = 'c - Valor Pagto Antecipado'
              FocusControl = DBEdit32
            end
            object DBEdit32: TDBEdit
              Left = 159
              Top = 3
              Width = 193
              Height = 21
              DataField = 'VL_PAGTO_ANTEC'
              DataSource = datm_re_capa.ds_re_capa
              TabOrder = 0
            end
          end
          object Shape28: TPanel
            Left = 1
            Top = 130
            Width = 754
            Height = 26
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 5
            object Label36: TLabel
              Left = 22
              Top = 7
              Width = 48
              Height = 13
              Caption = 'b - Moeda'
              FocusControl = edt_cd_moeda
            end
            object btn_co_moeda: TSpeedButton
              Left = 593
              Top = 2
              Width = 25
              Height = 22
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
              OnClick = btn_co_moedaClick
            end
            object edt_cd_moeda: TDBEdit
              Left = 159
              Top = 3
              Width = 61
              Height = 21
              DataField = 'CD_MOEDA'
              DataSource = datm_re_capa.ds_re_capa
              TabOrder = 0
              OnChange = btn_co_moedaClick
              OnExit = edt_cd_pais_destinoExit
              OnKeyDown = edt_cd_unidadeKeyDown
            end
            object edt_nm_moeda: TEdit
              Left = 220
              Top = 3
              Width = 372
              Height = 21
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 1
            end
          end
          object Shape23: TPanel
            Left = 1
            Top = 104
            Width = 754
            Height = 26
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 4
            object Label35: TLabel
              Left = 22
              Top = 7
              Width = 124
              Height = 13
              Caption = 'a - Modalidade Transa'#231#227'o'
              FocusControl = dbedt_cd_modalidade_trans
            end
            object SpeedButton15: TSpeedButton
              Left = 593
              Top = 2
              Width = 25
              Height = 22
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
              OnClick = SpeedButton15Click
            end
            object dbedt_cd_modalidade_trans: TDBEdit
              Left = 159
              Top = 3
              Width = 61
              Height = 21
              DataField = 'CD_MODALIDADE_TRANS'
              DataSource = datm_re_capa.ds_re_capa
              TabOrder = 0
              OnChange = SpeedButton15Click
              OnExit = edt_cd_pais_destinoExit
              OnKeyDown = edt_cd_unidadeKeyDown
            end
            object edt_nm_modalidade_trans: TEdit
              Left = 220
              Top = 3
              Width = 372
              Height = 21
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 1
            end
          end
          object Shape24: TPanel
            Left = 1
            Top = 78
            Width = 754
            Height = 26
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 3
            object Label29: TLabel
              Left = 6
              Top = 7
              Width = 138
              Height = 13
              Caption = '09 - Esquema de Pagto Total'
              FocusControl = DBEdit24
            end
            object Label80: TLabel
              Left = 357
              Top = 7
              Width = 72
              Height = 13
              Caption = '( calculado )'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit24: TDBEdit
              Left = 159
              Top = 3
              Width = 193
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'VL_ESQUE_PG_TOTAL'
              DataSource = datm_re_capa.ds_re_capa
              ReadOnly = True
              TabOrder = 0
            end
          end
          object Shape21: TPanel
            Left = 1
            Top = 26
            Width = 754
            Height = 26
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Label27: TLabel
              Left = 6
              Top = 7
              Width = 137
              Height = 13
              Caption = '07 - Instrumento Negocia'#231#227'o'
              FocusControl = edt_cd_inst_neg
            end
            object btn_co_inst_neg: TSpeedButton
              Left = 624
              Top = 2
              Width = 25
              Height = 22
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
              OnClick = btn_co_inst_negClick
            end
            object edt_cd_inst_neg: TDBEdit
              Left = 159
              Top = 3
              Width = 61
              Height = 21
              DataField = 'CD_INST_NEGO'
              DataSource = datm_re_capa.ds_re_capa
              TabOrder = 0
              OnChange = btn_co_inst_negClick
              OnKeyDown = edt_cd_unidadeKeyDown
            end
            object edt_nm_inst_neg: TEdit
              Left = 220
              Top = 3
              Width = 403
              Height = 21
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 1
            end
          end
          object Shape20: TPanel
            Left = 1
            Top = 1
            Width = 754
            Height = 25
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object Label28: TLabel
              Left = 6
              Top = 7
              Width = 122
              Height = 13
              Caption = '06 - Pa'#237's de Destino Final'
              FocusControl = edt_cd_pais_destino
            end
            object btn_co_pais_destino: TSpeedButton
              Left = 624
              Top = 2
              Width = 25
              Height = 22
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
              OnClick = btn_co_pais_destinoClick
            end
            object edt_cd_pais_destino: TDBEdit
              Left = 159
              Top = 3
              Width = 61
              Height = 21
              DataField = 'CD_PAIS_FINAL'
              DataSource = datm_re_capa.ds_re_capa
              TabOrder = 0
              OnChange = btn_co_pais_destinoClick
              OnExit = edt_cd_pais_destinoExit
              OnKeyDown = edt_cd_unidadeKeyDown
            end
            object edt_nm_pais_destino: TEdit
              Left = 220
              Top = 3
              Width = 403
              Height = 21
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 1
            end
          end
          object Shape22: TPanel
            Left = 1
            Top = 52
            Width = 754
            Height = 26
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object Label34: TLabel
              Left = 6
              Top = 7
              Width = 115
              Height = 13
              Caption = '08 - Condi'#231#227'o de Venda'
              FocusControl = dbedt_cd_incoterm
            end
            object SpeedButton14: TSpeedButton
              Left = 624
              Top = 2
              Width = 25
              Height = 22
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
              OnClick = SpeedButton14Click
            end
            object dbedt_cd_incoterm: TDBEdit
              Left = 159
              Top = 3
              Width = 61
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CD_INCOTERM'
              DataSource = datm_re_capa.ds_re_capa
              TabOrder = 0
              OnChange = SpeedButton14Click
              OnKeyDown = edt_cd_unidadeKeyDown
            end
            object edt_nm_incoterm: TEdit
              Left = 220
              Top = 3
              Width = 403
              Height = 21
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 1
            end
          end
          object pnlFreteSeguro: TPanel
            Left = 385
            Top = 188
            Width = 245
            Height = 74
            BevelOuter = bvNone
            BorderWidth = 3
            Color = clGray
            TabOrder = 8
            object pnlSeguro: TPanel
              Left = 3
              Top = 40
              Width = 239
              Height = 20
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object Label79: TLabel
                Left = 21
                Top = 4
                Width = 76
                Height = 13
                Caption = 'Valor do Seguro'
              end
              object DBEdit6: TDBEdit
                Left = 106
                Top = 0
                Width = 121
                Height = 21
                DataField = 'VL_SEGURO_TOTAL'
                DataSource = datm_re_capa.ds_re_capa
                TabOrder = 0
              end
            end
            object pnlFrete: TPanel
              Left = 3
              Top = 3
              Width = 239
              Height = 37
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                239
                37)
              object Label78: TLabel
                Left = 22
                Top = 9
                Width = 66
                Height = 13
                Anchors = [akBottom]
                Caption = 'Valor do Frete'
              end
              object DBEdit2: TDBEdit
                Left = 106
                Top = 5
                Width = 121
                Height = 21
                Anchors = [akBottom]
                DataField = 'VL_FRETE_TOTAL'
                DataSource = datm_re_capa.ds_re_capa
                TabOrder = 0
              end
            end
            object Panel7: TPanel
              Left = 3
              Top = 60
              Width = 239
              Height = 11
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 2
            end
          end
        end
      end
      object tabAnexo: TTabSheet
        Caption = 'Anexo'
        ImageIndex = 3
        DesignSize = (
          788
          536)
        object Shape7: TShape
          Left = 2
          Top = 3
          Width = 781
          Height = 510
          Anchors = [akLeft, akTop, akRight]
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape12: TShape
          Left = 14
          Top = 10
          Width = 702
          Height = 23
          Brush.Color = clSilver
        end
        object Shape9: TShape
          Left = 14
          Top = 34
          Width = 702
          Height = 20
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape10: TShape
          Left = 14
          Top = 55
          Width = 702
          Height = 53
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label45: TLabel
          Left = 14
          Top = 118
          Width = 140
          Height = 13
          Caption = '11 - Descri'#231#227'o da Mercadoria'
        end
        object Label46: TLabel
          Left = 14
          Top = 352
          Width = 77
          Height = 13
          Caption = '14 - Pend'#234'ncias'
          Enabled = False
        end
        object Label47: TLabel
          Left = 369
          Top = 352
          Width = 151
          Height = 13
          Caption = '15 - Observa'#231#245'es SCEX / DTIC'
          Enabled = False
        end
        object Label48: TLabel
          Left = 19
          Top = 38
          Width = 130
          Height = 13
          Caption = '10 - C'#243'digos da Mercadoria'
          Transparent = True
        end
        object Label49: TLabel
          Left = 41
          Top = 85
          Width = 54
          Height = 13
          Caption = 'b - NALADI'
          FocusControl = edt_cd_naladi
        end
        object Label50: TLabel
          Left = 41
          Top = 63
          Width = 39
          Height = 13
          Caption = 'a - NCM'
          FocusControl = edt_cd_ncm
        end
        object btn_co_ncm: TSpeedButton
          Left = 637
          Top = 60
          Width = 25
          Height = 22
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
          OnClick = btn_co_ncmClick
        end
        object btn_co_naladi: TSpeedButton
          Left = 637
          Top = 82
          Width = 25
          Height = 22
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
          OnClick = btn_co_naladiClick
        end
        object DBText1: TDBText
          Left = 83
          Top = 15
          Width = 118
          Height = 14
          DataField = 'PROCESSO_REDUZIDO'
          DataSource = datm_re_capa.ds_re_capa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label51: TLabel
          Left = 20
          Top = 15
          Width = 57
          Height = 13
          Caption = 'Processo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label76: TLabel
          Left = 242
          Top = 327
          Width = 97
          Height = 13
          Caption = '13 - Estado Produtor'
          FocusControl = edt_cd_ufprodutor
        end
        object btn_co_ufprodutor: TSpeedButton
          Left = 649
          Top = 324
          Width = 25
          Height = 22
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
          OnClick = btn_co_ufprodutorClick
        end
        object Label77: TLabel
          Left = 13
          Top = 327
          Width = 94
          Height = 13
          Caption = '12 - Categoria T'#234'xtil'
          FocusControl = DBEdit5
        end
        object edt_nm_ncm: TEdit
          Left = 212
          Top = 60
          Width = 424
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 2
        end
        object edt_nm_naladi: TEdit
          Left = 212
          Top = 82
          Width = 424
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 4
        end
        object Panel4: TPanel
          Left = 14
          Top = 131
          Width = 702
          Height = 175
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clScrollBar
          TabOrder = 5
          TabStop = True
          object edt_merc1: TEdit
            Left = 2
            Top = 2
            Width = 697
            Height = 20
            BorderStyle = bsNone
            MaxLength = 75
            TabOrder = 0
            OnKeyPress = edt_merc1KeyPress
          end
          object edt_merc2: TEdit
            Left = 2
            Top = 21
            Width = 697
            Height = 20
            BorderStyle = bsNone
            MaxLength = 75
            TabOrder = 1
            OnKeyPress = edt_merc1KeyPress
          end
          object edt_merc4: TEdit
            Left = 2
            Top = 59
            Width = 697
            Height = 20
            BorderStyle = bsNone
            MaxLength = 75
            TabOrder = 3
            OnKeyPress = edt_merc1KeyPress
          end
          object edt_merc3: TEdit
            Left = 2
            Top = 40
            Width = 697
            Height = 20
            BorderStyle = bsNone
            MaxLength = 75
            TabOrder = 2
            OnKeyPress = edt_merc1KeyPress
          end
          object edt_merc8: TEdit
            Left = 2
            Top = 135
            Width = 697
            Height = 20
            BorderStyle = bsNone
            MaxLength = 75
            TabOrder = 7
            OnKeyPress = edt_merc1KeyPress
          end
          object edt_merc7: TEdit
            Left = 2
            Top = 116
            Width = 697
            Height = 20
            BorderStyle = bsNone
            MaxLength = 75
            TabOrder = 6
            OnKeyPress = edt_merc1KeyPress
          end
          object edt_merc6: TEdit
            Left = 2
            Top = 97
            Width = 697
            Height = 20
            BorderStyle = bsNone
            MaxLength = 75
            TabOrder = 5
            OnKeyPress = edt_merc1KeyPress
          end
          object edt_merc5: TEdit
            Left = 2
            Top = 78
            Width = 697
            Height = 20
            BorderStyle = bsNone
            MaxLength = 75
            TabOrder = 4
            OnKeyPress = edt_merc1KeyPress
          end
          object edt_merc9: TEdit
            Left = 2
            Top = 154
            Width = 697
            Height = 20
            BorderStyle = bsNone
            MaxLength = 75
            TabOrder = 8
            OnKeyPress = edt_merc1KeyPress
          end
        end
        object DBMemo1: TDBMemo
          Left = 14
          Top = 366
          Width = 348
          Height = 66
          Color = clBtnFace
          DataField = 'TX_PENDENCIA'
          DataSource = datm_re_capa.ds_re_anexo
          Enabled = False
          TabOrder = 9
        end
        object DBMemo2: TDBMemo
          Left = 369
          Top = 366
          Width = 348
          Height = 66
          Color = clBtnFace
          DataField = 'TX_OBSERVACOES'
          DataSource = datm_re_capa.ds_re_anexo
          Enabled = False
          TabOrder = 10
        end
        object edt_nm_ufprodutor: TEdit
          Left = 376
          Top = 324
          Width = 272
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit5: TDBEdit
          Left = 115
          Top = 324
          Width = 118
          Height = 21
          DataField = 'TX_CATEGORIA_TEXTIL'
          DataSource = datm_re_capa.ds_re_anexo
          TabOrder = 6
          OnChange = btn_co_naladiClick
        end
        object dbedt_cd_sulf_ncm: TDBEdit
          Left = 184
          Top = 60
          Width = 29
          Height = 21
          DataField = 'CD_SULF_NCM'
          DataSource = datm_re_capa.ds_re_anexo
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnExit = dbedt_cd_sulf_ncmExit
        end
        object edt_cd_naladi: TDBEdit
          Left = 103
          Top = 82
          Width = 110
          Height = 21
          DataField = 'CD_NALADI'
          DataSource = datm_re_capa.ds_re_anexo
          TabOrder = 3
          OnChange = btn_co_naladiClick
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object edt_cd_ncm: TDBEdit
          Left = 103
          Top = 60
          Width = 82
          Height = 21
          DataField = 'CD_NCM'
          DataSource = datm_re_capa.ds_re_anexo
          MaxLength = 8
          TabOrder = 0
          OnChange = btn_co_ncmClick
          OnExit = edt_cd_ncmExit
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object edt_cd_ufprodutor: TDBEdit
          Left = 346
          Top = 324
          Width = 31
          Height = 21
          DataField = 'CD_UF_PRODUTOR'
          DataSource = datm_re_capa.ds_re_anexo
          TabOrder = 7
          OnChange = btn_co_ufprodutorClick
          OnExit = edt_cd_pais_destinoExit
          OnKeyDown = edt_cd_unidadeKeyDown
        end
      end
      object tabAnexoCompl: TTabSheet
        Caption = 'Anexo Complemento'
        ImageIndex = 4
        DesignSize = (
          788
          536)
        object Shape8: TShape
          Left = 3
          Top = 3
          Width = 779
          Height = 510
          Anchors = [akLeft, akTop, akRight]
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape11: TShape
          Left = 13
          Top = 32
          Width = 708
          Height = 400
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape19: TShape
          Left = 14
          Top = 367
          Width = 701
          Height = 35
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape14: TShape
          Left = 14
          Top = 314
          Width = 701
          Height = 20
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Shape15: TShape
          Left = 14
          Top = 258
          Width = 701
          Height = 20
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Shape17: TShape
          Left = 14
          Top = 202
          Width = 701
          Height = 20
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Shape18: TShape
          Left = 14
          Top = 146
          Width = 701
          Height = 20
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Shape13: TShape
          Left = 13
          Top = 10
          Width = 703
          Height = 23
          Brush.Color = clSilver
        end
        object Label52: TLabel
          Left = 20
          Top = 15
          Width = 57
          Height = 13
          Caption = 'Processo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object DBText2: TDBText
          Left = 83
          Top = 15
          Width = 118
          Height = 14
          DataField = 'PROCESSO_REDUZIDO'
          DataSource = datm_re_capa.ds_re_capa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label53: TLabel
          Left = 26
          Top = 377
          Width = 69
          Height = 13
          Caption = '21 - Finalidade'
          FocusControl = edt_cd_finalidade
        end
        object btn_co_finalidade: TSpeedButton
          Left = 635
          Top = 373
          Width = 25
          Height = 22
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
          OnClick = btn_co_finalidadeClick
        end
        object Label54: TLabel
          Left = 426
          Top = 343
          Width = 39
          Height = 13
          Caption = 'c - Valor'
          FocusControl = DBEdit43
        end
        object Label57: TLabel
          Left = 244
          Top = 343
          Width = 44
          Height = 13
          Caption = 'b - Forma'
          FocusControl = DBEdit46
        end
        object Label55: TLabel
          Left = 57
          Top = 343
          Width = 23
          Height = 13
          Caption = 'a - %'
          FocusControl = DBEdit44
        end
        object Label56: TLabel
          Left = 25
          Top = 318
          Width = 118
          Height = 13
          Caption = '20 - Comiss'#227'o do Agente'
          Transparent = True
        end
        object Label58: TLabel
          Left = 25
          Top = 262
          Width = 79
          Height = 13
          Caption = '18 - Pre'#231'o Total:'
          Transparent = True
        end
        object Label59: TLabel
          Left = 25
          Top = 206
          Width = 402
          Height = 13
          Caption = 
            '17 - Quantidade na Unidade de Medida Definida na NCM-SH: ( preen' +
            'cher se dif. Kg )'
          Transparent = True
        end
        object Label60: TLabel
          Left = 25
          Top = 150
          Width = 276
          Height = 13
          Caption = '16 - Quantidade e Unidade de Medida na Comercializa'#231#227'o'
          Transparent = True
        end
        object Label61: TLabel
          Left = 57
          Top = 289
          Width = 94
          Height = 13
          Caption = 'a - Condi'#231#227'o Venda'
          FocusControl = DBEdit45
        end
        object Label62: TLabel
          Left = 331
          Top = 289
          Width = 92
          Height = 13
          Caption = 'b - Local Embarque'
          FocusControl = DBEdit47
        end
        object Label63: TLabel
          Left = 57
          Top = 232
          Width = 70
          Height = 13
          Caption = 'a - Quantidade'
          FocusControl = DBEdit48
        end
        object Label64: TLabel
          Left = 57
          Top = 177
          Width = 70
          Height = 13
          Caption = 'a - Quantidade'
          FocusControl = DBEdit49
        end
        object Label65: TLabel
          Left = 266
          Top = 175
          Width = 93
          Height = 13
          Caption = 'b - Unidade Medida'
          FocusControl = edt_cd_unid_medida
        end
        object btn_co_unid_medida: TSpeedButton
          Left = 635
          Top = 172
          Width = 25
          Height = 22
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
        object Label66: TLabel
          Left = 372
          Top = 123
          Width = 112
          Height = 13
          Caption = '15 - Peso L'#237'quido ( Kg )'
          FocusControl = DBEdit51
        end
        object Label67: TLabel
          Left = 34
          Top = 61
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'TOTAL'
          FocusControl = DBEdit52
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label68: TLabel
          Left = 24
          Top = 86
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'ANEXOS'
          FocusControl = DBEdit53
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label69: TLabel
          Left = 25
          Top = 124
          Width = 113
          Height = 13
          Caption = '14 - Validade Embarque'
          FocusControl = DBEdit54
        end
        object btn_inc_obs_exportador: TSpeedButton
          Left = 642
          Top = 404
          Width = 27
          Height = 27
          Enabled = False
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
          Margin = 3
          NumGlyphs = 2
          OnClick = btn_inc_obs_exportadorClick
        end
        object Shape35: TShape
          Left = 342
          Top = 402
          Width = 1
          Height = 30
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object btn_inc_anexo_fabric: TSpeedButton
          Left = 314
          Top = 404
          Width = 27
          Height = 27
          Enabled = False
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
          Margin = 3
          NumGlyphs = 2
          OnClick = btn_inc_anexo_fabricClick
        end
        object Label86: TLabel
          Left = 97
          Top = 44
          Width = 98
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Exporta'#231#227'o'
          FocusControl = DBEdit52
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label87: TLabel
          Left = 300
          Top = 44
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Peso'
          FocusControl = DBEdit52
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_unid: TDBEdit
          Left = 367
          Top = 230
          Width = 39
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_unid_est'
          DataSource = datm_re_capa.ds_re_anexo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object edt_desc: TDBEdit
          Left = 407
          Top = 230
          Width = 227
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_desc_unid_est'
          DataSource = datm_re_capa.ds_re_anexo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object chk_export_fabric: TDBCheckBox
          Left = 24
          Top = 409
          Width = 179
          Height = 17
          Alignment = taLeftJustify
          Caption = '22 - Exportador '#233' o Fabricante ?'
          DataField = 'IN_EXPORTADOR_FABRICANTE'
          DataSource = datm_re_capa.ds_re_anexo
          TabOrder = 20
          ValueChecked = '1'
          ValueUnchecked = '2'
          OnClick = chk_export_fabricClick
        end
        object chk_obs_exportador: TDBCheckBox
          Left = 354
          Top = 409
          Width = 190
          Height = 17
          Alignment = taLeftJustify
          Caption = '23 - Observa'#231#245'es do Exportador ?'
          DataField = 'IN_OBS_EXPORTADOR'
          DataSource = datm_re_capa.ds_re_anexo
          TabOrder = 21
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = chk_obs_exportadorClick
        end
        object edt_cd_finalidade: TDBEdit
          Left = 121
          Top = 374
          Width = 58
          Height = 21
          DataField = 'CD_FINALIDADE'
          DataSource = datm_re_capa.ds_re_anexo
          TabOrder = 18
          OnChange = btn_co_finalidadeClick
          OnExit = edt_cd_pais_destinoExit
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object edt_nm_finalidade: TEdit
          Left = 179
          Top = 374
          Width = 455
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 19
        end
        object DBEdit43: TDBEdit
          Left = 473
          Top = 340
          Width = 187
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VL_COM_AG_EFET'
          DataSource = datm_re_capa.ds_re_anexo
          ReadOnly = True
          TabOrder = 17
        end
        object DBEdit46: TDBEdit
          Left = 295
          Top = 340
          Width = 26
          Height = 21
          DataField = 'CD_FORMA_PGTO_REBATE'
          DataSource = datm_re_capa.ds_re_anexo
          TabOrder = 15
          Visible = False
        end
        object DBEdit44: TDBEdit
          Left = 121
          Top = 340
          Width = 101
          Height = 21
          DataField = 'PC_COMISSAO'
          DataSource = datm_re_capa.ds_re_anexo
          TabOrder = 14
        end
        object DBEdit45: TDBEdit
          Left = 159
          Top = 286
          Width = 161
          Height = 21
          DataField = 'VL_COND_VENDA'
          DataSource = datm_re_capa.ds_re_anexo
          TabOrder = 12
        end
        object DBEdit47: TDBEdit
          Left = 436
          Top = 286
          Width = 169
          Height = 21
          DataField = 'VL_LOCAL_VENDA'
          DataSource = datm_re_capa.ds_re_anexo
          TabOrder = 13
        end
        object DBEdit48: TDBEdit
          Left = 159
          Top = 229
          Width = 97
          Height = 21
          DataField = 'QT_MEDIA_NBM'
          DataSource = datm_re_capa.ds_re_anexo
          TabOrder = 9
        end
        object DBEdit49: TDBEdit
          Left = 159
          Top = 174
          Width = 97
          Height = 21
          DataField = 'QT_UNIDADE_COMERCIAL'
          DataSource = datm_re_capa.ds_re_anexo
          TabOrder = 8
        end
        object edt_cd_unid_medida: TDBEdit
          Left = 367
          Top = 172
          Width = 41
          Height = 21
          DataField = 'CD_UNID_MEDIDA'
          DataSource = datm_re_capa.ds_re_anexo
          TabOrder = 6
          OnChange = btn_co_unid_medidaClick
          OnExit = edt_cd_unid_medidaExit
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object edt_nm_unid_medida: TEdit
          Left = 408
          Top = 172
          Width = 226
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit51: TDBEdit
          Left = 499
          Top = 120
          Width = 161
          Height = 21
          DataField = 'PESO_LIQUIDO'
          DataSource = datm_re_capa.ds_re_anexo
          TabOrder = 4
        end
        object DBEdit52: TDBEdit
          Left = 78
          Top = 58
          Width = 118
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VL_ESQUE_PG_TOTAL'
          DataSource = datm_re_capa.ds_re_capa
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit53: TDBEdit
          Left = 78
          Top = 83
          Width = 118
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VL_VALOR_NBM_INCLUIDAS'
          DataSource = datm_re_capa.ds_re_capa
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit54: TDBEdit
          Left = 179
          Top = 120
          Width = 174
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'DT_VALIDADE_EMBARQUE'
          DataSource = datm_re_capa.ds_re_anexo
          ReadOnly = True
          TabOrder = 3
        end
        object pnlDiferenca: TPanel
          Left = 334
          Top = 64
          Width = 372
          Height = 34
          BevelOuter = bvNone
          TabOrder = 1
          Visible = False
          object Label83: TLabel
            Left = 23
            Top = 3
            Width = 342
            Height = 26
            Caption = 
              'Existe diferen'#231'a entre o total na capa e a soma dos anexos.'#13#10'Des' +
              'sa forma o MyIndai'#225' n'#227'o permitir'#225' o envio ao Siscomex.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Shape42: TShape
            Left = 12
            Top = 3
            Width = 1
            Height = 25
          end
          object Shape43: TShape
            Left = 0
            Top = 3
            Width = 13
            Height = 2
          end
          object Shape44: TShape
            Left = 0
            Top = 27
            Width = 13
            Height = 2
          end
          object Shape45: TShape
            Left = 13
            Top = 15
            Width = 7
            Height = 2
          end
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 296
          Top = 340
          Width = 116
          Height = 21
          DataField = 'lookforma_pgto'
          DataSource = datm_re_capa.ds_re_anexo
          TabOrder = 16
        end
        object DBEdit7: TDBEdit
          Left = 211
          Top = 58
          Width = 118
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'PESO_LIQUIDO_TOTAL'
          DataSource = datm_re_capa.ds_re_capa
          ReadOnly = True
          TabOrder = 22
        end
        object DBEdit8: TDBEdit
          Left = 211
          Top = 83
          Width = 118
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VL_PESO_NBM_INCLUIDAS'
          DataSource = datm_re_capa.ds_re_capa
          ReadOnly = True
          TabOrder = 23
        end
        object pnlObsExport: TPanel
          Left = 55
          Top = 108
          Width = 636
          Height = 276
          BevelOuter = bvNone
          BorderWidth = 3
          Color = clBlack
          TabOrder = 5
          Visible = False
          object Panel11: TPanel
            Left = 3
            Top = 3
            Width = 630
            Height = 269
            BevelOuter = bvNone
            TabOrder = 0
            object Shape46: TShape
              Left = 3
              Top = 4
              Width = 622
              Height = 20
              Brush.Color = clSilver
              Pen.Color = clGray
            end
            object Label85: TLabel
              Left = 7
              Top = 8
              Width = 158
              Height = 13
              Caption = 'Observa'#231#245'es do Exportador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object SpeedButton3: TSpeedButton
              Left = 529
              Top = 229
              Width = 97
              Height = 34
              Caption = '&Confirma'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
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
              OnClick = SpeedButton3Click
            end
            object btn_OBS_EXPORTADOR: TSpeedButton
              Left = 181
              Top = 5
              Width = 25
              Height = 18
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
              OnClick = btn_OBS_EXPORTADORClick
            end
            object SpeedButton11: TSpeedButton
              Left = 365
              Top = 230
              Width = 97
              Height = 34
              Caption = '&N'#227'o Confirma'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
                03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
                972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
                00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
                4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
                E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
                03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
                9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
                2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
                A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
                01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
                8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
                993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
                02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
                00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              OnClick = SpeedButton11Click
            end
            object Panel12: TPanel
              Left = 3
              Top = 28
              Width = 623
              Height = 194
              BevelInner = bvLowered
              BevelOuter = bvLowered
              Color = clWhite
              TabOrder = 0
              TabStop = True
              object edt_obsexport1: TEdit
                Left = 1
                Top = 1
                Width = 621
                Height = 22
                AutoSize = False
                BorderStyle = bsNone
                MaxLength = 75
                TabOrder = 0
                OnKeyPress = edt_merc1KeyPress
              end
              object edt_obsexport2: TEdit
                Left = 1
                Top = 21
                Width = 620
                Height = 22
                AutoSize = False
                BorderStyle = bsNone
                MaxLength = 75
                TabOrder = 1
                OnKeyPress = edt_merc1KeyPress
              end
              object edt_obsexport3: TEdit
                Left = 1
                Top = 40
                Width = 620
                Height = 22
                AutoSize = False
                BorderStyle = bsNone
                MaxLength = 75
                TabOrder = 2
                OnKeyPress = edt_merc1KeyPress
              end
              object edt_obsexport4: TEdit
                Left = 1
                Top = 59
                Width = 620
                Height = 22
                AutoSize = False
                BorderStyle = bsNone
                MaxLength = 75
                TabOrder = 3
                OnKeyPress = edt_merc1KeyPress
              end
              object edt_obsexport5: TEdit
                Left = 1
                Top = 78
                Width = 620
                Height = 22
                AutoSize = False
                BorderStyle = bsNone
                MaxLength = 75
                TabOrder = 4
                OnKeyPress = edt_merc1KeyPress
              end
              object edt_obsexport6: TEdit
                Left = 1
                Top = 98
                Width = 620
                Height = 22
                AutoSize = False
                BorderStyle = bsNone
                MaxLength = 75
                TabOrder = 5
                OnKeyPress = edt_merc1KeyPress
              end
              object edt_obsexport7: TEdit
                Left = 1
                Top = 117
                Width = 620
                Height = 22
                AutoSize = False
                BorderStyle = bsNone
                MaxLength = 75
                TabOrder = 6
                OnKeyPress = edt_merc1KeyPress
              end
              object edt_obsexport8: TEdit
                Left = 1
                Top = 135
                Width = 620
                Height = 22
                AutoSize = False
                BorderStyle = bsNone
                MaxLength = 75
                TabOrder = 7
                OnKeyPress = edt_merc1KeyPress
              end
              object edt_obsexport9: TEdit
                Left = 1
                Top = 154
                Width = 620
                Height = 22
                AutoSize = False
                BorderStyle = bsNone
                MaxLength = 75
                TabOrder = 8
                OnKeyPress = edt_merc1KeyPress
              end
              object edt_obsexport10: TEdit
                Left = 1
                Top = 173
                Width = 620
                Height = 22
                AutoSize = False
                BorderStyle = bsNone
                MaxLength = 75
                TabOrder = 9
                OnKeyPress = edt_merc1KeyPress
              end
            end
          end
        end
      end
      object tbsFila: TTabSheet
        Caption = 'Fila'
        ImageIndex = 5
        object gpbTipoFila: TGroupBox
          Left = 0
          Top = 0
          Width = 788
          Height = 49
          Align = alTop
          Caption = 'Listar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object rdbCancelar: TRadioButton
            Left = 16
            Top = 21
            Width = 74
            Height = 17
            Hint = '0'
            Caption = 'A Cancelar'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TabStop = True
            OnClick = rdbCancelarClick
          end
          object rdbCancelados: TRadioButton
            Left = 120
            Top = 21
            Width = 77
            Height = 17
            Hint = '1'
            Caption = 'Cancelados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = rdbCancelarClick
          end
          object rdbCancelamentoCancelado: TRadioButton
            Left = 232
            Top = 21
            Width = 145
            Height = 17
            Hint = '-'
            Caption = 'Cancelamento Cancelado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = rdbCancelarClick
          end
        end
        object cxgFila: TcxGrid
          Left = 0
          Top = 49
          Width = 788
          Height = 487
          Align = alClient
          TabOrder = 1
          object cxgdbtFila: TcxGridDBTableView
            DataController.DataSource = datm_re_capa.dsFilaRE
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.GroupByBox = False
            object cxgdbtFilaDBNR_PROCESSO: TcxGridDBColumn
              Caption = 'Processo'
              DataBinding.FieldName = 'NR_PROCESSO'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = False
              Width = 150
            end
            object cxgdbtFilaDBNR_PROCESSO_COMPLEMENTO: TcxGridDBColumn
              Caption = 'Complemento'
              DataBinding.FieldName = 'NR_PROCESSO_COMPLEMENTO'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = False
              Width = 100
            end
            object cxgdbtFilaDBNR_RE: TcxGridDBColumn
              Caption = 'RE'
              DataBinding.FieldName = 'NR_RE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = False
              Width = 150
            end
            object cxgdbtFilaDBIN_CANCELADO: TcxGridDBColumn
              Caption = 'Status'
              DataBinding.FieldName = 'IN_CANCELADO'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'CD_SITUACAO'
              Properties.ListColumns = <
                item
                  FieldName = 'NM_SITUACAO'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = datm_re_capa.dsSituacaoFila
              Width = 100
            end
          end
          object cxglFila: TcxGridLevel
            GridView = cxgdbtFila
          end
        end
      end
    end
    object Panel8: TPanel
      Left = 655
      Top = 1
      Width = 149
      Height = 19
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        149
        19)
      object Label82: TLabel
        Left = 2
        Top = 2
        Width = 113
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'processos j'#225' registrados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Shape36: TShape
        Left = 119
        Top = 3
        Width = 13
        Height = 13
        Anchors = [akTop, akRight]
        Brush.Color = 13761730
      end
    end
  end
  object crp_historico: TCRPE
    WindowShowPrintSetupBtn = False
    WindowShowProgressCtls = False
    WindowState = wsNormal
    LoadEngineOnUse = False
    Left = 512
    Top = 311
  end
  object qry_dde_estagios: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TSD_ESTAGIOS'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY CD_TIPO')
    Left = 512
    Top = 375
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = ''
      end>
    object qry_dde_estagiosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TSD_ESTAGIOS.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_dde_estagiosCD_TIPO: TIntegerField
      FieldName = 'CD_TIPO'
      Origin = 'DBBROKER.TSD_ESTAGIOS.CD_TIPO'
    end
    object qry_dde_estagiosIN_CONCLUIDO: TStringField
      FieldName = 'IN_CONCLUIDO'
      Origin = 'DBBROKER.TSD_ESTAGIOS.IN_CONCLUIDO'
      FixedChar = True
      Size = 1
    end
    object qry_dde_estagiosDT_CONCLUSAO: TDateTimeField
      FieldName = 'DT_CONCLUSAO'
      Origin = 'DBBROKER.TSD_ESTAGIOS.DT_CONCLUSAO'
    end
    object qry_dde_estagiosNM_ESTAGIO_BROKER: TStringField
      FieldName = 'NM_ESTAGIO_BROKER'
      Origin = 'DBBROKER.TSD_ESTAGIOS.NM_ESTAGIO_BROKER'
      FixedChar = True
      Size = 50
    end
    object qry_dde_estagiosNM_ESTAGIO_SISCOMEX: TStringField
      FieldName = 'NM_ESTAGIO_SISCOMEX'
      Origin = 'DBBROKER.TSD_ESTAGIOS.NM_ESTAGIO_SISCOMEX'
      FixedChar = True
      Size = 50
    end
    object qry_dde_estagiosIN_POSSUI_DOCUMENTO: TStringField
      FieldName = 'IN_POSSUI_DOCUMENTO'
      Origin = 'DBBROKER.TSD_ESTAGIOS.IN_POSSUI_DOCUMENTO'
      FixedChar = True
      Size = 1
    end
    object qry_dde_estagiosNM_BSL: TStringField
      FieldName = 'NM_BSL'
      Origin = 'DBBROKER.TSD_ESTAGIOS.NM_BSL'
      FixedChar = True
    end
    object qry_dde_estagiosTX_DOCUMENTO_SISCOMEX: TMemoField
      FieldName = 'TX_DOCUMENTO_SISCOMEX'
      Origin = 'DBBROKER.TSD_ESTAGIOS.TX_DOCUMENTO_SISCOMEX'
      BlobType = ftMemo
    end
  end
  object ds_dde_estagios: TDataSource
    DataSet = qry_dde_estagios
    Left = 576
    Top = 311
  end
  object ds_emp_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 544
    Top = 311
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 544
    Top = 375
    object qry_emp_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_emp_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, CD_PRODUTO'
      'FROM   TUNID_NEG_PRODUTO'
      'WHERE  ( CD_UNID_NEG+CD_PRODUTO ) IN'
      '         ( SELECT ( CD_UNID_NEG+CD_PRODUTO )'
      '           FROM   TUSUARIO_HABILITACAO'
      '           WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                  IN_ATIVO = '#39'1'#39' AND'
      '                  CD_PRODUTO = :CD_PRODUTO )')
    Left = 576
    Top = 375
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
  end
  object qry_exec_sp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '')
    Left = 512
    Top = 343
    object qry_exec_sp_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_exec_sp_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_PRODUTO'
      'FROM   TPRODUTO'
      'WHERE  CD_PRODUTO = :CD_PRODUTO')
    Left = 544
    Top = 343
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_produto_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'DBBROKER.TPRODUTO.NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 576
    Top = 343
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
  end
  object AbreDAT: TOpenDialog
    DefaultExt = 'DAT'
    Filter = 'Arquivo Remessa|*.dat'
    InitialDir = 'G:\EXPORT\JOHNSON & JOHNSON'
    Left = 678
    Top = 393
  end
end
