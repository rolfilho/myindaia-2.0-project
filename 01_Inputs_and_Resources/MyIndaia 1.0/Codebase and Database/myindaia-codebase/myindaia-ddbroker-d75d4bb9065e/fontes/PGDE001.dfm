object frm_dem_cntr: Tfrm_dem_cntr
  Left = 307
  Top = 230
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Demurrage - Cont'#234'ineres'
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
  object pgctrl_dem_cntr: TPageControl
    Left = 0
    Top = 94
    Width = 734
    Height = 397
    ActivePage = ts_dep
    Align = alClient
    Enabled = False
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_dem_cntrChange
    OnChanging = pgctrl_dem_cntrChanging
    object ts_cntr: TTabSheet
      Caption = 'Cont'#234'iners'
      object dbgrd_cntr: TDBGrid
        Left = 0
        Top = 0
        Width = 726
        Height = 246
        Align = alClient
        DataSource = datm_dem_cntr.ds_cntr
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
            FieldName = 'NR_CNTR'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ENT_ARM'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookDesova'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_DESOVA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookDemurrage'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_DEMURRAGE'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_DEVOLUCAO_CNTR'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object pnl_cntr: TPanel
        Left = 0
        Top = 246
        Width = 726
        Height = 123
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object lbl_nr_cntr: TLabel
          Left = 4
          Top = 5
          Width = 45
          Height = 13
          Caption = 'Cont'#234'iner'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_dt_ent_arm: TLabel
          Left = 318
          Top = 5
          Width = 65
          Height = 13
          Caption = 'Ent. Armaz'#233'm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_tipo: TLabel
          Left = 108
          Top = 5
          Width = 21
          Height = 13
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 213
          Top = 5
          Width = 50
          Height = 13
          Caption = 'Ent. Navio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 108
          Top = 42
          Width = 21
          Height = 13
          Caption = 'Dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_dt_demurrage: TLabel
          Left = 527
          Top = 42
          Width = 69
          Height = 13
          Caption = 'Dt. Demurrage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_demurrage: TLabel
          Left = 4
          Top = 42
          Width = 52
          Height = 13
          Caption = 'Demurrage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_free_time: TLabel
          Left = 213
          Top = 42
          Width = 47
          Height = 13
          Caption = 'Free Time'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label300: TLabel
          Left = 527
          Top = 4
          Width = 69
          Height = 13
          Caption = 'Dt. Devolu'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 318
          Top = 42
          Width = 62
          Height = 13
          Caption = 'Dias Corridos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_status: TLabel
          Left = 627
          Top = 4
          Width = 30
          Height = 13
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 423
          Top = 42
          Width = 55
          Height = 13
          Caption = 'Dias Cobrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 527
          Top = 97
          Width = 95
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbedt_nr_cntr: TDBEdit
          Left = 4
          Top = 18
          Width = 98
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NR_CNTR'
          DataSource = datm_dem_cntr.ds_cntr
          TabOrder = 0
          OnChange = dbedt_nr_cntrChange
          OnExit = dbedt_nr_cntrExit
        end
        object dblckp_box_tp_cntr: TDBLookupComboBox
          Left = 108
          Top = 18
          Width = 98
          Height = 21
          DataField = 'LookTpCntr'
          DataSource = datm_dem_cntr.ds_cntr
          DropDownRows = 5
          TabOrder = 1
          OnClick = dbedt_nr_cntrChange
        end
        object dbedt_dt_ent: TDBEdit
          Left = 213
          Top = 18
          Width = 98
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_ENT'
          DataSource = datm_dem_cntr.ds_cntr
          ReadOnly = True
          TabOrder = 8
          OnChange = dbedt_nr_cntrChange
        end
        object dblckpbox_tp_dias: TDBLookupComboBox
          Left = 108
          Top = 56
          Width = 98
          Height = 21
          DataField = 'LookTpDias'
          DataSource = datm_dem_cntr.ds_cntr
          DropDownRows = 4
          TabOrder = 4
          OnClick = dbedt_nr_cntrChange
          OnExit = dbedt_dt_ent_armExit
        end
        object dblckpbox_demurrage: TDBLookupComboBox
          Left = 4
          Top = 56
          Width = 98
          Height = 21
          DataField = 'LookDemurrage'
          DataSource = datm_dem_cntr.ds_cntr
          DropDownRows = 3
          TabOrder = 3
          OnClick = dbedt_nr_cntrChange
          OnExit = dbedt_dt_ent_armExit
        end
        object dbedt_nr_free_time: TDBEdit
          Left = 213
          Top = 56
          Width = 98
          Height = 21
          DataField = 'NR_FREE_TIME'
          DataSource = datm_dem_cntr.ds_cntr
          MaxLength = 3
          TabOrder = 5
          OnChange = dbedt_nr_cntrChange
          OnExit = dbedt_dt_ent_armExit
        end
        object dbedt_dt_dias_corridos: TDBEdit
          Left = 318
          Top = 56
          Width = 98
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CalcDiasCorridos'
          DataSource = datm_dem_cntr.ds_cntr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
          OnChange = dbedt_nr_cntrChange
        end
        object dbedt_nm_status: TDBEdit
          Left = 627
          Top = 18
          Width = 95
          Height = 21
          Color = clMenu
          DataField = 'LookStatusCntr'
          DataSource = datm_dem_cntr.ds_cntr
          TabOrder = 10
          OnChange = dbedt_nr_cntrChange
        end
        object dbedt_dt_dias_cobrar: TDBEdit
          Left = 423
          Top = 56
          Width = 98
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CalcDiasCobrar'
          DataSource = datm_dem_cntr.ds_cntr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
          OnChange = dbedt_nr_cntrChange
        end
        object dbedt_dt_ent_arm: TDBDateEdit
          Left = 318
          Top = 18
          Width = 98
          Height = 21
          DataField = 'DT_ENT_ARM'
          DataSource = datm_dem_cntr.ds_cntr
          NumGlyphs = 2
          TabOrder = 2
          OnChange = dbedt_nr_cntrChange
          OnExit = dbedt_dt_ent_armExit
        end
        object dbedt_dt_demurrage: TDBDateEdit
          Left = 527
          Top = 56
          Width = 98
          Height = 21
          DataField = 'DT_DEMURRAGE'
          DataSource = datm_dem_cntr.ds_cntr
          NumGlyphs = 2
          TabOrder = 6
          OnChange = dbedt_nr_cntrChange
        end
        object dbedt_dt_devolucao: TDBDateEdit
          Left = 527
          Top = 18
          Width = 95
          Height = 21
          DataField = 'DT_DEVOLUCAO_CNTR'
          DataSource = datm_dem_cntr.ds_cntr
          NumGlyphs = 2
          TabOrder = 7
          OnChange = dbedt_nr_cntrChange
        end
      end
    end
    object ts_dep: TTabSheet
      Caption = 'Dep'#243'sitos'
      object dbgrd_dep: TDBGrid
        Left = 0
        Top = 47
        Width = 726
        Height = 235
        Align = alClient
        DataSource = datm_dem_cntr.ds_dep
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
            FieldName = 'NR_CNTR'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_CHEQUE_CAUCAO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 92
            Visible = True
          end>
      end
      object pnl_dep: TPanel
        Left = 0
        Top = 282
        Width = 726
        Height = 87
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object Label7: TLabel
          Left = 5
          Top = 4
          Width = 45
          Height = 13
          Caption = 'Cont'#234'iner'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_banco: TLabel
          Left = 220
          Top = 41
          Width = 31
          Height = 13
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object btn_co_banco: TSpeedButton
          Left = 292
          Top = 52
          Width = 25
          Height = 23
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
          Visible = False
          OnClick = btn_co_bancoClick
        end
        object lbl_vl_deposito: TLabel
          Left = 117
          Top = 3
          Width = 60
          Height = 13
          Caption = 'Valor Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 223
          Top = 3
          Width = 69
          Height = 13
          Caption = 'Tx. Convers'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_depositado: TLabel
          Left = 328
          Top = 3
          Width = 54
          Height = 13
          Caption = 'Depositado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_devolvido: TLabel
          Left = 414
          Top = 3
          Width = 48
          Height = 13
          Caption = 'Devolvido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbedt_nr_cntr1: TDBEdit
          Left = 5
          Top = 17
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_CNTR'
          DataSource = datm_dem_cntr.ds_dep
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_nr_cntrChange
          OnExit = dbedt_nr_cntrExit
        end
        object dbedt_nm_banco: TDBEdit
          Left = 249
          Top = 54
          Width = 40
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_dem_cntr.ds_dep
          ReadOnly = True
          TabOrder = 5
          Visible = False
          OnChange = dbedt_nr_cntrChange
        end
        object dbedt_vl_deposito: TDBEdit
          Left = 117
          Top = 17
          Width = 101
          Height = 21
          DataField = 'VL_DEPOSITO'
          DataSource = datm_dem_cntr.ds_dep
          TabOrder = 0
          OnChange = dbedt_nr_cntrChange
        end
        object dbedt_tx_conversao: TDBEdit
          Left = 223
          Top = 17
          Width = 101
          Height = 21
          DataField = 'TX_DEPOSITO'
          DataSource = datm_dem_cntr.ds_dep
          TabOrder = 1
          OnChange = dbedt_nr_cntrChange
        end
        object dblckpbox_depositado: TDBLookupComboBox
          Left = 328
          Top = 17
          Width = 80
          Height = 21
          DataField = 'LookDepositado'
          DataSource = datm_dem_cntr.ds_dep
          DropDownRows = 3
          TabOrder = 2
          OnClick = dbedt_nr_cntrChange
        end
        object dblckpbox_devolvido: TDBLookupComboBox
          Left = 414
          Top = 17
          Width = 80
          Height = 21
          DataField = 'LookDevolvido'
          DataSource = datm_dem_cntr.ds_dep
          DropDownRows = 3
          TabOrder = 3
          OnClick = dbedt_nr_cntrChange
        end
        object dbedt_cd_banco: TDBEdit
          Left = 220
          Top = 54
          Width = 28
          Height = 21
          DataField = 'CD_BANCO_CAUCAO'
          DataSource = datm_dem_cntr.ds_dep
          TabOrder = 6
          Visible = False
          OnChange = dbedt_cd_bancoChange
          OnExit = dbedt_cd_bancoExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 47
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label4: TLabel
          Left = 10
          Top = 0
          Width = 53
          Height = 13
          Caption = 'Processo'
          FocusControl = dbedt_nr_processo1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nr_processo1: TDBEdit
          Left = 10
          Top = 16
          Width = 119
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'CalcNrProcesso'
          DataSource = datm_dem_cntr.ds_processo
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object ts_av_lav: TTabSheet
      Caption = 'Avarias/Lavagens'
      object dbgrd_av_lav: TDBGrid
        Left = 0
        Top = 47
        Width = 726
        Height = 193
        Align = alClient
        DataSource = datm_dem_cntr.ds_av_lav
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
            FieldName = 'NR_CNTR'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookAvaria'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_AVARIA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookLavagem'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_LAVAGEM'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 103
            Visible = True
          end>
      end
      object pnl_av_lav: TPanel
        Left = 0
        Top = 240
        Width = 726
        Height = 129
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object Label9: TLabel
          Left = 7
          Top = 4
          Width = 45
          Height = 13
          Caption = 'Cont'#234'iner'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_obs: TLabel
          Left = 402
          Top = 4
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_vl_avaria: TLabel
          Left = 213
          Top = 4
          Width = 57
          Height = 13
          Caption = 'Valor Avaria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_avaria: TLabel
          Left = 132
          Top = 4
          Width = 30
          Height = 13
          Caption = 'Avaria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_vl_lavagem: TLabel
          Left = 213
          Top = 44
          Width = 71
          Height = 13
          Caption = 'Valor Lavagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_lavagem: TLabel
          Left = 132
          Top = 44
          Width = 44
          Height = 13
          Caption = 'Lavagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbedt_nr_cntr2: TDBEdit
          Left = 7
          Top = 20
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_CNTR'
          DataSource = datm_dem_cntr.ds_av_lav
          ReadOnly = True
          TabOrder = 5
          OnChange = dbedt_nr_cntrChange
          OnExit = dbedt_nr_cntrExit
        end
        object dbedt_vl_avaria: TDBEdit
          Left = 213
          Top = 20
          Width = 101
          Height = 21
          DataField = 'VL_AVARIA'
          DataSource = datm_dem_cntr.ds_av_lav
          TabOrder = 1
          OnChange = dbedt_nr_cntrChange
        end
        object dblckpbox_avaria: TDBLookupComboBox
          Left = 132
          Top = 20
          Width = 61
          Height = 21
          DataField = 'LookAvaria'
          DataSource = datm_dem_cntr.ds_av_lav
          DropDownRows = 3
          TabOrder = 0
          OnClick = dbedt_nr_cntrChange
        end
        object dbm_obs_avaria: TDBMemo
          Left = 402
          Top = 18
          Width = 322
          Height = 105
          DataField = 'TX_OBS_AVARIA'
          DataSource = datm_dem_cntr.ds_av_lav
          TabOrder = 4
        end
        object dbedt_vl_lavagem: TDBEdit
          Left = 213
          Top = 59
          Width = 101
          Height = 21
          DataField = 'VL_LAVAGEM'
          DataSource = datm_dem_cntr.ds_av_lav
          TabOrder = 3
          OnChange = dbedt_nr_cntrChange
        end
        object dblckpbox_lavagem: TDBLookupComboBox
          Left = 132
          Top = 59
          Width = 61
          Height = 21
          DataField = 'LookLavagem'
          DataSource = datm_dem_cntr.ds_av_lav
          DropDownRows = 3
          TabOrder = 2
          OnClick = dbedt_nr_cntrChange
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 47
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label5: TLabel
          Left = 10
          Top = 0
          Width = 53
          Height = 13
          Caption = 'Processo'
          FocusControl = dbedt_nr_processo2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nr_processo2: TDBEdit
          Left = 10
          Top = 16
          Width = 119
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'CalcNrProcesso'
          DataSource = datm_dem_cntr.ds_processo
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      734
      47)
    object btn_sair: TSpeedButton
      Left = 696
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
      Left = 46
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
      Left = 86
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
    object btn_incluir: TSpeedButton
      Left = 6
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
      Left = 126
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
    object btn_proc_realiza: TSpeedButton
      Left = 217
      Top = 3
      Width = 40
      Height = 40
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
    object btn_fat: TSpeedButton
      Left = 257
      Top = 3
      Width = 40
      Height = 40
      Hint = 'Faturas'
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
      OnClick = btn_fatClick
    end
    object btn_manut_proc: TSpeedButton
      Left = 176
      Top = 3
      Width = 40
      Height = 40
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
    object dbnvg: TDBNavigator
      Left = 561
      Top = 10
      Width = 104
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
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
  object Panel1: TPanel
    Left = 0
    Top = 47
    Width = 734
    Height = 47
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lbl_via_transp: TLabel
      Left = 610
      Top = 3
      Width = 26
      Height = 13
      Caption = 'Dias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_nr_processo: TLabel
      Left = 454
      Top = 3
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
      Left = 573
      Top = 16
      Width = 24
      Height = 23
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
    object btn_co_produto: TSpeedButton
      Left = 421
      Top = 15
      Width = 24
      Height = 23
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
    object lbl_cd_produto: TLabel
      Left = 227
      Top = 3
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
    object btn_co_unid_neg: TSpeedButton
      Left = 196
      Top = 15
      Width = 24
      Height = 23
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
    object lbl_cd_unid_neg: TLabel
      Left = 2
      Top = 3
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
    object dblckpbox_repassa_tp_dias: TDBLookupComboBox
      Left = 610
      Top = 17
      Width = 119
      Height = 21
      KeyField = 'TP_DIAS'
      ListField = 'NM_TP_DIAS'
      ListSource = datm_dem_cntr.ds_tp_dias
      TabOrder = 0
      OnEnter = dblckpbox_repassa_tp_diasEnter
      OnExit = dblckpbox_repassa_tp_diasExit
    end
    object msk_nr_processo: TMaskEdit
      Left = 454
      Top = 16
      Width = 119
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 1
      OnChange = msk_nr_processoChange
      OnEnter = msk_nr_processoEnter
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 260
      Top = 16
      Width = 160
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
    object msk_cd_produto: TMaskEdit
      Left = 227
      Top = 16
      Width = 33
      Height = 21
      EditMask = '!99;0; '
      MaxLength = 2
      TabOrder = 3
      OnChange = btn_co_produtoClick
      OnEnter = msk_cd_produtoEnter
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 35
      Top = 16
      Width = 160
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 2
      Top = 16
      Width = 33
      Height = 21
      EditMask = '!99;0; '
      MaxLength = 2
      TabOrder = 5
      OnChange = btn_co_unid_negClick
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
  end
  object menu_cadastro: TMainMenu
    Left = 369
    Top = 76
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
    object mi_fat: TMenuItem
      Caption = '&Faturas'
      OnClick = btn_fatClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
