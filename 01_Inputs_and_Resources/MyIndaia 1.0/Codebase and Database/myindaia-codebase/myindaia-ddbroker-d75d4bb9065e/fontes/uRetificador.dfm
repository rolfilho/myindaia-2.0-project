object frm_retifica: Tfrm_retifica
  Left = 365
  Top = 246
  Width = 750
  Height = 550
  Caption = 'Refiticador'
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
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 45
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      45)
    object btn_sair: TSpeedButton
      Left = 696
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
    object btn_salvar: TSpeedButton
      Left = 4
      Top = 3
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
      Left = 44
      Top = 3
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 45
    Width = 742
    Height = 82
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label5: TLabel
      Left = 8
      Top = 3
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
      Left = 338
      Top = 17
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
      OnClick = btn_co_unid_pesqClick
    end
    object Label6: TLabel
      Left = 371
      Top = 3
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
      Left = 704
      Top = 17
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
      OnClick = btn_co_prod_pesqClick
    end
    object Label1: TLabel
      Left = 8
      Top = 38
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
      Left = 96
      Top = 51
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
      OnClick = btn_co_processoClick
    end
    object Label2: TLabel
      Left = 130
      Top = 38
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
    object Label3: TLabel
      Left = 428
      Top = 38
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
    object msk_unid_pesq: TMaskEdit
      Left = 8
      Top = 17
      Width = 30
      Height = 21
      EditMask = '99;0; '
      MaxLength = 2
      TabOrder = 0
      OnChange = btn_co_unid_pesqClick
      OnExit = msk_unid_pesqExit
      OnKeyDown = msk_unid_pesqKeyDown
    end
    object edt_nm_unid_pesq: TEdit
      Left = 37
      Top = 17
      Width = 300
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object msk_prod_pesq: TMaskEdit
      Left = 371
      Top = 17
      Width = 31
      Height = 21
      EditMask = '99;0; '
      MaxLength = 2
      TabOrder = 1
      OnChange = btn_co_prod_pesqClick
      OnExit = msk_prod_pesqExit
      OnKeyDown = msk_unid_pesqKeyDown
    end
    object edt_nm_prod_pesq: TEdit
      Left = 402
      Top = 17
      Width = 300
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
    end
    object msk_processo: TMaskEdit
      Left = 8
      Top = 51
      Width = 87
      Height = 21
      MaxLength = 10
      TabOrder = 2
      OnExit = msk_processoExit
      OnKeyDown = msk_unid_pesqKeyDown
    end
    object DBEdit6: TDBEdit
      Left = 130
      Top = 51
      Width = 45
      Height = 21
      Color = clMenu
      DataField = 'CD_CLIENTE'
      DataSource = datm_retifica.ds_processo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 176
      Top = 51
      Width = 241
      Height = 21
      Color = clMenu
      DataField = 'NM_CLIENTE'
      DataSource = datm_retifica.ds_processo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 428
      Top = 51
      Width = 29
      Height = 21
      Color = clMenu
      DataField = 'CD_SERVICO'
      DataSource = datm_retifica.ds_processo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit9: TDBEdit
      Left = 457
      Top = 51
      Width = 272
      Height = 21
      Color = clMenu
      DataField = 'NM_SERVICO'
      DataSource = datm_retifica.ds_processo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
  end
  object pgctrl_retifica: TPageControl
    Left = 0
    Top = 127
    Width = 742
    Height = 377
    ActivePage = ts_frete_maritimo
    Align = alClient
    TabOrder = 2
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      ImageIndex = 4
      object Bevel2: TBevel
        Left = 0
        Top = 150
        Width = 734
        Height = 21
        Align = alTop
      end
      object Label34: TLabel
        Left = 6
        Top = 154
        Width = 321
        Height = 13
        Caption = 'Demais Processos que ter'#227'o suas Informa'#231#245'es alteradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 150
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label26: TLabel
          Left = 8
          Top = 6
          Width = 313
          Height = 13
          Caption = 'Dados Comuns para Todos os Processos Relacionados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 7
          Top = 26
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
          Left = 371
          Top = 26
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
        object lb_ag: TLabel
          Left = 7
          Top = 66
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
          Left = 371
          Top = 66
          Width = 80
          Height = 13
          Caption = 'Transportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 7
          Top = 106
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
          Left = 371
          Top = 106
          Width = 55
          Height = 13
          Caption = 'N'#186' House'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 486
          Top = 107
          Width = 57
          Height = 13
          Caption = 'N'#186' Master'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_origem: TSpeedButton
          Left = 338
          Top = 41
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
          OnClick = btn_co_origemClick
        end
        object btn_co_ag: TSpeedButton
          Left = 338
          Top = 81
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
          OnClick = btn_co_agClick
        end
        object btn_co_moeda: TSpeedButton
          Left = 101
          Top = 120
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
          OnClick = btn_co_moedaClick
        end
        object btn_co_cia: TSpeedButton
          Left = 704
          Top = 80
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
          OnClick = btn_co_ciaClick
        end
        object btn_co_destino: TSpeedButton
          Left = 704
          Top = 40
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
          OnClick = btn_co_destinoClick
        end
        object btn_co_armador: TSpeedButton
          Left = 704
          Top = 81
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
          OnClick = btn_co_armadorClick
        end
        object Label29: TLabel
          Left = 618
          Top = 108
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
        object Bevel1: TBevel
          Left = 2
          Top = 2
          Width = 730
          Height = 21
          Align = alTop
        end
        object dbedt_cd_origem: TDBEdit
          Left = 6
          Top = 40
          Width = 42
          Height = 21
          DataField = 'CD_ORIGEM'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_cd_agChange
          OnExit = dbedt_cd_origemExit
          OnKeyDown = msk_unid_pesqKeyDown
        end
        object dbedt_nm_origem: TDBEdit
          Left = 49
          Top = 40
          Width = 288
          Height = 21
          Color = clMenu
          DataField = 'NM_ORIGEM'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_nm_destino: TDBEdit
          Left = 415
          Top = 40
          Width = 287
          Height = 21
          Color = clMenu
          DataField = 'NM_DESTINO'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_cd_destino: TDBEdit
          Left = 371
          Top = 40
          Width = 43
          Height = 21
          DataField = 'CD_DESTINO'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_cd_agChange
          OnExit = dbedt_cd_destinoExit
          OnKeyDown = msk_unid_pesqKeyDown
        end
        object dbedt_cd_ag: TDBEdit
          Left = 6
          Top = 80
          Width = 42
          Height = 21
          DataField = 'CD_AGENTE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = dbedt_cd_agChange
          OnExit = dbedt_cd_agExit
          OnKeyDown = msk_unid_pesqKeyDown
        end
        object dbedt_nm_ag: TDBEdit
          Left = 49
          Top = 80
          Width = 288
          Height = 21
          Color = clMenu
          DataField = 'NM_AGENTE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_cd_cia: TDBEdit
          Left = 371
          Top = 80
          Width = 43
          Height = 21
          DataField = 'CD_CIA_TRANSP'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnChange = dbedt_cd_agChange
          OnExit = dbedt_cd_ciaExit
          OnKeyDown = msk_unid_pesqKeyDown
        end
        object dbedt_nm_cia: TDBEdit
          Left = 415
          Top = 80
          Width = 288
          Height = 21
          Color = clMenu
          DataField = 'NM_CIA'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_moeda: TDBEdit
          Left = 6
          Top = 120
          Width = 42
          Height = 21
          DataField = 'CD_MOEDA_FRETE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          OnChange = dbedt_cd_agChange
          OnExit = dbedt_cd_moedaExit
          OnKeyDown = msk_unid_pesqKeyDown
        end
        object dbedt_nm_moeda: TDBEdit
          Left = 49
          Top = 120
          Width = 51
          Height = 21
          Color = clMenu
          DataField = 'AP_MOEDA'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_nr_house: TDBEdit
          Left = 371
          Top = 120
          Width = 109
          Height = 21
          DataField = 'NR_HOUSE'
          DataSource = datm_retifica.ds_house
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          OnChange = dbedt_nr_houseChange
        end
        object DBEdit30: TDBEdit
          Left = 485
          Top = 121
          Width = 126
          Height = 21
          Color = clMenu
          DataField = 'NR_MASTER'
          DataSource = datm_retifica.ds_house
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_cd_armador: TDBEdit
          Left = 371
          Top = 80
          Width = 43
          Height = 21
          DataField = 'CD_ARMADOR'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnChange = dbedt_cd_agChange
          OnExit = dbedt_cd_armadorExit
          OnKeyDown = msk_unid_pesqKeyDown
        end
        object dbedt_nm_armador: TDBEdit
          Left = 415
          Top = 80
          Width = 288
          Height = 21
          Color = clMenu
          DataField = 'NM_ARMADOR'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit19: TDBEdit
          Left = 617
          Top = 122
          Width = 111
          Height = 21
          Color = clMenu
          DataField = 'CD_MASTER'
          DataSource = datm_retifica.ds_house
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
        end
        object pnl_consolidacao: TPanel
          Left = 128
          Top = 108
          Width = 237
          Height = 36
          BevelOuter = bvNone
          TabOrder = 12
          Visible = False
          object Label38: TLabel
            Left = 3
            Top = 0
            Width = 112
            Height = 13
            Caption = 'Local Consolida'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_consolidacao: TSpeedButton
            Left = 210
            Top = 14
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
            OnClick = btn_consolidacaoClick
          end
          object dbedt_cd_consolidacao: TDBEdit
            Left = 3
            Top = 13
            Width = 31
            Height = 21
            DataField = 'CD_LOCAL_CONSOLIDACAO'
            DataSource = datm_retifica.ds_processo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = dbedt_cd_agChange
            OnExit = dbedt_cd_consolidacaoExit
            OnKeyDown = msk_unid_pesqKeyDown
          end
          object dbedt_nm_consolidacao: TDBEdit
            Left = 36
            Top = 13
            Width = 172
            Height = 21
            Color = clMenu
            DataField = 'NM_CONSOLIDACAO'
            DataSource = datm_retifica.ds_processo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
        end
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 171
        Width = 734
        Height = 178
        Align = alClient
        DataSource = datm_retifica.ds_proc_relacionados
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
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_MASTER'
            Title.Caption = 'Master'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_HOUSE'
            Title.Caption = 'House'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 102
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
            Title.Font.Style = []
            Width = 116
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
            Title.Font.Style = []
            Width = 241
            Visible = True
          end>
      end
    end
    object ts_frete_maritimo: TTabSheet
      Caption = 'Frete e Other Charge'
      object Label14: TLabel
        Left = 0
        Top = 185
        Width = 734
        Height = 13
        Align = alBottom
        Caption = 'Other Charge'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object grp_fcl: TGroupBox
        Left = 0
        Top = 0
        Width = 734
        Height = 185
        Align = alClient
        Caption = 'Estufagem FCL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label17: TLabel
          Left = 110
          Top = 12
          Width = 97
          Height = 13
          Caption = 'Peso Bruto (Ton)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 344
          Top = 12
          Width = 63
          Height = 13
          Caption = 'Total Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 473
          Top = 13
          Width = 76
          Height = 13
          Caption = 'Other Charge'
        end
        object Label22: TLabel
          Left = 586
          Top = 13
          Width = 70
          Height = 13
          Caption = 'Total House'
        end
        object Label24: TLabel
          Left = 24
          Top = 14
          Width = 39
          Height = 13
          Caption = 'Moeda'
        end
        object Label35: TLabel
          Left = 228
          Top = 12
          Width = 82
          Height = 13
          Caption = 'Cubagem (M3)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbgrid_contanier: TDBGrid
          Left = 2
          Top = 78
          Width = 730
          Height = 105
          Align = alBottom
          DataSource = datm_retifica.ds_proc_cntr
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
          Columns = <
            item
              Expanded = False
              FieldName = 'TP_CNTR'
              ReadOnly = True
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
              FieldName = 'NM_CNTR'
              ReadOnly = True
              Title.Caption = 'Contanier'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 133
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_PESO_TON'
              Title.Caption = 'Peso Bruto (Ton)'
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
              FieldName = 'VL_CUBAGEM'
              Title.Caption = 'Cubagem (M3)'
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
              FieldName = 'VL_VENDA'
              Title.Caption = 'Venda'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_CNTR'
              ReadOnly = True
              Title.Caption = 'Numero do Contanier'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 133
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_LACRE'
              ReadOnly = True
              Title.Caption = 'Lacre'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 73
              Visible = True
            end>
        end
        object DBEdit10: TDBEdit
          Left = 109
          Top = 27
          Width = 103
          Height = 21
          Color = clMenu
          DataField = 'VL_PESO_BRUTO'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit12: TDBEdit
          Left = 347
          Top = 27
          Width = 103
          Height = 21
          Color = clMenu
          DataField = 'VL_FRETE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit14: TDBEdit
          Left = 471
          Top = 28
          Width = 99
          Height = 21
          Color = clMenu
          DataField = 'VL_OTHER_CHARGE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit15: TDBEdit
          Left = 584
          Top = 28
          Width = 91
          Height = 21
          Color = clMenu
          DataField = 'VL_HOUSE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit17: TDBEdit
          Left = 22
          Top = 27
          Width = 60
          Height = 21
          Color = clMenu
          DataField = 'AP_MOEDA'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit20: TDBEdit
          Left = 227
          Top = 27
          Width = 103
          Height = 21
          Color = clMenu
          DataField = 'CUBAGEM'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
      end
      object grp_lcl: TGroupBox
        Left = 0
        Top = 0
        Width = 734
        Height = 185
        Align = alClient
        Caption = 'Estufagem LCL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label36: TLabel
          Left = 83
          Top = 12
          Width = 75
          Height = 13
          Caption = 'Peso Taxado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb_tarifa_conso: TLabel
          Left = 198
          Top = 12
          Width = 34
          Height = 13
          Caption = 'Tarifa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 285
          Top = 12
          Width = 63
          Height = 13
          Caption = 'Total Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 402
          Top = 13
          Width = 76
          Height = 13
          Caption = 'Other Charge'
        end
        object Label20: TLabel
          Left = 515
          Top = 13
          Width = 70
          Height = 13
          Caption = 'Total House'
        end
        object Label25: TLabel
          Left = 9
          Top = 13
          Width = 39
          Height = 13
          Caption = 'Moeda'
        end
        object dbgrid_lcl: TDBGrid
          Left = 2
          Top = 57
          Width = 730
          Height = 126
          Hint = 
            '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em Azul abrem consulta' +
            's OnLine'#13#10'*Ctrl + Delete exclui registro selecionado'
          Align = alBottom
          DataSource = datm_retifica.ds_processo_carga
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnColExit = dbgrid_lclColExit
          OnDblClick = dbgrid_lclDblClick
          OnKeyDown = dbgrid_lclKeyDown
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TP_EMBALAGEM'
              ReadOnly = True
              Title.Caption = 'C'#243'd.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 29
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'calcEMBALAGEM'
              ReadOnly = True
              Title.Caption = 'Tipo da Embalagem'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 170
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
              Width = 136
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
              Width = 94
              Visible = True
            end>
        end
        object dbedt_charg_conso: TDBEdit
          Left = 82
          Top = 27
          Width = 103
          Height = 21
          Color = clMenu
          DataField = 'CHARGEABLE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_tarifa_conso: TDBEdit
          Left = 196
          Top = 27
          Width = 79
          Height = 21
          DataField = 'VL_TARIFA_FRETE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_cd_agChange
        end
        object dbedt_tt_frete_conso: TDBEdit
          Left = 288
          Top = 27
          Width = 89
          Height = 21
          DataField = 'VL_FRETE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = dbedt_cd_agChange
        end
        object DBEdit11: TDBEdit
          Left = 400
          Top = 28
          Width = 88
          Height = 21
          Color = clMenu
          DataField = 'VL_OTHER_CHARGE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit13: TDBEdit
          Left = 513
          Top = 28
          Width = 87
          Height = 21
          Color = clMenu
          DataField = 'VL_HOUSE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit18: TDBEdit
          Left = 7
          Top = 27
          Width = 60
          Height = 21
          Color = clMenu
          DataField = 'AP_MOEDA'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
      end
      object DBGrid4: TDBGrid
        Left = 0
        Top = 198
        Width = 734
        Height = 151
        Hint = 
          '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em Azul abrem consulta' +
          's OnLine'#13#10'*Ctrl + Delete exclui registro selecionado'
        Align = alBottom
        DataSource = datm_retifica.ds_vl_other
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnColExit = DBGrid4ColExit
        OnDblClick = DBGrid4DblClick
        OnKeyDown = DBGrid4KeyDown
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Caption = 'C'#243'd.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 31
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'calcItem'
            ReadOnly = True
            Title.Caption = 'Item'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 170
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NM_TP_CALC'
            ReadOnly = True
            Title.Caption = 'Tipo Base'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 101
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'VL_BASE_CLI'
            Title.Caption = 'Valor Base'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 94
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'VL_VENDA'
            ReadOnly = True
            Title.Caption = 'Venda'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 80
            Visible = True
          end>
      end
    end
    object ts_taxa_maritima: TTabSheet
      Caption = 'Taxas'
      ImageIndex = 1
      object Label16: TLabel
        Left = 0
        Top = 0
        Width = 734
        Height = 13
        Align = alTop
        Caption = 'Despesa House'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 0
        Top = 171
        Width = 734
        Height = 13
        Align = alTop
        Caption = 'Valor Brasil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBGrid6: TDBGrid
        Left = 0
        Top = 13
        Width = 734
        Height = 158
        Hint = 
          '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em Azul abrem consulta' +
          's OnLine'#13#10'*Ctrl + Delete exclui registro selecionado'
        Align = alTop
        DataSource = datm_retifica.ds_despesa_house
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnColExit = DBGrid6ColExit
        OnDblClick = DBGrid6DblClick
        OnKeyDown = DBGrid6KeyDown
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Caption = 'C'#243'd.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 31
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'calcItem'
            ReadOnly = True
            Title.Caption = 'Item'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 170
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CD_MOEDA'
            Title.Caption = 'C'#243'd.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 31
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'calcMoeda'
            Title.Caption = 'Moeda'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 170
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NM_TP_CALC'
            ReadOnly = True
            Title.Caption = 'Tipo Base'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'VL_BASE_AG'
            Title.Caption = 'Valor Base'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_COMPRA_AG'
            ReadOnly = True
            Title.Caption = 'Compra'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 73
            Visible = True
          end>
      end
      object DBGrid5: TDBGrid
        Left = 0
        Top = 184
        Width = 734
        Height = 165
        Hint = 
          '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em Azul abrem consulta' +
          's OnLine'#13#10'*Ctrl + Delete exclui registro selecionado'
        Align = alClient
        DataSource = datm_retifica.ds_vl_brasil
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
        OnColExit = DBGrid5ColExit
        OnDblClick = DBGrid5DblClick
        OnKeyDown = DBGrid5KeyDown
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CD_ITEM'
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
            FieldName = 'calcItem'
            ReadOnly = True
            Title.Caption = 'Item'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 170
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CD_MOEDA_VENDA'
            Title.Caption = 'C'#243'd.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 64
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'calcMoeda'
            Title.Caption = 'Moeda'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 170
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'calc_repassa'
            ReadOnly = True
            Title.Caption = 'Cobrar do '
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 80
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'calc_profit'
            ReadOnly = True
            Title.Caption = 'Profit'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_TP_CALC'
            ReadOnly = True
            Title.Caption = 'Tipo Base'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 62
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'VL_BASE_CLI'
            Title.Caption = 'Valor Base'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_VENDA'
            ReadOnly = True
            Title.Caption = 'Venda'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 54
            Visible = True
          end>
      end
    end
    object ts_frete_aerea: TTabSheet
      Caption = 'Frete e Other Charge'
      ImageIndex = 2
      object Label4: TLabel
        Left = 0
        Top = 52
        Width = 734
        Height = 13
        Align = alTop
        Caption = 'Other Charge'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 734
        Height = 52
        Align = alTop
        Caption = 'Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label8: TLabel
          Left = 78
          Top = 10
          Width = 65
          Height = 13
          Caption = 'Chargeable'
        end
        object Label9: TLabel
          Left = 508
          Top = 11
          Width = 70
          Height = 13
          Caption = 'Total House'
        end
        object Label10: TLabel
          Left = 175
          Top = 10
          Width = 34
          Height = 13
          Caption = 'Tarifa'
        end
        object Label11: TLabel
          Left = 287
          Top = 11
          Width = 30
          Height = 13
          Caption = 'Frete'
        end
        object Label12: TLabel
          Left = 395
          Top = 11
          Width = 76
          Height = 13
          Caption = 'Other Charge'
        end
        object Label23: TLabel
          Left = 9
          Top = 12
          Width = 39
          Height = 13
          Caption = 'Moeda'
        end
        object DBEdit1: TDBEdit
          Left = 76
          Top = 25
          Width = 84
          Height = 21
          DataField = 'CHARGEABLE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_cd_agChange
        end
        object DBEdit2: TDBEdit
          Left = 173
          Top = 25
          Width = 99
          Height = 21
          DataField = 'VL_TARIFA_FRETE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = dbedt_cd_agChange
        end
        object DBEdit3: TDBEdit
          Left = 285
          Top = 26
          Width = 91
          Height = 21
          DataField = 'VL_FRETE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_cd_agChange
        end
        object DBEdit4: TDBEdit
          Left = 393
          Top = 26
          Width = 99
          Height = 21
          Color = clMenu
          DataField = 'VL_OTHER_CHARGE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 506
          Top = 26
          Width = 91
          Height = 21
          Color = clMenu
          DataField = 'VL_HOUSE'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit16: TDBEdit
          Left = 7
          Top = 25
          Width = 60
          Height = 21
          Color = clMenu
          DataField = 'AP_MOEDA'
          DataSource = datm_retifica.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
      end
      object dbgrid_other_charge: TDBGrid
        Left = 0
        Top = 65
        Width = 734
        Height = 284
        Hint = 
          '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em Azul abrem consulta' +
          's OnLine'#13#10'*Ctrl + Delete exclui registro selecionado'
        Align = alClient
        DataSource = datm_retifica.ds_vl_other
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
        OnColExit = DBGrid4ColExit
        OnDblClick = DBGrid4DblClick
        OnKeyDown = DBGrid4KeyDown
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CD_ITEM'
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
            FieldName = 'calcItem'
            ReadOnly = True
            Title.Caption = 'Item'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 170
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NM_TP_CALC'
            ReadOnly = True
            Title.Caption = 'Tipo Base'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 101
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'VL_BASE_CLI'
            Title.Caption = 'Valor Base'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 94
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'VL_VENDA'
            ReadOnly = True
            Title.Caption = 'Venda'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 80
            Visible = True
          end>
      end
    end
    object ts_taxa_aerea: TTabSheet
      Caption = 'Taxas'
      ImageIndex = 3
      object Label13: TLabel
        Left = 0
        Top = 0
        Width = 734
        Height = 13
        Align = alTop
        Caption = 'Despesa House'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 0
        Top = 163
        Width = 734
        Height = 13
        Align = alTop
        Caption = 'Valor Brasil'
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
        Height = 150
        Hint = 
          '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em Azul abrem consulta' +
          's OnLine'#13#10'*Ctrl + Delete exclui registro selecionado'
        Align = alTop
        DataSource = datm_retifica.ds_despesa_house
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Caption = 'C'#243'd.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 31
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'calcItem'
            ReadOnly = True
            Title.Caption = 'Item'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 170
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CD_MOEDA'
            Title.Caption = 'C'#243'd.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 34
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'calcMoeda'
            Title.Caption = 'Moeda'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 170
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NM_TP_CALC'
            ReadOnly = True
            Title.Caption = 'Tipo Base'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'VL_BASE_AG'
            Title.Caption = 'Valor Base'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_COMPRA_AG'
            ReadOnly = True
            Title.Caption = 'Compra'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 73
            Visible = True
          end>
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 176
        Width = 734
        Height = 173
        Hint = 
          '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em Azul abrem consulta' +
          's OnLine'#13#10'*Ctrl + Delete exclui registro selecionado'
        Align = alClient
        DataSource = datm_retifica.ds_vl_brasil
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
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Caption = 'C'#243'd.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 31
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'calcItem'
            ReadOnly = True
            Title.Caption = 'Item'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 170
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CD_MOEDA_VENDA'
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
            FieldName = 'calcMoeda'
            Title.Caption = 'Moeda'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 170
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'calc_repassa'
            ReadOnly = True
            Title.Caption = 'Cobrar do '
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 62
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'calc_profit'
            ReadOnly = True
            Title.Caption = 'Profit'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_TP_CALC'
            ReadOnly = True
            Title.Caption = 'Tipo Base'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 65
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'VL_BASE_CLI'
            Title.Caption = 'Valor Base'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_VENDA'
            ReadOnly = True
            Title.Caption = 'Venda'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Visible = True
          end>
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 244
    Top = 521
    object mi_salvar: TMenuItem
      Caption = 'Salvar'
    end
    object mi_cancelar: TMenuItem
      Caption = 'Cancelar'
    end
  end
end
