object frm_pesq_proc: Tfrm_pesq_proc
  Left = 360
  Top = 26
  Width = 808
  Height = 768
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Pesquisa de Processos'
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label26: TLabel
    Left = 675
    Top = 629
    Width = 54
    Height = 13
    Caption = 'Nr DI/DA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 45
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      792
      45)
    object btn_sair: TSpeedButton
      Left = 456
      Top = 4
      Width = 35
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
    object btn_manut_proc: TSpeedButton
      Left = 4
      Top = 4
      Width = 35
      Height = 37
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
    object btn_proc_realiza: TSpeedButton
      Left = 39
      Top = 4
      Width = 35
      Height = 37
      Hint = 'Realiza'#231#227'o por Processo - <CTRL+F2>'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_proc_realizaClick
    end
    object btn_imprimir: TSpeedButton
      Left = 74
      Top = 4
      Width = 35
      Height = 37
      Hint = 'Imprimir'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      Visible = False
      OnClick = btn_imprimirClick
    end
    object Shape2: TShape
      Left = 363
      Top = 11
      Width = 83
      Height = 22
      Anchors = [akTop, akRight]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Panel1: TPanel
      Left = 486
      Top = 2
      Width = 304
      Height = 41
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 0
      object lbl_pesquisar: TLabel
        Left = 8
        Top = 2
        Width = 56
        Height = 13
        Caption = 'Pesquisar'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_ordem: TLabel
        Left = 144
        Top = 2
        Width = 37
        Height = 13
        Caption = 'Ordem'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_chave: TEdit
        Left = 8
        Top = 15
        Width = 129
        Height = 21
        Enabled = False
        TabOrder = 0
        OnChange = edt_chaveChange
        OnExit = edt_chaveExit
        OnKeyDown = edt_chaveKeyDown
      end
      object cb_ordem: TComboBox
        Left = 144
        Top = 15
        Width = 153
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
    object dbnvg: TDBNavigator
      Left = 365
      Top = 13
      Width = 80
      Height = 19
      DataSource = datm_pesq_proc.ds_pesq
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Enabled = False
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 1
    end
  end
  object pgctrl_pesq_proc: TPageControl
    Left = 0
    Top = 45
    Width = 792
    Height = 664
    ActivePage = ts_filtros
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_pesq_procChange
    OnChanging = pgctrl_pesq_procChanging
    object ts_filtros: TTabSheet
      Caption = '&Filtros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object lbl_cd_unid_neg: TLabel
        Left = 16
        Top = 0
        Width = 48
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_unid_neg: TSpeedButton
        Left = 238
        Top = 15
        Width = 19
        Height = 18
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
      object lbl_cd_produto: TLabel
        Left = 16
        Top = 38
        Width = 45
        Height = 13
        AutoSize = False
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_produto: TSpeedButton
        Left = 238
        Top = 52
        Width = 19
        Height = 18
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
      object Label4: TLabel
        Left = 16
        Top = 77
        Width = 40
        Height = 13
        AutoSize = False
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_cliente: TSpeedButton
        Left = 238
        Top = 92
        Width = 19
        Height = 18
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
      object Label5: TLabel
        Left = 16
        Top = 236
        Width = 44
        Height = 13
        AutoSize = False
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_servico: TSpeedButton
        Left = 238
        Top = 250
        Width = 19
        Height = 18
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
        OnClick = btn_co_servicoClick
      end
      object Label6: TLabel
        Left = 572
        Top = 156
        Width = 71
        Height = 13
        Caption = 'Embarca'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_navio: TSpeedButton
        Left = 737
        Top = 170
        Width = 19
        Height = 18
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
        OnClick = btn_co_navioClick
      end
      object Label7: TLabel
        Left = 662
        Top = 198
        Width = 44
        Height = 13
        Caption = 'Nr V'#244'o '
      end
      object Label29: TLabel
        Left = 292
        Top = 0
        Width = 92
        Height = 13
        AutoSize = False
        Caption = 'Local Embarque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label30: TLabel
        Left = 292
        Top = 77
        Width = 74
        Height = 13
        AutoSize = False
        Caption = 'Pa'#237's Destino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label31: TLabel
        Left = 292
        Top = 115
        Width = 70
        Height = 13
        AutoSize = False
        Caption = 'Pa'#237's Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label32: TLabel
        Left = 292
        Top = 38
        Width = 113
        Height = 13
        AutoSize = False
        Caption = 'Local Desembarque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_local_emb: TSpeedButton
        Left = 514
        Top = 15
        Width = 19
        Height = 18
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
        OnClick = btn_co_local_embClick
      end
      object btn_co_local_desemb: TSpeedButton
        Left = 514
        Top = 52
        Width = 19
        Height = 18
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
        OnClick = btn_co_local_desembClick
      end
      object btn_co_pais_dest: TSpeedButton
        Left = 514
        Top = 92
        Width = 19
        Height = 18
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
        OnClick = btn_co_pais_destClick
      end
      object btn_co_pais_origem: TSpeedButton
        Left = 514
        Top = 129
        Width = 19
        Height = 18
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
        OnClick = btn_co_pais_origemClick
      end
      object lbl_di_da: TLabel
        Left = 675
        Top = 236
        Width = 54
        Height = 13
        Caption = 'Nr DI/DA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 572
        Top = 275
        Width = 29
        Height = 13
        Caption = 'Nr LI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 675
        Top = 558
        Width = 44
        Height = 13
        Caption = 'Nr DDE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 572
        Top = 560
        Width = 35
        Height = 13
        Caption = 'Nr RE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 292
        Top = 359
        Width = 63
        Height = 13
        AutoSize = False
        Caption = 'Refer'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 292
        Top = 198
        Width = 84
        Height = 13
        AutoSize = False
        Caption = 'Arm. Descarga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 318
        Width = 41
        Height = 13
        AutoSize = False
        Caption = 'Agente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 292
        Top = 156
        Width = 84
        Height = 13
        AutoSize = False
        Caption = 'Arm Atraca'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_armazem_atracacao: TSpeedButton
        Left = 514
        Top = 170
        Width = 19
        Height = 18
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
        OnClick = btn_co_armazem_atracacaoClick
      end
      object btn_co_armazem_descarga: TSpeedButton
        Left = 514
        Top = 212
        Width = 19
        Height = 18
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
        OnClick = btn_co_armazem_descargaClick
      end
      object btn_co_agente: TSpeedButton
        Left = 238
        Top = 332
        Width = 19
        Height = 18
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
        OnClick = btn_co_agenteClick
      end
      object lbl_viagem: TLabel
        Left = 572
        Top = 198
        Width = 42
        Height = 13
        Caption = 'Viagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cntr: TLabel
        Left = 572
        Top = 236
        Width = 55
        Height = 13
        Caption = 'Cont'#226'iner'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_fatura: TLabel
        Left = 572
        Top = 483
        Width = 37
        Height = 13
        AutoSize = False
        Caption = 'Fatura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_canal: TLabel
        Left = 675
        Top = 318
        Width = 33
        Height = 13
        Caption = 'Canal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_transp_rod: TLabel
        Left = 16
        Top = 275
        Width = 80
        Height = 13
        AutoSize = False
        Caption = 'Transportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_transp_nac: TSpeedButton
        Left = 238
        Top = 289
        Width = 19
        Height = 18
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
        OnClick = btn_co_transp_nacClick
      end
      object lbl_conhecimento: TLabel
        Left = 572
        Top = 77
        Width = 98
        Height = 13
        Caption = 'Nr Conhecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_nr_conhecimento_master: TLabel
        Left = 572
        Top = 115
        Width = 140
        Height = 13
        Caption = 'Nr Conhecimento Master'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 115
        Width = 35
        Height = 13
        AutoSize = False
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_grupo: TSpeedButton
        Left = 238
        Top = 129
        Width = 19
        Height = 18
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
      object lbl_evento: TLabel
        Left = 292
        Top = 236
        Width = 41
        Height = 13
        AutoSize = False
        Caption = 'Evento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_evento: TSpeedButton
        Left = 514
        Top = 250
        Width = 19
        Height = 18
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
        OnClick = btn_co_eventoClick
      end
      object lbl_importador: TLabel
        Left = 16
        Top = 156
        Width = 61
        Height = 13
        AutoSize = False
        Caption = 'Importador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_importador: TSpeedButton
        Left = 238
        Top = 170
        Width = 19
        Height = 18
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
        OnClick = btn_co_importadorClick
      end
      object lbl_exportador: TLabel
        Left = 16
        Top = 198
        Width = 62
        Height = 13
        AutoSize = False
        Caption = 'Exportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_exportador: TSpeedButton
        Left = 238
        Top = 212
        Width = 19
        Height = 18
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
        OnClick = btn_co_exportadorClick
      end
      object lbl_periodo: TLabel
        Left = 572
        Top = 0
        Width = 106
        Height = 13
        Caption = 'Per'#237'odo ( Evento )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 663
        Top = 15
        Width = 8
        Height = 13
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dt_abertura: TLabel
        Left = 572
        Top = 38
        Width = 135
        Height = 13
        Caption = 'Per'#237'odo ( Dt. Abertura )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 663
        Top = 52
        Width = 8
        Height = 13
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_viagem: TSpeedButton
        Left = 625
        Top = 212
        Width = 25
        Height = 18
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
        OnClick = btn_co_viagemClick
      end
      object lbl_mercadoria: TLabel
        Left = 15
        Top = 559
        Width = 64
        Height = 13
        Caption = 'Mercadoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_mercadoria: TSpeedButton
        Left = 503
        Top = 572
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
        OnClick = btn_co_mercadoriaClick
      end
      object lbl_transp_int: TLabel
        Left = 16
        Top = 359
        Width = 158
        Height = 13
        AutoSize = False
        Caption = 'Transportador Internacional'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_transportador: TSpeedButton
        Left = 238
        Top = 374
        Width = 19
        Height = 18
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
        OnClick = btn_co_transportadorClick
      end
      object btn_co_contato: TSpeedButton
        Left = 238
        Top = 415
        Width = 19
        Height = 18
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
        OnClick = btn_co_contatoClick
      end
      object lblcontato: TLabel
        Left = 16
        Top = 400
        Width = 45
        Height = 13
        AutoSize = False
        Caption = 'Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblarea: TLabel
        Left = 572
        Top = 359
        Width = 27
        Height = 13
        Caption = #193'rea'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_area: TSpeedButton
        Left = 737
        Top = 374
        Width = 19
        Height = 18
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
        OnClick = btn_co_areaClick
      end
      object Label17: TLabel
        Left = 292
        Top = 443
        Width = 83
        Height = 13
        AutoSize = False
        Caption = 'N'#186' Nota Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 421
        Top = 443
        Width = 51
        Height = 13
        AutoSize = False
        Caption = 'Nr D.T.A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 292
        Top = 316
        Width = 99
        Height = 13
        AutoSize = False
        Caption = 'Tipo de Ref'#234'ncia'
      end
      object lbl_nr_requerimento: TLabel
        Left = 292
        Top = 400
        Width = 97
        Height = 13
        AutoSize = False
        Caption = 'N'#176' Requerimento'
      end
      object lbl_n_ato_drawback: TLabel
        Left = 421
        Top = 400
        Width = 104
        Height = 13
        AutoSize = False
        Caption = 'N'#186' Ato Draw-Back'
      end
      object Label20: TLabel
        Left = 572
        Top = 400
        Width = 80
        Height = 13
        Caption = 'N'#186' Certificado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblItemCliente: TLabel
        Left = 421
        Top = 359
        Width = 31
        Height = 13
        AutoSize = False
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_ce_mercante: TLabel
        Left = 572
        Top = 443
        Width = 74
        Height = 13
        Caption = 'CE Mercante'
      end
      object Label23: TLabel
        Left = 292
        Top = 483
        Width = 83
        Height = 13
        AutoSize = False
        Caption = 'Ruc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label24: TLabel
        Left = 420
        Top = 483
        Width = 83
        Height = 13
        AutoSize = False
        Caption = 'DU-E'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label109: TLabel
        Left = 292
        Top = 275
        Width = 51
        Height = 13
        Caption = 'Fronteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BbtnFronteira: TSpeedButton
        Left = 514
        Top = 289
        Width = 19
        Height = 18
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
        OnClick = BbtnFronteiraClick
      end
      object lbl_loteexp: TLabel
        Left = 574
        Top = 520
        Width = 107
        Height = 13
        AutoSize = False
        Caption = 'Lote (Exporta'#231#227'o)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ncm: TSpeedButton
        Left = 514
        Top = 537
        Width = 19
        Height = 18
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
      object lblNCM: TLabel
        Left = 292
        Top = 520
        Width = 37
        Height = 13
        AutoSize = False
        Caption = 'NCM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 420
        Top = 316
        Width = 99
        Height = 13
        AutoSize = False
        Caption = 'Tipo de Filtro'
      end
      object Label27: TLabel
        Left = 675
        Top = 275
        Width = 58
        Height = 13
        Caption = 'Nr DUIMP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 572
        Top = 319
        Width = 93
        Height = 13
        Caption = 'Nr Transa'#231#227'o LI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnl_consignatario: TPanel
        Left = 12
        Top = 442
        Width = 248
        Height = 56
        BevelOuter = bvNone
        Color = 12043464
        TabOrder = 11
        Visible = False
        object Label21: TLabel
          Left = 4
          Top = -1
          Width = 96
          Height = 13
          AutoSize = False
          Caption = 'Consignat'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_consignatario: TSpeedButton
          Left = 226
          Top = 35
          Width = 19
          Height = 18
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
          OnClick = btn_co_consignatarioClick
        end
        object msk_cd_consignatario: TMaskEdit
          Left = 4
          Top = 35
          Width = 49
          Height = 18
          AutoSize = False
          Ctl3D = False
          EditMask = '!99999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 5
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnChange = btn_co_consignatarioClick
          OnExit = msk_cd_consignatarioExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object edt_nm_consignatario: TEdit
          Left = 55
          Top = 35
          Width = 169
          Height = 18
          TabStop = False
          AutoSize = False
          Color = clMenu
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dblkcbox_consignatario: TDBLookupComboBox
          Left = 4
          Top = 13
          Width = 145
          Height = 19
          Ctl3D = False
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = datm_pesq_proc.ds_tp_pessoa_exp
          ParentCtl3D = False
          TabOrder = 0
        end
      end
      object edt_nm_unid_neg: TEdit
        Left = 66
        Top = 15
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 47
      end
      object edt_nm_produto: TEdit
        Left = 66
        Top = 52
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 53
      end
      object edt_nm_cliente: TEdit
        Left = 66
        Top = 92
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 54
      end
      object edt_nm_servico: TEdit
        Left = 66
        Top = 250
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 55
      end
      object edt_nm_navio: TEdit
        Left = 620
        Top = 170
        Width = 115
        Height = 19
        TabStop = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 56
      end
      object msk_nr_voo: TMaskEdit
        Left = 662
        Top = 212
        Width = 101
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 18
        ParentFont = False
        TabOrder = 40
      end
      object msk_nr_di: TMaskEdit
        Left = 675
        Top = 250
        Width = 89
        Height = 21
        EditMask = '99/9999999-9;0;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 12
        ParentFont = False
        TabOrder = 42
      end
      object msk_nr_dde: TMaskEdit
        Left = 675
        Top = 572
        Width = 90
        Height = 21
        EditMask = '##########-#;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 12
        ParentFont = False
        TabOrder = 44
      end
      object msk_nr_li: TMaskEdit
        Left = 572
        Top = 289
        Width = 92
        Height = 21
        EditMask = '99/9999999-9;0;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 12
        ParentFont = False
        TabOrder = 43
      end
      object edt_nm_local_emb: TEdit
        Left = 341
        Top = 15
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 57
      end
      object edt_nm_local_desemb: TEdit
        Left = 341
        Top = 52
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 58
      end
      object edt_nm_pais_dest: TEdit
        Left = 341
        Top = 92
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 59
      end
      object edt_nm_pais_origem: TEdit
        Left = 341
        Top = 129
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 60
      end
      object msk_nr_re: TMaskEdit
        Left = 572
        Top = 574
        Width = 90
        Height = 21
        EditMask = '!99/9999999-999;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 45
      end
      object msk_cd_ref: TMaskEdit
        Left = 292
        Top = 374
        Width = 123
        Height = 18
        AutoSize = False
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 30
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 23
      end
      object edt_nm_armazem_atracacao: TEdit
        Left = 341
        Top = 170
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 61
      end
      object edt_nm_armazem_descarga: TEdit
        Left = 341
        Top = 212
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 62
      end
      object edt_nm_agente: TEdit
        Left = 66
        Top = 332
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 63
      end
      object msk_nr_cntr: TMaskEdit
        Left = 572
        Top = 250
        Width = 92
        Height = 21
        CharCase = ecUpperCase
        EditMask = 'LLLL-999-999-9;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 41
      end
      object msk_nr_fatura: TMaskEdit
        Left = 572
        Top = 497
        Width = 193
        Height = 18
        AutoSize = False
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 25
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 51
      end
      object dblkpcbox_canal: TDBLookupComboBox
        Left = 675
        Top = 332
        Width = 90
        Height = 21
        DropDownRows = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'CD_CANAL'
        ListField = 'NM_CANAL'
        ListSource = datm_pesq_proc.ds_tp_canal
        ParentFont = False
        TabOrder = 46
      end
      object edt_nm_transp_nac: TEdit
        Left = 66
        Top = 289
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 64
      end
      object msk_nr_conhecimento: TMaskEdit
        Left = 572
        Top = 92
        Width = 191
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        TabOrder = 36
      end
      object msk_nr_conhecimento_master: TMaskEdit
        Left = 572
        Top = 129
        Width = 191
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        TabOrder = 37
      end
      object edt_nm_grupo: TEdit
        Left = 66
        Top = 129
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 65
      end
      object edt_nm_evento: TEdit
        Left = 341
        Top = 250
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 66
      end
      object edt_nm_importador: TEdit
        Left = 66
        Top = 170
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 67
      end
      object edt_nm_exportador: TEdit
        Left = 66
        Top = 212
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 68
      end
      object msk_dt_inicio: TMaskEdit
        Left = 572
        Top = 15
        Width = 86
        Height = 21
        EditMask = '99/99/9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 32
        Text = '  /  /    '
        OnExit = msk_dt_inicioExit
      end
      object msk_dt_fim: TMaskEdit
        Left = 676
        Top = 15
        Width = 87
        Height = 21
        EditMask = '99/99/9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 33
        Text = '  /  /    '
        OnExit = msk_dt_fimExit
      end
      object msk_dt_inicio_abertura: TMaskEdit
        Left = 572
        Top = 52
        Width = 86
        Height = 21
        EditMask = '99/99/9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 34
        Text = '  /  /    '
        OnExit = msk_dt_inicio_aberturaExit
      end
      object msk_dt_fim_abertura: TMaskEdit
        Left = 676
        Top = 52
        Width = 87
        Height = 21
        EditMask = '99/99/9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 35
        Text = '  /  /    '
        OnExit = msk_dt_fim_aberturaExit
      end
      object edt_nm_mercadoria: TEdit
        Left = 167
        Top = 572
        Width = 335
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
        TabOrder = 69
      end
      object edt_nm_transportador: TEdit
        Left = 66
        Top = 374
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 70
      end
      object edt_nm_contato: TEdit
        Left = 66
        Top = 415
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 71
      end
      object edt_nm_area: TEdit
        Left = 620
        Top = 374
        Width = 115
        Height = 19
        TabStop = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 72
      end
      object msk_nr_nota_fiscal: TMaskEdit
        Left = 292
        Top = 459
        Width = 123
        Height = 18
        AutoSize = False
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 25
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 27
      end
      object msk_nr_dta: TMaskEdit
        Left = 421
        Top = 459
        Width = 112
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '99/9999999-9;0;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 12
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 28
      end
      object cb_tp_referencia: TComboBox
        Left = 292
        Top = 330
        Width = 123
        Height = 21
        Style = csDropDownList
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 21
        OnExit = cb_tp_referenciaExit
      end
      object msk_nr_requerimento: TMaskEdit
        Left = 292
        Top = 416
        Width = 123
        Height = 18
        AutoSize = False
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 25
      end
      object msk_nr_ato_drawback: TMaskEdit
        Left = 421
        Top = 416
        Width = 112
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '9999-99-999999-9;0;_'
        MaxLength = 16
        ParentCtl3D = False
        TabOrder = 26
      end
      object msk_cd_contato: TMaskEdit
        Left = 16
        Top = 415
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
        OnChange = btn_co_contatoClick
        OnExit = msk_cd_contatoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_transportador: TMaskEdit
        Left = 16
        Top = 374
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
        OnChange = btn_co_transportadorClick
        OnExit = msk_cd_transportadorExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_agente: TMaskEdit
        Left = 16
        Top = 332
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
        OnChange = btn_co_agenteClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_nr_viagem: TMaskEdit
        Left = 572
        Top = 212
        Width = 53
        Height = 21
        EditMask = '99/99;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 39
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_navio: TMaskEdit
        Left = 572
        Top = 170
        Width = 46
        Height = 19
        Ctl3D = False
        EditMask = '!9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 38
        OnChange = btn_co_navioClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_transp_nac: TMaskEdit
        Left = 16
        Top = 289
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnChange = btn_co_transp_nacClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_servico: TMaskEdit
        Left = 16
        Top = 250
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnChange = btn_co_servicoClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_exportador: TMaskEdit
        Left = 16
        Top = 212
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!99999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnChange = btn_co_exportadorClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_importador: TMaskEdit
        Left = 16
        Top = 170
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!99999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnChange = btn_co_importadorClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_grupo: TMaskEdit
        Left = 16
        Top = 129
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnChange = btn_co_grupoClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_cliente: TMaskEdit
        Left = 16
        Top = 92
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!99999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnChange = btn_co_clienteClick
        OnExit = msk_cd_clienteExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_produto: TMaskEdit
        Left = 16
        Top = 52
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 2
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnChange = btn_co_produtoClick
        OnExit = msk_cd_produtoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_unid_neg: TMaskEdit
        Left = 16
        Top = 15
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 2
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnChange = btn_co_unid_negClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_local_emb: TMaskEdit
        Left = 292
        Top = 15
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 13
        OnChange = btn_co_local_embClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_local_desemb: TMaskEdit
        Left = 292
        Top = 52
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 14
        OnChange = btn_co_local_desembClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_pais_dest: TMaskEdit
        Left = 292
        Top = 92
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 15
        OnChange = btn_co_pais_destClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_pais_origem: TMaskEdit
        Left = 292
        Top = 129
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 16
        OnChange = btn_co_pais_origemClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_armazem_atracacao: TMaskEdit
        Left = 292
        Top = 170
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 17
        OnChange = btn_co_armazem_atracacaoClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_armazem_descarga: TMaskEdit
        Left = 292
        Top = 212
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 18
        OnChange = btn_co_armazem_descargaClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_evento: TMaskEdit
        Left = 292
        Top = 250
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 19
        OnChange = btn_co_eventoClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_mercadoria: TMaskEdit
        Left = 15
        Top = 572
        Width = 150
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 12
        OnChange = btn_co_mercadoriaClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_area: TMaskEdit
        Left = 572
        Top = 374
        Width = 46
        Height = 19
        Ctl3D = False
        EditMask = '!99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 2
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 48
        OnChange = btn_co_areaClick
        OnExit = msk_cd_areaExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_nr_certificado: TMaskEdit
        Left = 572
        Top = 415
        Width = 193
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 49
      end
      object mskItemCliente: TMaskEdit
        Left = 421
        Top = 374
        Width = 60
        Height = 18
        AutoSize = False
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 24
      end
      object msk_ce_mercante: TMaskEdit
        Left = 572
        Top = 458
        Width = 193
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 50
      end
      object mskRuc: TMaskEdit
        Left = 292
        Top = 497
        Width = 123
        Height = 18
        AutoSize = False
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 35
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 29
      end
      object mskDue: TMaskEdit
        Left = 421
        Top = 497
        Width = 112
        Height = 18
        AutoSize = False
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 14
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 30
      end
      object mskCDFronteira: TMaskEdit
        Left = 292
        Top = 289
        Width = 48
        Height = 18
        AutoSize = False
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 20
        OnChange = BbtnFronteiraClick
      end
      object edtFronteira: TEdit
        Left = 341
        Top = 289
        Width = 170
        Height = 18
        TabStop = False
        AutoSize = False
        Color = clMenu
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 73
      end
      object msk_lote_exp: TMaskEdit
        Left = 572
        Top = 536
        Width = 193
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 25
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 52
      end
      object msk_cd_ncm: TMaskEdit
        Left = 292
        Top = 537
        Width = 219
        Height = 18
        AutoSize = False
        Ctl3D = False
        EditMask = '!99999999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 8
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 31
        OnChange = btn_co_pais_destClick
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object cb_tp_filtro: TComboBox
        Left = 421
        Top = 330
        Width = 112
        Height = 21
        Style = csDropDownList
        Ctl3D = True
        Enabled = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 22
        Text = 'IGUAL'
        Items.Strings = (
          'IGUAL'
          'CONTENDO')
      end
      object msk_nr_duimp: TMaskEdit
        Left = 675
        Top = 289
        Width = 102
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 74
      end
      object msk_li_transacao: TMaskEdit
        Left = 572
        Top = 332
        Width = 92
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 75
      end
    end
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_lib_proc: TDBGrid
        Left = 0
        Top = 64
        Width = 784
        Height = 572
        Align = alClient
        Ctl3D = False
        DataSource = datm_pesq_proc.ds_pesq
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbg_lib_procDrawColumnCell
        OnDblClick = dbg_lib_procDblClick
        OnKeyDown = dbg_lib_procKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'calc_nr_processo'
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
            FieldName = 'CD_CLIENTE'
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
            FieldName = 'AP_EMPRESA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 179
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_SERVICO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_SERVICO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 236
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 64
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        DesignSize = (
          784
          64)
        object Shape1: TShape
          Left = 6
          Top = 5
          Width = 780
          Height = 53
          Anchors = [akLeft, akTop, akRight]
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label12: TLabel
          Left = 13
          Top = 14
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
        object Label13: TLabel
          Left = 325
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
        object Shape3: TShape
          Left = 656
          Top = 39
          Width = 16
          Height = 16
          Brush.Color = 4210943
          Pen.Color = clGray
        end
        object Label22: TLabel
          Left = 673
          Top = 41
          Width = 51
          Height = 13
          Caption = 'Cancelado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 56
          Top = 28
          Width = 260
          Height = 22
          TabStop = False
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          DataField = 'NM_UNID_NEG'
          DataSource = datm_pesq_proc.ds_pesq
          ParentColor = True
          ParentCtl3D = False
          TabOrder = 0
        end
        object dbedt_nm_produto: TDBEdit
          Left = 369
          Top = 28
          Width = 260
          Height = 22
          TabStop = False
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          DataField = 'NM_PRODUTO'
          DataSource = datm_pesq_proc.ds_pesq
          ParentColor = True
          ParentCtl3D = False
          TabOrder = 3
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 14
          Top = 28
          Width = 43
          Height = 22
          TabStop = False
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          DataField = 'CD_UNID_NEG'
          DataSource = datm_pesq_proc.ds_pesq
          ParentColor = True
          ParentCtl3D = False
          TabOrder = 1
        end
        object dbedt_cd_produto: TDBEdit
          Left = 326
          Top = 28
          Width = 44
          Height = 22
          TabStop = False
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          DataField = 'CD_PRODUTO'
          DataSource = datm_pesq_proc.ds_pesq
          ParentColor = True
          ParentCtl3D = False
          TabOrder = 2
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 220
    Top = 12
    object mi_manut_proc: TMenuItem
      Caption = '&Manuten'#231#227'o do Processo'
      Enabled = False
      ShortCut = 113
      Visible = False
      OnClick = btn_manut_procClick
    end
    object mi_proc_realiza: TMenuItem
      Caption = 'Realiza'#231#227'o por &Processo'
      Enabled = False
      ShortCut = 16497
      Visible = False
      OnClick = btn_proc_realizaClick
    end
    object mi_imprimir: TMenuItem
      Caption = '&Imprimir'
      Visible = False
      OnClick = btn_imprimirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object crp_proc: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 376
    Top = 164
  end
end
