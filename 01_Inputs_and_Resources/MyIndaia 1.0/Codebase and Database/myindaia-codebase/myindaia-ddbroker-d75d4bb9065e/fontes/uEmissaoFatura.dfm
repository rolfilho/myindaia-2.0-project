object frm_emissao_fatura: Tfrm_emissao_fatura
  Left = 263
  Top = 305
  Width = 750
  Height = 550
  Caption = 'Emiss'#227'o de Fatura'
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
  object SpeedButton12: TSpeedButton
    Left = 327
    Top = 320
    Width = 25
    Height = 20
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
  object SpeedButton21: TSpeedButton
    Left = 513
    Top = 404
    Width = 25
    Height = 20
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
  object Label89: TLabel
    Left = 222
    Top = 405
    Width = 62
    Height = 13
    Caption = 'Exportador'
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
    Width = 742
    Height = 45
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      45)
    object shp1: TShape
      Left = 441
      Top = 4
      Width = 299
      Height = 38
      Anchors = [akTop, akRight]
      Pen.Color = clGray
    end
    object btn_sair: TSpeedButton
      Left = 396
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
      Left = 42
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
      Left = 82
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
    object btn_imprimir: TSpeedButton
      Left = 355
      Top = 3
      Width = 40
      Height = 40
      Hint = 'Emitir Fatura'
      Anchors = [akTop, akRight]
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
    object Label1: TLabel
      Left = 447
      Top = 5
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
      Left = 583
      Top = 5
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
      Left = 2
      Top = 3
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
      Left = 122
      Top = 3
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
    object dbnvg: TDBNavigator
      Left = 233
      Top = 10
      Width = 100
      Height = 25
      DataSource = datm_emissao_fatura.ds_emissao_fatura
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object edt_chave: TEdit
      Left = 447
      Top = 18
      Width = 129
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 583
      Top = 18
      Width = 153
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
      TabStop = False
      OnChange = cb_ordemChange
    end
  end
  object pgctrl_emissao_fat: TPageControl
    Left = 0
    Top = 45
    Width = 742
    Height = 459
    ActivePage = ts_dados_master
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_emissao_fatChange
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 49
        Width = 734
        Height = 382
        Align = alClient
        DataSource = datm_emissao_fatura.ds_emissao_fatura
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
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_FATURA'
            Title.Caption = 'Nr Fatura'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 113
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
            Width = 177
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Look_tp_fatura'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 104
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
            Width = 114
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 49
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label31: TLabel
          Left = 9
          Top = 6
          Width = 117
          Height = 13
          Caption = 'Unidade de Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_unid: TSpeedButton
          Left = 288
          Top = 20
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
          OnClick = btn_co_unidClick
        end
        object Label33: TLabel
          Left = 361
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
        object btn_co_produto: TSpeedButton
          Left = 657
          Top = 20
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
          OnClick = btn_co_produtoClick
        end
        object msk_unid: TMaskEdit
          Left = 9
          Top = 20
          Width = 28
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 0
          OnChange = btn_co_unidClick
          OnExit = msk_unidExit
          OnKeyDown = msk_cd_produtoKeyDown
        end
        object edt_nm_unid_neg: TEdit
          Left = 37
          Top = 20
          Width = 249
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object msk_cd_produto: TMaskEdit
          Left = 361
          Top = 19
          Width = 32
          Height = 21
          TabOrder = 2
          OnChange = btn_co_produtoClick
          OnExit = msk_cd_produtoExit
          OnKeyDown = msk_cd_produtoKeyDown
        end
        object edt_nm_produto: TEdit
          Left = 393
          Top = 19
          Width = 262
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
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
        Height = 126
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label3: TLabel
          Left = 8
          Top = 44
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
          Top = 8
          Width = 117
          Height = 13
          Caption = 'Unidade de Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 367
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
        object Label6: TLabel
          Left = 149
          Top = 44
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
        object Label7: TLabel
          Left = 8
          Top = 80
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
        object Label8: TLabel
          Left = 147
          Top = 80
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
        object Label9: TLabel
          Left = 293
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
          Left = 554
          Top = 44
          Width = 84
          Height = 13
          Caption = 'Via Transporte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_processo: TSpeedButton
          Left = 115
          Top = 56
          Width = 25
          Height = 21
          Enabled = False
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
        object DBEdit6: TDBEdit
          Left = 149
          Top = 56
          Width = 33
          Height = 21
          Color = clMenu
          DataField = 'CD_AGENTE'
          DataSource = datm_emissao_fatura.ds_emissao_fatura
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit7: TDBEdit
          Left = 182
          Top = 56
          Width = 366
          Height = 21
          Color = clMenu
          DataField = 'NM_AGENTE'
          DataSource = datm_emissao_fatura.ds_emissao_fatura
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit8: TDBEdit
          Left = 8
          Top = 92
          Width = 132
          Height = 21
          Color = clMenu
          DataField = 'AP_ORIGEM'
          DataSource = datm_emissao_fatura.ds_emissao_fatura
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit9: TDBEdit
          Left = 147
          Top = 92
          Width = 132
          Height = 21
          Color = clMenu
          DataField = 'AP_DESTINO'
          DataSource = datm_emissao_fatura.ds_emissao_fatura
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit10: TDBEdit
          Left = 293
          Top = 92
          Width = 254
          Height = 21
          Color = clMenu
          DataField = 'AP_MOEDA'
          DataSource = datm_emissao_fatura.ds_emissao_fatura
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit14: TDBEdit
          Left = 554
          Top = 56
          Width = 167
          Height = 21
          Color = clMenu
          DataField = 'NM_VIA_TRANSP'
          DataSource = datm_emissao_fatura.ds_emissao_fatura
          ReadOnly = True
          TabOrder = 5
        end
        object msk_unid2: TMaskEdit
          Left = 8
          Top = 22
          Width = 29
          Height = 21
          Color = clMenu
          EditMask = '99;0; '
          MaxLength = 2
          ReadOnly = True
          TabOrder = 6
          OnExit = msk_unidExit
        end
        object edt_nm_unid_neg2: TEdit
          Left = 36
          Top = 22
          Width = 325
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 7
        end
        object msk_cd_produto2: TMaskEdit
          Left = 367
          Top = 22
          Width = 29
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 8
          OnExit = msk_cd_produtoExit
        end
        object edt_nm_produto2: TEdit
          Left = 396
          Top = 22
          Width = 325
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 9
        end
        object msk_processo: TMaskEdit
          Left = 8
          Top = 56
          Width = 105
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 10
          OnExit = msk_processoExit
          OnKeyDown = msk_cd_produtoKeyDown
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 126
        Width = 734
        Height = 86
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label10: TLabel
          Left = 294
          Top = 6
          Width = 37
          Height = 13
          Caption = 'Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 462
          Top = 6
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
        object Label12: TLabel
          Left = 555
          Top = 6
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
        object Label14: TLabel
          Left = 8
          Top = 5
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
        object Label15: TLabel
          Left = 8
          Top = 44
          Width = 100
          Height = 13
          Caption = 'Total das Faturas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbrdgp_tp_fat: TDBRadioGroup
          Left = 147
          Top = 7
          Width = 132
          Height = 73
          Caption = 'Fatura'
          DataField = 'TP_FATURA'
          DataSource = datm_emissao_fatura.ds_emissao_fatura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Brasil / Cr'#233'dito'
            'Brasil / D'#233'bito')
          ParentFont = False
          TabOrder = 0
          Values.Strings = (
            '2'
            '3')
          OnChange = dbedt_nr_faturaChange
        end
        object dbedt_nr_fatura: TDBEdit
          Left = 294
          Top = 19
          Width = 164
          Height = 21
          Color = clMenu
          DataField = 'NR_FATURA'
          DataSource = datm_emissao_fatura.ds_emissao_fatura
          ReadOnly = True
          TabOrder = 1
          OnChange = dbedt_nr_faturaChange
        end
        object dbedt_dt_fatura: TDBEdit
          Left = 462
          Top = 19
          Width = 87
          Height = 21
          DataField = 'DT_FATURA'
          DataSource = datm_emissao_fatura.ds_emissao_fatura
          TabOrder = 2
          OnChange = dbedt_nr_faturaChange
        end
        object dbedt_vl_cre_br: TDBEdit
          Left = 555
          Top = 19
          Width = 167
          Height = 21
          DataField = 'VL_CRE_BRASIL'
          DataSource = datm_emissao_fatura.ds_emissao_fatura
          TabOrder = 3
          OnChange = dbedt_nr_faturaChange
        end
        object dbedt_vl_deb_br: TDBEdit
          Left = 555
          Top = 19
          Width = 167
          Height = 21
          DataField = 'VL_DEB_BRASIL'
          DataSource = datm_emissao_fatura.ds_emissao_fatura
          TabOrder = 4
          OnChange = dbedt_nr_faturaChange
        end
        object dbedt_vl_deb_ag: TDBEdit
          Left = 555
          Top = 19
          Width = 167
          Height = 21
          Color = clMenu
          DataField = 'VL_DEB_AGENTE'
          DataSource = datm_emissao_fatura.ds_emissao_fatura
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_vl_cre_ag: TDBEdit
          Left = 555
          Top = 19
          Width = 167
          Height = 21
          Color = clMenu
          DataField = 'VL_CRE_AGENTE'
          DataSource = datm_emissao_fatura.ds_emissao_fatura
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_vl_ajuste: TDBEdit
          Left = 555
          Top = 19
          Width = 167
          Height = 21
          Color = clMenu
          DataField = 'VL_AJUSTE'
          DataSource = datm_emissao_fatura.ds_emissao_fatura
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 18
          Width = 132
          Height = 21
          Color = clMenu
          DataField = 'VL_ACCOUNT'
          DataSource = datm_emissao_fatura.ds_emissao_fatura
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit2: TDBEdit
          Left = 8
          Top = 57
          Width = 132
          Height = 21
          Color = clMenu
          DataField = 'TOTAL'
          DataSource = datm_emissao_fatura.ds_soma_fat
          ReadOnly = True
          TabOrder = 9
        end
      end
    end
    object ts_lista_master: TTabSheet
      Caption = 'Lista'
      ImageIndex = 2
      object DBGrid2: TDBGrid
        Left = 0
        Top = 49
        Width = 734
        Height = 382
        Align = alClient
        DataSource = datm_emissao_fatura.ds_master
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
            Width = 39
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
            Width = 244
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
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_ORIGEM'
            Title.Caption = 'Origem'
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
            FieldName = 'AP_DESTINO'
            Title.Caption = 'Destino'
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
            FieldName = 'NM_VIA_TRANSP'
            Title.Caption = 'Via Transporte'
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
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 49
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label16: TLabel
          Left = 9
          Top = 6
          Width = 117
          Height = 13
          Caption = 'Unidade de Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_unid_master: TSpeedButton
          Left = 288
          Top = 20
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
        object Label17: TLabel
          Left = 361
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
        object btn_co_prod_master: TSpeedButton
          Left = 657
          Top = 20
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
          OnClick = btn_co_prod_masterClick
        end
        object msk_unid_master: TMaskEdit
          Left = 9
          Top = 20
          Width = 28
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 0
          OnChange = btn_co_unid_masterClick
          OnExit = msk_unid_masterExit
          OnKeyDown = msk_cd_produtoKeyDown
        end
        object edt_nm_unid_master: TEdit
          Left = 37
          Top = 20
          Width = 249
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object msk_prod_master: TMaskEdit
          Left = 361
          Top = 19
          Width = 32
          Height = 21
          TabOrder = 2
          OnChange = btn_co_prod_masterClick
          OnExit = msk_prod_masterExit
          OnKeyDown = msk_cd_produtoKeyDown
        end
        object edt_nm_prod_master: TEdit
          Left = 393
          Top = 19
          Width = 262
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
    object ts_dados_master: TTabSheet
      Caption = 'Dados B'#225'sicos'
      ImageIndex = 3
      object Label35: TLabel
        Left = 0
        Top = 212
        Width = 734
        Height = 13
        Align = alTop
        Caption = 'Observa'#231#227'o'
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
        Width = 734
        Height = 126
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label18: TLabel
          Left = 8
          Top = 43
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
        object Label19: TLabel
          Left = 8
          Top = 8
          Width = 117
          Height = 13
          Caption = 'Unidade de Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 367
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
        object Label21: TLabel
          Left = 149
          Top = 43
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
        object Label22: TLabel
          Left = 8
          Top = 78
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
          Left = 147
          Top = 78
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
          Left = 293
          Top = 78
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
        object Label25: TLabel
          Left = 554
          Top = 43
          Width = 84
          Height = 13
          Caption = 'Via Transporte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_master: TSpeedButton
          Left = 115
          Top = 56
          Width = 25
          Height = 21
          Enabled = False
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
          OnClick = btn_co_masterClick
        end
        object DBEdit3: TDBEdit
          Left = 149
          Top = 56
          Width = 33
          Height = 21
          Color = clMenu
          DataField = 'CD_AGENTE'
          DataSource = datm_emissao_fatura.ds_master
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 182
          Top = 56
          Width = 366
          Height = 21
          Color = clMenu
          DataField = 'NM_AGENTE'
          DataSource = datm_emissao_fatura.ds_master
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit5: TDBEdit
          Left = 8
          Top = 92
          Width = 132
          Height = 21
          Color = clMenu
          DataField = 'AP_ORIGEM'
          DataSource = datm_emissao_fatura.ds_master
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit11: TDBEdit
          Left = 147
          Top = 92
          Width = 132
          Height = 21
          Color = clMenu
          DataField = 'AP_DESTINO'
          DataSource = datm_emissao_fatura.ds_master
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit12: TDBEdit
          Left = 293
          Top = 92
          Width = 254
          Height = 21
          Color = clMenu
          DataField = 'AP_MOEDA'
          DataSource = datm_emissao_fatura.ds_master
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit13: TDBEdit
          Left = 554
          Top = 56
          Width = 167
          Height = 21
          Color = clMenu
          DataField = 'NM_VIA_TRANSP'
          DataSource = datm_emissao_fatura.ds_master
          ReadOnly = True
          TabOrder = 5
        end
        object msk_unid_master2: TMaskEdit
          Left = 8
          Top = 22
          Width = 29
          Height = 21
          Color = clMenu
          EditMask = '99;0; '
          MaxLength = 2
          ReadOnly = True
          TabOrder = 6
          OnExit = msk_unidExit
        end
        object edt_nm_unid_master2: TEdit
          Left = 36
          Top = 22
          Width = 325
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 7
        end
        object msk_prod_master2: TMaskEdit
          Left = 367
          Top = 22
          Width = 29
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 8
          OnExit = msk_cd_produtoExit
        end
        object edt_nm_prod_master2: TEdit
          Left = 396
          Top = 22
          Width = 325
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 9
        end
        object msk_nr_master: TMaskEdit
          Left = 8
          Top = 56
          Width = 105
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 10
          OnExit = msk_nr_masterExit
          OnKeyDown = msk_cd_produtoKeyDown
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 126
        Width = 734
        Height = 86
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label26: TLabel
          Left = 294
          Top = 5
          Width = 37
          Height = 13
          Caption = 'Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 462
          Top = 5
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
          Left = 554
          Top = 5
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
        object Label29: TLabel
          Left = 8
          Top = 5
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
        object Label30: TLabel
          Left = 8
          Top = 44
          Width = 100
          Height = 13
          Caption = 'Total das Faturas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_ajuste_master: TDBEdit
          Left = 554
          Top = 18
          Width = 167
          Height = 21
          Color = clMenu
          DataField = 'VL_AJUSTE'
          DataSource = datm_emissao_fatura.ds_master
          ReadOnly = True
          TabOrder = 7
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 147
          Top = 7
          Width = 132
          Height = 73
          Caption = 'Fatura'
          DataField = 'TP_FATURA'
          DataSource = datm_emissao_fatura.ds_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Brasil / Cr'#233'dito'
            'Brasil / D'#233'bito')
          ParentFont = False
          TabOrder = 0
          Values.Strings = (
            '2'
            '3')
          OnChange = dbedt_nr_fat_masterChange
        end
        object dbedt_nr_fat_master: TDBEdit
          Left = 294
          Top = 18
          Width = 164
          Height = 21
          Color = clMenu
          DataField = 'NR_FATURA'
          DataSource = datm_emissao_fatura.ds_master
          ReadOnly = True
          TabOrder = 1
          OnChange = dbedt_nr_fat_masterChange
        end
        object dbedt_dt_fat_master: TDBEdit
          Left = 462
          Top = 18
          Width = 87
          Height = 21
          DataField = 'DT_FATURA'
          DataSource = datm_emissao_fatura.ds_master
          TabOrder = 2
          OnChange = dbedt_nr_fat_masterChange
        end
        object dbedt_vl_cre_br_master: TDBEdit
          Left = 554
          Top = 18
          Width = 167
          Height = 21
          DataField = 'VL_CRE_BRASIL'
          DataSource = datm_emissao_fatura.ds_master
          TabOrder = 3
          OnChange = dbedt_nr_fat_masterChange
        end
        object dbedt_vl_deb_br_master: TDBEdit
          Left = 554
          Top = 18
          Width = 167
          Height = 21
          DataField = 'VL_DEB_BRASIL'
          DataSource = datm_emissao_fatura.ds_master
          TabOrder = 4
          OnChange = dbedt_nr_fat_masterChange
        end
        object dbedt_vl_deb_ag_master: TDBEdit
          Left = 554
          Top = 18
          Width = 167
          Height = 21
          Color = clMenu
          DataField = 'VL_DEB_AGENTE'
          DataSource = datm_emissao_fatura.ds_master
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_vl_cre_ag_master: TDBEdit
          Left = 554
          Top = 18
          Width = 167
          Height = 21
          Color = clMenu
          DataField = 'VL_CRE_AGENTE'
          DataSource = datm_emissao_fatura.ds_master
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit22: TDBEdit
          Left = 8
          Top = 18
          Width = 132
          Height = 21
          Color = clMenu
          DataField = 'VL_ACCOUNT'
          DataSource = datm_emissao_fatura.ds_master
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit23: TDBEdit
          Left = 8
          Top = 57
          Width = 132
          Height = 21
          Color = clMenu
          DataField = 'TOTAL'
          DataSource = datm_emissao_fatura.ds_soma_fat_master
          ReadOnly = True
          TabOrder = 9
        end
      end
      object DBMemo1: TDBMemo
        Left = 0
        Top = 225
        Width = 734
        Height = 206
        Align = alClient
        DataField = 'TX_OBS'
        DataSource = datm_emissao_fatura.ds_master
        TabOrder = 2
        OnChange = dbedt_nr_fat_masterChange
      end
    end
    object ts_reemissao: TTabSheet
      Caption = 'Reemiss'#227'o Fatura'
      ImageIndex = 4
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 49
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label32: TLabel
          Left = 9
          Top = 6
          Width = 117
          Height = 13
          Caption = 'Unidade de Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_unid_reemissao: TSpeedButton
          Left = 288
          Top = 20
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
          OnClick = btn_co_unid_reemissaoClick
        end
        object Label34: TLabel
          Left = 361
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
        object btn_co_prod_reemissao: TSpeedButton
          Left = 657
          Top = 20
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
          OnClick = btn_co_prod_reemissaoClick
        end
        object msk_cd_unid_reemissao: TMaskEdit
          Left = 9
          Top = 20
          Width = 28
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 0
          OnChange = btn_co_unid_reemissaoClick
          OnExit = msk_cd_unid_reemissaoExit
          OnKeyDown = msk_cd_produtoKeyDown
        end
        object edt_nm_unid_reemissao: TEdit
          Left = 37
          Top = 20
          Width = 249
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object msk_cd_prod_reemissao: TMaskEdit
          Left = 361
          Top = 19
          Width = 32
          Height = 21
          TabOrder = 2
          OnChange = btn_co_prod_reemissaoClick
          OnExit = msk_cd_prod_reemissaoExit
          OnKeyDown = msk_cd_produtoKeyDown
        end
        object edt_nm_prod_reemissao: TEdit
          Left = 393
          Top = 19
          Width = 261
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 49
        Width = 734
        Height = 382
        Align = alClient
        DataSource = datm_emissao_fatura.ds_reemissao
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
            Width = 99
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
            Width = 102
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
            Width = 149
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_tp_fatura'
            Title.Caption = 'Fatura'
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
            FieldName = 'VL_FATURA'
            Title.Caption = 'Vl Fatura'
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
            FieldName = 'DT_FATURA'
            Title.Caption = 'Data'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 50
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
            Width = 94
            Visible = True
          end>
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 524
    Top = 376
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
    end
    object TMenuItem
    end
    object mi_sair: TMenuItem
      Caption = '&Sair'
      OnClick = btn_sairClick
    end
  end
end
