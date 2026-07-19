object frm_ajuste_impressao_sda: Tfrm_ajuste_impressao_sda
  Left = 234
  Top = 111
  BorderStyle = bsSingle
  Caption = 'Ajuste de Impressão '
  ClientHeight = 434
  ClientWidth = 632
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_ajuste_imp: TPageControl
    Left = 0
    Top = 51
    Width = 632
    Height = 383
    ActivePage = ts_dados_rj
    Align = alBottom
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_ajuste_impChange
    OnChanging = pgctrl_ajuste_impChanging
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 624
        Height = 355
        Align = alClient
        DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            FieldName = 'LookUnidade'
            Title.Caption = 'Unidade'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 350
          end>
      end
    end
    object ts_dados_sp: TTabSheet
      Caption = 'Dados Básicos'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 355
        Align = alClient
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label30: TLabel
          Left = 182
          Top = 49
          Width = 32
          Height = 13
          Caption = 'Linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 245
          Top = 49
          Width = 40
          Height = 13
          Caption = 'Coluna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 93
          Top = 96
          Width = 85
          Height = 13
          Alignment = taRightJustify
          Caption = 'Documento No'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 315
          Top = 144
          Width = 76
          Height = 13
          Alignment = taRightJustify
          Caption = 'Despachante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 367
          Top = 166
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 119
          Top = 185
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor SDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 84
          Top = 277
          Width = 94
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data de Entrada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 98
          Top = 254
          Width = 80
          Height = 13
          Alignment = taRightJustify
          Caption = 'Taxa dos 10%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 324
          Top = 75
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Total '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 327
          Top = 98
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Imp. / Exp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_unid_neg: TLabel
          Left = 13
          Top = 8
          Width = 48
          Height = 13
          Caption = 'Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_unid_neg: TSpeedButton
          Left = 342
          Top = 21
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
          OnClick = btn_co_unid_negClick
        end
        object lbl_imp: TLabel
          Left = 114
          Top = 116
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Importação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_exp: TLabel
          Left = 113
          Top = 140
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Exportação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nr_conh: TLabel
          Left = 97
          Top = 162
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'Conhecimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_processo: TLabel
          Left = 125
          Top = 72
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_col2: TLabel
          Left = 469
          Top = 49
          Width = 40
          Height = 13
          Caption = 'Coluna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_linha2: TLabel
          Left = 406
          Top = 49
          Width = 32
          Height = 13
          Caption = 'Linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_referencia: TLabel
          Left = 97
          Top = 300
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'S/ Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_master: TLabel
          Left = 139
          Top = 323
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Master'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 158
          Top = 208
          Width = 20
          Height = 13
          Alignment = taRightJustify
          Caption = 'CIF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 133
          Top = 231
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Caption = 'Veículo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Left = 359
          Top = 121
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 334
          Top = 187
          Width = 126
          Height = 13
          Caption = 'Nº de Linhas por Guia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_linha_doc: TDBEdit
          Left = 182
          Top = 88
          Width = 40
          Height = 21
          DataField = 'L_NR_DOCUMENTO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 3
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_docExit
        end
        object dbedt_col_doc: TDBEdit
          Left = 246
          Top = 88
          Width = 40
          Height = 21
          DataField = 'C_NR_DOCUMENTO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 4
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_docExit
        end
        object dbedt_linha_impexp: TDBEdit
          Left = 406
          Top = 90
          Width = 40
          Height = 21
          DataField = 'L_NM_IMP_EXP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 20
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_impexpExit
        end
        object dbedt_col_impexp: TDBEdit
          Left = 470
          Top = 90
          Width = 40
          Height = 21
          DataField = 'C_NM_IMP_EXP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 21
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_impexpExit
        end
        object dbedt_linha_desp: TDBEdit
          Left = 406
          Top = 136
          Width = 40
          Height = 21
          DataField = 'L_NM_DESP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 23
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_despExit
        end
        object dbedt_col_desp: TDBEdit
          Left = 470
          Top = 136
          Width = 40
          Height = 21
          DataField = 'C_NM_DESP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 24
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_despExit
        end
        object dbedt_linha_vl_sda: TDBEdit
          Left = 182
          Top = 177
          Width = 40
          Height = 21
          DataField = 'L_VL_SDA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 8
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_vl_sdaExit
        end
        object dbedt_col_cpf: TDBEdit
          Left = 470
          Top = 158
          Width = 40
          Height = 21
          DataField = 'C_NR_CPF'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 25
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_cpfExit
        end
        object dbedt_col_vl_sda: TDBEdit
          Left = 246
          Top = 177
          Width = 40
          Height = 21
          DataField = 'C_VL_SDA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 9
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_vl_sdaExit
        end
        object dbedt_col_dt_entrada: TDBEdit
          Left = 182
          Top = 270
          Width = 40
          Height = 21
          DataField = 'L_DT_ENT'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 15
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_dt_entradaExit
        end
        object dbedt_linha_taxa: TDBEdit
          Left = 182
          Top = 247
          Width = 40
          Height = 21
          DataField = 'L_VL_TAXA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 13
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_taxaExit
        end
        object dbedt_col_taxa: TDBEdit
          Left = 246
          Top = 247
          Width = 40
          Height = 21
          DataField = 'C_VL_TAXA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 14
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_taxaExit
        end
        object dbedt_linha_vl_total: TDBEdit
          Left = 406
          Top = 68
          Width = 40
          Height = 21
          DataField = 'L_VL_TOTAL'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 18
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_vl_totalExit
        end
        object dbedt_col_vl_total: TDBEdit
          Left = 470
          Top = 68
          Width = 40
          Height = 21
          DataField = 'C_VL_TOTAL'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 19
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_vl_totalExit
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 13
          Top = 22
          Width = 36
          Height = 21
          DataField = 'CD_UNID_NEG'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 0
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_cd_unid_negExit
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 56
          Top = 22
          Width = 281
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidade'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          ReadOnly = True
          TabOrder = 26
        end
        object dbedt_col_imp: TDBEdit
          Left = 246
          Top = 110
          Width = 40
          Height = 21
          DataField = 'C_OPER_IMP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 5
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_impExit
        end
        object dbedt_col_exp: TDBEdit
          Left = 246
          Top = 133
          Width = 40
          Height = 21
          DataField = 'C_OPER_EXP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 6
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_expExit
        end
        object dbedt_col_nr_conh: TDBEdit
          Left = 246
          Top = 155
          Width = 40
          Height = 21
          DataField = 'C_NR_CONHECIMENTO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 7
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_nr_conhExit
        end
        object dbedt_linha_nr_proc: TDBEdit
          Left = 182
          Top = 65
          Width = 40
          Height = 21
          DataField = 'L_NR_PROCESSO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 1
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_nr_procExit
        end
        object dbedt_col_nr_proc: TDBEdit
          Left = 246
          Top = 65
          Width = 40
          Height = 21
          DataField = 'C_NR_PROCESSO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 2
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_nr_procExit
        end
        object dbedt_linha_referencia: TDBEdit
          Left = 182
          Top = 293
          Width = 40
          Height = 21
          DataField = 'L_REF'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 16
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_referenciaExit
        end
        object dbedt_linha_conh_master: TDBEdit
          Left = 182
          Top = 315
          Width = 40
          Height = 21
          DataField = 'L_MASTER'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 17
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_conh_masterExit
        end
        object dbedt_linha_vl_cif: TDBEdit
          Left = 182
          Top = 200
          Width = 40
          Height = 21
          DataField = 'L_VL_CIF'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 10
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_vl_cifExit
        end
        object dbedt_col_vl_cif: TDBEdit
          Left = 246
          Top = 200
          Width = 40
          Height = 21
          DataField = 'C_VL_CIF'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 11
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_vl_cifExit
        end
        object dbedt_linha_veiculo: TDBEdit
          Left = 182
          Top = 224
          Width = 40
          Height = 21
          DataField = 'L_VEIC'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 12
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_veiculoExit
        end
        object dbedt_col_cgc: TDBEdit
          Left = 470
          Top = 113
          Width = 40
          Height = 21
          DataField = 'C_CNPJ'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 22
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_cgcExit
        end
        object DBEdit2: TDBEdit
          Left = 471
          Top = 180
          Width = 40
          Height = 21
          DataField = 'NR_LINHA_GUIA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 27
          OnChange = dbedt_linha_docChange
          OnExit = DBEdit1Exit
        end
      end
    end
    object ts_dados_sts: TTabSheet
      Caption = 'Dados Básicos'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 355
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label21: TLabel
          Left = 13
          Top = 8
          Width = 48
          Height = 13
          Caption = 'Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 342
          Top = 21
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
          OnClick = btn_co_unid_negClick
        end
        object Label20: TLabel
          Left = 245
          Top = 49
          Width = 40
          Height = 13
          Caption = 'Coluna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 182
          Top = 49
          Width = 32
          Height = 13
          Caption = 'Linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 103
          Top = 71
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Importação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 102
          Top = 95
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Exportação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 31
          Top = 119
          Width = 136
          Height = 13
          Alignment = taRightJustify
          Caption = 'Importador / Exportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 135
          Top = 142
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 92
          Top = 165
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Observações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 108
          Top = 190
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor SDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 87
          Top = 212
          Width = 80
          Height = 13
          Alignment = taRightJustify
          Caption = 'Taxa dos 10%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 100
          Top = 258
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Total '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 62
          Top = 235
          Width = 105
          Height = 13
          Alignment = taRightJustify
          Caption = 'Complemento SDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_unid_neg2: TDBEdit
          Left = 13
          Top = 22
          Width = 36
          Height = 21
          DataField = 'CD_UNID_NEG'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 0
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_cd_unid_neg2Exit
        end
        object dbedt_nm_unid_neg2: TDBEdit
          Left = 56
          Top = 22
          Width = 281
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidade'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_linha_valor_total: TDBEdit
          Left = 182
          Top = 250
          Width = 40
          Height = 21
          DataField = 'L_VL_TOTAL'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 15
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_valor_totalExit
        end
        object dbedt_linha_vl_taxa: TDBEdit
          Left = 182
          Top = 204
          Width = 40
          Height = 21
          DataField = 'L_VL_TAXA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 13
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_vl_taxaExit
        end
        object dbedt_linha_valor_sda: TDBEdit
          Left = 182
          Top = 181
          Width = 40
          Height = 21
          DataField = 'L_VL_SDA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 11
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_valor_sdaExit
        end
        object dbedt_col_valor_sda: TDBEdit
          Left = 246
          Top = 181
          Width = 40
          Height = 21
          DataField = 'C_VL_SDA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 12
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_valor_sdaExit
        end
        object dbedt_linha_processo: TDBEdit
          Left = 182
          Top = 158
          Width = 40
          Height = 21
          DataField = 'L_OBS'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 8
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_processoExit
        end
        object dbedt_linha_imp_exp: TDBEdit
          Left = 182
          Top = 111
          Width = 40
          Height = 21
          DataField = 'L_NM_IMP_EXP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 5
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_imp_expExit
        end
        object dbedt_col_processo: TDBEdit
          Left = 246
          Top = 158
          Width = 40
          Height = 21
          DataField = 'C_OBS'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 9
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_processoExit
        end
        object dbedt_col_cnpj: TDBEdit
          Left = 246
          Top = 134
          Width = 40
          Height = 21
          DataField = 'C_NR_CPF'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 7
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_cnpjExit
        end
        object dbedt_col_imp_exp: TDBEdit
          Left = 246
          Top = 111
          Width = 40
          Height = 21
          DataField = 'C_NM_IMP_EXP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 6
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_imp_expExit
        end
        object dbedt_col_oper_exp: TDBEdit
          Left = 246
          Top = 88
          Width = 40
          Height = 21
          DataField = 'C_OPER_EXP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 4
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_oper_expExit
        end
        object dbedt_col_oper_imp: TDBEdit
          Left = 246
          Top = 65
          Width = 40
          Height = 21
          DataField = 'C_OPER_IMP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 3
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_oper_impExit
        end
        object dbedt_linha_oper_imp: TDBEdit
          Left = 182
          Top = 65
          Width = 40
          Height = 21
          DataField = 'L_OPER_IMP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 2
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_oper_impExit
        end
        object dbedt_linha_referen: TDBEdit
          Left = 182
          Top = 227
          Width = 40
          Height = 21
          DataField = 'L_NM_COMPL_SDA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 10
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_referenExit
        end
        object dbedt_col_nm_compl_sda: TDBEdit
          Left = 246
          Top = 227
          Width = 40
          Height = 21
          DataField = 'C_NM_COMPL_SDA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 14
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_cnpjExit
        end
      end
    end
    object ts_dados_rs: TTabSheet
      Caption = 'Dados Básicos'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 355
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label27: TLabel
          Left = 82
          Top = 72
          Width = 85
          Height = 13
          Caption = 'Documento No'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 111
          Top = 93
          Width = 56
          Height = 13
          Caption = 'Operação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 31
          Top = 116
          Width = 136
          Height = 13
          Caption = 'Importador / Exportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 91
          Top = 138
          Width = 76
          Height = 13
          Caption = 'Despachante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 143
          Top = 160
          Width = 24
          Height = 13
          Caption = 'CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 114
          Top = 182
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
        object Label38: TLabel
          Left = 82
          Top = 204
          Width = 81
          Height = 13
          Caption = 'Conhecimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 85
          Top = 227
          Width = 87
          Height = 13
          Caption = 'URF Despacho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 108
          Top = 250
          Width = 59
          Height = 13
          Caption = 'Valor SDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 71
          Top = 272
          Width = 96
          Height = 13
          Caption = 'Data de Emissão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label36: TLabel
          Left = 87
          Top = 294
          Width = 80
          Height = 13
          Caption = 'Taxa dos 10%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 100
          Top = 316
          Width = 67
          Height = 13
          Caption = 'Valor Total '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 245
          Top = 49
          Width = 40
          Height = 13
          Caption = 'Coluna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 182
          Top = 49
          Width = 32
          Height = 13
          Caption = 'Linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 13
          Top = 8
          Width = 48
          Height = 13
          Caption = 'Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton2: TSpeedButton
          Left = 342
          Top = 21
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
          OnClick = btn_co_unid_negClick
        end
        object Label47: TLabel
          Left = 304
          Top = 63
          Width = 93
          Height = 26
          Caption = 'Exibe no Nr. do Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label17: TLabel
          Left = 304
          Top = 94
          Width = 126
          Height = 13
          Caption = 'Nº de Linhas por Guia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_linha_vl_total2: TDBEdit
          Left = 182
          Top = 308
          Width = 40
          Height = 21
          DataField = 'L_VL_TOTAL'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 21
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_vl_total2Exit
        end
        object dbedt_linha_taxa2: TDBEdit
          Left = 182
          Top = 286
          Width = 40
          Height = 21
          DataField = 'L_VL_TAXA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 19
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_taxa2Exit
        end
        object dbedt_linha_vl_sda2: TDBEdit
          Left = 182
          Top = 242
          Width = 40
          Height = 21
          DataField = 'L_VL_SDA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 16
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_vl_sda2Exit
        end
        object dbedt_linha_urf_desp2: TDBEdit
          Left = 182
          Top = 220
          Width = 40
          Height = 21
          DataField = 'L_URF_DESPACHO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 14
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_urf_desp2Exit
        end
        object dbedt_linha_nr_conh2: TDBEdit
          Left = 182
          Top = 197
          Width = 40
          Height = 21
          DataField = 'L_NR_CONHECIMENTO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 12
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_nr_conh2Exit
        end
        object dbedt_linha_nr_proc2: TDBEdit
          Left = 182
          Top = 175
          Width = 40
          Height = 21
          DataField = 'L_NR_PROCESSO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 10
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_nr_proc2Exit
        end
        object dbedt_linha_desp2: TDBEdit
          Left = 182
          Top = 130
          Width = 40
          Height = 21
          DataField = 'L_NM_DESP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 7
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_desp2Exit
        end
        object dbedt_linha_impexp2: TDBEdit
          Left = 182
          Top = 108
          Width = 40
          Height = 21
          DataField = 'L_NM_IMP_EXP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 5
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_impexp2Exit
        end
        object dbedt_linha_doc2: TDBEdit
          Left = 182
          Top = 64
          Width = 40
          Height = 21
          DataField = 'L_NR_DOCUMENTO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 2
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_doc2Exit
        end
        object dbedt_col_doc2: TDBEdit
          Left = 246
          Top = 64
          Width = 40
          Height = 21
          DataField = 'C_NR_DOCUMENTO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 3
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_doc2Exit
        end
        object dbedt_col_oper2: TDBEdit
          Left = 246
          Top = 86
          Width = 40
          Height = 21
          DataField = 'C_NR_OPERACAO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 4
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_oper2Exit
        end
        object dbedt_col_impexp2: TDBEdit
          Left = 246
          Top = 108
          Width = 40
          Height = 21
          DataField = 'C_NM_IMP_EXP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 6
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_impexp2Exit
        end
        object dbedt_col_desp2: TDBEdit
          Left = 246
          Top = 130
          Width = 40
          Height = 21
          DataField = 'C_NM_DESP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 8
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_desp2Exit
        end
        object dbedt_col_cpf2: TDBEdit
          Left = 246
          Top = 152
          Width = 40
          Height = 21
          DataField = 'C_NR_CPF'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 9
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_cpf2Exit
        end
        object dbedt_col_nr_proc2: TDBEdit
          Left = 246
          Top = 175
          Width = 40
          Height = 21
          DataField = 'C_NR_PROCESSO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 11
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_nr_proc2Exit
        end
        object dbedt_col_nr_conh2: TDBEdit
          Left = 246
          Top = 197
          Width = 40
          Height = 21
          DataField = 'C_NR_CONHECIMENTO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 13
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_nr_conh2Exit
        end
        object dbedt_col_urf_desp2: TDBEdit
          Left = 246
          Top = 220
          Width = 40
          Height = 21
          DataField = 'C_URF_DESPACHO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 15
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_urf_desp2Exit
        end
        object dbedt_col_vl_sda2: TDBEdit
          Left = 246
          Top = 242
          Width = 40
          Height = 21
          DataField = 'C_VL_SDA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 17
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_vl_sda2Exit
        end
        object dbedt_col_dt_emissao2: TDBEdit
          Left = 246
          Top = 264
          Width = 40
          Height = 21
          DataField = 'C_DT_EMISSAO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 18
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_dt_emissao2Exit
        end
        object dbedt_col_taxa2: TDBEdit
          Left = 246
          Top = 286
          Width = 40
          Height = 21
          DataField = 'C_VL_TAXA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 20
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_taxa2Exit
        end
        object dbedt_col_vl_total2: TDBEdit
          Left = 246
          Top = 308
          Width = 40
          Height = 21
          DataField = 'C_VL_TOTAL'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 22
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_vl_total2Exit
        end
        object dbedt_cd_unid_neg3: TDBEdit
          Left = 13
          Top = 22
          Width = 36
          Height = 21
          DataField = 'CD_UNID_NEG'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 0
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_cd_unid_neg3Exit
        end
        object dbedt_nm_unid_neg3: TDBEdit
          Left = 56
          Top = 22
          Width = 281
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidade'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          ReadOnly = True
          TabOrder = 1
        end
        object Cmbbx_mod_doc: TComboBox
          Left = 402
          Top = 64
          Width = 144
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          Items.Strings = (
            'Nr. DI'
            'Nr. Conhecimento')
          TabOrder = 23
          OnChange = Cmbbx_mod_docChange
        end
        object DBEdit1: TDBEdit
          Left = 441
          Top = 87
          Width = 40
          Height = 21
          DataField = 'NR_LINHA_GUIA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 24
          OnChange = dbedt_linha_docChange
          OnExit = DBEdit1Exit
        end
      end
    end
    object ts_dados_rj: TTabSheet
      Caption = 'Dados Básicos'
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 355
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label22: TLabel
          Left = 13
          Top = 8
          Width = 48
          Height = 13
          Caption = 'Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton3: TSpeedButton
          Left = 342
          Top = 21
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
          OnClick = btn_co_unid_negClick
        end
        object Label43: TLabel
          Left = 245
          Top = 49
          Width = 40
          Height = 13
          Caption = 'Coluna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label45: TLabel
          Left = 182
          Top = 49
          Width = 32
          Height = 13
          Caption = 'Linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label46: TLabel
          Left = 103
          Top = 71
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Importação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label48: TLabel
          Left = 102
          Top = 96
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Exportação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label49: TLabel
          Left = 31
          Top = 121
          Width = 136
          Height = 13
          Alignment = taRightJustify
          Caption = 'Importador / Exportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 135
          Top = 145
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label51: TLabel
          Left = 92
          Top = 308
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Observações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label52: TLabel
          Left = 108
          Top = 239
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor SDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label53: TLabel
          Left = 87
          Top = 262
          Width = 80
          Height = 13
          Alignment = taRightJustify
          Caption = 'Taxa dos 10%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label54: TLabel
          Left = 100
          Top = 286
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Total '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label55: TLabel
          Left = 91
          Top = 168
          Width = 76
          Height = 13
          Alignment = taRightJustify
          Caption = 'Despachante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label56: TLabel
          Left = 143
          Top = 215
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label57: TLabel
          Left = 71
          Top = 332
          Width = 96
          Height = 13
          Caption = 'Data de Emissão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label58: TLabel
          Left = 356
          Top = 177
          Width = 126
          Height = 13
          Caption = 'Nº de Linhas por Guia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label59: TLabel
          Left = 307
          Top = 70
          Width = 107
          Height = 13
          Caption = 'Nr. Conta Corrente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label60: TLabel
          Left = 492
          Top = 49
          Width = 40
          Height = 13
          Caption = 'Coluna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label61: TLabel
          Left = 429
          Top = 49
          Width = 32
          Height = 13
          Caption = 'Linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label62: TLabel
          Left = 61
          Top = 191
          Width = 106
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cód. Despachante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_unid_neg4: TDBEdit
          Left = 13
          Top = 22
          Width = 36
          Height = 21
          DataField = 'CD_UNID_NEG'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 0
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_cd_unid_neg4Exit
        end
        object dbedt_nm_unid_neg4: TDBEdit
          Left = 56
          Top = 22
          Width = 281
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidade'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_col_valor_total2: TDBEdit
          Left = 246
          Top = 278
          Width = 40
          Height = 21
          DataField = 'C_VL_TOTAL'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 17
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_valor_total2Exit
        end
        object dbedt_col_taxa3: TDBEdit
          Left = 246
          Top = 254
          Width = 40
          Height = 21
          DataField = 'C_VL_TAXA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 16
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_taxa3Exit
        end
        object dbedt_linha_valor_sda2: TDBEdit
          Left = 182
          Top = 230
          Width = 40
          Height = 21
          DataField = 'L_VL_SDA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 14
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_valor_sda2Exit
        end
        object dbedt_col_valor_sda2: TDBEdit
          Left = 246
          Top = 230
          Width = 40
          Height = 21
          DataField = 'C_VL_SDA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 15
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_valor_sda2Exit
        end
        object dbedt_linha_processo2: TDBEdit
          Left = 182
          Top = 301
          Width = 40
          Height = 21
          DataField = 'L_OBS'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 18
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_processo2Exit
        end
        object dbedt_linha_imp_exp2: TDBEdit
          Left = 182
          Top = 113
          Width = 40
          Height = 21
          DataField = 'L_NM_IMP_EXP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 5
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_imp_exp2Exit
        end
        object dbedt_col_processo2: TDBEdit
          Left = 246
          Top = 301
          Width = 40
          Height = 21
          DataField = 'C_OBS'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 19
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_processo2Exit
        end
        object dbedt_col_cnpj2: TDBEdit
          Left = 246
          Top = 137
          Width = 40
          Height = 21
          DataField = 'C_CNPJ'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 8
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_cnpj2Exit
        end
        object dbedt_col_imp_exp2: TDBEdit
          Left = 246
          Top = 113
          Width = 40
          Height = 21
          DataField = 'C_NM_IMP_EXP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 6
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_imp_exp2Exit
        end
        object dbedt_col_oper_exp2: TDBEdit
          Left = 246
          Top = 89
          Width = 40
          Height = 21
          DataField = 'C_OPER_EXP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 4
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_oper_exp2Exit
        end
        object dbedt_col_oper_imp2: TDBEdit
          Left = 246
          Top = 65
          Width = 40
          Height = 21
          DataField = 'C_OPER_IMP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 3
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_oper_imp2Exit
        end
        object dbedt_linha_oper_imp2: TDBEdit
          Left = 182
          Top = 65
          Width = 40
          Height = 21
          DataField = 'L_OPER_IMP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 2
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_oper_imp2Exit
        end
        object dbedt_linha_desp3: TDBEdit
          Left = 182
          Top = 160
          Width = 40
          Height = 21
          DataField = 'L_NM_DESP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 9
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_desp3Exit
        end
        object dbedt_col_desp3: TDBEdit
          Left = 246
          Top = 160
          Width = 40
          Height = 21
          DataField = 'C_NM_DESP'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 10
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_desp3Exit
        end
        object dbedt_linha_cnpj2: TDBEdit
          Left = 182
          Top = 137
          Width = 40
          Height = 21
          DataField = 'L_CNPJ'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 7
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_cnpj2Exit
        end
        object dbedt_linha_nr_cpf: TDBEdit
          Left = 182
          Top = 207
          Width = 40
          Height = 21
          DataField = 'L_NR_CPF'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 12
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_nr_cpfExit
        end
        object dbedt_col_nr_cpf: TDBEdit
          Left = 246
          Top = 207
          Width = 40
          Height = 21
          DataField = 'C_NR_CPF'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 13
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_nr_cpfExit
        end
        object dbedt_col_dt_emissao3: TDBEdit
          Left = 246
          Top = 324
          Width = 40
          Height = 21
          DataField = 'C_DT_EMISSAO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 21
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_dt_emissao3Exit
        end
        object dbedt_linha_dt_emissao: TDBEdit
          Left = 182
          Top = 324
          Width = 40
          Height = 21
          DataField = 'L_DT_EMISSAO'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 20
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_dt_emissaoExit
        end
        object dbedt_linhas_guia: TDBEdit
          Left = 493
          Top = 172
          Width = 40
          Height = 21
          DataField = 'NR_LINHA_GUIA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 22
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linhas_guiaExit
        end
        object dbedt_linha_conta_corrente: TDBEdit
          Left = 429
          Top = 65
          Width = 40
          Height = 21
          DataField = 'L_NR_CONTA_CORRENTE'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 23
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_linha_conta_correnteExit
        end
        object dbedt_col_conta_corrente: TDBEdit
          Left = 493
          Top = 65
          Width = 40
          Height = 21
          DataField = 'C_NR_CONTA_CORRENTE'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          TabOrder = 24
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_conta_correnteExit
        end
        object dbedt_col_cd_desp_sda: TDBEdit
          Left = 246
          Top = 183
          Width = 40
          Height = 21
          DataField = 'C_CD_DESP_SDA'
          DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 11
          OnChange = dbedt_linha_docChange
          OnExit = dbedt_col_nr_cpfExit
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 1
    object btn_incluir: TSpeedButton
      Left = 12
      Top = 12
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
    object btn_sair: TSpeedButton
      Left = 280
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
      Left = 40
      Top = 12
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
      Left = 68
      Top = 12
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
    object btn_excluir: TSpeedButton
      Left = 96
      Top = 12
      Width = 25
      Height = 25
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
      OnClick = btn_excluirClick
    end
    object dbnvg: TDBNavigator
      Left = 148
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_ajuste_impressao_sda.ds_ajuste_impressao
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Próximo'
        'Último')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object menu_cadastro: TMainMenu
    Left = 532
    Top = 309
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
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
