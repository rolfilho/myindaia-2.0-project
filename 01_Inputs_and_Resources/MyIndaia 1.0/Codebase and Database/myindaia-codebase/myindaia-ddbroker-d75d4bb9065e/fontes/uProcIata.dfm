object frm_proc_iata: Tfrm_proc_iata
  Left = 178
  Top = 127
  Width = 720
  Height = 510
  Caption = 'Processo Aereos Exporta'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 42
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 289
      Top = 8
      Width = 27
      Height = 25
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
      Left = 10
      Top = 8
      Width = 27
      Height = 25
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
      Left = 38
      Top = 8
      Width = 27
      Height = 25
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
    object btn_desmarca: TSpeedButton
      Left = 119
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Desmarcar todos'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
        33333333373F33333333333330B03333333333337F7F33333333333330F03333
        333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
        333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
        333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
        3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
        33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
        33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
        03333337777777F7F33333330000000003333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_desmarcaClick
    end
    object btn_marcar: TSpeedButton
      Left = 93
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Marcar todos'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_marcarClick
    end
    object btn_pesq: TSpeedButton
      Left = 158
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Pesquisar'
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
      OnClick = btn_pesqClick
    end
    object btn_imprimir: TSpeedButton
      Left = 190
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Imprimir'
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
    end
    object btn_solic_fat: TSpeedButton
      Left = 222
      Top = 8
      Width = 25
      Height = 25
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
      OnClick = btn_solic_fatClick
    end
    object SpeedButton4: TSpeedButton
      Left = 256
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Receber'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton4Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 42
    Width = 712
    Height = 50
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 1
    object Label4: TLabel
      Left = 14
      Top = 4
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
    object SpeedButton1: TSpeedButton
      Left = 319
      Top = 16
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
      OnClick = SpeedButton1Click
    end
    object Label5: TLabel
      Left = 364
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
    object SpeedButton2: TSpeedButton
      Left = 669
      Top = 18
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
      OnClick = SpeedButton2Click
    end
    object edt_nm_unid_pesq: TEdit
      Left = 42
      Top = 17
      Width = 275
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
    object edt_nm_produto: TEdit
      Left = 392
      Top = 19
      Width = 275
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object msk_unid_pesq: TMaskEdit
      Left = 12
      Top = 17
      Width = 24
      Height = 21
      EditMask = '99;0; '
      MaxLength = 2
      TabOrder = 0
      OnExit = msk_unid_pesqExit
    end
    object msk_cd_produto: TMaskEdit
      Left = 365
      Top = 19
      Width = 24
      Height = 21
      EditMask = '99;0; '
      MaxLength = 2
      TabOrder = 1
      OnExit = msk_cd_produtoExit
    end
  end
  object pgctrl_proc: TPageControl
    Left = 0
    Top = 92
    Width = 712
    Height = 372
    ActivePage = ts_iata
    Align = alClient
    TabOrder = 2
    OnChange = pgctrl_procChange
    object ts_iata: TTabSheet
      Caption = 'Aberto'
      object dbgrdProcIata: TDBGrid
        Left = 2
        Top = 46
        Width = 703
        Height = 296
        Color = clInfoBk
        DataSource = datm_proc_iata.ds_lista_cia
        FixedColor = clWindowFrame
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgrdProcIataCellClick
        OnDrawColumnCell = dbgrdProcIataDrawColumnCell
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'IN_SEL_IATA'
            Title.Caption = 'Sel'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 29
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
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_EMISSAO_DTA'
            Title.Caption = 'Issue Date'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CHARG_MASTER'
            Title.Caption = 'Charg. Weight'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 93
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TARIFA_IMPRESSA'
            Title.Caption = 'Rate'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_TAXA'
            Title.Caption = 'Conv. Rate'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FRETE_REAL'
            Title.Caption = 'Freight R$'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTHER_CH_AG'
            Title.Caption = 'Oth.Charg.Due Agent'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTHER_CH_CIA'
            Title.Caption = 'Oth.Charg.Due Carrier'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COM_IATA'
            Title.Caption = 'Iata Comm. R$'
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
            FieldName = 'TARIFA_CUSTO_CIA'
            Title.Caption = 'Promo.Rate'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_OVER'
            Title.Caption = 'Discount R$'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_vl_ir'
            Title.Caption = 'Valor IRRF'
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
            FieldName = 'calc_tt_prepaid'
            Title.Caption = 'Total Prepaid'
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
            FieldName = 'calc_tt_collect'
            Title.Caption = 'Total Collect'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 82
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 704
        Height = 45
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object btn_co_cia: TSpeedButton
          Left = 288
          Top = 17
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
          OnClick = btn_co_ciaClick
        end
        object lb_cia: TLabel
          Left = 13
          Top = 2
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
        object lb_periodo: TLabel
          Left = 392
          Top = 2
          Width = 46
          Height = 13
          Caption = 'Per'#237'odo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb_ate: TLabel
          Left = 403
          Top = 20
          Width = 20
          Height = 13
          Caption = 'At'#233
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 612
          Top = 3
          Width = 30
          Height = 13
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 513
          Top = 3
          Width = 63
          Height = 13
          Caption = 'Valor IRRF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_nm_cia: TEdit
          Left = 54
          Top = 16
          Width = 231
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 0
        end
        object msk_cd_cia: TMaskEdit
          Left = 10
          Top = 16
          Width = 41
          Height = 21
          EditMask = '9999;0; '
          MaxLength = 4
          TabOrder = 1
          OnExit = msk_cd_ciaExit
        end
        object msk_dt_inicio: TMaskEdit
          Left = 319
          Top = 16
          Width = 74
          Height = 21
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 2
          Text = '  /  /    '
        end
        object msk_dt_fim: TMaskEdit
          Left = 432
          Top = 16
          Width = 74
          Height = 21
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 3
          Text = '  /  /    '
        end
        object edt_vl_tt_sel: TEdit
          Left = 612
          Top = 16
          Width = 88
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
        object edt_vl_tt_ir: TEdit
          Left = 512
          Top = 16
          Width = 88
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_pagto_cia: TPanel
        Left = 136
        Top = 24
        Width = 434
        Height = 187
        BevelOuter = bvNone
        BorderWidth = 4
        Color = clGray
        TabOrder = 2
        Visible = False
        object Panel5: TPanel
          Left = 4
          Top = 4
          Width = 426
          Height = 179
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 4
          TabOrder = 0
          object grbx_pagto_cia: TGroupBox
            Left = 4
            Top = 4
            Width = 418
            Height = 171
            Align = alClient
            Caption = 'Escolha a Forma de Pagto'
            Color = clScrollBar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            object Label13: TLabel
              Left = 160
              Top = 24
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
            object btn_co_banco: TSpeedButton
              Left = 378
              Top = 38
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
            object Bevel1: TBevel
              Left = 14
              Top = 117
              Width = 386
              Height = 3
            end
            object Label14: TLabel
              Left = 164
              Top = 65
              Width = 67
              Height = 13
              Caption = 'Vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 258
              Top = 66
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
            object rdgp_destino: TRadioGroup
              Left = 18
              Top = 26
              Width = 128
              Height = 87
              Caption = 'Destino'
              ItemIndex = 1
              Items.Strings = (
                'Cheque'
                'Contas a Pagar'
                'Deb Conta')
              TabOrder = 0
              OnClick = rdgp_destinoClick
            end
            object msk_cd_banco: TMaskEdit
              Left = 161
              Top = 37
              Width = 30
              Height = 21
              EditMask = '999;0; '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 3
              ParentFont = False
              TabOrder = 1
              OnExit = msk_cd_bancoExit
            end
            object edt_nm_banco: TEdit
              Left = 194
              Top = 37
              Width = 181
              Height = 21
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object Button1: TButton
              Left = 127
              Top = 130
              Width = 83
              Height = 29
              Caption = 'OK'
              TabOrder = 3
              OnClick = Button1Click
            end
            object Button2: TButton
              Left = 220
              Top = 130
              Width = 83
              Height = 29
              Caption = 'Cancelar'
              TabOrder = 4
              OnClick = Button2Click
            end
            object msk_dt_vencto: TMaskEdit
              Left = 162
              Top = 79
              Width = 87
              Height = 21
              EditMask = '!99/99/9999;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 5
              Text = '  /  /    '
            end
            object msk_nr_docto: TMaskEdit
              Left = 256
              Top = 79
              Width = 148
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
          end
        end
      end
    end
    object ts_montado: TTabSheet
      Caption = 'Montados'
      ImageIndex = 1
      object pgctrl_montado: TPageControl
        Left = 0
        Top = 0
        Width = 704
        Height = 344
        ActivePage = ts_pendente
        Align = alClient
        TabOrder = 0
        object ts_pendente: TTabSheet
          Caption = 'Pendentes'
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 47
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label16: TLabel
              Left = 360
              Top = 3
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
            object SpeedButton3: TSpeedButton
              Left = 585
              Top = 17
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
            object Label17: TLabel
              Left = 615
              Top = 3
              Width = 75
              Height = 13
              Caption = 'Recebimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 9
              Top = 3
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
            object btn_co_cia2: TSpeedButton
              Left = 238
              Top = 17
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
              OnClick = btn_co_cia2Click
            end
            object Label19: TLabel
              Left = 273
              Top = 3
              Width = 59
              Height = 13
              Caption = 'Montagem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel2: TBevel
              Left = 348
              Top = 3
              Width = 5
              Height = 37
            end
            object msk_cd_banco2: TMaskEdit
              Left = 359
              Top = 17
              Width = 28
              Height = 21
              EditMask = '999;0; '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 3
              ParentFont = False
              TabOrder = 0
              OnExit = msk_cd_banco2Exit
            end
            object edt_nm_banco2: TEdit
              Left = 390
              Top = 17
              Width = 191
              Height = 21
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object msk_dt_receb1: TMaskEdit
              Left = 613
              Top = 17
              Width = 79
              Height = 21
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 2
              Text = '  /  /    '
            end
            object msk_cia2: TMaskEdit
              Left = 6
              Top = 17
              Width = 34
              Height = 21
              EditMask = '9999;0; '
              MaxLength = 4
              TabOrder = 3
              OnExit = msk_cia2Exit
            end
            object edt_nm_cia2: TEdit
              Left = 43
              Top = 17
              Width = 191
              Height = 21
              Color = clMenu
              ReadOnly = True
              TabOrder = 4
            end
            object msk_dt_montagem1: TMaskEdit
              Left = 273
              Top = 17
              Width = 71
              Height = 21
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 5
              Text = '  /  /    '
              OnExit = msk_dt_montagem1Exit
            end
          end
          object DBGrid3: TDBGrid
            Left = 0
            Top = 48
            Width = 697
            Height = 99
            DataSource = datm_proc_iata.ds_receb_pendente
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NR_REF'
                Title.Caption = 'Lote'
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
                FieldName = 'DT_MONTAGEM'
                Title.Caption = 'Montagem'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 84
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_CIA'
                Title.Caption = 'C'#243'd.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 32
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_CIA'
                Title.Caption = 'Companhia'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 222
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR'
                Title.Caption = 'Valor Devido'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 90
                Visible = True
              end>
          end
          object DBGrid4: TDBGrid
            Left = 0
            Top = 160
            Width = 694
            Height = 153
            DataSource = datm_proc_iata.ds_receb_item_pendente_
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NR_REF'
                Title.Caption = 'Lote'
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
                FieldName = 'COD_MASTER'
                Title.Caption = 'Master'
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
                FieldName = 'calc_processo'
                Title.Caption = 'Processo'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 103
                Visible = True
              end
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
                Width = 31
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_ITEM'
                Title.Caption = 'Item'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 201
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
                Width = 113
                Visible = True
              end>
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Recebidos'
          ImageIndex = 1
        end
      end
    end
    object ts_lista_maritima: TTabSheet
      Caption = 'Lista'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 704
        Height = 344
        Align = alClient
        DataSource = datm_proc_iata.ds_lista_armador
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
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ORIGEM'
            Title.Caption = 'Origem'
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
            FieldName = 'NM_DESTINO'
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
            FieldName = 'NM_AGENTE'
            Title.Caption = 'Agente'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 203
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_NOTIFICADOR'
            Title.Caption = 'Notificador'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 152
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_COMISSAO'
            Title.Caption = 'Comiss'#227'o'
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
            FieldName = 'AP_MOEDA'
            Title.Caption = 'Moeda'
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
    end
    object ts_dados_maritimo: TTabSheet
      Caption = 'Dados'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 704
        Height = 102
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 7
          Top = 5
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
        object Label2: TLabel
          Left = 151
          Top = 5
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
        object Label3: TLabel
          Left = 422
          Top = 5
          Width = 63
          Height = 13
          Caption = 'Notificador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 7
          Top = 45
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
        object Label7: TLabel
          Left = 104
          Top = 45
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
          Left = 204
          Top = 46
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
        object Label10: TLabel
          Left = 314
          Top = 45
          Width = 54
          Height = 13
          Caption = 'Comiss'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 425
          Top = 45
          Width = 74
          Height = 13
          Caption = 'Comiss'#227'o R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 7
          Top = 87
          Width = 43
          Height = 13
          Caption = 'Houses'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 7
          Top = 18
          Width = 134
          Height = 21
          Color = clMenu
          DataField = 'NR_MASTER'
          DataSource = datm_proc_iata.ds_lista_armador
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 191
          Top = 18
          Width = 225
          Height = 21
          Color = clMenu
          DataField = 'NM_AGENTE'
          DataSource = datm_proc_iata.ds_lista_armador
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 423
          Top = 18
          Width = 34
          Height = 21
          Color = clMenu
          DataField = 'CD_NOTIFICADOR'
          DataSource = datm_proc_iata.ds_lista_armador
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 151
          Top = 18
          Width = 37
          Height = 21
          Color = clMenu
          DataField = 'CD_AGENTE'
          DataSource = datm_proc_iata.ds_lista_armador
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 459
          Top = 18
          Width = 237
          Height = 21
          Color = clMenu
          DataField = 'NM_NOTIFICADOR'
          DataSource = datm_proc_iata.ds_lista_armador
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 7
          Top = 58
          Width = 30
          Height = 21
          Color = clMenu
          DataField = 'CD_ORIGEM'
          DataSource = datm_proc_iata.ds_lista_armador
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit7: TDBEdit
          Left = 39
          Top = 58
          Width = 50
          Height = 21
          Color = clMenu
          DataField = 'NM_ORIGEM'
          DataSource = datm_proc_iata.ds_lista_armador
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit8: TDBEdit
          Left = 104
          Top = 58
          Width = 30
          Height = 21
          Color = clMenu
          DataField = 'CD_DESTINO'
          DataSource = datm_proc_iata.ds_lista_armador
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit9: TDBEdit
          Left = 137
          Top = 58
          Width = 50
          Height = 21
          Color = clMenu
          DataField = 'NM_DESTINO'
          DataSource = datm_proc_iata.ds_lista_armador
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit10: TDBEdit
          Left = 204
          Top = 59
          Width = 30
          Height = 21
          Color = clMenu
          DataField = 'CD_MOEDA'
          DataSource = datm_proc_iata.ds_lista_armador
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit11: TDBEdit
          Left = 237
          Top = 59
          Width = 57
          Height = 21
          Color = clMenu
          DataField = 'AP_MOEDA'
          DataSource = datm_proc_iata.ds_lista_armador
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit12: TDBEdit
          Left = 315
          Top = 59
          Width = 100
          Height = 21
          Color = clMenu
          DataField = 'VL_COMISSAO'
          DataSource = datm_proc_iata.ds_lista_armador
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_vl_com_real: TDBEdit
          Left = 427
          Top = 58
          Width = 100
          Height = 21
          DataField = 'TARIFA_AUX'
          DataSource = datm_proc_iata.ds_lista_armador
          TabOrder = 12
          OnChange = dbedt_vl_com_realChange
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 102
        Width = 704
        Height = 242
        Align = alClient
        DataSource = datm_proc_iata.ds_house
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
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_OVER'
            Title.Caption = 'Comiss'#227'o'
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
            FieldName = 'VL_COMISS_IATA'
            Title.Caption = 'Comiss'#227'o R$'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end>
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 576
    Top = 368
    object mi_Salvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = btn_salvarClick
    end
    object mi_Cancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
    end
    object TMenuItem
    end
    object TMenuItem
    end
    object mi_marca: TMenuItem
      Caption = '&Marcar '
    end
    object mi_desmarca: TMenuItem
      Caption = '&Desmarcar'
      Visible = False
    end
    object TMenuItem
    end
    object Pesquisar1: TMenuItem
      Caption = '&Pesquisar'
      OnClick = btn_pesqClick
    end
    object Imprimir1: TMenuItem
      Caption = '&Imprimir'
      object Previex1: TMenuItem
        Caption = 'Preview'
        OnClick = Previex1Click
      end
      object Relatrio1: TMenuItem
        Caption = 'Relat'#243'rio'
        OnClick = Relatrio1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
