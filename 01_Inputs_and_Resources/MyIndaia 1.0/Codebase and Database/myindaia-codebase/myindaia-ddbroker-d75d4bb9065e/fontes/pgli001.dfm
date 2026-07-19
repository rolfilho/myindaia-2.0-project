object frm_LI_capa: Tfrm_LI_capa
  Left = 281
  Top = 227
  Width = 765
  Height = 587
  BorderIcons = [biSystemMenu]
  Caption = 'Licen'#231'a de Importa'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_manut_cadastro
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_capa_li: TPageControl
    Left = 0
    Top = 49
    Width = 749
    Height = 480
    ActivePage = ts_basicas
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MultiLine = True
    ParentFont = False
    TabOrder = 1
    OnChange = pgctrl_capa_liChange
    OnChanging = pgctrl_capa_liChanging
    object ts_basicas: TTabSheet
      Caption = '&B'#225'sicas'
      object lbl_importador: TLabel
        Left = 11
        Top = 125
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
        Left = 485
        Top = 121
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
        OnClick = btn_co_importadorClick
      end
      object lbl_nr_registro_li: TLabel
        Left = 12
        Top = 90
        Width = 66
        Height = 13
        Caption = 'N'#186' Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dt_registro_li: TLabel
        Left = 280
        Top = 90
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
        Left = 281
        Top = 17
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
        Left = 485
        Top = 157
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
        OnClick = btn_co_pais_procClick
      end
      object lbl_urf_despacho1: TLabel
        Left = 11
        Top = 190
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
        Left = 485
        Top = 193
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
        OnClick = btn_co_urf_despachoClick
      end
      object Label23: TLabel
        Left = 12
        Top = 227
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
        Left = 485
        Top = 230
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
        OnClick = btn_co_urf_entradaClick
      end
      object Label21: TLabel
        Left = 11
        Top = 154
        Width = 72
        Height = 26
        Caption = 'Pa'#237's de Proced'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object lbl_nr_processo_basica: TLabel
        Left = 11
        Top = 16
        Width = 71
        Height = 13
        Caption = 'N'#186' Processo'
      end
      object db_lbl_ident_siscomex: TDBText
        Left = 11
        Top = 418
        Width = 141
        Height = 17
        Color = clBtnFace
        DataField = 'NR_IDENT_TRANSMISSAO'
        DataSource = datm_LI_Capa.ds_li
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label1: TLabel
        Left = 11
        Top = 402
        Width = 142
        Height = 13
        Caption = 'Identifica'#231#227'o SISCOMEX'
      end
      object Label3: TLabel
        Left = 199
        Top = 402
        Width = 120
        Height = 13
        Caption = 'Data da Transmiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object db_lbl_dt_transmissao: TDBText
        Left = 199
        Top = 418
        Width = 133
        Height = 17
        Color = clBtnFace
        DataField = 'DT_TRANSMISSAO'
        DataSource = datm_LI_Capa.ds_li
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object btn_registra_li: TSpeedButton
        Left = 372
        Top = 403
        Width = 134
        Height = 27
        Hint = 'Registra LI (SISCOMEX)'
        Caption = 'Registrar LI'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_registra_liClick
      end
      object lbl_info_comp: TLabel
        Left = 12
        Top = 256
        Width = 166
        Height = 13
        Caption = 'Informa'#231#245'es Complementares'
      end
      object btn_co_obs: TSpeedButton
        Left = 188
        Top = 252
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
        OnClick = btn_co_obsClick
      end
      object dbedt_nr_registro_li: TDBEdit
        Left = 95
        Top = 86
        Width = 109
        Height = 21
        DataField = 'NR_REGISTRO_LI'
        DataSource = datm_LI_Capa.ds_li
        TabOrder = 2
      end
      object dbedt_dt_registro_li: TDBEdit
        Left = 375
        Top = 86
        Width = 109
        Height = 21
        DataField = 'DT_REGISTRO_LI'
        DataSource = datm_LI_Capa.ds_li
        TabOrder = 3
      end
      object dbedt_dt_li: TDBEdit
        Left = 375
        Top = 13
        Width = 109
        Height = 21
        DataField = 'DT_PROCESSO_LI'
        DataSource = datm_LI_Capa.ds_li
        TabOrder = 1
      end
      object dbgrd_ref: TDBGrid
        Left = 528
        Top = 12
        Width = 193
        Height = 253
        TabStop = False
        DataSource = datm_LI_Capa.ds_ref_cli_
        Enabled = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnKeyDown = dbgrd_refKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_REFERENCIA'
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
            FieldName = 'NR_ITEM_PO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 43
            Visible = True
          end>
      end
      object dbedt_nm_importador: TEdit
        Left = 154
        Top = 121
        Width = 330
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_nm_pais_proc: TEdit
        Left = 154
        Top = 157
        Width = 330
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 8
      end
      object dbedt_nm_urf_entrada: TEdit
        Left = 154
        Top = 230
        Width = 330
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 12
      end
      object dbedt_nm_urf_despacho: TEdit
        Left = 154
        Top = 193
        Width = 330
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 10
      end
      object dbedt_cd_importador: TDBEdit
        Left = 94
        Top = 121
        Width = 60
        Height = 21
        DataField = 'CD_IMPORTADOR'
        DataSource = datm_LI_Capa.ds_li
        TabOrder = 5
        OnChange = btn_co_importadorClick
        OnExit = dbedt_cd_importadorExit
        OnKeyDown = dbedt_cd_importadorKeyDown
      end
      object dbedt_cd_pais_proc: TDBEdit
        Left = 94
        Top = 157
        Width = 60
        Height = 21
        DataField = 'CD_PAIS_PROCEDENCIA'
        DataSource = datm_LI_Capa.ds_li
        TabOrder = 7
        OnChange = btn_co_pais_procClick
        OnExit = dbedt_cd_pais_procExit
        OnKeyDown = dbedt_cd_importadorKeyDown
      end
      object dbedt_cd_urf_despacho: TDBEdit
        Left = 94
        Top = 193
        Width = 60
        Height = 21
        DataField = 'CD_URF_DESPACHO'
        DataSource = datm_LI_Capa.ds_li
        TabOrder = 9
        OnChange = btn_co_urf_despachoClick
        OnExit = dbedt_cd_urf_despachoExit
        OnKeyDown = dbedt_cd_importadorKeyDown
      end
      object dbedt_cd_urf_entrada: TDBEdit
        Left = 94
        Top = 230
        Width = 60
        Height = 21
        DataField = 'CD_URF_ENTRADA'
        DataSource = datm_LI_Capa.ds_li
        TabOrder = 11
        OnChange = btn_co_urf_entradaClick
        OnExit = dbedt_cd_urf_entradaExit
        OnKeyDown = dbedt_cd_importadorKeyDown
      end
      object dbedt_nr_processo_basica: TDBEdit
        Left = 95
        Top = 13
        Width = 109
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'calc_nr_proc'
        DataSource = datm_LI.ds_li
        ReadOnly = True
        TabOrder = 0
      end
      object dbmemo_info_complementares: TDBMemo
        Left = 12
        Top = 279
        Width = 709
        Height = 110
        DataField = 'TX_INFO_COMPLEMENTAR'
        DataSource = datm_LI_Capa.ds_li
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 13
        OnKeyDown = dbedt_cd_importadorKeyDown
      end
    end
    object ts_negociacao: TTabSheet
      Caption = '&Negocia'#231#227'o'
      object bvl_negociacao: TBevel
        Left = 0
        Top = 0
        Width = 741
        Height = 452
        Align = alClient
        Shape = bsFrame
        Style = bsRaised
      end
      object lbl_nr_processo_negoc: TLabel
        Left = 11
        Top = 16
        Width = 71
        Height = 13
        Caption = 'N'#186' Processo'
      end
      object gbox_reg_trib: TGroupBox
        Left = 10
        Top = 40
        Width = 707
        Height = 85
        Caption = 'Regime de Tributa'#231#227'o'
        TabOrder = 1
        object lbl_fund: TLabel
          Left = 12
          Top = 57
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
        object btn_co_fund_legal: TSpeedButton
          Left = 546
          Top = 53
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
          OnClick = btn_co_fund_legalClick
        end
        object Label2: TLabel
          Left = 12
          Top = 29
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
        object btn_co_reg_trib: TSpeedButton
          Left = 546
          Top = 25
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
          OnClick = btn_co_reg_tribClick
        end
        object dbedt_nm_fund_legal: TEdit
          Left = 128
          Top = 53
          Width = 416
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nm_reg_trib: TEdit
          Left = 128
          Top = 25
          Width = 416
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_reg_trib: TDBEdit
          Left = 84
          Top = 25
          Width = 45
          Height = 21
          DataField = 'CD_REGIME_TRIBUTACAO'
          DataSource = datm_LI_Capa.ds_li
          TabOrder = 0
          OnChange = btn_co_reg_tribClick
          OnExit = dbedt_cd_reg_tribExit
          OnKeyDown = dbedt_cd_importadorKeyDown
        end
        object dbedt_cd_fund_legal: TDBEdit
          Left = 84
          Top = 53
          Width = 45
          Height = 21
          DataField = 'CD_FUND_LEGAL'
          DataSource = datm_LI_Capa.ds_li
          TabOrder = 2
          OnChange = btn_co_fund_legalClick
          OnExit = dbedt_cd_fund_legalExit
          OnKeyDown = dbedt_cd_importadorKeyDown
        end
      end
      object gbox_acordo_tar: TGroupBox
        Left = 10
        Top = 133
        Width = 707
        Height = 53
        Caption = 'Acordo Tarif'#225'rio'
        TabOrder = 2
        object lbl_tipo: TLabel
          Left = 13
          Top = 24
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
          Top = 17
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
        object btn_co_acordo: TSpeedButton
          Left = 546
          Top = 20
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
          OnClick = btn_co_acordoClick
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
          ListSource = datm_LI_Capa.ds_tp_acordo_tarif
          TabOrder = 0
          OnEnter = dblkcbox_acordo_tarifEnter
          OnExit = dblkcbox_acordo_tarifExit
        end
        object dbedt_nm_acordo_aladi: TEdit
          Left = 288
          Top = 20
          Width = 256
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_cd_acordo_aladi: TDBEdit
          Left = 244
          Top = 20
          Width = 45
          Height = 21
          DataField = 'CD_ACORDO_ALADI'
          DataSource = datm_LI_Capa.ds_li
          TabOrder = 1
          OnChange = btn_co_acordoClick
          OnExit = dbedt_cd_acordo_aladiExit
          OnKeyDown = dbedt_cd_importadorKeyDown
        end
      end
      object gbox_cobertura_cambial: TGroupBox
        Left = 10
        Top = 195
        Width = 713
        Height = 170
        Caption = ' Cobertura Cambial'
        TabOrder = 3
        TabStop = True
        object btn_co_motivo: TSpeedButton
          Left = 546
          Top = 134
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
          OnClick = btn_co_motivoClick
        end
        object lbl_motivo: TLabel
          Left = 11
          Top = 135
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
          Left = 11
          Top = 79
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
          Left = 546
          Top = 75
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
          OnClick = btn_co_modalidadeClick
        end
        object lbl_qtde: TLabel
          Left = 11
          Top = 108
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
          Left = 546
          Top = 104
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
        end
        object lbl_instituicao: TLabel
          Left = 185
          Top = 101
          Width = 64
          Height = 26
          Caption = 'Institui'#231#227'o Financeira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object dbrg_cobertura_cambial: TDBRadioGroup
          Left = 9
          Top = 19
          Width = 696
          Height = 39
          Color = clBtnFace
          Columns = 4
          Ctl3D = False
          DataField = 'TP_CAMBIO'
          DataSource = datm_LI_Capa.ds_li
          DragCursor = crDefault
          Items.Strings = (
            'A&t'#233' 180 dias'
            '&De 180 a 360 dias'
            '&Acima de 360 dias'
            'Sem C&obertura')
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 0
          TabStop = True
          Values.Strings = (
            '1'
            '2'
            '3'
            '4')
          OnClick = dbrg_cobertura_cambialClick
        end
        object dbedt_nm_modalidade_pag: TEdit
          Left = 175
          Top = 75
          Width = 369
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_nm_mot_sem_cobert: TEdit
          Left = 175
          Top = 134
          Width = 369
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_nm_instituicao_financ: TEdit
          Left = 295
          Top = 104
          Width = 249
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_cd_modalidade_pag: TDBEdit
          Left = 131
          Top = 75
          Width = 45
          Height = 21
          DataField = 'CD_MOD_PAGAMENTO'
          DataSource = datm_LI_Capa.ds_li
          TabOrder = 1
          OnChange = btn_co_modalidadeClick
          OnExit = dbedt_cd_modalidade_pagExit
          OnKeyDown = dbedt_cd_importadorKeyDown
        end
        object dbedt_qtde_dias_pag: TDBEdit
          Left = 131
          Top = 104
          Width = 45
          Height = 21
          DataField = 'QT_DIAS_COBERTURA'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 3
          TabOrder = 3
        end
        object dbedt_cd_mot_sem_cobert: TDBEdit
          Left = 131
          Top = 134
          Width = 45
          Height = 21
          DataField = 'CD_MOT_SEM_COBERTURA'
          DataSource = datm_LI_Capa.ds_li
          TabOrder = 6
          OnChange = btn_co_motivoClick
          OnExit = dbedt_cd_mot_sem_cobertExit
          OnKeyDown = dbedt_cd_importadorKeyDown
        end
        object dbedt_cd_instituicao_financ: TDBEdit
          Left = 251
          Top = 104
          Width = 45
          Height = 21
          DataField = 'CD_INSTITUICAO_FINANC'
          DataSource = datm_LI_Capa.ds_li
          TabOrder = 4
          OnExit = dbedt_cd_instituicao_financExit
          OnKeyDown = dbedt_cd_importadorKeyDown
        end
      end
      object dbedt_nr_processo_negoc: TDBEdit
        Left = 95
        Top = 13
        Width = 109
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'calc_nr_proc'
        DataSource = datm_LI.ds_li
        ReadOnly = True
        TabOrder = 0
      end
    end
    object ts_totais: TTabSheet
      Caption = '&Totais'
      object bvl_totais: TBevel
        Left = 0
        Top = 0
        Width = 741
        Height = 452
        Align = alClient
        Shape = bsFrame
        Style = bsRaised
      end
      object Label14: TLabel
        Left = 331
        Top = 7
        Width = 102
        Height = 13
        Caption = 'Peso L'#237'quido (kg)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 150
        Top = 7
        Width = 146
        Height = 13
        Caption = 'Qt. na Medida Estat'#237'stica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        WordWrap = True
      end
      object lbl_nr_processo_total: TLabel
        Left = 11
        Top = 7
        Width = 71
        Height = 13
        Caption = 'N'#186' Processo'
      end
      object lblOpcoesNacionalizacao: TLabel
        Left = 349
        Top = 224
        Width = 153
        Height = 13
        Caption = 'Op'#231#245'es de Nacionaliza'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object grpbox_1: TGroupBox
        Left = 10
        Top = 57
        Width = 713
        Height = 87
        Caption = 'Valor Total das Mercadorias no Local de Embarque'
        TabOrder = 3
        object lbl_moeda_mle1: TLabel
          Left = 8
          Top = 25
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
        object btn_co_moeda_mle: TSpeedButton
          Left = 453
          Top = 23
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
        object lbl_vl_moeda_mle1: TLabel
          Left = 533
          Top = 25
          Width = 34
          Height = 13
          Caption = 'VMLE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_incoterm: TLabel
          Left = 10
          Top = 57
          Width = 50
          Height = 13
          Caption = 'Incoterm'
        end
        object btn_co_incoterm: TSpeedButton
          Left = 453
          Top = 53
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
        object Label4: TLabel
          Left = 519
          Top = 55
          Width = 51
          Height = 13
          Caption = 'Qtd. (kg)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_moeda_mle: TDBEdit
          Left = 575
          Top = 20
          Width = 125
          Height = 21
          DataField = 'VL_TOTAL_MOEDA'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 20
          TabOrder = 2
        end
        object dbedt_nm_moeda_mle: TEdit
          Left = 128
          Top = 23
          Width = 321
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_moeda_mle: TDBEdit
          Left = 66
          Top = 23
          Width = 60
          Height = 21
          DataField = 'CD_MOEDA_MLE'
          DataSource = datm_LI_Capa.ds_li
          TabOrder = 0
          OnChange = btn_co_moeda_mleClick
          OnExit = dbedt_cd_moeda_mleExit
          OnKeyDown = dbedt_cd_importadorKeyDown
        end
        object dbedt_nm_incoterm: TEdit
          Left = 128
          Top = 53
          Width = 321
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_cd_incoterm: TDBEdit
          Left = 66
          Top = 53
          Width = 60
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_INCOTERM'
          DataSource = datm_LI_Capa.ds_li
          TabOrder = 5
          OnChange = btn_co_incotermClick
          OnKeyDown = dbedt_cd_importadorKeyDown
        end
        object DBEdit1: TDBEdit
          Left = 577
          Top = 48
          Width = 125
          Height = 21
          Color = clMenu
          DataField = 'QT_MED_ESTATISTICA'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 20
          ReadOnly = True
          TabOrder = 3
        end
      end
      object grpbox_2: TGroupBox
        Left = 10
        Top = 149
        Width = 713
        Height = 68
        Caption = 'Frete '
        TabOrder = 4
        object lbl_moeda_frete1: TLabel
          Left = 8
          Top = 24
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
        object btn_co_moeda_frete: TSpeedButton
          Left = 423
          Top = 20
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
        object lbl_vl_frete_li: TLabel
          Left = 478
          Top = 24
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
        object Label5: TLabel
          Left = 403
          Top = 48
          Width = 165
          Height = 13
          Caption = 'Valor na Moeda (Mercadoria)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_moeda_frete_li: TDBEdit
          Left = 575
          Top = 20
          Width = 125
          Height = 21
          DataField = 'VL_FRETE_MOEDA'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 20
          TabOrder = 2
        end
        object dbedt_nm_moeda_frete: TEdit
          Left = 100
          Top = 20
          Width = 321
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_moeda_frete: TDBEdit
          Left = 56
          Top = 20
          Width = 45
          Height = 21
          DataField = 'CD_MOEDA_FRETE'
          DataSource = datm_LI_Capa.ds_li
          TabOrder = 0
          OnChange = btn_co_moeda_freteClick
          OnExit = dbedt_cd_moeda_freteExit
          OnKeyDown = dbedt_cd_importadorKeyDown
        end
        object dbchk_embut_frete: TDBCheckBox
          Left = 8
          Top = 47
          Width = 129
          Height = 17
          Caption = 'Embutido nos itens'
          Ctl3D = True
          DataField = 'IN_EMBUT_FRT_ITENS'
          DataSource = datm_LI_Capa.ds_li
          ParentCtl3D = False
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbedtvl_frete_moeda_merc: TDBEdit
          Left = 575
          Top = 44
          Width = 125
          Height = 21
          Color = clMenu
          DataField = 'VL_FRETE_MOEDA_MERC'
          DataSource = datm_LI_Capa.ds_li
          MaxLength = 20
          ReadOnly = True
          TabOrder = 4
        end
      end
      object dbedt_qtde_peso_liquido: TDBEdit
        Left = 329
        Top = 25
        Width = 125
        Height = 21
        DataField = 'QT_TOTAL_PES_LIQ'
        DataSource = datm_LI_Capa.ds_li
        MaxLength = 20
        TabOrder = 2
      end
      object dbedt_qtde_medida_estatistica: TDBEdit
        Left = 150
        Top = 25
        Width = 121
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'QT_MED_ESTATISTICA'
        DataSource = datm_LI_Capa.ds_li
        Enabled = False
        MaxLength = 20
        ReadOnly = True
        TabOrder = 1
        Visible = False
      end
      object dbg_docto_vinc: TDBGrid
        Left = 10
        Top = 303
        Width = 713
        Height = 126
        DataSource = datm_LI_Capa.ds_anuentes
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'ORGAO'
            Title.Caption = 'N'#186'. do Processo'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'look_orgao'
            Title.Caption = 'Org'#227'o'
            Width = 362
            Visible = True
          end>
      end
      object stxt_docto_vinculado: TStaticText
        Left = 10
        Top = 286
        Width = 712
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
        TabOrder = 6
      end
      object dbedt_nr_processo_total: TDBEdit
        Left = 11
        Top = 25
        Width = 109
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'calc_nr_proc'
        DataSource = datm_LI.ds_li
        ReadOnly = True
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 220
        Width = 137
        Height = 61
        Caption = 'Condi'#231#227'o Mercadoria'
        TabOrder = 5
        object cbxMaterialUsado: TDBCheckBox
          Left = 8
          Top = 24
          Width = 121
          Height = 17
          Caption = '&Material Usado'
          DataField = 'CD_CONDICAO_MERC'
          DataSource = datm_LI_Capa.ds_li
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = cbxMaterialUsadoClick
        end
      end
      object rgpEnquadramentoMaterialUsado: TDBRadioGroup
        Left = 148
        Top = 224
        Width = 193
        Height = 57
        Caption = 'Enquadramento Material usado'
        DataField = 'ENQ_MAT_USADO'
        DataSource = datm_LI_Capa.ds_li
        Items.Strings = (
          'Admiss'#227'o Tempor'#225'ria'
          'Nacionaliza'#231#227'o')
        TabOrder = 8
        Values.Strings = (
          '1'
          '2')
        OnChange = rgpEnquadramentoMaterialUsadoChange
      end
      object RxDBComboBox1: TRxDBComboBox
        Left = 348
        Top = 241
        Width = 249
        Height = 21
        Style = csDropDownList
        DataField = 'OP_NACIONALIZACAO'
        DataSource = datm_LI_Capa.ds_li
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Outros'
          'Ex-Tarif'#225'rio'
          'Linha de Produ'#231#227'o'
          'M'#225'quinas para Reconstru'#231#227'o'
          'Moldes e Ferramentas'
          'Ve'#237'culos com mais de 30 anos'
          'Doa'#231#227'o'
          'Cont'#234'iner'
          'Retorno de Mercadoria'
          'Partes e Pe'#231'as Recondicionadas'
          'M'#225'quinas e Equipamentos')
        TabOrder = 9
        Values.Strings = (
          '11'
          '01'
          '02'
          '03'
          '04'
          '05'
          '06'
          '07'
          '08'
          '09'
          '10')
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 699
      Top = 4
      Width = 38
      Height = 41
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
      Left = 4
      Top = 4
      Width = 38
      Height = 41
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
      Left = 42
      Top = 4
      Width = 38
      Height = 41
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
      Left = 165
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Monta LI'
      Enabled = False
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
      Left = 212
      Top = 4
      Width = 38
      Height = 41
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
      Left = 80
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Exclui LI'
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
    object btn_calcular: TSpeedButton
      Left = 127
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Calcula LI'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_calcularClick
    end
  end
  object menu_manut_cadastro: TMainMenu
    Left = 664
    Top = 11
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
    object mi_calcular: TMenuItem
      Caption = 'Calcu&lar'
      Enabled = False
      OnClick = btn_calcularClick
    end
    object mi_monta_li: TMenuItem
      Caption = '&Montar LI'
      Enabled = False
      OnClick = btn_monta_liClick
    end
    object mi_itens_li: TMenuItem
      Caption = '&Item'
      OnClick = btn_itens_liClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
