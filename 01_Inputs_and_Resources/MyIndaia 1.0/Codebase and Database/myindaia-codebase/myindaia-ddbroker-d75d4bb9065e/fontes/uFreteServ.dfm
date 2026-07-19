object frm_frete_serv: Tfrm_frete_serv
  Left = 336
  Top = 102
  Width = 780
  Height = 768
  Caption = 'frm_frete_serv'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      772
      47)
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 3
      Width = 38
      Height = 41
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
      Left = 118
      Top = 3
      Width = 38
      Height = 41
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
      Left = 730
      Top = 3
      Width = 38
      Height = 41
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
      Width = 38
      Height = 41
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
      Left = 80
      Top = 3
      Width = 38
      Height = 41
      Hint = 'Cancela'
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
    object btn_duplica_frete: TSpeedButton
      Left = 159
      Top = 3
      Width = 38
      Height = 41
      Hint = 'DUPLICA FRETE'
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
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
    object btn_iata: TSpeedButton
      Left = 200
      Top = 3
      Width = 38
      Height = 41
      Hint = 'IATA'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
        055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
        88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
        F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
        F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
        0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
        00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
        0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
        05555575FF777777755555500055555555555557775555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
  end
  object pcModulo: TPageControl
    Left = 0
    Top = 47
    Width = 772
    Height = 675
    ActivePage = TabImportacao
    Align = alClient
    TabOrder = 1
    object TabImportacao: TTabSheet
      Caption = 'Importa'#231#227'o / Exporta'#231#227'o'
      object pgctrl_frete: TPageControl
        Left = 0
        Top = 0
        Width = 764
        Height = 647
        ActivePage = ts_lista
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_freteChange
        OnChanging = pgctrl_freteChanging
        object ts_lista: TTabSheet
          Caption = 'Lista'
          OnShow = ts_listaShow
          object dbGrid_Lista: TDBGrid
            Left = 0
            Top = 135
            Width = 756
            Height = 484
            Align = alClient
            DataSource = datm_frete_serv.ds_lista
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = dbGrid_ListaDrawColumnCell
            OnDblClick = dbGrid_ListaDblClick
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'cd_tab_frete'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'digo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'desc_tab_frete'
                Title.Caption = 'Tabela Frete'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 254
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CODIGO'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'digo'
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
                FieldName = 'NM_REF'
                Title.Caption = 'Agente'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 276
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CD_CIA_TRANSP_TAB_FRETE'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'digo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_CIA'
                Title.Caption = 'Companhia'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CD_ARMADOR'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'digo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'NM_ARM'
                Title.Caption = 'Armador'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = False
              end>
          end
          object Panel3: TPanel
            Left = 0
            Top = 89
            Width = 756
            Height = 46
            Align = alTop
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              756
              46)
            object GroupBox1: TGroupBox
              Left = 7
              Top = 1
              Width = 280
              Height = 43
              Caption = 'Legenda'
              TabOrder = 0
              object Shape2: TShape
                Left = 6
                Top = 17
                Width = 16
                Height = 16
                Brush.Color = 12189625
                Pen.Color = clGray
              end
              object Label19: TLabel
                Left = 24
                Top = 19
                Width = 68
                Height = 13
                Caption = 'Agenciamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Shape3: TShape
                Left = 115
                Top = 17
                Width = 16
                Height = 16
                Brush.Color = 16763025
                Pen.Color = clGray
              end
              object Label24: TLabel
                Left = 132
                Top = 19
                Width = 66
                Height = 13
                Caption = 'Desembara'#231'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Shape1: TShape
                Left = 222
                Top = 17
                Width = 16
                Height = 16
                Pen.Color = clGray
              end
              object Label33: TLabel
                Left = 240
                Top = 19
                Width = 32
                Height = 13
                Caption = 'Ambos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
            end
            object rdgrupo_tp_frete: TRadioGroup
              Left = 420
              Top = 4
              Width = 274
              Height = 35
              Anchors = [akTop, akRight]
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Cia Custo'
                'Agente Custo')
              TabOrder = 1
              OnClick = rdgrupo_tp_freteClick
            end
          end
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 756
            Height = 89
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 2
            object Label1: TLabel
              Left = 105
              Top = 4
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
            object Label2: TLabel
              Left = 432
              Top = 4
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
            object btn_co_origem_frete: TSpeedButton
              Left = 395
              Top = 17
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
              OnClick = btn_co_origem_freteClick
            end
            object btn_co_destino: TSpeedButton
              Left = 722
              Top = 17
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
            object Label9: TLabel
              Left = 105
              Top = 43
              Width = 47
              Height = 13
              Caption = 'Agencia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblCia_Armador: TLabel
              Left = 432
              Top = 43
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
            object btn_co_armador_cia: TSpeedButton
              Left = 723
              Top = 56
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
              OnClick = btn_co_armador_ciaClick
            end
            object btn_co_agencia: TSpeedButton
              Left = 395
              Top = 56
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
              OnClick = btn_co_agenciaClick
            end
            object Label12: TLabel
              Left = 156
              Top = 43
              Width = 113
              Height = 13
              Caption = '(opcional para consulta)'
            end
            object Label13: TLabel
              Left = 498
              Top = 43
              Width = 113
              Height = 13
              Caption = '(opcional para consulta)'
            end
            object edt_nm_origem: TEdit
              Left = 149
              Top = 17
              Width = 246
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 2
            end
            object edt_nm_destino: TEdit
              Left = 478
              Top = 16
              Width = 243
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 4
            end
            object msk_cd_origem: TMaskEdit
              Left = 105
              Top = 17
              Width = 42
              Height = 21
              MaxLength = 4
              TabOrder = 1
              OnChange = btn_co_origem_freteClick
              OnExit = msk_cd_origemExit
              OnKeyDown = msk_cd_origemKeyDown
            end
            object msk_cd_destino: TMaskEdit
              Left = 432
              Top = 17
              Width = 42
              Height = 21
              MaxLength = 4
              TabOrder = 3
              OnChange = btn_co_destinoClick
              OnExit = msk_cd_destinoExit
            end
            object rgVIA_TRANSP: TRadioGroup
              Left = 8
              Top = 13
              Width = 91
              Height = 63
              Ctl3D = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ItemIndex = 0
              Items.Strings = (
                'A'#233'reo'
                'Mar'#237'timo')
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              OnClick = rgVIA_TRANSPClick
            end
            object msk_cd_agencia: TMaskEdit
              Left = 105
              Top = 56
              Width = 42
              Height = 21
              MaxLength = 4
              TabOrder = 5
              OnChange = btn_co_agenciaClick
              OnExit = msk_cd_agenciaExit
            end
            object msk_nm_agencia: TEdit
              Left = 149
              Top = 56
              Width = 246
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 6
            end
            object msk_cd_cia_armador: TMaskEdit
              Left = 432
              Top = 56
              Width = 42
              Height = 21
              MaxLength = 4
              TabOrder = 7
              OnChange = btn_co_armador_ciaClick
              OnExit = msk_cd_cia_armadorExit
            end
            object msk_nm_cia_armador: TEdit
              Left = 478
              Top = 56
              Width = 243
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 8
            end
          end
        end
        object ts_dados_cia_armador: TTabSheet
          Caption = 'Dados B'#225'sicos'
          ImageIndex = 1
          OnShow = ts_dados_cia_armadorShow
          object Label26: TLabel
            Left = 0
            Top = 518
            Width = 756
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
          object pParametros: TPanel
            Left = 0
            Top = 133
            Width = 756
            Height = 50
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 1
            object Label7: TLabel
              Left = 564
              Top = 9
              Width = 50
              Height = 13
              Caption = 'Validade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_dt_validade: TDBDateEdit
              Left = 565
              Top = 21
              Width = 96
              Height = 21
              DataField = 'DT_TAB_FRETE'
              DataSource = datm_frete_serv.ds_frete
              NumGlyphs = 2
              TabOrder = 0
              YearDigits = dyFour
              OnChange = Status_Botoes
            end
            object pnl_moeda: TPanel
              Left = 5
              Top = 4
              Width = 537
              Height = 43
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
              object Label8: TLabel
                Left = 12
                Top = 3
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
              object bnt_moeda: TSpeedButton
                Left = 112
                Top = 15
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
                OnClick = bnt_moedaClick
              end
              object Label11: TLabel
                Left = 147
                Top = 3
                Width = 81
                Height = 13
                Caption = 'Tipo de Carga'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label32: TLabel
                Left = 264
                Top = 3
                Width = 71
                Height = 13
                Caption = 'Transit Time'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label10: TLabel
                Left = 395
                Top = 3
                Width = 64
                Height = 13
                Caption = 'Frequencia'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbedt_cd_moeda: TDBEdit
                Left = 12
                Top = 15
                Width = 37
                Height = 21
                DataField = 'CD_MOEDA_TAB_FRETE'
                DataSource = datm_frete_serv.ds_frete
                TabOrder = 0
                OnChange = Status_Botoes
              end
              object dbedt_nm_moeda: TDBEdit
                Left = 48
                Top = 15
                Width = 63
                Height = 21
                Color = clMenu
                DataField = 'NM_MOEDA'
                DataSource = datm_frete_serv.ds_frete
                ReadOnly = True
                TabOrder = 1
              end
              object rxcombx_tp_carga_ag: TRxDBComboBox
                Left = 148
                Top = 16
                Width = 106
                Height = 21
                Style = csDropDownList
                DataField = 'TP_CARGA'
                DataSource = datm_frete_serv.ds_frete
                EnableValues = True
                ItemHeight = 13
                Items.Strings = (
                  'Normal'
                  'Perigosa'
                  'Perec'#237'vel'
                  'Animal Vivo'
                  'Outros'
                  'Todos')
                TabOrder = 2
                Values.Strings = (
                  '0'
                  '1'
                  '2'
                  '3'
                  '4'
                  '5')
                OnChange = Status_Botoes
              end
              object dbedt_nr_transit_ag: TDBEdit
                Left = 264
                Top = 16
                Width = 36
                Height = 21
                DataField = 'NR_TRANSIT_TIME'
                DataSource = datm_frete_serv.ds_frete
                TabOrder = 3
                OnChange = Status_Botoes
              end
              object look_tp_transit_ag: TRxDBComboBox
                Left = 299
                Top = 16
                Width = 86
                Height = 21
                Style = csDropDownList
                DataField = 'TRANSIT_TIME_TAB_FRETE'
                DataSource = datm_frete_serv.ds_frete
                EnableValues = True
                ItemHeight = 13
                Items.Strings = (
                  'Dias'
                  'Horas')
                TabOrder = 4
                Values.Strings = (
                  '0'
                  '1')
                OnChange = Status_Botoes
              end
              object dbedt_nr_freq_ag: TDBEdit
                Left = 395
                Top = 16
                Width = 37
                Height = 21
                DataField = 'NR_FRQUENCIA'
                DataSource = datm_frete_serv.ds_frete
                TabOrder = 5
                OnChange = Status_Botoes
              end
              object look_tp_freq_ag: TDBLookupComboBox
                Left = 431
                Top = 16
                Width = 94
                Height = 21
                DataField = 'Look_nm_tp_Freg'
                DataSource = datm_frete_serv.ds_frete
                TabOrder = 6
                OnClick = Status_Botoes
              end
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 84
            Width = 756
            Height = 49
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object shp_tipo_frete: TShape
              Left = 234
              Top = 16
              Width = 24
              Height = 23
              Brush.Color = 12189625
              Pen.Color = clGray
            end
            object Label15: TLabel
              Left = 9
              Top = 19
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = 'Frete N'#186' :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText1: TDBText
              Left = 69
              Top = 19
              Width = 47
              Height = 13
              DataField = 'CD_TAB_FRETE'
              DataSource = datm_frete_serv.ds_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblVia_Transp: TLabel
              Left = 122
              Top = 19
              Width = 78
              Height = 13
              Caption = 'lblVia_Transp'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbrgrpDesemb1: TDBRadioGroup
              Left = 260
              Top = 4
              Width = 317
              Height = 42
              Caption = 'Tipo da Tabela de Frete'
              Columns = 3
              DataField = 'IN_DESEMBARACO'
              DataSource = datm_frete_serv.ds_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Items.Strings = (
                '0-Agenciamento'
                '1-Desembara'#231'o'
                '2-Ambos')
              ParentFont = False
              TabOrder = 1
              Values.Strings = (
                '0'
                '1'
                '2')
              OnChange = dbrgrpDesemb1Change
            end
            object DBRadioGroup1: TDBRadioGroup
              Left = 604
              Top = 4
              Width = 109
              Height = 42
              Caption = 'Ativo'
              Columns = 2
              DataField = 'IN_ATIVO'
              DataSource = datm_frete_serv.ds_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'N'#227'o'
                'Sim')
              ParentFont = False
              TabOrder = 0
              Values.Strings = (
                '0'
                '1')
              OnChange = Status_Botoes
            end
          end
          object pcTarifas: TPageControl
            Left = 0
            Top = 183
            Width = 756
            Height = 335
            ActivePage = TabTarifaMaritima
            Align = alTop
            TabOrder = 2
            object TabTarifaAerea: TTabSheet
              Caption = 'Tarifa A'#233'rea'
              object Label20: TLabel
                Left = 0
                Top = 0
                Width = 40
                Height = 13
                Align = alTop
                Caption = 'Tarifas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label21: TLabel
                Left = 0
                Top = 122
                Width = 56
                Height = 13
                Align = alTop
                Caption = 'Despesas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbgrid_tarifa_aerea: TDBGrid
                Left = 0
                Top = 13
                Width = 748
                Height = 109
                Hint = 'Ctrl + Delete para excluir registro'
                Align = alTop
                DataSource = datm_frete_serv.ds_tarifa_aerea
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnEnter = dbgrid_despesa_aereaEnter
                OnExit = dbgrid_tarifa_aereaExit
                Columns = <
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'TTIPO_SIMBOLO_TAB_FRETE'
                    Title.Alignment = taCenter
                    Title.Caption = 'Simbolo'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 142
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PESO_TAB_FRETE'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Peso'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 156
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'VL_COMPRA_CIA_ARMADOR'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Compra'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Visible = False
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'VL_COMPRA_TAB_FRETE'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Compra Agente'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 140
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'VL_VENDA_TAB_FRETE'
                    ReadOnly = True
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Tarifa IATA'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Visible = False
                  end>
              end
              object dbgrid_despesa_aerea: TDBGrid
                Left = 0
                Top = 135
                Width = 748
                Height = 162
                Hint = '*Campos em amarelo s'#227'o edit'#225'veis'
                Align = alTop
                DataSource = datm_frete_serv.ds_despesas
                ParentShowHint = False
                PopupMenu = pmRepasse
                ShowHint = True
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnColExit = dbgrid_despesa_aereaColExit
                OnDblClick = dbgrid_despesa_aereaDblClick
                OnEnter = dbgrid_despesa_aereaEnter
                OnKeyDown = dbgrid_despesa_aereaKeyDown
                OnKeyUp = dbgrid_despesa_aereaKeyUp
                Columns = <
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'CD_ITEM'
                    Title.Caption = 'C'#243'd.'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end
                  item
                    Color = 16776176
                    Expanded = False
                    FieldName = 'calcItem'
                    Title.Caption = 'Descri'#231#227'o'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 159
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'CD_MOEDA'
                    Title.Caption = 'C'#243'd.'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 29
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
                    Title.Font.Style = [fsBold]
                    Width = 197
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'Look_nm_tp_base'
                    Title.Caption = 'Tipo Base'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 160
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'VL_INTERVALO_INICIAL'
                    Title.Caption = 'Intervalo Inicial'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Visible = False
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'VL_INTERVALO_FINAL'
                    Title.Caption = 'Intervalo Final'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Visible = False
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'VL_COMPRA_CIA'
                    Title.Caption = 'Compra'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 115
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'VL_COMPRA_AG'
                    Title.Caption = 'Compra Agente'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 126
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'Look_nm_depesa_por'
                    Title.Caption = 'Despesa Por'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 116
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'Look_nm_origem_custo'
                    Title.Caption = 'Origem'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 100
                    Visible = True
                  end>
              end
            end
            object TabTarifaMaritima: TTabSheet
              Caption = 'Tarifa Maritima'
              ImageIndex = 1
              object PageControl1: TPageControl
                Left = 0
                Top = 0
                Width = 748
                Height = 307
                ActivePage = TabLCL
                Align = alClient
                TabOrder = 0
                object TabLCL: TTabSheet
                  Caption = 'LCL'
                  object Label27: TLabel
                    Left = 0
                    Top = 0
                    Width = 740
                    Height = 13
                    Align = alTop
                    Caption = 'Tarifas LCL/ Break Bulk'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label29: TLabel
                    Left = 0
                    Top = 113
                    Width = 740
                    Height = 13
                    Align = alTop
                    Caption = 'Despesas LCL/ Break Bulk'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dbgrid_tarifas_LCL: TDBGrid
                    Left = 0
                    Top = 13
                    Width = 740
                    Height = 100
                    Hint = 'Ctrl + Delete para excluir registro'
                    Align = alTop
                    DataSource = datm_frete_serv.ds_tarifa_aerea
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = []
                    OnEnter = dbgrid_despesa_aereaEnter
                    OnExit = dbgrid_tarifas_LCLExit
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'calc_tp_simb_maritimo'
                        ReadOnly = True
                        Title.Caption = 'Tarifas'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 144
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_COMPRA_CIA_ARMADOR'
                        Title.Caption = 'Compra'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 74
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_COMPRA_TAB_FRETE'
                        Title.Caption = 'Compra Agente'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 122
                        Visible = True
                      end>
                  end
                  object dbgrid_despesa_LCL: TDBGrid
                    Left = 0
                    Top = 126
                    Width = 740
                    Height = 155
                    Hint = '*Campos em amarelo s'#227'o edit'#225'veis'
                    Align = alTop
                    DataSource = datm_frete_serv.ds_despesas
                    ParentShowHint = False
                    PopupMenu = pmRepasse
                    ShowHint = True
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = []
                    OnColExit = dbgrid_despesa_aereaColExit
                    OnDblClick = dbgrid_despesa_aereaDblClick
                    OnEnter = dbgrid_despesa_aereaEnter
                    OnKeyDown = dbgrid_despesa_aereaKeyDown
                    OnKeyUp = dbgrid_despesa_LCLKeyUp
                    Columns = <
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'CD_ITEM'
                        Title.Caption = 'C'#243'd.'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Visible = True
                      end
                      item
                        Color = 16776176
                        Expanded = False
                        FieldName = 'calcItem'
                        Title.Caption = 'Descri'#231#227'o'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 171
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'CD_MOEDA'
                        Title.Caption = 'C'#243'd.'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 33
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
                        Title.Font.Style = [fsBold]
                        Width = 163
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'Look_nm_tp_base'
                        Title.Caption = 'Tipo Base'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 138
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_INTERVALO_INICIAL'
                        Title.Caption = 'Valor Inicial'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Visible = False
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_INTERVALO_FINAL'
                        Title.Caption = 'Valor Final'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Visible = False
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_COMPRA_CIA'
                        Title.Caption = 'Compra'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 54
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_COMPRA_AG'
                        Title.Caption = 'Compra Agente'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 120
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'Look_nm_depesa_por'
                        Title.Caption = 'Despesa por'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 105
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'Look_nm_origem_custo'
                        Title.Caption = 'Origem'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 106
                        Visible = True
                      end>
                  end
                end
                object TabFCL: TTabSheet
                  Caption = 'FCL'
                  ImageIndex = 1
                  object Label28: TLabel
                    Left = 0
                    Top = 0
                    Width = 740
                    Height = 13
                    Align = alTop
                    Caption = 'Tarifas FCL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label30: TLabel
                    Left = 0
                    Top = 113
                    Width = 740
                    Height = 13
                    Align = alTop
                    Caption = 'Despesas FCL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dbgrid_tarifas_FCL: TDBGrid
                    Left = 0
                    Top = 13
                    Width = 740
                    Height = 100
                    Hint = 'Ctrl + Delete para excluir registro'
                    Align = alTop
                    DataSource = datm_frete_serv.ds_tarifas_FCL
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = []
                    OnEnter = dbgrid_despesa_aereaEnter
                    OnExit = dbgrid_tarifas_FCLExit
                    Columns = <
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VOLUME_TAB_FRETE'
                        Title.Caption = 'C'#243'd.'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 39
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'Look_nm_cntr'
                        Title.Caption = 'Contanier'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 75
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_COMPRA_CIA_ARMADOR'
                        Title.Caption = 'Compra'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 116
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_COMPRA_TAB_FRETE'
                        Title.Caption = 'Compra Agente'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 143
                        Visible = True
                      end>
                  end
                  object dbgrid_despesa_FCL: TDBGrid
                    Left = 0
                    Top = 126
                    Width = 740
                    Height = 155
                    Hint = '*Campos em amarelo s'#227'o edit'#225'veis'
                    Align = alTop
                    DataSource = datm_frete_serv.ds_desepsa_FCL
                    ParentShowHint = False
                    PopupMenu = pmRepasse
                    ShowHint = True
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = []
                    OnColExit = dbgrid_despesa_aereaColExit
                    OnDblClick = dbgrid_despesa_aereaDblClick
                    OnEnter = dbgrid_despesa_aereaEnter
                    OnKeyDown = dbgrid_despesa_aereaKeyDown
                    OnKeyUp = dbgrid_despesa_FCLKeyUp
                    Columns = <
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'CD_ITEM'
                        Title.Caption = 'C'#243'd.'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Visible = True
                      end
                      item
                        Color = 16776176
                        Expanded = False
                        FieldName = 'calcItem'
                        Title.Caption = 'Descri'#231#227'o'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 167
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'CD_MOEDA'
                        Title.Caption = 'C'#243'd.'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 69
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
                        Title.Font.Style = [fsBold]
                        Width = 180
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'lookTpCntr'
                        Title.Caption = 'Tipo Cntr.'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clWindowText
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 108
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'Look_nm_tp_base'
                        Title.Caption = 'Tipo Base'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 160
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_INTERVALO_INICIAL'
                        Title.Caption = 'Valor Inicial'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Visible = False
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_INTERVALO_FINAL'
                        Title.Caption = 'Valor Final'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Visible = False
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_COMPRA_CIA'
                        Title.Caption = 'Compra'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 81
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_COMPRA_AG'
                        Title.Caption = 'Compra Agente'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 112
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'Look_nm_despesa'
                        Title.Caption = 'Despesa por'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 107
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'Look_nm_origem'
                        Title.Caption = 'Origem'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 92
                        Visible = True
                      end>
                  end
                end
              end
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 756
            Height = 84
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 3
            object Label3: TLabel
              Left = 17
              Top = 2
              Width = 44
              Height = 13
              Caption = 'Origem:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 398
              Top = 2
              Width = 48
              Height = 13
              Caption = 'Destino:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblOrigem: TLabel
              Left = 17
              Top = 15
              Width = 351
              Height = 13
              AutoSize = False
              Caption = 'lblOrigem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblDestino: TLabel
              Left = 398
              Top = 15
              Width = 347
              Height = 13
              AutoSize = False
              Caption = 'lblDestino'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object pAgente: TPanel
              Left = 17
              Top = 32
              Width = 332
              Height = 48
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Ctl3D = True
              ParentCtl3D = False
              TabOrder = 0
              object Label6: TLabel
                Left = 8
                Top = 4
                Width = 47
                Height = 13
                Caption = 'Agencia'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object btn_co_agencia_edt: TSpeedButton
                Left = 298
                Top = 22
                Width = 23
                Height = 19
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
                OnClick = btn_co_agencia_edtClick
              end
              object dbedt_cd_agencia: TDBEdit
                Left = 8
                Top = 20
                Width = 41
                Height = 21
                DataField = 'CD_AGENTE_TAB_FRETE'
                DataSource = datm_frete_serv.ds_frete
                TabOrder = 0
                OnChange = Status_Botoes
                OnExit = dbedt_cd_agenciaExit
              end
              object dbedt_nm_agencia: TDBEdit
                Left = 54
                Top = 20
                Width = 241
                Height = 21
                Color = clMenu
                DataField = 'NM_AGENTE'
                DataSource = datm_frete_serv.ds_frete
                ReadOnly = True
                TabOrder = 1
              end
            end
            object pCia_Armador: TPanel
              Left = 398
              Top = 32
              Width = 332
              Height = 49
              BevelInner = bvRaised
              BevelOuter = bvLowered
              TabOrder = 1
              object btn_co_armador_cia_edt: TSpeedButton
                Left = 298
                Top = 22
                Width = 21
                Height = 19
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
                OnClick = btn_co_armador_cia_edtClick
              end
              object lblCia_Armador_Edt: TLabel
                Left = 8
                Top = 4
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
              object dbedt_cd_cia_armador: TDBEdit
                Left = 8
                Top = 20
                Width = 41
                Height = 21
                DataSource = datm_frete_serv.ds_frete
                TabOrder = 0
                OnChange = Status_Botoes
                OnExit = dbedt_cd_cia_armadorExit
              end
              object dbedt_nm_cia_armador: TDBEdit
                Left = 54
                Top = 20
                Width = 241
                Height = 21
                Color = clMenu
                DataSource = datm_frete_serv.ds_frete
                ReadOnly = True
                TabOrder = 1
              end
            end
          end
          object dbOBS_FRETE: TDBMemo
            Left = 0
            Top = 531
            Width = 756
            Height = 73
            Align = alTop
            DataField = 'TX_OBS_TAB_FRETE'
            DataSource = datm_frete_serv.ds_frete
            TabOrder = 4
            OnChange = Status_Botoes
          end
        end
      end
    end
    object TabIATA: TTabSheet
      Caption = 'IATA'
      ImageIndex = 1
    end
  end
  object MainMenu1: TMainMenu
    Left = 360
    object mi_incluir: TMenuItem
      Caption = 'Incluir'
      OnClick = btn_incluirClick
    end
    object mi_salvar: TMenuItem
      Caption = 'Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = 'Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_excluir: TMenuItem
      Caption = 'Excluir'
      OnClick = btn_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sair'
      OnClick = btn_sairClick
    end
  end
  object pmRepasse: TPopupMenu
    Left = 388
    Top = 65535
    object miRepasseDados: TMenuItem
      Caption = 
        'Repassar Item para todas as Origens/Destinos deste Armador/Cia A' +
        #233'rea'
    end
  end
end
