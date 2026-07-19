object frm_ajuste_impressao_icms: Tfrm_ajuste_impressao_icms
  Left = 139
  Top = 97
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
    ActivePage = ts_lista
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
        DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
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
    object ts_dados_rs: TTabSheet
      Caption = 'Dados Básicos'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 355
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label2: TLabel
          Left = 99
          Top = 89
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'Contribuinte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label001: TLabel
          Left = 182
          Top = 44
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
        object Label002: TLabel
          Left = 245
          Top = 44
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
          Left = 81
          Top = 68
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'C.G.C. / C.P.F.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 113
          Top = 156
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Endereço'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 143
          Top = 178
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 117
          Top = 200
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 52
          Top = 222
          Width = 116
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data de Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 55
          Top = 111
          Width = 113
          Height = 13
          Alignment = taRightJustify
          Caption = 'Número de Registro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 135
          Top = 266
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Texto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 62
          Top = 288
          Width = 106
          Height = 13
          Alignment = taRightJustify
          Caption = 'Código da Receita'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 138
          Top = 310
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 21
          Top = 332
          Width = 147
          Height = 13
          Alignment = taRightJustify
          Caption = 'Especificação da Receita'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 393
          Top = 68
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 56
          Top = 134
          Width = 112
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data da Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_unid_neg: TLabel
          Left = 37
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
          Left = 366
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
        object Label37: TLabel
          Left = 52
          Top = 244
          Width = 116
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Número do Registro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 470
          Top = 44
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
        object Label39: TLabel
          Left = 534
          Top = 44
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
        object dbedt_linha_cgc: TDBEdit
          Left = 182
          Top = 60
          Width = 40
          Height = 21
          DataField = 'L_NR_CGC_CPF'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_cgcExit
        end
        object dbedt_col_cgc: TDBEdit
          Left = 246
          Top = 60
          Width = 40
          Height = 21
          DataField = 'C_NR_CGC_CPF'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 2
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_cgcExit
        end
        object dbedt_linha_contribuinte: TDBEdit
          Left = 182
          Top = 81
          Width = 40
          Height = 21
          DataField = 'L_NM_CONTRIBUINTE'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 3
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_contribuinteExit
        end
        object dbedt_col_contribuinte: TDBEdit
          Left = 246
          Top = 81
          Width = 40
          Height = 21
          DataField = 'C_NM_CONTRIBUINTE'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 4
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_contribuinteExit
        end
        object dbedt_col_dt_refer: TDBEdit
          Left = 246
          Top = 126
          Width = 40
          Height = 21
          DataField = 'C_DT_REFERENCIA'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 7
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_dt_referExit
        end
        object dbedt_linha_endereco: TDBEdit
          Left = 182
          Top = 148
          Width = 40
          Height = 21
          DataField = 'L_NM_ENDERECO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 8
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_enderecoExit
        end
        object dbedt_col_endereco: TDBEdit
          Left = 246
          Top = 148
          Width = 40
          Height = 21
          DataField = 'C_NM_ENDERECO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 9
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_enderecoExit
        end
        object dbedt_linha_cep: TDBEdit
          Left = 182
          Top = 170
          Width = 40
          Height = 21
          DataField = 'L_CD_CEP'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 10
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_cepExit
        end
        object dbedt_col_cep: TDBEdit
          Left = 246
          Top = 170
          Width = 40
          Height = 21
          DataField = 'C_CD_CEP'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 11
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_cepExit
        end
        object dbedt_col_telefone: TDBEdit
          Left = 246
          Top = 192
          Width = 40
          Height = 21
          DataField = 'C_NR_TELEFONE'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 12
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_telefoneExit
        end
        object dbedt_col_dt_vencimento: TDBEdit
          Left = 246
          Top = 214
          Width = 40
          Height = 21
          DataField = 'C_DT_VENCIMENTO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 13
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_dt_vencimentoExit
        end
        object dbedt_linha_nr_registro: TDBEdit
          Left = 182
          Top = 103
          Width = 40
          Height = 21
          DataField = 'L_NR_REGISTRO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 5
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_nr_registroExit
        end
        object dbedt_col_nr_registro: TDBEdit
          Left = 246
          Top = 103
          Width = 40
          Height = 21
          DataField = 'C_NR_REGISTRO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 6
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_nr_registroExit
        end
        object dbedt_linha_texto: TDBEdit
          Left = 182
          Top = 258
          Width = 40
          Height = 21
          DataField = 'L_TX_TEXTO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 16
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_textoExit
        end
        object dbedt_col_texto: TDBEdit
          Left = 246
          Top = 258
          Width = 40
          Height = 21
          DataField = 'C_TX_TEXTO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 17
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_textoExit
        end
        object dbedt_col_cd_receita: TDBEdit
          Left = 246
          Top = 280
          Width = 40
          Height = 21
          DataField = 'C_CD_RECEITA'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 18
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_cd_receitaExit
        end
        object dbedt_col_valor: TDBEdit
          Left = 246
          Top = 302
          Width = 40
          Height = 21
          DataField = 'C_VL_ICMS'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 19
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_valorExit
        end
        object dbedt_linha_espec_receita: TDBEdit
          Left = 182
          Top = 324
          Width = 40
          Height = 21
          DataField = 'L_NR_ESPEC_RECEITA'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 20
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_espec_receitaExit
        end
        object dbedt_col_espec_receita: TDBEdit
          Left = 246
          Top = 324
          Width = 40
          Height = 21
          DataField = 'C_NR_ESPEC_RECEITA'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 21
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_espec_receitaExit
        end
        object dbedt_linha_vl_total: TDBEdit
          Left = 470
          Top = 60
          Width = 40
          Height = 21
          DataField = 'L_VL_TOTAL_ICMS'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 22
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_vl_totalExit
        end
        object dbedt_col_vl_total: TDBEdit
          Left = 534
          Top = 60
          Width = 40
          Height = 21
          DataField = 'C_VL_TOTAL_ICMS'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 23
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_vl_totalExit
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 37
          Top = 22
          Width = 36
          Height = 21
          DataField = 'CD_UNID_NEG'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 2
          TabOrder = 0
          OnExit = dbedt_cd_unid_negExit
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 80
          Top = 22
          Width = 281
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidade'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          ReadOnly = True
          TabOrder = 24
        end
        object dbedt_linha_nr_registro2: TDBEdit
          Left = 182
          Top = 236
          Width = 40
          Height = 21
          DataField = 'L_NR_REGISTRO2'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          TabOrder = 14
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_nr_registro2Exit
        end
        object dbedt_col_nr_registro2: TDBEdit
          Left = 246
          Top = 236
          Width = 40
          Height = 21
          DataField = 'C_NR_REGISTRO2'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          TabOrder = 15
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_nr_registro2Exit
        end
      end
    end
    object ts_dados_sp: TTabSheet
      Caption = 'Dados Básicos'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 355
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label14: TLabel
          Left = 99
          Top = 88
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'Contribuinte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 182
          Top = 44
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
        object Label16: TLabel
          Left = 245
          Top = 44
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
        object Label18: TLabel
          Left = 113
          Top = 133
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Endereço'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 151
          Top = 204
          Width = 17
          Height = 13
          Alignment = taRightJustify
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 117
          Top = 227
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 25
          Top = 250
          Width = 143
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'CAE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 62
          Top = 111
          Width = 106
          Height = 13
          Alignment = taRightJustify
          Caption = 'Código da Receita'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 25
          Top = 294
          Width = 143
          Height = 13
          Alignment = taRightJustify
          Caption = 'Inscrição na dívida ativa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 105
          Top = 315
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 111
          Top = 181
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'Município'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 37
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
        object btn_co_unid_neg2: TSpeedButton
          Left = 366
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
        object Label30: TLabel
          Left = 389
          Top = 63
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nº AIIM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 446
          Top = 44
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
        object Label32: TLabel
          Left = 509
          Top = 44
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
        object Label33: TLabel
          Left = 81
          Top = 271
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'C.G.C. / C.P.F.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 353
          Top = 112
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'Juros de Mora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 312
          Top = 157
          Width = 122
          Height = 13
          Alignment = taRightJustify
          Caption = 'Acréscimo Financeiro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label36: TLabel
          Left = 293
          Top = 181
          Width = 141
          Height = 13
          Alignment = taRightJustify
          Caption = 'Honorários Advocatícios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 371
          Top = 204
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Left = 338
          Top = 88
          Width = 96
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor da Receita'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 52
          Top = 63
          Width = 116
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data de Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 62
          Top = 157
          Width = 106
          Height = 13
          Alignment = taRightJustify
          Caption = 'Inscrição Estadual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 25
          Top = 338
          Width = 143
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Observações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 352
          Top = 135
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Multa de Mora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_linha_contribuinte2: TDBEdit
          Left = 182
          Top = 81
          Width = 40
          Height = 21
          DataField = 'L_NM_CONTRIBUINTE'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 3
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_contribuinte2Exit
        end
        object dbedt_col_contribuinte2: TDBEdit
          Left = 246
          Top = 81
          Width = 40
          Height = 21
          DataField = 'C_NM_CONTRIBUINTE'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 4
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_contribuinte2Exit
        end
        object dbedt_col_municipio2: TDBEdit
          Left = 246
          Top = 173
          Width = 40
          Height = 21
          DataField = 'C_NM_MUNICIPIO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 10
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_municipio2Exit
        end
        object dbedt_linha_end2: TDBEdit
          Left = 182
          Top = 126
          Width = 40
          Height = 21
          DataField = 'L_NM_ENDERECO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 6
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_end2Exit
        end
        object dbedt_col_end2: TDBEdit
          Left = 246
          Top = 126
          Width = 40
          Height = 21
          DataField = 'C_NM_ENDERECO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 7
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_end2Exit
        end
        object dbedt_col_uf2: TDBEdit
          Left = 246
          Top = 196
          Width = 40
          Height = 21
          DataField = 'C_NM_UF'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 11
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_uf2Exit
        end
        object dbedt_col_tel: TDBEdit
          Left = 246
          Top = 219
          Width = 40
          Height = 21
          DataField = 'C_NR_TELEFONE'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 12
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_telExit
        end
        object dbedt_col_cae: TDBEdit
          Left = 246
          Top = 242
          Width = 40
          Height = 21
          DataField = 'C_NR_CAE'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 13
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_caeExit
        end
        object dbedt_col_cd_receita2: TDBEdit
          Left = 246
          Top = 103
          Width = 40
          Height = 21
          DataField = 'C_CD_RECEITA'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 5
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_cd_receita2Exit
        end
        object dbedt_col_div_at: TDBEdit
          Left = 246
          Top = 286
          Width = 40
          Height = 21
          DataField = 'C_NR_INSCR_DIV_ATIVA'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 16
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_div_atExit
        end
        object dbedt_linha_ref: TDBEdit
          Left = 182
          Top = 308
          Width = 40
          Height = 21
          DataField = 'L_DT_REFERENCIA'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 17
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_refExit
        end
        object dbedt_col_ref: TDBEdit
          Left = 246
          Top = 308
          Width = 40
          Height = 21
          DataField = 'C_DT_REFERENCIA'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 18
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_refExit
        end
        object dbedt_cd_unid_neg2: TDBEdit
          Left = 37
          Top = 22
          Width = 36
          Height = 21
          DataField = 'CD_UNID_NEG'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 2
          TabOrder = 0
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_cd_unid_negExit
        end
        object dbedt_nm_unid_neg2: TDBEdit
          Left = 80
          Top = 22
          Width = 281
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidade2'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          ReadOnly = True
          TabOrder = 35
        end
        object dbedt_col_cgc_cpf: TDBEdit
          Left = 246
          Top = 264
          Width = 40
          Height = 21
          DataField = 'C_NR_CGC_CPF'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 14
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_cgc_cpfExit
        end
        object dbedt_linha_aiim: TDBEdit
          Left = 446
          Top = 58
          Width = 40
          Height = 21
          DataField = 'L_NR_AIIM'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 21
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_aiimExit
        end
        object dbedt_col_aiim: TDBEdit
          Left = 510
          Top = 58
          Width = 40
          Height = 21
          DataField = 'C_NR_AIIM'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 22
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_aiimExit
        end
        object dbedt_linha_juros: TDBEdit
          Left = 446
          Top = 104
          Width = 40
          Height = 21
          DataField = 'L_VL_JUROS'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 25
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_jurosExit
        end
        object dbedt_col_juros: TDBEdit
          Left = 510
          Top = 104
          Width = 40
          Height = 21
          DataField = 'C_VL_JUROS'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 26
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_jurosExit
        end
        object dbedt_linha_acrescimo: TDBEdit
          Left = 446
          Top = 149
          Width = 40
          Height = 21
          DataField = 'L_VL_ACRESCIMO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 29
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_acrescimoExit
        end
        object dbedt_col_acrescimo: TDBEdit
          Left = 510
          Top = 149
          Width = 40
          Height = 21
          DataField = 'C_VL_ACRESCIMO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 30
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_acrescimoExit
        end
        object dbedt_col_honorario: TDBEdit
          Left = 510
          Top = 173
          Width = 40
          Height = 21
          DataField = 'C_VL_HONORARIO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 32
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_honorarioExit
        end
        object dbedt_col_dt_venc: TDBEdit
          Left = 246
          Top = 58
          Width = 40
          Height = 21
          DataField = 'C_DT_VENCIMENTO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 2
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_dt_vencExit
        end
        object dbedt_linha_dt_venc: TDBEdit
          Left = 182
          Top = 58
          Width = 40
          Height = 21
          DataField = 'L_DT_VENCIMENTO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_dt_vencExit
        end
        object dbedt_col_nr_insc_est2: TDBEdit
          Left = 246
          Top = 149
          Width = 40
          Height = 21
          DataField = 'C_NR_INSCR_EST'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 8
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_nr_insc_est2Exit
        end
        object dbedt_linha_municipio2: TDBEdit
          Left = 182
          Top = 173
          Width = 40
          Height = 21
          DataField = 'L_NM_MUNICIPIO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 9
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_municipio2Exit
        end
        object dbedt_col_vl_receita: TDBEdit
          Left = 510
          Top = 81
          Width = 40
          Height = 21
          DataField = 'C_VL_ICMS'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 24
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_vl_receitaExit
        end
        object dbedt_linha_vl_receita: TDBEdit
          Left = 446
          Top = 81
          Width = 40
          Height = 21
          DataField = 'L_VL_ICMS'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 23
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_vl_receitaExit
        end
        object dbedt_linha_honorario: TDBEdit
          Left = 447
          Top = 173
          Width = 40
          Height = 21
          DataField = 'L_VL_HONORARIO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 31
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_honorarioExit
        end
        object dbedt_linha_total: TDBEdit
          Left = 447
          Top = 196
          Width = 40
          Height = 21
          DataField = 'L_VL_TOTAL_ICMS'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 33
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_totalExit
        end
        object dbedt_col_total: TDBEdit
          Left = 510
          Top = 196
          Width = 40
          Height = 21
          DataField = 'C_VL_TOTAL_ICMS'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 34
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_totalExit
        end
        object dbedt_linha_div_at: TDBEdit
          Left = 182
          Top = 286
          Width = 40
          Height = 21
          DataField = 'L_NR_INSCR_DIV_ATIVA'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 15
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_div_atExit
        end
        object dbedt_linha_obs: TDBEdit
          Left = 182
          Top = 332
          Width = 40
          Height = 21
          DataField = 'L_TX_TEXTO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 19
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_obsExit
        end
        object dbedt_col_obs: TDBEdit
          Left = 246
          Top = 332
          Width = 40
          Height = 21
          DataField = 'C_TX_TEXTO'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 20
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_obsExit
        end
        object dbedt_linha_multa: TDBEdit
          Left = 446
          Top = 126
          Width = 40
          Height = 21
          DataField = 'L_VL_MULTA'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 27
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_linha_multaExit
        end
        object dbedt_col_multa: TDBEdit
          Left = 510
          Top = 126
          Width = 40
          Height = 21
          DataField = 'C_VL_MULTA'
          DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
          MaxLength = 3
          TabOrder = 28
          OnChange = dbedt_linha_cgcChange
          OnExit = dbedt_col_multaExit
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
      DataSource = datm_ajuste_impressao_icms.ds_ajuste_impressao
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
    Top = 8
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
