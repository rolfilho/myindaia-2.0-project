object frm_emp_est: Tfrm_emp_est
  Left = 269
  Top = 230
  Width = 766
  Height = 579
  Caption = 'Empresa Estrangeira'
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_emp_est: TPageControl
    Left = 0
    Top = 47
    Width = 750
    Height = 473
    ActivePage = ts_ClienteOperadorEstrangeiro
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_emp_estChange
    OnChanging = pgctrl_emp_estChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_emp_est: TDBGrid
        Left = 0
        Top = 54
        Width = 742
        Height = 391
        Align = alClient
        DataSource = datm_emp_est.ds_lista
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_emp_estDblClick
        OnKeyPress = dbg_emp_estKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_EMPRESA'
            Title.Caption = 'C'#243'digo'
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
            FieldName = 'NM_EMPRESA'
            Title.Caption = 'Descri'#231#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 349
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_EMPRESA'
            Title.Caption = 'Apelido'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 126
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Look_Ativo'
            Title.Caption = 'Ativo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_CLIENTE'
            Title.Caption = 'C'#243'd. no Cliente'
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
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 54
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object lbl_cd_produto: TLabel
          Left = 11
          Top = 9
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
          Left = 376
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
          OnClick = btn_co_produtoClick
        end
        object edt_nm_produto: TEdit
          Left = 47
          Top = 22
          Width = 328
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 0
        end
        object msk_cd_produto: TMaskEdit
          Left = 11
          Top = 22
          Width = 37
          Height = 21
          MaxLength = 2
          TabOrder = 1
          OnChange = btn_co_produtoClick
          OnExit = msk_cd_produtoExit
          OnKeyDown = msk_cd_produtoKeyDown
        end
        object chk_estrangeira: TCheckBox
          Left = 624
          Top = 32
          Width = 97
          Height = 17
          Caption = 'Mostrar Inativos'
          TabOrder = 2
          OnClick = chk_estrangeiraClick
        end
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados B'#225'sicos'
      object pnl_cnt: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 445
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Shape4: TShape
          Left = 526
          Top = 28
          Width = 188
          Height = 21
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape3: TShape
          Left = 16
          Top = 258
          Width = 561
          Height = 151
          Brush.Style = bsClear
        end
        object Shape2: TShape
          Left = 422
          Top = 280
          Width = 142
          Height = 68
          Brush.Color = clSilver
        end
        object Label3: TLabel
          Left = 16
          Top = 14
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_empresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 82
          Top = 14
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Descri'#231#227'o'
          FocusControl = dbedt_nm_empresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ativo: TLabel
          Left = 443
          Top = 15
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
        object Label7: TLabel
          Left = 186
          Top = 64
          Width = 57
          Height = 13
          Caption = 'C'#243'd. Pa'#237's'
          FocusControl = dbedt_cd_pais
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 251
          Top = 64
          Width = 113
          Height = 13
          AutoSize = False
          Caption = 'Desc. Pa'#237's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_emp_est: TSpeedButton
          Left = 482
          Top = 76
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
          OnClick = btn_co_emp_estClick
        end
        object Label5: TLabel
          Left = 15
          Top = 63
          Width = 43
          Height = 13
          Caption = 'Apelido'
          FocusControl = dbedt_ap_empresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 16
          Top = 104
          Width = 55
          Height = 13
          Caption = 'Endere'#231'o'
          FocusControl = dbedt_END_EMPRESA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 441
          Top = 104
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
        object Label10: TLabel
          Left = 16
          Top = 144
          Width = 76
          Height = 13
          Caption = 'Complemento'
          FocusControl = dbedt_END_COMPL
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 220
          Top = 144
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
        object Label12: TLabel
          Left = 361
          Top = 144
          Width = 40
          Height = 13
          Caption = 'Estado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 15
          Top = 181
          Width = 51
          Height = 13
          Caption = 'Telefone'
          FocusControl = dbedt_NR_TELEFONE
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 111
          Top = 181
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
        object Label15: TLabel
          Left = 16
          Top = 218
          Width = 80
          Height = 13
          Caption = 'Data Inclus'#227'o'
          FocusControl = dbedt_DT_INCLUSAO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 440
          Top = 294
          Width = 88
          Height = 13
          Caption = 'C'#243'd. no Cliente'
          FocusControl = dbedt_cd_cliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label17: TLabel
          Left = 220
          Top = 181
          Width = 45
          Height = 13
          Caption = 'Contato'
          FocusControl = dbedt_nm_contato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 26
          Top = 266
          Width = 127
          Height = 13
          Caption = 'Grupos que utilizam a '
          FocusControl = dbedt_cd_cliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 153
          Top = 266
          Width = 50
          Height = 13
          AutoSize = True
          DataField = 'NM_EMPRESA'
          DataSource = datm_emp_est.ds_emp_est
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape1: TShape
          Left = 26
          Top = 378
          Width = 11
          Height = 11
          Brush.Color = clInfoBk
        end
        object lbl1: TLabel
          Left = 40
          Top = 378
          Width = 127
          Height = 13
          Caption = 'duplo-clique para consultar'
        end
        object Label19: TLabel
          Left = 40
          Top = 390
          Width = 281
          Height = 13
          Caption = 'para excluir um registro, deixe o campo "c'#243'digo" em branco'
          Transparent = True
        end
        object Label21: TLabel
          Left = 531
          Top = 32
          Width = 98
          Height = 13
          Caption = 'Tipo do Cadastro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lbl2: TLabel
          Left = 111
          Top = 218
          Width = 27
          Height = 13
          Caption = 'RUC'
          FocusControl = dbedtRUC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 223
          Top = 218
          Width = 22
          Height = 13
          Caption = 'NIT'
          FocusControl = dbedtRUC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 358
          Top = 218
          Width = 30
          Height = 13
          Caption = 'CUIT'
          FocusControl = dbedtRUC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape5: TShape
          Left = 526
          Top = 156
          Width = 188
          Height = 21
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label24: TLabel
          Left = 531
          Top = 160
          Width = 62
          Height = 13
          Caption = 'Exig'#234'ncias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object dbedt_cd_empresa: TDBEdit
          Left = 16
          Top = 28
          Width = 49
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'CD_EMPRESA'
          DataSource = datm_emp_est.ds_emp_est
          ReadOnly = True
          TabOrder = 0
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_nm_empresa: TDBEdit
          Left = 82
          Top = 28
          Width = 343
          Height = 21
          DataField = 'NM_EMPRESA'
          DataSource = datm_emp_est.ds_emp_est
          TabOrder = 1
          OnChange = dbedt_nm_empresaChange
        end
        object dblkpcbox_ativo_emp_est: TDBLookupComboBox
          Left = 442
          Top = 28
          Width = 66
          Height = 21
          DataField = 'look_ativo'
          DataSource = datm_emp_est.ds_emp_est
          DropDownRows = 3
          TabOrder = 2
          OnClick = dbedt_nm_empresaChange
        end
        object dbedt_nm_pais: TDBEdit
          Left = 251
          Top = 77
          Width = 230
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_pais'
          DataSource = datm_emp_est.ds_emp_est
          ReadOnly = True
          TabOrder = 6
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_ap_empresa: TDBEdit
          Left = 15
          Top = 76
          Width = 154
          Height = 21
          DataField = 'AP_EMPRESA'
          DataSource = datm_emp_est.ds_emp_est
          TabOrder = 4
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_END_EMPRESA: TDBEdit
          Left = 16
          Top = 117
          Width = 411
          Height = 21
          DataField = 'END_EMPRESA'
          DataSource = datm_emp_est.ds_emp_est
          TabOrder = 7
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_END_NUMERO: TDBEdit
          Left = 442
          Top = 117
          Width = 66
          Height = 21
          DataField = 'END_NUMERO'
          DataSource = datm_emp_est.ds_emp_est
          TabOrder = 8
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_END_COMPL: TDBEdit
          Left = 16
          Top = 157
          Width = 201
          Height = 21
          DataField = 'END_COMPL'
          DataSource = datm_emp_est.ds_emp_est
          TabOrder = 9
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_END_CIDADE: TDBEdit
          Left = 221
          Top = 157
          Width = 130
          Height = 21
          DataField = 'END_CIDADE'
          DataSource = datm_emp_est.ds_emp_est
          TabOrder = 10
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_NR_TELEFONE: TDBEdit
          Left = 16
          Top = 194
          Width = 90
          Height = 21
          DataField = 'NR_TELEFONE'
          DataSource = datm_emp_est.ds_emp_est
          TabOrder = 12
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_NR_FAX: TDBEdit
          Left = 111
          Top = 194
          Width = 106
          Height = 21
          DataField = 'NR_FAX'
          DataSource = datm_emp_est.ds_emp_est
          TabOrder = 13
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_DT_INCLUSAO: TDBEdit
          Left = 16
          Top = 231
          Width = 90
          Height = 21
          DataField = 'DT_INCLUSAO'
          DataSource = datm_emp_est.ds_emp_est
          MaxLength = 10
          TabOrder = 17
          OnChange = dbedt_nm_empresaChange
        end
        object pnl_escolha: TPanel
          Left = 526
          Top = 49
          Width = 188
          Height = 95
          BevelInner = bvLowered
          TabOrder = 3
          object dbchkbox_in_agente: TDBCheckBox
            Left = 8
            Top = 49
            Width = 57
            Height = 19
            Caption = 'Agente'
            DataField = 'IN_AGENTE'
            DataSource = datm_emp_est.ds_emp_est
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbchkbox_in_agenteClick
          end
          object dbchkbox_in_banco: TDBCheckBox
            Left = 8
            Top = 70
            Width = 73
            Height = 19
            Caption = 'Banco'
            DataField = 'IN_BANCO'
            DataSource = datm_emp_est.ds_emp_est
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbchkbox_in_bancoClick
          end
          object dbchkbox_in_importador: TDBCheckBox
            Left = 8
            Top = 27
            Width = 137
            Height = 19
            Caption = 'Importador / Cliente'
            DataField = 'IN_IMPORTADOR'
            DataSource = datm_emp_est.ds_emp_est
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbchkbox_in_importadorClick
          end
          object dbchkbox_in_seguradora: TDBCheckBox
            Left = 96
            Top = 49
            Width = 86
            Height = 19
            Caption = 'Seguradora'
            DataField = 'IN_SEGURADORA'
            DataSource = datm_emp_est.ds_emp_est
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbchkbox_in_seguradoraClick
          end
          object dbchkbox_in_exportador: TDBCheckBox
            Left = 8
            Top = 6
            Width = 161
            Height = 19
            Caption = 'Exportador / Fornecedor'
            DataField = 'IN_EXPORTADOR'
            DataSource = datm_emp_est.ds_emp_est
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbchkbox_in_importadorClick
          end
          object dbchkbox_in_comprador: TDBCheckBox
            Left = 96
            Top = 70
            Width = 86
            Height = 19
            Caption = 'Comprador'
            DataField = 'IN_COMPRADOR'
            DataSource = datm_emp_est.ds_emp_est
            TabOrder = 5
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbchkbox_in_seguradoraClick
          end
        end
        object dbedt_cd_cliente: TDBEdit
          Left = 441
          Top = 308
          Width = 104
          Height = 22
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkFlat
          Ctl3D = False
          DataField = 'NR_CLIENTE'
          DataSource = datm_emp_est.ds_emp_est
          ParentCtl3D = False
          TabOrder = 18
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_nm_contato: TDBEdit
          Left = 221
          Top = 194
          Width = 132
          Height = 21
          DataField = 'NM_CONTATO'
          DataSource = datm_emp_est.ds_emp_est
          TabOrder = 14
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_ESTADO: TDBEdit
          Left = 362
          Top = 157
          Width = 101
          Height = 21
          DataField = 'END_ESTADO'
          DataSource = datm_emp_est.ds_emp_est
          TabOrder = 11
          OnChange = dbedt_ESTADOChange
        end
        object dbedt_cd_pais: TDBEdit
          Left = 186
          Top = 77
          Width = 66
          Height = 21
          DataField = 'CD_PAIS'
          DataSource = datm_emp_est.ds_emp_est
          TabOrder = 5
          OnChange = btn_co_emp_estClick
          OnExit = dbedt_cd_paisExit
          OnKeyDown = dbedt_cd_paisKeyDown
        end
        object dbgrdGrupos: TDBGrid
          Left = 26
          Top = 280
          Width = 385
          Height = 96
          Ctl3D = False
          DataSource = datm_emp_est.dsEmpEstGrupo
          ParentCtl3D = False
          TabOrder = 19
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgrdGruposDblClick
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CD_GRUPO'
              Title.Caption = 'C'#243'digo'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'calcNmGrupo'
              Title.Caption = 'Descri'#231#227'o do Grupo'
              Width = 296
              Visible = True
            end>
        end
        object dbedtRUC: TDBEdit
          Left = 111
          Top = 231
          Width = 106
          Height = 21
          DataField = 'NR_RUC'
          DataSource = datm_emp_est.ds_emp_est
          TabOrder = 15
          OnChange = dbedt_nm_empresaChange
        end
        object DBEdit1: TDBEdit
          Left = 223
          Top = 231
          Width = 130
          Height = 21
          DataField = 'NR_NIT'
          DataSource = datm_emp_est.ds_emp_est
          TabOrder = 16
          OnChange = dbedt_nm_empresaChange
        end
        object dbedtCUIT: TDBEdit
          Left = 358
          Top = 231
          Width = 130
          Height = 21
          DataField = 'NR_CUIT'
          DataSource = datm_emp_est.ds_emp_est
          TabOrder = 20
          OnChange = dbedt_nm_empresaChange
        end
        object Panel3: TPanel
          Left = 526
          Top = 177
          Width = 188
          Height = 32
          BevelInner = bvLowered
          TabOrder = 22
        end
        object DBCheckBox1: TDBCheckBox
          Left = 535
          Top = 187
          Width = 177
          Height = 17
          Caption = 'Declara'#231#227'o do Detentor'
          DataField = 'IN_DECLARACAO_DETENTOR'
          DataSource = datm_emp_est.ds_emp_est
          TabOrder = 21
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = DBCheckBox1Click
        end
      end
    end
    object ts_observacao: TTabSheet
      Caption = 'Observa'#231#245'es'
      object pnl_obs: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 445
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object btn_co_obs_agente: TSpeedButton
          Left = 311
          Top = 19
          Width = 25
          Height = 21
          Enabled = False
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
          OnClick = btn_co_obs_agenteClick
        end
        object lbl_agente: TLabel
          Left = 6
          Top = 27
          Width = 256
          Height = 13
          AutoSize = False
          Caption = 'Observacao do Agente'
          Enabled = False
          FocusControl = dbedt_cd_empresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_importador: TLabel
          Left = 6
          Top = 198
          Width = 250
          Height = 13
          AutoSize = False
          Caption = 'Observacao do Importador'
          Enabled = False
          FocusControl = dbedt_cd_empresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_obs_imp: TSpeedButton
          Left = 311
          Top = 190
          Width = 25
          Height = 21
          Enabled = False
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
          OnClick = btn_co_obs_impClick
        end
        object lbl_banco: TLabel
          Left = 358
          Top = 27
          Width = 217
          Height = 13
          AutoSize = False
          Caption = 'Observacao do Banco'
          Enabled = False
          FocusControl = dbedt_cd_empresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_obs_banco: TSpeedButton
          Left = 663
          Top = 20
          Width = 25
          Height = 21
          Enabled = False
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
          OnClick = btn_co_obs_bancoClick
        end
        object lbl_seguradora: TLabel
          Left = 358
          Top = 198
          Width = 217
          Height = 13
          AutoSize = False
          Caption = 'Observacao da Seguradora'
          Enabled = False
          FocusControl = dbedt_cd_empresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_obs_seg: TSpeedButton
          Left = 663
          Top = 191
          Width = 25
          Height = 21
          Enabled = False
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
          OnClick = btn_co_obs_segClick
        end
        object dbm_obs_agente: TDBMemo
          Left = 6
          Top = 41
          Width = 332
          Height = 131
          DataField = 'TX_OBS_AGENTE'
          DataSource = datm_emp_est.ds_emp_est
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_nm_empresaChange
        end
        object dbm_obs_imp: TDBMemo
          Left = 6
          Top = 212
          Width = 332
          Height = 131
          DataField = 'TX_OBS_IMP'
          DataSource = datm_emp_est.ds_emp_est
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_nm_empresaChange
        end
        object dbm_obs_banco: TDBMemo
          Left = 358
          Top = 41
          Width = 332
          Height = 131
          DataField = 'TX_OBS_BANCO'
          DataSource = datm_emp_est.ds_emp_est
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = dbedt_nm_empresaChange
        end
        object dbm_obs_seg: TDBMemo
          Left = 358
          Top = 212
          Width = 332
          Height = 131
          DataField = 'TX_OBS_SEG'
          DataSource = datm_emp_est.ds_emp_est
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = dbedt_nm_empresaChange
        end
      end
    end
    object ts_Integracoes: TTabSheet
      Caption = 'Integra'#231#245'es'
      ImageIndex = 3
      object GroupBox1: TGroupBox
        Left = 4
        Top = 12
        Width = 343
        Height = 293
        Caption = 'Fiesp Importador'
        TabOrder = 0
        object btnExcluirFiespImportador: TSpeedButton
          Left = 124
          Top = 16
          Width = 38
          Height = 41
          Hint = 'Excluir'
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
          OnClick = btnExcluirFiespImportadorClick
        end
        object btnCancelarFiespImportador: TSpeedButton
          Left = 86
          Top = 16
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
          OnClick = btnCancelarFiespImportadorClick
        end
        object btnSalvarFiespImportador: TSpeedButton
          Left = 48
          Top = 16
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
          OnClick = btnSalvarFiespImportadorClick
        end
        object btnIncluirFiespImportador: TSpeedButton
          Left = 10
          Top = 16
          Width = 38
          Height = 41
          Hint = 'Incluir'
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
          OnClick = btnIncluirFiespImportadorClick
        end
        object btnImportador: TSpeedButton
          Left = 305
          Top = 75
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
          OnClick = btnImportadorClick
        end
        object Label25: TLabel
          Left = 76
          Top = 62
          Width = 113
          Height = 13
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 11
          Top = 62
          Width = 40
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbet_CodigoImportador
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 11
          Top = 98
          Width = 46
          Height = 13
          Caption = 'Fiesp Id'
          FocusControl = dbet_FiespIdImportador
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton2: TSpeedButton
          Left = 69
          Top = 111
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
          OnClick = SpeedButton2Click
        end
        object DBGrid1: TDBGrid
          Left = 9
          Top = 140
          Width = 325
          Height = 145
          DataSource = datm_emp_est.dsFiespImportador
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object dbet_CodigoImportador: TDBEdit
          Left = 11
          Top = 77
          Width = 66
          Height = 21
          DataField = 'CD_EMPRESA_NAC'
          DataSource = datm_emp_est.dsFiespImportador
          TabOrder = 0
          OnChange = btnImportadorClick
          OnExit = dbet_CodigoImportadorExit
          OnKeyDown = dbet_CodigoImportadorKeyDown
        end
        object dbetNomeImportador: TDBEdit
          Left = 79
          Top = 77
          Width = 222
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'nm_emprsa'
          DataSource = datm_emp_est.dsFiespImportador
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_nm_empresaChange
        end
        object dbet_FiespIdImportador: TDBEdit
          Left = 11
          Top = 113
          Width = 50
          Height = 21
          DataField = 'FIESP_ID'
          DataSource = datm_emp_est.dsFiespImportador
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 352
        Top = 12
        Width = 341
        Height = 293
        Caption = 'Fiesp Interveniente'
        TabOrder = 1
        object btnExcluirFiespInterveniente: TSpeedButton
          Left = 123
          Top = 16
          Width = 38
          Height = 41
          Hint = 'Excluir'
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
          OnClick = btnExcluirFiespIntervenienteClick
        end
        object btnCancelarFiespInterveniente: TSpeedButton
          Left = 85
          Top = 16
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
          OnClick = btnCancelarFiespIntervenienteClick
        end
        object btnSalvarFiespInterveniente: TSpeedButton
          Left = 47
          Top = 16
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
          OnClick = btnSalvarFiespIntervenienteClick
        end
        object btnIncluirFiespInterveniente: TSpeedButton
          Left = 9
          Top = 16
          Width = 38
          Height = 41
          Hint = 'Incluir'
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
          OnClick = btnIncluirFiespIntervenienteClick
        end
        object Label28: TLabel
          Left = 10
          Top = 62
          Width = 40
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbet_CodigoInterveniente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 75
          Top = 62
          Width = 113
          Height = 13
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnInterveniente: TSpeedButton
          Left = 304
          Top = 74
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
          OnClick = btnIntervenienteClick
        end
        object Label30: TLabel
          Left = 10
          Top = 98
          Width = 46
          Height = 13
          Caption = 'Fiesp Id'
          FocusControl = dbet_FiespIdInterveniente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton3: TSpeedButton
          Left = 69
          Top = 111
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
          OnClick = SpeedButton3Click
        end
        object DBGrid2: TDBGrid
          Left = 10
          Top = 140
          Width = 319
          Height = 141
          DataSource = datm_emp_est.dsFiespInterveniente
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object dbet_CodigoInterveniente: TDBEdit
          Left = 10
          Top = 77
          Width = 66
          Height = 21
          DataField = 'CD_EMPRESA_NAC'
          DataSource = datm_emp_est.dsFiespInterveniente
          TabOrder = 0
          OnChange = btn_co_emp_estClick
          OnExit = dbet_CodigoIntervenienteExit
          OnKeyDown = dbet_CodigoIntervenienteKeyDown
        end
        object dbed_NomeInterveniente: TDBEdit
          Left = 78
          Top = 77
          Width = 223
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'nm_empresa'
          DataSource = datm_emp_est.dsFiespInterveniente
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_nm_empresaChange
        end
        object dbet_FiespIdInterveniente: TDBEdit
          Left = 10
          Top = 113
          Width = 50
          Height = 21
          DataField = 'FIESP_ID'
          DataSource = datm_emp_est.dsFiespInterveniente
          TabOrder = 1
        end
      end
    end
    object ts_ClienteOperadorEstrangeiro: TTabSheet
      Caption = 'Ope. Estrangeiro'
      ImageIndex = 4
      object GroupBox3: TGroupBox
        Left = 4
        Top = 12
        Width = 669
        Height = 298
        Caption = '  Operador Estrangeiro nos clientes  '
        TabOrder = 0
        object btnExcluirOpeEstrangeiro: TSpeedButton
          Left = 133
          Top = 26
          Width = 38
          Height = 41
          Hint = 'Excluir'
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
          OnClick = btnExcluirOpeEstrangeiroClick
        end
        object btnCancelarOpeEstrangeiro: TSpeedButton
          Left = 95
          Top = 26
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
          OnClick = btnCancelarOpeEstrangeiroClick
        end
        object btnSalvarOpeEstrangeiro: TSpeedButton
          Left = 57
          Top = 26
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
          OnClick = btnSalvarOpeEstrangeiroClick
        end
        object btnIncluirOpeEstrangeiro: TSpeedButton
          Left = 19
          Top = 26
          Width = 38
          Height = 41
          Hint = 'Incluir'
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
          OnClick = btnIncluirOpeEstrangeiroClick
        end
        object btnRaizCNPJCliente: TSpeedButton
          Left = 397
          Top = 93
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
          OnClick = btnRaizCNPJClienteClick
        end
        object lblNomeRaizCNPJ: TLabel
          Left = 125
          Top = 79
          Width = 113
          Height = 13
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblRaizCNPJ: TLabel
          Left = 20
          Top = 79
          Width = 61
          Height = 13
          Caption = 'Raiz CNPJ'
          FocusControl = edtRaizCNPJ
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 427
          Top = 79
          Width = 126
          Height = 13
          Caption = 'C'#243'd. Ope. Estrangeiro'
          FocusControl = edtCodOpeEstrangeiro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 563
          Top = 79
          Width = 40
          Height = 13
          Caption = 'Vers'#227'o'
          FocusControl = dbedtNR_VERSAO_OPE_ESTRANGEIRO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBGrid3: TDBGrid
          Left = 20
          Top = 129
          Width = 629
          Height = 145
          DataSource = datm_emp_est.dsClientesRaizCNPJ
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'RAIZ_CNPJ'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_OPE_ESTRANGEIRO'
              Title.Caption = 'C'#243'digo Ope Estr'
              Width = 125
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_VERSAO_OPE_ESTRANGEIRO'
              Title.Caption = 'Vers'#227'o Ope Estr'
              Width = 100
              Visible = True
            end>
        end
        object edtRaizCNPJ: TDBEdit
          Left = 20
          Top = 94
          Width = 100
          Height = 21
          DataField = 'RAIZ_CNPJ'
          DataSource = datm_emp_est.dsClientesRaizCNPJ
          TabOrder = 0
          OnExit = btnRaizCNPJClienteClick
          OnKeyDown = edtRaizCNPJKeyDown
        end
        object edtCodOpeEstrangeiro: TDBEdit
          Left = 427
          Top = 94
          Width = 130
          Height = 21
          DataField = 'CD_OPE_ESTRANGEIRO'
          DataSource = datm_emp_est.dsClientesRaizCNPJ
          TabOrder = 1
        end
        object edtNomeClienteRaizCNPJ: TDBEdit
          Left = 125
          Top = 94
          Width = 270
          Height = 21
          Color = clMenu
          DataField = 'DESCRICAO'
          DataSource = datm_emp_est.dsClientesRaizCNPJ
          ReadOnly = True
          TabOrder = 3
        end
        object dbedtNR_VERSAO_OPE_ESTRANGEIRO: TDBEdit
          Left = 563
          Top = 94
          Width = 80
          Height = 21
          DataField = 'NR_VERSAO_OPE_ESTRANGEIRO'
          DataSource = datm_emp_est.dsClientesRaizCNPJ
          TabOrder = 4
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 4
      Width = 36
      Height = 39
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
      Left = 112
      Top = 4
      Width = 36
      Height = 39
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
      Left = 399
      Top = 4
      Width = 36
      Height = 39
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
      Top = 4
      Width = 36
      Height = 39
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
      Left = 76
      Top = 4
      Width = 36
      Height = 39
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
    object SpeedButton1: TSpeedButton
      Left = 176
      Top = 4
      Width = 36
      Height = 39
      Hint = 'Excluir'
      Caption = 'Imp'
      Flat = True
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = SpeedButton1Click
    end
    object dbnvg: TDBNavigator
      Left = 244
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_emp_est.ds_lista
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 445
      Top = 2
      Width = 303
      Height = 43
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 0
      TabStop = True
      object Label1: TLabel
        Left = 7
        Top = 3
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
        Left = 143
        Top = 3
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
        Left = 7
        Top = 16
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
        OnKeyDown = edt_chaveKeyDown
      end
      object cb_ordem: TComboBox
        Left = 144
        Top = 16
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = cb_ordemChange
        OnClick = cb_ordemClick
      end
    end
  end
  object pnlStatusBusca: TPanel
    Left = 387
    Top = 50
    Width = 349
    Height = 15
    BevelOuter = bvNone
    TabOrder = 2
    object Label20: TLabel
      Left = 11
      Top = 0
      Width = 338
      Height = 15
      Align = alRight
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o : Busca a palavra no campo nome inteiro e filtra.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object menu_cadastro: TMainMenu
    Left = 647
    Top = 417
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
