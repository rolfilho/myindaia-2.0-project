object frm_pedido_instrucao: Tfrm_pedido_instrucao
  Left = 100
  Top = 128
  Width = 750
  Height = 550
  Caption = 'Pedido de Instruc'#227'o'
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label58: TLabel
    Left = 128
    Top = 81
    Width = 38
    Height = 13
    Caption = 'Label58'
  end
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 50
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      50)
    object shp2: TShape
      Left = 478
      Top = 5
      Width = 254
      Height = 41
      Anchors = [akTop, akRight]
      Pen.Color = clGray
    end
    object btn_sair: TSpeedButton
      Left = 434
      Top = 4
      Width = 36
      Height = 42
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
      Left = 4
      Top = 4
      Width = 40
      Height = 42
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
      Left = 44
      Top = 4
      Width = 40
      Height = 42
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
    object btn_imprimir: TSpeedButton
      Left = 396
      Top = 4
      Width = 38
      Height = 42
      Anchors = [akTop, akRight]
      Enabled = False
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
      OnClick = btn_imprimirClick
    end
    object btn_liberar: TSpeedButton
      Left = 130
      Top = 4
      Width = 38
      Height = 42
      Hint = 'Aprovar Pedido '
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
      OnClick = btn_liberarClick
    end
    object btn_master: TSpeedButton
      Left = 168
      Top = 4
      Width = 38
      Height = 42
      Hint = 'Montar Conhecimento'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
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
      Layout = blGlyphRight
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_masterClick
    end
    object btn_pre_alerta: TSpeedButton
      Left = 206
      Top = 4
      Width = 38
      Height = 42
      Hint = 'Pr'#233' Alerta'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFB
        FB0555557F555555557F55500FBFBFBFBF0555577F555555557F550B0BFBFBFB
        FB05557F7F555555557F500F0FBFBFBFBF05577F7F555555557F0B0B0BFBFBFB
        FB057F7F7F555555557F0F0F0FBFBFBFBF057F7F7FFFFFFFFF750B0B00000000
        00557F7F7777777777550F0FB0FBFB0F05557F7FF75FFF7575550B0007000070
        55557F777577775755550FB0FBFB0F0555557FF75FFF75755555000700007055
        5555777577775755555550FBFB0555555555575FFF7555555555570000755555
        5555557777555555555555555555555555555555555555555555}
      Layout = blGlyphRight
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_pre_alertaClick
    end
    object Label1: TLabel
      Left = 482
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
    object Label2: TLabel
      Left = 602
      Top = 7
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
    object btn_co_conso: TSpeedButton
      Left = 244
      Top = 4
      Width = 38
      Height = 42
      Hint = 'Incluir Novo House'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
        000557777777777777750BBBBBBBBBBBBBB07F5555FFFFFFF5570BBBB0000000
        BBB07F5557777777FF570BBB077BBB770BB07F557755555775570BBBBBBBBBBB
        BBB07F5555FFFFFFF5570BBBB0000000BBB07F5557777777F5570BBBB0FFFFF0
        BBB07F5557FFFFF7F5570BBBB0000000BBB07F555777777755570BBBBBBBBBBB
        BBB07FFFFFFFFFFFFFF700000000000000007777777777777777500FFFFFFFFF
        F005577FF555FFFFF7755500FFF00000005555775FF7777777F5550F777FFFFF
        F055557F777FFF5557F5550000000FFF00555577777775FF77F5550777777000
        7055557FFFFFF777F7F555000000000000555577777777777755}
      Layout = blGlyphRight
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_co_consoClick
    end
    object btn_liberar_comerc: TSpeedButton
      Left = 92
      Top = 4
      Width = 38
      Height = 42
      Hint = 'Tranferir p/ Operacional'
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
      Visible = False
      OnClick = btn_liberar_comercClick
    end
    object dbnavg: TDBNavigator
      Left = 289
      Top = 11
      Width = 100
      Height = 25
      DataSource = datm_pedido_instrucao.ds_processo
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      TabOrder = 0
    end
    object edt_chave: TEdit
      Left = 482
      Top = 20
      Width = 118
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 602
      Top = 20
      Width = 126
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
      TabStop = False
      OnChange = cb_ordemChange
    end
  end
  object pgctrl_pedido_instrucao: TPageControl
    Left = 0
    Top = 50
    Width = 742
    Height = 454
    ActivePage = ts_dados_maritimos
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_pedido_instrucaoChange
    OnChanging = pgctrl_pedido_instrucaoChanging
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object dbgrid_maritimo: TDBGrid
        Left = 0
        Top = 51
        Width = 734
        Height = 375
        Align = alClient
        DataSource = datm_pedido_instrucao.ds_processo
        TabOrder = 2
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
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CLIENTE'
            Title.Caption = 'Cliente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 173
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_CIDADE_ORIGEM'
            Title.Caption = 'Origem'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 149
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_CIDADE_DESTINO'
            Title.Caption = 'Destino'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 176
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'calc_tp_processo'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 54
            Visible = True
          end>
      end
      object dbgrid_aereo: TDBGrid
        Left = 0
        Top = 51
        Width = 734
        Height = 375
        Align = alClient
        DataSource = datm_pedido_instrucao.ds_processo
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
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
            FieldName = 'calc_processo'
            Title.Caption = 'Processo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CLIENTE'
            Title.Caption = 'Cliente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 193
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_ORIGEM'
            Title.Caption = 'Origem'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 169
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_DESTINO'
            Title.Caption = 'Destino'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 166
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'calc_tp_processo'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 54
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 51
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label62: TLabel
          Left = 9
          Top = 9
          Width = 99
          Height = 13
          Caption = 'Unidade Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_unid: TSpeedButton
          Left = 308
          Top = 21
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
          OnClick = btn_unidClick
        end
        object Label21: TLabel
          Left = 343
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
        object btn_co_produto: TSpeedButton
          Left = 640
          Top = 21
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
          OnClick = btn_co_produtoClick
        end
        object edt_nm_unid: TEdit
          Left = 40
          Top = 22
          Width = 267
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object msk_cd_unid: TMaskEdit
          Left = 10
          Top = 22
          Width = 31
          Height = 21
          EditMask = '99;1;_'
          MaxLength = 2
          TabOrder = 0
          Text = '  '
          OnChange = btn_unidClick
          OnExit = msk_cd_unidExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object edt_nm_produto: TEdit
          Left = 369
          Top = 22
          Width = 270
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object msk_cd_produto: TMaskEdit
          Left = 343
          Top = 22
          Width = 27
          Height = 21
          EditMask = '99;1;_'
          MaxLength = 2
          TabOrder = 2
          Text = '  '
          OnExit = msk_cd_produtoExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 224
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label7: TLabel
          Left = 18
          Top = 56
          Width = 61
          Height = 13
          Caption = 'Importador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 203
          Top = 173
          Width = 34
          Height = 13
          Caption = 'Carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 106
          Top = 173
          Width = 59
          Height = 13
          Caption = 'Tipo Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 19
          Top = 173
          Width = 56
          Height = 13
          Caption = 'Incoterms'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_exportador: TSpeedButton
          Left = 319
          Top = 68
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
          OnClick = btn_co_exportadorClick
        end
        object lb_agente: TLabel
          Left = 364
          Top = 128
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
        object Label20: TLabel
          Left = 18
          Top = 134
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
        object btn_co_moeda: TSpeedButton
          Left = 162
          Top = 147
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
          OnClick = btn_co_moedaClick
        end
        object Label16: TLabel
          Left = 363
          Top = 53
          Width = 63
          Height = 13
          Caption = 'Companhia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 363
          Top = 91
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
        object Label19: TLabel
          Left = 18
          Top = 96
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
        object Label27: TLabel
          Left = 18
          Top = 15
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
        object Label6: TLabel
          Left = 363
          Top = 14
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
        object Label42: TLabel
          Left = 198
          Top = 134
          Width = 64
          Height = 13
          Caption = 'Ref.Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label53: TLabel
          Left = 364
          Top = 172
          Width = 125
          Height = 13
          Caption = 'Descri'#231#227'o Mercadoria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pnl_master_direto: TPanel
          Left = 104
          Top = 12
          Width = 240
          Height = 46
          BevelInner = bvLowered
          TabOrder = 1
          object Label3: TLabel
            Left = 9
            Top = 4
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
          object dbedt_nr_master_direto: TDBEdit
            Left = 9
            Top = 17
            Width = 154
            Height = 21
            Color = clMenu
            DataField = 'NR_MASTER'
            DataSource = datm_pedido_instrucao.ds_conhecimento
            ReadOnly = True
            TabOrder = 0
          end
        end
        object pn_bc_bc: TPanel
          Left = 104
          Top = 12
          Width = 240
          Height = 46
          BevelInner = bvLowered
          TabOrder = 0
          object Label13: TLabel
            Left = 9
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
          object Label14: TLabel
            Left = 118
            Top = 5
            Width = 37
            Height = 13
            Caption = 'House'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_nr_master: TDBEdit
            Left = 9
            Top = 19
            Width = 86
            Height = 21
            Color = clMenu
            DataField = 'NR_MASTER'
            DataSource = datm_pedido_instrucao.ds_conhecimento
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_nr_house: TDBEdit
            Left = 119
            Top = 18
            Width = 86
            Height = 21
            Color = clMenu
            DataField = 'NR_HOUSE'
            DataSource = datm_pedido_instrucao.ds_conhecimento
            ReadOnly = True
            TabOrder = 0
          end
        end
        object DBEdit10: TDBEdit
          Left = 199
          Top = 147
          Width = 146
          Height = 21
          DataField = 'REF_CLIENTE'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          OnChange = dbedt_cd_agenteChange
        end
        object dbLookCB_incoterm: TDBLookupComboBox
          Left = 19
          Top = 186
          Width = 78
          Height = 21
          DataField = 'Look_tp_incoterm'
          DataSource = datm_pedido_instrucao.ds_processo
          ListField = 'CODIGO'
          TabOrder = 20
          OnClick = dbLookCB_incotermClick
        end
        object RxDBComboBox1: TRxDBComboBox
          Left = 204
          Top = 186
          Width = 142
          Height = 21
          Style = csDropDownList
          DataField = 'TP_CARGA'
          DataSource = datm_pedido_instrucao.ds_processo
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Normal'
            'Perigosa'
            'Perec'#237'vel'
            'Animal Vivo'
            'Outros'
            'Todos')
          TabOrder = 22
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5')
          OnChange = dbedt_cd_clienteChange
        end
        object pnl_dados_direto: TPanel
          Left = 517
          Top = 169
          Width = 192
          Height = 45
          BevelInner = bvLowered
          TabOrder = 18
          object Label9: TLabel
            Left = 6
            Top = 3
            Width = 40
            Height = 13
            Caption = 'Nr V'#244'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 102
            Top = 4
            Width = 72
            Height = 13
            Caption = 'Data do V'#244'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_nr_voo: TDBEdit
            Left = 7
            Top = 16
            Width = 89
            Height = 21
            DataField = 'NR_VOO'
            DataSource = datm_pedido_instrucao.ds_conhecimento
            TabOrder = 0
            OnChange = dbedt_nr_vooChange
          end
          object dbedt_dt_voo: TDBEdit
            Left = 103
            Top = 17
            Width = 80
            Height = 21
            DataField = 'DT_PREV_SAIDA'
            DataSource = datm_pedido_instrucao.ds_conhecimento
            TabOrder = 1
            OnChange = dbedt_nr_vooChange
          end
        end
        object DBEdit1: TDBEdit
          Left = 18
          Top = 27
          Width = 79
          Height = 21
          Color = clMenu
          DataField = 'calc_processo'
          DataSource = datm_pedido_instrucao.ds_processo
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_nm_cliente: TDBEdit
          Left = 407
          Top = 27
          Width = 301
          Height = 21
          Color = clMenu
          DataField = 'NM_CLIENTE'
          DataSource = datm_pedido_instrucao.ds_processo
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_nm_importador: TDBEdit
          Left = 62
          Top = 69
          Width = 256
          Height = 21
          Color = clMenu
          DataField = 'NM_IMP'
          DataSource = datm_pedido_instrucao.ds_processo
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_nm_companhia: TDBEdit
          Left = 401
          Top = 67
          Width = 307
          Height = 21
          Color = clMenu
          DataField = 'NM_CIA'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_nm_origem: TDBEdit
          Left = 58
          Top = 109
          Width = 287
          Height = 21
          Color = clMenu
          DataField = 'NM_ORIGEM'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object dbet_nm_destino: TDBEdit
          Left = 401
          Top = 105
          Width = 307
          Height = 21
          Color = clMenu
          DataField = 'NM_DESTINO'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_nm_moeda: TDBEdit
          Left = 53
          Top = 147
          Width = 108
          Height = 21
          Color = clMenu
          DataField = 'NM_MOEDA'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
        end
        object dbedt_nm_agente: TDBEdit
          Left = 403
          Top = 141
          Width = 305
          Height = 21
          Color = clMenu
          DataField = 'NM_AGENTE'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object dblk_tp_frete_aereo: TDBLookupComboBox
          Left = 108
          Top = 186
          Width = 86
          Height = 21
          Color = clMenu
          DataField = 'Look_tp_frete'
          DataSource = datm_pedido_instrucao.ds_processo
          ReadOnly = True
          TabOrder = 21
        end
        object DBEdit18: TDBEdit
          Left = 364
          Top = 185
          Width = 146
          Height = 21
          DataField = 'DESCR_MERCADORIA'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          OnChange = dbedt_cd_clienteChange
        end
        object dbedt_cd_importador: TDBEdit
          Left = 18
          Top = 69
          Width = 45
          Height = 21
          DataField = 'CD_EMP_EST'
          DataSource = datm_pedido_instrucao.ds_processo
          TabOrder = 7
          OnChange = dbedt_cd_clienteChange
          OnExit = dbedt_cd_importadorExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_cd_origem: TDBEdit
          Left = 18
          Top = 109
          Width = 41
          Height = 21
          Color = clMenu
          DataField = 'CD_ORIGEM'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
          OnChange = dbedt_cd_agenteChange
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_cd_moeda: TDBEdit
          Left = 18
          Top = 147
          Width = 36
          Height = 21
          DataField = 'CD_MOEDA_FRETE'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          OnChange = dbedt_cd_agenteChange
          OnExit = dbedt_cd_moedaExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_cd_agente: TDBEdit
          Left = 364
          Top = 141
          Width = 40
          Height = 21
          Color = clMenu
          DataField = 'CD_AGENTE'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
          OnChange = dbedt_cd_agenteChange
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_cd_cliente: TDBEdit
          Left = 364
          Top = 27
          Width = 44
          Height = 21
          Color = clMenu
          DataField = 'CD_CLIENTE'
          DataSource = datm_pedido_instrucao.ds_processo
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_cd_clienteChange
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_cd_companhia: TDBEdit
          Left = 364
          Top = 67
          Width = 38
          Height = 21
          Color = clMenu
          DataField = 'CD_CIA_TRANSP'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          OnChange = dbedt_cd_agenteChange
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_cd_destino: TDBEdit
          Left = 364
          Top = 105
          Width = 38
          Height = 21
          Color = clMenu
          DataField = 'CD_DESTINO'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
          OnChange = dbedt_cd_agenteChange
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 224
        Width = 734
        Height = 202
        Align = alClient
        Caption = 'Caracter'#237'stica da Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object dbgrid_carga: TDBGrid
          Left = 9
          Top = 17
          Width = 536
          Height = 175
          Hint = 'Ctrl + Delete para excluir registro'
          DataSource = datm_pedido_instrucao.ds_processo_carga
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnEnter = dbgrid_cargaEnter
          OnExit = dbgrid_cargaExit
          Columns = <
            item
              Expanded = False
              FieldName = 'QTDE'
              Title.Caption = 'Qtde'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_COMPR'
              Title.Caption = 'Compr (m)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_LARG'
              Title.Caption = 'Largura (m)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_ALT'
              Title.Caption = 'Altura (m)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO_KG'
              Title.Caption = 'Peso Bruto (Kg)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO_VOLUMETRICO'
              Title.Caption = 'Peso Volum'#233'trico'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUBAGEM_VENDA'
              ReadOnly = True
              Title.Caption = 'Const. Cubagem'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 87
              Visible = True
            end>
        end
        object Panel3: TPanel
          Left = 552
          Top = 16
          Width = 172
          Height = 177
          BevelInner = bvLowered
          TabOrder = 0
          object Label5: TLabel
            Left = 14
            Top = 48
            Width = 61
            Height = 13
            Caption = 'Total Qtde'
          end
          object Label8: TLabel
            Left = 14
            Top = 128
            Width = 132
            Height = 13
            Caption = 'Total Peso Volum'#233'trico'
            Transparent = True
          end
          object Label4: TLabel
            Left = 14
            Top = 87
            Width = 123
            Height = 13
            Caption = 'Total Peso Bruto (Kg)'
          end
          object shp1: TShape
            Left = 15
            Top = 14
            Width = 142
            Height = 27
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object dbedcheck_in_cubagem: TDBCheckBox
            Left = 23
            Top = 19
            Width = 121
            Height = 17
            Caption = 'Cubagem Padr'#227'o'
            DataField = 'IN_CUBAGEM'
            DataSource = datm_pedido_instrucao.ds_processo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEdit4: TDBEdit
            Left = 15
            Top = 61
            Width = 142
            Height = 21
            Color = clMenu
            DataField = 'QTD_VOLUME'
            DataSource = datm_pedido_instrucao.ds_processo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit5: TDBEdit
            Left = 15
            Top = 141
            Width = 142
            Height = 21
            Color = clMenu
            DataField = 'CUBAGEM'
            DataSource = datm_pedido_instrucao.ds_processo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBEdit3: TDBEdit
            Left = 15
            Top = 100
            Width = 142
            Height = 21
            Color = clMenu
            DataField = 'VL_PESO_BRUTO'
            DataSource = datm_pedido_instrucao.ds_processo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
        end
      end
    end
    object ts_dados_maritimos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 178
        BevelInner = bvLowered
        TabOrder = 0
        object Label15: TLabel
          Left = 11
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
        object Label17: TLabel
          Left = 355
          Top = 14
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
          Left = 11
          Top = 54
          Width = 61
          Height = 13
          Caption = 'Importador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_imp_marit: TSpeedButton
          Left = 321
          Top = 66
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
          OnClick = btn_co_imp_maritClick
        end
        object Label23: TLabel
          Left = 356
          Top = 54
          Width = 47
          Height = 13
          Caption = 'Armador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 113
          Top = 93
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
        object Label26: TLabel
          Left = 11
          Top = 93
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
        object Label28: TLabel
          Left = 217
          Top = 93
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
        object btn_co_moeda_marit: TSpeedButton
          Left = 321
          Top = 105
          Width = 24
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
          OnClick = btn_co_moeda_maritClick
        end
        object lb_ag_marit: TLabel
          Left = 356
          Top = 92
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
        object Label30: TLabel
          Left = 167
          Top = 132
          Width = 56
          Height = 13
          Caption = 'Incoterms'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 241
          Top = 132
          Width = 59
          Height = 13
          Caption = 'Tipo Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 430
          Top = 130
          Width = 34
          Height = 13
          Caption = 'Carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 355
          Top = 130
          Width = 60
          Height = 13
          Caption = 'Estufagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 11
          Top = 132
          Width = 64
          Height = 13
          Caption = 'Ref.Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label46: TLabel
          Left = 515
          Top = 129
          Width = 125
          Height = 13
          Caption = 'Descri'#231#227'o Mercadoria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pnl_book_direto: TPanel
          Left = 116
          Top = 11
          Width = 230
          Height = 43
          BevelInner = bvLowered
          TabOrder = 1
          object Label39: TLabel
            Left = 6
            Top = 3
            Width = 47
            Height = 13
            Caption = 'Booking'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_nr_book_direto: TDBEdit
            Left = 6
            Top = 16
            Width = 119
            Height = 21
            DataField = 'NR_BOOKING'
            DataSource = datm_pedido_instrucao.ds_conhecimento
            TabOrder = 0
            OnChange = dbedt_nr_vooChange
            OnExit = dbedt_nr_book_diretoExit
          end
        end
        object pnl_book_conso: TPanel
          Left = 116
          Top = 11
          Width = 230
          Height = 43
          BevelInner = bvLowered
          TabOrder = 0
          object Label34: TLabel
            Left = 6
            Top = 4
            Width = 47
            Height = 13
            Caption = 'Booking'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label35: TLabel
            Left = 107
            Top = 4
            Width = 37
            Height = 13
            Caption = 'House'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_nr_book_conso: TDBEdit
            Left = 6
            Top = 17
            Width = 86
            Height = 21
            Color = clMenu
            DataField = 'NR_BOOKING'
            DataSource = datm_pedido_instrucao.ds_conhecimento
            ReadOnly = True
            TabOrder = 0
            OnChange = dbedt_nr_vooChange
            OnExit = dbedt_nr_book_consoExit
          end
          object dbedt_nr_house_maritimo: TDBEdit
            Left = 108
            Top = 17
            Width = 86
            Height = 21
            Color = clMenu
            DataField = 'NR_HOUSE'
            DataSource = datm_pedido_instrucao.ds_conhecimento
            ReadOnly = True
            TabOrder = 1
          end
        end
        object DBEdit20: TDBEdit
          Left = 12
          Top = 145
          Width = 149
          Height = 21
          DataField = 'REF_CLIENTE'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          OnChange = dbedt_cd_clienteChange
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 167
          Top = 145
          Width = 67
          Height = 21
          DataField = 'Look_tp_incoterm'
          DataSource = datm_pedido_instrucao.ds_processo
          ListField = 'CODIGO'
          TabOrder = 21
          OnClick = dbLookCB_incotermClick
        end
        object rxcombo_tp_estufagem: TRxDBComboBox
          Left = 356
          Top = 143
          Width = 66
          Height = 21
          Style = csDropDownList
          DataField = 'TP_ESTUFAGEM'
          DataSource = datm_pedido_instrucao.ds_processo
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'LCL'
            'FCL')
          TabOrder = 18
          Values.Strings = (
            '0'
            '1')
          OnChange = rxcombo_tp_estufagemChange
        end
        object RxDBComboBox2: TRxDBComboBox
          Left = 431
          Top = 143
          Width = 75
          Height = 21
          Style = csDropDownList
          DataField = 'TP_CARGA'
          DataSource = datm_pedido_instrucao.ds_processo
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Normal'
            'Perigosa'
            'Perec'#237'vel'
            'Animal Vivo'
            'Outros'
            'Todos')
          TabOrder = 19
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5')
          OnChange = dbedt_cd_clienteChange
        end
        object DBEdit21: TDBEdit
          Left = 516
          Top = 142
          Width = 203
          Height = 21
          DataField = 'DESCR_MERCADORIA'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          OnChange = dbedt_cd_clienteChange
        end
        object DBEdit2: TDBEdit
          Left = 12
          Top = 27
          Width = 98
          Height = 21
          Color = clMenu
          DataField = 'calc_processo'
          DataSource = datm_pedido_instrucao.ds_processo
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit7: TDBEdit
          Left = 399
          Top = 27
          Width = 319
          Height = 21
          Color = clMenu
          DataField = 'NM_CLIENTE'
          DataSource = datm_pedido_instrucao.ds_processo
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_nm_imp_marit: TDBEdit
          Left = 53
          Top = 67
          Width = 268
          Height = 21
          Color = clMenu
          DataField = 'NM_IMP'
          DataSource = datm_pedido_instrucao.ds_processo
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit11: TDBEdit
          Left = 393
          Top = 67
          Width = 326
          Height = 21
          Color = clMenu
          DataField = 'NM_ARMADOR'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit14: TDBEdit
          Left = 45
          Top = 106
          Width = 57
          Height = 21
          Color = clMenu
          DataField = 'AP_CIDADE_ORIGEM'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit13: TDBEdit
          Left = 113
          Top = 106
          Width = 32
          Height = 21
          Color = clMenu
          DataField = 'CD_DESTINO'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
          OnChange = dbedt_cd_agenteChange
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object DBEdit12: TDBEdit
          Left = 147
          Top = 106
          Width = 60
          Height = 21
          Color = clMenu
          DataField = 'AP_CIDADE_DESTINO'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object dbedt_nm_moeda_marit: TDBEdit
          Left = 250
          Top = 106
          Width = 70
          Height = 21
          Color = clMenu
          DataField = 'NM_MOEDA'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_nm_ag_marit: TDBEdit
          Left = 395
          Top = 106
          Width = 324
          Height = 21
          Color = clMenu
          DataField = 'NM_AGENTE'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
        end
        object dblk_tp_frete_marit: TDBLookupComboBox
          Left = 243
          Top = 145
          Width = 78
          Height = 21
          Color = clMenu
          DataField = 'Look_tp_frete'
          DataSource = datm_pedido_instrucao.ds_processo
          ReadOnly = True
          TabOrder = 22
        end
        object dbedt_cd_ag_marit: TDBEdit
          Left = 356
          Top = 106
          Width = 40
          Height = 21
          Color = clMenu
          DataField = 'CD_AGENTE'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
          OnChange = dbedt_cd_agenteChange
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_cd_armador: TDBEdit
          Left = 356
          Top = 67
          Width = 38
          Height = 21
          Color = clMenu
          DataField = 'CD_ARMADOR'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
          OnChange = dbedt_cd_agenteChange
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object DBEdit6: TDBEdit
          Left = 356
          Top = 27
          Width = 44
          Height = 21
          Color = clMenu
          DataField = 'CD_CLIENTE'
          DataSource = datm_pedido_instrucao.ds_processo
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_cd_clienteChange
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object DBEdit15: TDBEdit
          Left = 12
          Top = 106
          Width = 34
          Height = 21
          Color = clMenu
          DataField = 'CD_ORIGEM'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
          OnChange = dbedt_cd_agenteChange
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_cd_imp_marit: TDBEdit
          Left = 12
          Top = 67
          Width = 42
          Height = 21
          DataField = 'CD_EMP_EST'
          DataSource = datm_pedido_instrucao.ds_processo
          TabOrder = 5
          OnChange = dbedt_cd_clienteChange
          OnExit = dbedt_cd_imp_maritExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_cd_moeda_marit: TDBEdit
          Left = 217
          Top = 106
          Width = 34
          Height = 21
          DataField = 'CD_MOEDA_FRETE'
          DataSource = datm_pedido_instrucao.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          OnChange = dbedt_cd_agenteChange
          OnExit = dbedt_cd_moedaExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
      end
      object Panel5: TPanel
        Left = 8
        Top = 187
        Width = 717
        Height = 90
        BevelInner = bvLowered
        TabOrder = 1
        object Label44: TLabel
          Left = 10
          Top = 8
          Width = 34
          Height = 13
          Caption = 'Navio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_navio: TSpeedButton
          Left = 320
          Top = 20
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
          OnClick = btn_co_navioClick
        end
        object lb_retirada: TLabel
          Left = 356
          Top = 48
          Width = 194
          Height = 13
          Caption = 'Terminal Retirada Contanier Vazio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_arm_retirada: TSpeedButton
          Left = 672
          Top = 60
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
          OnClick = btn_co_arm_retiradaClick
        end
        object Label47: TLabel
          Left = 9
          Top = 47
          Width = 101
          Height = 13
          Caption = 'Terminal Entrega '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_descarga: TSpeedButton
          Left = 320
          Top = 59
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
          OnClick = btn_co_descargaClick
        end
        object btn_co_notificador: TSpeedButton
          Left = 672
          Top = 20
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
          OnClick = btn_co_notificadorClick
        end
        object Label50: TLabel
          Left = 357
          Top = 8
          Width = 191
          Height = 13
          Caption = 'Local e entrega da DDE Liberada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nm_veiculo: TDBEdit
          Left = 45
          Top = 21
          Width = 274
          Height = 21
          Color = clMenu
          DataField = 'NM_VEICULO'
          DataSource = datm_pedido_instrucao.ds_conhecimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_nm_descarga: TDBEdit
          Left = 45
          Top = 60
          Width = 274
          Height = 21
          Color = clMenu
          DataField = 'NM_ARMAZEM_DESCARGA'
          DataSource = datm_pedido_instrucao.ds_conhecimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_nm_notificador: TDBEdit
          Left = 390
          Top = 21
          Width = 281
          Height = 21
          Color = clMenu
          DataField = 'NM_NOTIFICADOR'
          DataSource = datm_pedido_instrucao.ds_conhecimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nm_atracacao: TDBEdit
          Left = 393
          Top = 61
          Width = 278
          Height = 21
          Color = clMenu
          DataField = 'NM_ARMAZEM_RETIRADA'
          DataSource = datm_pedido_instrucao.ds_conhecimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_veiculo: TDBEdit
          Left = 10
          Top = 21
          Width = 36
          Height = 21
          Color = clWhite
          DataField = 'CD_VEICULO'
          DataSource = datm_pedido_instrucao.ds_conhecimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_nr_vooChange
          OnExit = dbedt_cd_veiculoExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_cd_descarga: TDBEdit
          Left = 10
          Top = 60
          Width = 36
          Height = 21
          Color = clWhite
          DataField = 'CD_ARMAZEM_DESCARGA'
          DataSource = datm_pedido_instrucao.ds_conhecimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = dbedt_nr_vooChange
          OnExit = dbedt_cd_descargaExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_cd_notificador: TDBEdit
          Left = 357
          Top = 21
          Width = 34
          Height = 21
          Color = clWhite
          DataField = 'CD_NOTIFICADOR'
          DataSource = datm_pedido_instrucao.ds_conhecimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_nr_vooChange
          OnExit = dbedt_cd_notificadorExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
        object dbedt_cd_atracacao: TDBEdit
          Left = 357
          Top = 61
          Width = 37
          Height = 21
          Color = clWhite
          DataField = 'CD_ARMAZEM_ATRACACAO'
          DataSource = datm_pedido_instrucao.ds_conhecimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnChange = dbedt_nr_vooChange
          OnExit = dbedt_cd_atracacaoExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
        end
      end
      object Panel8: TPanel
        Left = 2
        Top = 286
        Width = 142
        Height = 138
        BevelInner = bvLowered
        Caption = 'Panel8'
        TabOrder = 2
        object Label36: TLabel
          Left = 9
          Top = 12
          Width = 59
          Height = 13
          Caption = 'Nr Viagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 9
          Top = 53
          Width = 73
          Height = 13
          Caption = 'Data Viagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label45: TLabel
          Left = 9
          Top = 89
          Width = 59
          Height = 13
          Caption = 'Dead Line'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nr_viagem: TDBEdit
          Left = 9
          Top = 26
          Width = 125
          Height = 21
          DataField = 'NR_VOO'
          DataSource = datm_pedido_instrucao.ds_conhecimento
          TabOrder = 0
          OnChange = dbedt_nr_vooChange
        end
        object dbedt_dt_viagem: TDBEdit
          Left = 9
          Top = 66
          Width = 125
          Height = 21
          DataField = 'DT_PREV_SAIDA'
          DataSource = datm_pedido_instrucao.ds_conhecimento
          TabOrder = 1
          OnChange = dbedt_nr_vooChange
        end
        object dbedt_dead_line: TDBEdit
          Left = 9
          Top = 103
          Width = 125
          Height = 21
          DataField = 'DT_DEAD_LINE'
          DataSource = datm_pedido_instrucao.ds_conhecimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_nr_vooChange
        end
      end
      object nbEstufagem: TNotebook
        Left = 148
        Top = 281
        Width = 581
        Height = 144
        PageIndex = 1
        TabOrder = 3
        object TPage
          Left = 0
          Top = 0
          Caption = 'FCL'
          object pnl_fcl: TGroupBox
            Left = 0
            Top = 0
            Width = 581
            Height = 144
            Align = alClient
            Caption = 'Caracter'#237'ticas da Carga'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object dbgrid_fcl: TDBGrid
              Left = 7
              Top = 15
              Width = 475
              Height = 121
              DataSource = datm_pedido_instrucao.ds_proc_cntr
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              OnColExit = dbgrid_fclColExit
              OnDblClick = dbgrid_fclDblClick
              OnEnter = dbgrid_cargaEnter
              OnExit = dbgrid_fclExit
              OnKeyDown = dbgrid_fclKeyDown
              Columns = <
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'NR_CNTR'
                  Title.Caption = 'Numero Cntr'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 84
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TP_CNTR'
                  Title.Caption = 'C'#243'd.'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Color = 16776176
                  Expanded = False
                  FieldName = 'calcNomeCNTR'
                  Title.Caption = 'Cont'#226'iner'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 113
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'VL_PESO_TON'
                  Title.Caption = 'Peso Bruto (TON)'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 104
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'VL_CUBAGEM'
                  Title.Caption = 'Cubagem(M3)'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 77
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'VL_VENDA'
                  Title.Caption = 'Valor Venda'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = False
                end>
            end
            object Panel6: TPanel
              Left = 486
              Top = 15
              Width = 90
              Height = 121
              BevelInner = bvLowered
              TabOrder = 1
              object Label40: TLabel
                Left = 6
                Top = 6
                Width = 61
                Height = 13
                Caption = 'Total Qtde'
              end
              object Label41: TLabel
                Left = 6
                Top = 42
                Width = 68
                Height = 13
                Caption = 'Total (TON)'
              end
              object Label48: TLabel
                Left = 6
                Top = 79
                Width = 59
                Height = 13
                Caption = 'Total (M3)'
              end
              object DBEdit16: TDBEdit
                Left = 7
                Top = 19
                Width = 75
                Height = 21
                Color = clMenu
                DataField = 'QTD_VOLUME'
                DataSource = datm_pedido_instrucao.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object DBEdit17: TDBEdit
                Left = 7
                Top = 55
                Width = 75
                Height = 21
                Color = clMenu
                DataField = 'VL_PESO_BRUTO'
                DataSource = datm_pedido_instrucao.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object DBEdit22: TDBEdit
                Left = 7
                Top = 92
                Width = 75
                Height = 21
                Color = clMenu
                DataField = 'CUBAGEM'
                DataSource = datm_pedido_instrucao.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
            end
          end
        end
        object TPage
          Left = 0
          Top = 0
          HelpContext = 1
          Caption = 'LCL'
          object pnl_lcl: TGroupBox
            Left = 0
            Top = 0
            Width = 581
            Height = 144
            Align = alClient
            Caption = 'Caracteristicas da Carga'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object dbgrid_lcl: TDBGrid
              Left = 7
              Top = 16
              Width = 477
              Height = 118
              DataSource = datm_pedido_instrucao.ds_processo_carga
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              OnDblClick = dbgrid_lclDblClick
              OnEnter = dbgrid_cargaEnter
              OnExit = dbgrid_cargaExit
              OnKeyDown = dbgrid_lclKeyDown
              OnKeyPress = dbgrid_lclKeyPress
              Columns = <
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TP_EMBALAGEM'
                  Title.Caption = 'C'#243'd.'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Color = 16776176
                  Expanded = False
                  FieldName = 'calcEMBALAGEM'
                  Title.Caption = 'Tipo da Embalagem'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 129
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'QTDE'
                  Title.Caption = 'Qtde'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 45
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'PESO_TON'
                  Title.Caption = 'Peso Bruto (TON)'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 116
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'PESO_VOLUMETRICO'
                  Title.Caption = 'Cubagem (M3)'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 99
                  Visible = True
                end>
            end
            object Panel7: TPanel
              Left = 487
              Top = 15
              Width = 89
              Height = 120
              BevelInner = bvLowered
              TabOrder = 0
              object Label29: TLabel
                Left = 6
                Top = 5
                Width = 61
                Height = 13
                Caption = 'Total Qtde'
              end
              object Label33: TLabel
                Left = 6
                Top = 43
                Width = 68
                Height = 13
                Caption = 'Total (TON)'
              end
              object Label49: TLabel
                Left = 6
                Top = 80
                Width = 59
                Height = 13
                Caption = 'Total (M3)'
              end
              object DBEdit8: TDBEdit
                Left = 7
                Top = 18
                Width = 75
                Height = 21
                Color = clMenu
                DataField = 'QTD_VOLUME'
                DataSource = datm_pedido_instrucao.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object DBEdit9: TDBEdit
                Left = 7
                Top = 56
                Width = 75
                Height = 21
                Color = clMenu
                DataField = 'VL_PESO_BRUTO'
                DataSource = datm_pedido_instrucao.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object DBEdit23: TDBEdit
                Left = 7
                Top = 93
                Width = 75
                Height = 21
                Color = clMenu
                DataField = 'CUBAGEM'
                DataSource = datm_pedido_instrucao.ds_processo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
            end
          end
        end
      end
    end
    object ts_conso_aerea: TTabSheet
      Caption = 'Consolidadas'
      ImageIndex = 3
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 177
        Align = alTop
        DataSource = datm_pedido_instrucao.ds_consolidada
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
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_AGENTE'
            Title.Caption = 'Agente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CIA_TRANSP'
            Title.Caption = 'Cia'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_MOEDA'
            Title.Caption = 'Moeda'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ORIGEM'
            Title.Caption = 'Origem'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
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
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PREV_SAIDA'
            Title.Caption = 'Prev Embarque'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_VOO'
            Title.Caption = 'Nr Voo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 81
            Visible = True
          end>
      end
      object Panel9: TPanel
        Left = 0
        Top = 177
        Width = 734
        Height = 249
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel9'
        TabOrder = 1
        object Label51: TLabel
          Left = 0
          Top = 0
          Width = 43
          Height = 13
          Align = alTop
          Caption = 'Houses'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBGrid2: TDBGrid
          Left = 0
          Top = 13
          Width = 734
          Height = 236
          Align = alClient
          DataSource = datm_pedido_instrucao.ds_house
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NR_HOUSE'
              Title.Caption = 'House'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'calc_processo'
              Title.Caption = 'Processo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_CLIENTE'
              Title.Caption = 'C'#243'd.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NM_CLIENTE'
              Title.Caption = 'Cliente'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHARGEABLE'
              Title.Caption = 'Chargeable'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 87
              Visible = True
            end>
        end
      end
    end
    object ts_conso_maritimo: TTabSheet
      Caption = 'Consolidadas'
      ImageIndex = 4
      object Label52: TLabel
        Left = 0
        Top = 177
        Width = 43
        Height = 13
        Align = alTop
        Caption = 'Houses'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 177
        Align = alTop
        DataSource = datm_pedido_instrucao.ds_consolidada
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_BOOKING'
            Title.Caption = 'Booking'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_AGENTE'
            Title.Caption = 'Agente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ARMADOR'
            Title.Caption = 'Armador'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_MOEDA'
            Title.Caption = 'Moeda'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ORIGEM_CID'
            Title.Caption = 'Origem'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_DESTINO_CID'
            Title.Caption = 'Destino'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PREV_SAIDA'
            Title.Caption = 'Prev Embarque'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_VOO'
            Title.Caption = 'Nr Voo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_tp_estufagem'
            Title.Caption = 'Estufagem'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 70
            Visible = True
          end>
      end
      object DBGrid4: TDBGrid
        Left = 0
        Top = 190
        Width = 734
        Height = 236
        Align = alClient
        DataSource = datm_pedido_instrucao.ds_house
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_HOUSE'
            Title.Caption = 'House'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_processo'
            Title.Caption = 'Processo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_CLIENTE'
            Title.Caption = 'C'#243'd.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CLIENTE'
            Title.Caption = 'Cliente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 110
            Visible = True
          end>
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 468
    Top = 192
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_transp: TMenuItem
      Caption = 'Transferir Operacional'
      OnClick = btn_liberar_comercClick
    end
    object mi_aprova_pedido: TMenuItem
      Caption = '&Aprovar Pedido'
      OnClick = btn_liberarClick
    end
    object mi_gera_conhec: TMenuItem
      Caption = '&Gerar Conhecimento'
      Enabled = False
      OnClick = btn_masterClick
    end
    object mi_pre_alerta: TMenuItem
      Caption = 'Pr'#233' - Alerta'
      OnClick = btn_pre_alertaClick
    end
    object mi_house: TMenuItem
      Caption = 'Incluir House'
      Enabled = False
      OnClick = btn_co_consoClick
    end
    object mi_Imprimir: TMenuItem
      Caption = '&Imprimir'
      Enabled = False
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
    end
  end
  object pp_pedido: TppReport
    AutoStop = False
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RepInstEmb1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 209974
    PrinterSetup.mmPaperWidth = 296969
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBroker\Instembi_vitor.rtm'
    Units = utPrinterPixels
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 524
    Top = 59
    Version = '7.02'
    mmColumnWidth = 284269
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 125942
      mmPrintPosition = 0
      object ppShape14: TppShape
        UserName = 'Shape14'
        mmHeight = 18521
        mmLeft = 5038
        mmTop = 27252
        mmWidth = 139171
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'PROCESSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 144463
        mmTop = 30427
        mmWidth = 27252
        BandType = 0
      end
      object ppReferencia: TppLabel
        UserName = 'Referencia'
        AutoSize = False
        Caption = 'R.E. NR.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 144463
        mmTop = 33867
        mmWidth = 27252
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'NR_PROCESSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        mmHeight = 3704
        mmLeft = 175419
        mmTop = 30427
        mmWidth = 15610
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'nm_unid_neg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 29369
        mmWidth = 103717
        BandType = 0
      end
      object ppInstrucao: TppLabel
        UserName = 'Instrucao'
        Caption = 'I N S T R U '#199' '#195' O     D E    E M B A R Q U E'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 6085
        mmLeft = 104246
        mmTop = 7408
        mmWidth = 93927
        BandType = 0
      end
      object ppDespachante: TppLabel
        UserName = 'Despachante'
        Caption = 'AO DESPACHANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 6096
        mmTop = 29369
        mmWidth = 25665
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CalcRE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 175419
        mmTop = 33867
        mmWidth = 106098
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'CD_CARTA_CREDITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 250032
        mmTop = 30427
        mmWidth = 31485
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'PaisOrigem1'
        AutoSize = False
        Caption = 'L/C No.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 230188
        mmTop = 30427
        mmWidth = 18521
        BandType = 0
      end
      object ppShape15: TppShape
        UserName = 'Shape15'
        mmHeight = 18521
        mmLeft = 143934
        mmTop = 27252
        mmWidth = 138907
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'PROCESSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 144463
        mmTop = 28046
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Referencia1'
        AutoSize = False
        Caption = 'R.E. N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3969
        mmLeft = 144463
        mmTop = 32015
        mmWidth = 25665
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText41'
        DataField = 'CD_CARTA_CREDITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 245269
        mmTop = 28046
        mmWidth = 31485
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'L/C N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 230188
        mmTop = 28046
        mmWidth = 8467
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'END_CIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        mmHeight = 4233
        mmLeft = 97367
        mmTop = 19050
        mmWidth = 62706
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Tel.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 22490
        mmWidth = 7408
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'NR_TELEFONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 12700
        mmTop = 22490
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Fax.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 39423
        mmTop = 22490
        mmWidth = 8467
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'NR_FAX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 48683
        mmTop = 22490
        mmWidth = 29104
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'END_CIDADE_UF_CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 17463
        mmWidth = 36513
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ENDERECO_NUM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        mmHeight = 4763
        mmLeft = 4498
        mmTop = 12435
        mmWidth = 90223
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        mmHeight = 4763
        mmLeft = 4498
        mmTop = 7408
        mmWidth = 90223
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText32'
        AutoSize = True
        DataField = 'CalcNrProcesso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 28046
        mmWidth = 20638
        BandType = 0
      end
      object ppNumPagina: TppSystemVariable
        UserName = 'NumPagina'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 232040
        mmTop = 21960
        mmWidth = 31485
        BandType = 0
      end
      object ppDBText39: TppDBText
        UserName = 'DBText46'
        DataField = 'DATA_FATURA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 162190
        mmTop = 19050
        mmWidth = 57150
        BandType = 0
      end
      object ppPagina: TppSystemVariable
        UserName = 'Pagina1'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 133350
        mmTop = 14023
        mmWidth = 5027
        BandType = 0
      end
      object ppRegPag1: TppRegion
        UserName = 'RegPag1'
        Brush.Style = bsClear
        Pen.Style = psClear
        Stretch = True
        Transparent = True
        mmHeight = 67469
        mmLeft = 2646
        mmTop = 43656
        mmWidth = 281782
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          mmHeight = 7408
          mmLeft = 5038
          mmTop = 102659
          mmWidth = 277813
          BandType = 0
        end
        object ppShape1: TppShape
          UserName = 'Shape101'
          mmHeight = 15875
          mmLeft = 143669
          mmTop = 87048
          mmWidth = 139171
          BandType = 0
        end
        object ppShape19: TppShape
          UserName = 'Shape19'
          mmHeight = 16669
          mmLeft = 143669
          mmTop = 45508
          mmWidth = 139171
          BandType = 0
        end
        object ppShape17: TppShape
          UserName = 'Shape17'
          mmHeight = 14023
          mmLeft = 143669
          mmTop = 74084
          mmWidth = 139171
          BandType = 0
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 15875
          mmLeft = 5038
          mmTop = 87048
          mmWidth = 139171
          BandType = 0
        end
        object ppDBMemo1: TppDBMemo
          UserName = 'DBMemo1'
          CharWrap = False
          DataField = 'TX_MARCACAO_VOLUME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 13494
          mmLeft = 42069
          mmTop = 88636
          mmWidth = 98425
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppShape9: TppShape
          UserName = 'Shape9'
          mmHeight = 12965
          mmLeft = 143669
          mmTop = 61913
          mmWidth = 139171
          BandType = 0
        end
        object ppShape2: TppShape
          UserName = 'Shape1'
          mmHeight = 13758
          mmLeft = 5038
          mmTop = 74348
          mmWidth = 139171
          BandType = 0
        end
        object ppPesoLiq: TppLabel
          UserName = 'PesoLiq'
          AutoSize = False
          Caption = 'NET WEIGHT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 144727
          mmTop = 88636
          mmWidth = 23813
          BandType = 0
        end
        object ppDBText33: TppDBText
          UserName = 'DBText33'
          DataField = 'VL_PESO_LIQUIDO'
          DisplayFormat = '#,0.000;-#,0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          mmHeight = 3704
          mmLeft = 185738
          mmTop = 88636
          mmWidth = 31750
          BandType = 0
        end
        object ppViaTransp: TppLabel
          UserName = 'ViaTransp'
          Caption = 'TRANSPORT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 144727
          mmTop = 57944
          mmWidth = 17198
          BandType = 0
        end
        object ppDBText36: TppDBText
          UserName = 'DBText36'
          DataField = 'NM_VIA_TRANSP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 174625
          mmTop = 57944
          mmWidth = 41540
          BandType = 0
        end
        object ppMarcas: TppLabel
          UserName = 'Marcas'
          ShiftWithParent = True
          AutoSize = False
          Caption = 'MARKS AND NUMBERS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          WordWrap = True
          mmHeight = 4498
          mmLeft = 6085
          mmTop = 88636
          mmWidth = 35190
          BandType = 0
        end
        object ppLocalOrigem: TppLabel
          UserName = 'LocalOrigem'
          Caption = 'PORT OF LOADING'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 144727
          mmTop = 50007
          mmWidth = 25665
          BandType = 0
        end
        object ppDBText42: TppDBText
          UserName = 'DBText42'
          DataField = 'DESCRICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 179388
          mmTop = 50007
          mmWidth = 42863
          BandType = 0
        end
        object ppDBText59: TppDBText
          UserName = 'DBText59'
          DataField = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 174625
          mmTop = 75671
          mmWidth = 104246
          BandType = 0
        end
        object ppDBText63: TppDBText
          UserName = 'DBText63'
          DataField = 'ENDERECO_NUM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 174625
          mmTop = 79640
          mmWidth = 101600
          BandType = 0
        end
        object ppDBText67: TppDBText
          UserName = 'DBText67'
          DataField = 'CIDADE_PAIS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 174625
          mmTop = 83609
          mmWidth = 101600
          BandType = 0
        end
        object ppNotificado2: TppLabel
          UserName = 'Notificado2'
          AutoSize = False
          Caption = 'NOTIFY 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 144727
          mmTop = 75671
          mmWidth = 27252
          BandType = 0
        end
        object ppDBText38: TppDBText
          UserName = 'DBText38'
          DataField = 'VL_TOT_FOB'
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          mmHeight = 3704
          mmLeft = 185738
          mmTop = 92605
          mmWidth = 31485
          BandType = 0
        end
        object ppShape16: TppShape
          UserName = 'Shape16'
          mmHeight = 15081
          mmLeft = 5038
          mmTop = 59796
          mmWidth = 139171
          BandType = 0
        end
        object ppImportador: TppLabel
          UserName = 'Importador'
          AutoSize = False
          Caption = 'IMPORT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 6085
          mmTop = 62706
          mmWidth = 25665
          BandType = 0
        end
        object ppDBText55: TppDBText
          UserName = 'DBText55'
          DataField = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 174625
          mmTop = 62707
          mmWidth = 102659
          BandType = 0
        end
        object ppDBText56: TppDBText
          UserName = 'DBText56'
          DataField = 'ENDERECO_NUM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 174625
          mmTop = 66675
          mmWidth = 100806
          BandType = 0
        end
        object ppConsignatario: TppLabel
          UserName = 'Consignatario'
          AutoSize = False
          Caption = 'CONSIGNEE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 144727
          mmTop = 62707
          mmWidth = 27252
          BandType = 0
        end
        object ppDBText61: TppDBText
          UserName = 'DBText61'
          DataField = 'CIDADE_PAIS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 174625
          mmTop = 70644
          mmWidth = 100806
          BandType = 0
        end
        object ppNotificado1: TppLabel
          UserName = 'Notificado1'
          AutoSize = False
          Caption = 'NOTIFY 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 6085
          mmTop = 75671
          mmWidth = 25665
          BandType = 0
        end
        object ppDBText44: TppDBText
          UserName = 'DBText44'
          DataField = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 33602
          mmTop = 75671
          mmWidth = 105569
          BandType = 0
        end
        object ppDBText45: TppDBText
          UserName = 'DBText45'
          DataField = 'ENDERECO_NUM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 33602
          mmTop = 79640
          mmWidth = 96044
          BandType = 0
        end
        object ppDBText49: TppDBText
          UserName = 'DBText49'
          DataField = 'CIDADE_PAIS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 33602
          mmTop = 83609
          mmWidth = 96044
          BandType = 0
        end
        object ppShpShip: TppShape
          UserName = 'ShpShip'
          mmHeight = 16669
          mmLeft = 5038
          mmTop = 45509
          mmWidth = 139171
          BandType = 0
        end
        object pp: TppLabel
          UserName = 'Label11'
          AutoSize = False
          Caption = 'SHIPPER'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 6085
          mmTop = 47361
          mmWidth = 25665
          BandType = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 33602
          mmTop = 47361
          mmWidth = 105834
          BandType = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'ENDERECO_NUM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 33602
          mmTop = 51329
          mmWidth = 81227
          BandType = 0
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          DataField = 'END_CIDADE_UF_CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 33602
          mmTop = 55298
          mmWidth = 72496
          BandType = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'VESSEL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 144727
          mmTop = 46038
          mmWidth = 29898
          BandType = 0
        end
        object ppAgente: TppLabel
          UserName = 'Agente'
          AutoSize = False
          Caption = 'AGENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 6085
          mmTop = 104775
          mmWidth = 13229
          BandType = 0
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          ShiftWithParent = True
          DataField = 'NM_AGENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 33602
          mmTop = 104775
          mmWidth = 109009
          BandType = 0
        end
        object ppDBText23: TppDBText
          UserName = 'DBText23'
          DataField = 'ENDERECO_NUM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 33602
          mmTop = 66675
          mmWidth = 92340
          BandType = 0
        end
        object ppDBText24: TppDBText
          UserName = 'DBText24'
          DataField = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 33602
          mmTop = 62706
          mmWidth = 105834
          BandType = 0
        end
        object ppPaisOrigem: TppLabel
          UserName = 'PaisOrigem'
          Caption = 'COUNTRY OF ORIGIN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 144727
          mmTop = 96838
          mmWidth = 28310
          BandType = 0
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'CalcPais_Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 179388
          mmTop = 96838
          mmWidth = 38629
          BandType = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'CIDADE_PAIS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 33602
          mmTop = 70644
          mmWidth = 92340
          BandType = 0
        end
        object ppDBText30: TppDBText
          UserName = 'DBText30'
          DataField = 'NM_EMBARCACAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 174625
          mmTop = 46038
          mmWidth = 96573
          BandType = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Agente1'
          AutoSize = False
          Caption = 'PACKING'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 144727
          mmTop = 103452
          mmWidth = 18521
          BandType = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText22'
          DataField = 'VL_TOT_CUBAGEM'
          DisplayFormat = '#,0.000;-#,0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 243417
          mmTop = 96838
          mmWidth = 38100
          BandType = 0
        end
        object ppFrete: TppDBText
          UserName = 'Frete'
          DataField = 'VL_FRETE'
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          mmHeight = 3704
          mmLeft = 243417
          mmTop = 92605
          mmWidth = 38100
          BandType = 0
        end
        object ppDBText34: TppDBText
          UserName = 'DBText34'
          DataField = 'VL_PESO_BRUTO'
          DisplayFormat = '#,0.000;-#,0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          mmHeight = 3704
          mmLeft = 243417
          mmTop = 88636
          mmWidth = 38100
          BandType = 0
        end
        object ppPesoBruto: TppLabel
          UserName = 'PesoBruto'
          AutoSize = False
          Caption = 'GROSS WEIGHT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 219075
          mmTop = 88636
          mmWidth = 25135
          BandType = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          AutoSize = False
          Caption = 'TOTAL FREIGHT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 219075
          mmTop = 92605
          mmWidth = 25135
          BandType = 0
        end
        object ppCubagem: TppLabel
          UserName = 'Cubagem1'
          Caption = 'MEASUREMENT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 219340
          mmTop = 96838
          mmWidth = 21431
          BandType = 0
        end
        object ppLocalDestino: TppLabel
          UserName = 'LocalDestino'
          Caption = 'PORT OF DISCHARGE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 144727
          mmTop = 53975
          mmWidth = 29104
          BandType = 0
        end
        object ppDBText43: TppDBText
          UserName = 'DBText43'
          DataField = 'DESCRICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 179388
          mmTop = 53975
          mmWidth = 42863
          BandType = 0
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          AutoSize = True
          DataField = 'CalcTotal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 144727
          mmTop = 92604
          mmWidth = 13229
          BandType = 0
        end
        object ppDBText29: TppDBText
          UserName = 'DBText39'
          AutoSize = True
          DataField = 'DESCRICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          mmHeight = 3704
          mmLeft = 163513
          mmTop = 92604
          mmWidth = 16404
          BandType = 0
        end
        object ppLine12: TppLine
          UserName = 'Line12'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 7408
          mmLeft = 143934
          mmTop = 102394
          mmWidth = 2910
          BandType = 0
        end
        object ppDBMemo4: TppDBMemo
          UserName = 'DBMemo4'
          CharWrap = False
          DataField = 'TX_INF_EMBALAGEM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          mmHeight = 3704
          mmLeft = 164571
          mmTop = 103452
          mmWidth = 115623
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'DESCRICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 222779
          mmTop = 53975
          mmWidth = 46038
          BandType = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'DESCRICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 222779
          mmTop = 50007
          mmWidth = 46038
          BandType = 0
        end
      end
      object ppRegDetail: TppRegion
        UserName = 'RegDetail'
        Brush.Style = bsClear
        Pen.Style = psClear
        ShiftRelativeTo = ppRegPag1
        Stretch = True
        Transparent = True
        mmHeight = 14288
        mmLeft = 794
        mmTop = 111654
        mmWidth = 283369
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppQtde: TppLabel
          UserName = 'Qtd1'
          AutoSize = False
          Caption = 'QTY'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 6615
          mmTop = 115623
          mmWidth = 15875
          BandType = 0
        end
        object ppCod: TppLabel
          UserName = 'Cod'
          AutoSize = False
          Caption = 'CODE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 25930
          mmTop = 115623
          mmWidth = 24871
          BandType = 0
        end
        object ppDesc: TppLabel
          UserName = 'Desc'
          AutoSize = False
          Caption = 'DESCRIPTION OF GOODS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 55828
          mmTop = 115623
          mmWidth = 116681
          BandType = 0
        end
        object pppeso_liq: TppLabel
          UserName = 'Label4'
          Caption = 'NET WEIGHT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 187854
          mmTop = 115623
          mmWidth = 16933
          BandType = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'KG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 194204
          mmTop = 119062
          mmWidth = 3969
          BandType = 0
        end
        object pppeso_brut: TppLabel
          UserName = 'peso_brut'
          Caption = 'GROSS WEIGHT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 209550
          mmTop = 115623
          mmWidth = 21431
          BandType = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'KG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 219605
          mmTop = 119063
          mmWidth = 3969
          BandType = 0
        end
        object pppreco_unit: TppLabel
          UserName = 'Preco_Unitario1'
          Caption = 'UNIT PRICE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          mmHeight = 3704
          mmLeft = 239713
          mmTop = 115623
          mmWidth = 15346
          BandType = 0
        end
        object ppDBMRefCli: TppDBMemo
          UserName = 'DBMRefCli'
          CharWrap = False
          DataField = 'REFER_NR_CLIENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Stretch = True
          Transparent = True
          mmHeight = 3969
          mmLeft = 55828
          mmTop = 119062
          mmWidth = 124884
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object pptotal_valor: TppLabel
          UserName = 'Total1'
          Caption = 'T O T A L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 264055
          mmTop = 115623
          mmWidth = 12965
          BandType = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 16140
          mmLeft = 5038
          mmTop = 110586
          mmWidth = 2646
          BandType = 0
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 12965
          mmLeft = 23537
          mmTop = 113771
          mmWidth = 2646
          BandType = 0
        end
        object ppLine15: TppLine
          UserName = 'Line15'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 12965
          mmLeft = 53467
          mmTop = 113761
          mmWidth = 2646
          BandType = 0
        end
        object ppLine17: TppLine
          UserName = 'Line17'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 12965
          mmLeft = 183600
          mmTop = 113761
          mmWidth = 2646
          BandType = 0
        end
        object ppLine18: TppLine
          UserName = 'Line18'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 12965
          mmLeft = 207434
          mmTop = 113761
          mmWidth = 2646
          BandType = 0
        end
        object ppLine19: TppLine
          UserName = 'Line19'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 12965
          mmLeft = 233638
          mmTop = 113761
          mmWidth = 2646
          BandType = 0
        end
        object ppLine20: TppLine
          UserName = 'Line20'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 12965
          mmLeft = 258234
          mmTop = 113761
          mmWidth = 2646
          BandType = 0
        end
        object ppLine21: TppLine
          UserName = 'Line201'
          Position = lpRight
          Weight = 0.750000000000000000
          mmHeight = 12965
          mmLeft = 274363
          mmTop = 113761
          mmWidth = 8467
          BandType = 0
        end
        object ppDBText26: TppDBText
          UserName = 'DBText4'
          CharWrap = True
          DataField = 'AP_MOEDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 242623
          mmTop = 119592
          mmWidth = 9790
          BandType = 0
        end
      end
      object ppRegEmbSup: TppRegion
        UserName = 'RegEmbSup'
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 203730
        mmTop = 3175
        mmWidth = 11906
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppRegEmb: TppRegion
        UserName = 'RegEmbSup1'
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 216430
        mmTop = 2910
        mmWidth = 11906
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label9'
        Caption = 'DDE N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 230188
        mmTop = 32015
        mmWidth = 8996
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'DBText37'
        DataField = 'nr_dde'
        DisplayFormat = '##########-#;0;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 245269
        mmTop = 32004
        mmWidth = 31750
        BandType = 0
      end
      object SubRE: TppSubReport
        UserName = 'SubRE'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentWidth = False
        TraverseAllData = False
        mmHeight = 11642
        mmLeft = 170392
        mmTop = 32015
        mmWidth = 23019
        BandType = 0
        mmBottomOffset = 85
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'ChildReport1'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 209974
          PrinterSetup.mmPaperWidth = 296969
          PrinterSetup.PaperSize = 9
          Template.FileName = 'C:\DDBROKER\Instembi.rtm'
          Units = utPrinterPixels
          Left = 384
          Top = 216
          Version = '7.02'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 265
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'NR_RE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 4498
              mmLeft = 0
              mmTop = 0
              mmWidth = 28310
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppDBText22: TppDBText
        UserName = 'DBText201'
        DataField = 'NM_ANALISTA_COMISSARIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 33338
        mmWidth = 103717
        BandType = 0
      end
      object ppDBText41: TppDBText
        UserName = 'DBText202'
        DataField = 'NR_FONE_FAX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 37306
        mmWidth = 103717
        BandType = 0
      end
      object ppimg_logo_instemb: TppImage
        UserName = 'img_logo_instemb'
        AutoSize = True
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 13494
        mmLeft = 228600
        mmTop = 1852
        mmWidth = 55563
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppQtd: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'QT_MERCADORIA'
        DisplayFormat = '#,0.000;-#,0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1323
        mmWidth = 23283
        BandType = 4
      end
      object ppCodigo: TppDBText
        UserName = 'DBText21'
        DataField = 'CD_MERCADORIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 26194
        mmTop = 1323
        mmWidth = 26194
        BandType = 4
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'nm_mercadoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        mmHeight = 4233
        mmLeft = 56092
        mmTop = 1323
        mmWidth = 124884
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object pppeso_liquido: TppDBText
        UserName = 'DBText27'
        DataField = 'VL_TOT_PESO_LIQ'
        DisplayFormat = '#,0.000;-#,0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182563
        mmTop = 1323
        mmWidth = 24342
        BandType = 4
      end
      object pppeso_bruto: TppDBText
        UserName = 'DBText28'
        DataField = 'VL_TOT_PESO_BRUTO'
        DisplayFormat = '#,0.000;-#,0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 210344
        mmTop = 1588
        mmWidth = 21696
        BandType = 4
      end
      object pppreco_unitario: TppDBText
        UserName = 'preco_unitario'
        DataField = 'VL_UNITARIO'
        DisplayFormat = '#,0.0000000;-#,0.0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 233892
        mmTop = 1588
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText301'
        DataField = 'NM_SIGLA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 251090
        mmTop = 1323
        mmWidth = 6879
        BandType = 4
      end
      object pptotal: TppDBText
        UserName = 'total'
        DataField = 'VL_TOT_ITEM'
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258498
        mmTop = 1323
        mmWidth = 23283
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11377
        mmLeft = 5038
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppRegMerc: TppRegion
        UserName = 'RegMerc'
        Brush.Style = bsClear
        Pen.Style = psClear
        ShiftRelativeTo = ppDBMemo3
        Transparent = True
        mmHeight = 5292
        mmLeft = 52388
        mmTop = 3979
        mmWidth = 132292
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppDBText32: TppDBText
          UserName = 'DBText31'
          DataField = 'NR_OC_REF_ORIGEM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 56092
          mmTop = 4508
          mmWidth = 124884
          BandType = 4
        end
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11377
        mmLeft = 23537
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11377
        mmLeft = 53467
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11377
        mmLeft = 183600
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11377
        mmLeft = 207434
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11377
        mmLeft = 233638
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11377
        mmLeft = 258234
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 11377
        mmLeft = 274363
        mmTop = 0
        mmWidth = 8467
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 30427
      mmPrintPosition = 0
      object ppRegion1: TppRegion
        UserName = 'Region1'
        Brush.Style = bsClear
        Pen.Style = psClear
        Stretch = True
        Transparent = True
        mmHeight = 24077
        mmLeft = 53711
        mmTop = 0
        mmWidth = 128059
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppDBText27: TppDBText
          UserName = 'DBText35'
          AutoSize = True
          DataField = 'CalcCorpo_Conhec'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 56092
          mmTop = 1323
          mmWidth = 24606
          BandType = 7
        end
        object ppDBText35: TppDBText
          UserName = 'DBText40'
          AutoSize = True
          DataField = 'CalcTipo_Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 56092
          mmTop = 4763
          mmWidth = 19050
          BandType = 7
        end
        object ppDBText40: TppDBText
          UserName = 'DBText401'
          AutoSize = True
          DataField = 'CD_NCM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          mmHeight = 3704
          mmLeft = 56092
          mmTop = 8202
          mmWidth = 11113
          BandType = 7
        end
        object ppDBMDeclAdic: TppDBMemo
          UserName = 'DBMDeclAdic'
          CharWrap = False
          DataField = 'TX_DECL_ADICIONAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          mmHeight = 3979
          mmLeft = 56092
          mmTop = 13758
          mmWidth = 124079
          BandType = 7
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBMDeclAdicInstEmb: TppDBMemo
          UserName = 'DBMDeclAdic1'
          CharWrap = False
          DataField = 'TX_DECL_ADIC_INST_EMB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ShiftRelativeTo = ppDBMDeclAdic
          Stretch = True
          Transparent = True
          mmHeight = 4233
          mmLeft = 56092
          mmTop = 17992
          mmWidth = 124090
          BandType = 7
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
    end
    object ppPageStyle1: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 195527
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 168021
        mmLeft = 5038
        mmTop = 27517
        mmWidth = 8996
        BandType = 9
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 168021
        mmLeft = 23548
        mmTop = 27517
        mmWidth = 8467
        BandType = 9
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 168021
        mmLeft = 53446
        mmTop = 27517
        mmWidth = 8467
        BandType = 9
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 168021
        mmLeft = 207434
        mmTop = 27517
        mmWidth = 8467
        BandType = 9
      end
      object ppLine11: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 168021
        mmLeft = 233628
        mmTop = 27517
        mmWidth = 8731
        BandType = 9
      end
      object ppLine9: TppLine
        UserName = 'Line302'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 168021
        mmLeft = 258234
        mmTop = 27517
        mmWidth = 8467
        BandType = 9
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 168021
        mmLeft = 274373
        mmTop = 27517
        mmWidth = 8467
        BandType = 9
      end
      object ppLine13: TppLine
        UserName = 'Line11'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 5027
        mmTop = 188648
        mmWidth = 277548
        BandType = 9
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 168021
        mmLeft = 183621
        mmTop = 27517
        mmWidth = 8467
        BandType = 9
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDesigner: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 556
    Top = 59
  end
end
