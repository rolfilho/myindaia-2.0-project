object frm_cliente_contato: Tfrm_cliente_contato
  Left = 148
  Top = 116
  Cursor = 7
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Contatos'
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
  object pgctrl_cliente_contato: TPageControl
    Left = 0
    Top = 49
    Width = 742
    Height = 455
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_cliente_contatoChange
    OnChanging = pgctrl_cliente_contatoChanging
    object ts_lista: TTabSheet
      Caption = '    Lista    '
      object lbl_Cliente: TLabel
        Left = 8
        Top = 4
        Width = 40
        Height = 13
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_unid_neg: TLabel
        Left = 8
        Top = 42
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
      object lbl_produto: TLabel
        Left = 8
        Top = 78
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
      object dbg_contatos: TDBGrid
        Left = 8
        Top = 122
        Width = 716
        Height = 294
        DataSource = datm_cliente_contato.ds_cliente_contato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_contatosDblClick
        OnKeyPress = dbg_contatosKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_CONTATO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 288
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_EMAIL'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 347
            Visible = True
          end>
      end
      object dbedt_razao_social: TDBEdit
        Left = 52
        Top = 20
        Width = 459
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCliente'
        DataSource = datm_cliente_contato.ds_cliente_contato
        ReadOnly = True
        TabOrder = 2
      end
      object dbedt_nm_unid_neg: TDBEdit
        Left = 53
        Top = 56
        Width = 459
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookUnidNeg'
        DataSource = datm_cliente_contato.ds_cliente_contato
        ReadOnly = True
        TabOrder = 4
      end
      object dbedt_nm_produto: TDBEdit
        Left = 53
        Top = 93
        Width = 459
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookProduto'
        DataSource = datm_cliente_contato.ds_cliente_contato
        ReadOnly = True
        TabOrder = 5
      end
      object dbedt_cd_produto: TDBEdit
        Left = 8
        Top = 93
        Width = 46
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_PRODUTO'
        DataSource = datm_cliente_contato.ds_cliente_contato
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_cd_unid_neg: TDBEdit
        Left = 8
        Top = 56
        Width = 46
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_UNID_NEG'
        DataSource = datm_cliente_contato.ds_cliente_contato
        ReadOnly = True
        TabOrder = 3
      end
      object dbedt_cd_cliente: TDBEdit
        Left = 8
        Top = 20
        Width = 45
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_CLIENTE'
        DataSource = datm_cliente_contato.ds_cliente_contato
        ReadOnly = True
        TabOrder = 1
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '   Dados B'#225'sicos   '
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 427
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_nome: TLabel
          Left = 63
          Top = 124
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
        object lbl_cargo: TLabel
          Left = 12
          Top = 162
          Width = 34
          Height = 13
          Caption = 'Cargo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_departamento: TLabel
          Left = 196
          Top = 162
          Width = 33
          Height = 13
          Caption = 'Dept'#186
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_fone: TLabel
          Left = 12
          Top = 202
          Width = 29
          Height = 13
          Caption = 'Fone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_fax: TLabel
          Left = 196
          Top = 202
          Width = 21
          Height = 13
          Caption = 'Fax'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cliente2: TLabel
          Left = 12
          Top = 11
          Width = 40
          Height = 13
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_unid_neg2: TLabel
          Left = 12
          Top = 49
          Width = 117
          Height = 13
          Caption = 'Unidade de Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_produto2: TLabel
          Left = 12
          Top = 85
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
        object lbl_cod: TLabel
          Left = 12
          Top = 124
          Width = 27
          Height = 13
          Caption = 'C'#243'd.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_area: TLabel
          Left = 12
          Top = 315
          Width = 27
          Height = 13
          Caption = #193'rea'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_area: TSpeedButton
          Left = 264
          Top = 328
          Width = 25
          Height = 21
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
          OnClick = btn_co_areaClick
        end
        object lbl_tp_follow_up: TLabel
          Left = 12
          Top = 352
          Width = 104
          Height = 13
          Caption = 'Tipo de Follow-Up'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_tp_follow_up: TSpeedButton
          Left = 264
          Top = 366
          Width = 25
          Height = 21
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
          OnClick = btn_co_tp_follow_upClick
        end
        object lbl_email: TLabel
          Left = 12
          Top = 238
          Width = 233
          Height = 13
          Caption = 'Endere'#231'o de correio eletr'#244'nico  ( e-mail )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 12
          Top = 276
          Width = 44
          Height = 13
          Caption = 'Usu'#225'rio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_cd_usuario: TSpeedButton
          Left = 330
          Top = 291
          Width = 25
          Height = 19
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
          OnClick = btn_cd_usuarioClick
        end
        object gbox_responsabilidades: TGroupBox
          Left = 393
          Top = 100
          Width = 188
          Height = 156
          Caption = 'Responsabilidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          object dbchkbox_contas_receber_pagar: TDBCheckBox
            Left = 12
            Top = 33
            Width = 169
            Height = 17
            Caption = 'Contas a Receber/Pagar'
            DataField = 'IN_CONTAS'
            DataSource = datm_cliente_contato.ds_cliente_contato
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_contatoChange
          end
          object dbchkbox_faturamento: TDBCheckBox
            Left = 12
            Top = 49
            Width = 97
            Height = 17
            Caption = 'Faturamento'
            DataField = 'IN_FATURAMENTO'
            DataSource = datm_cliente_contato.ds_cliente_contato
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_contatoChange
          end
          object dbchkbox_numerario: TDBCheckBox
            Left = 12
            Top = 66
            Width = 97
            Height = 17
            Caption = 'Numer'#225'rio'
            DataField = 'IN_NUMERARIO'
            DataSource = datm_cliente_contato.ds_cliente_contato
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_contatoChange
          end
          object dbchkbox_operacional: TDBCheckBox
            Left = 12
            Top = 82
            Width = 97
            Height = 17
            Caption = 'Operacional'
            DataField = 'IN_OPERACIONAL'
            DataSource = datm_cliente_contato.ds_cliente_contato
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_contatoChange
          end
          object dbchkbox_com_exterior: TDBCheckBox
            Left = 12
            Top = 17
            Width = 169
            Height = 17
            Caption = 'Com. Exterior'
            DataField = 'IN_COM_EXTERIOR'
            DataSource = datm_cliente_contato.ds_cliente_contato
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_contatoChange
          end
          object dbchkbox_drawback: TDBCheckBox
            Left = 12
            Top = 99
            Width = 97
            Height = 17
            Caption = 'Drawback'
            DataField = 'IN_DRAWBACK'
            DataSource = datm_cliente_contato.ds_cliente_contato
            TabOrder = 5
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_contatoChange
          end
          object dbchkbox_demurrage: TDBCheckBox
            Left = 12
            Top = 115
            Width = 97
            Height = 17
            Caption = 'Demurrage'
            DataField = 'IN_DEMURRAGE'
            DataSource = datm_cliente_contato.ds_cliente_contato
            TabOrder = 6
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_contatoChange
          end
          object dbchkbox_edi: TDBCheckBox
            Left = 12
            Top = 132
            Width = 97
            Height = 17
            Caption = 'EDI'
            DataField = 'IN_EDI'
            DataSource = datm_cliente_contato.ds_cliente_contato
            TabOrder = 7
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_contatoChange
          end
        end
        object dbedt_nm_contato: TDBEdit
          Left = 63
          Top = 139
          Width = 237
          Height = 21
          DataField = 'NM_CONTATO'
          DataSource = datm_cliente_contato.ds_cliente_contato
          TabOrder = 0
          OnChange = dbedt_nm_contatoChange
        end
        object dbedt_tx_cargo: TDBEdit
          Left = 12
          Top = 178
          Width = 161
          Height = 21
          DataField = 'TX_CARGO'
          DataSource = datm_cliente_contato.ds_cliente_contato
          TabOrder = 1
          OnChange = dbedt_nm_contatoChange
        end
        object dbedt_tx_departamento: TDBEdit
          Left = 196
          Top = 178
          Width = 161
          Height = 21
          DataField = 'TX_DEPARTAMENTO'
          DataSource = datm_cliente_contato.ds_cliente_contato
          TabOrder = 2
          OnChange = dbedt_nm_contatoChange
        end
        object dbedt_nr_fone: TDBEdit
          Left = 12
          Top = 215
          Width = 161
          Height = 21
          DataField = 'NR_FONE'
          DataSource = datm_cliente_contato.ds_cliente_contato
          TabOrder = 3
          OnChange = dbedt_nm_contatoChange
        end
        object dbedt_nr_fax: TDBEdit
          Left = 196
          Top = 215
          Width = 161
          Height = 21
          DataField = 'NR_FAX'
          DataSource = datm_cliente_contato.ds_cliente_contato
          TabOrder = 4
          OnChange = dbedt_nm_contatoChange
        end
        object dbedt_cd_cliente2: TDBEdit
          Left = 12
          Top = 27
          Width = 41
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_CLIENTE'
          DataSource = datm_cliente_contato.ds_cliente_contato
          ReadOnly = True
          TabOrder = 12
        end
        object dbedt_nm_cliente2: TDBEdit
          Left = 57
          Top = 27
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCliente'
          DataSource = datm_cliente_contato.ds_cliente_contato
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_cd_unid_neg2: TDBEdit
          Left = 12
          Top = 63
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_UNID_NEG'
          DataSource = datm_cliente_contato.ds_cliente_contato
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_nm_unid_neg2: TDBEdit
          Left = 57
          Top = 63
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidNeg'
          DataSource = datm_cliente_contato.ds_cliente_contato
          ReadOnly = True
          TabOrder = 15
        end
        object dbedt_cd_produto2: TDBEdit
          Left = 12
          Top = 100
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_PRODUTO'
          DataSource = datm_cliente_contato.ds_cliente_contato
          ReadOnly = True
          TabOrder = 16
        end
        object dbedt_nm_produto2: TDBEdit
          Left = 57
          Top = 100
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookProduto'
          DataSource = datm_cliente_contato.ds_cliente_contato
          ReadOnly = True
          TabOrder = 17
        end
        object dbedt_cd_contato: TDBEdit
          Left = 12
          Top = 139
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_CONTATO'
          DataSource = datm_cliente_contato.ds_cliente_contato
          MaxLength = 2
          ReadOnly = True
          TabOrder = 18
        end
        object dbedt_cd_area: TDBEdit
          Left = 12
          Top = 328
          Width = 32
          Height = 21
          DataField = 'CD_AREA'
          DataSource = datm_cliente_contato.ds_cliente_contato
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnChange = dbedt_nm_contatoChange
          OnExit = dbedt_cd_areaExit
          OnKeyDown = dbedt_cd_areaKeyDown
        end
        object dbedt_nm_area: TDBEdit
          Left = 46
          Top = 328
          Width = 215
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookArea'
          DataSource = datm_cliente_contato.ds_cliente_contato
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 19
        end
        object dbedt_tp_follow_up: TDBEdit
          Left = 12
          Top = 366
          Width = 32
          Height = 21
          DataField = 'TP_FOLLOWUP'
          DataSource = datm_cliente_contato.ds_cliente_contato
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnChange = dbedt_nm_contatoChange
          OnExit = dbedt_tp_follow_upExit
          OnKeyDown = dbedt_cd_areaKeyDown
        end
        object dbedt_nm_tp_follow_up: TDBEdit
          Left = 46
          Top = 366
          Width = 215
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookTpFollowUp'
          DataSource = datm_cliente_contato.ds_cliente_contato
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 20
        end
        object grpbox_forma: TGroupBox
          Left = 393
          Top = 263
          Width = 188
          Height = 129
          Caption = 'Forma de Transmiss'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          object dbchkbox_doc: TDBCheckBox
            Left = 12
            Top = 17
            Width = 169
            Height = 17
            Caption = 'DOC'
            DataField = 'IN_DOC'
            DataSource = datm_cliente_contato.ds_cliente_contato
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_contatoChange
          end
          object dbchkbox_xls: TDBCheckBox
            Left = 12
            Top = 43
            Width = 97
            Height = 17
            Caption = 'XLS'
            DataField = 'IN_XLS'
            DataSource = datm_cliente_contato.ds_cliente_contato
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_contatoChange
          end
          object dbchkbox_html: TDBCheckBox
            Left = 12
            Top = 70
            Width = 97
            Height = 17
            Caption = 'HTML'
            DataField = 'IN_HTML'
            DataSource = datm_cliente_contato.ds_cliente_contato
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_contatoChange
          end
          object dbchkbox_fax: TDBCheckBox
            Left = 12
            Top = 97
            Width = 97
            Height = 17
            Caption = 'FAX'
            DataField = 'IN_FAX'
            DataSource = datm_cliente_contato.ds_cliente_contato
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_contatoChange
          end
        end
        object dbedt_email: TDBEdit
          Left = 12
          Top = 253
          Width = 343
          Height = 21
          DataField = 'NM_EMAIL'
          DataSource = datm_cliente_contato.ds_cliente_contato
          TabOrder = 5
          OnChange = dbedt_nm_contatoChange
        end
        object dbedt_cd_usuario: TDBEdit
          Left = 12
          Top = 290
          Width = 32
          Height = 21
          DataField = 'CD_USUARIO'
          DataSource = datm_cliente_contato.ds_cliente_contato
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnChange = dbedt_nm_contatoChange
          OnExit = dbedt_cd_usuarioExit
        end
        object dbedt_nm_usuario: TDBEdit
          Left = 46
          Top = 290
          Width = 282
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookTpFollowUp'
          DataSource = datm_cliente_contato.ds_cliente_contato
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 49
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
      Left = 415
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
      ParentShowHint = False
      ShowHint = True
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancelarClick
    end
    object pnl_pesquisa: TPanel
      Left = 455
      Top = 2
      Width = 285
      Height = 45
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 0
      object lbl_pesquisa: TLabel
        Left = 3
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
        Left = 135
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
        Left = 3
        Top = 20
        Width = 129
        Height = 21
        TabStop = False
        TabOrder = 0
        OnChange = edt_chaveChange
        OnKeyDown = edt_chaveKeyDown
      end
      object cb_ordem: TComboBox
        Left = 134
        Top = 20
        Width = 147
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        TabStop = False
      end
    end
    object dbnvg: TDBNavigator
      Left = 291
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_cliente_contato.ds_cliente_contato
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object menu_cadastro: TMainMenu
    Left = 552
    Top = 104
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
