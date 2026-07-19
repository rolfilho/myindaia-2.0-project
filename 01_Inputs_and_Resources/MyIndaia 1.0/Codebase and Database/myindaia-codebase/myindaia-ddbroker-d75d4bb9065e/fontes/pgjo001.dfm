object frm_LI_capa: Tfrm_LI_capa
  Left = 312
  Top = 107
  Width = 637
  Height = 509
  BorderIcons = [biSystemMenu]
  Caption = 'Licença de Importação'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_manut_cadastro
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 356
    Top = 98
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
  object Label20: TLabel
    Left = 27
    Top = 188
    Width = 65
    Height = 13
    Caption = 'Importador:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 488
    Top = 184
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
  object SpeedButton5: TSpeedButton
    Left = 529
    Top = 166
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
  object Label7: TLabel
    Left = 28
    Top = 170
    Width = 64
    Height = 13
    Caption = 'Fund.Legal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label16: TLabel
    Left = 24
    Top = 98
    Width = 102
    Height = 13
    Caption = 'Peso Líquido (kg)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnl_cadastro: TPanel
    Left = 1
    Top = 1
    Width = 216
    Height = 41
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 180
      Top = 8
      Width = 25
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
      Left = 8
      Top = 8
      Width = 25
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 32
      Top = 8
      Width = 25
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancelarClick
    end
    object btn_monta_li: TSpeedButton
      Left = 147
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Monta LI'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFF00FF
        FFFFFFFFFFFF88FFFFFFFFFFFF04774FFFFFFFFFFF88778FFFFFFFFF04778874
        FFFFFFFF88778878FFFFFFF4778FFF874FFFFFF8778FFF878FFFFFF08FF8FF88
        74FFFFF88FF8FF8878FFFFF08FFF88FF874FFFF88FFF88FF878F000008F8FF78
        F874888888F8FF78F8784400077770788884448887777F78888844FFFF877088
        F77444FFFF877F88F77840FFFF703778800048FFFF7F377888880008FF338370
        000F8888FF338378888FFFF0733800000FFFFFF8733888888FFFFFFF0000FFFF
        FFFFFFFF8888FFFFFFFFFFF00FFFFFFFFFFFFFF88FFFFFFFFFFFFF00FFFFFFFF
        FFFFFF88FFFFFFFFFFFFFF0FFFFFFFFFFFFFFF8FFFFFFFFFFFFF}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_monta_liClick
    end
    object btn_itens_li: TSpeedButton
      Left = 119
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Itens LI'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FF666FFFF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FF6F666FF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FF66F6FFF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_itens_liClick
    end
    object btn_excluir: TSpeedButton
      Left = 85
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Exclui LI'
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
  end
  object pgctrl_capa_li: TPageControl
    Left = 0
    Top = 45
    Width = 629
    Height = 409
    ActivePage = TbSht_Complementares_TL05
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MultiLine = True
    ParentFont = False
    TabOrder = 1
    OnChanging = pgctrl_capa_liChanging
    object tbsht_basicas_TL01: TTabSheet
      Caption = '&Básicas'
      object lbl_importador2: TLabel
        Left = 11
        Top = 141
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
      object btn_co_importador: TSpeedButton
        Left = 480
        Top = 137
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
        OnClick = btn_co_importadorClick
      end
      object lbl_nr_registro_di2: TLabel
        Left = 12
        Top = 106
        Width = 66
        Height = 13
        Caption = 'Nº Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bl_dt_registro_di2: TLabel
        Left = 301
        Top = 106
        Width = 79
        Height = 13
        Caption = 'Data Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 318
        Top = 44
        Width = 61
        Height = 13
        Caption = 'Data da LI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_pais_proc: TSpeedButton
        Left = 480
        Top = 173
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
        OnClick = btn_co_pais_procClick
      end
      object lbl_urf_despacho1: TLabel
        Left = 11
        Top = 208
        Width = 58
        Height = 26
        Caption = 'URF de Despacho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_urf_despacho: TSpeedButton
        Left = 480
        Top = 214
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
        OnClick = btn_co_urf_despachoClick
      end
      object Label23: TLabel
        Left = 12
        Top = 245
        Width = 48
        Height = 26
        Caption = 'URF de Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_urf_entrada: TSpeedButton
        Left = 480
        Top = 251
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
        OnClick = btn_co_urf_entradaClick
      end
      object Label1: TLabel
        Left = 14
        Top = 289
        Width = 50
        Height = 13
        Caption = 'Incoterm'
      end
      object btn_co_incoterm: TSpeedButton
        Left = 372
        Top = 285
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
        OnClick = btn_co_incotermClick
      end
      object lbl_cd_moeda_cond_venda: TLabel
        Left = 15
        Top = 323
        Width = 39
        Height = 13
        Caption = 'Moeda'
      end
      object btn_co_moeda: TSpeedButton
        Left = 372
        Top = 319
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
        OnClick = btn_co_moedaClick
      end
      object Label3: TLabel
        Left = 12
        Top = 17
        Width = 68
        Height = 13
        Caption = 'Ref. Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 11
        Top = 170
        Width = 72
        Height = 26
        Caption = 'País de Procedência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object dbedt_cd_importador: TDBEdit
        Left = 95
        Top = 137
        Width = 45
        Height = 21
        DataField = 'CD_IMPORTADOR'
        DataSource = datm_LI_Capa.ds_li
        MaxLength = 5
        TabOrder = 4
        OnExit = dbedt_cd_importadorExit
        OnKeyDown = dbedt_cd_importadorKeyDown
      end
      object dbedt_nr_registro_li: TDBEdit
        Left = 95
        Top = 102
        Width = 109
        Height = 21
        DataField = 'NR_REGISTRO_LI'
        DataSource = datm_LI_Capa.ds_li
        TabOrder = 2
      end
      object dbedt_dt_registro_li: TDBEdit
        Left = 396
        Top = 102
        Width = 109
        Height = 21
        DataField = 'DT_REGISTRO_LI'
        DataSource = datm_LI_Capa.ds_li
        TabOrder = 3
      end
      object dbedt_cd_urf_despacho: TDBEdit
        Left = 95
        Top = 214
        Width = 61
        Height = 21
        DataField = 'CD_URF_DESPACHO'
        DataSource = datm_LI_Capa.ds_li
        MaxLength = 7
        TabOrder = 6
        OnExit = dbedt_cd_urf_despachoExit
        OnKeyDown = dbedt_cd_importadorKeyDown
      end
      object dbedt_cd_urf_entrada: TDBEdit
        Left = 95
        Top = 251
        Width = 61
        Height = 21
        DataField = 'CD_URF_ENTRADA'
        DataSource = datm_LI_Capa.ds_li
        MaxLength = 7
        TabOrder = 7
        OnExit = dbedt_cd_urf_entradaExit
        OnKeyDown = dbedt_cd_importadorKeyDown
      end
      object dbedt_dt_li: TDBEdit
        Left = 396
        Top = 40
        Width = 109
        Height = 21
        DataField = 'DT_PROCESSO_LI'
        DataSource = datm_LI_Capa.ds_li
        TabOrder = 1
      end
      object dbedt_cd_pais_proc: TDBEdit
        Left = 95
        Top = 173
        Width = 45
        Height = 21
        DataField = 'CD_PAIS_PROCEDENCIA'
        DataSource = datm_LI_Capa.ds_li
        MaxLength = 3
        TabOrder = 5
        OnExit = dbedt_cd_pais_procExit
        OnKeyDown = dbedt_cd_importadorKeyDown
      end
      object dbedt_cd_incoterm: TDBEdit
        Left = 95
        Top = 285
        Width = 37
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CD_INCOTERM'
        DataSource = datm_LI_Capa.ds_li
        MaxLength = 3
        TabOrder = 8
        OnExit = dbedt_cd_incotermExit
        OnKeyDown = dbedt_cd_importadorKeyDown
      end
      object dbedt_cd_moeda: TDBEdit
        Left = 95
        Top = 319
        Width = 37
        Height = 21
        Ctl3D = True
        DataField = 'CD_MOEDA_FOB'
        DataSource = datm_LI_Capa.ds_li
        MaxLength = 3
        ParentCtl3D = False
        TabOrder = 9
        OnExit = dbedt_cd_moedaExit
        OnKeyDown = dbedt_cd_importadorKeyDown
      end
      object dbgrd_ref: TDBGrid
        Left = 96
        Top = 16
        Width = 177
        Height = 65
        DataSource = datm_LI_Capa.ds_ref_cli_
        Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            FieldName = 'CD_REFERENCIA'
          end>
      end
      object dbedt_nm_importador: TDBEdit
        Left = 147
        Top = 137
        Width = 326
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookImportador'
        DataSource = datm_LI_Capa.ds_li
        ReadOnly = True
        TabOrder = 10
      end
      object dbedt_nm_pais_proc: TDBEdit
        Left = 147
        Top = 173
        Width = 326
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookPaisProc'
        DataSource = datm_LI_Capa.ds_li
        ReadOnly = True
        TabOrder = 11
      end
      object dbedt_nm_urf_entrada: TDBEdit
        Left = 161
        Top = 251
        Width = 311
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookURFEntrada'
        DataSource = datm_LI_Capa.ds_li
        ReadOnly = True
        TabOrder = 12
      end
      object dbedt_nm_urf_despacho: TDBEdit
        Left = 161
        Top = 214
        Width = 311
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookURFDespacho'
        DataSource = datm_LI_Capa.ds_li
        ReadOnly = True
        TabOrder = 13
      end
      object dbedt_nm_incoterm: TDBEdit
        Left = 137
        Top = 285
        Width = 229
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookIncoterm'
        DataSource = datm_LI_Capa.ds_li
        ReadOnly = True
        TabOrder = 14
      end
      object dbedt_nm_moeda: TDBEdit
        Left = 139
        Top = 319
        Width = 229
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookMoeda'
        DataSource = datm_LI_Capa.ds_li
        ReadOnly = True
        TabOrder = 15
      end
    end
    object tbsht_Negociacao_TL02: TTabSheet
      Caption = '&Negociação'
      object lbl_doc_chegada_carga2: TLabel
        Left = 432
        Top = 54
        Width = 144
        Height = 13
        Caption = 'lbl_doc_chegada_carga2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object gbox_reg_trib: TGroupBox
        Left = 8
        Top = 8
        Width = 601
        Height = 113
        Caption = 'Regime de Tributação'
        TabOrder = 0
        object lbl_fund: TLabel
          Left = 16
          Top = 58
          Width = 64
          Height = 13
          Caption = 'Fund.Legal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_Fund_legal: TSpeedButton
          Left = 517
          Top = 54
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
          OnClick = btn_co_Fund_legalClick
        end
        object Label2: TLabel
          Left = 40
          Top = 30
          Width = 40
          Height = 13
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_Reg_Trib: TSpeedButton
          Left = 517
          Top = 26
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
          OnClick = btn_co_Reg_TribClick
        end
        object lbl_agencia: TLabel
          Left = 16
          Top = 78
          Width = 51
          Height = 26
          Caption = 'Agência SECEX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object btn_agencia_secex: TSpeedButton
          Left = 277
          Top = 82
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
          OnClick = btn_agencia_secexClick
        end
        object lbl_numero: TLabel
          Left = 332
          Top = 80
          Width = 89
          Height = 26
          Caption = 'Número do Ato Drawback'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object dbedt_cd_fund_legal_li: TDBEdit
          Left = 84
          Top = 54
          Width = 25
          Height = 21
          DataField = 'CD_FUND_LEGAL'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 2
          TabOrder = 1
          OnExit = dbedt_cd_fund_legal_liExit
        end
        object dbedt_cd_reg_trib_li: TDBEdit
          Left = 84
          Top = 26
          Width = 21
          Height = 21
          DataField = 'CD_REGIME_TRIBUTACAO'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 1
          TabOrder = 0
          OnExit = dbedt_cd_reg_trib_liExit
        end
        object dbedt_cd_agencia_secex_li: TDBEdit
          Left = 84
          Top = 82
          Width = 25
          Height = 21
          DataField = 'CD_AGENCIA_SECEX'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 2
          TabOrder = 2
          OnExit = dbedt_cd_agencia_secex_liExit
        end
        object dbedt_cd_numero_ato_li: TDBEdit
          Left = 424
          Top = 86
          Width = 119
          Height = 21
          DataField = 'NR_ATO_DRAWBACK'
          DataSource = datm_LI_Capa.ds_li
          TabOrder = 3
        end
        object edt_regime_tributacao: TEdit
          Left = 111
          Top = 27
          Width = 401
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 4
        end
        object edt_fundamento_legal: TEdit
          Left = 111
          Top = 54
          Width = 401
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 5
        end
        object edt_agencia_secex: TEdit
          Left = 112
          Top = 82
          Width = 162
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 6
        end
      end
      object gbox_acordo_tar: TGroupBox
        Left = 8
        Top = 125
        Width = 601
        Height = 53
        Caption = 'Acordo Tarifário'
        TabOrder = 1
        object lbl_tipo: TLabel
          Left = 40
          Top = 22
          Width = 26
          Height = 13
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_acordo: TLabel
          Left = 200
          Top = 15
          Width = 45
          Height = 26
          Caption = 'Acordo ALADI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object btn_acordo: TSpeedButton
          Left = 516
          Top = 18
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
          OnClick = btn_acordoClick
        end
        object dbedt_cd_acordo_aladi_li: TDBEdit
          Left = 244
          Top = 18
          Width = 41
          Height = 21
          DataField = 'CD_ACORDO_ALADI'
          DataSource = datm_LI_Capa.ds_li
          TabOrder = 1
          OnExit = dbedt_cd_acordo_aladi_liExit
        end
        object dblkcbox_acordo_tarif: TDBLookupComboBox
          Left = 84
          Top = 20
          Width = 97
          Height = 21
          DataField = 'TP_ACORDO_ALADI'
          DataSource = datm_LI_Capa.ds_li
          KeyField = 'CD_TIPO_ACORDO_TAR'
          ListField = 'DESCRICAO'
          ListSource = datm_LI_Capa.ds_ttp_acordo_tarif
          TabOrder = 0
          OnEnter = dblkcbox_acordo_tarifEnter
          OnExit = dblkcbox_acordo_tarifExit
        end
        object edt_acordo_aladi: TEdit
          Left = 288
          Top = 18
          Width = 223
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 2
        end
      end
      object gbox_cobertura_cambial: TGroupBox
        Left = 9
        Top = 186
        Width = 600
        Height = 151
        Caption = ' Cobertura Cambial'
        TabOrder = 2
        object btn_co_motivo: TSpeedButton
          Left = 485
          Top = 110
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
          OnClick = btn_co_motivoClick
        end
        object lbl_motivo: TLabel
          Left = 8
          Top = 115
          Width = 117
          Height = 19
          AutoSize = False
          Caption = 'Motivo s/ Cobertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object lbl_modalidade: TLabel
          Left = 8
          Top = 55
          Width = 114
          Height = 13
          Caption = 'Modalidade de Pag.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_modalidade: TSpeedButton
          Left = 485
          Top = 52
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
          OnClick = btn_co_mod_pagto1Click
        end
        object lbl_qtde: TLabel
          Left = 8
          Top = 84
          Width = 102
          Height = 13
          Caption = 'Qtde dias p/ Pag.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_instituicao: TSpeedButton
          Left = 485
          Top = 80
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
          OnClick = btn_co_inst_financClick
        end
        object lbl_instituicao: TLabel
          Left = 172
          Top = 77
          Width = 64
          Height = 26
          Caption = 'Instituição Financeira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object dbedt_cd_mot_sem_cobert_li: TDBEdit
          Left = 128
          Top = 110
          Width = 25
          Height = 21
          DataField = 'CD_MOT_SEM_COBERTURA'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 2
          TabOrder = 3
          OnExit = dbedt_cd_mot_sem_cobert_liExit
        end
        object dbedt_cd_modalidade_pag_li: TDBEdit
          Left = 128
          Top = 52
          Width = 25
          Height = 21
          DataField = 'CD_MOD_PAGAMENTO'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 2
          TabOrder = 0
          OnExit = dbedt_cd_modalidade_pag_liExit
        end
        object dbedt_qtde_dias_pag_li: TDBEdit
          Left = 128
          Top = 80
          Width = 33
          Height = 21
          DataField = 'QT_DIAS_COBERTURA'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 3
          TabOrder = 1
        end
        object dbedt_cd_instituicao_financ_li: TDBEdit
          Left = 241
          Top = 80
          Width = 25
          Height = 21
          DataField = 'CD_INSTITUICAO_FINANC'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 2
          TabOrder = 2
          OnExit = dbedt_cd_inst_financExit
        end
        object edt_modalidade_pagamento: TEdit
          Left = 156
          Top = 52
          Width = 324
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 4
        end
        object edt_instituicao_financeira: TEdit
          Left = 268
          Top = 80
          Width = 212
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 5
        end
        object edt_motivo_sem_cobertura: TEdit
          Left = 156
          Top = 110
          Width = 325
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 6
        end
        object dbrg_cobertura_cambial: TDBRadioGroup
          Left = 8
          Top = 14
          Width = 577
          Height = 33
          Color = clBtnFace
          Columns = 4
          Ctl3D = True
          DataField = 'TP_CAMBIO'
          DataSource = datm_LI_Capa.ds_li
          DragCursor = crDefault
          Items.Strings = (
            'Até 180 dias'
            'De 180 a 360 dias'
            'Acima de 360 dias'
            'Sem Cobertura')
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 7
          OnClick = dbrg_cobertura_cambialClick
        end
      end
    end
    object tbsht_totais_TL03: TTabSheet
      Caption = '&Totais'
      object Label14: TLabel
        Left = 18
        Top = 45
        Width = 102
        Height = 13
        Caption = 'Peso Líquido (kg)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 16
        Top = 7
        Width = 84
        Height = 13
        Caption = 'Quantidade na'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 16
        Top = 23
        Width = 107
        Height = 13
        Caption = 'Medida Estatística'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 321
        Width = 92
        Height = 26
        Caption = 'Nº Comunicado de Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object grpbox_1: TGroupBox
        Left = 8
        Top = 67
        Width = 597
        Height = 102
        Caption = 'Valor Total das Mercadorias no Local de Embarque'
        TabOrder = 2
        object lbl_moeda_mle1: TLabel
          Left = 8
          Top = 30
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
        object btn_co_moeda_mle_li: TSpeedButton
          Left = 88
          Top = 26
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
        object lbl_vl_moeda_mle1: TLabel
          Left = 133
          Top = 30
          Width = 94
          Height = 13
          Caption = 'VMLE na Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_moeda_despesa: TLabel
          Left = 117
          Top = 53
          Width = 110
          Height = 13
          Caption = 'Despesa na Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 111
          Top = 75
          Width = 115
          Height = 13
          Caption = 'Desconto na Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_moeda_mle_li: TDBEdit
          Left = 56
          Top = 26
          Width = 29
          Height = 21
          DataField = 'CD_MOEDA_MLE'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 3
          TabOrder = 0
        end
        object dbedt_vl_moeda_mle_li: TDBEdit
          Left = 231
          Top = 26
          Width = 122
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_TOTAL_MOEDA'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 20
          ReadOnly = True
          TabOrder = 1
          OnExit = dbedt_pc_seguroExit
        end
        object dbedt_vl_moeda_despesa_li: TDBEdit
          Left = 231
          Top = 49
          Width = 121
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_DESPESA_MOEDA'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 20
          ReadOnly = True
          TabOrder = 2
          OnExit = dbedt_pc_seguroExit
        end
        object dbedt_vl_moeda_desconto_li: TDBEdit
          Left = 231
          Top = 74
          Width = 121
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_DESCONTO_MOEDA'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 20
          ReadOnly = True
          TabOrder = 3
          OnExit = dbedt_pc_seguroExit
        end
      end
      object grpbox_2: TGroupBox
        Left = 8
        Top = 168
        Width = 597
        Height = 65
        Caption = 'Frete / Seguro'
        TabOrder = 3
        object lbl_moeda_frete1: TLabel
          Left = 8
          Top = 18
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
        object btn_co_moeda_frete1: TSpeedButton
          Left = 88
          Top = 14
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
        object lbl_vl_frete_li: TLabel
          Left = 135
          Top = 18
          Width = 90
          Height = 13
          Caption = 'Valor na Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_moeda_seguro1: TLabel
          Left = 8
          Top = 41
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
        object btn_co_moeda_seguro1: TSpeedButton
          Left = 88
          Top = 37
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
        object lbl_vl_moeda_seguro1: TLabel
          Left = 136
          Top = 41
          Width = 90
          Height = 13
          Caption = 'Valor na Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_moeda_frete_li: TDBEdit
          Left = 56
          Top = 14
          Width = 29
          Height = 21
          DataField = 'CD_MOEDA_FRETE'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 3
          TabOrder = 0
        end
        object dbedt_vl_moeda_frete_li: TDBEdit
          Left = 232
          Top = 14
          Width = 121
          Height = 21
          DataField = 'VL_FRETE_MOEDA'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 20
          TabOrder = 1
          OnExit = dbedt_pc_seguroExit
        end
        object dbedt_cd_moeda_seguro_li: TDBEdit
          Left = 56
          Top = 37
          Width = 29
          Height = 21
          DataField = 'CD_MOEDA_SEGURO'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 3
          TabOrder = 2
        end
        object dbedt_vl_moeda_seguro_li: TDBEdit
          Left = 232
          Top = 37
          Width = 121
          Height = 21
          DataField = 'VL_SEGURO_MOEDA'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 20
          TabOrder = 3
        end
      end
      object dbedt_qtde_peso_liquido_li: TDBEdit
        Left = 136
        Top = 40
        Width = 121
        Height = 21
        DataField = 'QT_TOTAL_PES_LIQ'
        DataSource = datm_LI_Capa.ds_li
        MaxLength = 20
        TabOrder = 1
      end
      object dbedt_qtde_medida_estatistica_li: TDBEdit
        Left = 136
        Top = 11
        Width = 121
        Height = 21
        DataField = 'QT_MED_ESTATISTICA'
        DataSource = datm_LI_Capa.ds_li
        MaxLength = 20
        TabOrder = 0
      end
      object rdgrp_condicao: TRadioGroup
        Left = 8
        Top = 241
        Width = 217
        Height = 65
        Caption = 'Condição da Mercadoria'
        Ctl3D = True
        Items.Strings = (
          'Bem Fabricado sob Encomenda'
          'Material Usado')
        ParentCtl3D = False
        TabOrder = 4
        TabStop = True
        OnClick = rdgrp_condicaoClick
      end
      object dbedt_vl_numero_comunicado_li: TDBEdit
        Left = 113
        Top = 325
        Width = 111
        Height = 21
        DataField = 'NR_COMUNICADO_COMPRA'
        DataSource = datm_LI_Capa.ds_li
        TabOrder = 5
      end
      object dbg_docto_vinc: TDBGrid
        Left = 248
        Top = 260
        Width = 356
        Height = 94
        DataSource = datm_LI_Capa.ds_anuentes
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            FieldName = 'LOOK_ORGAO'
            Title.Caption = 'Orgão'
            Width = 162
          end
          item
            FieldName = 'PROCESSO'
            Title.Caption = 'Processo'
          end>
      end
      object stxt_docto_vinculado: TStaticText
        Left = 249
        Top = 240
        Width = 355
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Processos Anuentes'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 7
      end
    end
    object TbSht_Complementares_TL05: TTabSheet
      Caption = '&Complementares'
      object Label87: TLabel
        Left = 28
        Top = 32
        Width = 166
        Height = 13
        Caption = 'Informações Complementares'
      end
      object btn_co_obs: TSpeedButton
        Left = 204
        Top = 28
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
        OnClick = btn_co_obsClick
      end
      object dbmemo_info_complementares_li: TDBMemo
        Left = 24
        Top = 56
        Width = 580
        Height = 277
        DataField = 'TX_INFO_COMPLEMENTAR'
        DataSource = datm_LI_Capa.ds_li
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object menu_manut_cadastro: TMainMenu
    Left = 552
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
