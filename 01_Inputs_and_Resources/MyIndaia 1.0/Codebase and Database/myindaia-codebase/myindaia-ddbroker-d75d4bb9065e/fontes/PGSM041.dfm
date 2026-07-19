object frm_banco: Tfrm_banco
  Left = 376
  Top = 114
  Width = 750
  Height = 550
  Caption = 'Cadastro de Contas Banc'#225'rias'
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
  object Label2: TLabel
    Left = 173
    Top = 194
    Width = 43
    Height = 13
    Caption = 'Apelido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pgctrl_banco: TPageControl
    Left = 0
    Top = 47
    Width = 734
    Height = 445
    ActivePage = ts_dados_basicos
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_bancoChange
    OnChanging = pgctrl_bancoChanging
    object ts_lista: TTabSheet
      Caption = '    Lista    '
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 726
        Height = 417
        Align = alClient
        Color = clWhite
        DataSource = datm_banco.ds_banco
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_cadastroDblClick
        OnKeyPress = dbg_cadastroKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_BANCO'
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
            FieldName = 'NM_BANCO'
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
            FieldName = 'AP_BANCO'
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
            FieldName = 'LookAtivo'
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
            FieldName = 'CD_AGENCIA'
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
            FieldName = 'NR_CONTA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '   Dados B'#225'sicos   '
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 417
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_nome: TLabel
          Left = 65
          Top = 16
          Width = 33
          Height = 13
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_banco: TLabel
          Left = 15
          Top = 16
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
        object lblAtivo: TLabel
          Left = 421
          Top = 16
          Width = 30
          Height = 13
          Caption = 'Ativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_apelido: TLabel
          Left = 15
          Top = 56
          Width = 43
          Height = 13
          Caption = 'Apelido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nr_conta: TLabel
          Left = 99
          Top = 140
          Width = 52
          Height = 13
          Caption = 'N'#186' Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_agencia: TLabel
          Left = 15
          Top = 140
          Width = 47
          Height = 13
          Caption = 'Ag'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nr_banco: TLabel
          Left = 15
          Top = 99
          Width = 55
          Height = 13
          Caption = 'N'#186' Banco'
          FocusControl = dbedt_nr_banco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_dac_agencia: TLabel
          Left = 231
          Top = 140
          Width = 26
          Height = 13
          Caption = 'DAC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ct_contabil: TLabel
          Left = 111
          Top = 178
          Width = 84
          Height = 13
          Caption = 'Conta Cont'#225'bil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ct_contabil: TSpeedButton
          Left = 586
          Top = 192
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
          OnClick = btn_co_ct_contabilClick
        end
        object lbl_acesso: TLabel
          Left = 15
          Top = 178
          Width = 42
          Height = 13
          Caption = 'Acesso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_aux: TLabel
          Left = 63
          Top = 178
          Width = 22
          Height = 13
          Caption = 'Aux'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nr_cheque: TLabel
          Left = 135
          Top = 56
          Width = 101
          Height = 13
          Caption = 'N'#186' '#218'ltimo Cheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_nr_banco: TSpeedButton
          Left = 307
          Top = 114
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
          OnClick = btn_co_nr_bancoClick
        end
        object lbl_path_cob_aut_trans: TLabel
          Left = 15
          Top = 259
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
        object lbl_path_cob_aut_imp: TLabel
          Left = 15
          Top = 217
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
        object lbl_tx_instrucao: TLabel
          Left = 15
          Top = 298
          Width = 177
          Height = 13
          Caption = 'Instru'#231#227'o para Boleto Banc'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 259
          Top = 56
          Width = 117
          Height = 13
          Caption = 'N'#186' Arquivo Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 392
          Top = 56
          Width = 45
          Height = 13
          Caption = 'N'#186' DOC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 275
          Top = 140
          Width = 91
          Height = 13
          Caption = 'Conta Reduzida'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nm_banco: TDBEdit
          Left = 65
          Top = 32
          Width = 345
          Height = 21
          DataField = 'NM_BANCO'
          DataSource = datm_banco.ds_banco
          MaxLength = 50
          TabOrder = 0
        end
        object dbedt_cd_banco: TDBEdit
          Left = 15
          Top = 32
          Width = 41
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_BANCO'
          DataSource = datm_banco.ds_banco
          MaxLength = 2
          TabOrder = 17
        end
        object dblkpcbox_ativo: TDBLookupComboBox
          Left = 421
          Top = 32
          Width = 50
          Height = 21
          DataField = 'IN_ATIVO'
          DataSource = datm_banco.ds_banco
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_banco.ds_yesno
          TabOrder = 1
        end
        object dbedt_ap_banco: TDBEdit
          Left = 15
          Top = 72
          Width = 112
          Height = 21
          DataField = 'AP_BANCO'
          DataSource = datm_banco.ds_banco
          TabOrder = 2
        end
        object dbedt_nr_conta: TDBEdit
          Left = 99
          Top = 156
          Width = 112
          Height = 21
          DataField = 'NR_CONTA'
          DataSource = datm_banco.ds_banco
          TabOrder = 8
        end
        object dbedt_cd_agencia: TDBEdit
          Left = 15
          Top = 156
          Width = 72
          Height = 21
          DataField = 'CD_AGENCIA'
          DataSource = datm_banco.ds_banco
          TabOrder = 7
        end
        object dbedt_nr_banco: TDBEdit
          Left = 15
          Top = 115
          Width = 41
          Height = 21
          DataField = 'NR_BANCO'
          DataSource = datm_banco.ds_banco
          TabOrder = 6
          OnExit = dbedt_nr_bancoExit
          OnKeyDown = dbedt_cd_ct_contabilKeyDown
        end
        object dbedt_dac_agencia: TDBEdit
          Left = 231
          Top = 156
          Width = 23
          Height = 21
          DataField = 'DAC_AGENCIA'
          DataSource = datm_banco.ds_banco
          TabOrder = 9
        end
        object dbedt_cd_ct_contabil: TDBEdit
          Left = 111
          Top = 193
          Width = 101
          Height = 21
          DataField = 'CD_CT_CONTABIL'
          DataSource = datm_banco.ds_banco
          TabOrder = 12
          OnChange = btn_co_ct_contabilClick
          OnExit = dbedt_cd_ct_contabilExit
          OnKeyDown = dbedt_cd_ct_contabilKeyDown
        end
        object dbedt_cd_acesso: TDBEdit
          Left = 15
          Top = 193
          Width = 32
          Height = 21
          DataField = 'CD_ACESSO'
          DataSource = datm_banco.ds_banco
          TabOrder = 10
          OnEnter = dbedt_cd_acessoEnter
          OnExit = dbedt_cd_acessoExit
        end
        object dbedt_cd_aux: TDBEdit
          Left = 63
          Top = 193
          Width = 32
          Height = 21
          DataField = 'CD_AUX'
          DataSource = datm_banco.ds_banco
          TabOrder = 11
          OnEnter = dbedt_cd_auxEnter
          OnExit = dbedt_cd_auxExit
        end
        object dbedt_nr_cheque: TDBEdit
          Left = 135
          Top = 72
          Width = 112
          Height = 21
          DataField = 'NR_CHEQUE'
          DataSource = datm_banco.ds_banco
          TabOrder = 3
          OnExit = dbedt_nr_chequeExit
        end
        object dbedt_nm_bco: TDBEdit
          Left = 62
          Top = 115
          Width = 243
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmBco'
          DataSource = datm_banco.ds_banco
          ReadOnly = True
          TabOrder = 18
        end
        object dbedt_path_cob_aut_trans: TDBEdit
          Left = 15
          Top = 272
          Width = 281
          Height = 21
          DataField = 'PATH_COB_AUT_TRANS'
          DataSource = datm_banco.ds_banco
          TabOrder = 15
        end
        object dbedt_path_cob_aut_imp: TDBEdit
          Left = 15
          Top = 233
          Width = 281
          Height = 21
          DataField = 'PATH_COB_AUT_IMP'
          DataSource = datm_banco.ds_banco
          TabOrder = 14
        end
        object dbedt_tx_instrucao: TDBEdit
          Left = 15
          Top = 311
          Width = 281
          Height = 21
          DataField = 'TX_INSTRUCAO'
          DataSource = datm_banco.ds_banco
          TabOrder = 16
        end
        object dbedt_nr_remessa: TDBEdit
          Left = 259
          Top = 72
          Width = 121
          Height = 21
          DataField = 'NR_REMESSA'
          DataSource = datm_banco.ds_banco
          TabOrder = 4
          OnChange = dbedt_nr_remessaChange
          OnExit = dbedt_nr_remessaExit
        end
        object dbedt_nr_DOC: TDBEdit
          Left = 392
          Top = 72
          Width = 121
          Height = 21
          DataField = 'NR_DOC'
          DataSource = datm_banco.ds_banco
          TabOrder = 5
          OnChange = dbedt_nr_remessaChange
          OnExit = dbedt_nr_DOCExit
        end
        object dbedt_nm_ct_contabil: TEdit
          Left = 213
          Top = 193
          Width = 371
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_ct_reduzida: TDBEdit
          Left = 274
          Top = 155
          Width = 129
          Height = 21
          DataField = 'CD_CC_REDUZIDA'
          DataSource = datm_banco.ds_banco
          TabOrder = 19
          OnChange = dbedt_nr_remessaChange
        end
        object dbcheck_integra: TDBCheckBox
          Left = 413
          Top = 156
          Width = 97
          Height = 17
          Caption = 'Conta Indai'#225
          DataField = 'IN_INDAIA'
          DataSource = datm_banco.ds_banco
          TabOrder = 20
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbcheck_integraClick
        end
      end
    end
    object ts_ajuste_impressao: TTabSheet
      Caption = 'Ajuste de Impress'#227'o'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        TabStop = True
        object Label3: TLabel
          Left = 58
          Top = 57
          Width = 30
          Height = 13
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 58
          Top = 200
          Width = 24
          Height = 13
          Caption = 'M'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 58
          Top = 81
          Width = 105
          Height = 13
          Caption = 'Extenso - 1'#186' Linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 114
          Top = 105
          Width = 48
          Height = 13
          Caption = '2'#186' Linha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 58
          Top = 129
          Width = 64
          Height = 13
          Caption = 'Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 58
          Top = 153
          Width = 40
          Height = 13
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 58
          Top = 176
          Width = 20
          Height = 13
          Caption = 'Dia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 58
          Top = 224
          Width = 23
          Height = 13
          Caption = 'Ano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 58
          Top = 249
          Width = 75
          Height = 13
          Caption = 'M'#225'scara Ano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 184
          Top = 29
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
        object Label13: TLabel
          Left = 264
          Top = 29
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
        object dbedt_lvalor: TDBEdit
          Left = 184
          Top = 48
          Width = 40
          Height = 21
          DataField = 'LVALOR'
          DataSource = datm_banco.ds_banco
          MaxLength = 3
          TabOrder = 0
          OnChange = dbedt_lvalorChange
        end
        object dbedt_cvalor: TDBEdit
          Left = 264
          Top = 48
          Width = 40
          Height = 21
          DataField = 'CVALOR'
          DataSource = datm_banco.ds_banco
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_lvalorChange
        end
        object dbedt_lextenso: TDBEdit
          Left = 184
          Top = 72
          Width = 40
          Height = 21
          DataField = 'LEXTENSO'
          DataSource = datm_banco.ds_banco
          MaxLength = 3
          TabOrder = 2
          OnChange = dbedt_lvalorChange
        end
        object dbedt_cextenso: TDBEdit
          Left = 264
          Top = 72
          Width = 40
          Height = 21
          DataField = 'CEXTENSO'
          DataSource = datm_banco.ds_banco
          MaxLength = 3
          TabOrder = 3
          OnChange = dbedt_lvalorChange
        end
        object dbedt_lextenso2: TDBEdit
          Left = 184
          Top = 96
          Width = 40
          Height = 21
          DataField = 'LEXTENSO2'
          DataSource = datm_banco.ds_banco
          MaxLength = 3
          TabOrder = 4
          OnChange = dbedt_lvalorChange
        end
        object dbedt_cextenso2: TDBEdit
          Left = 264
          Top = 96
          Width = 40
          Height = 21
          DataField = 'CEXTENSO2'
          DataSource = datm_banco.ds_banco
          MaxLength = 3
          TabOrder = 5
          OnChange = dbedt_lvalorChange
        end
        object dbedt_lfavor: TDBEdit
          Left = 184
          Top = 120
          Width = 40
          Height = 21
          DataField = 'LFAVOR'
          DataSource = datm_banco.ds_banco
          MaxLength = 3
          TabOrder = 6
          OnChange = dbedt_lvalorChange
        end
        object dbedt_cfavor: TDBEdit
          Left = 264
          Top = 120
          Width = 40
          Height = 21
          DataField = 'CFAVOR'
          DataSource = datm_banco.ds_banco
          MaxLength = 3
          TabOrder = 7
          OnChange = dbedt_lvalorChange
        end
        object dbedt_lcidade: TDBEdit
          Left = 184
          Top = 144
          Width = 40
          Height = 21
          DataField = 'LCIDADE'
          DataSource = datm_banco.ds_banco
          MaxLength = 3
          TabOrder = 8
          OnChange = dbedt_lvalorChange
        end
        object dbedt_ccidade: TDBEdit
          Left = 264
          Top = 144
          Width = 40
          Height = 21
          DataField = 'CCIDADE'
          DataSource = datm_banco.ds_banco
          MaxLength = 3
          TabOrder = 9
          OnChange = dbedt_lvalorChange
        end
        object dbedt_cdia: TDBEdit
          Left = 264
          Top = 168
          Width = 40
          Height = 21
          DataField = 'CDIA'
          DataSource = datm_banco.ds_banco
          MaxLength = 3
          TabOrder = 10
          OnChange = dbedt_lvalorChange
        end
        object dbedt_cmes: TDBEdit
          Left = 264
          Top = 192
          Width = 40
          Height = 21
          DataField = 'CMES'
          DataSource = datm_banco.ds_banco
          MaxLength = 3
          TabOrder = 11
          OnChange = dbedt_lvalorChange
        end
        object dbedt_cano: TDBEdit
          Left = 264
          Top = 216
          Width = 40
          Height = 21
          DataField = 'CANO'
          DataSource = datm_banco.ds_banco
          MaxLength = 3
          TabOrder = 12
          OnChange = dbedt_lvalorChange
        end
        object dbedt_anomask: TDBEdit
          Left = 184
          Top = 240
          Width = 40
          Height = 21
          DataField = 'ANOMASK'
          DataSource = datm_banco.ds_banco
          TabOrder = 13
          OnChange = dbedt_lvalorChange
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 1
    object btn_incluir: TSpeedButton
      Left = 3
      Top = 4
      Width = 38
      Height = 41
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
      Left = 117
      Top = 4
      Width = 38
      Height = 41
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
    object btn_sair: TSpeedButton
      Left = 393
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
      Left = 41
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
      Left = 79
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
    object dbnvg: TDBNavigator
      Left = 240
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_banco.ds_banco
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object pnl_pesquisa: TPanel
      Left = 423
      Top = 2
      Width = 309
      Height = 43
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      TabStop = True
      object lbl_pesquisa: TLabel
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
      object lbl_ordem_pesquisa: TLabel
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
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 556
    Top = 368
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      Hint = ' '
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
      Hint = ' '
      OnClick = btn_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
