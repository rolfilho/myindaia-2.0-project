object frm_fat_Itl_complementar: Tfrm_fat_Itl_complementar
  Left = 192
  Top = 107
  Width = 750
  Height = 550
  Caption = 'Fatura Internacional Complementar'
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
  object pnl_master: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      49)
    object shp1: TShape
      Left = 444
      Top = 4
      Width = 295
      Height = 39
      Anchors = [akTop, akRight]
      Pen.Color = clGray
    end
    object SpeedButton3: TSpeedButton
      Left = 396
      Top = 4
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
      OnClick = SpeedButton3Click
    end
    object btn_salvar: TSpeedButton
      Left = 45
      Top = 4
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
    object btn_Cancelar: TSpeedButton
      Left = 85
      Top = 4
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
      OnClick = btn_CancelarClick
    end
    object Label41: TLabel
      Left = 451
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
    object Label42: TLabel
      Left = 589
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
      Left = 5
      Top = 4
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
      Left = 125
      Top = 4
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
    end
    object btn_aprovar: TSpeedButton
      Left = 171
      Top = 4
      Width = 40
      Height = 40
      Hint = 'Aprovar Account'
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
      OnClick = btn_aprovarClick
    end
    object btn_imprimir: TSpeedButton
      Left = 211
      Top = 4
      Width = 40
      Height = 40
      Hint = 'Emitir Fatura'
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
    object edt_chave: TEdit
      Left = 451
      Top = 18
      Width = 134
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 589
      Top = 18
      Width = 148
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 1
      TabStop = False
      OnChange = cb_ordemChange
    end
  end
  object pgctrl_fat_compl: TPageControl
    Left = 0
    Top = 49
    Width = 742
    Height = 455
    ActivePage = ts_dados_basicos
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_fat_complChange
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 44
        Width = 734
        Height = 383
        Align = alClient
        DataSource = datm_fat_Itl_complementar.ds_fatura_compl
        TabOrder = 0
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
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_FATURA'
            Title.Caption = 'Fatura'
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
            FieldName = 'CD_AGENTE'
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 31
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
            Width = 194
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_tp_fatura'
            Title.Caption = 'Tipo'
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
            Title.Caption = 'Valor'
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
            FieldName = 'dt'
            Title.Caption = 'Data'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 59
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 44
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label21: TLabel
          Left = 14
          Top = 4
          Width = 82
          Height = 13
          Caption = 'Unid. Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_uni_neg: TSpeedButton
          Left = 304
          Top = 18
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
          OnClick = btn_uni_negClick
        end
        object Label51: TLabel
          Left = 381
          Top = 4
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
          Left = 664
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
          OnClick = btn_co_produtoClick
        end
        object msk_cd_unid: TMaskEdit
          Left = 14
          Top = 17
          Width = 27
          Height = 21
          TabOrder = 0
          OnChange = btn_uni_negClick
          OnExit = msk_cd_unidExit
          OnKeyDown = msk_cd_unidKeyDown
        end
        object edt_nm_unid: TEdit
          Left = 40
          Top = 17
          Width = 262
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object msk_cd_produto: TMaskEdit
          Left = 381
          Top = 17
          Width = 27
          Height = 21
          TabOrder = 2
          OnChange = btn_co_produtoClick
          OnExit = msk_cd_produtoExit
          OnKeyDown = msk_cd_unidKeyDown
        end
        object edt_nm_produto: TEdit
          Left = 407
          Top = 17
          Width = 254
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
      object Label14: TLabel
        Left = 0
        Top = 173
        Width = 734
        Height = 13
        Align = alTop
        Caption = 'Oberva'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 173
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 8
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
        object Label2: TLabel
          Left = 285
          Top = 8
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
        object Label3: TLabel
          Left = 282
          Top = 131
          Width = 55
          Height = 13
          Caption = 'N'#186' Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 415
          Top = 132
          Width = 68
          Height = 13
          Caption = 'Data Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 566
          Top = 132
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
        object Label6: TLabel
          Left = 666
          Top = 132
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
        object Label7: TLabel
          Left = 556
          Top = 8
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
        object Label8: TLabel
          Left = 146
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
        object Label9: TLabel
          Left = 8
          Top = 79
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
        object Label10: TLabel
          Left = 277
          Top = 79
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
        object btn_co_master: TSpeedButton
          Left = 700
          Top = 22
          Width = 25
          Height = 20
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
        object Label13: TLabel
          Left = 8
          Top = 42
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
        object DBText1: TDBText
          Left = 558
          Top = 60
          Width = 163
          Height = 17
          Color = clSilver
          DataField = 'calc_in_imporesso'
          DataSource = datm_fat_Itl_complementar.ds_fatura_compl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object dbedt_nr_fatura: TDBEdit
          Left = 283
          Top = 146
          Width = 125
          Height = 21
          Color = clMenu
          DataField = 'NR_FATURA'
          DataSource = datm_fat_Itl_complementar.ds_fatura_compl
          ReadOnly = True
          TabOrder = 0
          OnChange = dbr_tp_faturaChange
        end
        object dbedt_dt_fatura: TDBEdit
          Left = 415
          Top = 146
          Width = 137
          Height = 21
          Color = clMenu
          DataField = 'DT_FATURA'
          DataSource = datm_fat_Itl_complementar.ds_fatura_compl
          ReadOnly = True
          TabOrder = 1
          OnChange = dbr_tp_faturaChange
        end
        object dbedt_vl_cre_ag: TDBEdit
          Left = 556
          Top = 147
          Width = 95
          Height = 21
          DataField = 'VL_CRE_AGENTE'
          DataSource = datm_fat_Itl_complementar.ds_fatura_compl
          TabOrder = 2
          OnChange = dbr_tp_faturaChange
        end
        object DBEdit8: TDBEdit
          Left = 655
          Top = 146
          Width = 72
          Height = 21
          Color = clMenu
          DataField = 'AP_MOEDA'
          DataSource = datm_fat_Itl_complementar.ds_fatura_compl
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nr_master: TDBEdit
          Left = 556
          Top = 22
          Width = 141
          Height = 21
          Color = clMenu
          DataField = 'CD_MASTER'
          DataSource = datm_fat_Itl_complementar.ds_fatura_compl
          ReadOnly = True
          TabOrder = 4
          OnExit = dbedt_nr_masterExit
          OnKeyDown = msk_cd_unidKeyDown
        end
        object DBEdit10: TDBEdit
          Left = 146
          Top = 57
          Width = 41
          Height = 21
          Color = clMenu
          DataField = 'CD_AGENTE'
          DataSource = datm_fat_Itl_complementar.ds_fatura_compl
          TabOrder = 5
        end
        object DBEdit11: TDBEdit
          Left = 188
          Top = 57
          Width = 365
          Height = 21
          Color = clMenu
          DataField = 'NM_AGENTE'
          DataSource = datm_fat_Itl_complementar.ds_fatura_compl
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit12: TDBEdit
          Left = 8
          Top = 94
          Width = 269
          Height = 21
          Color = clMenu
          DataField = 'NM_ORIGEM'
          DataSource = datm_fat_Itl_complementar.ds_fatura_compl
          TabOrder = 7
        end
        object DBEdit13: TDBEdit
          Left = 283
          Top = 94
          Width = 270
          Height = 21
          Color = clMenu
          DataField = 'NM_DESTINO'
          DataSource = datm_fat_Itl_complementar.ds_fatura_compl
          TabOrder = 8
        end
        object msk_cd_unid2: TMaskEdit
          Left = 8
          Top = 22
          Width = 27
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 9
          OnExit = msk_cd_unidExit
        end
        object edt_nm_unid2: TEdit
          Left = 34
          Top = 22
          Width = 244
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 10
        end
        object msk_cd_produto2: TMaskEdit
          Left = 283
          Top = 22
          Width = 27
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 11
          OnExit = msk_cd_produtoExit
        end
        object edt_nm_produto2: TEdit
          Left = 309
          Top = 22
          Width = 244
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 12
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 57
          Width = 132
          Height = 21
          Color = clMenu
          DataField = 'NR_MASTER'
          DataSource = datm_fat_Itl_complementar.ds_fatura_compl
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_vl_deb_ag: TDBEdit
          Left = 556
          Top = 147
          Width = 95
          Height = 21
          DataField = 'VL_DEB_AGENTE'
          DataSource = datm_fat_Itl_complementar.ds_fatura_compl
          TabOrder = 14
          OnChange = dbr_tp_faturaChange
        end
        object dbedt_vl_cre_br: TDBEdit
          Left = 556
          Top = 147
          Width = 95
          Height = 21
          Color = clMenu
          DataField = 'VL_CRE_BRASIL'
          DataSource = datm_fat_Itl_complementar.ds_fatura_compl
          ReadOnly = True
          TabOrder = 15
        end
        object dbedt_vl_deb_br: TDBEdit
          Left = 556
          Top = 146
          Width = 95
          Height = 21
          Color = clMenu
          DataField = 'VL_DEB_BRASIL'
          DataSource = datm_fat_Itl_complementar.ds_fatura_compl
          ReadOnly = True
          TabOrder = 16
        end
        object Panel4: TPanel
          Left = 4
          Top = 118
          Width = 269
          Height = 50
          BevelInner = bvLowered
          TabOrder = 17
          object rb_cre_agente: TRadioButton
            Left = 8
            Top = 7
            Width = 113
            Height = 17
            Caption = 'Agente/ Credito'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = rb_cre_agenteClick
          end
          object rb_deb_agente: TRadioButton
            Left = 8
            Top = 27
            Width = 113
            Height = 17
            Caption = 'Agente/ Debito'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = rb_cre_agenteClick
          end
          object rb_cre_brasil: TRadioButton
            Left = 135
            Top = 6
            Width = 113
            Height = 17
            Caption = 'Brasil/ Credito'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = rb_cre_agenteClick
          end
          object rb_deb_brasil: TRadioButton
            Left = 135
            Top = 28
            Width = 113
            Height = 17
            Caption = 'Brasil/ Debito'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = rb_cre_agenteClick
          end
        end
      end
      object pnl_item: TPanel
        Left = 0
        Top = 262
        Width = 734
        Height = 165
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 1
        object Panel5: TPanel
          Left = 403
          Top = 2
          Width = 329
          Height = 161
          Align = alRight
          BevelInner = bvLowered
          TabOrder = 0
          object btn_salvar1: TSpeedButton
            Left = 25
            Top = 5
            Width = 18
            Height = 19
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
          object btn_cancelar1: TSpeedButton
            Left = 44
            Top = 5
            Width = 18
            Height = 19
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
            OnClick = btn_CancelarClick
          end
          object btn_incluir1: TSpeedButton
            Left = 6
            Top = 5
            Width = 18
            Height = 19
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
            OnClick = btn_incluir1Click
          end
          object btn_excluir1: TSpeedButton
            Left = 63
            Top = 5
            Width = 16
            Height = 19
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
            OnClick = btn_excluir1Click
          end
          object Label11: TLabel
            Left = 6
            Top = 51
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
            Left = 7
            Top = 97
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
          object Bevel1: TBevel
            Left = 4
            Top = 28
            Width = 323
            Height = 7
            Shape = bsTopLine
          end
          object btn_co_item: TSpeedButton
            Left = 299
            Top = 64
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
            OnClick = btn_co_itemClick
          end
          object dbedt_nm_item: TDBEdit
            Left = 42
            Top = 64
            Width = 255
            Height = 21
            Color = clMenu
            DataField = 'Look_nm_item'
            DataSource = datm_fat_Itl_complementar.ds_fat_item
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_cd_item: TDBEdit
            Left = 6
            Top = 64
            Width = 36
            Height = 21
            DataField = 'CD_ITEM'
            DataSource = datm_fat_Itl_complementar.ds_fat_item
            TabOrder = 1
            OnChange = dbedt_cd_itemChange
            OnExit = dbedt_cd_itemExit
            OnKeyDown = msk_cd_unidKeyDown
          end
          object DBEdit16: TDBEdit
            Left = 7
            Top = 111
            Width = 106
            Height = 21
            DataField = 'VL_ITEM'
            DataSource = datm_fat_Itl_complementar.ds_fat_item
            TabOrder = 2
            OnChange = dbedt_cd_itemChange
          end
        end
        object DBGrid2: TDBGrid
          Left = 2
          Top = 2
          Width = 401
          Height = 161
          Align = alClient
          DataSource = datm_fat_Itl_complementar.ds_fat_item
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
              FieldName = 'CD_ITEM'
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
              FieldName = 'Look_nm_item'
              Title.Caption = 'Item'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 242
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_ITEM'
              Title.Caption = 'Valor'
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
      object DBMemo1: TDBMemo
        Left = 0
        Top = 186
        Width = 734
        Height = 76
        Align = alTop
        DataField = 'TX_OBS'
        DataSource = datm_fat_Itl_complementar.ds_fatura_compl
        TabOrder = 2
        OnChange = dbr_tp_faturaChange
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 658
    Top = 411
    object mi_Incluir: TMenuItem
      Caption = '&Incluir'
    end
    object mi_Salvar: TMenuItem
      Caption = '&Salvar'
    end
    object mi_Cancelar: TMenuItem
      Caption = '&Cancelar'
    end
    object mi_Excluir: TMenuItem
      Caption = '&Excluir'
    end
    object TMenuItem
    end
    object mi_Sair: TMenuItem
      Caption = 'Sai&r'
    end
  end
end
