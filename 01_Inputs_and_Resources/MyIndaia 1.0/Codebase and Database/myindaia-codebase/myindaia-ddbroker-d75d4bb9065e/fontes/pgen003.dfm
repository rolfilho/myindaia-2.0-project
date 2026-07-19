object frm_nac: Tfrm_nac
  Left = 134
  Top = 165
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Entreposto - Nacionaliza'#231#227'o'
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
  object pgctrl_nac: TPageControl
    Left = 0
    Top = 101
    Width = 742
    Height = 403
    ActivePage = ts_nac
    Align = alClient
    Enabled = False
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_nacChange
    OnChanging = pgctrl_nacChanging
    object ts_nac: TTabSheet
      Caption = '    Capa    '
      object pnl_nac: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 375
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object lbl_comprador: TLabel
          Left = 17
          Top = 16
          Width = 61
          Height = 13
          Caption = 'Comprador'
          FocusControl = dbedt_cd_comprador
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_comprador: TSpeedButton
          Left = 245
          Top = 28
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
          OnClick = btn_co_compradorClick
        end
        object Label4: TLabel
          Left = 17
          Top = 179
          Width = 68
          Height = 13
          Caption = 'Moeda MLE'
          FocusControl = dbedt_cd_moeda_mle_capa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_mle_capa: TSpeedButton
          Left = 87
          Top = 192
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
          OnClick = btn_co_moeda_mle_capaClick
        end
        object lbl_dt_di_dde: TLabel
          Left = 132
          Top = 272
          Width = 45
          Height = 13
          Caption = 'Data DI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nr_di_dde: TLabel
          Left = 17
          Top = 272
          Width = 32
          Height = 13
          Caption = 'N'#186' DI'
          FocusControl = dbedt_nr_di
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 132
          Top = 179
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
        object Label37: TLabel
          Left = 242
          Top = 179
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
        object Label44: TLabel
          Left = 132
          Top = 226
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
          Left = 242
          Top = 226
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
        object Label43: TLabel
          Left = 242
          Top = 272
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
        object lbl_cd_incoterm: TLabel
          Left = 17
          Top = 132
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
          Left = 55
          Top = 146
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
          OnClick = btn_co_incotermClick
        end
        object Label15: TLabel
          Left = 132
          Top = 133
          Width = 86
          Height = 13
          Caption = 'Data da Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_comprador: TDBEdit
          Left = 17
          Top = 29
          Width = 55
          Height = 21
          DataField = 'CD_COMPRADOR'
          DataSource = datm_nac.ds_nac
          TabOrder = 0
          OnChange = btn_co_compradorClick
          OnExit = dbedt_cd_compradorExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_comprador: TEdit
          Left = 72
          Top = 29
          Width = 172
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 9
        end
        object dbchkbox_nac_externa: TDBCheckBox
          Left = 17
          Top = 63
          Width = 97
          Height = 17
          Caption = 'Nac. Externa'
          DataField = 'IN_NAC_EXTERNA'
          DataSource = datm_nac.ds_nac
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_moeda_mle_capaChange
        end
        object dbchkbox_exportacao: TDBCheckBox
          Left = 17
          Top = 84
          Width = 97
          Height = 17
          Caption = 'Exporta'#231#227'o'
          DataField = 'IN_EXPORTACAO'
          DataSource = datm_nac.ds_nac
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_moeda_mle_capaChange
          OnExit = dbchkbox_exportacaoExit
        end
        object dbchkbox_imp_direta: TDBCheckBox
          Left = 17
          Top = 105
          Width = 153
          Height = 17
          Caption = 'Importa'#231#227'o Direta'
          DataField = 'IN_IMP_DIRETA'
          DataSource = datm_nac.ds_nac
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_moeda_mle_capaChange
        end
        object dbedt_cd_moeda_mle_capa: TDBEdit
          Left = 17
          Top = 193
          Width = 31
          Height = 21
          DataField = 'CD_MOEDA_MLE'
          DataSource = datm_nac.ds_nac
          TabOrder = 6
          OnChange = dbedt_cd_moeda_mle_capaChange
          OnExit = dbedt_cd_compradorExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_moeda_mle_capa: TDBEdit
          Left = 48
          Top = 193
          Width = 38
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaMLE'
          DataSource = datm_nac.ds_nac
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_dt_di: TDBDateEdit
          Left = 132
          Top = 285
          Width = 95
          Height = 21
          TabStop = False
          DataField = 'DT_DI'
          DataSource = datm_nac.ds_nac
          ReadOnly = True
          Color = clMenu
          NumGlyphs = 2
          TabOrder = 8
          OnChange = dbedt_cd_moeda_mle_capaChange
        end
        object dbedt_nr_di: TDBEdit
          Left = 17
          Top = 285
          Width = 99
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_DI'
          DataSource = datm_nac.ds_nac
          ReadOnly = True
          TabOrder = 7
          OnChange = dbedt_cd_moeda_mle_capaChange
        end
        object dbg_ref_cli: TDBGrid
          Left = 355
          Top = 21
          Width = 361
          Height = 333
          DataSource = datm_nac.ds_ref_cliente
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
          ReadOnly = True
          TabOrder = 11
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_REFERENCIA'
              Title.Caption = 'Refer'#234'ncia'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 141
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_REF_EXP'
              Title.Caption = 'Refer'#234'ncia Exportador'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 135
              Visible = True
            end>
        end
        object dbedt_vl_mle_mneg_capa: TDBEdit
          Left = 132
          Top = 193
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLE_MNEG'
          DataSource = datm_nac.ds_nac
          ReadOnly = True
          TabOrder = 12
        end
        object dbedt_vl_mld_mneg_capa: TDBEdit
          Left = 242
          Top = 193
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLD_MNEG'
          DataSource = datm_nac.ds_nac
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_vl_mle_dolar_capa: TDBEdit
          Left = 132
          Top = 240
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLE_DOLAR'
          DataSource = datm_nac.ds_nac
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_vl_mld_dolar_capa: TDBEdit
          Left = 242
          Top = 240
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLD_DOLAR'
          DataSource = datm_nac.ds_nac
          ReadOnly = True
          TabOrder = 15
        end
        object dbedt_dt_calculo: TDBDateEdit
          Left = 242
          Top = 285
          Width = 91
          Height = 21
          TabStop = False
          DataField = 'DT_CALCULO'
          DataSource = datm_nac.ds_nac
          ReadOnly = True
          Color = clMenu
          NumGlyphs = 2
          TabOrder = 16
        end
        object dbedt_cd_incoterm: TDBEdit
          Left = 17
          Top = 146
          Width = 37
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_INCOTERM'
          DataSource = datm_nac.ds_nac
          TabOrder = 4
          OnChange = dbedt_cd_moeda_mle_capaChange
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_incoterm: TDBEdit
          Left = 84
          Top = 146
          Width = 5
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookIncoterm'
          DataSource = datm_nac.ds_nac
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          Visible = False
        end
        object dbedt_dt_venda: TDBDateEdit
          Left = 132
          Top = 146
          Width = 88
          Height = 21
          DataField = 'DT_VENDA'
          DataSource = datm_nac.ds_nac
          NumGlyphs = 2
          TabOrder = 5
          OnChange = dbedt_cd_moeda_mle_capaChange
        end
      end
    end
    object ts_item: TTabSheet
      Caption = '    Itens    '
      object Panel1: TPanel
        Left = 0
        Top = 173
        Width = 734
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Label6: TLabel
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
        object DBText1: TDBText
          Left = 152
          Top = 6
          Width = 97
          Height = 17
          Alignment = taRightJustify
          DataField = 'VL_TOT_MLD_MNEG'
          DataSource = datm_nac.ds_tot_nac_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText4: TDBText
          Left = 58
          Top = 6
          Width = 91
          Height = 17
          Alignment = taRightJustify
          DataField = 'PL_TOT_NAC'
          DataSource = datm_nac.ds_tot_nac_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object dbgrd_item: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 173
        Align = alClient
        DataSource = datm_nac.ds_lista_nac_item
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
            FieldName = 'AP_MERCADORIA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_MATERIAL'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_REF'
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
            FieldName = 'NR_LOTE'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PL_NAC'
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
            Width = 102
            Visible = True
          end>
      end
      object pnl_item: TPanel
        Left = 0
        Top = 201
        Width = 734
        Height = 174
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object Label7: TLabel
          Left = 504
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
          Top = 47
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
          Left = 338
          Top = 61
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
        object Label75: TLabel
          Left = 369
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
        object btn_co_lote: TSpeedButton
          Left = 474
          Top = 24
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
          OnClick = btn_co_loteClick
        end
        object Label1: TLabel
          Left = 13
          Top = 10
          Width = 92
          Height = 13
          Caption = 'N'#186' Processo DA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_processo_da: TSpeedButton
          Left = 103
          Top = 24
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
          OnClick = btn_co_processo_daClick
        end
        object Label77: TLabel
          Left = 369
          Top = 47
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
        object Label86: TLabel
          Left = 528
          Top = 47
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
        object Label11: TLabel
          Left = 134
          Top = 10
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
        object Label2: TLabel
          Left = 185
          Top = 86
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
          Left = 257
          Top = 100
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
        object Label3: TLabel
          Left = 288
          Top = 86
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
        object Label12: TLabel
          Left = 369
          Top = 125
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
        object Label14: TLabel
          Left = 288
          Top = 125
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
        object Label25: TLabel
          Left = 369
          Top = 86
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
        object Label46: TLabel
          Left = 461
          Top = 125
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
          Left = 461
          Top = 86
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
        object Label23: TLabel
          Left = 97
          Top = 86
          Width = 64
          Height = 13
          Caption = 'Vl. Unit'#225'rio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 427
          Top = 47
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
        object Label35: TLabel
          Left = 13
          Top = 125
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
        object Label13: TLabel
          Left = 242
          Top = 10
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
        object dbedt_nr_ref: TDBEdit
          Left = 503
          Top = 24
          Width = 105
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NR_REF'
          DataSource = datm_nac.ds_nac_item
          TabOrder = 2
          OnChange = dbedt_cd_moeda_mle_capaChange
          OnExit = dbedt_cd_compradorExit
        end
        object dbedt_cd_mercadoria: TDBEdit
          Left = 13
          Top = 61
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_MERCADORIA'
          DataSource = datm_nac.ds_nac_item
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = dbedt_cd_moeda_mle_capaChange
          OnExit = dbedt_cd_compradorExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_mercadoria: TDBEdit
          Left = 134
          Top = 61
          Width = 203
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookMercadoria'
          DataSource = datm_nac.ds_nac_item
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
        object dbedt_nr_lote: TDBEdit
          Left = 369
          Top = 24
          Width = 104
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NR_LOTE'
          DataSource = datm_nac.ds_nac_item
          TabOrder = 1
          OnChange = dbedt_cd_moeda_mle_capaChange
          OnExit = dbedt_cd_compradorExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nr_processo_da: TDBEdit
          Left = 13
          Top = 24
          Width = 89
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NR_PROCESSO_DA'
          DataSource = datm_nac.ds_nac_item
          MaxLength = 10
          TabOrder = 0
          OnChange = dbedt_nr_processo_daChange
          OnExit = dbedt_nr_processo_daExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_qt_nac: TDBEdit
          Left = 369
          Top = 61
          Width = 54
          Height = 21
          DataField = 'QT_NAC'
          DataSource = datm_nac.ds_nac_item
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = dbedt_cd_moeda_mle_capaChange
          OnEnter = dbedt_qt_nacEnter
          OnExit = dbedt_cd_compradorExit
        end
        object dbedt_pl_nac: TDBEdit
          Left = 528
          Top = 61
          Width = 97
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_NAC'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_nr_da: TDBEdit
          Left = 134
          Top = 24
          Width = 98
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNrDA'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_cd_moeda_mle: TDBEdit
          Left = 185
          Top = 100
          Width = 32
          Height = 21
          DataField = 'CD_MOEDA_MLE'
          DataSource = datm_nac.ds_nac_item
          TabOrder = 6
          OnChange = dbedt_cd_moeda_mle_capaChange
          OnExit = dbedt_cd_compradorExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_moeda_mle: TDBEdit
          Left = 217
          Top = 100
          Width = 39
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaMLE'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_vl_mle_dolar: TDBEdit
          Left = 369
          Top = 139
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLE_DOLAR'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 12
        end
        object dbedt_tx_dolar: TDBEdit
          Left = 288
          Top = 139
          Width = 73
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'TX_DOLAR'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_tx_mle: TDBEdit
          Left = 288
          Top = 100
          Width = 73
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'TX_MLE'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_vl_mle_mneg: TDBEdit
          Left = 369
          Top = 100
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLE_MNEG'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 15
        end
        object dbedt_vl_mld_dolar: TDBEdit
          Left = 461
          Top = 139
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLD_DOLAR'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 16
        end
        object dbedt_vl_mld_mneg: TDBEdit
          Left = 461
          Top = 100
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLD_MNEG'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 17
        end
        object dbedt_vl_unitario: TDBEdit
          Left = 97
          Top = 100
          Width = 77
          Height = 21
          DataField = 'VL_UNITARIO'
          DataSource = datm_nac.ds_nac_item
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnChange = dbedt_cd_moeda_mle_capaChange
        end
        object dbedt_pl_unit: TDBEdit
          Left = 427
          Top = 61
          Width = 96
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_UNIT'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 18
        end
        object dbedt_vl_frete_mneg_ref: TDBEdit
          Left = 13
          Top = 139
          Width = 77
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_FRETE_MNEG'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 19
        end
        object dbedt_cd_moeda_frete_ref: TDBEdit
          Left = 97
          Top = 139
          Width = 50
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaFrete'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 20
        end
        object dbedt_dt_da: TDBDateEdit
          Left = 242
          Top = 24
          Width = 91
          Height = 21
          TabStop = False
          DataField = 'LookDtDA'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          Color = clMenu
          NumGlyphs = 2
          TabOrder = 21
        end
        object dbchkbox_embut_frete: TDBCheckBox
          Left = 159
          Top = 142
          Width = 112
          Height = 17
          Caption = 'Frete Embutido'
          DataField = 'IN_EMBUT_FRT_ITENS'
          DataSource = datm_nac.ds_nac_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_moeda_mle_capaChange
        end
      end
    end
    object ts_ret_merc: TTabSheet
      Caption = '  Retirada de Mercadorias  '
      object Panel2: TPanel
        Left = 0
        Top = 290
        Width = 734
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Label9: TLabel
          Left = 8
          Top = 9
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
          Left = 204
          Top = 7
          Width = 115
          Height = 17
          Alignment = taRightJustify
          DataField = 'PL_TOT_RET'
          DataSource = datm_nac.ds_tot_ret_merc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbtxt_vl_tot_lote: TDBText
          Left = 63
          Top = 7
          Width = 118
          Height = 17
          Alignment = taRightJustify
          DataField = 'QT_TOT_RET'
          DataSource = datm_nac.ds_tot_ret_merc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object dbgrd_ret_merc: TDBGrid
        Left = 0
        Top = 89
        Width = 734
        Height = 201
        Align = alClient
        DataSource = datm_nac.ds_lista_ret_merc
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
            FieldName = 'DT_RET'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_RET'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PL_RET'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 102
            Visible = True
          end>
      end
      object pnl_ret_merc: TPanel
        Left = 0
        Top = 318
        Width = 734
        Height = 57
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object Label61: TLabel
          Left = 13
          Top = 11
          Width = 70
          Height = 13
          Caption = 'Dt. Retirada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label62: TLabel
          Left = 115
          Top = 11
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
        object Label83: TLabel
          Left = 197
          Top = 11
          Width = 76
          Height = 13
          Caption = 'Peso L'#237'quido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_dt_ret: TDBDateEdit
          Left = 13
          Top = 25
          Width = 91
          Height = 21
          DataField = 'DT_RET'
          DataSource = datm_nac.ds_ret_merc
          NumGlyphs = 2
          TabOrder = 0
          OnChange = dbedt_cd_moeda_mle_capaChange
          OnExit = dbedt_cd_compradorExit
        end
        object dbedt_qt_ret: TDBEdit
          Left = 115
          Top = 25
          Width = 73
          Height = 21
          DataField = 'QT_RET'
          DataSource = datm_nac.ds_ret_merc
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = dbedt_cd_moeda_mle_capaChange
          OnExit = dbedt_cd_compradorExit
        end
        object dbedt_pl_ret: TDBEdit
          Left = 197
          Top = 25
          Width = 92
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_RET'
          DataSource = datm_nac.ds_ret_merc
          ReadOnly = True
          TabOrder = 2
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 89
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object Label55: TLabel
          Left = 126
          Top = 6
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
          Left = 315
          Top = 6
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
          Left = 432
          Top = 6
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
          Left = 552
          Top = 6
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
        object Label5: TLabel
          Left = 11
          Top = 6
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
        object Label16: TLabel
          Left = 11
          Top = 45
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
        object Label18: TLabel
          Left = 126
          Top = 45
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
        object Label19: TLabel
          Left = 202
          Top = 45
          Width = 131
          Height = 13
          Caption = 'Peso L'#237'q. Ag. Retirada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 343
          Top = 45
          Width = 98
          Height = 13
          Caption = 'Vol. Ag. Retirada'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_ap_mercadoria3: TDBEdit
          Left = 126
          Top = 19
          Width = 175
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMercadoria'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nr_artigo: TDBEdit
          Left = 314
          Top = 19
          Width = 107
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMaterial'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_nr_ref2: TDBEdit
          Left = 432
          Top = 19
          Width = 108
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_REF'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_nr_lote2: TDBEdit
          Left = 552
          Top = 19
          Width = 105
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_LOTE'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nr_da2: TDBEdit
          Left = 11
          Top = 19
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNrDA'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_pl_nac2: TDBEdit
          Left = 11
          Top = 58
          Width = 102
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'PL_NAC'
          DataSource = datm_nac.ds_nac_item
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_qt_nac2: TDBEdit
          Left = 126
          Top = 58
          Width = 64
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'QT_NAC'
          DataSource = datm_nac.ds_nac_item
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          OnChange = dbedt_cd_moeda_mle_capaChange
          OnEnter = dbedt_qt_nacEnter
          OnExit = dbedt_cd_compradorExit
        end
        object dbedt_pl_ag_ret: TDBEdit
          Left = 202
          Top = 58
          Width = 130
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CalcPlAgRetirada'
          DataSource = datm_nac.ds_tot_ret_merc
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_qt_ag_ret: TDBEdit
          Left = 343
          Top = 58
          Width = 54
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CalcQtAgRetirada'
          DataSource = datm_nac.ds_tot_ret_merc
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
          OnChange = dbedt_cd_moeda_mle_capaChange
          OnEnter = dbedt_qt_nacEnter
          OnExit = dbedt_cd_compradorExit
        end
      end
    end
  end
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 52
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object btn_sair: TSpeedButton
      Left = 698
      Top = 4
      Width = 39
      Height = 44
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
      Left = 41
      Top = 4
      Width = 39
      Height = 44
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
      Left = 80
      Top = 4
      Width = 39
      Height = 44
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
      Width = 36
      Height = 44
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
      Left = 119
      Top = 4
      Width = 39
      Height = 44
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
      Left = 250
      Top = 4
      Width = 39
      Height = 44
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
      Left = 211
      Top = 4
      Width = 39
      Height = 44
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
      Left = 289
      Top = 4
      Width = 39
      Height = 44
      Hint = 'Atalho'
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
      Left = 165
      Top = 4
      Width = 39
      Height = 44
      Hint = 'C'#225'lculo da Nacionaliza'#231#227'o'
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
      Left = 342
      Top = 12
      Width = 104
      Height = 26
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
  object Panel3: TPanel
    Left = 0
    Top = 52
    Width = 742
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lbl_cd_unid_neg: TLabel
      Left = 8
      Top = 8
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
      Left = 263
      Top = 20
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
      OnClick = btn_co_unid_negClick
    end
    object lbl_cd_produto: TLabel
      Left = 298
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
    object btn_co_produto: TSpeedButton
      Left = 554
      Top = 20
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
      OnClick = btn_co_produtoClick
    end
    object lbl_nr_processo: TLabel
      Left = 590
      Top = 8
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
      Left = 705
      Top = 20
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
      OnClick = btn_co_processoClick
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 9
      Top = 21
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
      Left = 45
      Top = 21
      Width = 217
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object msk_cd_produto: TMaskEdit
      Left = 299
      Top = 21
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
      Left = 335
      Top = 21
      Width = 218
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object msk_nr_processo: TMaskEdit
      Left = 591
      Top = 21
      Width = 113
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
    Left = 561
    Top = 3
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
