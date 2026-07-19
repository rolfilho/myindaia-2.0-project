object frm_da: Tfrm_da
  Left = 129
  Top = 116
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Entreposto - Pro-Forma DA'
  ClientHeight = 504
  ClientWidth = 742
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_da: TPageControl
    Left = 0
    Top = 92
    Width = 742
    Height = 412
    ActivePage = ts_da
    Align = alClient
    Enabled = False
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_daChange
    OnChanging = pgctrl_daChanging
    object ts_da: TTabSheet
      Caption = '      Capa      '
      object pnl_da: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 384
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object Label18: TLabel
          Left = 262
          Top = 12
          Width = 64
          Height = 13
          Caption = 'Mercadoria'
          FocusControl = dbmem_merc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_emb: TSpeedButton
          Left = 224
          Top = 184
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
          OnClick = btn_co_embClick
        end
        object Label28: TLabel
          Left = 13
          Top = 171
          Width = 71
          Height = 13
          Caption = 'Embarca'#231#227'o'
          FocusControl = dbedt_cd_emb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_viagem_im: TLabel
          Left = 13
          Top = 211
          Width = 42
          Height = 13
          Caption = 'Viagem'
          FocusControl = dbedt_nr_viagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_viagem: TSpeedButton
          Left = 64
          Top = 224
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
          OnClick = btn_co_viagemClick
        end
        object Label26: TLabel
          Left = 13
          Top = 12
          Width = 113
          Height = 13
          Caption = 'Armaz'#233'm Atraca'#231#227'o'
          FocusControl = dbedt_cd_arm_atr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_arm_atr: TSpeedButton
          Left = 224
          Top = 26
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
          OnClick = btn_co_arm_atrClick
        end
        object Label27: TLabel
          Left = 13
          Top = 52
          Width = 109
          Height = 13
          Caption = 'Armaz'#233'm Descarga'
          FocusControl = dbedt_cd_arm_des
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_arm_des: TSpeedButton
          Left = 224
          Top = 65
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
          OnClick = btn_co_arm_desClick
        end
        object Label33: TLabel
          Left = 543
          Top = 251
          Width = 99
          Height = 13
          Caption = 'N'#186' Conhecimento'
          FocusControl = dbedt_nr_conhecimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 543
          Top = 291
          Width = 108
          Height = 13
          Caption = 'N'#186' Conhec. Master'
          FocusControl = dbedt_nr_conhecimento_master
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label183: TLabel
          Left = 543
          Top = 211
          Width = 112
          Height = 13
          Caption = 'Data Conhecimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_local_emb: TSpeedButton
          Left = 224
          Top = 104
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
          OnClick = btn_co_local_embClick
        end
        object btn_co_local_desemb: TSpeedButton
          Left = 224
          Top = 144
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
          OnClick = btn_co_local_desembClick
        end
        object Label29: TLabel
          Left = 13
          Top = 91
          Width = 92
          Height = 13
          Caption = 'Local Embarque'
          FocusControl = dbedt_cd_local_emb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 13
          Top = 131
          Width = 113
          Height = 13
          Caption = 'Local Desembarque'
          FocusControl = dbedt_cd_local_desemb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 13
          Top = 251
          Width = 41
          Height = 13
          Caption = 'Agente'
          FocusControl = dbedt_cd_agente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_agente: TSpeedButton
          Left = 224
          Top = 265
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
          OnClick = btn_co_agenteClick
        end
        object lbl_transp_mar: TLabel
          Left = 13
          Top = 291
          Width = 133
          Height = 13
          Caption = 'Transportador Mar'#237'timo'
          FocusControl = dbedt_cd_transportador
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_transportador: TSpeedButton
          Left = 224
          Top = 305
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
          OnClick = btn_co_transportadorClick
        end
        object lbl_cd_incoterm: TLabel
          Left = 112
          Top = 211
          Width = 66
          Height = 13
          Caption = 'INCOTERM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_incoterm: TSpeedButton
          Left = 153
          Top = 225
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
          OnClick = btn_co_incotermClick
        end
        object Label36: TLabel
          Left = 262
          Top = 171
          Width = 72
          Height = 13
          Caption = 'Moeda Frete'
          FocusControl = dbedt_cd_moeda_frete
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_frete: TSpeedButton
          Left = 371
          Top = 185
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
          OnClick = btn_co_moeda_freteClick
        end
        object Label1: TLabel
          Left = 262
          Top = 131
          Width = 68
          Height = 13
          Caption = 'Moeda MLE'
          FocusControl = dbedt_cd_moeda_mle
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_mle: TSpeedButton
          Left = 371
          Top = 145
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
          OnClick = btn_co_moeda_mleClick
        end
        object Label2: TLabel
          Left = 262
          Top = 251
          Width = 83
          Height = 13
          Caption = 'Moeda Seguro'
          FocusControl = dbedt_cd_moeda_seguro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_seguro: TSpeedButton
          Left = 371
          Top = 265
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
          OnClick = btn_co_moeda_seguroClick
        end
        object Label30: TLabel
          Left = 543
          Top = 131
          Width = 86
          Height = 13
          Caption = 'MLE na Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label53: TLabel
          Left = 262
          Top = 211
          Width = 77
          Height = 13
          Caption = 'Tipo do Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label8: TLabel
          Left = 414
          Top = 171
          Width = 63
          Height = 13
          Caption = 'Valor Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 122
          Top = 334
          Width = 49
          Height = 13
          Caption = 'Data DA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 13
          Top = 334
          Width = 36
          Height = 13
          Caption = 'N'#186' DA'
          FocusControl = dbedt_nr_da
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 414
          Top = 251
          Width = 74
          Height = 13
          Caption = 'Valor Seguro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label70: TLabel
          Left = 262
          Top = 291
          Width = 97
          Height = 13
          Caption = 'Base de C'#225'lculo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 342
          Top = 351
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 637
          Top = 131
          Width = 87
          Height = 13
          Caption = 'MLD na Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 543
          Top = 334
          Width = 74
          Height = 13
          Caption = 'Data C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Left = 543
          Top = 171
          Width = 54
          Height = 13
          Caption = 'MLE US$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label45: TLabel
          Left = 637
          Top = 171
          Width = 55
          Height = 13
          Caption = 'MLD US$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbrdg_tipo_seguro: TDBRadioGroup
          Left = 263
          Top = 302
          Width = 216
          Height = 33
          Columns = 2
          DataField = 'CD_TIPO_BASE_SEGURO'
          DataSource = datm_da.ds_da
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'VMLE'
            'VMLE + Frete')
          ParentFont = False
          TabOrder = 18
          TabStop = True
          Values.Strings = (
            '1'
            '2')
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbrdg_tipo_seguroExit
        end
        object dbedt_dt_conhecimento: TDBDateEdit
          Left = 543
          Top = 225
          Width = 91
          Height = 21
          DataField = 'DT_CONHECIMENTO'
          DataSource = datm_da.ds_da
          NumGlyphs = 2
          TabOrder = 21
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbmem_merc: TDBMemo
          Left = 262
          Top = 25
          Width = 451
          Height = 93
          DataField = 'TX_MERCADORIA'
          DataSource = datm_da.ds_da
          ScrollBars = ssVertical
          TabOrder = 9
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_nm_emb: TDBEdit
          Left = 62
          Top = 185
          Width = 161
          Height = 21
          TabStop = False
          DataField = 'LookEmbarcacao'
          DataSource = datm_da.ds_da
          ParentColor = True
          ReadOnly = True
          TabOrder = 26
        end
        object dbedt_cd_emb: TDBEdit
          Left = 13
          Top = 185
          Width = 49
          Height = 21
          DataField = 'CD_EMBARCACAO'
          DataSource = datm_da.ds_da
          MaxLength = 4
          TabOrder = 4
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_arm_atrExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nr_viagem: TDBEdit
          Left = 13
          Top = 224
          Width = 50
          Height = 21
          DataField = 'NR_VIAGEM'
          DataSource = datm_da.ds_da
          TabOrder = 5
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_arm_atrExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_cd_arm_atr: TDBEdit
          Left = 13
          Top = 26
          Width = 49
          Height = 21
          DataField = 'CD_ARMAZEM_ATRACACAO'
          DataSource = datm_da.ds_da
          MaxLength = 4
          TabOrder = 0
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_arm_atrExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_arm_atr: TDBEdit
          Left = 62
          Top = 26
          Width = 161
          Height = 21
          TabStop = False
          DataField = 'LookArmazemAtracacao'
          DataSource = datm_da.ds_da
          ParentColor = True
          ReadOnly = True
          TabOrder = 27
        end
        object dbedt_cd_arm_des: TDBEdit
          Left = 13
          Top = 66
          Width = 49
          Height = 21
          DataField = 'CD_ARMAZEM_DESCARGA'
          DataSource = datm_da.ds_da
          MaxLength = 4
          TabOrder = 1
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_arm_atrExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_arm_des: TDBEdit
          Left = 62
          Top = 66
          Width = 161
          Height = 21
          TabStop = False
          DataField = 'LookArmazemDescarga'
          DataSource = datm_da.ds_da
          ParentColor = True
          ReadOnly = True
          TabOrder = 28
        end
        object dbedt_nr_conhecimento: TDBEdit
          Left = 543
          Top = 265
          Width = 130
          Height = 21
          DataField = 'NR_CONHECIMENTO'
          DataSource = datm_da.ds_da
          MaxLength = 18
          TabOrder = 22
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_nr_conhecimento_master: TDBEdit
          Left = 543
          Top = 305
          Width = 130
          Height = 21
          DataField = 'NR_CONHECIMENTO_MASTER'
          DataSource = datm_da.ds_da
          MaxLength = 18
          TabOrder = 23
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_nm_local_desemb: TDBEdit
          Left = 62
          Top = 145
          Width = 161
          Height = 21
          TabStop = False
          DataField = 'LookLocalDesembarque'
          DataSource = datm_da.ds_da
          ParentColor = True
          ReadOnly = True
          TabOrder = 29
        end
        object dbedt_nm_local_emb: TDBEdit
          Left = 62
          Top = 105
          Width = 161
          Height = 21
          TabStop = False
          DataField = 'LookLocalEmbarque'
          DataSource = datm_da.ds_da
          ParentColor = True
          ReadOnly = True
          TabOrder = 30
        end
        object dbedt_cd_local_emb: TDBEdit
          Left = 13
          Top = 105
          Width = 49
          Height = 21
          DataField = 'CD_LOCAL_EMBARQUE'
          DataSource = datm_da.ds_da
          MaxLength = 4
          TabOrder = 2
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_arm_atrExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_cd_local_desemb: TDBEdit
          Left = 13
          Top = 145
          Width = 49
          Height = 21
          DataField = 'CD_LOCAL_DESEMBARQUE'
          DataSource = datm_da.ds_da
          MaxLength = 4
          TabOrder = 3
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_arm_atrExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_cd_agente: TDBEdit
          Left = 13
          Top = 265
          Width = 53
          Height = 21
          DataField = 'CD_AGENTE'
          DataSource = datm_da.ds_da
          MaxLength = 4
          TabOrder = 7
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_arm_atrExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_agente: TDBEdit
          Left = 66
          Top = 265
          Width = 157
          Height = 21
          TabStop = False
          DataField = 'LookAgente'
          DataSource = datm_da.ds_da
          ParentColor = True
          ReadOnly = True
          TabOrder = 31
        end
        object dbedt_cd_transportador: TDBEdit
          Left = 13
          Top = 305
          Width = 53
          Height = 21
          DataField = 'CD_TRANSPORTADOR'
          DataSource = datm_da.ds_da
          MaxLength = 4
          TabOrder = 8
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_arm_atrExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_transportador: TDBEdit
          Left = 66
          Top = 305
          Width = 157
          Height = 21
          TabStop = False
          DataField = 'LookTransportador'
          DataSource = datm_da.ds_da
          ParentColor = True
          ReadOnly = True
          TabOrder = 32
        end
        object dbedt_cd_incoterm: TDBEdit
          Left = 112
          Top = 224
          Width = 40
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_INCOTERM'
          DataSource = datm_da.ds_da
          MaxLength = 3
          TabOrder = 6
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_arm_atrExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_cd_moeda_frete: TDBEdit
          Left = 262
          Top = 185
          Width = 30
          Height = 21
          DataField = 'CD_MOEDA_FRETE'
          DataSource = datm_da.ds_da
          MaxLength = 3
          TabOrder = 12
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_moeda_freteExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_moeda_frete: TDBEdit
          Left = 292
          Top = 185
          Width = 78
          Height = 21
          TabStop = False
          DataField = 'LookMoedaFrete'
          DataSource = datm_da.ds_da
          ParentColor = True
          ReadOnly = True
          TabOrder = 33
        end
        object dbedt_cd_moeda_mle: TDBEdit
          Left = 262
          Top = 145
          Width = 30
          Height = 21
          DataField = 'CD_MOEDA_MLE'
          DataSource = datm_da.ds_da
          MaxLength = 3
          TabOrder = 10
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_moeda_mleExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_moeda_mle: TDBEdit
          Left = 292
          Top = 145
          Width = 78
          Height = 21
          TabStop = False
          DataField = 'LookMoedaMLE'
          DataSource = datm_da.ds_da
          ParentColor = True
          ReadOnly = True
          TabOrder = 34
        end
        object dbedt_cd_moeda_seguro: TDBEdit
          Left = 262
          Top = 265
          Width = 30
          Height = 21
          DataField = 'CD_MOEDA_SEGURO'
          DataSource = datm_da.ds_da
          MaxLength = 3
          TabOrder = 16
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_moeda_seguroExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_moeda_seguro: TDBEdit
          Left = 292
          Top = 265
          Width = 78
          Height = 21
          TabStop = False
          DataField = 'LookMoedaSeguro'
          DataSource = datm_da.ds_da
          ParentColor = True
          ReadOnly = True
          TabOrder = 35
        end
        object dbedt_vl_mle_mneg: TDBEdit
          Left = 543
          Top = 145
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLE_MNEG'
          DataSource = datm_da.ds_da
          ReadOnly = True
          TabOrder = 11
          OnChange = dbedt_cd_arm_atrChange
        end
        object dblckpbox_tp_frete: TDBLookupComboBox
          Left = 262
          Top = 225
          Width = 91
          Height = 21
          DataField = 'LookTpFrete'
          DataSource = datm_da.ds_da
          TabOrder = 14
          OnClick = dbedt_cd_arm_atrChange
        end
        object dbedt_vl_frete_mneg: TDBEdit
          Left = 414
          Top = 185
          Width = 77
          Height = 21
          DataField = 'VL_FRETE_MNEG'
          DataSource = datm_da.ds_da
          TabOrder = 13
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_dt_da: TDBDateEdit
          Left = 122
          Top = 347
          Width = 91
          Height = 21
          TabStop = False
          DataField = 'DT_DA'
          DataSource = datm_da.ds_da
          ReadOnly = True
          Color = clMenu
          NumGlyphs = 2
          TabOrder = 25
        end
        object dbedt_nr_da: TDBEdit
          Left = 13
          Top = 347
          Width = 98
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_DA'
          DataSource = datm_da.ds_da
          ReadOnly = True
          TabOrder = 24
        end
        object dbedt_vl_seguro_mneg: TDBEdit
          Left = 414
          Top = 265
          Width = 77
          Height = 21
          DataField = 'VL_SEGURO_MNEG'
          DataSource = datm_da.ds_da
          TabOrder = 17
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_nm_incoterm: TDBEdit
          Left = 182
          Top = 225
          Width = 5
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookIncoterm'
          DataSource = datm_da.ds_da
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 36
          Visible = False
        end
        object dbchkbox_embut_frete: TDBCheckBox
          Left = 414
          Top = 227
          Width = 112
          Height = 17
          Caption = 'Frete Embutido'
          DataField = 'IN_EMBUT_FRT_ITENS'
          DataSource = datm_da.ds_da
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_arm_atrChange
        end
        object dbchkbox_embut_seguro: TDBCheckBox
          Left = 362
          Top = 349
          Width = 120
          Height = 17
          Caption = 'Seguro Embutido'
          DataField = 'IN_EMBUT_SEG_ITENS'
          DataSource = datm_da.ds_da
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 20
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_arm_atrChange
        end
        object dbedt_pc_seguro: TDBEdit
          Left = 263
          Top = 347
          Width = 73
          Height = 21
          DataField = 'PC_SEGURO_MLE'
          DataSource = datm_da.ds_da
          MaxLength = 20
          TabOrder = 19
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_pc_seguroExit
        end
        object dbedt_vl_mcv_mneg: TDBEdit
          Left = 637
          Top = 145
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLD_MNEG'
          DataSource = datm_da.ds_da
          ReadOnly = True
          TabOrder = 37
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_dt_calculo: TDBDateEdit
          Left = 543
          Top = 347
          Width = 91
          Height = 21
          TabStop = False
          DataField = 'DT_CALCULO'
          DataSource = datm_da.ds_da
          ReadOnly = True
          Color = clMenu
          NumGlyphs = 2
          TabOrder = 38
        end
        object dbedt_vl_mle_dolar: TDBEdit
          Left = 543
          Top = 185
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLE_DOLAR'
          DataSource = datm_da.ds_da
          ReadOnly = True
          TabOrder = 39
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_vl_mld_dolar: TDBEdit
          Left = 637
          Top = 185
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLD_DOLAR'
          DataSource = datm_da.ds_da
          ReadOnly = True
          TabOrder = 40
          OnChange = dbedt_cd_arm_atrChange
        end
      end
    end
    object ts_ref: TTabSheet
      Caption = '  Refer'#234'ncias  '
      object Panel1: TPanel
        Left = 0
        Top = 221
        Width = 734
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Label4: TLabel
          Left = 8
          Top = 10
          Width = 40
          Height = 13
          Caption = 'Totais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbtxt_ref_tot_vl_dolar: TDBText
          Left = 424
          Top = 10
          Width = 110
          Height = 17
          Alignment = taRightJustify
          DataField = 'VL_TOT_MLD_DOLAR'
          DataSource = datm_da.ds_tot_ref
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbtxt_ref_tot_vol: TDBText
          Left = 207
          Top = 10
          Width = 79
          Height = 17
          Alignment = taRightJustify
          DataField = 'VL_TOT_REF'
          DataSource = datm_da.ds_tot_ref
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbtxt_tot_peso_liq: TDBText
          Left = 83
          Top = 10
          Width = 110
          Height = 17
          Alignment = taRightJustify
          DataField = 'PL_REF'
          DataSource = datm_da.ds_tot_ref
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object dbgrd_dep: TDBGrid
        Left = 0
        Top = 52
        Width = 734
        Height = 169
        Align = alClient
        DataSource = datm_da.ds_lista_ref
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
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
            FieldName = 'NR_REF'
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
            FieldName = 'PL_REF'
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
            FieldName = 'QT_REF'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_MLD_MNEG'
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
            FieldName = 'AP_MOEDA'
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
            FieldName = 'VL_MLD_DOLAR'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 103
            Visible = True
          end>
      end
      object pnl_ref: TPanel
        Left = 0
        Top = 249
        Width = 734
        Height = 135
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object lbl_tx_mle: TLabel
          Left = 455
          Top = 49
          Width = 58
          Height = 13
          Caption = 'Taxa MLE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 546
          Top = 89
          Width = 74
          Height = 13
          Caption = 'MLE em US$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 455
          Top = 89
          Width = 57
          Height = 13
          Caption = 'Taxa US$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 427
          Top = 10
          Width = 43
          Height = 13
          Caption = 'N'#186' Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_merc: TLabel
          Left = 13
          Top = 10
          Width = 64
          Height = 13
          Caption = 'Mercadoria'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object btn_co_mercadoria: TSpeedButton
          Left = 385
          Top = 23
          Width = 25
          Height = 21
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
          OnClick = btn_co_mercadoriaClick
        end
        object Label21: TLabel
          Left = 638
          Top = 10
          Width = 48
          Height = 13
          Caption = 'Volumes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 13
          Top = 49
          Width = 72
          Height = 13
          Caption = 'Unid.Medida'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object btn_co_unid_med: TSpeedButton
          Left = 136
          Top = 63
          Width = 25
          Height = 21
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
          OnClick = btn_co_unid_medClick
        end
        object Label23: TLabel
          Left = 170
          Top = 49
          Width = 78
          Height = 13
          Caption = 'Valor Unit'#225'rio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 255
          Top = 49
          Width = 68
          Height = 13
          Caption = 'Moeda MLE'
          FocusControl = dbedt_cd_moeda_mle_ref
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_mle_ref: TSpeedButton
          Left = 415
          Top = 63
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
          OnClick = btn_co_moeda_mle_refClick
        end
        object Label25: TLabel
          Left = 546
          Top = 49
          Width = 86
          Height = 13
          Caption = 'MLE na Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 235
          Top = 89
          Width = 74
          Height = 13
          Caption = 'Valor Seguro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 13
          Top = 89
          Width = 63
          Height = 13
          Caption = 'Valor Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 547
          Top = 10
          Width = 56
          Height = 13
          Caption = 'Peso L'#237'q.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label46: TLabel
          Left = 637
          Top = 89
          Width = 75
          Height = 13
          Caption = 'MLD em US$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label47: TLabel
          Left = 637
          Top = 49
          Width = 87
          Height = 13
          Caption = 'MLD na Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_mle_dolar_ref: TDBEdit
          Left = 546
          Top = 102
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLE_DOLAR'
          DataSource = datm_da.ds_ref
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_tx_dolar: TDBEdit
          Left = 455
          Top = 102
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'TX_DOLAR'
          DataSource = datm_da.ds_ref
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_tx_mle: TDBEdit
          Left = 455
          Top = 63
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'TX_MLE'
          DataSource = datm_da.ds_ref
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_nr_ref: TDBEdit
          Left = 427
          Top = 23
          Width = 105
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NR_REF'
          DataSource = datm_da.ds_ref
          MaxLength = 15
          TabOrder = 1
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_cd_mercadoria: TDBEdit
          Left = 13
          Top = 23
          Width = 141
          Height = 21
          DataField = 'CD_MERCADORIA'
          DataSource = datm_da.ds_ref
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 15
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_arm_atrExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_mercadoria: TDBEdit
          Left = 156
          Top = 23
          Width = 227
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookMercadoria'
          DataSource = datm_da.ds_ref
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object dbedt_cd_unid_med: TDBEdit
          Left = 13
          Top = 63
          Width = 29
          Height = 21
          DataField = 'CD_UNID_MEDIDA'
          DataSource = datm_da.ds_ref
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_arm_atrExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_unid_med: TDBEdit
          Left = 42
          Top = 63
          Width = 93
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookUnidMedida'
          DataSource = datm_da.ds_ref
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_qt_ref: TDBEdit
          Left = 638
          Top = 23
          Width = 71
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'QT_REF'
          DataSource = datm_da.ds_ref
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 17
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_vl_unitario: TDBEdit
          Left = 170
          Top = 63
          Width = 73
          Height = 21
          DataField = 'VL_UNITARIO'
          DataSource = datm_da.ds_ref
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_cd_moeda_mle_ref: TDBEdit
          Left = 255
          Top = 63
          Width = 30
          Height = 21
          DataField = 'CD_MOEDA_MLE'
          DataSource = datm_da.ds_ref
          MaxLength = 3
          TabOrder = 4
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_arm_atrExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_moeda_mle_ref: TDBEdit
          Left = 285
          Top = 63
          Width = 129
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'LookMoedaMLE'
          DataSource = datm_da.ds_ref
          ReadOnly = True
          TabOrder = 15
        end
        object dbedt_vl_mle_mneg_ref: TDBEdit
          Left = 546
          Top = 63
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLE_MNEG'
          DataSource = datm_da.ds_ref
          ReadOnly = True
          TabOrder = 16
        end
        object dbedt_vl_seguro_mneg_ref: TDBEdit
          Left = 235
          Top = 102
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_SEGURO_MNEG'
          DataSource = datm_da.ds_ref
          ReadOnly = True
          TabOrder = 7
          OnClick = dbedt_cd_arm_atrChange
        end
        object dbchkbox_embut_seguro_ref: TDBCheckBox
          Left = 328
          Top = 111
          Width = 107
          Height = 13
          Caption = 'Seg. Embutido'
          Color = clBtnFace
          DataField = 'IN_EMBUT_SEG_ITENS'
          DataSource = datm_da.ds_ref
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 8
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_arm_atrChange
        end
        object dbedt_vl_frete_mneg_ref: TDBEdit
          Left = 13
          Top = 102
          Width = 132
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_FRETE_MNEG'
          DataSource = datm_da.ds_ref
          ReadOnly = True
          TabOrder = 5
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbchkbox_embut_frete_ref: TDBCheckBox
          Left = 328
          Top = 92
          Width = 109
          Height = 17
          Caption = 'Frete Embutido'
          Color = clBtnFace
          DataField = 'IN_EMBUT_FRT_ITENS'
          DataSource = datm_da.ds_ref
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_arm_atrChange
        end
        object dbedt_pl_ref: TDBEdit
          Left = 547
          Top = 23
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_REF'
          DataSource = datm_da.ds_ref
          ReadOnly = True
          TabOrder = 17
        end
        object dbedt_vl_mld_dolar_ref: TDBEdit
          Left = 637
          Top = 102
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLD_DOLAR'
          DataSource = datm_da.ds_ref
          ReadOnly = True
          TabOrder = 18
        end
        object dbedt_vl_mld_mneg_ref: TDBEdit
          Left = 637
          Top = 63
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLD_MNEG'
          DataSource = datm_da.ds_ref
          ReadOnly = True
          TabOrder = 19
        end
        object dbedt_cd_moeda_frete_ref: TDBEdit
          Left = 152
          Top = 102
          Width = 64
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaFrete'
          DataSource = datm_da.ds_da
          ReadOnly = True
          TabOrder = 20
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 52
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object Label15: TLabel
          Left = 134
          Top = 8
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
        object lbl_artigo2: TLabel
          Left = 444
          Top = 8
          Width = 34
          Height = 13
          Caption = 'Artigo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_mercadoria: TLabel
          Left = 8
          Top = 8
          Width = 40
          Height = 13
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_ap_mercadoria: TDBEdit
          Left = 134
          Top = 21
          Width = 301
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'AP_MERCADORIA'
          DataSource = datm_da.ds_merc
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nr_artigo2: TDBEdit
          Left = 444
          Top = 21
          Width = 100
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_MATERIAL'
          DataSource = datm_da.ds_merc
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_mercadoria2: TDBEdit
          Left = 8
          Top = 21
          Width = 116
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_MERCADORIA'
          DataSource = datm_da.ds_merc
          ReadOnly = True
          TabOrder = 2
        end
      end
    end
    object ts_merc: TTabSheet
      Caption = '  Mercadorias  '
      object pnl_tot: TPanel
        Left = 0
        Top = 221
        Width = 734
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object lbl_tot_fat: TLabel
          Left = 8
          Top = 8
          Width = 40
          Height = 13
          Caption = 'Totais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbtxt_merc_tot_vl_dolar: TDBText
          Left = 344
          Top = 8
          Width = 110
          Height = 17
          Alignment = taRightJustify
          DataField = 'VL_TOT_MLD_DOLAR'
          DataSource = datm_da.ds_tot_merc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbtxt_merc_tot_pl: TDBText
          Left = 57
          Top = 8
          Width = 109
          Height = 17
          Alignment = taRightJustify
          DataField = 'PL_REF'
          DataSource = datm_da.ds_tot_merc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbtxt_merc_tot_vol: TDBText
          Left = 171
          Top = 8
          Width = 67
          Height = 17
          Alignment = taRightJustify
          DataField = 'VL_TOT_QT_REF'
          DataSource = datm_da.ds_tot_merc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 221
        Align = alClient
        DataSource = datm_da.ds_lista_merc
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
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
            FieldName = 'CD_MERCADORIA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_MERCADORIA'
            Title.Color = clBlack
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
            FieldName = 'PL_REF'
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
            FieldName = 'QT_REF'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_MLD_MNEG'
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
            Expanded = False
            FieldName = 'AP_MOEDA'
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
            FieldName = 'VL_MLD_DOLAR'
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
      object pnl_mercadoria: TPanel
        Left = 0
        Top = 249
        Width = 734
        Height = 135
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 2
        object Label39: TLabel
          Left = 13
          Top = 14
          Width = 23
          Height = 13
          Caption = 'C'#243'd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nr_artigo: TLabel
          Left = 617
          Top = 14
          Width = 34
          Height = 13
          Caption = 'Artigo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nm_mercadoria: TLabel
          Left = 169
          Top = 14
          Width = 58
          Height = 13
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_area: TLabel
          Left = 13
          Top = 50
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
        object lbl_proprietario: TLabel
          Left = 356
          Top = 50
          Width = 66
          Height = 13
          Caption = 'Propriet'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_embalagem: TLabel
          Left = 13
          Top = 87
          Width = 65
          Height = 13
          Caption = 'Embalagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_peso_liq: TLabel
          Left = 356
          Top = 87
          Width = 124
          Height = 13
          Caption = 'Peso L'#237'quido Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_mercadoria4: TDBEdit
          Left = 13
          Top = 27
          Width = 153
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_MERCADORIA'
          DataSource = datm_da.ds_merc
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_nr_artigo: TDBEdit
          Left = 617
          Top = 27
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_MATERIAL'
          DataSource = datm_da.ds_merc
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nm_mercadoria2: TDBEdit
          Left = 169
          Top = 27
          Width = 443
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'AP_MERCADORIA'
          DataSource = datm_da.ds_merc
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_cd_area: TDBEdit
          Left = 13
          Top = 64
          Width = 34
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_AREA'
          DataSource = datm_da.ds_merc
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nm_area: TDBEdit
          Left = 47
          Top = 64
          Width = 292
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'NM_AREA'
          DataSource = datm_da.ds_merc
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_cd_proprietario: TDBEdit
          Left = 356
          Top = 64
          Width = 48
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_PROPRIETARIO'
          DataSource = datm_da.ds_merc
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_nm_proprietario: TDBEdit
          Left = 404
          Top = 64
          Width = 315
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'NM_PROPRIETARIO'
          DataSource = datm_da.ds_merc
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_cd_embalagem_scx: TDBEdit
          Left = 13
          Top = 101
          Width = 34
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_EMBALAGEM_SCX'
          DataSource = datm_da.ds_merc
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_nm_embalagem_scx: TDBEdit
          Left = 47
          Top = 101
          Width = 292
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'NM_EMBALAGEM'
          DataSource = datm_da.ds_merc
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_vl_peso_liq_unitario: TDBEdit
          Left = 356
          Top = 101
          Width = 112
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_MERCADORIA'
          DataSource = datm_da.ds_merc
          ReadOnly = True
          TabOrder = 9
        end
      end
    end
    object ts_lote: TTabSheet
      Caption = '    Lotes    '
      object Panel2: TPanel
        Left = 0
        Top = 222
        Width = 734
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Label5: TLabel
          Left = 8
          Top = 8
          Width = 34
          Height = 13
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbtxt_lote_tot_vol: TDBText
          Left = 200
          Top = 8
          Width = 74
          Height = 17
          Alignment = taRightJustify
          DataField = 'VL_TOT_LOTE'
          DataSource = datm_da.ds_tot_lote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbtxt_vl_tot_lote: TDBText
          Left = 63
          Top = 9
          Width = 118
          Height = 17
          Alignment = taRightJustify
          DataField = 'PL_LOTE'
          DataSource = datm_da.ds_tot_lote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object dbgrd_av_lav: TDBGrid
        Left = 0
        Top = 49
        Width = 734
        Height = 173
        Align = alClient
        DataSource = datm_da.ds_lista_lote
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
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
            FieldName = 'NR_LOTE'
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
            FieldName = 'PL_LOTE'
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
            FieldName = 'QT_LOTE'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 98
            Visible = True
          end>
      end
      object pnl_lote: TPanel
        Left = 0
        Top = 250
        Width = 734
        Height = 134
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 2
        object lbl_transito: TLabel
          Left = 285
          Top = 46
          Width = 68
          Height = 13
          Caption = 'Em Tr'#226'nsito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ag_desemb: TLabel
          Left = 555
          Top = 46
          Width = 73
          Height = 13
          Caption = 'Ag. Desemb.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl: TLabel
          Left = 285
          Top = 86
          Width = 62
          Height = 13
          Caption = 'Dispon'#237'vel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label75: TLabel
          Left = 12
          Top = 10
          Width = 44
          Height = 13
          Caption = 'N'#186' Lote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label77: TLabel
          Left = 112
          Top = 10
          Width = 48
          Height = 13
          Caption = 'Volumes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label81: TLabel
          Left = 582
          Top = 10
          Width = 57
          Height = 13
          Caption = 'Avariados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label76: TLabel
          Left = 186
          Top = 10
          Width = 87
          Height = 13
          Caption = 'Peso L'#237'q. Unit.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label86: TLabel
          Left = 285
          Top = 10
          Width = 85
          Height = 13
          Caption = 'Peso L'#237'q. Lote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label78: TLabel
          Left = 375
          Top = 10
          Width = 85
          Height = 13
          Caption = 'Dt. Fabrica'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label79: TLabel
          Left = 479
          Top = 10
          Width = 71
          Height = 13
          Caption = 'Dt. Validade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label80: TLabel
          Left = 13
          Top = 48
          Width = 116
          Height = 13
          Caption = 'Descri'#231#227'o da Avaria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label82: TLabel
          Left = 375
          Top = 86
          Width = 81
          Height = 13
          Caption = 'Nacionalizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label48: TLabel
          Left = 375
          Top = 46
          Width = 67
          Height = 13
          Caption = 'Ag. Desova'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_qt_fisica: TLabel
          Left = 465
          Top = 86
          Width = 57
          Height = 13
          Caption = 'Qt. F'#237'sica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label49: TLabel
          Left = 555
          Top = 86
          Width = 78
          Height = 13
          Caption = 'P. Liq. Avaria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 465
          Top = 46
          Width = 71
          Height = 13
          Caption = 'Ag. Registro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_pl_ag_desemb: TDBEdit
          Left = 555
          Top = 61
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_AG_DESEMB'
          DataSource = datm_da.ds_lote
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_pl_disponivel: TDBEdit
          Left = 285
          Top = 100
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_DISPONIVEL'
          DataSource = datm_da.ds_lote
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_pl_transito: TDBEdit
          Left = 285
          Top = 61
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_TRANSITO'
          DataSource = datm_da.ds_lote
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_nr_lote: TDBEdit
          Left = 12
          Top = 24
          Width = 90
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NR_LOTE'
          DataSource = datm_da.ds_lote
          MaxLength = 10
          TabOrder = 0
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_qt_lote: TDBEdit
          Left = 112
          Top = 24
          Width = 63
          Height = 21
          DataField = 'QT_LOTE'
          DataSource = datm_da.ds_lote
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 17
          ParentFont = False
          TabOrder = 1
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_qt_avaria: TDBEdit
          Left = 582
          Top = 24
          Width = 77
          Height = 21
          DataField = 'QT_AVARIA'
          DataSource = datm_da.ds_lote
          TabOrder = 4
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_pl_unit: TDBEdit
          Left = 186
          Top = 24
          Width = 87
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_UNIT'
          DataSource = datm_da.ds_lote
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_pl_lote: TDBEdit
          Left = 285
          Top = 24
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_LOTE'
          DataSource = datm_da.ds_lote
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_dt_fabricacao: TDBDateEdit
          Left = 375
          Top = 24
          Width = 91
          Height = 21
          DataField = 'DT_FABRICACAO'
          DataSource = datm_da.ds_lote
          NumGlyphs = 2
          TabOrder = 2
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_dt_validade: TDBDateEdit
          Left = 479
          Top = 24
          Width = 91
          Height = 21
          DataField = 'DT_VALIDADE'
          DataSource = datm_da.ds_lote
          NumGlyphs = 2
          TabOrder = 3
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbm_avaria: TDBMemo
          Left = 13
          Top = 61
          Width = 261
          Height = 60
          DataField = 'TX_AVARIA'
          DataSource = datm_da.ds_lote
          TabOrder = 5
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_pl_nac: TDBEdit
          Left = 375
          Top = 100
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_NAC'
          DataSource = datm_da.ds_lote
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_pl_ag_desova: TDBEdit
          Left = 375
          Top = 61
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_AG_DESOVA'
          DataSource = datm_da.ds_lote
          ReadOnly = True
          TabOrder = 12
        end
        object dbedt_pl_fisica: TDBEdit
          Left = 465
          Top = 100
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_FISICA'
          DataSource = datm_da.ds_lote
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_pl_avaria: TDBEdit
          Left = 555
          Top = 100
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_AVARIA_PEND'
          DataSource = datm_da.ds_lote
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_pl_ag_registro: TDBEdit
          Left = 465
          Top = 61
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_AG_REGISTRO'
          DataSource = datm_da.ds_lote
          ReadOnly = True
          TabOrder = 15
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel8'
        TabOrder = 3
        object Label12: TLabel
          Left = 6
          Top = 7
          Width = 40
          Height = 13
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 132
          Top = 7
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
        object lbl_artigo3: TLabel
          Left = 339
          Top = 7
          Width = 34
          Height = 13
          Caption = 'Artigo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 456
          Top = 7
          Width = 63
          Height = 13
          Caption = 'Refer'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_ap_mercadoria2: TDBEdit
          Left = 133
          Top = 20
          Width = 197
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'AP_MERCADORIA'
          DataSource = datm_da.ds_merc
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nr_ref3: TDBEdit
          Left = 457
          Top = 20
          Width = 121
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_REF'
          DataSource = datm_da.ds_lista_ref
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_nr_artigo3: TDBEdit
          Left = 340
          Top = 20
          Width = 100
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_MATERIAL'
          DataSource = datm_da.ds_merc
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_cd_mercadoria3: TDBEdit
          Left = 7
          Top = 20
          Width = 110
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_MERCADORIA'
          DataSource = datm_da.ds_merc
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
    object ts_etiqueta: TTabSheet
      Caption = '   Etiqueta   '
      object Label84: TLabel
        Left = 10
        Top = 7
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
      object lbl_artigo: TLabel
        Left = 230
        Top = 7
        Width = 34
        Height = 13
        Caption = 'Artigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label87: TLabel
        Left = 352
        Top = 7
        Width = 63
        Height = 13
        Caption = 'Refer'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label88: TLabel
        Left = 466
        Top = 7
        Width = 26
        Height = 13
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnl_etiq_fabr: TPanel
        Left = 39
        Top = 88
        Width = 279
        Height = 259
        BevelOuter = bvLowered
        TabOrder = 0
        object lbl_local_etiq_fabr: TLabel
          Left = 18
          Top = 42
          Width = 101
          Height = 13
          Caption = 'Local da Etiqueta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object dbchkbox_etiq_fabr: TDBCheckBox
          Left = 18
          Top = 14
          Width = 158
          Height = 17
          Caption = 'Desovado com Etiqueta'
          Color = clBtnFace
          DataField = 'IN_ETIQ_FABR'
          DataSource = datm_da.ds_lote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_arm_atrChange
          OnExit = dbchkbox_etiq_fabrExit
        end
        object dbchkbox_solic_etiq_fabr: TDBCheckBox
          Left = 18
          Top = 88
          Width = 161
          Height = 17
          Caption = 'Solicitado Etiquetagem'
          Color = clBtnFace
          DataField = 'IN_SOLIC_ETIQ_FABR'
          DataSource = datm_da.ds_lote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_arm_atrChange
        end
        object dblckpbox_local_etiq_fabr: TDBLookupComboBox
          Left = 18
          Top = 55
          Width = 103
          Height = 21
          DataField = 'LookLocalEtiqFabr'
          DataSource = datm_da.ds_lote
          TabOrder = 1
          OnClick = dbedt_cd_arm_atrChange
        end
      end
      object dbedt_cd_mercadoria5: TDBEdit
        Left = 10
        Top = 20
        Width = 212
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'AP_MERCADORIA'
        DataSource = datm_da.ds_merc
        ReadOnly = True
        TabOrder = 1
      end
      object dbedt_nr_artigo4: TDBEdit
        Left = 229
        Top = 20
        Width = 116
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_MATERIAL'
        DataSource = datm_da.ds_merc
        ReadOnly = True
        TabOrder = 2
      end
      object dbedt_nr_ref4: TDBEdit
        Left = 352
        Top = 20
        Width = 108
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NR_REF'
        DataSource = datm_da.ds_lista_ref
        ReadOnly = True
        TabOrder = 3
      end
      object dbedt_nr_lote3: TDBEdit
        Left = 466
        Top = 20
        Width = 105
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NR_LOTE'
        DataSource = datm_da.ds_lista_lote
        ReadOnly = True
        TabOrder = 4
      end
      object pnl_etiq_valid: TPanel
        Left = 348
        Top = 88
        Width = 279
        Height = 259
        BevelOuter = bvLowered
        TabOrder = 5
        object lbl_local_etiq_valid: TLabel
          Left = 19
          Top = 39
          Width = 101
          Height = 13
          Caption = 'Local da Etiqueta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label54: TLabel
          Left = 19
          Top = 146
          Width = 119
          Height = 13
          Caption = 'Dt. Validade Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbchkbox_etiq_valid: TDBCheckBox
          Left = 19
          Top = 14
          Width = 158
          Height = 17
          Caption = 'Desovado com Etiqueta'
          Color = clBtnFace
          DataField = 'IN_ETIQ_VALID'
          DataSource = datm_da.ds_lote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_arm_atrChange
          OnExit = dbchkbox_etiq_validExit
        end
        object dblckpbox_local_etiq_valid: TDBLookupComboBox
          Left = 19
          Top = 53
          Width = 103
          Height = 21
          DataField = 'LookLocalEtiqValid'
          DataSource = datm_da.ds_lote
          TabOrder = 1
          OnClick = dbedt_cd_arm_atrChange
        end
        object dbchkbox_solic_etiq_valid: TDBCheckBox
          Left = 19
          Top = 88
          Width = 161
          Height = 17
          Caption = 'Solicitado Etiquetagem'
          Color = clBtnFace
          DataField = 'IN_SOLIC_ETIQ_VALID'
          DataSource = datm_da.ds_lote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_arm_atrChange
        end
        object dbedt_dt_validade_ant: TDBDateEdit
          Left = 19
          Top = 160
          Width = 102
          Height = 21
          DataField = 'DT_VALIDADE_ANT'
          DataSource = datm_da.ds_lote
          NumGlyphs = 2
          TabOrder = 4
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbchkbox_revalidado: TDBCheckBox
          Left = 19
          Top = 120
          Width = 89
          Height = 17
          Caption = 'Revalidado'
          Color = clBtnFace
          DataField = 'IN_REVALIDADO'
          DataSource = datm_da.ds_lote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_arm_atrChange
        end
      end
      object Panel5: TPanel
        Left = 39
        Top = 65
        Width = 279
        Height = 22
        Caption = 'Data de Fabrica'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object Panel6: TPanel
        Left = 348
        Top = 65
        Width = 279
        Height = 22
        Caption = 'Data de Validade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
    end
    object ts_lib_avaria: TTabSheet
      Caption = '  Libera'#231#227'o de Avarias  '
      object Panel3: TPanel
        Left = 0
        Top = 221
        Width = 734
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object dbtxt_lib_avaria_tot_vol: TDBText
          Left = 60
          Top = 8
          Width = 102
          Height = 17
          Alignment = taRightJustify
          DataField = 'VL_TOT_LIB'
          DataSource = datm_da.ds_tot_lib_avaria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 8
          Top = 10
          Width = 34
          Height = 13
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbtxt_lib_avaria_tot_pl_lib: TDBText
          Left = 175
          Top = 8
          Width = 109
          Height = 17
          Alignment = taRightJustify
          DataField = 'PL_LIB'
          DataSource = datm_da.ds_tot_lib_avaria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 50
        Width = 734
        Height = 171
        Align = alClient
        DataSource = datm_da.ds_lista_da_lib_avaria
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
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
            FieldName = 'DT_LIB'
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
            FieldName = 'QT_LIB'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PL_LIB'
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
            FieldName = 'CD_USUARIO_LIB'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_USUARIO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 231
            Visible = True
          end>
      end
      object pnl_lib_avaria: TPanel
        Left = 0
        Top = 249
        Width = 734
        Height = 135
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object Label64: TLabel
          Left = 221
          Top = 8
          Width = 101
          Height = 13
          Caption = 'Usu'#225'rio Liberador'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object btn_co_usuario_lib: TSpeedButton
          Left = 537
          Top = 21
          Width = 25
          Height = 21
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
          OnClick = btn_co_usuario_libClick
        end
        object Label61: TLabel
          Left = 11
          Top = 8
          Width = 78
          Height = 13
          Caption = 'Dt. Libera'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label62: TLabel
          Left = 111
          Top = 8
          Width = 102
          Height = 13
          Caption = 'Volumes a Liberar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_motivo: TLabel
          Left = 11
          Top = 46
          Width = 39
          Height = 13
          Caption = 'Motivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label83: TLabel
          Left = 276
          Top = 46
          Width = 54
          Height = 13
          Caption = 'Peso Liq.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_usuario_lib: TDBEdit
          Left = 221
          Top = 21
          Width = 37
          Height = 21
          DataField = 'CD_USUARIO_LIB'
          DataSource = datm_da.ds_da_lib_avaria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_cd_arm_atrChange
          OnExit = dbedt_cd_arm_atrExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_usuario_lib: TDBEdit
          Left = 258
          Top = 21
          Width = 278
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookUsuario'
          DataSource = datm_da.ds_da_lib_avaria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_dt_lib: TDBDateEdit
          Left = 11
          Top = 21
          Width = 91
          Height = 21
          DataField = 'DT_LIB'
          DataSource = datm_da.ds_da_lib_avaria
          NumGlyphs = 2
          TabOrder = 0
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_qt_lib: TDBEdit
          Left = 111
          Top = 21
          Width = 101
          Height = 21
          DataField = 'QT_LIB'
          DataSource = datm_da.ds_da_lib_avaria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbm_motivo: TDBMemo
          Left = 11
          Top = 59
          Width = 256
          Height = 66
          DataField = 'TX_MOTIVO_LIB'
          DataSource = datm_da.ds_da_lib_avaria
          TabOrder = 3
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_pl_avaria_lib: TDBEdit
          Left = 276
          Top = 59
          Width = 92
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_LIB'
          DataSource = datm_da.ds_da_lib_avaria
          ReadOnly = True
          TabOrder = 5
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object Label55: TLabel
          Left = 10
          Top = 7
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
        object lbl_artigo5: TLabel
          Left = 215
          Top = 7
          Width = 34
          Height = 13
          Caption = 'Artigo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label57: TLabel
          Left = 340
          Top = 7
          Width = 63
          Height = 13
          Caption = 'Refer'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_lote: TLabel
          Left = 457
          Top = 7
          Width = 26
          Height = 13
          Caption = 'Lote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 573
          Top = 7
          Width = 57
          Height = 13
          Caption = 'Avariados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_ap_mercadoria3: TDBEdit
          Left = 10
          Top = 20
          Width = 195
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'AP_MERCADORIA'
          DataSource = datm_da.ds_merc
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nr_artigo5: TDBEdit
          Left = 214
          Top = 20
          Width = 116
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_MATERIAL'
          DataSource = datm_da.ds_merc
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_nr_ref2: TDBEdit
          Left = 340
          Top = 20
          Width = 108
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_REF'
          DataSource = datm_da.ds_lista_ref
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_nr_lote2: TDBEdit
          Left = 457
          Top = 20
          Width = 105
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_LOTE'
          DataSource = datm_da.ds_lista_lote
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_qt_avaria2: TDBEdit
          Left = 573
          Top = 20
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'QT_AVARIA'
          DataSource = datm_da.ds_lote
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_cd_arm_atrChange
        end
      end
    end
    object ts_vencto: TTabSheet
      Caption = '   Vencimentos   '
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 324
        Align = alClient
        DataSource = datm_da.ds_lista_da_vencto
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
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
            FieldName = 'DT_VENCTO_DA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_PROTOCOLO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PROTOCOLO'
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
            FieldName = 'DT_DEFERIMENTO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 103
            Visible = True
          end>
      end
      object pnl_vencto: TPanel
        Left = 0
        Top = 324
        Width = 734
        Height = 60
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object lbl_dt_vencimento: TLabel
          Left = 15
          Top = 12
          Width = 88
          Height = 13
          Caption = 'Dt. Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_dt_protocolo: TLabel
          Left = 225
          Top = 12
          Width = 76
          Height = 13
          Caption = 'Dt. Protocolo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_dt_deferimento: TLabel
          Left = 326
          Top = 12
          Width = 90
          Height = 13
          Caption = 'Dt. Deferimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nr_protocolo: TLabel
          Left = 115
          Top = 12
          Width = 73
          Height = 13
          Caption = 'N'#186' Protocolo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 427
          Top = 13
          Width = 36
          Height = 13
          Caption = 'N'#186' DA'
          FocusControl = dbedt_nr_da2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 534
          Top = 12
          Width = 95
          Height = 13
          Caption = 'Dt. Vencto Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_dt_vencto_da: TDBDateEdit
          Left = 15
          Top = 26
          Width = 91
          Height = 21
          TabStop = False
          DataField = 'DT_VENCTO_DA'
          DataSource = datm_da.ds_da_vencto
          ReadOnly = True
          Color = clMenu
          NumGlyphs = 2
          TabOrder = 3
        end
        object dbedt_dt_protocolo: TDBDateEdit
          Left = 225
          Top = 26
          Width = 91
          Height = 21
          DataField = 'DT_PROTOCOLO'
          DataSource = datm_da.ds_da_vencto
          NumGlyphs = 2
          TabOrder = 1
          OnChange = dbedt_cd_arm_atrChange
        end
        object DBDateEdit3: TDBDateEdit
          Left = 326
          Top = 26
          Width = 91
          Height = 21
          DataField = 'DT_DEFERIMENTO'
          DataSource = datm_da.ds_da_vencto
          NumGlyphs = 2
          TabOrder = 2
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_nr_protocolo: TDBEdit
          Left = 115
          Top = 26
          Width = 101
          Height = 21
          DataField = 'NR_PROTOCOLO'
          DataSource = datm_da.ds_da_vencto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_cd_arm_atrChange
        end
        object dbedt_nr_da2: TDBEdit
          Left = 426
          Top = 26
          Width = 98
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_DA'
          DataSource = datm_da.ds_vencto
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_dt_vencto_da_atual: TDBDateEdit
          Left = 534
          Top = 26
          Width = 91
          Height = 21
          TabStop = False
          DataField = 'DT_VENCTO_DA'
          DataSource = datm_da.ds_vencto
          ReadOnly = True
          Color = clMenu
          NumGlyphs = 2
          TabOrder = 5
        end
      end
    end
  end
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object btn_sair: TSpeedButton
      Left = 702
      Top = 4
      Width = 35
      Height = 39
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
      Left = 40
      Top = 4
      Width = 35
      Height = 39
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
      Left = 75
      Top = 4
      Width = 35
      Height = 39
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
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 35
      Height = 39
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
      Left = 110
      Top = 4
      Width = 35
      Height = 39
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
    object btn_proc_realiza: TSpeedButton
      Left = 227
      Top = 4
      Width = 35
      Height = 39
      Hint = 'Realiza'#231#227'o por Processo - <CTRL+F2>'
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
      OnClick = btn_proc_realizaClick
    end
    object btn_manut_proc: TSpeedButton
      Left = 192
      Top = 4
      Width = 35
      Height = 39
      Hint = 'Manuten'#231#227'o do Processo - <F2>'
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
    object btn_di: TSpeedButton
      Left = 262
      Top = 4
      Width = 35
      Height = 39
      Hint = 'Declara'#231#227'o de Importa'#231#227'o'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_diClick
    end
    object btn_calculo: TSpeedButton
      Left = 151
      Top = 4
      Width = 35
      Height = 39
      Hint = 'C'#225'lculo da Pro Forma DA'
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
      OnClick = btn_calculoClick
    end
    object dbnvg: TDBNavigator
      Left = 311
      Top = 10
      Width = 104
      Height = 26
      DataSource = datm_da.ds_lista_merc
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
      BeforeAction = dbnvgBeforeAction
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 47
    Width = 742
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lbl_cd_unid_neg: TLabel
      Left = 7
      Top = 5
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
    object btn_co_unid_neg: TSpeedButton
      Left = 257
      Top = 17
      Width = 23
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
      OnClick = btn_co_unid_negClick
    end
    object lbl_cd_produto: TLabel
      Left = 293
      Top = 5
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
      Left = 544
      Top = 17
      Width = 23
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
      OnClick = btn_co_produtoClick
    end
    object lbl_nr_processo: TLabel
      Left = 583
      Top = 5
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
      Left = 709
      Top = 18
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
      OnClick = btn_co_processoClick
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 7
      Top = 18
      Width = 36
      Height = 21
      EditMask = '!99;0; '
      MaxLength = 2
      TabOrder = 0
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 43
      Top = 18
      Width = 213
      Height = 21
      TabStop = False
      ParentColor = True
      ReadOnly = True
      TabOrder = 1
    end
    object msk_cd_produto: TMaskEdit
      Left = 293
      Top = 18
      Width = 36
      Height = 21
      EditMask = '!99;0; '
      MaxLength = 2
      TabOrder = 2
      OnEnter = msk_cd_produtoEnter
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 329
      Top = 18
      Width = 214
      Height = 21
      TabStop = False
      ParentColor = True
      ReadOnly = True
      TabOrder = 3
    end
    object msk_nr_processo: TMaskEdit
      Left = 584
      Top = 18
      Width = 123
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 4
      OnChange = msk_nr_processoChange
      OnEnter = msk_nr_processoEnter
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
  end
  object menu_cadastro: TMainMenu
    Left = 569
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      OnClick = btn_incluirClick
    end
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
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Enabled = False
      OnClick = btn_excluirClick
    end
    object mi_calculo: TMenuItem
      Caption = 'Ca&lcular'
      OnClick = btn_calculoClick
    end
    object mi_atalho: TMenuItem
      Caption = '&Atalhos'
      object mi_manut_proc: TMenuItem
        Caption = '&Manuten'#231#227'o do Processo'
        ShortCut = 113
        OnClick = btn_manut_procClick
      end
      object mi_proc_realiza: TMenuItem
        Caption = 'Realiza'#231#227'o por &Processo'
        ShortCut = 16497
        OnClick = btn_proc_realizaClick
      end
      object mi_di: TMenuItem
        Caption = '&Declara'#231#227'o de Importa'#231#227'o'
        ShortCut = 115
        OnClick = btn_diClick
      end
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
