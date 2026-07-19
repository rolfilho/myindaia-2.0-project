object frm_Laudo: Tfrm_Laudo
  Left = 275
  Top = 111
  Width = 864
  Height = 559
  Caption = 'Cadastro de Laudos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_Laudos: TPageControl
    Left = 0
    Top = 52
    Width = 856
    Height = 461
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_LaudosChange
    OnChanging = pgctrl_LaudosChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_Laudos: TDBGrid
        Left = 0
        Top = 54
        Width = 848
        Height = 169
        Align = alClient
        DataSource = datm_Laudo.ds_Laudo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBackground
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbg_LaudosCellClick
        OnDblClick = dbg_LaudosDblClick
        Columns = <
          item
            Color = clWhite
            Expanded = False
            FieldName = 'NR_LAUDO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo do Laudo'
            Title.Color = clWindowText
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_DESCR_MERC'
            Title.Caption = 'Poss'#237'veis descri'#231#245'es'
            Title.Color = clWindowText
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 848
        Height = 54
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object BtnMercadoria: TSpeedButton
          Left = 540
          Top = 22
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
          OnClick = BtnMercadoriaClick
        end
        object Label55: TLabel
          Left = 1
          Top = 10
          Width = 70
          Height = 13
          AutoSize = False
          Caption = 'Mercadoria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblChaves: TLabel
          Left = 568
          Top = 9
          Width = 196
          Height = 13
          Caption = 'Poss'#237'veis descri'#231#245'es (Mercadoria)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object msk_nm_mercadoria: TEdit
          Left = 81
          Top = 23
          Width = 457
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object msk_cd_mercadoria: TMaskEdit
          Left = 1
          Top = 23
          Width = 78
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = BtnMercadoriaClick
        end
      end
      object pnl_ag: TPanel
        Left = 0
        Top = 223
        Width = 848
        Height = 210
        Align = alBottom
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        object Label14: TLabel
          Left = 2
          Top = 45
          Width = 81
          Height = 13
          AutoSize = False
          Caption = 'Mat'#233'ria Prima'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_mat_pri: TSpeedButton
          Left = 307
          Top = 61
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
          OnClick = btn_co_mat_priClick
        end
        object Label15: TLabel
          Left = 336
          Top = 45
          Width = 42
          Height = 13
          AutoSize = False
          Caption = #205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 605
          Top = 45
          Width = 81
          Height = 13
          AutoSize = False
          Caption = 'N.C.M.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 393
          Top = 45
          Width = 80
          Height = 13
          AutoSize = False
          Caption = 'Unid. Medida'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 552
          Top = 45
          Width = 49
          Height = 13
          AutoSize = False
          Caption = '% Perda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_un_med_comerc: TSpeedButton
          Left = 525
          Top = 61
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
          OnClick = btn_co_un_med_comercClick
        end
        object btn_incluir_matpri: TSpeedButton
          Left = 2
          Top = 10
          Width = 26
          Height = 25
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
          OnClick = btn_incluir_matpriClick
        end
        object btn_salvar_matpri: TSpeedButton
          Left = 29
          Top = 10
          Width = 26
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
          OnClick = btn_salvar_matpriClick
        end
        object btn_cancelar_matpri: TSpeedButton
          Left = 56
          Top = 10
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
          OnClick = btn_cancelar_matpriClick
        end
        object btn_excluir_matpri: TSpeedButton
          Left = 82
          Top = 10
          Width = 26
          Height = 25
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
          OnClick = btn_excluir_matpriClick
        end
        object lblPalavraChave: TLabel
          Left = 711
          Top = 44
          Width = 90
          Height = 13
          Caption = 'Palavras-Chave'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_mat_pri: TDBEdit
          Left = 2
          Top = 61
          Width = 109
          Height = 21
          DataField = 'CD_MAT_PRI'
          DataSource = datm_Laudo.ds_lista_mat_pri
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = btn_co_mat_priClick
          OnExit = dbedt_cd_mat_priExit
        end
        object dbedt_vl_percent: TDBEdit
          Left = 336
          Top = 61
          Width = 52
          Height = 21
          DataField = 'VL_INDICE'
          DataSource = datm_Laudo.ds_lista_mat_pri
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = dbedt_vl_percentChange
        end
        object dbgrd_mat_pri: TDBGrid
          Left = 0
          Top = 89
          Width = 848
          Height = 121
          Align = alBottom
          DataSource = datm_Laudo.ds_lista_mat_pri
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnCellClick = dbgrd_mat_priCellClick
          OnDblClick = dbgrd_mat_priDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_MAT_PRI'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 105
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
              Width = 283
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_INDICE'
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
              FieldName = 'CD_UN_MED_COMERC'
              Title.Caption = 'Unid. Medida'
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
              FieldName = 'NR_PALAVRAS_CHAVE'
              Title.Caption = 'Palavras-Chave'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 193
              Visible = True
            end>
        end
        object dbedt_nm_mat_pri: TEdit
          Left = 113
          Top = 61
          Width = 192
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
        object EditNCM: TMaskEdit
          Left = 605
          Top = 61
          Width = 94
          Height = 21
          Color = clMenu
          EditMask = '9999.99.99;0;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object EditPercPerda: TDBEdit
          Left = 552
          Top = 61
          Width = 52
          Height = 21
          DataField = 'PERC_PERDA'
          DataSource = datm_Laudo.ds_lista_mat_pri
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_vl_percentChange
        end
        object dbedt_cd_un_med_comerc: TDBEdit
          Left = 394
          Top = 61
          Width = 34
          Height = 21
          DataField = 'CD_UN_MED_COMERC'
          DataSource = datm_Laudo.ds_lista_mat_pri
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 6
          OnChange = btn_co_un_med_comercClick
          OnExit = dbedt_cd_mat_priExit
        end
        object dbedt_look_nm_un_med_comerc: TEdit
          Left = 430
          Top = 61
          Width = 91
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 7
        end
        object dbedtPalavraChave: TDBEdit
          Left = 709
          Top = 60
          Width = 132
          Height = 21
          DataField = 'NR_PALAVRAS_CHAVE'
          DataSource = datm_Laudo.ds_lista_mat_pri
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnChange = dbedtPalavraChaveChange
        end
      end
      object pnlExcel: TPanel
        Left = 199
        Top = 73
        Width = 417
        Height = 165
        BevelOuter = bvNone
        TabOrder = 3
        Visible = False
        object shpExcel: TShape
          Left = 1
          Top = 0
          Width = 414
          Height = 163
          Align = alCustom
          Anchors = [akLeft, akTop, akRight, akBottom]
          Brush.Style = bsClear
        end
        object btnGerarExcel: TSpeedButton
          Left = 376
          Top = 122
          Width = 30
          Height = 33
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            20000000000000040000C40E0000C40E00000000000000000000FFFFFF00FFFF
            FF008E4129968E4129FF8E4129FF8E4129FF8E4129FF8E4129FF8E4129FF8E41
            29FF8E4129FF8E4129FF8E4129FF8E4129FF8E4129FF8E412996FFFFFF00FFFF
            FF0090442BFFFDF7F4FFFDF7F3FFFDF7F3FFFDF7F2FFFDF6F1FFFCF6F1FFFCF5
            F0FFFCF5EFFFFCF4EFFFFBF3EEFFFBF3EDFFFBF2ECFF90442BFF266738FF2667
            38FF266738FF266738FF266738FF266738FF266738FF266738FF266738FF2667
            38FFF6E0CEFFF5DECBFFF4DCC7FFF3D9C3FFFBF1EBFF93482EFF2A6E3CFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2A6E
            3CFFF5DECBFFF4DCC7FFF3D9C3FFF2D6C0FFFBF1EAFF974C31FF2E7642FF6673
            64FF4F7A50FF458A49FF477D48FF548055FF709F72FF4F8151FF527D57FF2E76
            42FFF4DCC7FFF3D9C3FFF2D6C0FFF1D4BCFFFAF1E9FF9A5034FF338049FFFFFF
            FFFF3D793FFF337C33FF397F3AFF7BAD7CFF5A9E5DFF336D33FFFFFFFFFF3380
            49FFF3D9C3FFF2D6C0FFF1D4BBFFF0D2B9FFFAF0E8FF9E5537FF388A50FFFFFF
            FFFFFFFFFFFF498749FF82B37DFF5F9059FF3D803CFF66A365FF80A882FF388A
            50FFF2D6C0FFF1D4BBFFF0D2B8FFF0CFB5FFFAEFE7FFA25A3BFF3C9356FFFFFF
            FFFFFFFFFFFF8FC195FF5A865FFF3C683FFF467D4BFFFFFFFFFFF3FFF9FF3C93
            56FFF1D4BBFFF0D2B8FFF0CFB4FFEFCCB1FFF9EFE7FFA65F3FFF419D5DFFFFFF
            FFFF91B994FF468C4DFF3A733DFF457949FF337636FF3A803EFFFFFFFFFF419D
            5DFFF0D2B8FFF0CFB4FFEFCCB0FFEDCBAEFFF9EEE5FFAA6442FF45A563FF8690
            7DFF61855BFF417C41FFFFFFFFFFFFFFFFFF4D844AFF3B7738FF4C764FFF45A5
            63FFF0CFB4FFEFCCB0FFEDCBADFFECC8AAFFF9EEE5FFAE6946FF49AC67FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF49AC
            67FFF7E7DBFFD29D79FFD29C77FFD5A584FFD4A484FFB26E49FF4BB16BFF4BB1
            6BFF4BB16BFF4BB16BFF4BB16BFF4BB16BFF4BB16BFF4BB16BFF4BB16BFF4BB1
            6BFFF7E7D9FFC07F56FFC07F56FFC07F56FFB5724CFFB5724C96FFFFFF00FFFF
            FF00B9764FFFFBF2ECFFF2D6C0FFF1D4BBFFF0D2B8FFF0CFB4FFEFCCB0FFEDCB
            ADFFF6E5D8FFC07F56FFC07F56FFB9764FFFB9764F96FFFFFF00FFFFFF00FFFF
            FF00BC7A52FFFBF1EBFFF1D4BCFFF0D2B9FFF0CFB5FFEFCCB1FFEDCBAEFFECC8
            AAFFF9EEE5FFC07F56FFBC7A52FFBC7A5296FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00BE7D54FFFBF1EAFFFAF1E9FFFAF0E8FFFAEFE7FFF9EFE7FFF9EEE5FFF9EE
            E5FFF9EDE4FFBE7D54FFBE7D5496FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00C07F5696C07F56FFC07F56FFC07F56FFC07F56FFC07F56FFC07F56FFC07F
            56FFC07F56FFC07F5696FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
          OnClick = btnGerarExcelClick
        end
        object lblLinha: TLabel
          Left = 8
          Top = 96
          Width = 402
          Height = 13
          Caption = 
            '________________________________________________________________' +
            '___'
        end
        object btnFechar: TSpeedButton
          Left = 390
          Top = 4
          Width = 21
          Height = 22
          Caption = 'X'
          Flat = True
          NumGlyphs = 2
          OnClick = btnFecharClick
        end
        object btnRUDEXP: TSpeedButton
          Left = 378
          Top = 40
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
          OnClick = btnRUDEXPClick
        end
        object btnRUDIMP: TSpeedButton
          Left = 378
          Top = 78
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
          OnClick = btnRUDIMPClick
        end
        object lblExcelIMP: TLabel
          Left = 8
          Top = 64
          Width = 126
          Height = 13
          Caption = 'Planilha RUD (Importa'#231#227'o)'
        end
        object lblExcelEXP: TLabel
          Left = 8
          Top = 24
          Width = 127
          Height = 13
          Caption = 'Planilha RUD (Exporta'#231#227'o)'
        end
        object edtExcelIMP: TEdit
          Left = 6
          Top = 80
          Width = 361
          Height = 21
          Enabled = False
          TabOrder = 0
          OnChange = edtExcelIMPChange
        end
        object edtExcelEXP: TEdit
          Left = 6
          Top = 40
          Width = 361
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = edtExcelEXPChange
        end
      end
      object pnlGerarDB: TPanel
        Left = 294
        Top = 99
        Width = 213
        Height = 106
        TabOrder = 4
        Visible = False
        object shpGerarDB: TShape
          Left = 1
          Top = 1
          Width = 211
          Height = 104
          Align = alClient
          Brush.Style = bsClear
        end
        object btnConsulta: TSpeedButton
          Left = 64
          Top = 19
          Width = 23
          Height = 22
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
          OnClick = btnConsultaClick
        end
        object btnFecharDB: TSpeedButton
          Left = 187
          Top = 5
          Width = 21
          Height = 22
          Caption = 'X'
          Flat = True
          NumGlyphs = 2
          OnClick = btnFecharDBClick
        end
        object lbledtEmpresaDB: TLabeledEdit
          Left = 7
          Top = 20
          Width = 53
          Height = 21
          EditLabel.Width = 41
          EditLabel.Height = 13
          EditLabel.Caption = 'Empresa'
          TabOrder = 0
          OnChange = lbledtEmpresaDBChange
          OnExit = lbledtEmpresaDBExit
          OnKeyPress = lbledtEmpresaDBKeyPress
        end
        object edtEmpresaDB: TEdit
          Left = 7
          Top = 48
          Width = 196
          Height = 21
          Color = clMenu
          TabOrder = 1
        end
        object btnGeraDB: TButton
          Left = 128
          Top = 75
          Width = 75
          Height = 25
          Caption = 'Gerar!'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnGeraDBClick
        end
      end
    end
  end
  object pnl_btn_ag: TPanel
    Left = 0
    Top = 0
    Width = 856
    Height = 52
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      856
      52)
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 5
      Width = 39
      Height = 43
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
      OnClick = mi_incluirClick
    end
    object btn_excluir: TSpeedButton
      Left = 122
      Top = 5
      Width = 39
      Height = 43
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
      OnClick = mi_excluirClick
    end
    object btn_sair: TSpeedButton
      Left = 502
      Top = 5
      Width = 39
      Height = 43
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
      OnClick = mi_sairClick
    end
    object btn_salvar: TSpeedButton
      Left = 44
      Top = 5
      Width = 39
      Height = 43
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
      OnClick = mi_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 83
      Top = 5
      Width = 38
      Height = 43
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
      OnClick = mi_cancelarClick
    end
    object btnExcel: TSpeedButton
      Left = 162
      Top = 5
      Width = 39
      Height = 43
      Hint = 'Integrar planilha no sistema'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF6666666666
        6666FF88888888888888FF6FFFFFFFFFFFF6FF8FFFFFFFFFFFF82222222222FF
        88F68888888888FF88F82FFFFFFFF2F888F68FFFFFFFF88888F8222FFFF22288
        88F688888888888888F82F222222F28888F68F888888F88888F82FF2222FF288
        88F68FF88888888888F82FF2222FF28888F68FF88888F88888F82F222222F288
        88F68F888888F88888F82222FF22228888F68888FF88888888F82FFFFFFFF2F8
        88868FFFFFFFF8F888882222222222F666668888888888F88888FF6F888888F6
        6666FF8F888888F8888FFF6F888888F666FFFF8F888888F8888FFF6FFFFFFFF6
        6FFFFF8FFFFFFFF888FFFF6666666666FFFFFF8888888888FFFF}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnExcelClick
    end
    object btnGerarDB: TSpeedButton
      Left = 336
      Top = 5
      Width = 39
      Height = 43
      Hint = 'Gerar Drawback de todos os laudos.'
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000000000090000
        000D0000000F0000000E0000000E0000000F0000000F0000000D0000000E0000
        000E0000000E0000000E0000000E0000000F0000000D00000005000000450000
        0055000000580000005700000057000000570000005800000057000000570000
        005800000057000000570000005700000058000000520000002A0202028A0606
        06B70A0A0AD10A0A0AD10A0A0AD10A0A0AD10A0A0AD10A0A0AD10A0A0AD10A0A
        0AD10A0A0AD10A0A0AD10A0A0AD10A0A0AD1070707B9020202760D0D0D8C484D
        49ED5C5C5CFF5C5C5CFF5C5C5CFF5C5C5CFF5B5B5BFF5B5B5BFF595959FF5757
        57FF575757FF595959FF5A5A5AFF5B5B5BFF4F5F50EF1D291E8F253928B468A0
        71FF639B6BFF629A6AFF629A6AFF629A6BFF619969FF5C9164FF56885EFF5180
        59FF4F7E55FF52835AFF578B60FF5C9063FF659A6CFF283F2DB7212D23B06793
        6EFF608D67FF608D67FF608D67FF608C67FF5B8561FF547C5CFF4D6F53FF4867
        4EFF536E58FF4E6F55FF587D60FF5F8667FF5F8766FF202E23B81C221DAD667C
        6AFF5A725EFF5C7460FF6B8870FF77997EFF7FA288FF75927EFF6F8073FFD1D1
        D0FFC3C5C4FF989F99FF6C7C70FF6B8372FF607765FF1B221DB61E211FAC666E
        67FF718877FF90B199FFAAC9B3FFADC9B4FF98B29EFF6D8572FFA3A8A4FFDBDB
        DBFF646A64FF39423BFFB2B4B2FF9A9E9AFF545C55FF181A18B7212121AB7F90
        84FFAECDB7FFAACCB1FF97C49DFF80B285FF659169FF466748FFC8CAC8FFCCCD
        CCFF263327FF1B271BFFC3C5C4FF898F89FF4F5951FF181818B7242424AB98B4
        9EFF95CC9AFF89C78CFF86BB87FF7AA27BFF637F64FF596659FFDBDBDBFFB2B3
        B2FF2C322DFF757875FFC3C4C3FF676D68FF545B55FF1E1E1EB4252525AB8CBC
        8FFF89B08BFF7F9280FF777F78FF6E706FFF6F6F6FFF6D6D6DFFD0D0D0FF7B7B
        7BFFA2A2A2FFADAEADFF757675FF5A5E5AFF646664FF212121B02A2A2AAB838C
        83FF757575FF797A7AFF7D7E7EFF8D8D8DFF757575FF2E2E2EFF393939FF2020
        20FF373737FF282828FF262626FF343434FF232323E9272727682B2B2BAB8283
        83FF939494FF9A9A9AFF9E9E9EFF939494FF454545FF3E3E3EFF5E5E5EFF5B5C
        5CFF5C5D5DFF626363FF696A6AFF666767F9202020A6000000012D2D2D652B2B
        2BE7424242FF3E3E3EFF3E3E3EFF404040FF4C4C4CFF757575FF5B5B5BEF2929
        29C3212121BC212121BA242424B8252525A52525255AFFFFFF00FFFFFF002A2A
        2AB57F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF555555DC2B2B2BB72828
        2840000000020000000100000001FFFFFF00FFFFFF00FFFFFF00FFFFFF002B2B
        2B6A2C2C2CB52C2C2CB52C2C2CB52C2C2CB52C2C2CB52B2B2B6A24242415FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnGerarDBClick
    end
    object dbnvg: TDBNavigator
      Left = 397
      Top = 14
      Width = 84
      Height = 22
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
    end
    object pnl_pesquisa: TPanel
      Left = 545
      Top = 2
      Width = 309
      Height = 48
      Align = alRight
      BevelInner = bvLowered
      ParentColor = True
      TabOrder = 1
      Visible = False
      object Label1: TLabel
        Left = 12
        Top = 5
        Width = 56
        Height = 13
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 148
        Top = 5
        Width = 37
        Height = 13
        Caption = 'Ordem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_chave: TEdit
        Left = 12
        Top = 20
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
      end
      object cb_ordem: TComboBox
        Left = 148
        Top = 20
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = 'C'#243'digo'
        Items.Strings = (
          'C'#243'digo')
      end
    end
  end
  object dbedtDescr_Merc: TDBEdit
    Left = 572
    Top = 99
    Width = 277
    Height = 21
    DataField = 'NR_DESCR_MERC'
    DataSource = datm_Laudo.ds_Laudo
    TabOrder = 2
    OnChange = dbedtDescr_MercChange
  end
  object menu_cadastro: TMainMenu
    Left = 660
    Top = 72
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      Hint = ' '
      OnClick = mi_incluirClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = mi_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      OnClick = mi_cancelarClick
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Enabled = False
      Hint = ' '
      OnClick = mi_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = mi_sairClick
    end
  end
  object dlgOpenExcel: TOpenDialog
    DefaultExt = 'xls'
    Filter = 'Arquivos do Microsoft Excel 97-2003|*.xls'
    Left = 364
    Top = 92
  end
  object dlgOpenExcelEXP: TOpenDialog
    DefaultExt = 'xls'
    Filter = 'Arquivos do Microsoft Excel 97-2003|*.xls'
    Left = 324
    Top = 84
  end
  object dlgOpenExcelIMP: TOpenDialog
    DefaultExt = 'xls'
    Filter = 'Arquivos do Microsoft Excel 97-2003|*.xls'
    Left = 403
    Top = 85
  end
  object qry_gera_db_exp: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TLAUDO_TECNICO_EXP '
      'WHERE CD_MERCADORIA = :CD_MERCADORIA '
      'ORDER BY CD_MOEDA, CD_NCM_SH, CD_UN_MEDIDA')
    UpdateObject = upd_gera_db_exp
    Left = 132
    Top = 196
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_gera_db_expCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.CD_MERCADORIA'
      FixedChar = True
      Size = 15
    end
    object qry_gera_db_expNR_LAUDO: TStringField
      FieldName = 'NR_LAUDO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.NR_LAUDO'
      FixedChar = True
      Size = 5
    end
    object qry_gera_db_expNR_RE: TStringField
      FieldName = 'NR_RE'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.NR_RE'
      FixedChar = True
      Size = 12
    end
    object qry_gera_db_expDT_EMBARQUE: TStringField
      FieldName = 'DT_EMBARQUE'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.DT_EMBARQUE'
      FixedChar = True
      Size = 8
    end
    object qry_gera_db_expCD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
    object qry_gera_db_expDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.DESCRICAO'
      FixedChar = True
      Size = 255
    end
    object qry_gera_db_expPL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.PL_MERCADORIA'
    end
    object qry_gera_db_expQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.QT_MERCADORIA'
    end
    object qry_gera_db_expCD_UN_MEDIDA: TStringField
      FieldName = 'CD_UN_MEDIDA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.CD_UN_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qry_gera_db_expVL_MLE_ITEM: TFloatField
      FieldName = 'VL_MLE_ITEM'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.VL_MLE_ITEM'
    end
    object qry_gera_db_expCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_gera_db_expVL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.VL_MLE_MNEG'
    end
    object qry_gera_db_expPC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.PC_COMISSAO'
    end
    object qry_gera_db_expVL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.VL_COMISSAO'
    end
    object qry_gera_db_expVL_MLE_ITEM_MN: TFloatField
      FieldName = 'VL_MLE_ITEM_MN'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.VL_MLE_ITEM_MN'
    end
    object qry_gera_db_expVL_ENQUADRAMENTO: TFloatField
      FieldName = 'VL_ENQUADRAMENTO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.VL_ENQUADRAMENTO'
    end
    object qry_gera_db_expPL_MERCADORIA_ORIGINAL: TFloatField
      FieldName = 'PL_MERCADORIA_ORIGINAL'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.PL_MERCADORIA_ORIGINAL'
    end
    object qry_gera_db_expQT_MERCADORIA_ORIGINAL: TFloatField
      FieldName = 'QT_MERCADORIA_ORIGINAL'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.QT_MERCADORIA_ORIGINAL'
    end
    object qry_gera_db_expVL_MLE_ITEM_ORIGINAL: TFloatField
      FieldName = 'VL_MLE_ITEM_ORIGINAL'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.VL_MLE_ITEM_ORIGINAL'
    end
  end
  object qry_gera_db_imp: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TLAUDO_TECNICO_IMP'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA'
      'ORDER BY CD_MOEDA, CD_NCM_SH, CD_UN_MEDIDA')
    UpdateObject = upd_gera_db_imp
    Left = 692
    Top = 196
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_gera_db_impCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.CD_MERCADORIA'
      FixedChar = True
      Size = 15
    end
    object qry_gera_db_impNR_LAUDO: TStringField
      FieldName = 'NR_LAUDO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.NR_LAUDO'
      FixedChar = True
      Size = 5
    end
    object qry_gera_db_impCD_MAT_PRI: TStringField
      FieldName = 'CD_MAT_PRI'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.CD_MAT_PRI'
      FixedChar = True
      Size = 15
    end
    object qry_gera_db_impNR_DI: TStringField
      FieldName = 'NR_DI'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.NR_DI'
      FixedChar = True
      Size = 10
    end
    object qry_gera_db_impNR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.NR_ADICAO'
      FixedChar = True
      Size = 3
    end
    object qry_gera_db_impNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_gera_db_impDT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.DT_REGISTRO_DI'
      FixedChar = True
      Size = 8
    end
    object qry_gera_db_impDT_DESEMBARACO: TStringField
      FieldName = 'DT_DESEMBARACO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.DT_DESEMBARACO'
      FixedChar = True
      Size = 8
    end
    object qry_gera_db_impCD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
    object qry_gera_db_impDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.DESCRICAO'
      FixedChar = True
      Size = 255
    end
    object qry_gera_db_impPL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.PL_MERCADORIA'
    end
    object qry_gera_db_impQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.QT_MERCADORIA'
    end
    object qry_gera_db_impCD_UN_MEDIDA: TStringField
      FieldName = 'CD_UN_MEDIDA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.CD_UN_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qry_gera_db_impVL_MLE_ITEM: TFloatField
      FieldName = 'VL_MLE_ITEM'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_MLE_ITEM'
    end
    object qry_gera_db_impCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_gera_db_impVL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_MLE_MNEG'
    end
    object qry_gera_db_impVL_FRETE_MNEG: TFloatField
      FieldName = 'VL_FRETE_MNEG'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_FRETE_MNEG'
    end
    object qry_gera_db_impVL_SEGURO_MNEG: TFloatField
      FieldName = 'VL_SEGURO_MNEG'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_SEGURO_MNEG'
    end
    object qry_gera_db_impVL_TAXA_X: TFloatField
      FieldName = 'VL_TAXA_X'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_TAXA_X'
    end
    object qry_gera_db_impVL_TAXA_DOLAR: TFloatField
      FieldName = 'VL_TAXA_DOLAR'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_TAXA_DOLAR'
    end
    object qry_gera_db_impPL_MERCADORIA_ORIGINAL: TFloatField
      FieldName = 'PL_MERCADORIA_ORIGINAL'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.PL_MERCADORIA_ORIGINAL'
    end
    object qry_gera_db_impQT_MERCADORIA_ORIGINAL: TFloatField
      FieldName = 'QT_MERCADORIA_ORIGINAL'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.QT_MERCADORIA_ORIGINAL'
    end
    object qry_gera_db_impVL_MLE_ITEM_ORIGINAL: TFloatField
      FieldName = 'VL_MLE_ITEM_ORIGINAL'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_MLE_ITEM_ORIGINAL'
    end
  end
  object upd_gera_db_exp: TUpdateSQL
    ModifySQL.Strings = (
      'update TLAUDO_TECNICO_EXP'
      'set'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  NR_LAUDO = :NR_LAUDO,'
      '  NR_RE = :NR_RE,'
      '  DT_EMBARQUE = :DT_EMBARQUE,'
      '  CD_NCM_SH = :CD_NCM_SH,'
      '  DESCRICAO = :DESCRICAO,'
      '  PL_MERCADORIA = :PL_MERCADORIA,'
      '  QT_MERCADORIA = :QT_MERCADORIA,'
      '  CD_UN_MEDIDA = :CD_UN_MEDIDA,'
      '  VL_MLE_ITEM = :VL_MLE_ITEM,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  VL_MLE_MNEG = :VL_MLE_MNEG,'
      '  PC_COMISSAO = :PC_COMISSAO,'
      '  VL_COMISSAO = :VL_COMISSAO,'
      '  VL_MLE_ITEM_MN = :VL_MLE_ITEM_MN,'
      '  VL_ENQUADRAMENTO = :VL_ENQUADRAMENTO,'
      '  PL_MERCADORIA_ORIGINAL = :PL_MERCADORIA_ORIGINAL,'
      '  QT_MERCADORIA_ORIGINAL = :QT_MERCADORIA_ORIGINAL,'
      '  VL_MLE_ITEM_ORIGINAL = :VL_MLE_ITEM_ORIGINAL'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LAUDO = :OLD_NR_LAUDO and'
      '  NR_RE = :OLD_NR_RE and'
      '  DT_EMBARQUE = :OLD_DT_EMBARQUE and'
      '  CD_NCM_SH = :OLD_CD_NCM_SH and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  PL_MERCADORIA = :OLD_PL_MERCADORIA and'
      '  QT_MERCADORIA = :OLD_QT_MERCADORIA and'
      '  CD_UN_MEDIDA = :OLD_CD_UN_MEDIDA and'
      '  VL_MLE_ITEM = :OLD_VL_MLE_ITEM and'
      '  CD_MOEDA = :OLD_CD_MOEDA and'
      '  VL_MLE_MNEG = :OLD_VL_MLE_MNEG and'
      '  PC_COMISSAO = :OLD_PC_COMISSAO and'
      '  VL_COMISSAO = :OLD_VL_COMISSAO and'
      '  VL_MLE_ITEM_MN = :OLD_VL_MLE_ITEM_MN and'
      '  VL_ENQUADRAMENTO = :OLD_VL_ENQUADRAMENTO and'
      '  PL_MERCADORIA_ORIGINAL = :OLD_PL_MERCADORIA_ORIGINAL and'
      '  QT_MERCADORIA_ORIGINAL = :OLD_QT_MERCADORIA_ORIGINAL and'
      '  VL_MLE_ITEM_ORIGINAL = :OLD_VL_MLE_ITEM_ORIGINAL')
    InsertSQL.Strings = (
      'insert into TLAUDO_TECNICO_EXP'
      
        '  (CD_MERCADORIA, NR_LAUDO, NR_RE, DT_EMBARQUE, CD_NCM_SH, DESCR' +
        'ICAO, PL_MERCADORIA, '
      
        '   QT_MERCADORIA, CD_UN_MEDIDA, VL_MLE_ITEM, CD_MOEDA, VL_MLE_MN' +
        'EG, PC_COMISSAO, '
      
        '   VL_COMISSAO, VL_MLE_ITEM_MN, VL_ENQUADRAMENTO, PL_MERCADORIA_' +
        'ORIGINAL, '
      '   QT_MERCADORIA_ORIGINAL, VL_MLE_ITEM_ORIGINAL)'
      'values'
      
        '  (:CD_MERCADORIA, :NR_LAUDO, :NR_RE, :DT_EMBARQUE, :CD_NCM_SH, ' +
        ':DESCRICAO, '
      
        '   :PL_MERCADORIA, :QT_MERCADORIA, :CD_UN_MEDIDA, :VL_MLE_ITEM, ' +
        ':CD_MOEDA, '
      
        '   :VL_MLE_MNEG, :PC_COMISSAO, :VL_COMISSAO, :VL_MLE_ITEM_MN, :V' +
        'L_ENQUADRAMENTO, '
      
        '   :PL_MERCADORIA_ORIGINAL, :QT_MERCADORIA_ORIGINAL, :VL_MLE_ITE' +
        'M_ORIGINAL)')
    DeleteSQL.Strings = (
      'delete from TLAUDO_TECNICO_EXP'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LAUDO = :OLD_NR_LAUDO and'
      '  NR_RE = :OLD_NR_RE and'
      '  DT_EMBARQUE = :OLD_DT_EMBARQUE and'
      '  CD_NCM_SH = :OLD_CD_NCM_SH and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  PL_MERCADORIA = :OLD_PL_MERCADORIA and'
      '  QT_MERCADORIA = :OLD_QT_MERCADORIA and'
      '  CD_UN_MEDIDA = :OLD_CD_UN_MEDIDA and'
      '  VL_MLE_ITEM = :OLD_VL_MLE_ITEM and'
      '  CD_MOEDA = :OLD_CD_MOEDA and'
      '  VL_MLE_MNEG = :OLD_VL_MLE_MNEG and'
      '  PC_COMISSAO = :OLD_PC_COMISSAO and'
      '  VL_COMISSAO = :OLD_VL_COMISSAO and'
      '  VL_MLE_ITEM_MN = :OLD_VL_MLE_ITEM_MN and'
      '  VL_ENQUADRAMENTO = :OLD_VL_ENQUADRAMENTO and'
      '  PL_MERCADORIA_ORIGINAL = :OLD_PL_MERCADORIA_ORIGINAL and'
      '  QT_MERCADORIA_ORIGINAL = :OLD_QT_MERCADORIA_ORIGINAL and'
      '  VL_MLE_ITEM_ORIGINAL = :OLD_VL_MLE_ITEM_ORIGINAL')
    Left = 132
    Top = 228
  end
  object upd_gera_db_imp: TUpdateSQL
    ModifySQL.Strings = (
      'update TLAUDO_TECNICO_IMP'
      'set'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  NR_LAUDO = :NR_LAUDO,'
      '  CD_MAT_PRI = :CD_MAT_PRI,'
      '  NR_DI = :NR_DI,'
      '  NR_ADICAO = :NR_ADICAO,'
      '  NR_ITEM = :NR_ITEM,'
      '  DT_REGISTRO_DI = :DT_REGISTRO_DI,'
      '  DT_DESEMBARACO = :DT_DESEMBARACO,'
      '  CD_NCM_SH = :CD_NCM_SH,'
      '  DESCRICAO = :DESCRICAO,'
      '  PL_MERCADORIA = :PL_MERCADORIA,'
      '  QT_MERCADORIA = :QT_MERCADORIA,'
      '  CD_UN_MEDIDA = :CD_UN_MEDIDA,'
      '  VL_MLE_ITEM = :VL_MLE_ITEM,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  VL_MLE_MNEG = :VL_MLE_MNEG,'
      '  VL_FRETE_MNEG = :VL_FRETE_MNEG,'
      '  VL_SEGURO_MNEG = :VL_SEGURO_MNEG,'
      '  VL_TAXA_X = :VL_TAXA_X,'
      '  VL_TAXA_DOLAR = :VL_TAXA_DOLAR,'
      '  PL_MERCADORIA_ORIGINAL = :PL_MERCADORIA_ORIGINAL,'
      '  QT_MERCADORIA_ORIGINAL = :QT_MERCADORIA_ORIGINAL,'
      '  VL_MLE_ITEM_ORIGINAL = :VL_MLE_ITEM_ORIGINAL'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LAUDO = :OLD_NR_LAUDO and'
      '  CD_MAT_PRI = :OLD_CD_MAT_PRI and'
      '  NR_DI = :OLD_NR_DI and'
      '  NR_ADICAO = :OLD_NR_ADICAO and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  DT_REGISTRO_DI = :OLD_DT_REGISTRO_DI and'
      '  DT_DESEMBARACO = :OLD_DT_DESEMBARACO and'
      '  CD_NCM_SH = :OLD_CD_NCM_SH and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  PL_MERCADORIA = :OLD_PL_MERCADORIA and'
      '  QT_MERCADORIA = :OLD_QT_MERCADORIA and'
      '  CD_UN_MEDIDA = :OLD_CD_UN_MEDIDA and'
      '  VL_MLE_ITEM = :OLD_VL_MLE_ITEM and'
      '  CD_MOEDA = :OLD_CD_MOEDA and'
      '  VL_MLE_MNEG = :OLD_VL_MLE_MNEG and'
      '  VL_FRETE_MNEG = :OLD_VL_FRETE_MNEG and'
      '  VL_SEGURO_MNEG = :OLD_VL_SEGURO_MNEG and'
      '  VL_TAXA_X = :OLD_VL_TAXA_X and'
      '  VL_TAXA_DOLAR = :OLD_VL_TAXA_DOLAR and'
      '  PL_MERCADORIA_ORIGINAL = :OLD_PL_MERCADORIA_ORIGINAL and'
      '  QT_MERCADORIA_ORIGINAL = :OLD_QT_MERCADORIA_ORIGINAL and'
      '  VL_MLE_ITEM_ORIGINAL = :OLD_VL_MLE_ITEM_ORIGINAL')
    InsertSQL.Strings = (
      'insert into TLAUDO_TECNICO_IMP'
      
        '  (CD_MERCADORIA, NR_LAUDO, CD_MAT_PRI, NR_DI, NR_ADICAO, NR_ITE' +
        'M, DT_REGISTRO_DI, '
      
        '   DT_DESEMBARACO, CD_NCM_SH, DESCRICAO, PL_MERCADORIA, QT_MERCA' +
        'DORIA, '
      
        '   CD_UN_MEDIDA, VL_MLE_ITEM, CD_MOEDA, VL_MLE_MNEG, VL_FRETE_MN' +
        'EG, VL_SEGURO_MNEG, '
      
        '   VL_TAXA_X, VL_TAXA_DOLAR, PL_MERCADORIA_ORIGINAL, QT_MERCADOR' +
        'IA_ORIGINAL, '
      '   VL_MLE_ITEM_ORIGINAL)'
      'values'
      
        '  (:CD_MERCADORIA, :NR_LAUDO, :CD_MAT_PRI, :NR_DI, :NR_ADICAO, :' +
        'NR_ITEM, '
      
        '   :DT_REGISTRO_DI, :DT_DESEMBARACO, :CD_NCM_SH, :DESCRICAO, :PL' +
        '_MERCADORIA, '
      
        '   :QT_MERCADORIA, :CD_UN_MEDIDA, :VL_MLE_ITEM, :CD_MOEDA, :VL_M' +
        'LE_MNEG, '
      
        '   :VL_FRETE_MNEG, :VL_SEGURO_MNEG, :VL_TAXA_X, :VL_TAXA_DOLAR, ' +
        ':PL_MERCADORIA_ORIGINAL, '
      '   :QT_MERCADORIA_ORIGINAL, :VL_MLE_ITEM_ORIGINAL)')
    DeleteSQL.Strings = (
      'delete from TLAUDO_TECNICO_IMP'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LAUDO = :OLD_NR_LAUDO and'
      '  CD_MAT_PRI = :OLD_CD_MAT_PRI and'
      '  NR_DI = :OLD_NR_DI and'
      '  NR_ADICAO = :OLD_NR_ADICAO and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  DT_REGISTRO_DI = :OLD_DT_REGISTRO_DI and'
      '  DT_DESEMBARACO = :OLD_DT_DESEMBARACO and'
      '  CD_NCM_SH = :OLD_CD_NCM_SH and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  PL_MERCADORIA = :OLD_PL_MERCADORIA and'
      '  QT_MERCADORIA = :OLD_QT_MERCADORIA and'
      '  CD_UN_MEDIDA = :OLD_CD_UN_MEDIDA and'
      '  VL_MLE_ITEM = :OLD_VL_MLE_ITEM and'
      '  CD_MOEDA = :OLD_CD_MOEDA and'
      '  VL_MLE_MNEG = :OLD_VL_MLE_MNEG and'
      '  VL_FRETE_MNEG = :OLD_VL_FRETE_MNEG and'
      '  VL_SEGURO_MNEG = :OLD_VL_SEGURO_MNEG and'
      '  VL_TAXA_X = :OLD_VL_TAXA_X and'
      '  VL_TAXA_DOLAR = :OLD_VL_TAXA_DOLAR and'
      '  PL_MERCADORIA_ORIGINAL = :OLD_PL_MERCADORIA_ORIGINAL and'
      '  QT_MERCADORIA_ORIGINAL = :OLD_QT_MERCADORIA_ORIGINAL and'
      '  VL_MLE_ITEM_ORIGINAL = :OLD_VL_MLE_ITEM_ORIGINAL')
    Left = 692
    Top = 228
  end
end
