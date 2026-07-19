object frm_Favor: Tfrm_Favor
  Left = 323
  Top = 63
  Width = 984
  Height = 717
  Caption = 'Cadastro de Favorecido'
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_favor: TPageControl
    Left = 0
    Top = 47
    Width = 976
    Height = 624
    ActivePage = ts_dados_basicos
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_favorChange
    OnChanging = pgctrl_favorChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_favor: TDBGrid
        Left = 0
        Top = 0
        Width = 968
        Height = 596
        Align = alClient
        DataSource = datm_favor.ds_favor
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_favorDblClick
        OnKeyPress = dbg_favorKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_FAVORECIDO'
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
            FieldName = 'NM_FAVORECIDO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 498
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_FAVORECIDO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'look_ativo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados B'#225'sicos'
      object pnl_favor: TPanel
        Left = 0
        Top = 0
        Width = 968
        Height = 596
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label3: TLabel
          Left = 10
          Top = 7
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_favor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 100
          Top = 7
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Descri'#231#227'o'
          FocusControl = dbedt_nm_favor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ativo: TLabel
          Left = 624
          Top = 7
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
        object Label5: TLabel
          Left = 529
          Top = 7
          Width = 46
          Height = 13
          AutoSize = False
          Caption = 'Apelido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 10
          Top = 45
          Width = 55
          Height = 13
          Caption = 'Endere'#231'o'
          FocusControl = dbedt_END_FAVORECIDO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 281
          Top = 45
          Width = 44
          Height = 13
          Caption = 'N'#250'mero'
          FocusControl = dbedt_END_NUMERO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 114
          Top = 90
          Width = 40
          Height = 13
          Caption = 'Cidade'
          FocusControl = dbedt_END_CIDADE
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 617
          Top = 45
          Width = 34
          Height = 13
          Caption = 'Bairro'
          FocusControl = dbedt_END_BAIRRO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 392
          Top = 90
          Width = 17
          Height = 13
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 10
          Top = 90
          Width = 25
          Height = 13
          Caption = 'CEP'
          FocusControl = dbedt_END_CEP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 458
          Top = 90
          Width = 29
          Height = 13
          Caption = 'Fone'
          FocusControl = dbedt_NR_FONE
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 633
          Top = 90
          Width = 21
          Height = 13
          Caption = 'Fax'
          FocusControl = dbedt_NR_FAX
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 10
          Top = 133
          Width = 45
          Height = 13
          Caption = 'Contato'
          FocusControl = dbedt_NM_CONTATO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 281
          Top = 133
          Width = 34
          Height = 13
          Caption = 'Cargo'
          FocusControl = dbedt_TX_CARGO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 468
          Top = 133
          Width = 80
          Height = 13
          Caption = 'Departamento'
          FocusControl = dbedt_TX_DEPARTAMENTO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 10
          Top = 178
          Width = 97
          Height = 13
          Caption = 'C'#243'd Tipo Pessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 146
          Top = 178
          Width = 48
          Height = 13
          Caption = 'C.N.P.J.'
          FocusControl = dbedt_CNPJ_EMPRESA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 281
          Top = 178
          Width = 40
          Height = 13
          Caption = 'C.P.F. '
          FocusControl = dbedt_CPF_EMPRESA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 410
          Top = 178
          Width = 82
          Height = 13
          Caption = 'Insc. Estadual'
          FocusControl = dbedt_IE_EMPRESA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 697
          Top = 7
          Width = 84
          Height = 13
          Caption = 'Data  Inclus'#227'o'
          FocusControl = dbedt_DT_INCLUSAO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 10
          Top = 270
          Width = 65
          Height = 13
          Caption = 'Controla IR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ct_contabil: TLabel
          Left = 106
          Top = 222
          Width = 84
          Height = 13
          Caption = 'Conta Cont'#225'bil'
          FocusControl = dbedt_cd_ct_contabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ct_contabil: TSpeedButton
          Left = 580
          Top = 237
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
        object Label24: TLabel
          Left = 80
          Top = 270
          Width = 78
          Height = 13
          Caption = 'Recolhimento'
          FocusControl = dbedt_cd_recol
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_recol: TSpeedButton
          Left = 415
          Top = 285
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
          OnClick = btn_co_recolClick
        end
        object Label25: TLabel
          Left = 636
          Top = 178
          Width = 56
          Height = 13
          Caption = 'Cod.INSS'
          FocusControl = dbedt_NR_INSS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 625
          Top = 133
          Width = 56
          Height = 13
          Caption = 'Carreteiro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 344
          Top = 45
          Width = 76
          Height = 13
          Caption = 'Complemento'
          FocusControl = dbedt_END_COMPLEMENTO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_banco: TLabel
          Left = 610
          Top = 222
          Width = 37
          Height = 13
          Caption = 'Banco'
          FocusControl = dbedt_cd_banco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_banco: TSpeedButton
          Left = 916
          Top = 238
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
          OnClick = btn_co_bancoClick
        end
        object lbl_acesso: TLabel
          Left = 10
          Top = 222
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
          Left = 58
          Top = 222
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
        object Label23: TLabel
          Left = 10
          Top = 318
          Width = 41
          Height = 13
          Caption = '% IRFF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 87
          Top = 318
          Width = 43
          Height = 13
          Caption = '% INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 244
          Top = 318
          Width = 85
          Height = 13
          Caption = '% PIS/COFINS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 164
          Top = 318
          Width = 34
          Height = 13
          Caption = '% ISS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 523
          Top = 178
          Width = 87
          Height = 13
          Caption = 'Insc. Municipal'
          FocusControl = DBEdit5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 465
          Top = 270
          Width = 141
          Height = 13
          Caption = 'Conta Cont'#225'bil Reduzida'
          FocusControl = dbedt_cd_ct_contabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_favor: TDBEdit
          Left = 10
          Top = 22
          Width = 82
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_FAVORECIDO'
          DataSource = datm_favor.ds_favor
          ReadOnly = True
          TabOrder = 33
          OnChange = dbedt_nm_favorChange
        end
        object dbedt_nm_favor: TDBEdit
          Left = 100
          Top = 22
          Width = 421
          Height = 21
          DataField = 'NM_FAVORECIDO'
          DataSource = datm_favor.ds_favor
          TabOrder = 0
          OnChange = dbedt_nm_favorChange
        end
        object dblkpcbox_ativo_favor: TDBLookupComboBox
          Left = 624
          Top = 22
          Width = 63
          Height = 21
          DataField = 'look_ativo'
          DataSource = datm_favor.ds_favor
          DropDownRows = 3
          TabOrder = 2
          OnClick = dbedt_nm_favorChange
        end
        object dbedt_nm_sigla: TDBEdit
          Left = 529
          Top = 22
          Width = 83
          Height = 21
          DataField = 'AP_FAVORECIDO'
          DataSource = datm_favor.ds_favor
          TabOrder = 1
          OnChange = dbedt_nm_favorChange
        end
        object dbedt_END_FAVORECIDO: TDBEdit
          Left = 10
          Top = 62
          Width = 269
          Height = 21
          DataField = 'END_FAVORECIDO'
          DataSource = datm_favor.ds_favor
          TabOrder = 4
          OnChange = dbedt_nm_favorChange
        end
        object dbedt_END_NUMERO: TDBEdit
          Left = 281
          Top = 62
          Width = 59
          Height = 21
          DataField = 'END_NUMERO'
          DataSource = datm_favor.ds_favor
          TabOrder = 5
          OnChange = dbedt_nm_favorChange
        end
        object dbedt_END_CIDADE: TDBEdit
          Left = 114
          Top = 105
          Width = 251
          Height = 21
          DataField = 'END_CIDADE'
          DataSource = datm_favor.ds_favor
          TabOrder = 9
          OnChange = dbedt_nm_favorChange
        end
        object dbedt_END_BAIRRO: TDBEdit
          Left = 617
          Top = 62
          Width = 264
          Height = 21
          DataField = 'END_BAIRRO'
          DataSource = datm_favor.ds_favor
          TabOrder = 7
          OnChange = dbedt_nm_favorChange
        end
        object dbedt_END_CEP: TDBEdit
          Left = 10
          Top = 105
          Width = 86
          Height = 21
          DataField = 'END_CEP'
          DataSource = datm_favor.ds_favor
          TabOrder = 8
          OnChange = dbedt_nm_favorChange
        end
        object dbedt_NR_FONE: TDBEdit
          Left = 458
          Top = 105
          Width = 173
          Height = 21
          DataField = 'NR_FONE'
          DataSource = datm_favor.ds_favor
          TabOrder = 11
          OnChange = dbedt_nm_favorChange
        end
        object dbedt_NR_FAX: TDBEdit
          Left = 633
          Top = 105
          Width = 184
          Height = 21
          DataField = 'NR_FAX'
          DataSource = datm_favor.ds_favor
          TabOrder = 12
          OnChange = dbedt_nm_favorChange
        end
        object dbedt_NM_CONTATO: TDBEdit
          Left = 10
          Top = 149
          Width = 270
          Height = 21
          DataField = 'NM_CONTATO'
          DataSource = datm_favor.ds_favor
          TabOrder = 13
          OnChange = dbedt_nm_favorChange
        end
        object dbedt_TX_CARGO: TDBEdit
          Left = 281
          Top = 149
          Width = 184
          Height = 21
          DataField = 'TX_CARGO'
          DataSource = datm_favor.ds_favor
          TabOrder = 14
          OnChange = dbedt_nm_favorChange
        end
        object dbedt_TX_DEPARTAMENTO: TDBEdit
          Left = 468
          Top = 149
          Width = 146
          Height = 21
          DataField = 'TX_DEPARTAMENTO'
          DataSource = datm_favor.ds_favor
          TabOrder = 15
          OnChange = dbedt_nm_favorChange
        end
        object dbedt_CNPJ_EMPRESA: TDBEdit
          Left = 146
          Top = 193
          Width = 132
          Height = 21
          DataField = 'CGC_EMPRESA'
          DataSource = datm_favor.ds_favor
          TabOrder = 18
          OnChange = dbedt_nm_favorChange
          OnExit = dbedt_CNPJ_EMPRESAExit
        end
        object dbedt_CPF_EMPRESA: TDBEdit
          Left = 281
          Top = 193
          Width = 123
          Height = 21
          DataField = 'CPF_EMPRESA'
          DataSource = datm_favor.ds_favor
          TabOrder = 19
          OnChange = dbedt_nm_favorChange
          OnExit = dbedt_CPF_EMPRESAExit
        end
        object dbedt_IE_EMPRESA: TDBEdit
          Left = 410
          Top = 193
          Width = 109
          Height = 21
          DataField = 'IE_EMPRESA'
          DataSource = datm_favor.ds_favor
          TabOrder = 20
          OnChange = dbedt_nm_favorChange
        end
        object dbedt_DT_INCLUSAO: TDBEdit
          Left = 697
          Top = 22
          Width = 95
          Height = 21
          DataField = 'DT_INCLUSAO'
          DataSource = datm_favor.ds_favor
          TabOrder = 3
          OnChange = dbedt_nm_favorChange
        end
        object dblkpcbox_controla_ir: TDBLookupComboBox
          Left = 10
          Top = 286
          Width = 63
          Height = 21
          DataField = 'look_controla_ir'
          DataSource = datm_favor.ds_favor
          DropDownRows = 3
          TabOrder = 27
          OnClick = dbedt_nm_favorChange
          OnExit = dblkpcbox_controla_irExit
        end
        object DBComboBox1: TDBComboBox
          Left = 392
          Top = 105
          Width = 59
          Height = 21
          DataField = 'END_UF'
          DataSource = datm_favor.ds_favor
          ItemHeight = 13
          Items.Strings = (
            'SP'
            'RJ'
            'MG'
            'SC'
            'BA'
            'MA'
            'PI'
            'SE')
          TabOrder = 10
          OnClick = dbedt_nm_favorChange
        end
        object dbedt_cd_ct_contabil: TDBEdit
          Left = 106
          Top = 238
          Width = 90
          Height = 21
          DataField = 'CD_CT_CONTABIL'
          DataSource = datm_favor.ds_favor
          TabOrder = 25
          OnChange = dbedt_nm_favorChange
          OnExit = dbedt_cd_ct_contabilExit
          OnKeyDown = dbedt_cd_recolKeyDown
        end
        object dbedt_nm_ct_contabil: TDBEdit
          Left = 199
          Top = 238
          Width = 379
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCtcontabil'
          DataSource = datm_favor.ds_favor
          ReadOnly = True
          TabOrder = 34
        end
        object dbedt_cd_recol: TDBEdit
          Left = 80
          Top = 286
          Width = 50
          Height = 21
          DataField = 'CD_RECOL'
          DataSource = datm_favor.ds_favor
          MaxLength = 8
          TabOrder = 28
          OnChange = dbedt_nm_favorChange
          OnExit = dbedt_cd_recolExit
          OnKeyDown = dbedt_cd_recolKeyDown
        end
        object dbedt_nm_natureza: TDBEdit
          Left = 134
          Top = 286
          Width = 276
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_nm_natureza'
          DataSource = datm_favor.ds_favor
          ReadOnly = True
          TabOrder = 35
        end
        object dblkpcbox_tp_pessoa: TDBLookupComboBox
          Left = 10
          Top = 193
          Width = 134
          Height = 21
          DataField = 'look_tp_pessoa'
          DataSource = datm_favor.ds_favor
          TabOrder = 17
          OnClick = dblkpcbox_tp_pessoaClick
        end
        object dbedt_NR_INSS: TDBEdit
          Left = 636
          Top = 193
          Width = 93
          Height = 21
          DataField = 'NR_INSS'
          DataSource = datm_favor.ds_favor
          TabOrder = 22
          OnChange = dbedt_nm_favorChange
        end
        object dblkpcbox_transp: TDBLookupComboBox
          Left = 625
          Top = 149
          Width = 63
          Height = 21
          DataField = 'look_transp'
          DataSource = datm_favor.ds_favor
          DropDownRows = 3
          TabOrder = 16
          OnClick = dbedt_nm_favorChange
        end
        object dbedt_END_COMPLEMENTO: TDBEdit
          Left = 344
          Top = 62
          Width = 269
          Height = 21
          DataField = 'END_COMPLEMENTO'
          DataSource = datm_favor.ds_favor
          TabOrder = 6
          OnChange = dbedt_nm_favorChange
        end
        object dbedt_cd_banco: TDBEdit
          Left = 610
          Top = 238
          Width = 37
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_favor.ds_favor
          MaxLength = 8
          TabOrder = 26
          OnChange = dbedt_nm_favorChange
          OnExit = dbedt_cd_bancoExit
          OnKeyDown = dbedt_cd_recolKeyDown
        end
        object dbedt_nm_banco: TDBEdit
          Left = 650
          Top = 238
          Width = 262
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_favor.ds_favor
          ReadOnly = True
          TabOrder = 36
        end
        object dbedt_cd_acesso: TDBEdit
          Left = 10
          Top = 238
          Width = 32
          Height = 21
          DataField = 'CD_ACESSO'
          DataSource = datm_favor.ds_favor
          TabOrder = 23
          OnEnter = dbedt_cd_acessoEnter
          OnExit = dbedt_cd_acessoExit
        end
        object dbedt_cd_aux: TDBEdit
          Left = 58
          Top = 238
          Width = 36
          Height = 21
          DataField = 'CD_AUX'
          DataSource = datm_favor.ds_favor
          TabOrder = 24
          OnEnter = dbedt_cd_auxEnter
          OnExit = dbedt_cd_auxExit
        end
        object DBEdit1: TDBEdit
          Left = 10
          Top = 335
          Width = 70
          Height = 21
          DataField = 'ALIQ_IRFF'
          DataSource = datm_favor.ds_favor
          TabOrder = 29
          OnChange = dbedt_nm_favorChange
          OnEnter = dbedt_cd_acessoEnter
          OnExit = dbedt_cd_acessoExit
        end
        object DBEdit2: TDBEdit
          Left = 88
          Top = 334
          Width = 70
          Height = 21
          DataField = 'ALIQ_INSS'
          DataSource = datm_favor.ds_favor
          TabOrder = 30
          OnChange = dbedt_nm_favorChange
          OnEnter = dbedt_cd_acessoEnter
          OnExit = dbedt_cd_acessoExit
        end
        object DBEdit3: TDBEdit
          Left = 244
          Top = 334
          Width = 70
          Height = 21
          DataField = 'ALIQ_PISCOFINS'
          DataSource = datm_favor.ds_favor
          TabOrder = 32
          OnChange = dbedt_nm_favorChange
          OnEnter = dbedt_cd_acessoEnter
          OnExit = dbedt_cd_acessoExit
        end
        object DBEdit4: TDBEdit
          Left = 164
          Top = 334
          Width = 70
          Height = 21
          DataField = 'ALIQ_ISS'
          DataSource = datm_favor.ds_favor
          TabOrder = 31
          OnChange = dbedt_nm_favorChange
          OnEnter = dbedt_cd_acessoEnter
          OnExit = dbedt_cd_acessoExit
        end
        object DBEdit5: TDBEdit
          Left = 523
          Top = 193
          Width = 109
          Height = 21
          DataField = 'IM_EMPRESA'
          DataSource = datm_favor.ds_favor
          TabOrder = 21
          OnChange = dbedt_nm_favorChange
        end
        object dbedt_contabil_reduzida: TDBEdit
          Left = 464
          Top = 285
          Width = 145
          Height = 21
          DataField = 'CD_CT_CONTABIL_REDUZIDA_NOVO'
          DataSource = datm_favor.ds_favor
          TabOrder = 37
          OnChange = dbedt_nm_favorChange
        end
      end
    end
    object tsContas: TTabSheet
      Caption = 'Contas'
      ImageIndex = 2
      object pgctrl_favor_contas: TPageControl
        Left = 0
        Top = 0
        Width = 968
        Height = 596
        ActivePage = tsDadosBasicosContas
        Align = alClient
        TabOrder = 0
        object tsListaContas: TTabSheet
          Caption = 'Lista'
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 960
            Height = 568
            Align = alClient
            DataSource = datm_favor.dts_favor_contas
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = dbg_favorDblClick
            OnKeyPress = dbg_favorKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_CT_CONTABIL'
                Title.Color = clBlack
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
                FieldName = 'LookupNM_Contabil'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 293
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALIQ_IRFF'
                Title.Alignment = taCenter
                Title.Caption = '% IRFF'
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
                FieldName = 'ALIQ_INSS'
                Title.Alignment = taCenter
                Title.Caption = '% INSS'
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
                FieldName = 'ALIQ_ISS'
                Title.Alignment = taCenter
                Title.Caption = '% ISS'
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
                FieldName = 'ALIQ_PISCOFINS'
                Title.Caption = '% PIS/COFINS'
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
        end
        object tsDadosBasicosContas: TTabSheet
          Caption = 'Dados B'#225'sicos'
          ImageIndex = 1
          object Label29: TLabel
            Left = 18
            Top = 73
            Width = 84
            Height = 13
            Caption = 'Conta Cont'#225'bil'
            FocusControl = EditCdContabil
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object BtncontaContabil: TSpeedButton
            Left = 535
            Top = 88
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
            OnClick = BtncontaContabilClick
          end
          object Label30: TLabel
            Left = 18
            Top = 23
            Width = 44
            Height = 13
            AutoSize = False
            Caption = 'C'#243'digo'
            FocusControl = DBEdit6
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label32: TLabel
            Left = 108
            Top = 23
            Width = 58
            Height = 13
            AutoSize = False
            Caption = 'Descri'#231#227'o'
            FocusControl = DBEdit7
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label33: TLabel
            Left = 537
            Top = 23
            Width = 46
            Height = 13
            AutoSize = False
            Caption = 'Apelido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label35: TLabel
            Left = 18
            Top = 129
            Width = 41
            Height = 13
            Caption = '% IRFF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label36: TLabel
            Left = 126
            Top = 129
            Width = 43
            Height = 13
            Caption = '% INSS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label37: TLabel
            Left = 234
            Top = 129
            Width = 34
            Height = 13
            Caption = '% ISS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label38: TLabel
            Left = 342
            Top = 129
            Width = 85
            Height = 13
            Caption = '% PIS/COFINS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_cd_ct_custo: TLabel
            Left = 18
            Top = 186
            Width = 38
            Height = 13
            Caption = 'Rateio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_rateio: TSpeedButton
            Left = 306
            Top = 199
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
            OnClick = btn_rateioClick
          end
          object EditCdContabil: TDBEdit
            Left = 18
            Top = 89
            Width = 94
            Height = 21
            DataField = 'CD_CT_CONTABIL'
            DataSource = datm_favor.dts_favor_contas
            TabOrder = 0
            OnChange = BtncontaContabilClick
            OnExit = dbedt_cd_ct_contabilExit
            OnKeyDown = dbedt_cd_recolKeyDown
          end
          object EditNMContabil: TEdit
            Left = 113
            Top = 89
            Width = 418
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 7
          end
          object DBEdit6: TDBEdit
            Left = 18
            Top = 38
            Width = 82
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_FAVORECIDO'
            DataSource = datm_favor.ds_favor
            ReadOnly = True
            TabOrder = 8
            OnChange = dbedt_nm_favorChange
          end
          object DBEdit7: TDBEdit
            Left = 108
            Top = 38
            Width = 421
            Height = 21
            Color = clMenu
            DataField = 'NM_FAVORECIDO'
            DataSource = datm_favor.ds_favor
            ReadOnly = True
            TabOrder = 9
            OnChange = dbedt_nm_favorChange
          end
          object DBEdit8: TDBEdit
            Left = 537
            Top = 38
            Width = 83
            Height = 21
            Color = clMenu
            DataField = 'AP_FAVORECIDO'
            DataSource = datm_favor.ds_favor
            ReadOnly = True
            TabOrder = 10
            OnChange = dbedt_nm_favorChange
          end
          object dbedtIRFF: TDBEdit
            Left = 18
            Top = 143
            Width = 70
            Height = 21
            DataField = 'ALIQ_IRFF'
            DataSource = datm_favor.dts_favor_contas
            MaxLength = 15
            TabOrder = 1
            OnChange = BtncontaContabilClick
            OnExit = dbedt_cd_ct_contabilExit
            OnKeyDown = dbedt_cd_recolKeyDown
          end
          object dbedtINSS: TDBEdit
            Left = 126
            Top = 143
            Width = 70
            Height = 21
            DataField = 'ALIQ_INSS'
            DataSource = datm_favor.dts_favor_contas
            MaxLength = 15
            TabOrder = 2
            OnChange = BtncontaContabilClick
            OnExit = dbedt_cd_ct_contabilExit
            OnKeyDown = dbedt_cd_recolKeyDown
          end
          object dbedtISS: TDBEdit
            Left = 234
            Top = 143
            Width = 70
            Height = 21
            DataField = 'ALIQ_ISS'
            DataSource = datm_favor.dts_favor_contas
            MaxLength = 15
            TabOrder = 3
            OnChange = BtncontaContabilClick
            OnExit = dbedt_cd_ct_contabilExit
            OnKeyDown = dbedt_cd_recolKeyDown
          end
          object dbedtPisCofins: TDBEdit
            Left = 341
            Top = 143
            Width = 70
            Height = 21
            DataField = 'ALIQ_PISCOFINS'
            DataSource = datm_favor.dts_favor_contas
            MaxLength = 15
            TabOrder = 4
            OnChange = BtncontaContabilClick
            OnExit = dbedt_cd_ct_contabilExit
            OnKeyDown = dbedt_cd_recolKeyDown
          end
          object dbedt_nm_rateio: TEdit
            Left = 78
            Top = 200
            Width = 226
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 6
          end
          object dbedt_cd_rateio: TDBEdit
            Left = 18
            Top = 200
            Width = 57
            Height = 21
            DataField = 'CD_RATEIO'
            DataSource = datm_favor.dts_favor_contas
            TabOrder = 5
            OnChange = btn_rateioClick
            OnExit = dbedt_cd_rateioExit
            OnKeyDown = dbedt_cd_recolKeyDown
          end
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 976
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object btn_incluir: TSpeedButton
      Left = 4
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
      Left = 118
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
      Left = 42
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
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 80
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
      OnClick = btn_cancelarClick
    end
    object dbnvg: TDBNavigator
      Left = 212
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_favor.ds_favor
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 665
      Top = 2
      Width = 309
      Height = 43
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
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
        OnKeyDown = edt_chaveKeyDown
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
    Left = 548
    Top = 4
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
      OnClick = btn_sairClick
    end
  end
end
