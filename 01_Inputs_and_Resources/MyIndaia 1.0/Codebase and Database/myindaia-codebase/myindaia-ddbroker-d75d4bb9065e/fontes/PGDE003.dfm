object frm_dem_fat: Tfrm_dem_fat
  Left = 419
  Top = 234
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Demurrage - Faturas'
  ClientHeight = 474
  ClientWidth = 632
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
  object lbl_nr_fatura: TLabel
    Left = 337
    Top = 11
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
  object lbl_cd_unid_neg: TLabel
    Left = 2
    Top = 51
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
    Left = 217
    Top = 65
    Width = 25
    Height = 23
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
  object lbl_nr_processo: TLabel
    Left = 479
    Top = 51
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
  object btn_co_processo2: TSpeedButton
    Left = 590
    Top = 66
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
    OnClick = btn_co_processo2Click
  end
  object lbl_cd_produto: TLabel
    Left = 247
    Top = 51
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
    Left = 451
    Top = 65
    Width = 25
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
    OnClick = btn_co_produtoClick
  end
  object lbl_nr_cntr2: TLabel
    Left = 479
    Top = 11
    Width = 42
    Height = 13
    Caption = 'N'#186' Cntr'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pgctrl_dem_fat: TPageControl
    Left = 0
    Top = 87
    Width = 632
    Height = 386
    ActivePage = ts_fat
    HotTrack = True
    TabOrder = 5
    OnChange = pgctrl_dem_fatChange
    OnChanging = pgctrl_dem_fatChanging
    object ts_fat: TTabSheet
      Caption = '   Faturas   '
      object Label5: TLabel
        Left = 1
        Top = 240
        Width = 37
        Height = 13
        Caption = 'Fatura'
        FocusControl = dbedt_nr_fat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 104
        Top = 240
        Width = 62
        Height = 13
        Caption = 'Dt. Vencto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 193
        Top = 241
        Width = 56
        Height = 13
        Caption = 'Vl. Fatura'
        FocusControl = dbedt_vl_fatura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 278
        Top = 241
        Width = 74
        Height = 13
        Caption = 'Vl. Desconto'
        FocusControl = dbedt_vl_desc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 363
        Top = 241
        Width = 78
        Height = 13
        Caption = 'Vl. Acr'#233'scimo'
        FocusControl = dbedt_vl_acresc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 448
        Top = 241
        Width = 70
        Height = 13
        Caption = 'Vl. Dep'#243'sito'
        FocusControl = dbedt_vl_dep
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 533
        Top = 241
        Width = 49
        Height = 13
        Caption = 'Vl. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 516
        Top = 277
        Width = 84
        Height = 13
        Caption = 'Tipo da Fatura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 86
        Top = 282
        Width = 63
        Height = 13
        Caption = 'Vl. Dispute'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 180
        Top = 279
        Width = 74
        Height = 13
        Caption = 'Obs. Dispute'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnl_tot_fat: TPanel
        Left = 431
        Top = 211
        Width = 175
        Height = 28
        BevelWidth = 3
        TabOrder = 8
        object lbl_tot_fat: TLabel
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
        object dbtxt_vl_tot_fatura: TDBText
          Left = 56
          Top = 6
          Width = 110
          Height = 17
          Alignment = taRightJustify
          DataField = 'VL_TOT_TELA'
          DataSource = datm_dem_fat.ds_soma_fat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object dbedt_nr_fat: TDBEdit
        Left = 1
        Top = 255
        Width = 101
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NR_FATURA'
        DataSource = datm_dem_fat.ds_fat
        MaxLength = 20
        TabOrder = 0
        OnChange = dbedt_nr_fatChange
        OnExit = dbedt_nr_fatExit
      end
      object dbgrd_fat: TDBGrid
        Left = 2
        Top = 0
        Width = 620
        Height = 211
        DataSource = datm_dem_fat.ds_lista_fat
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_FATURA'
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
            FieldName = 'DT_VENCTO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_FATURA'
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
            FieldName = 'VL_ACRESCIMO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_DESCONTO'
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
            FieldName = 'VL_DEPOSITO'
            Title.Color = clBlack
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
            FieldName = 'VL_FATURA_TOTAL'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 81
            Visible = True
          end>
      end
      object dbedt_dt_vencto: TDBDateEdit
        Left = 104
        Top = 255
        Width = 88
        Height = 21
        DataField = 'DT_VENCTO'
        DataSource = datm_dem_fat.ds_fat
        NumGlyphs = 2
        TabOrder = 1
        OnChange = dbedt_nr_fatChange
      end
      object dbedt_vl_fatura: TDBEdit
        Left = 193
        Top = 255
        Width = 83
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'VL_FATURA'
        DataSource = datm_dem_fat.ds_fat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object dbedt_vl_desc: TDBEdit
        Left = 278
        Top = 255
        Width = 83
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'VL_DESCONTO'
        DataSource = datm_dem_fat.ds_fat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object dbedt_vl_acresc: TDBEdit
        Left = 363
        Top = 255
        Width = 83
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'VL_ACRESCIMO'
        DataSource = datm_dem_fat.ds_fat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_vl_dep: TDBEdit
        Left = 448
        Top = 255
        Width = 83
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'VL_DEPOSITO'
        DataSource = datm_dem_fat.ds_fat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object dblckpbox_tp_fat_dem: TDBLookupComboBox
        Left = 516
        Top = 292
        Width = 105
        Height = 21
        DataField = 'LookTpFatDem'
        DataSource = datm_dem_fat.ds_fat
        DropDownRows = 4
        TabOrder = 2
      end
      object ChkInDispute: TDBCheckBox
        Left = 8
        Top = 288
        Width = 65
        Height = 17
        Caption = 'Dispute'
        DataField = 'IN_DISPUTE'
        DataSource = datm_dem_fat.ds_fat
        TabOrder = 9
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = dbedt_nr_fatChange
      end
      object dbedt_vl_dispute: TDBEdit
        Left = 85
        Top = 298
        Width = 83
        Height = 21
        DataField = 'VL_DISPUTE'
        DataSource = datm_dem_fat.ds_fat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnChange = dbedt_nr_fatChange
      end
      object MemObsDispute: TDBMemo
        Left = 176
        Top = 296
        Width = 329
        Height = 57
        DataField = 'OBS_DISPUTE'
        DataSource = datm_dem_fat.ds_fat
        TabOrder = 11
        OnChange = dbedt_nr_fatChange
      end
      object dbedt_vl_tot_fatura: TDBEdit
        Left = 534
        Top = 255
        Width = 83
        Height = 21
        DataField = 'VL_FATURA_TOTAL'
        DataSource = datm_dem_fat.ds_fat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        OnChange = dbedt_nr_fatChange
      end
    end
    object ts_cntr: TTabSheet
      Caption = 'Cont'#234'ineres'
      object lbl_dt_fim: TLabel
        Left = 537
        Top = 280
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
      object lbl_parcial: TLabel
        Left = 388
        Top = 280
        Width = 40
        Height = 13
        Caption = 'Parcial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dias_cobrados: TLabel
        Left = 444
        Top = 201
        Width = 60
        Height = 13
        Caption = 'Dias Cobr.'
        FocusControl = dbedt_nr_dias_cobrados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dias_corridos: TLabel
        Left = 359
        Top = 201
        Width = 76
        Height = 13
        Caption = 'Dias Corridos'
        FocusControl = dbedt_dt_dias_corridos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_nr_cntr: TLabel
        Left = 104
        Top = 201
        Width = 55
        Height = 13
        Caption = 'Cont'#234'iner'
        FocusControl = dbedt_nr_cntr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_processo: TLabel
        Left = 200
        Top = 201
        Width = 71
        Height = 13
        Caption = 'N'#186' Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_processo: TSpeedButton
        Left = 276
        Top = 215
        Width = 25
        Height = 23
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
      object lbl_vl_diaria: TLabel
        Left = 537
        Top = 201
        Width = 67
        Height = 13
        Caption = 'Valor Di'#225'ria'
        FocusControl = dbedt_vl_diaria
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_vl_fatura: TLabel
        Left = 359
        Top = 242
        Width = 56
        Height = 13
        Caption = 'Vl. Fatura'
        FocusControl = dbedt_vl_fatura_mn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_vl_desconto: TLabel
        Left = 537
        Top = 242
        Width = 74
        Height = 13
        Caption = 'Vl. Desconto'
        FocusControl = dbedt_vl_desconto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_vl_deposito: TLabel
        Left = 206
        Top = 281
        Width = 70
        Height = 13
        Caption = 'Vl. Dep'#243'sito'
        FocusControl = dbedt_vl_deposito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_vl_total: TLabel
        Left = 296
        Top = 281
        Width = 49
        Height = 13
        Caption = 'Vl. Total'
        FocusControl = dbedt_vl_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_vl_fatura_mneg: TLabel
        Left = 2
        Top = 241
        Width = 76
        Height = 13
        Caption = 'Vl. na Moeda'
        FocusControl = dbedt_vl_fatura_mneg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 271
        Top = 242
        Width = 83
        Height = 13
        Caption = 'Tx. Convers'#227'o'
        FocusControl = dbedt_tx_fatura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_moeda: TLabel
        Left = 88
        Top = 242
        Width = 39
        Height = 13
        Caption = 'Moeda'
        FocusControl = dbedt_cd_moeda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_moeda: TSpeedButton
        Left = 246
        Top = 255
        Width = 25
        Height = 23
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
      object lbl_dt_inicio: TLabel
        Left = 445
        Top = 280
        Width = 17
        Height = 13
        Caption = 'De'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_nr_fatura1: TLabel
        Left = 1
        Top = 201
        Width = 37
        Height = 13
        Caption = 'Fatura'
        FocusControl = dbedt_nr_fat_cntr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 444
        Top = 242
        Width = 91
        Height = 13
        Caption = 'Vl.Desc. Moeda'
        FocusControl = dbedt_vl_desconto_mneg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 114
        Top = 281
        Width = 78
        Height = 13
        Caption = 'Vl. Acr'#233'scimo'
        FocusControl = dbedt_vl_acrescimo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 2
        Top = 281
        Width = 105
        Height = 13
        Caption = 'Vl. Acresc. Moeda'
        FocusControl = dbedt_vl_acrescimo_mneg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 303
        Top = 201
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
      object Panel1: TPanel
        Left = 430
        Top = 170
        Width = 175
        Height = 28
        BevelWidth = 3
        Caption = 'Panel1'
        TabOrder = 22
        object Label12: TLabel
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
        object DBText1: TDBText
          Left = 55
          Top = 6
          Width = 110
          Height = 17
          Alignment = taRightJustify
          DataField = 'VL_TOT_TELA'
          DataSource = datm_dem_fat.ds_soma_fat_cntr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object dbgrd_fat_cntr: TDBGrid
        Left = 2
        Top = 0
        Width = 620
        Height = 171
        DataSource = datm_dem_fat.ds_lista_cntr
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 18
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_FATURA'
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
            FieldName = 'NR_CNTR'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CalcNrProcesso'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_PERIODO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_DIAS_COBRADOS'
            Title.Caption = 'Dias cobrados'
            Title.Color = clBlack
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
            FieldName = 'VL_TOTAL'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 112
            Visible = True
          end>
      end
      object dblckpbox_parcial: TDBLookupComboBox
        Left = 388
        Top = 295
        Width = 48
        Height = 21
        DataField = 'LookParcial'
        DataSource = datm_dem_fat.ds_fat_cntr
        DropDownRows = 3
        TabOrder = 15
        OnClick = dblckpbox_parcialClick
      end
      object dbedt_nr_dias_cobrados: TDBEdit
        Left = 444
        Top = 216
        Width = 91
        Height = 21
        DataField = 'NR_DIAS_COBRADOS'
        DataSource = datm_dem_fat.ds_fat_cntr
        TabOrder = 4
        OnChange = dbedt_nr_fat_cntrChange
        OnExit = dbedt_nr_dias_cobradosExit
      end
      object dbedt_dt_dias_corridos: TDBEdit
        Left = 359
        Top = 216
        Width = 83
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CalcDiasCorridos'
        DataSource = datm_dem_fat.ds_fat_cntr
        ReadOnly = True
        TabOrder = 19
        OnChange = dbedt_nr_fat_cntrChange
      end
      object dbedt_nr_cntr: TDBEdit
        Left = 104
        Top = 216
        Width = 93
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NR_CNTR'
        DataSource = datm_dem_fat.ds_fat_cntr
        TabOrder = 1
        OnChange = dbedt_nr_fat_cntrChange
        OnExit = dbedt_nr_cntrExit
      end
      object dbedt_vl_diaria: TDBEdit
        Left = 537
        Top = 216
        Width = 83
        Height = 21
        DataField = 'VL_DIARIA'
        DataSource = datm_dem_fat.ds_fat_cntr
        TabOrder = 5
        OnChange = dbedt_nr_fat_cntrChange
      end
      object dbedt_vl_fatura_mn: TDBEdit
        Left = 359
        Top = 256
        Width = 83
        Height = 21
        DataField = 'VL_FATURA_MN'
        DataSource = datm_dem_fat.ds_fat_cntr
        TabOrder = 9
        OnChange = dbedt_nr_fat_cntrChange
      end
      object dbedt_vl_desconto: TDBEdit
        Left = 537
        Top = 256
        Width = 83
        Height = 21
        DataField = 'VL_DESCONTO'
        DataSource = datm_dem_fat.ds_fat_cntr
        TabOrder = 11
        OnChange = dbedt_nr_fat_cntrChange
      end
      object dbedt_vl_deposito: TDBEdit
        Left = 206
        Top = 295
        Width = 83
        Height = 21
        DataField = 'VL_DEPOSITO'
        DataSource = datm_dem_fat.ds_fat_cntr
        TabOrder = 14
        OnChange = dbedt_nr_fat_cntrChange
      end
      object dbedt_vl_total: TDBEdit
        Left = 296
        Top = 295
        Width = 83
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CalcVlTotal'
        DataSource = datm_dem_fat.ds_fat_cntr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 20
      end
      object dbedt_vl_fatura_mneg: TDBEdit
        Left = 2
        Top = 256
        Width = 83
        Height = 21
        DataField = 'VL_FATURA_MNEG'
        DataSource = datm_dem_fat.ds_fat_cntr
        TabOrder = 6
        OnChange = dbedt_nr_fat_cntrChange
      end
      object dbedt_tx_fatura: TDBEdit
        Left = 272
        Top = 256
        Width = 83
        Height = 21
        DataField = 'TX_FATURA'
        DataSource = datm_dem_fat.ds_fat_cntr
        TabOrder = 8
        OnChange = dbedt_nr_fat_cntrChange
      end
      object dbedt_cd_moeda: TDBEdit
        Left = 89
        Top = 256
        Width = 28
        Height = 21
        DataField = 'CD_MOEDA_FATURA'
        DataSource = datm_dem_fat.ds_fat_cntr
        MaxLength = 3
        TabOrder = 7
        OnChange = dbedt_nr_fat_cntrChange
        OnExit = dbedt_cd_moedaExit
      end
      object dbedt_nm_moeda: TDBEdit
        Left = 117
        Top = 256
        Width = 126
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookMoeda'
        DataSource = datm_dem_fat.ds_fat_cntr
        ReadOnly = True
        TabOrder = 21
      end
      object dbedt_nr_fat_cntr: TDBEdit
        Left = 1
        Top = 216
        Width = 101
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NR_FATURA'
        DataSource = datm_dem_fat.ds_fat_cntr
        MaxLength = 20
        TabOrder = 0
        OnChange = dbedt_nr_fat_cntrChange
        OnExit = dbedt_nr_fat_cntrExit
      end
      object msk_nr_processo: TMaskEdit
        Left = 199
        Top = 216
        Width = 75
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 2
        OnChange = msk_nr_processoChange
        OnEnter = msk_nr_processoEnter
        OnExit = msk_nr_processoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object dbedt_dt_inicio: TDBDateEdit
        Left = 445
        Top = 295
        Width = 88
        Height = 21
        DataField = 'DT_INICIO'
        DataSource = datm_dem_fat.ds_fat_cntr
        NumGlyphs = 2
        TabOrder = 16
        OnChange = dbedt_nr_fat_cntrChange
      end
      object dbedt_dt_fim: TDBDateEdit
        Left = 537
        Top = 295
        Width = 88
        Height = 21
        DataField = 'DT_FIM'
        DataSource = datm_dem_fat.ds_fat_cntr
        NumGlyphs = 2
        TabOrder = 17
        OnChange = dbedt_nr_fat_cntrChange
      end
      object dbedt_vl_desconto_mneg: TDBEdit
        Left = 444
        Top = 256
        Width = 91
        Height = 21
        DataField = 'VL_DESCONTO_MNEG'
        DataSource = datm_dem_fat.ds_fat_cntr
        TabOrder = 10
        OnChange = dbedt_nr_fat_cntrChange
      end
      object dbedt_vl_acrescimo: TDBEdit
        Left = 114
        Top = 295
        Width = 83
        Height = 21
        DataField = 'VL_ACRESCIMO'
        DataSource = datm_dem_fat.ds_fat_cntr
        TabOrder = 13
        OnChange = dbedt_nr_fat_cntrChange
      end
      object dbedt_vl_acrescimo_mneg: TDBEdit
        Left = 2
        Top = 295
        Width = 83
        Height = 21
        DataField = 'VL_ACRESCIMO_MNEG'
        DataSource = datm_dem_fat.ds_fat_cntr
        TabOrder = 12
        OnChange = dbedt_nr_fat_cntrChange
      end
      object dbedt_nr_periodo: TDBEdit
        Left = 305
        Top = 216
        Width = 38
        Height = 21
        DataField = 'NR_PERIODO'
        DataSource = datm_dem_fat.ds_fat_cntr
        MaxLength = 3
        TabOrder = 3
        OnChange = dbedt_nr_fat_cntrChange
        OnExit = dbedt_nr_periodoExit
      end
    end
  end
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 6
    object btn_sair: TSpeedButton
      Left = 286
      Top = 12
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
      Left = 34
      Top = 13
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
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 62
      Top = 13
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
      OnClick = btn_cancelarClick
    end
    object btn_incluir: TSpeedButton
      Left = 6
      Top = 13
      Width = 25
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
      OnClick = btn_incluirClick
    end
    object btn_excluir: TSpeedButton
      Left = 90
      Top = 13
      Width = 25
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
      OnClick = btn_excluirClick
    end
    object btn_cntr: TSpeedButton
      Left = 242
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Cont'#234'ineres'
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
      OnClick = btn_cntrClick
    end
    object dbnvg: TDBNavigator
      Left = 121
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_dem_fat.ds_fat_cntr
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
  object msk_nr_fatura: TMaskEdit
    Left = 337
    Top = 26
    Width = 136
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 0
    OnChange = msk_nr_faturaChange
    OnEnter = msk_nr_faturaEnter
    OnExit = msk_nr_faturaExit
  end
  object msk_cd_unid_neg: TMaskEdit
    Left = 2
    Top = 66
    Width = 33
    Height = 21
    EditMask = '!99;0; '
    MaxLength = 2
    TabOrder = 2
    OnEnter = msk_cd_unid_negEnter
    OnExit = msk_cd_unid_negExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_unid_neg: TEdit
    Left = 40
    Top = 66
    Width = 175
    Height = 21
    TabStop = False
    Color = clSilver
    ReadOnly = True
    TabOrder = 7
  end
  object msk_nr_processo2: TMaskEdit
    Left = 479
    Top = 66
    Width = 109
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
    OnEnter = msk_nr_processo2Enter
    OnExit = msk_nr_processo2Exit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object msk_cd_produto: TMaskEdit
    Left = 247
    Top = 66
    Width = 33
    Height = 21
    EditMask = '!99;0; '
    MaxLength = 2
    TabOrder = 3
    OnEnter = msk_cd_produtoEnter
    OnExit = msk_cd_produtoExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_produto: TEdit
    Left = 284
    Top = 66
    Width = 164
    Height = 21
    TabStop = False
    Color = clSilver
    ReadOnly = True
    TabOrder = 8
  end
  object msk_nr_cntr: TMaskEdit
    Left = 479
    Top = 25
    Width = 103
    Height = 21
    CharCase = ecUpperCase
    EditMask = 'llll-999-999-9;0;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 14
    ParentFont = False
    TabOrder = 1
    OnChange = msk_nr_faturaChange
    OnEnter = msk_nr_cntrEnter
    OnExit = msk_nr_cntrExit
  end
  object menu_cadastro: TMainMenu
    Left = 601
    Top = 4
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
    object mi_proc_cntr: TMenuItem
      Caption = 'Co&nt'#234'ineres'
      OnClick = btn_cntrClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
