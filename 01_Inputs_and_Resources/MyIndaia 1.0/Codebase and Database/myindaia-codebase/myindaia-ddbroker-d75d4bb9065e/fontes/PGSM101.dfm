object frm_param_sistema: Tfrm_param_sistema
  Left = 465
  Top = 99
  Width = 751
  Height = 550
  Caption = 'Par'#226'metros do Sistema'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
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
  object pgctrl_param: TPageControl
    Left = 0
    Top = 43
    Width = 743
    Height = 461
    ActivePage = ts_item2
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    OnChange = pgctrl_paramChange
    object ts_geral: TTabSheet
      Caption = 'Geral'
      object bvl_geral: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object Label7: TLabel
        Left = 14
        Top = 25
        Width = 107
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo de Instala'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 136
        Top = 25
        Width = 102
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome do Servidor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_nr_ult_fatura: TLabel
        Left = 14
        Top = 74
        Width = 94
        Height = 13
        Alignment = taRightJustify
        Caption = 'N'#186' '#218'ltima Fatura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_nr_ult_nota: TLabel
        Left = 125
        Top = 74
        Width = 129
        Height = 13
        Caption = 'N'#186' '#218'lt. Nota D'#233'b/Cr'#233'd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_mod_fat: TLabel
        Left = 14
        Top = 169
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = 'Modelo da Fatura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 263
        Top = 74
        Width = 121
        Height = 13
        Caption = 'N'#186' '#218'ltima NF Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_mod_nf_serv: TLabel
        Left = 182
        Top = 169
        Width = 114
        Height = 13
        Caption = 'Modelo da N. Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_sistema_contabil: TLabel
        Left = 366
        Top = 169
        Width = 95
        Height = 13
        Caption = 'Sistema Cont'#225'bil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_libera_di: TLabel
        Left = 14
        Top = 223
        Width = 97
        Height = 26
        Caption = 'Libera DI'#180's automaticamente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object lbl_gerencia_proc_vinc: TLabel
        Left = 122
        Top = 223
        Width = 118
        Height = 26
        Caption = 'Gerencia Processos Vinculados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object lbl_vl_ir: TLabel
        Left = 242
        Top = 218
        Width = 75
        Height = 13
        Caption = 'Aliq. I.R.R.F.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_vl_min_irrf: TLabel
        Left = 320
        Top = 223
        Width = 64
        Height = 26
        Caption = 'Valor M'#237'n. I.R.R.F.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label49: TLabel
        Left = 480
        Top = 223
        Width = 104
        Height = 26
        Caption = 'Arredondar CPMF por item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object lbl_nr_dias_entre_viagens: TLabel
        Left = 351
        Top = 12
        Width = 79
        Height = 26
        Caption = 'N'#186' de Dias entre Viagens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object lbl_pc_max_seguro_di: TLabel
        Left = 400
        Top = 223
        Width = 66
        Height = 26
        Caption = '%  M'#225'x. Seguro D.I.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label43: TLabel
        Left = 435
        Top = 12
        Width = 101
        Height = 26
        Caption = 'N'#186' de Dias p/ Vencto-Ent Navio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label81: TLabel
        Left = 13
        Top = 279
        Width = 137
        Height = 13
        Caption = 'Lan'#231'amento de Pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label102: TLabel
        Left = 249
        Top = 12
        Width = 83
        Height = 26
        Caption = 'Auto Close'#13#10'(em segundos)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label107: TLabel
        Left = 591
        Top = 225
        Width = 61
        Height = 26
        Caption = 'Qtde Dias CAT63'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label110: TLabel
        Left = 664
        Top = 225
        Width = 62
        Height = 26
        Alignment = taCenter
        Caption = 'Integra'#231#227'o Cont'#225'bil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label111: TLabel
        Left = 402
        Top = 73
        Width = 128
        Height = 13
        Caption = 'N'#186' '#218'lt. Demonstrativo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label113: TLabel
        Left = 15
        Top = 122
        Width = 76
        Height = 13
        Caption = 'N'#186' '#218'ltimo RD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label67: TLabel
        Left = 532
        Top = 171
        Width = 157
        Height = 13
        Caption = '% Prote'#231#227'o Cambial Padr'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object dbedt_nm_servidor: TDBEdit
        Left = 136
        Top = 39
        Width = 103
        Height = 21
        DataField = 'NM_SERVIDOR'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 1
        OnChange = dbedt_dt_solic_chChange
      end
      object dblckbox_tp_instal: TDBLookupComboBox
        Left = 14
        Top = 39
        Width = 119
        Height = 21
        DataField = 'CD_INSTALACAO'
        DataSource = datm_param_sistema.ds_parametros
        DropDownRows = 6
        KeyField = 'CD_INSTAL'
        ListField = 'NM_INSTAL'
        ListSource = datm_param_sistema.ds_tp_instal
        TabOrder = 0
        OnClick = dbedt_dt_solic_chChange
      end
      object dbedt_nr_ult_fatura: TDBEdit
        Left = 14
        Top = 89
        Width = 97
        Height = 21
        DataField = 'NR_ULT_FATURA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 6
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_nr_ult_nota: TDBEdit
        Left = 125
        Top = 89
        Width = 121
        Height = 21
        DataField = 'NR_ULT_NOTA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 7
        OnChange = dbedt_dt_solic_chChange
      end
      object dblcpbox_tp_instal: TDBLookupComboBox
        Left = 14
        Top = 184
        Width = 107
        Height = 21
        DataField = 'CD_MOD_FAT'
        DataSource = datm_param_sistema.ds_parametros
        DropDownRows = 6
        KeyField = 'CD_MOD_FAT'
        ListField = 'NM_MOD_FAT'
        ListSource = datm_param_sistema.ds_tp_mod_fat
        TabOrder = 10
        OnClick = dbedt_dt_solic_chChange
      end
      object dbedt_nr_ult_nf_serv: TDBEdit
        Left = 263
        Top = 89
        Width = 123
        Height = 21
        DataField = 'NR_ULT_NF_SERV'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 8
        OnChange = dbedt_dt_solic_chChange
      end
      object dblcpbox_cd_mod_nf_serv: TDBLookupComboBox
        Left = 182
        Top = 184
        Width = 121
        Height = 21
        DataField = 'CD_MOD_NF_SERV'
        DataSource = datm_param_sistema.ds_parametros
        DropDownRows = 6
        KeyField = 'CD_MOD_FAT'
        ListField = 'NM_MOD_FAT'
        ListSource = datm_param_sistema.ds_tp_mod_fat
        TabOrder = 11
        OnClick = dbedt_dt_solic_chChange
      end
      object dblckpbox_sistema_contabil: TDBLookupComboBox
        Left = 366
        Top = 184
        Width = 123
        Height = 21
        DataField = 'CD_SISTEMA_CONTABIL'
        DataSource = datm_param_sistema.ds_parametros
        DropDownRows = 6
        KeyField = 'CD_SISTEMA_CONTABIL'
        ListField = 'NM_SISTEMA_CONTABIL'
        ListSource = datm_param_sistema.ds_sistema_contabil
        TabOrder = 12
        OnClick = dbedt_dt_solic_chChange
      end
      object dblckpbox_libera_di: TDBLookupComboBox
        Left = 14
        Top = 252
        Width = 100
        Height = 21
        DataField = 'IN_LIBERA_DI'
        DataSource = datm_param_sistema.ds_parametros
        DropDownRows = 6
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_param_sistema.ds_yesno
        TabOrder = 14
        OnClick = dbedt_dt_solic_chChange
      end
      object dblckpbox_gerencia_proc_vinc: TDBLookupComboBox
        Left = 122
        Top = 252
        Width = 100
        Height = 21
        DataField = 'IN_GESTAO_VINCULADOS'
        DataSource = datm_param_sistema.ds_parametros
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_param_sistema.ds_yesno
        TabOrder = 15
        OnClick = dbedt_dt_solic_chChange
      end
      object dbedt_vl_ir: TDBEdit
        Left = 242
        Top = 252
        Width = 67
        Height = 21
        DataField = 'VL_ALIQ_IR'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 3
        TabOrder = 16
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_nr_carteira_cob_autExit
      end
      object dbedt_vl_min_ir: TDBEdit
        Left = 320
        Top = 252
        Width = 67
        Height = 21
        DataField = 'VL_MIN_IR'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 3
        TabOrder = 17
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_nr_carteira_cob_autExit
      end
      object dblckpbox_in_arredonda_cpmf_item: TDBLookupComboBox
        Left = 480
        Top = 252
        Width = 100
        Height = 21
        DataField = 'IN_ARREDONDA_CPMF_ITEM'
        DataSource = datm_param_sistema.ds_parametros
        DropDownRows = 6
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_param_sistema.ds_yesno
        TabOrder = 19
        OnClick = dbedt_dt_solic_chChange
      end
      object dbedt_nr_dias_entre_viagens: TDBEdit
        Left = 352
        Top = 39
        Width = 64
        Height = 21
        DataField = 'NR_DIAS_ENTRE_VIAGENS'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 6
        TabOrder = 3
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_pc_max_seguro_di: TDBEdit
        Left = 400
        Top = 252
        Width = 67
        Height = 21
        DataField = 'PC_MAX_SEGURO_DI'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 3
        TabOrder = 18
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_nr_carteira_cob_autExit
      end
      object dbedt_nr_dias_vencto_ent_navio: TDBEdit
        Left = 435
        Top = 39
        Width = 64
        Height = 21
        DataField = 'NR_DIAS_VENCTO_ENT_NAVIO'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 6
        TabOrder = 4
        OnChange = dbedt_dt_solic_chChange
      end
      object DBGrid1: TDBGrid
        Left = 13
        Top = 293
        Width = 709
        Height = 91
        DataSource = datm_param_sistema.ds_tp_at_basf
        TabOrder = 22
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'TP_AT_BASF'
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
            FieldName = 'NM_TP_AT_BASF'
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
            FieldName = 'VL_TRANSMISSAO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_FOLLOWUP'
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
            FieldName = 'VL_REVISAO_FAT'
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
            FieldName = 'VL_DEMURRAGE'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_CHEC_DOC'
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
            FieldName = 'VL_ENT_BASF'
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
            FieldName = 'VL_ENT_BSG'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 63
            Visible = True
          end>
      end
      object DBEdit1: TDBEdit
        Left = 248
        Top = 39
        Width = 96
        Height = 21
        DataField = 'VL_AUTOCLOSER'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
      end
      object DBCheckBox67: TDBCheckBox
        Left = 682
        Top = 252
        Width = 19
        Height = 22
        BiDiMode = bdRightToLeftReadingOnly
        Caption = 'Integra'#231#227'o Contabil'
        DataField = 'IN_INTEGRACAO_CONTABIL'
        DataSource = datm_param_sistema.ds_parametros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 21
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = dbedt_dt_solic_chChange
      end
      object DBEdit2: TDBEdit
        Left = 592
        Top = 252
        Width = 64
        Height = 21
        DataField = 'QT_DIAS_CAT63'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 6
        TabOrder = 20
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_nr_ult_dem: TDBEdit
        Left = 402
        Top = 88
        Width = 122
        Height = 21
        DataField = 'NR_ULT_DEM'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 5
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_nr_ult_rd: TDBEdit
        Left = 13
        Top = 137
        Width = 89
        Height = 21
        DataField = 'NR_ULT_RD'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 9
        OnChange = dbedt_dt_solic_chChange
      end
      object DBEdit3: TDBEdit
        Left = 533
        Top = 184
        Width = 116
        Height = 21
        DataField = 'VL_PC_PROTEC_CAMBIAL'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 3
        TabOrder = 13
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_nr_carteira_cob_autExit
      end
    end
    object ts_solic_ch: TTabSheet
      Caption = 'Solicita'#231#227'o de Cheque'
      object bvl_solic_cheque: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object Label1: TLabel
        Left = 40
        Top = 34
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 144
        Top = 34
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 197
        Top = 34
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Seq.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 40
        Top = 81
        Width = 106
        Height = 39
        Caption = 'Cancela Cheque Administrativo na Tela de Montagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label26: TLabel
        Left = 40
        Top = 156
        Width = 106
        Height = 39
        Caption = 'Cancela Cheque Operacional na Tela de Montagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object dbedt_dt_solic_ch: TDBEdit
        Left = 40
        Top = 48
        Width = 97
        Height = 21
        DataField = 'DT_SOLIC_CH'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_hr_solic_ch: TDBEdit
        Left = 144
        Top = 48
        Width = 45
        Height = 21
        DataField = 'HM_PARA_SOLIC_CH'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 1
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_seq_solic_ch: TDBEdit
        Left = 196
        Top = 48
        Width = 29
        Height = 21
        DataField = 'NR_SOLIC_CH'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 40
        Top = 123
        Width = 97
        Height = 21
        DataField = 'IN_CANC_CH_ADM'
        DataSource = datm_param_sistema.ds_parametros
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_param_sistema.ds_yesno
        TabOrder = 3
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 40
        Top = 197
        Width = 97
        Height = 21
        DataField = 'IN_CANC_CH_OP'
        DataSource = datm_param_sistema.ds_parametros
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_param_sistema.ds_yesno
        TabOrder = 4
      end
    end
    object ts_eventos_1: TTabSheet
      Caption = 'Eventos - 1/5'
      object bvl_eventos_1: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object lbl_cd_ev_reg_di: TLabel
        Left = 12
        Top = 9
        Width = 127
        Height = 13
        Caption = 'Evento Registro da DI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_reg_di: TSpeedButton
        Left = 269
        Top = 22
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_prev_chegada: TSpeedButton
        Left = 573
        Top = 22
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_prev_chegada: TLabel
        Left = 316
        Top = 9
        Width = 166
        Height = 13
        Caption = 'Evento Previs'#227'o de Chegada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_conhecimento: TLabel
        Left = 12
        Top = 43
        Width = 125
        Height = 13
        Caption = 'Evento Conhecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_conhecimento: TSpeedButton
        Left = 269
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_chegada: TSpeedButton
        Left = 573
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_chegada: TLabel
        Left = 316
        Top = 43
        Width = 95
        Height = 13
        Caption = 'Evento Chegada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_pagto_li: TLabel
        Left = 12
        Top = 78
        Width = 93
        Height = 13
        Caption = 'Evento Pagto LI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_pagto_li: TSpeedButton
        Left = 269
        Top = 91
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_etd: TSpeedButton
        Left = 573
        Top = 91
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_etd: TLabel
        Left = 316
        Top = 78
        Width = 70
        Height = 13
        Caption = 'Evento ETD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_espera_navio: TLabel
        Left = 12
        Top = 113
        Width = 139
        Height = 13
        Caption = 'Evento Espera do Navio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_espera_navio: TSpeedButton
        Left = 269
        Top = 126
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_dig_di: TSpeedButton
        Left = 573
        Top = 126
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_dig_di: TLabel
        Left = 316
        Top = 113
        Width = 134
        Height = 13
        Caption = 'Evento Digita'#231#227'o da DI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_ent: TLabel
        Left = 12
        Top = 147
        Width = 144
        Height = 13
        Caption = 'Evento Entrada do Navio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_ent: TSpeedButton
        Left = 269
        Top = 160
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_ci: TSpeedButton
        Left = 573
        Top = 160
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_ci: TLabel
        Left = 316
        Top = 147
        Width = 57
        Height = 13
        Caption = 'Evento CI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_envio_saque_bordero: TLabel
        Left = 12
        Top = 181
        Width = 185
        Height = 13
        Caption = 'Evento Envio de Saque/Border'#244
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_envio_saque_bordero: TSpeedButton
        Left = 269
        Top = 194
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_recep_analise: TSpeedButton
        Left = 573
        Top = 194
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_recep_analise: TLabel
        Left = 316
        Top = 181
        Width = 159
        Height = 13
        Caption = 'Evento Recep'#231#227'o e An'#225'lise'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_insp_ma: TLabel
        Left = 12
        Top = 214
        Width = 137
        Height = 13
        Caption = 'Evento Inspe'#231#227'o no MA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_insp_ma: TSpeedButton
        Left = 269
        Top = 227
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_receb_doc: TSpeedButton
        Left = 573
        Top = 227
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_receb_doc: TLabel
        Left = 316
        Top = 214
        Width = 211
        Height = 13
        Caption = 'Evento Recebimento de Documentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_prev_desemb: TLabel
        Left = 12
        Top = 248
        Width = 193
        Height = 13
        Caption = 'Evento Previs'#227'o de Desembara'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_prev_desemb: TSpeedButton
        Left = 269
        Top = 261
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_abre_proc: TSpeedButton
        Left = 573
        Top = 261
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_abre_proc: TLabel
        Left = 316
        Top = 248
        Width = 167
        Height = 13
        Caption = 'Evento Abertura do Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_desemb: TLabel
        Left = 12
        Top = 281
        Width = 122
        Height = 13
        Caption = 'Evento Desembara'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_desemb: TSpeedButton
        Left = 269
        Top = 294
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_num_imp: TSpeedButton
        Left = 573
        Top = 294
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_num_imp: TLabel
        Left = 316
        Top = 281
        Width = 205
        Height = 13
        Caption = 'Evento Solic. Numer'#225'rio Importa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_descarga: TLabel
        Left = 12
        Top = 314
        Width = 99
        Height = 13
        Caption = 'Evento Descarga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_descarga: TSpeedButton
        Left = 269
        Top = 327
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_rec_imp: TSpeedButton
        Left = 573
        Top = 327
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_rec_imp: TLabel
        Left = 316
        Top = 314
        Width = 239
        Height = 13
        Caption = 'Evento Recebto de Numer'#225'rio Importa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_cd_ev_reg_di: TDBEdit
        Left = 12
        Top = 22
        Width = 33
        Height = 21
        DataField = 'CD_EV_REG_DI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_reg_diExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_reg_di: TDBEdit
        Left = 50
        Top = 22
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvRegDI'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 39
      end
      object dbedt_cd_ev_prev_chegada: TDBEdit
        Left = 316
        Top = 22
        Width = 33
        Height = 21
        DataField = 'CD_EV_PREV_CHEGADA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 10
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_prev_chegadaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_prev_chegada: TDBEdit
        Left = 354
        Top = 22
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvPrevChegEE'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 22
      end
      object dbedt_cd_ev_conhecimento: TDBEdit
        Left = 12
        Top = 56
        Width = 33
        Height = 21
        DataField = 'CD_EV_CONHECIMENTO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 1
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_conhecimentoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_conhecimento: TDBEdit
        Left = 50
        Top = 56
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvConhecimento'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 29
      end
      object dbedt_cd_ev_chegada: TDBEdit
        Left = 316
        Top = 56
        Width = 33
        Height = 21
        DataField = 'CD_EV_CHEGADA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 11
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_chegadaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_chegada: TDBEdit
        Left = 354
        Top = 56
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvChegada'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 25
      end
      object dbedt_cd_ev_pagto_li: TDBEdit
        Left = 12
        Top = 91
        Width = 33
        Height = 21
        DataField = 'CD_EV_PAGTO_LI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_pagto_liExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_pagto_li: TDBEdit
        Left = 50
        Top = 91
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvPagtoLI'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 24
      end
      object dbedt_cd_ev_etd: TDBEdit
        Left = 316
        Top = 91
        Width = 33
        Height = 21
        DataField = 'CD_EV_ETD'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 12
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_etdExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_etd: TDBEdit
        Left = 354
        Top = 91
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvETD'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 21
      end
      object dbedt_cd_ev_espera_navio: TDBEdit
        Left = 12
        Top = 126
        Width = 33
        Height = 21
        DataField = 'CD_EV_ESPERA_NAVIO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 3
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_espera_navioExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_espera_navio: TDBEdit
        Left = 50
        Top = 126
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvEsperaNavio'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 23
      end
      object dbedt_cd_ev_dig_di: TDBEdit
        Left = 316
        Top = 126
        Width = 33
        Height = 21
        DataField = 'CD_EV_DIG_DI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 13
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_dig_diExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_dig_di: TDBEdit
        Left = 354
        Top = 126
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvDigDI'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 26
      end
      object dbedt_cd_ev_ent: TDBEdit
        Left = 12
        Top = 160
        Width = 33
        Height = 21
        DataField = 'CD_EV_ENT'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 4
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_entExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_ent: TDBEdit
        Left = 50
        Top = 160
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvEnt'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 27
      end
      object dbedt_cd_ev_ci: TDBEdit
        Left = 316
        Top = 160
        Width = 33
        Height = 21
        DataField = 'CD_EV_CI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 14
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_ciExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_ci: TDBEdit
        Left = 354
        Top = 160
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvCI'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 28
      end
      object dbedt_cd_ev_envio_saque_bordero: TDBEdit
        Left = 12
        Top = 194
        Width = 33
        Height = 21
        DataField = 'CD_EV_ENVIO_SAQUE_BORDERO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 5
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_envio_saque_borderoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_envio_saque_bordero: TDBEdit
        Left = 50
        Top = 194
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvEnvioSaqueBordero'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 30
      end
      object dbedt_cd_ev_recep_analise: TDBEdit
        Left = 316
        Top = 194
        Width = 33
        Height = 21
        DataField = 'CD_EV_RECEP_ANALISE'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 15
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_recep_analiseExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_recep_analise: TDBEdit
        Left = 354
        Top = 194
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvRecepAnalise'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 31
      end
      object dbedt_cd_ev_insp_ma: TDBEdit
        Left = 12
        Top = 227
        Width = 33
        Height = 21
        DataField = 'CD_EV_INSP_MA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 6
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_insp_maExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_insp_ma: TDBEdit
        Left = 50
        Top = 227
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvInspMA'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 20
      end
      object dbedt_cd_ev_receb_doc: TDBEdit
        Left = 316
        Top = 227
        Width = 33
        Height = 21
        DataField = 'CD_EV_RECEB_DOC'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 16
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_receb_docExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_receb_doc: TDBEdit
        Left = 354
        Top = 227
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvRecebDoc'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 32
      end
      object dbedt_cd_ev_prev_desemb: TDBEdit
        Left = 12
        Top = 261
        Width = 33
        Height = 21
        DataField = 'CD_EV_PREV_DESEMB'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 7
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_prev_desembExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_prev_desemb: TDBEdit
        Left = 50
        Top = 261
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvPrevDesemb'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 34
      end
      object dbedt_cd_ev_abre_proc: TDBEdit
        Left = 316
        Top = 261
        Width = 33
        Height = 21
        DataField = 'CD_EV_ABRE_PROC'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 17
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_abre_procExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_abre_proc: TDBEdit
        Left = 354
        Top = 261
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvAbreProc'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 33
      end
      object dbedt_cd_ev_desemb: TDBEdit
        Left = 12
        Top = 294
        Width = 33
        Height = 21
        DataField = 'CD_EV_DESEMB'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 8
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_desembExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_desemb: TDBEdit
        Left = 50
        Top = 294
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvDesemb'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 35
      end
      object dbedt_cd_ev_num_imp: TDBEdit
        Left = 316
        Top = 294
        Width = 33
        Height = 21
        DataField = 'CD_EV_NUM_IMP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 18
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_num_impExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_num_imp: TDBEdit
        Left = 354
        Top = 294
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvNumImp'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 36
      end
      object dbedt_cd_ev_descarga: TDBEdit
        Left = 12
        Top = 327
        Width = 33
        Height = 21
        DataField = 'CD_EV_DESCARGA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 9
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_descargaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_descarga: TDBEdit
        Left = 50
        Top = 327
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvDescarga'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 37
      end
      object dbedt_cd_ev_rec_imp: TDBEdit
        Left = 316
        Top = 327
        Width = 33
        Height = 21
        DataField = 'CD_EV_REC_IMP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 19
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_rec_impExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_rec_imp: TDBEdit
        Left = 354
        Top = 327
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvRecImp'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 38
      end
    end
    object ts_eventos_2: TTabSheet
      Caption = 'Eventos - 2/5'
      object bvl_eventos_2: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object lbl_cd_ev_num_frete: TLabel
        Left = 12
        Top = 9
        Width = 161
        Height = 13
        Caption = 'Evento Sol. Numer'#225'rio Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_num_frete: TSpeedButton
        Left = 269
        Top = 22
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_pag_arm: TSpeedButton
        Left = 573
        Top = 22
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_pag_arm: TLabel
        Left = 316
        Top = 9
        Width = 190
        Height = 13
        Caption = 'Evento Pagamento Armazenagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_rec_frete: TLabel
        Left = 12
        Top = 43
        Width = 166
        Height = 13
        Caption = 'Evento Rec. Numer'#225'rio Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_rec_frete: TSpeedButton
        Left = 269
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_pag_sda: TSpeedButton
        Left = 573
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_pag_sda: TLabel
        Left = 316
        Top = 43
        Width = 137
        Height = 13
        Caption = 'Evento Pagamento SDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_num_exp: TLabel
        Left = 12
        Top = 78
        Width = 196
        Height = 13
        Caption = 'Evento Sol. Numer'#225'rio Exporta'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_num_exp: TSpeedButton
        Left = 269
        Top = 91
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_envio_imp: TSpeedButton
        Left = 573
        Top = 91
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_envio_doc_cli: TLabel
        Left = 316
        Top = 78
        Width = 214
        Height = 13
        Caption = 'Envio de Doc. ao Imp. Banco/Agente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_rec_exp: TLabel
        Left = 12
        Top = 113
        Width = 248
        Height = 13
        Caption = 'Evento Recebimento Numer'#225'rio Exporta'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_rec_exp: TSpeedButton
        Left = 269
        Top = 126
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_envio_fat: TSpeedButton
        Left = 573
        Top = 126
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_envio_fat: TLabel
        Left = 316
        Top = 113
        Width = 218
        Height = 13
        Caption = 'Evento Envio da Fatura para o Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_pres_carga: TLabel
        Left = 12
        Top = 147
        Width = 153
        Height = 13
        Caption = 'Evento Presen'#231'a de Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_pres_carga: TSpeedButton
        Left = 269
        Top = 160
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_cambio_ok: TSpeedButton
        Left = 573
        Top = 160
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_cambio_ok: TLabel
        Left = 316
        Top = 147
        Width = 107
        Height = 13
        Caption = 'Evento Cambio OK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_vencto_li: TLabel
        Left = 12
        Top = 181
        Width = 144
        Height = 13
        Caption = 'Evento Vencimento da LI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_vencto_li: TSpeedButton
        Left = 269
        Top = 194
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_prev_embarque: TSpeedButton
        Left = 573
        Top = 194
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_prev_embarque: TLabel
        Left = 316
        Top = 181
        Width = 172
        Height = 13
        Caption = 'Evento Previs'#227'o de Embarque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_desova: TLabel
        Left = 12
        Top = 214
        Width = 88
        Height = 13
        Caption = 'Evento Desova'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_desova: TSpeedButton
        Left = 269
        Top = 227
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_embarque: TSpeedButton
        Left = 573
        Top = 227
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_embarque: TLabel
        Left = 316
        Top = 214
        Width = 101
        Height = 13
        Caption = 'Evento Embarque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_lib_bl: TLabel
        Left = 12
        Top = 248
        Width = 138
        Height = 13
        Caption = 'Evento Libera'#231#227'o do BL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_lib_bl: TSpeedButton
        Left = 269
        Top = 261
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_entrega_merc: TSpeedButton
        Left = 573
        Top = 261
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_entrega_merc: TLabel
        Left = 316
        Top = 248
        Width = 174
        Height = 13
        Caption = 'Evento Entrega da Mercadoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_pag_demur: TLabel
        Left = 12
        Top = 281
        Width = 173
        Height = 13
        Caption = 'Evento Pagamento Demurrage'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_pag_demur: TSpeedButton
        Left = 269
        Top = 294
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_averbacao: TSpeedButton
        Left = 573
        Top = 294
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_averbacao: TLabel
        Left = 316
        Top = 281
        Width = 106
        Height = 13
        Caption = 'Evento Averba'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ev_pagto_icms: TLabel
        Left = 12
        Top = 316
        Width = 142
        Height = 13
        Caption = 'Evento Pagamento ICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_pagto_icms: TSpeedButton
        Left = 269
        Top = 329
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl_cd_ev_rec_fed: TLabel
        Left = 316
        Top = 316
        Width = 201
        Height = 13
        Caption = 'Evento Entrega na Receita Federal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_ent_rec_fed: TSpeedButton
        Left = 573
        Top = 330
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
        OnClick = btn_co_ev_reg_diClick
      end
      object dbedt_cd_ev_num_frete: TDBEdit
        Left = 12
        Top = 22
        Width = 33
        Height = 21
        DataField = 'CD_EV_NUM_FRETE'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_num_freteExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_num_frete: TDBEdit
        Left = 50
        Top = 22
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvNumFrete'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 20
      end
      object dbedt_cd_ev_pag_arm: TDBEdit
        Left = 316
        Top = 22
        Width = 33
        Height = 21
        DataField = 'CD_EV_PAG_ARM'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 10
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_pag_armExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_pag_arm: TDBEdit
        Left = 354
        Top = 22
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvPagArm'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 21
      end
      object dbedt_cd_ev_rec_frete: TDBEdit
        Left = 12
        Top = 56
        Width = 33
        Height = 21
        DataField = 'CD_EV_REC_FRETE'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 1
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_rec_freteExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_rec_frete: TDBEdit
        Left = 50
        Top = 56
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvRecFrete'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 22
      end
      object dbedt_cd_ev_pag_sda: TDBEdit
        Left = 316
        Top = 56
        Width = 33
        Height = 21
        DataField = 'CD_EV_PAG_SDA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 11
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_pag_sdaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_pag_sda: TDBEdit
        Left = 354
        Top = 56
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvPagSDA'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 23
      end
      object dbedt_cd_ev_num_exp: TDBEdit
        Left = 12
        Top = 91
        Width = 33
        Height = 21
        DataField = 'CD_EV_NUM_EXP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_num_expExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_num_exp: TDBEdit
        Left = 50
        Top = 91
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvNumExp'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 24
      end
      object dbedt_cd_ev_envio_imp: TDBEdit
        Left = 316
        Top = 91
        Width = 33
        Height = 21
        DataField = 'CD_EV_ENVIO_DOC_CLI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 12
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_envio_impExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_envio_imp: TDBEdit
        Left = 354
        Top = 91
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvEnvioDocCli'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 25
      end
      object dbedt_cd_ev_rec_exp: TDBEdit
        Left = 12
        Top = 126
        Width = 33
        Height = 21
        DataField = 'CD_EV_REC_EXP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 3
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_rec_expExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_rec_exp: TDBEdit
        Left = 50
        Top = 126
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvRecExp'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 26
      end
      object dbedt_cd_ev_envio_fat: TDBEdit
        Left = 316
        Top = 126
        Width = 33
        Height = 21
        DataField = 'CD_EV_ENVIO_FAT'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 13
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_envio_fatExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_envio_fat: TDBEdit
        Left = 354
        Top = 126
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvEnvioFat'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 27
      end
      object dbedt_cd_ev_pres_carga: TDBEdit
        Left = 12
        Top = 160
        Width = 33
        Height = 21
        DataField = 'CD_EV_PRES_CARGA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 4
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_pres_cargaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_pres_carga: TDBEdit
        Left = 50
        Top = 160
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvPresCarga'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 28
      end
      object dbedt_cd_ev_cambio_ok: TDBEdit
        Left = 316
        Top = 160
        Width = 33
        Height = 21
        DataField = 'CD_EV_CAMBIO_OK'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 14
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_cambio_okExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_cambio_ok: TDBEdit
        Left = 354
        Top = 160
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvCambioOK'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 29
      end
      object dbedt_cd_ev_vencto_li: TDBEdit
        Left = 12
        Top = 194
        Width = 33
        Height = 21
        DataField = 'CD_EV_VENCTO_LI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 5
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_vencto_liExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_vencto_li: TDBEdit
        Left = 50
        Top = 194
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvVenctoLI'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 30
      end
      object dbedt_cd_ev_prev_embarque: TDBEdit
        Left = 316
        Top = 194
        Width = 33
        Height = 21
        DataField = 'CD_EV_PREV_EMBARQUE'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 15
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_prev_embarqueExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_prev_embarque: TDBEdit
        Left = 354
        Top = 194
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvPrevEmbarque'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 31
      end
      object dbedt_cd_ev_desova: TDBEdit
        Left = 12
        Top = 227
        Width = 33
        Height = 21
        DataField = 'CD_EV_DESOVA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 6
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_desovaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_desova: TDBEdit
        Left = 50
        Top = 227
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvDesova'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 32
      end
      object dbedt_cd_ev_embarque: TDBEdit
        Left = 316
        Top = 227
        Width = 33
        Height = 21
        DataField = 'CD_EV_EMBARQUE'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 16
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_embarqueExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_embarque: TDBEdit
        Left = 354
        Top = 227
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvEmbarque'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 33
      end
      object dbedt_cd_ev_lib_bl: TDBEdit
        Left = 12
        Top = 261
        Width = 33
        Height = 21
        DataField = 'CD_EV_LIB_BL'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 7
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_lib_blExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_lib_bl: TDBEdit
        Left = 50
        Top = 261
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvLibBL'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 34
      end
      object dbedt_cd_ev_entrega_merc: TDBEdit
        Left = 316
        Top = 261
        Width = 33
        Height = 21
        DataField = 'CD_EV_ENTREGA_MERC'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 17
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_entrega_mercExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_entrega_merc: TDBEdit
        Left = 354
        Top = 261
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvEntregaMerc'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 35
      end
      object dbedt_cd_ev_pag_demur: TDBEdit
        Left = 12
        Top = 294
        Width = 33
        Height = 21
        DataField = 'CD_EV_PAG_DEMUR'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 8
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_pag_demurExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_pag_demur: TDBEdit
        Left = 50
        Top = 294
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvPagDemur'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 36
      end
      object dbedt_cd_ev_averbacao: TDBEdit
        Left = 316
        Top = 294
        Width = 33
        Height = 21
        DataField = 'CD_EV_AVERBACAO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 18
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_averbacaoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_averbacao: TDBEdit
        Left = 354
        Top = 294
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvAverbacao'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 37
      end
      object dbedt_cd_ev_pagto_icms: TDBEdit
        Left = 12
        Top = 329
        Width = 33
        Height = 21
        DataField = 'CD_EV_PAG_ICMS'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 9
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_pagto_icmsExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_pagto_icms: TDBEdit
        Left = 50
        Top = 329
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvPagtoICMS'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 38
      end
      object dbedt_cd_ev_ent_rec_fed: TDBEdit
        Left = 316
        Top = 330
        Width = 33
        Height = 21
        DataField = 'CD_EV_ENT_REC_FED'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 19
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_ent_rec_fedExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_ent_rec_fed: TDBEdit
        Left = 354
        Top = 330
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvEntRecFed'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 39
      end
    end
    object ts_eventos_3: TTabSheet
      Caption = 'Eventos - 3/5'
      object bvl_eventos_3: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object Label17: TLabel
        Left = 12
        Top = 9
        Width = 98
        Height = 13
        Caption = 'Evento Remo'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_remocao: TSpeedButton
        Left = 270
        Top = 22
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label18: TLabel
        Left = 12
        Top = 44
        Width = 194
        Height = 13
        Caption = 'Evento Previs'#227'o de Carregamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_prev_carregamento: TSpeedButton
        Left = 270
        Top = 57
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label20: TLabel
        Left = 12
        Top = 78
        Width = 144
        Height = 13
        Caption = 'Evento Elabora'#231#227'o da DI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_abert_di: TSpeedButton
        Left = 270
        Top = 91
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label21: TLabel
        Left = 12
        Top = 112
        Width = 175
        Height = 13
        Caption = 'Evento Nota Fiscal de Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_nf_entrada: TSpeedButton
        Left = 270
        Top = 125
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label22: TLabel
        Left = 12
        Top = 146
        Width = 245
        Height = 13
        Caption = 'Evento Previs'#227'o de Entrega da Mercadoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_prev_entr_merc: TSpeedButton
        Left = 270
        Top = 159
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_nf_transp: TSpeedButton
        Left = 270
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label4: TLabel
        Left = 12
        Top = 180
        Width = 220
        Height = 13
        Caption = 'Envio da Nota Fiscal ao Transportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 12
        Top = 214
        Width = 77
        Height = 13
        Caption = 'Evento Cruze'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_cruze: TSpeedButton
        Left = 270
        Top = 227
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label11: TLabel
        Left = 12
        Top = 249
        Width = 123
        Height = 13
        Caption = 'Evento Apresenta'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_apresentacao: TSpeedButton
        Left = 270
        Top = 263
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label24: TLabel
        Left = 12
        Top = 284
        Width = 162
        Height = 13
        Caption = 'Evento Previs'#227'o na  F'#225'brica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_prev_fabrica: TSpeedButton
        Left = 270
        Top = 298
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label23: TLabel
        Left = 320
        Top = 9
        Width = 122
        Height = 13
        Caption = 'Evento Registro DDE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_reg_dde: TSpeedButton
        Left = 578
        Top = 22
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label29: TLabel
        Left = 320
        Top = 44
        Width = 113
        Height = 13
        Caption = 'Evento Registro RE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_reg_re: TSpeedButton
        Left = 578
        Top = 57
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label30: TLabel
        Left = 320
        Top = 78
        Width = 118
        Height = 13
        Caption = 'Evento Inspe'#231#227'o OK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_insp_ok: TSpeedButton
        Left = 578
        Top = 91
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label39: TLabel
        Left = 320
        Top = 112
        Width = 103
        Height = 13
        Caption = 'Evento Atraca'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_atracacao: TSpeedButton
        Left = 578
        Top = 125
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label51: TLabel
        Left = 320
        Top = 146
        Width = 171
        Height = 13
        Caption = 'Evento Solicita'#231#227'o do C'#226'mbio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_solic_cambio: TSpeedButton
        Left = 578
        Top = 159
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label52: TLabel
        Left = 320
        Top = 180
        Width = 170
        Height = 13
        Caption = 'Evento Solicita'#231#227'o do Seguro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_solic_seguro: TSpeedButton
        Left = 578
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label53: TLabel
        Left = 320
        Top = 214
        Width = 181
        Height = 13
        Caption = 'Evento Recebimento do Seguro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_receb_seguro: TSpeedButton
        Left = 578
        Top = 227
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label54: TLabel
        Left = 12
        Top = 321
        Width = 101
        Height = 13
        Caption = 'Evento Libera'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_liberacao: TSpeedButton
        Left = 270
        Top = 335
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label55: TLabel
        Left = 320
        Top = 249
        Width = 184
        Height = 13
        Caption = 'Evento Solicita'#231#227'o do Minist'#233'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_solic_ministerio: TSpeedButton
        Left = 578
        Top = 263
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label56: TLabel
        Left = 320
        Top = 284
        Width = 195
        Height = 13
        Caption = 'Evento Recebimento do Minist'#233'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_receb_ministerio: TSpeedButton
        Left = 578
        Top = 298
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label50: TLabel
        Left = 320
        Top = 321
        Width = 77
        Height = 13
        Caption = 'Evento Canal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_canal: TSpeedButton
        Left = 578
        Top = 335
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
        OnClick = btn_co_ev_reg_diClick
      end
      object dbedt_cd_ev_remocao: TDBEdit
        Left = 12
        Top = 22
        Width = 33
        Height = 21
        DataField = 'CD_EV_REMOCAO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_remocaoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_remocao: TDBEdit
        Left = 51
        Top = 22
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvRemocao'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 20
      end
      object dbedt_cd_ev_prev_carregamento: TDBEdit
        Left = 12
        Top = 57
        Width = 33
        Height = 21
        DataField = 'CD_EV_PREV_CARREGAMENTO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 1
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_prev_carregamentoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_prev_carregamento: TDBEdit
        Left = 51
        Top = 57
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvPrevCarregamento'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 21
      end
      object dbedt_cd_ev_abert_di: TDBEdit
        Left = 12
        Top = 91
        Width = 33
        Height = 21
        DataField = 'CD_EV_ABERT_DI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_abert_diExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_abertura_di: TDBEdit
        Left = 51
        Top = 91
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvAbertDI'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 22
      end
      object dbedt_cd_ev_nf_entrada: TDBEdit
        Left = 12
        Top = 125
        Width = 33
        Height = 21
        DataField = 'CD_EV_NF_ENTRADA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 3
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_nf_entradaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_nf_entrada: TDBEdit
        Left = 51
        Top = 125
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvNFEntr'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 23
      end
      object dbedt_cd_ev_prev_entr_merc: TDBEdit
        Left = 12
        Top = 159
        Width = 33
        Height = 21
        DataField = 'CD_EV_PREV_ENTR_MERC'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 4
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_prev_entr_mercExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_prev_entr_merc: TDBEdit
        Left = 51
        Top = 159
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvPrevEntrMerc'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 24
      end
      object dbedt_cd_ev_nf_transp: TDBEdit
        Left = 12
        Top = 193
        Width = 33
        Height = 21
        DataField = 'CD_EV_NF_TRANSP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 5
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_nf_transpExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_nf_transp: TDBEdit
        Left = 51
        Top = 193
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvNfTransp'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 25
      end
      object dbedt_cd_ev_cruze: TDBEdit
        Left = 12
        Top = 227
        Width = 33
        Height = 21
        DataField = 'CD_EV_CRUZE'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 6
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_cruzeExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_cruze: TDBEdit
        Left = 51
        Top = 227
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvCruze'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 26
      end
      object dbedt_cd_ev_apresentacao: TDBEdit
        Left = 12
        Top = 263
        Width = 33
        Height = 21
        DataField = 'CD_EV_APRESENTACAO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 7
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_apresentacaoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_apresentacao: TDBEdit
        Left = 51
        Top = 263
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvApresentacao'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 27
      end
      object dbedt_cd_ev_prev_fabrica: TDBEdit
        Left = 12
        Top = 298
        Width = 33
        Height = 21
        DataField = 'CD_EV_PREV_FABRICA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 8
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_prev_fabricaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_prev_fabrica: TDBEdit
        Left = 51
        Top = 298
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvPrevFabrica'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 28
      end
      object dbedt_cd_ev_reg_dde: TDBEdit
        Left = 320
        Top = 22
        Width = 33
        Height = 21
        DataField = 'CD_EV_REG_DDE'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 10
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_reg_ddeExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_reg_dde: TDBEdit
        Left = 359
        Top = 22
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvRegDDE'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 29
      end
      object dbedt_cd_ev_reg_re: TDBEdit
        Left = 320
        Top = 57
        Width = 33
        Height = 21
        DataField = 'CD_EV_REG_RE'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 11
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_reg_reExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_reg_re: TDBEdit
        Left = 359
        Top = 57
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvRegRE'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 30
      end
      object dbedt_cd_ev_insp_ok: TDBEdit
        Left = 320
        Top = 91
        Width = 33
        Height = 21
        DataField = 'CD_EV_INSP_OK'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 12
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_insp_okExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_insp_ok: TDBEdit
        Left = 359
        Top = 91
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvInspOk'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 31
      end
      object dbedt_cd_ev_atracacao: TDBEdit
        Left = 320
        Top = 125
        Width = 34
        Height = 21
        DataField = 'CD_EV_ATRACACAO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 13
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_atracacaoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_atracacao: TDBEdit
        Left = 359
        Top = 125
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvAtracacao'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 32
      end
      object dbedt_cd_ev_solic_cambio: TDBEdit
        Left = 320
        Top = 159
        Width = 34
        Height = 21
        DataField = 'CD_EV_SOLIC_CAMBIO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 14
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_solic_cambioExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_solic_cambio: TDBEdit
        Left = 359
        Top = 159
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvSolicCambio'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 33
      end
      object dbedt_cd_ev_solic_seguro: TDBEdit
        Left = 320
        Top = 193
        Width = 34
        Height = 21
        DataField = 'CD_EV_SOLIC_SEGURO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 15
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_solic_seguroExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_solic_seguro: TDBEdit
        Left = 359
        Top = 193
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvSolicSeguro'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 34
      end
      object dbedt_cd_ev_receb_seguro: TDBEdit
        Left = 320
        Top = 227
        Width = 34
        Height = 21
        DataField = 'CD_EV_RECEB_SEGURO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 16
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_receb_seguroExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_receb_seguro: TDBEdit
        Left = 359
        Top = 227
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvRecebSeguro'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 35
      end
      object dbedt_cd_ev_liberacao: TDBEdit
        Left = 12
        Top = 335
        Width = 34
        Height = 21
        DataField = 'CD_EV_LIBERACAO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 9
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_liberacaoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_liberacao: TDBEdit
        Left = 51
        Top = 335
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvLiberacao'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 36
      end
      object dbedt_cd_ev_solic_ministerio: TDBEdit
        Left = 320
        Top = 263
        Width = 34
        Height = 21
        DataField = 'CD_EV_SOLIC_MINISTERIO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 17
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_solic_ministerioExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_solic_ministerio: TDBEdit
        Left = 359
        Top = 263
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvSolicMinisterio'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 37
      end
      object dbedt_cd_ev_receb_ministerio: TDBEdit
        Left = 320
        Top = 298
        Width = 34
        Height = 21
        DataField = 'CD_EV_RECEB_MINISTERIO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 18
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_receb_ministerioExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_receb_ministerio: TDBEdit
        Left = 359
        Top = 298
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvRecebMinisterio'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 38
      end
      object dbedt_cd_ev_canal: TDBEdit
        Left = 320
        Top = 335
        Width = 34
        Height = 21
        DataField = 'CD_EV_CANAL'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 19
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_canalExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_canal: TDBEdit
        Left = 359
        Top = 335
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvCanal'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 39
      end
    end
    object ts_eventos_4: TTabSheet
      Caption = 'Eventos - 4/5'
      object bvl_eventos_4: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object Label73: TLabel
        Left = 12
        Top = 9
        Width = 198
        Height = 13
        Caption = 'Evento Envio ao Com'#233'rcio Exterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_env_comext: TSpeedButton
        Left = 269
        Top = 22
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label74: TLabel
        Left = 12
        Top = 43
        Width = 169
        Height = 13
        Caption = 'Evento Libera'#231#227'o de Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_lib_est: TSpeedButton
        Left = 269
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label75: TLabel
        Left = 12
        Top = 78
        Width = 152
        Height = 13
        Caption = 'Evento Formata'#231#227'o / Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_form_dt: TSpeedButton
        Left = 269
        Top = 91
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label76: TLabel
        Left = 12
        Top = 113
        Width = 176
        Height = 13
        Caption = 'Evento Libera'#231#227'o para F'#225'brica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_lib_fab: TSpeedButton
        Left = 269
        Top = 126
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label77: TLabel
        Left = 12
        Top = 147
        Width = 166
        Height = 13
        Caption = 'Evento Recebimento do DHL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_rec_dhl: TSpeedButton
        Left = 269
        Top = 160
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label40: TLabel
        Left = 12
        Top = 181
        Width = 153
        Height = 13
        Caption = 'Evento Email de Libera'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label41: TLabel
        Left = 12
        Top = 215
        Width = 198
        Height = 13
        Caption = 'Evento Confec'#231#227'o de Documentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_conf_docs: TSpeedButton
        Left = 269
        Top = 228
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_email_lib: TSpeedButton
        Left = 269
        Top = 194
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label42: TLabel
        Left = 12
        Top = 249
        Width = 173
        Height = 13
        Caption = 'Evento Solicita'#231#227'o de Desova'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_solic_desova: TSpeedButton
        Left = 269
        Top = 262
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label45: TLabel
        Left = 12
        Top = 283
        Width = 167
        Height = 13
        Caption = 'Evento Certificado de Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_cert_origem: TSpeedButton
        Left = 269
        Top = 295
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label78: TLabel
        Left = 316
        Top = 9
        Width = 161
        Height = 13
        Caption = 'Evento Dt. Recebimento PO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_ped_rec: TSpeedButton
        Left = 573
        Top = 22
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label79: TLabel
        Left = 316
        Top = 43
        Width = 223
        Height = 13
        Caption = 'Evento Dt. Entrega Mercadoria F'#225'brica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_entr_merc_fabr: TSpeedButton
        Left = 573
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label80: TLabel
        Left = 316
        Top = 78
        Width = 139
        Height = 13
        Caption = 'Evento Dt. Necessidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_dt_necessidade: TSpeedButton
        Left = 573
        Top = 91
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label83: TLabel
        Left = 316
        Top = 113
        Width = 217
        Height = 13
        Caption = 'Evento Envios Documentos p/ Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_envio_doc_cli: TSpeedButton
        Left = 573
        Top = 126
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label84: TLabel
        Left = 316
        Top = 147
        Width = 163
        Height = 13
        Caption = 'Evento Data Chegada EADI '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_entr_eadi: TSpeedButton
        Left = 573
        Top = 160
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label86: TLabel
        Left = 317
        Top = 181
        Width = 170
        Height = 13
        Caption = 'Evento Data de Consolida'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_dt_consolidacao: TSpeedButton
        Left = 574
        Top = 194
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label87: TLabel
        Left = 317
        Top = 215
        Width = 180
        Height = 13
        Caption = 'Evento Recebimento do Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_receb_ped: TSpeedButton
        Left = 574
        Top = 228
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label88: TLabel
        Left = 318
        Top = 249
        Width = 206
        Height = 13
        Caption = 'Evento Solicita'#231#227'o de Ordem Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_solic_ov: TSpeedButton
        Left = 575
        Top = 262
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label89: TLabel
        Left = 318
        Top = 283
        Width = 206
        Height = 13
        Caption = 'Evento Solicita'#231#227'o de Ordem Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_solic_remessa: TSpeedButton
        Left = 575
        Top = 296
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label94: TLabel
        Left = 12
        Top = 317
        Width = 152
        Height = 13
        Caption = 'Envio DTA Transportadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_dta_transp: TSpeedButton
        Left = 269
        Top = 332
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label95: TLabel
        Left = 318
        Top = 317
        Width = 196
        Height = 13
        Caption = 'Evento Dt Parametriza'#231#227'o do DTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_param_dta: TSpeedButton
        Left = 575
        Top = 332
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
        OnClick = btn_co_ev_reg_diClick
      end
      object dbedt_cd_env_comext: TDBEdit
        Left = 12
        Top = 22
        Width = 33
        Height = 21
        DataField = 'CD_EV_ENV_COMEXT'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_env_comextExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_env_comext: TDBEdit
        Left = 50
        Top = 22
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvEnvComExt'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 1
      end
      object dbedt_cd_ev_lib_est: TDBEdit
        Left = 12
        Top = 56
        Width = 33
        Height = 21
        DataField = 'CD_EV_LIB_EST'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_lib_estExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_lib_est: TDBEdit
        Left = 50
        Top = 56
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvLibEst'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 3
      end
      object dbedt_cd_ev_form_dt: TDBEdit
        Left = 12
        Top = 91
        Width = 33
        Height = 21
        DataField = 'CD_EV_FORM_DT'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 4
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_form_dtExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_form_dt: TDBEdit
        Left = 50
        Top = 91
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvFormDt'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 5
      end
      object dbedt_cd_ev_lib_fab: TDBEdit
        Left = 12
        Top = 126
        Width = 33
        Height = 21
        DataField = 'CD_EV_LIB_FAB'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 6
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_lib_fabExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_lib_fab: TDBEdit
        Left = 50
        Top = 126
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvLibFab'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 7
      end
      object dbedt_cd_ev_rec_dhl: TDBEdit
        Left = 12
        Top = 160
        Width = 33
        Height = 21
        DataField = 'CD_EV_REC_DHL'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 8
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_rec_dhlExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_rec_dhl: TDBEdit
        Left = 50
        Top = 160
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvRecDHL'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 9
      end
      object dbedt_cd_ev_email_lib: TDBEdit
        Left = 12
        Top = 194
        Width = 33
        Height = 21
        DataField = 'CD_EV_EMAIL_LIB'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 10
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_email_libExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_email_lib: TDBEdit
        Left = 50
        Top = 194
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvEmailLib'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 11
      end
      object dbedt_cd_ev_conf_docs: TDBEdit
        Left = 12
        Top = 228
        Width = 33
        Height = 21
        DataField = 'CD_EV_CONF_DOCS'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 12
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_conf_docsExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_conf_docs: TDBEdit
        Left = 50
        Top = 228
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvConfDocs'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 13
      end
      object dbedt_cd_ev_solic_desova: TDBEdit
        Left = 12
        Top = 262
        Width = 33
        Height = 21
        DataField = 'CD_EV_SOLIC_DESOVA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 14
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_solic_desovaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_solic_desova: TDBEdit
        Left = 50
        Top = 262
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvSolicDesova'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 15
      end
      object dbedt_cd_ev_cert_origem: TDBEdit
        Left = 12
        Top = 296
        Width = 33
        Height = 21
        DataField = 'CD_EV_CERT_ORIGEM'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 16
        OnChange = dbedt_cd_ev_cert_origemChange
        OnExit = dbedt_cd_ev_cert_origemExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_cert_origem: TDBEdit
        Left = 50
        Top = 296
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvCertOrigem'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 17
      end
      object dbedt_cd_ev_ped_rec: TDBEdit
        Left = 316
        Top = 22
        Width = 33
        Height = 21
        DataField = 'CD_EV_PED_REC'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 18
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_ped_recExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_ped_rec: TDBEdit
        Left = 354
        Top = 22
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvPedRec'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 19
      end
      object dbedt_cd_ev_entr_merc_fabr: TDBEdit
        Left = 316
        Top = 56
        Width = 33
        Height = 21
        DataField = 'CD_EV_ENTR_MERC_FABR'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 20
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_entr_merc_fabrExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_entr_merc_fabr: TDBEdit
        Left = 354
        Top = 56
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvEntrMercFabr'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 21
      end
      object dbedt_cd_ev_dt_necessidade: TDBEdit
        Left = 316
        Top = 91
        Width = 33
        Height = 21
        DataField = 'CD_EV_NECESSIDADE'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 22
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_dt_necessidadeExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_dt_necessidade: TDBEdit
        Left = 354
        Top = 91
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvNecessidade'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 23
      end
      object dbedt_cd_ev_envio_doc_cli: TDBEdit
        Left = 316
        Top = 126
        Width = 33
        Height = 21
        DataField = 'CD_EV_ENVIO_DOC'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 24
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_envio_doc_cliExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_envio_doc_cli: TDBEdit
        Left = 354
        Top = 126
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvEnvioDoc'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 25
      end
      object dbedt_cd_ev_entr_eadi: TDBEdit
        Left = 316
        Top = 160
        Width = 33
        Height = 21
        DataField = 'CD_EV_ENTR_EADI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 26
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_entr_eadiExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_entr__eadi: TDBEdit
        Left = 354
        Top = 160
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvEntrEADI'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 27
      end
      object dbedt_cd_ev_dt_consolidacao: TDBEdit
        Left = 317
        Top = 194
        Width = 33
        Height = 21
        DataField = 'CD_EV_DT_CONSOLIDACAO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 28
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_dt_consolidacaoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_dt_consolidacao: TDBEdit
        Left = 355
        Top = 194
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvDtConsolidacao'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 29
      end
      object dbedt_cd_ev_receb_ped: TDBEdit
        Left = 317
        Top = 228
        Width = 33
        Height = 21
        DataField = 'CD_EV_RECEB_PED'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 30
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_receb_pedExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_receb_ped: TDBEdit
        Left = 355
        Top = 228
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvRecebPed'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 31
      end
      object dbedt_cd_ev_solic_ov: TDBEdit
        Left = 318
        Top = 262
        Width = 33
        Height = 21
        DataField = 'CD_EV_SOLIC_OV'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 32
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_solic_ovExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_solic_ov: TDBEdit
        Left = 355
        Top = 262
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvSolicOV'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 33
      end
      object dbedt_cd_ev_solic_remessa: TDBEdit
        Left = 318
        Top = 296
        Width = 33
        Height = 21
        DataField = 'CD_EV_SOLIC_REM'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 34
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_solic_remessaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_solic_remessa: TDBEdit
        Left = 355
        Top = 296
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvSolicRem'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 35
      end
      object dbedt_cd_ev_dta_transp: TDBEdit
        Left = 12
        Top = 332
        Width = 33
        Height = 21
        DataField = 'CD_EV_DTA_TRANSP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 36
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_dta_transpExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_dta_transp: TDBEdit
        Left = 50
        Top = 332
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvDtaTransp'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 37
      end
      object dbedt_cd_ev_param_dta: TDBEdit
        Left = 318
        Top = 332
        Width = 33
        Height = 21
        DataField = 'CD_EV_PARAM_DTA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 38
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_param_dtaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_param_dta: TDBEdit
        Left = 355
        Top = 332
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvParamDTA'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 39
      end
    end
    object ts_eventos_5: TTabSheet
      Caption = 'Eventos - 5/5'
      object bvl_eventos_5: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object Label96: TLabel
        Left = 12
        Top = 9
        Width = 203
        Height = 13
        Caption = 'Evento Dt Presen'#231'a de Carga EADI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_pres_carga_eadi: TSpeedButton
        Left = 271
        Top = 22
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
        OnClick = btn_co_ev_reg_diClick
      end
      object Label97: TLabel
        Left = 12
        Top = 46
        Width = 138
        Height = 13
        Caption = 'Evento Dt Registro DTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_registro_dta: TSpeedButton
        Left = 271
        Top = 57
        Width = 25
        Height = 25
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
        OnClick = btn_co_ev_reg_diClick
      end
      object lbl1: TLabel
        Left = 12
        Top = 86
        Width = 152
        Height = 13
        Caption = 'Evento Dt Entrada F'#225'brica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnCoEvEntFabr: TSpeedButton
        Left = 271
        Top = 99
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
        OnClick = btn_co_ev_reg_diClick
      end
      object dbedt_cd_ev_pres_carga_eadi: TDBEdit
        Left = 12
        Top = 22
        Width = 33
        Height = 21
        DataField = 'CD_EV_PRES_CARGA_EADI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_pres_carga_eadiExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_pres_carga_eadi: TDBEdit
        Left = 50
        Top = 22
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvPresCargaEADI'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 1
      end
      object dbedt_cd_ev_registro_dta: TDBEdit
        Left = 12
        Top = 59
        Width = 33
        Height = 21
        DataField = 'CD_EV_REG_DTA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_registro_dtaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_registro_dta: TDBEdit
        Left = 50
        Top = 59
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvRegDTA'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 3
      end
      object dbedtCdEvEntFabr: TDBEdit
        Left = 12
        Top = 99
        Width = 33
        Height = 21
        DataField = 'CD_EV_DT_ENT_FABR'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 4
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedtCdEvEntFabrExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedtNmEvEntFabr: TDBEdit
        Left = 50
        Top = 99
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCdEvEntFabr'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 5
      end
    end
    object ts_dir: TTabSheet
      Caption = 'Diret'#243'rios'
      object bvl_diretorio: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object Label5: TLabel
        Left = 15
        Top = 7
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'RISC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dir_contab: TLabel
        Left = 15
        Top = 55
        Width = 84
        Height = 13
        Alignment = taRightJustify
        Caption = 'Contabiliza'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_excel: TLabel
        Left = 15
        Top = 103
        Width = 88
        Height = 13
        Alignment = taRightJustify
        Caption = 'Microsoft Excel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_word: TLabel
        Left = 15
        Top = 149
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = 'Microsoft Word'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_ddmap: TLabel
        Left = 15
        Top = 195
        Width = 43
        Height = 13
        Caption = 'DDMap'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_path_cob_aut_imp: TLabel
        Left = 15
        Top = 243
        Width = 262
        Height = 13
        Caption = 'Gera'#231#227'o de Arquivos p/ Impress'#227'o de Boletos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_path_cob_aut_trans: TLabel
        Left = 15
        Top = 291
        Width = 299
        Height = 13
        Caption = 'Gera'#231#227'o de Arquivos p/ Transmiss'#227'o Cobr. Banc'#225'ria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label27: TLabel
        Left = 321
        Top = 7
        Width = 136
        Height = 13
        Caption = 'Arquivos da Nota Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label57: TLabel
        Left = 321
        Top = 55
        Width = 134
        Height = 13
        Caption = 'Integra'#231#227'o Work Image'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_path_risc: TDBEdit
        Left = 15
        Top = 23
        Width = 281
        Height = 21
        DataField = 'PATH_RISC'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_path_contabil: TDBEdit
        Left = 15
        Top = 71
        Width = 281
        Height = 21
        DataField = 'PATH_CONTABIL'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 1
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_path_excel: TDBEdit
        Left = 15
        Top = 119
        Width = 281
        Height = 21
        DataField = 'PATH_EXCEL'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_path_word: TDBEdit
        Left = 15
        Top = 165
        Width = 281
        Height = 21
        DataField = 'PATH_WORD'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 3
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_path_ddmap: TDBEdit
        Left = 15
        Top = 211
        Width = 281
        Height = 21
        DataField = 'PATH_DDMAP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 4
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_path_cob_aut_imp: TDBEdit
        Left = 15
        Top = 259
        Width = 281
        Height = 21
        DataField = 'PATH_COB_AUT_IMP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 5
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_path_cob_aut_trans: TDBEdit
        Left = 15
        Top = 307
        Width = 281
        Height = 21
        DataField = 'PATH_COB_AUT_TRANS'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 6
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_path_nf_dbf: TDBEdit
        Left = 321
        Top = 23
        Width = 281
        Height = 21
        DataField = 'PATH_NF_DBF'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 7
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_path_work_image: TDBEdit
        Left = 320
        Top = 72
        Width = 281
        Height = 21
        DataField = 'PATH_WORK_IMAGE'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 8
        OnChange = dbedt_dt_solic_chChange
      end
    end
    object ts_exp: TTabSheet
      Caption = 'Exporta'#231#227'o'
      object bvl_exportacao: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object Label9: TLabel
        Left = 42
        Top = 39
        Width = 137
        Height = 13
        Caption = 'Porcentagem de Seguro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 93
        Top = 61
        Width = 8
        Height = 13
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 40
        Top = 170
        Width = 144
        Height = 13
        Caption = 'Local Emiss'#227'o S'#227'o Paulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_local_emissao_sp: TSpeedButton
        Left = 309
        Top = 185
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
        OnClick = btn_co_local_emissao_spClick
      end
      object Label28: TLabel
        Left = 41
        Top = 220
        Width = 99
        Height = 26
        Caption = 'Agrupar Itens por Anexo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object lbl_quebra_por_vl_unit: TLabel
        Left = 169
        Top = 220
        Width = 106
        Height = 26
        Caption = 'Quebra Anexo RE por Valor Unit'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label31: TLabel
        Left = 297
        Top = 220
        Width = 116
        Height = 26
        Caption = 'Quebra Fabricantes por RE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object dbedt_nr_perc_seguro: TDBEdit
        Left = 41
        Top = 56
        Width = 48
        Height = 21
        DataField = 'PC_SEGURO_EXP'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 2
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
      end
      object GroupBox1: TGroupBox
        Left = 40
        Top = 88
        Width = 545
        Height = 73
        Caption = 'Classifica'#231#227'o Padr'#227'o para Processo / Documentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label13: TLabel
          Left = 9
          Top = 21
          Width = 79
          Height = 13
          Caption = 'Tipo do NCM '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 269
          Top = 21
          Width = 93
          Height = 13
          Caption = 'Tipo do NALADI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dblckbox_tp_ncm: TDBLookupComboBox
          Left = 9
          Top = 35
          Width = 168
          Height = 21
          DataField = 'TP_NCM'
          DataSource = datm_param_sistema.ds_parametros
          DropDownRows = 6
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'TP_NCM'
          ListField = 'NM_NCM'
          ListSource = datm_param_sistema.ds_tp_ncm
          ParentFont = False
          TabOrder = 0
          OnClick = dbedt_dt_solic_chChange
        end
        object dblckbox_tp_naladi: TDBLookupComboBox
          Left = 269
          Top = 35
          Width = 180
          Height = 21
          DataField = 'TP_NALADI'
          DataSource = datm_param_sistema.ds_parametros
          DropDownRows = 6
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'TP_NALADI'
          ListField = 'NM_NALADI'
          ListSource = datm_param_sistema.ds_tp_naladi
          ParentFont = False
          TabOrder = 1
          OnClick = dbedt_dt_solic_chChange
        end
      end
      object dbedt_cd_local_emissao_sp: TDBEdit
        Left = 40
        Top = 185
        Width = 33
        Height = 21
        DataField = 'CD_LOCAL_EMISSAO_SP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_local_emissao_spExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_local_emissao_sp: TDBEdit
        Left = 74
        Top = 185
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookLocalEmissaoSP'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 3
      end
      object dblckbox_agrupa_itens_por_anexo: TDBLookupComboBox
        Left = 41
        Top = 250
        Width = 97
        Height = 21
        DataField = 'IN_EXP_AGRUPA_ITENS'
        DataSource = datm_param_sistema.ds_parametros
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_param_sistema.ds_yesno
        TabOrder = 4
        OnClick = dblckbox_agrupa_itens_por_anexoClick
        OnExit = dblckbox_agrupa_itens_por_anexoClick
      end
      object dblckbox_quebra_anexo_por_vl_unit: TDBLookupComboBox
        Left = 169
        Top = 250
        Width = 97
        Height = 21
        DataField = 'IN_EXP_QUEBRA_VL_UNITARIO'
        DataSource = datm_param_sistema.ds_parametros
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_param_sistema.ds_yesno
        TabOrder = 5
        OnClick = dbedt_dt_solic_chChange
      end
      object dblckbox_quebra_fabric: TDBLookupComboBox
        Left = 297
        Top = 250
        Width = 97
        Height = 21
        DataField = 'IN_EXP_QUEBRA_FABRIC'
        DataSource = datm_param_sistema.ds_parametros
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_param_sistema.ds_yesno
        TabOrder = 6
        OnClick = dbedt_dt_solic_chChange
      end
    end
    object ts_entreposto: TTabSheet
      Caption = 'Entreposto'
      object bvl_entreposto: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object Label16: TLabel
        Left = 12
        Top = 9
        Width = 188
        Height = 13
        Caption = 'Evento Venda ( Nacionaliza'#231#227'o )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label65: TLabel
        Left = 12
        Top = 44
        Width = 217
        Height = 13
        Caption = 'Evento Envio Docs ( Nacionaliza'#231#227'o )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ev_venda_nac: TSpeedButton
        Left = 269
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
        OnClick = btn_co_ev_reg_diClick
      end
      object btn_co_ev_envio_doc_nac: TSpeedButton
        Left = 269
        Top = 57
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
        OnClick = btn_co_ev_reg_diClick
      end
      object dbedt_cd_ev_venda_nac: TDBEdit
        Left = 12
        Top = 23
        Width = 33
        Height = 21
        DataField = 'CD_EV_VENDA_NAC'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_venda_nacExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_cd_ev_envio_doc_nac: TDBEdit
        Left = 12
        Top = 57
        Width = 33
        Height = 21
        DataField = 'CD_EV_ENVIO_DOC_NAC'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 1
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ev_envio_doc_nacExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ev_envio_doc_nac: TDBEdit
        Left = 50
        Top = 57
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvEnvioDocNac'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 2
      end
      object dbedt_nm_ev_venda_nac: TDBEdit
        Left = 50
        Top = 23
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookEvVendaNac'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 3
      end
    end
    object ts_Cob_banc: TTabSheet
      Caption = 'Integra'#231#227'o Banc'#225'ria'
      object bvl_int_bancaria: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object lbl_vl_mora_dia: TLabel
        Left = 12
        Top = 9
        Width = 98
        Height = 13
        Caption = 'Valor % Mora Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object lbl_nr_remessa_inicial: TLabel
        Left = 170
        Top = 9
        Width = 70
        Height = 13
        Caption = 'N'#186' Remessa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label15: TLabel
        Left = 328
        Top = 9
        Width = 45
        Height = 13
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object lbl_cd_empresa_cob_aut: TLabel
        Left = 456
        Top = 5
        Width = 75
        Height = 13
        Caption = 'C'#243'd Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object lbl_nr_boleto_inicial: TLabel
        Left = 12
        Top = 53
        Width = 93
        Height = 13
        Caption = 'N'#186' Boleto Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_bco_cob_aut: TLabel
        Left = 170
        Top = 53
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
      object btn_co_banco_cob_aut: TSpeedButton
        Left = 434
        Top = 68
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
        OnClick = btn_co_banco_cob_autClick
      end
      object lbl_cd_carteira_cob_aut: TLabel
        Left = 12
        Top = 93
        Width = 45
        Height = 13
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label35: TLabel
        Left = 204
        Top = 93
        Width = 141
        Height = 13
        Caption = 'Forma de Cadastramento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label36: TLabel
        Left = 388
        Top = 93
        Width = 112
        Height = 13
        Caption = 'Tipo de Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label37: TLabel
        Left = 12
        Top = 133
        Width = 105
        Height = 13
        Caption = 'Emiss'#227'o do Boleto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label38: TLabel
        Left = 252
        Top = 133
        Width = 126
        Height = 13
        Caption = 'Distribui'#231#227'o do Boleto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label58: TLabel
        Left = 12
        Top = 176
        Width = 136
        Height = 13
        Caption = 'Valor m'#237'nimo para TED:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object dbedt_vl_perc_mora_dia_cob_aut: TDBEdit
        Left = 12
        Top = 25
        Width = 121
        Height = 21
        DataField = 'VL_PERC_MORA_DIA_COB_AUT'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_nr_remessa_cob_aut_inicial: TDBEdit
        Left = 170
        Top = 25
        Width = 121
        Height = 21
        DataField = 'NR_REMESSA_COB_AUT_INICIAL'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 1
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_nr_carteira_cob_aut: TDBEdit
        Left = 328
        Top = 25
        Width = 67
        Height = 21
        DataField = 'NR_CARTEIRA_COB_AUT'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_nr_carteira_cob_autExit
      end
      object dbedt_cd_empresa_cob_aut: TDBEdit
        Left = 456
        Top = 25
        Width = 149
        Height = 21
        DataField = 'CD_EMPRESA_COB_AUT'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 3
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_nr_boleto_inicial: TDBEdit
        Left = 12
        Top = 68
        Width = 143
        Height = 21
        DataField = 'NR_BOLETO_INICIAL'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 4
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_cd_banco_cob_aut: TDBEdit
        Left = 170
        Top = 68
        Width = 33
        Height = 21
        DataField = 'CD_BANCO_COB_AUT'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 5
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_banco_cob_autExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_banco_cob_aut: TDBEdit
        Left = 204
        Top = 68
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookBanco'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 6
        OnChange = dbedt_nm_banco_cob_autChange
      end
      object dbedt_cd_carteira_cob_aut: TDBLookupComboBox
        Left = 12
        Top = 107
        Width = 173
        Height = 21
        DataField = 'CD_COB_CARTEIRA'
        DataSource = datm_param_sistema.ds_parametros
        KeyField = 'CD_PARAMETRO'
        ListField = 'CD_PARAMETRO;NM_PARAMETRO'
        ListFieldIndex = 1
        ListSource = datm_param_sistema.ds_carteira
        TabOrder = 7
        OnCloseUp = dbedt_cd_carteira_cob_autExit
        OnExit = dbedt_cd_carteira_cob_autExit
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 204
        Top = 107
        Width = 173
        Height = 21
        DataField = 'CD_COB_FORMA_CADASTRO'
        DataSource = datm_param_sistema.ds_parametros
        KeyField = 'CD_PARAMETRO'
        ListField = 'CD_PARAMETRO;NM_PARAMETRO'
        ListFieldIndex = 1
        ListSource = datm_param_sistema.ds_cadastramento
        TabOrder = 8
        OnCloseUp = dbedt_cd_carteira_cob_autExit
        OnExit = dbedt_cd_carteira_cob_autExit
      end
      object DBLookupComboBox4: TDBLookupComboBox
        Left = 388
        Top = 107
        Width = 173
        Height = 21
        DataField = 'CD_COB_TIPO_DOCTO'
        DataSource = datm_param_sistema.ds_parametros
        KeyField = 'CD_PARAMETRO'
        ListField = 'CD_PARAMETRO;NM_PARAMETRO'
        ListFieldIndex = 1
        ListSource = datm_param_sistema.ds_tp_docto
        TabOrder = 9
        OnCloseUp = dbedt_cd_carteira_cob_autExit
        OnExit = dbedt_cd_carteira_cob_autExit
      end
      object DBLookupComboBox5: TDBLookupComboBox
        Left = 12
        Top = 147
        Width = 223
        Height = 21
        DataField = 'CD_COB_EMISSAO'
        DataSource = datm_param_sistema.ds_parametros
        KeyField = 'CD_PARAMETRO'
        ListField = 'CD_PARAMETRO;NM_PARAMETRO'
        ListFieldIndex = 1
        ListSource = datm_param_sistema.ds_emissao
        TabOrder = 10
        OnCloseUp = dbedt_cd_carteira_cob_autExit
        OnExit = dbedt_cd_carteira_cob_autExit
      end
      object DBLookupComboBox6: TDBLookupComboBox
        Left = 252
        Top = 147
        Width = 173
        Height = 21
        DataField = 'CD_COB_DISTRIBUI'
        DataSource = datm_param_sistema.ds_parametros
        KeyField = 'CD_PARAMETRO'
        ListField = 'CD_PARAMETRO;NM_PARAMETRO'
        ListFieldIndex = 1
        ListSource = datm_param_sistema.ds_distribui
        TabOrder = 11
        OnCloseUp = dbedt_cd_carteira_cob_autExit
        OnExit = dbedt_cd_carteira_cob_autExit
      end
      object dbedt_vl_min_ted: TDBEdit
        Left = 12
        Top = 193
        Width = 121
        Height = 21
        DataField = 'VL_MINIMO_TED'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 12
        OnChange = dbedt_dt_solic_chChange
      end
    end
    object ts_item1: TTabSheet
      Caption = 'Itens - 1/2'
      object bvl_itens_1: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object lbl_item_receb_num: TLabel
        Left = 12
        Top = 9
        Width = 154
        Height = 13
        Caption = 'Recebimento de Numer'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_receb_num: TSpeedButton
        Left = 280
        Top = 22
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
        OnClick = btn_co_item_receb_numClick
      end
      object btn_co_item_ir: TSpeedButton
        Left = 280
        Top = 367
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_ir: TLabel
        Left = 12
        Top = 354
        Width = 46
        Height = 13
        Caption = 'I.R.R.F.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_item_devol_num: TLabel
        Left = 12
        Top = 43
        Width = 141
        Height = 13
        Caption = 'Devolu'#231#227'o de Numer'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_devol_num: TSpeedButton
        Left = 280
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
        OnClick = btn_co_item_receb_numClick
      end
      object btn_co_item_iss: TSpeedButton
        Left = 584
        Top = 21
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_iss: TLabel
        Left = 316
        Top = 8
        Width = 33
        Height = 13
        Caption = 'I.S.S.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_item_extor_num: TLabel
        Left = 12
        Top = 78
        Width = 123
        Height = 13
        Caption = 'Estorno de Numer'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_extor_num: TSpeedButton
        Left = 280
        Top = 91
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
        OnClick = btn_co_item_receb_numClick
      end
      object btn_co_item_sda: TSpeedButton
        Left = 584
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_sda: TLabel
        Left = 316
        Top = 43
        Width = 38
        Height = 13
        Caption = 'S.D.A.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_item_cpmf: TLabel
        Left = 12
        Top = 113
        Width = 34
        Height = 13
        Caption = 'CPMF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_cpmf: TSpeedButton
        Left = 280
        Top = 126
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
        OnClick = btn_co_item_receb_numClick
      end
      object btn_co_item_saldo_cre: TSpeedButton
        Left = 584
        Top = 91
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_saldo_cre: TLabel
        Left = 316
        Top = 78
        Width = 74
        Height = 13
        Caption = 'Saldo Credor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_item_comissao: TLabel
        Left = 12
        Top = 147
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
      object btn_co_item_comissao: TSpeedButton
        Left = 280
        Top = 160
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
        OnClick = btn_co_item_receb_numClick
      end
      object btn_co_item_saldo_deb: TSpeedButton
        Left = 584
        Top = 125
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_saldo_deb: TLabel
        Left = 316
        Top = 112
        Width = 85
        Height = 13
        Caption = 'Saldo Devedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_item_exped: TLabel
        Left = 12
        Top = 181
        Width = 64
        Height = 13
        Caption = 'Expediente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_exped: TSpeedButton
        Left = 280
        Top = 194
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
        OnClick = btn_co_item_receb_numClick
      end
      object btn_co_item_receb_sd: TSpeedButton
        Left = 584
        Top = 159
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_receb_sd: TLabel
        Left = 316
        Top = 146
        Width = 52
        Height = 13
        Caption = 'S/ Pagto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_item_afrmm: TLabel
        Left = 12
        Top = 215
        Width = 65
        Height = 13
        Caption = 'A.F.R.M.M.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_afrmm: TSpeedButton
        Left = 280
        Top = 228
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
        OnClick = btn_co_item_receb_numClick
      end
      object btn_co_item_pagto_sd: TSpeedButton
        Left = 584
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_pagto_sd: TLabel
        Left = 316
        Top = 180
        Width = 53
        Height = 13
        Caption = 'N/ Pagto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_item_desp_orig: TLabel
        Left = 12
        Top = 249
        Width = 117
        Height = 13
        Caption = 'Despesas de Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_desp_orig: TSpeedButton
        Left = 280
        Top = 262
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
        OnClick = btn_co_item_receb_numClick
      end
      object btn_co_item_ext_receb: TSpeedButton
        Left = 584
        Top = 227
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_ext_receb: TLabel
        Left = 316
        Top = 214
        Width = 99
        Height = 13
        Caption = 'Estorno S/ Pagto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_item_nvocc: TLabel
        Left = 12
        Top = 282
        Width = 63
        Height = 13
        Caption = 'N.V.O.C.C.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_nvocc: TSpeedButton
        Left = 280
        Top = 295
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
        OnClick = btn_co_item_receb_numClick
      end
      object btn_co_item_ext_pagto: TSpeedButton
        Left = 584
        Top = 260
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_ext_pagto: TLabel
        Left = 316
        Top = 247
        Width = 100
        Height = 13
        Caption = 'Estorno N/ Pagto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_item_nao_fat: TLabel
        Left = 12
        Top = 317
        Width = 81
        Height = 13
        Caption = 'N'#227'o Fatur'#225'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_nao_fat: TSpeedButton
        Left = 280
        Top = 330
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
        OnClick = btn_co_item_receb_numClick
      end
      object btn_co_item_pago_cli: TSpeedButton
        Left = 584
        Top = 295
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_pago_cli: TLabel
        Left = 316
        Top = 282
        Width = 173
        Height = 13
        Caption = 'Valor Pago Direto Pelo Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_item_ii: TLabel
        Left = 316
        Top = 318
        Width = 17
        Height = 13
        Caption = 'I.I.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_ii: TSpeedButton
        Left = 584
        Top = 331
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_ipi: TLabel
        Left = 316
        Top = 355
        Width = 29
        Height = 13
        Caption = 'I.P.I.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_ipi: TSpeedButton
        Left = 584
        Top = 368
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
        OnClick = btn_co_item_receb_numClick
      end
      object dbedt_cd_item_receb_num: TDBEdit
        Left = 12
        Top = 22
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_RECEB_NUM'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_receb_numExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_receb_num: TDBEdit
        Left = 50
        Top = 22
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemRecebNum'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 39
      end
      object dbedt_cd_item_ir: TDBEdit
        Left = 12
        Top = 367
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_IR'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 10
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_irExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_ir: TDBEdit
        Left = 50
        Top = 367
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemIR'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 21
      end
      object dbedt_cd_item_devol_num: TDBEdit
        Left = 12
        Top = 56
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_DEVOL_NUM'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 1
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_devol_numExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_devol_num: TDBEdit
        Left = 50
        Top = 56
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemDevolNum'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 31
      end
      object dbedt_cd_item_iss: TDBEdit
        Left = 316
        Top = 21
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_ISS'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 11
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_issExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_iss: TDBEdit
        Left = 354
        Top = 21
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemISS'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 22
      end
      object dbedt_cd_item_extor_num: TDBEdit
        Left = 12
        Top = 91
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_EXTOR_NUM'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_extor_numExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_extor_num: TDBEdit
        Left = 50
        Top = 91
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemExtorNum'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 23
      end
      object dbedt_cd_item_sda: TDBEdit
        Left = 316
        Top = 56
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_SDA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 12
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_sdaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_sda: TDBEdit
        Left = 354
        Top = 56
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemSDA'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 20
      end
      object dbedt_cd_item_cpmf: TDBEdit
        Left = 12
        Top = 126
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_CPMF'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 3
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_cpmfExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_cpmf: TDBEdit
        Left = 50
        Top = 126
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemCPMF'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 25
      end
      object dbedt_cd_item_saldo_cre: TDBEdit
        Left = 316
        Top = 91
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_SALDO_CRE'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 13
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_saldo_creExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_saldo_cre: TDBEdit
        Left = 354
        Top = 91
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemSaldoCre'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 26
      end
      object dbedt_cd_item_comissao: TDBEdit
        Left = 12
        Top = 160
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_COMISSAO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 4
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_comissaoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_comissao: TDBEdit
        Left = 50
        Top = 160
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemComissao'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 27
      end
      object dbedt_cd_item_saldo_deb: TDBEdit
        Left = 316
        Top = 125
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_SALDO_DEB'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 14
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_saldo_debExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_saldo_deb: TDBEdit
        Left = 354
        Top = 125
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemSaldoDeb'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 28
      end
      object dbedt_cd_item_exped: TDBEdit
        Left = 12
        Top = 194
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_EXPED'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 5
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_expedExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_exped: TDBEdit
        Left = 50
        Top = 194
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemExped'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 29
      end
      object dbedt_cd_item_receb_sd: TDBEdit
        Left = 316
        Top = 159
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_RECEB_SD'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 15
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_receb_sdExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_receb_sd: TDBEdit
        Left = 354
        Top = 159
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemRecebSd'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 24
      end
      object dbedt_cd_item_afrmm: TDBEdit
        Left = 12
        Top = 228
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_AFRMM'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 6
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_afrmmExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_afrmm: TDBEdit
        Left = 50
        Top = 228
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemAFRMM'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 32
      end
      object dbedt_cd_item_pagto_sd: TDBEdit
        Left = 316
        Top = 193
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_PAGTO_SD'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 16
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_pagto_sdExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_pagto_sd: TDBEdit
        Left = 354
        Top = 193
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemPagtoSd'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 33
      end
      object dbedt_cd_item_desp_orig: TDBEdit
        Left = 12
        Top = 262
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_DESP_ORIG'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 7
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_desp_origExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_desp_orig: TDBEdit
        Left = 50
        Top = 262
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemdespOrig'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 34
      end
      object dbedt_cd_item_ext_receb: TDBEdit
        Left = 316
        Top = 227
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_EXT_RECEB'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 17
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_ext_recebExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_ext_receb: TDBEdit
        Left = 354
        Top = 227
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemExtReceb'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 30
      end
      object dbedt_cd_item_nvocc: TDBEdit
        Left = 12
        Top = 295
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_NVOCC'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 8
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_nvoccExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_nvocc: TDBEdit
        Left = 50
        Top = 295
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemNVOCC'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 35
      end
      object dbedt_cd_item_ext_pagto: TDBEdit
        Left = 316
        Top = 260
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_EXT_PAGTO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 18
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_ext_pagtoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_ext_pagto: TDBEdit
        Left = 354
        Top = 260
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemExtPagto'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 36
      end
      object dbedt_cd_item_nao_fat: TDBEdit
        Left = 12
        Top = 330
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_NAO_FAT'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 9
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_nao_fatExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_nao_fat: TDBEdit
        Left = 50
        Top = 330
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemNaoFat'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 38
      end
      object dbedt_cd_item_pago_cli: TDBEdit
        Left = 316
        Top = 295
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_PAGO_CLI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 19
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_pago_cliExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_pago_cli: TDBEdit
        Left = 354
        Top = 295
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemPagoCli'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 37
      end
      object dbedt_cd_item_ii: TDBEdit
        Left = 316
        Top = 331
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_II'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 40
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_iiExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_ii: TDBEdit
        Left = 354
        Top = 331
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemII'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 41
      end
      object dbedt_cd_item_ipi: TDBEdit
        Left = 316
        Top = 368
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_IPI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 42
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_ipiExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_ipi: TDBEdit
        Left = 354
        Top = 368
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemIPI'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 43
      end
    end
    object ts_item2: TTabSheet
      Caption = 'Itens - 2/2'
      object bvl_itens_2: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object lbl_item_icms: TLabel
        Left = 12
        Top = 9
        Width = 47
        Height = 13
        Caption = 'I.C.M.S.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_icms: TSpeedButton
        Left = 280
        Top = 22
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_frete_aereo: TLabel
        Left = 12
        Top = 44
        Width = 67
        Height = 13
        Caption = 'Frete A'#233'reo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_frete_aereo: TSpeedButton
        Left = 280
        Top = 57
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_frete_mar: TLabel
        Left = 12
        Top = 78
        Width = 83
        Height = 13
        Caption = 'Frete Mar'#237'timo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_frete_mar: TSpeedButton
        Left = 280
        Top = 91
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_seguro: TLabel
        Left = 12
        Top = 112
        Width = 41
        Height = 13
        Caption = 'Seguro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_seguro: TSpeedButton
        Left = 280
        Top = 125
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_vmle: TLabel
        Left = 12
        Top = 145
        Width = 50
        Height = 13
        Caption = 'V.M.L.E.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_vmle: TSpeedButton
        Left = 280
        Top = 158
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_acresc: TLabel
        Left = 12
        Top = 179
        Width = 65
        Height = 13
        Caption = 'Acr'#233'scimos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_acresc: TSpeedButton
        Left = 280
        Top = 192
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_ded: TLabel
        Left = 12
        Top = 212
        Width = 58
        Height = 13
        Caption = 'Dedu'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_ded: TSpeedButton
        Left = 280
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_siscomex: TLabel
        Left = 12
        Top = 246
        Width = 156
        Height = 13
        Caption = 'Taxa Utiliza'#231#227'o SISCOMEX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_siscomex: TSpeedButton
        Left = 280
        Top = 259
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
        OnClick = btn_co_item_receb_numClick
      end
      object lbl_item_servico_comissaria: TLabel
        Left = 11
        Top = 281
        Width = 108
        Height = 13
        Caption = 'Servi'#231'o Comiss'#225'ria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_servico_comissaria: TSpeedButton
        Left = 280
        Top = 294
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
        OnClick = btn_co_item_receb_numClick
      end
      object Label34: TLabel
        Left = 11
        Top = 315
        Width = 55
        Height = 13
        Caption = 'Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_desconto: TSpeedButton
        Left = 280
        Top = 328
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
        OnClick = btn_co_item_receb_numClick
      end
      object Label59: TLabel
        Left = 11
        Top = 350
        Width = 103
        Height = 13
        Caption = 'Pagto. Demurrage'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_demurrage: TSpeedButton
        Left = 280
        Top = 363
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
        OnClick = btn_co_item_receb_numClick
      end
      object Label44: TLabel
        Left = 316
        Top = 9
        Width = 113
        Height = 13
        Caption = 'Opera'#231#227'o Log'#237'stica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_logistica: TSpeedButton
        Left = 585
        Top = 22
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
        OnClick = btn_co_item_receb_numClick
      end
      object Label90: TLabel
        Left = 316
        Top = 43
        Width = 223
        Height = 13
        Caption = 'Cofins Lei 10833/03 (4,6% s/comiss'#227'o)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_cofins: TSpeedButton
        Left = 585
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
        OnClick = btn_co_item_receb_numClick
      end
      object Label91: TLabel
        Left = 316
        Top = 78
        Width = 297
        Height = 13
        Caption = 'Reten'#231#227'o na Fonte Lei 10833/03 COFINS-PIS-CSLL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_cofins_ret: TSpeedButton
        Left = 585
        Top = 91
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
        OnClick = btn_co_item_receb_numClick
      end
      object Label98: TLabel
        Left = 316
        Top = 110
        Width = 44
        Height = 13
        Caption = 'MP 164'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_mp164: TSpeedButton
        Left = 585
        Top = 123
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
        OnClick = btn_co_item_receb_numClick
      end
      object Label99: TLabel
        Left = 316
        Top = 144
        Width = 88
        Height = 13
        Caption = 'PIS Importa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_pis_imp: TSpeedButton
        Left = 585
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
        OnClick = btn_co_item_receb_numClick
      end
      object Label100: TLabel
        Left = 316
        Top = 177
        Width = 113
        Height = 13
        Caption = 'COFINS Importa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_cofins_imp: TSpeedButton
        Left = 585
        Top = 190
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
        OnClick = btn_co_item_receb_numClick
      end
      object Label66: TLabel
        Left = 316
        Top = 211
        Width = 72
        Height = 13
        Caption = 'PIS/COFINS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_pis_cofins: TSpeedButton
        Left = 585
        Top = 224
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
        OnClick = btn_co_item_receb_numClick
      end
      object Label69: TLabel
        Left = 315
        Top = 247
        Width = 110
        Height = 13
        Caption = 'Frete Mar'#237'timo - FI '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_frt_mar_fi: TSpeedButton
        Left = 584
        Top = 260
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
        OnClick = btn_co_item_receb_numClick
      end
      object Label70: TLabel
        Left = 314
        Top = 281
        Width = 94
        Height = 13
        Caption = 'Frete A'#233'reo - FI '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_frt_aer_fi: TSpeedButton
        Left = 583
        Top = 294
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
        OnClick = btn_co_item_receb_numClick
      end
      object Label71: TLabel
        Left = 313
        Top = 315
        Width = 122
        Height = 13
        Caption = 'Frete Rodovi'#225'rio - FI '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_frt_rod_fi: TSpeedButton
        Left = 582
        Top = 328
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
        OnClick = btn_co_item_receb_numClick
      end
      object Label72: TLabel
        Left = 313
        Top = 351
        Width = 74
        Height = 13
        Caption = 'Frete Seguro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item_frt_seguro: TSpeedButton
        Left = 582
        Top = 364
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
        OnClick = btn_co_item_receb_numClick
      end
      object dbedt_cd_item_icms: TDBEdit
        Left = 12
        Top = 22
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_ICMS'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_icmsExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_icms: TDBEdit
        Left = 50
        Top = 22
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemICMS'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 11
      end
      object dbedt_cd_item_frete_aereo: TDBEdit
        Left = 12
        Top = 57
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_FRETE_AEREO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 1
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_frete_aereoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_frete_aereo: TDBEdit
        Left = 50
        Top = 57
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemFreteAereo'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 12
      end
      object dbedt_cd_item_frete_mar: TDBEdit
        Left = 12
        Top = 91
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_FRETE_MAR'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_frete_marExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_frete_mar: TDBEdit
        Left = 50
        Top = 91
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemFreteMar'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 13
      end
      object dbedt_cd_item_seguro: TDBEdit
        Left = 12
        Top = 125
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_SEGURO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 3
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_seguroExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_seguro: TDBEdit
        Left = 50
        Top = 125
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemSeguro'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 14
      end
      object dbedt_cd_item_vmle: TDBEdit
        Left = 12
        Top = 158
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_VMLE'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 4
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_vmleExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_vmle: TDBEdit
        Left = 50
        Top = 158
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemVMLE'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 15
      end
      object dbedt_cd_item_acresc: TDBEdit
        Left = 12
        Top = 192
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_ACRESC'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 5
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_acrescExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_acresc: TDBEdit
        Left = 50
        Top = 192
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemAcresc'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 16
      end
      object dbedt_cd_item_ded: TDBEdit
        Left = 12
        Top = 225
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_DED'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 6
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_dedExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_ded: TDBEdit
        Left = 50
        Top = 225
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemDed'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 17
      end
      object dbedt_cd_item_siscomex: TDBEdit
        Left = 12
        Top = 259
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_SISCOMEX'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 7
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_siscomexExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_siscomex: TDBEdit
        Left = 50
        Top = 259
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemSISCOMEX'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 18
      end
      object dbedt_cd_item_servico_comissaria: TDBEdit
        Left = 11
        Top = 294
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_SERVICO_COMISSARIA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 8
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_servico_comissariaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_servico_comissaria: TDBEdit
        Left = 50
        Top = 294
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemServicocomissaria'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 19
      end
      object dbedt_cd_desconto: TDBEdit
        Left = 11
        Top = 328
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_DESCONTO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 9
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_descontoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_desconto: TDBEdit
        Left = 50
        Top = 328
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemDesconto'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 20
      end
      object dbedt_cd_item_demurrage: TDBEdit
        Left = 11
        Top = 363
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_DEMURRAGE'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 10
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_demurrageExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_demurrage: TDBEdit
        Left = 50
        Top = 363
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemDemurrage'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 21
      end
      object dbedt_cd_item_logistica: TDBEdit
        Left = 316
        Top = 22
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_LOGISTICA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 22
        OnChange = dbedt_cd_item_logisticaChange
        OnExit = dbedt_cd_item_logisticaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_logistica: TDBEdit
        Left = 355
        Top = 22
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemLogistica'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 23
      end
      object dbedt_cd_item_cofins: TDBEdit
        Left = 316
        Top = 56
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_COFINS'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 24
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_cofinsExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_cofins: TDBEdit
        Left = 355
        Top = 56
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemCofins'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 25
      end
      object dbedt_cd_item_cofins_ret: TDBEdit
        Left = 316
        Top = 91
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_COFINS_RETENCAO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 26
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_cofins_retExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_cofins_ret: TDBEdit
        Left = 355
        Top = 91
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemCofinsRet'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 27
      end
      object dbedt_cd_item_mp164: TDBEdit
        Left = 316
        Top = 123
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_MP164'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 28
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_mp164Exit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_mp164: TDBEdit
        Left = 355
        Top = 123
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemMP164'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 29
      end
      object dbedt_cd_item_pis_imp: TDBEdit
        Left = 316
        Top = 157
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_PIS_IMP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 30
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_pis_impExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_pis_imp: TDBEdit
        Left = 355
        Top = 157
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemPISImp'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 31
      end
      object dbedt_cd_item_cofins_imp: TDBEdit
        Left = 316
        Top = 190
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_COFINS_IMP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 32
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_cofins_impExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_cofins_imp: TDBEdit
        Left = 355
        Top = 190
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemCOFINSImp'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 33
      end
      object dbedt_cd_item_pis_cofins: TDBEdit
        Left = 316
        Top = 224
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_PIS_COFINS'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 34
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_pis_cofinsExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_pis_cofins: TDBEdit
        Left = 355
        Top = 224
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemPisCofins'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 35
      end
      object dbedt_cd_item_frt_mar_fi: TDBEdit
        Left = 315
        Top = 260
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_FRT_MAR_FI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 36
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_frt_mar_fiExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_frt_mar_fi: TDBEdit
        Left = 354
        Top = 260
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemFrtMarFI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 37
      end
      object dbedt_cd_item_frt_aer_fi: TDBEdit
        Left = 314
        Top = 294
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_FRT_AER_FI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 38
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_frt_aer_fiExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_frt_aer_fi: TDBEdit
        Left = 353
        Top = 294
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemFrtAerFI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 39
      end
      object dbedt_cd_item_frt_rod_fi: TDBEdit
        Left = 313
        Top = 328
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_FRT_ROD_FI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 40
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_frt_rod_fiExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_item_frt_rod_fi: TDBEdit
        Left = 352
        Top = 328
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemFrtRodFI'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 41
      end
      object dbedt_cd_item_frt_seguro: TDBEdit
        Left = 313
        Top = 364
        Width = 33
        Height = 21
        DataField = 'CD_ITEM_FRT_SEGURO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 42
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_item_frt_seguroExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object DBEdit6: TDBEdit
        Left = 352
        Top = 364
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItemFrtSeguro'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 43
      end
    end
    object ts_ct_contabil: TTabSheet
      Caption = 'Contas Cont'#225'beis'
      object bvl_contas_contabeis: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object lbl_cd_ct_caixa: TLabel
        Left = 12
        Top = 9
        Width = 32
        Height = 13
        Caption = 'Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_cd_ct_caixa: TSpeedButton
        Left = 410
        Top = 21
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
        OnClick = btn_co_cd_ct_caixaClick
      end
      object lbl_cd_ct_ch_pagtos_div: TLabel
        Left = 12
        Top = 43
        Width = 146
        Height = 13
        Caption = 'Cheques Pagtos Diversos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_cd_ct_ch_pagtos_div: TSpeedButton
        Left = 410
        Top = 55
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
        OnClick = btn_co_cd_ct_ch_pagtos_divClick
      end
      object lbl_cd_ct_fat_a_classif: TLabel
        Left = 12
        Top = 77
        Width = 144
        Height = 13
        Caption = 'Faturamento '#224' Classificar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_cd_ct_fat_a_classif: TSpeedButton
        Left = 410
        Top = 89
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
        OnClick = btn_co_cd_ct_fat_a_classifClick
      end
      object lbl_ct_ctaapagar: TLabel
        Left = 12
        Top = 147
        Width = 88
        Height = 13
        Caption = 'Contas a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_cd_ct_ctaapagar: TSpeedButton
        Left = 410
        Top = 159
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
        OnClick = btn_co_cd_ct_ctaapagarClick
      end
      object lbl_ct_ir: TLabel
        Left = 12
        Top = 181
        Width = 22
        Height = 13
        Caption = 'I.R.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_cd_ct_ir: TSpeedButton
        Left = 410
        Top = 193
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
        OnClick = btn_co_cd_ct_irClick
      end
      object lbl_ct_inss: TLabel
        Left = 12
        Top = 216
        Width = 30
        Height = 13
        Caption = 'INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_cd_ct_inss: TSpeedButton
        Left = 410
        Top = 228
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
        OnClick = btn_co_cd_ct_inssClick
      end
      object Label32: TLabel
        Left = 12
        Top = 251
        Width = 31
        Height = 13
        Caption = 'Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_cd_ct_juros: TSpeedButton
        Left = 410
        Top = 263
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
        OnClick = btn_co_cd_ct_jurosClick
      end
      object Label33: TLabel
        Left = 12
        Top = 287
        Width = 55
        Height = 13
        Caption = 'Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_cd_ct_desconto: TSpeedButton
        Left = 410
        Top = 299
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
        OnClick = btn_co_cd_ct_descontoClick
      end
      object lbl_ct_ctareceber: TLabel
        Left = 12
        Top = 323
        Width = 103
        Height = 13
        Caption = 'Contas a Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_cd_ct_ctaareceber: TSpeedButton
        Left = 410
        Top = 335
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
        OnClick = btn_co_cd_ct_ctaareceberClick
      end
      object lbl_ct_contabil_lp: TLabel
        Left = 12
        Top = 113
        Width = 23
        Height = 13
        Caption = 'L&&P'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_cd_ct_lp: TSpeedButton
        Left = 410
        Top = 125
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
        OnClick = btn_co_cd_ct_lpClick
      end
      object dbedt_cd_ct_caixa: TDBEdit
        Left = 12
        Top = 22
        Width = 92
        Height = 21
        DataField = 'CD_CT_CAIXA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ct_caixaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ct_caixa: TDBEdit
        Left = 104
        Top = 22
        Width = 304
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCtCaixa'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 10
      end
      object dbedt_cd_ct_ch_pagtos_div: TDBEdit
        Left = 12
        Top = 56
        Width = 92
        Height = 21
        DataField = 'CD_CT_CH_PAGTOS_DIV'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 1
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ct_ch_pagtos_divExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ct_ch_pagtos_div: TDBEdit
        Left = 104
        Top = 56
        Width = 304
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCtChPagtosDiv'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 11
      end
      object dbedt_cd_ct_fat_a_classif: TDBEdit
        Left = 12
        Top = 90
        Width = 92
        Height = 21
        DataField = 'CD_CT_FAT_A_CLASSIF'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ct_fat_a_classifExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ct_fat_a_classif: TDBEdit
        Left = 104
        Top = 90
        Width = 304
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCtFatAClassif'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 12
      end
      object dbedt_cd_ct_ctaapagar: TDBEdit
        Left = 12
        Top = 160
        Width = 92
        Height = 21
        DataField = 'CD_CT_CTAAPAGAR'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 4
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ct_ctaapagarExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ct_ctaapagar: TDBEdit
        Left = 104
        Top = 160
        Width = 304
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCtCtaaPagar'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 13
      end
      object dbedt_cd_ct_ir: TDBEdit
        Left = 12
        Top = 194
        Width = 92
        Height = 21
        DataField = 'CD_CT_IR'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 5
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ct_irExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ct_ir: TDBEdit
        Left = 104
        Top = 194
        Width = 304
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCtIR'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 14
      end
      object dbedt_cd_ct_inss: TDBEdit
        Left = 12
        Top = 229
        Width = 92
        Height = 21
        DataField = 'CD_CT_INSS'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 6
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ct_inssExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ct_inss: TDBEdit
        Left = 104
        Top = 229
        Width = 304
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCtINSS'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 15
      end
      object dbedt_cd_ct_juros: TDBEdit
        Left = 12
        Top = 264
        Width = 92
        Height = 21
        DataField = 'CD_CT_CONTABIL_JUROS'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 7
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ct_jurosExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ct_juros: TDBEdit
        Left = 104
        Top = 264
        Width = 304
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCtJuros'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 16
      end
      object dbedt_cd_ct_desconto: TDBEdit
        Left = 12
        Top = 300
        Width = 92
        Height = 21
        DataField = 'CD_CT_CONTABIL_DESCONTO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 8
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ct_descontoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ct_desconto: TDBEdit
        Left = 104
        Top = 300
        Width = 304
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCtDesconto'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 17
      end
      object dbedt_cd_ct_ctaareceber: TDBEdit
        Left = 12
        Top = 336
        Width = 92
        Height = 21
        DataField = 'CD_CT_CTAARECEBER'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 9
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ct_ctaareceberExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ct_ctaareceber: TDBEdit
        Left = 104
        Top = 336
        Width = 304
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCtCtaAReceber'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 18
      end
      object dbedt_nm_ct_lp: TDBEdit
        Left = 104
        Top = 126
        Width = 304
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCtLP'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 19
      end
      object dbedt_cd_ct_lp: TDBEdit
        Left = 12
        Top = 126
        Width = 92
        Height = 21
        DataField = 'CD_CT_LP_SALDUS'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 3
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ct_ctaapagarExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
    end
    object ts_ct_gerencial: TTabSheet
      Caption = 'Contas Gerenciais'
      object bvl_contas_gerenciais: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object Label46: TLabel
        Left = 12
        Top = 9
        Width = 103
        Height = 13
        Caption = 'Contas a Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ct_ger_ctaareceber: TSpeedButton
        Left = 271
        Top = 21
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
        OnClick = btn_co_ct_ger_ctaareceberClick
      end
      object Label47: TLabel
        Left = 12
        Top = 48
        Width = 55
        Height = 13
        Caption = 'Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ct_ger_desconto: TSpeedButton
        Left = 271
        Top = 60
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
        OnClick = btn_co_ct_ger_descontoClick
      end
      object Label48: TLabel
        Left = 12
        Top = 87
        Width = 118
        Height = 13
        Caption = 'Gerencial Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ct_ger_financeiro: TSpeedButton
        Left = 271
        Top = 99
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
        OnClick = btn_co_ct_ger_financeiroClick
      end
      object dbedt_cd_ct_ger_ctaareceber: TDBEdit
        Left = 12
        Top = 22
        Width = 40
        Height = 21
        DataField = 'CD_CT_GER_CTAARECEBER'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 10
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ct_ger_ctaareceberExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ct_ger_ctaareceber: TDBEdit
        Left = 58
        Top = 22
        Width = 211
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCtGerCtaAReceber'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 3
      end
      object dbedt_cd_ct_ger_desconto: TDBEdit
        Left = 12
        Top = 61
        Width = 40
        Height = 21
        DataField = 'CD_CT_GER_DESCONTO'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 10
        TabOrder = 1
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ct_ger_descontoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ct_ger_desconto: TDBEdit
        Left = 58
        Top = 61
        Width = 211
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCtDesconto'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 4
      end
      object dbedt_cd_ct_ger_financeiro: TDBEdit
        Left = 12
        Top = 100
        Width = 40
        Height = 21
        DataField = 'CD_CT_GER_FINANCEIRO'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 10
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_ct_ger_financeiroExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_ct_ger_financeiro: TDBEdit
        Left = 58
        Top = 100
        Width = 211
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCtGerFinanceiro'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 5
      end
    end
    object ts_documento: TTabSheet
      Caption = 'Documentos'
      object bvl_doctos: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object lbl_doc_nf_imp: TLabel
        Left = 12
        Top = 9
        Width = 140
        Height = 13
        Caption = 'Nota Fiscal - Importa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_doc_nf_imp: TSpeedButton
        Left = 280
        Top = 22
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
        OnClick = btn_co_doc_nf_impClick
      end
      object lbl_doc_fat_imp: TLabel
        Left = 12
        Top = 43
        Width = 112
        Height = 13
        Caption = 'Fatura - Importa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_doc_fat_imp: TSpeedButton
        Left = 280
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
        OnClick = btn_co_doc_nf_impClick
      end
      object lbl_doc_re_imp: TLabel
        Left = 12
        Top = 78
        Width = 93
        Height = 13
        Caption = 'RE - Importa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_doc_re_imp: TSpeedButton
        Left = 280
        Top = 91
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
        OnClick = btn_co_doc_nf_impClick
      end
      object lbl_doc_nf_exp: TLabel
        Left = 316
        Top = 9
        Width = 141
        Height = 13
        Caption = 'Nota Fiscal - Exporta'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_doc_nf_exp: TSpeedButton
        Left = 584
        Top = 22
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
        OnClick = btn_co_doc_nf_impClick
      end
      object lbl_doc_fat_exp: TLabel
        Left = 316
        Top = 43
        Width = 113
        Height = 13
        Caption = 'Fatura - Exporta'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_doc_fat_exp: TSpeedButton
        Left = 584
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
        OnClick = btn_co_doc_nf_impClick
      end
      object lbl_doc_re_exp: TLabel
        Left = 316
        Top = 78
        Width = 94
        Height = 13
        Caption = 'RE - Exporta'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_doc_re_exp: TSpeedButton
        Left = 584
        Top = 91
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
        OnClick = btn_co_doc_nf_impClick
      end
      object dbedt_cd_doc_nf_imp: TDBEdit
        Left = 12
        Top = 22
        Width = 33
        Height = 21
        DataField = 'CD_DOC_NF_IMP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_doc_nf_impExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_doc_nf_imp: TDBEdit
        Left = 50
        Top = 22
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookDocNFImp'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_cd_doc_fat_imp: TDBEdit
        Left = 12
        Top = 56
        Width = 33
        Height = 21
        DataField = 'CD_DOC_FAT_IMP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 1
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_doc_fat_impExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_doc_fat_imp: TDBEdit
        Left = 50
        Top = 56
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookDocFatImp'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 7
      end
      object dbedt_cd_doc_re_imp: TDBEdit
        Left = 12
        Top = 91
        Width = 33
        Height = 21
        DataField = 'CD_DOC_RE_IMP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_doc_re_impExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_doc_re_imp: TDBEdit
        Left = 50
        Top = 91
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookDocREImp'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 8
      end
      object dbedt_cd_doc_nf_exp: TDBEdit
        Left = 316
        Top = 22
        Width = 33
        Height = 21
        DataField = 'CD_DOC_NF_EXP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 3
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_doc_nf_expExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_doc_nf_exp: TDBEdit
        Left = 354
        Top = 22
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookDocNFExp'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 9
      end
      object dbedt_cd_doc_fat_exp: TDBEdit
        Left = 316
        Top = 56
        Width = 33
        Height = 21
        DataField = 'CD_DOC_FAT_EXP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 4
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_doc_fat_expExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_doc_fat_exp: TDBEdit
        Left = 354
        Top = 56
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookDocFatExp'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 10
      end
      object dbedt_cd_doc_re_exp: TDBEdit
        Left = 316
        Top = 91
        Width = 33
        Height = 21
        DataField = 'CD_DOC_RE_EXP'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 5
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_doc_re_expExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_doc_re_exp: TDBEdit
        Left = 354
        Top = 91
        Width = 228
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookDocREExp'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 11
      end
    end
    object ts_demurrage: TTabSheet
      Caption = '  Demurrage  '
      object grp_aviso: TGroupBox
        Left = 6
        Top = 4
        Width = 499
        Height = 245
        Caption = '&Avisos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label60: TLabel
          Left = 13
          Top = 71
          Width = 78
          Height = 26
          Caption = 'N'#186' Dias p/ Desembara'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label62: TLabel
          Left = 133
          Top = 71
          Width = 101
          Height = 26
          Caption = 'N'#186' Dias p/ Envio NF Transportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label63: TLabel
          Left = 133
          Top = 135
          Width = 105
          Height = 26
          Caption = 'N'#186' Dias p/ Vencto Demurrage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label61: TLabel
          Left = 13
          Top = 135
          Width = 83
          Height = 26
          Caption = 'N'#186' Dias p/ Ret. Cont'#234'iner'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label64: TLabel
          Left = 13
          Top = 22
          Width = 78
          Height = 13
          Caption = 'Avisar Prazos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object lbl_usuario: TLabel
          Left = 13
          Top = 198
          Width = 44
          Height = 13
          Caption = 'Usu'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object btn_co_usuario_demurrage: TSpeedButton
          Left = 285
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
          OnClick = btn_co_usuario_demurrageClick
        end
        object dbedt_nr_dias_desemb: TDBEdit
          Left = 13
          Top = 101
          Width = 64
          Height = 21
          DataField = 'NR_DIAS_DESEMB'
          DataSource = datm_param_sistema.ds_param_dem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 1
          OnChange = dbedt_dt_solic_chChange
        end
        object dbedt_nr_dias_nf_transp: TDBEdit
          Left = 133
          Top = 101
          Width = 64
          Height = 21
          DataField = 'NR_DIAS_NF_TRANSP'
          DataSource = datm_param_sistema.ds_param_dem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_dt_solic_chChange
        end
        object dbedt_nr_dias_demurrage: TDBEdit
          Left = 133
          Top = 165
          Width = 64
          Height = 21
          DataField = 'NR_DIAS_DEMURRAGE'
          DataSource = datm_param_sistema.ds_param_dem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 4
          OnChange = dbedt_dt_solic_chChange
        end
        object dbedt_nr_dias_ret_cntr: TDBEdit
          Left = 13
          Top = 165
          Width = 64
          Height = 21
          DataField = 'NR_DIAS_RET_CNTR'
          DataSource = datm_param_sistema.ds_param_dem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 3
          OnChange = dbedt_dt_solic_chChange
        end
        object dblckpbox_aviso_dem: TDBLookupComboBox
          Left = 13
          Top = 37
          Width = 97
          Height = 21
          DataField = 'IN_AVISO_DEMURRAGE'
          DataSource = datm_param_sistema.ds_param_dem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_param_sistema.ds_yesno
          ParentFont = False
          TabOrder = 0
          OnClick = dbedt_dt_solic_chChange
          OnExit = dblckbox_agrupa_itens_por_anexoClick
        end
        object dbedt_cd_usuario_demurrage: TDBEdit
          Left = 13
          Top = 214
          Width = 33
          Height = 21
          DataField = 'CD_USUARIO_DEMURRAGE'
          DataSource = datm_param_sistema.ds_param_dem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 5
          OnChange = dbedt_dt_solic_chChange
          OnExit = dbedt_cd_usuario_demurrageExit
          OnKeyDown = dbedt_cd_ev_reg_diKeyDown
        end
        object dbedt_nm_usuario_demurrage: TDBEdit
          Left = 50
          Top = 214
          Width = 228
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUsuarioDemurrage'
          DataSource = datm_param_sistema.ds_param_dem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
      end
    end
    object ts_impostos: TTabSheet
      Caption = 'Impostos/Geral'
      object bvl_impostos: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object Label92: TLabel
        Left = 20
        Top = 16
        Width = 155
        Height = 13
        Caption = 'Aliq. COFINS Lei 10833/03'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label93: TLabel
        Left = 20
        Top = 61
        Width = 197
        Height = 35
        AutoSize = False
        Caption = 'Reten'#231#227'o na Fonte Lei 10833/03'#13#10'COFINS - PIS - CSLL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label101: TLabel
        Left = 21
        Top = 176
        Width = 95
        Height = 26
        Caption = 'Valor M'#237'n. DI - libera'#231#227'o Diretor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label103: TLabel
        Left = 21
        Top = 241
        Width = 85
        Height = 13
        Caption = 'Valor Remessa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label68: TLabel
        Left = 21
        Top = 290
        Width = 275
        Height = 13
        Caption = 'Taxa de Utiliza'#231#227'o da Marinha Mercante+ Tarifa '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object dbedt_vl_cofins: TDBEdit
        Left = 20
        Top = 32
        Width = 67
        Height = 21
        DataField = 'VL_ALIQ_COFINS'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 4
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_nr_carteira_cob_autExit
      end
      object dbedt_vl_cofins_ret: TDBEdit
        Left = 20
        Top = 89
        Width = 67
        Height = 21
        DataField = 'VL_ALIQ_COFINS_RETENCAO'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 4
        TabOrder = 1
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_nr_carteira_cob_autExit
      end
      object dbchk_mp164: TDBCheckBox
        Left = 20
        Top = 120
        Width = 77
        Height = 17
        Caption = 'MP 164'
        Color = clBtnFace
        DataField = 'IN_CALC_MP164'
        DataSource = datm_param_sistema.ds_parametros
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
        OnClick = dbedt_dt_solic_chChange
      end
      object DBCheckBox1: TDBCheckBox
        Left = 21
        Top = 147
        Width = 172
        Height = 17
        Caption = 'INCLUI TAXA SISCOMEX'
        Color = clBtnFace
        DataField = 'IN_TX_SISC_DESP'
        DataSource = datm_param_sistema.ds_parametros
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
        OnClick = dbedt_dt_solic_chChange
      end
      object dbedt_vl_min_di: TDBEdit
        Left = 21
        Top = 205
        Width = 116
        Height = 21
        DataField = 'VL_MIN_DI_DIRETOR'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 30
        TabOrder = 4
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_nr_carteira_cob_autExit
      end
      object dbedt_vl_remessa: TDBEdit
        Left = 21
        Top = 255
        Width = 116
        Height = 21
        DataField = 'VL_REMESSA'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 30
        TabOrder = 5
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_nr_carteira_cob_autExit
      end
      object DBEdit4: TDBEdit
        Left = 21
        Top = 304
        Width = 116
        Height = 21
        DataField = 'VL_TX_UTILIZACAO_AFRMM'
        DataSource = datm_param_sistema.ds_parametros
        MaxLength = 30
        TabOrder = 6
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_nr_carteira_cob_autExit
      end
    end
    object ts_integracao_contabil: TTabSheet
      Caption = 'Integra'#231#227'o Contabil'
      ImageIndex = 18
      object bvl_int_contabil: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object Label104: TLabel
        Left = 12
        Top = 9
        Width = 137
        Height = 13
        Caption = 'Dt Fechamento Contabil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label105: TLabel
        Left = 164
        Top = 9
        Width = 111
        Height = 13
        Caption = 'Dt Ultima Altera'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label106: TLabel
        Left = 12
        Top = 54
        Width = 44
        Height = 13
        Caption = 'Usuario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit10: TDBEdit
        Left = 163
        Top = 25
        Width = 100
        Height = 21
        Color = clMenu
        DataField = 'DT_ALTER_FECH'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
      end
      object DBEdit11: TDBEdit
        Left = 12
        Top = 70
        Width = 241
        Height = 21
        Color = clMenu
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 1
        OnChange = dbedt_dt_solic_chChange
      end
      object dbedt_dt_fech_ctbl: TDBDateEdit
        Left = 12
        Top = 25
        Width = 100
        Height = 21
        DataField = 'DT_CONTABILIZACAO'
        DataSource = datm_param_sistema.ds_parametros
        NumGlyphs = 2
        TabOrder = 2
      end
    end
    object ts_grupo_enac: TTabSheet
      Caption = 'Grupos de Empresas'
      ImageIndex = 19
      object bvl_grupo_enac: TBevel
        Left = 0
        Top = 0
        Width = 735
        Height = 397
        Align = alClient
      end
      object lbl_grupo_basf: TLabel
        Left = 10
        Top = 10
        Width = 70
        Height = 13
        Caption = 'Grupo BASF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_grupo_basf: TSpeedButton
        Left = 196
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
        OnClick = btn_co_grupo_basfClick
      end
      object lbl_grupo_bsg: TLabel
        Left = 11
        Top = 55
        Width = 64
        Height = 13
        Caption = 'Grupo BSG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_grupo_bsg: TSpeedButton
        Left = 197
        Top = 70
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
        OnClick = btn_co_grupo_bsgClick
      end
      object lbl_grupo_oxiteno: TLabel
        Left = 11
        Top = 99
        Width = 82
        Height = 13
        Caption = 'Grupo Oxiteno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_grupo_oxiteno: TSpeedButton
        Left = 197
        Top = 114
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
        OnClick = btn_co_grupo_oxitenoClick
      end
      object lbl_grupo_valspar: TLabel
        Left = 11
        Top = 143
        Width = 81
        Height = 13
        Caption = 'Grupo Valspar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_grupo_valspar: TSpeedButton
        Left = 197
        Top = 158
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
        OnClick = btn_co_grupo_valsparClick
      end
      object lbl_grupo_valtra: TLabel
        Left = 11
        Top = 187
        Width = 72
        Height = 13
        Caption = 'Grupo Valtra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_grupo_valtra: TSpeedButton
        Left = 197
        Top = 202
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
        OnClick = btn_co_grupo_valtraClick
      end
      object lbl_grupo_croda: TLabel
        Left = 11
        Top = 231
        Width = 72
        Height = 13
        Caption = 'Grupo Croda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_grupo_croda: TSpeedButton
        Left = 197
        Top = 246
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
        OnClick = btn_co_grupo_crodaClick
      end
      object btn_co_grupo_saintg: TSpeedButton
        Left = 197
        Top = 290
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
        OnClick = btn_co_grupo_saintgClick
      end
      object lbl_grupo_saintg: TLabel
        Left = 11
        Top = 275
        Width = 112
        Height = 13
        Caption = 'Grupo Saint Gobain'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_grupo_bsh: TLabel
        Left = 11
        Top = 319
        Width = 132
        Height = 13
        Caption = 'Grupo BSH Continental'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_grupo_bsh: TSpeedButton
        Left = 197
        Top = 334
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
        OnClick = btn_co_grupo_bshClick
      end
      object dbedt_nm_grupo_basf: TDBEdit
        Left = 44
        Top = 25
        Width = 150
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookGrupoBasf'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 1
      end
      object dbedt_nm_grupo_bsg: TDBEdit
        Left = 45
        Top = 70
        Width = 150
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookGrupoBSG'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 3
      end
      object dbedt_nm_grupo_oxiteno: TDBEdit
        Left = 45
        Top = 114
        Width = 150
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookGrupoOxiteno'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 5
      end
      object dbedt_nm_grupo_valspar: TDBEdit
        Left = 45
        Top = 158
        Width = 150
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookGrupoValspar'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 7
      end
      object dbedt_nm_grupo_valtra: TDBEdit
        Left = 45
        Top = 202
        Width = 150
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookGrupoValtra'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 9
      end
      object dbedt_nm_grupo_croda: TDBEdit
        Left = 45
        Top = 246
        Width = 150
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookGrupoCroda'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 11
      end
      object dbedt_cd_grupo_basf: TDBEdit
        Left = 10
        Top = 25
        Width = 35
        Height = 21
        DataField = 'CD_GRUPO_BASF'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 0
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_grupo_basfExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_cd_grupo_bsg: TDBEdit
        Left = 11
        Top = 70
        Width = 35
        Height = 21
        DataField = 'CD_GRUPO_BSG'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 2
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_grupo_bsgExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_cd_grupo_oxiteno: TDBEdit
        Left = 11
        Top = 114
        Width = 35
        Height = 21
        DataField = 'CD_GRUPO_OXITENO'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 4
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_grupo_oxitenoExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_cd_grupo_valspar: TDBEdit
        Left = 11
        Top = 158
        Width = 35
        Height = 21
        DataField = 'CD_GRUPO_VALSPAR'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 6
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_grupo_valsparExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_cd_grupo_valtra: TDBEdit
        Left = 11
        Top = 202
        Width = 35
        Height = 21
        DataField = 'CD_GRUPO_VALTRA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 8
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_grupo_valtraExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_cd_grupo_croda: TDBEdit
        Left = 11
        Top = 246
        Width = 35
        Height = 21
        DataField = 'CD_GRUPO_CRODA'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 10
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_grupo_crodaExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_grupo_saintg: TDBEdit
        Left = 45
        Top = 290
        Width = 150
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookGrupoCroda'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 12
      end
      object dbedt_cd_grupo_saintg: TDBEdit
        Left = 11
        Top = 290
        Width = 35
        Height = 21
        DataField = 'CD_GRUPO_SAINTG'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 13
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_grupo_saintgExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_cd_grupo_bsh: TDBEdit
        Left = 11
        Top = 334
        Width = 35
        Height = 21
        DataField = 'CD_GRUPO_BSH'
        DataSource = datm_param_sistema.ds_parametros
        TabOrder = 14
        OnChange = dbedt_dt_solic_chChange
        OnExit = dbedt_cd_grupo_bshExit
        OnKeyDown = dbedt_cd_ev_reg_diKeyDown
      end
      object dbedt_nm_grupo_bsh: TDBEdit
        Left = 45
        Top = 334
        Width = 150
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookGrupoCroda'
        DataSource = datm_param_sistema.ds_parametros
        ReadOnly = True
        TabOrder = 15
      end
    end
  end
  object pnl_comandos: TPanel
    Left = 0
    Top = 0
    Width = 743
    Height = 43
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 704
      Top = 4
      Width = 33
      Height = 35
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
      Left = 5
      Top = 4
      Width = 33
      Height = 35
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
      Left = 39
      Top = 4
      Width = 33
      Height = 35
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
  end
  object menu_cadastro: TMainMenu
    Left = 668
    Top = 4
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
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
