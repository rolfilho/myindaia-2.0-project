object frm_grupo: Tfrm_grupo
  Left = 419
  Top = 39
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Grupo de Clientes'
  ClientHeight = 629
  ClientWidth = 836
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_grupo: TPageControl
    Left = 0
    Top = 53
    Width = 836
    Height = 576
    ActivePage = ts_disparo_automatico
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_grupoChange
    OnChanging = pgctrl_grupoChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 828
        Height = 548
        Align = alClient
        DataSource = datm_grupo.ds_grupo_
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
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
            FieldName = 'CD_GRUPO'
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
            FieldName = 'NM_GRUPO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 499
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
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 828
        Height = 548
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label3: TLabel
          Left = 10
          Top = 10
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_grupo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 10
          Top = 51
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Descri'#231#227'o'
          FocusControl = dbedt_nm_grupo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblAtivo: TLabel
          Left = 356
          Top = 10
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
        object lbl_dt_inclusao: TLabel
          Left = 60
          Top = 10
          Width = 49
          Height = 13
          Caption = 'Inclus'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cnpj: TLabel
          Left = 218
          Top = 51
          Width = 48
          Height = 13
          Caption = 'C.N.P.J.'
          FocusControl = dbedt_cnpj_grupo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblRateio: TLabel
          Left = 218
          Top = 90
          Width = 93
          Height = 13
          Caption = 'Rateio de Desp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl1: TLabel
          Left = 10
          Top = 198
          Width = 105
          Height = 13
          Caption = 'Layout de Border'#244
          FocusControl = dbedt_cnpj_grupo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnCoBordero: TSpeedButton
          Left = 218
          Top = 213
          Width = 22
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
          OnClick = btnCoBorderoClick
        end
        object Label5: TLabel
          Left = 218
          Top = 128
          Width = 108
          Height = 13
          Caption = 'Relat. Consolidado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 10
          Top = 162
          Width = 194
          Height = 13
          Caption = 'Tipo de Referencia Padr'#227'o - Expo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 218
          Top = 163
          Width = 193
          Height = 13
          Caption = 'Tipo de Referencia Padr'#227'o - Impo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 441
          Top = 292
          Width = 138
          Height = 13
          Caption = 'Taxa de Lucro Estimado'
          FocusControl = dbedtLucroEstimado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_grupo: TDBEdit
          Left = 10
          Top = 26
          Width = 40
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_GRUPO'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnChange = dbedt_nm_grupoChange
        end
        object dbedt_nm_grupo: TDBEdit
          Left = 10
          Top = 65
          Width = 190
          Height = 21
          DataField = 'NM_GRUPO'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_nm_grupoChange
        end
        object dblkpcbox_ativo: TDBLookupComboBox
          Left = 356
          Top = 26
          Width = 50
          Height = 21
          DataField = 'IN_ATIVO'
          DataSource = datm_grupo.ds_grupo_
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_grupo.ds_yesno
          TabOrder = 3
          OnClick = dbedt_nm_grupoChange
        end
        object dbedt_dt_inclusao: TDBEdit
          Left = 59
          Top = 26
          Width = 104
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_INCLUSAO'
          DataSource = datm_grupo.ds_grupo_
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cnpj_grupo: TDBEdit
          Left = 218
          Top = 65
          Width = 172
          Height = 21
          DataField = 'CNPJ_GRUPO'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = dbedt_nm_grupoChange
          OnExit = dbedt_cnpj_grupoExit
        end
        object dblckRateio: TDBLookupComboBox
          Left = 218
          Top = 103
          Width = 50
          Height = 21
          DataField = 'IN_RATEIO'
          DataSource = datm_grupo.ds_grupo_
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_grupo.ds_yesno
          TabOrder = 5
          OnClick = dbedt_nm_grupoChange
        end
        object dbedtCdLayout: TDBEdit
          Left = 10
          Top = 213
          Width = 34
          Height = 21
          DataField = 'CD_LAYOUT_BORDERO'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 6
          OnChange = btnCoBorderoClick
          OnExit = dbedt_cnpj_grupoExit
        end
        object dbedtNmLayout: TDBEdit
          Left = 43
          Top = 213
          Width = 174
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_LAYOUT'
          DataSource = datm_grupo.ds_grupo_
          ReadOnly = True
          TabOrder = 13
        end
        object DBCheckBox1: TDBCheckBox
          Left = 10
          Top = 238
          Width = 387
          Height = 17
          Caption = 'Obrigar campo n'#250'mero da fatura ( Itens da DI ) para este Grupo'
          DataField = 'IN_OBRIGAR_INVOICE'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_grupoChange
        end
        object DBCheckBox2: TDBCheckBox
          Left = 10
          Top = 256
          Width = 347
          Height = 17
          Caption = 'Adicionar marinha mercante na Base de C'#225'lculo do ICMS'
          DataField = 'IN_MARINHA_MERCANTE_ICMS'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_grupoChange
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 10
          Top = 408
          Width = 403
          Height = 68
          Caption = 'Confer'#234'ncia de Pedidos'
          DataField = 'IN_CONFERE_REFERENCIA'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Permite itens de DI com o mesmo Pedido/Item/Parcial'
            'N'#227'o permite itens de DI com o mesmo Pedido/Item/Parcial')
          ParentFont = False
          TabOrder = 12
          Values.Strings = (
            '1'
            '0')
          OnClick = dbedt_nm_grupoChange
        end
        object DBCheckBox3: TDBCheckBox
          Left = 10
          Top = 274
          Width = 153
          Height = 17
          Caption = 'Exibir Pedido no Site'
          DataField = 'IN_EXIBE_PEDIDO_SITE'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_grupoChange
        end
        object dbedt_nr_rel_consolidado: TDBEdit
          Left = 218
          Top = 141
          Width = 50
          Height = 21
          DataField = 'NR_REL_FAT_CONSOLIDADO'
          DataSource = datm_grupo.ds_grupo_
          TabOrder = 14
        end
        object dblkpTpPedido: TDBLookupComboBox
          Left = 10
          Top = 176
          Width = 193
          Height = 21
          DataField = 'TP_PEDIDO_BUSCA'
          DataSource = datm_grupo.ds_grupo_
          KeyField = 'CD_REFERENCIA'
          ListField = 'NM_REFERENCIA'
          ListSource = datm_grupo.dsTpReferencia
          TabOrder = 15
          OnClick = dblkpTpPedidoClick
        end
        object GroupBox1: TGroupBox
          Left = 440
          Top = 10
          Width = 297
          Height = 257
          Caption = ' Par'#226'metros da Rap '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 17
          object dbedt_email_criacao: TDBEdit
            Left = 14
            Top = 42
            Width = 267
            Height = 21
            DataField = 'EMAIL_CRIACAO'
            DataSource = datm_grupo.ds_grupo_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = dbedt_nm_grupoChange
          end
          object dbedt_email_validacao: TDBEdit
            Left = 14
            Top = 90
            Width = 267
            Height = 21
            DataField = 'EMAIL_PRE_AUTORIZACAO'
            DataSource = datm_grupo.ds_grupo_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = dbedt_nm_grupoChange
          end
          object dbedt_email_autorizacao: TDBEdit
            Left = 14
            Top = 138
            Width = 267
            Height = 21
            DataField = 'EMAIL_AUTORIZACAO'
            DataSource = datm_grupo.ds_grupo_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnChange = dbedt_nm_grupoChange
          end
          object dbchk_email_criacao: TDBCheckBox
            Left = 16
            Top = 24
            Width = 105
            Height = 17
            Caption = 'E-mail Cria'#231#227'o'
            DataField = 'IN_EMAIL_CRIACAO'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchk_email_validacao: TDBCheckBox
            Left = 16
            Top = 72
            Width = 113
            Height = 17
            Caption = 'E-mail Valida'#231#227'o'
            DataField = 'IN_EMAIL_PRE_AUTORIZACAO'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchk_email_autorizacao: TDBCheckBox
            Left = 16
            Top = 120
            Width = 129
            Height = 17
            Caption = 'E-mail Autoriza'#231#227'o'
            DataField = 'IN_EMAIL_AUTORIZACAO'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchk_fornecimento: TDBCheckBox
            Left = 6
            Top = 162
            Width = 97
            Height = 17
            Caption = 'Fornecimento'
            DataField = 'IN_INTEGRA_FORNECIMENTO'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchk_packing: TDBCheckBox
            Left = 150
            Top = 162
            Width = 97
            Height = 17
            Caption = 'Packing List'
            DataField = 'IN_INTEGRA_PACKING_LIST'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchk_modo_simples: TDBCheckBox
            Left = 6
            Top = 180
            Width = 97
            Height = 17
            Caption = 'Modo Simples'
            DataField = 'IN_MODO_SIMPLES'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 8
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchk_rap_sequencial: TDBCheckBox
            Left = 150
            Top = 180
            Width = 121
            Height = 17
            Caption = 'Rap Sequencial'
            DataField = 'IN_RAP_SEQUENCIAL'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 9
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchk_envia_arquivos: TDBCheckBox
            Left = 6
            Top = 198
            Width = 119
            Height = 17
            Caption = 'Enviar Arquivos'
            DataField = 'IN_ENVIA_ARQUIVOS'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 10
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchk_mostra_followup: TDBCheckBox
            Left = 150
            Top = 198
            Width = 129
            Height = 17
            Caption = 'Mostrar Follow-Up'
            DataField = 'IN_MOSTRA_FOLLOWUP'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 11
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchk_exibir_faturados: TDBCheckBox
            Left = 7
            Top = 216
            Width = 129
            Height = 17
            Caption = 'Exibir Faturados'
            DataField = 'IN_MOSTRA_FATURADOS'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 12
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchk_divide_embarcados: TDBCheckBox
            Left = 150
            Top = 216
            Width = 139
            Height = 17
            Caption = 'Dividir Embarcados'
            DataField = 'IN_DIVIDE_EMBARCADOS'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 13
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchk_conferencia: TDBCheckBox
            Left = 7
            Top = 234
            Width = 161
            Height = 17
            Caption = 'Solicitar Confer'#234'ncia'
            DataField = 'IN_CONFERENCIA'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 14
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchk_envia_como_ti: TDBCheckBox
            Left = 151
            Top = 234
            Width = 130
            Height = 17
            Caption = 'Envia Como TI'
            DataField = 'IN_ENVIA_COMO_TI'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 15
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object dbchkE01: TDBCheckBox
          Left = 10
          Top = 293
          Width = 263
          Height = 17
          Caption = 'Alerta (E01) n'#227'o Gen'#233'rico (ou espec'#237'fico)'
          DataField = 'IN_ALERTA_E01_NAO_GENERICO'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchkE01Click
        end
        object DBCheckBox5: TDBCheckBox
          Left = 10
          Top = 311
          Width = 263
          Height = 17
          Hint = 
            'Preencher a data de realiza'#231#227'o do evento 387 com a data de reali' +
            'za'#231#227'o do evento 021 assim que ele for preenchido.'
          Caption = 'Preencher o evento 387 com o evento 021'
          DataField = 'IN_PREENCHE_EVENTO_387_COM_021'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_grupoChange
        end
        object DBRadioGroup2: TDBRadioGroup
          Left = 10
          Top = 91
          Width = 192
          Height = 69
          Caption = 'Tipo de Rateio'
          DataField = 'IN_RATEIA_PEDIDO'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Pedido/Item/Parcial'
            'Pedido')
          ParentFont = False
          TabOrder = 18
          Values.Strings = (
            '0'
            '1')
          OnClick = dbedt_nm_grupoChange
        end
        object DBCheckBox6: TDBCheckBox
          Left = 10
          Top = 330
          Width = 173
          Height = 17
          Hint = 
            'Preencher a data de realiza'#231#227'o do evento 387 com a data de reali' +
            'za'#231#227'o do evento 021 assim que ele for preenchido.'
          Caption = 'Desbloqueia Draft (Excel)'
          DataField = 'IN_DESBLOQUEIA_DRAFT'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 19
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_grupoChange
        end
        object dblkpTpPedidoImp: TDBLookupComboBox
          Left = 218
          Top = 177
          Width = 193
          Height = 21
          DataField = 'TP_PEDIDO_BUSCA_IMP'
          DataSource = datm_grupo.ds_grupo_
          KeyField = 'CD_REFERENCIA'
          ListField = 'NM_REFERENCIA'
          ListSource = datm_grupo.dsTpReferencia
          TabOrder = 16
          OnClick = dblkpTpPedidoClick
        end
        object dbedtLucroEstimado: TDBEdit
          Left = 443
          Top = 306
          Width = 94
          Height = 21
          DataField = 'TX_LUCRO_ESTIMADO'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          OnChange = dbedt_nm_grupoChange
          OnExit = dbedt_cnpj_grupoExit
        end
        object gbNovoFollowup: TGroupBox
          Left = 444
          Top = 408
          Width = 297
          Height = 68
          Caption = 'Novo Followup a partir de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 21
          object Label55: TLabel
            Left = 16
            Top = 21
            Width = 68
            Height = 13
            Caption = 'Importa'#231#227'o:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label56: TLabel
            Left = 16
            Top = 43
            Width = 69
            Height = 13
            Caption = 'Exporta'#231#227'o:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbdtNovoFollowupImp: TDBDateEdit
            Left = 90
            Top = 17
            Width = 121
            Height = 21
            DataField = 'DT_NOVO_FOLLOWUP_IMP'
            DataSource = datm_grupo.ds_grupo_
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 0
            OnChange = dbedt_nm_grupoChange
          end
          object dbdtNovoFollowupExp: TDBDateEdit
            Left = 90
            Top = 41
            Width = 121
            Height = 21
            DataField = 'DT_NOVO_FOLLOWUP_EXP'
            DataSource = datm_grupo.ds_grupo_
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 1
            OnChange = dbedt_nm_grupoChange
          end
        end
        object dbchkIN_PENDENCIAS: TDBCheckBox
          Left = 445
          Top = 333
          Width = 97
          Height = 17
          Caption = 'Pend'#234'ncias'
          DataField = 'IN_PENDENCIAS'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 22
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object GroupBox2: TGroupBox
          Left = 10
          Top = 478
          Width = 730
          Height = 55
          Caption = 'Contabilidade - Contas Reduzidas'
          TabOrder = 23
          object Label58: TLabel
            Left = 12
            Top = 14
            Width = 103
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contas a Receber'
            FocusControl = dbedt_nm_grupo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label59: TLabel
            Left = 248
            Top = 13
            Width = 145
            Height = 13
            Alignment = taRightJustify
            Caption = 'Despacho em Andamento'
            FocusControl = dbedt_nm_grupo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label60: TLabel
            Left = 484
            Top = 13
            Width = 113
            Height = 13
            Alignment = taRightJustify
            Caption = 'Despacho a Faturar'
            FocusControl = dbedt_nm_grupo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_cd_cc_contas_receber: TDBEdit
            Left = 16
            Top = 30
            Width = 209
            Height = 21
            DataField = 'CD_CC_CONTAS_RECEBER_REDUZIDA'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 0
            OnChange = dbedt_nm_grupoChange
          end
          object dbedt_cd_cc_despacho_andamento: TDBEdit
            Left = 247
            Top = 29
            Width = 209
            Height = 21
            DataField = 'ANDAMENTO_REDUZIDA'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 1
            OnChange = dbedt_nm_grupoChange
          end
          object dbedt_cd_cc_despacho_faturar: TDBEdit
            Left = 484
            Top = 28
            Width = 209
            Height = 21
            DataField = 'FATURAR_REDUZIDA'
            DataSource = datm_grupo.ds_grupo_
            TabOrder = 2
            OnChange = dbedt_nm_grupoChange
          end
        end
        object dbchkIN_EXTRATO_AVERBADO_RESUMIDO: TDBCheckBox
          Left = 441
          Top = 272
          Width = 217
          Height = 17
          Caption = 'Extrato Resumido de RE Averbado'
          DataField = 'IN_EXTRATO_AVERBADO_RESUMIDO'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 24
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkIN_EXIGE_CFOP_EXP: TDBCheckBox
          Left = 445
          Top = 368
          Width = 123
          Height = 17
          Caption = 'Exige CFOP - Exp'
          DataField = 'IN_EXIGE_CFOP_EXP'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 25
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkIN_PLANILHA_CUSTOS: TDBCheckBox
          Left = 445
          Top = 386
          Width = 127
          Height = 17
          Caption = 'Fundo Fixo'
          DataField = 'IN_PLANILHA_CUSTOS'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 26
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox8: TDBCheckBox
          Left = 445
          Top = 350
          Width = 292
          Height = 17
          Caption = 'Enviar e-mail ao Solicitar Ped'#234'ncia'
          DataField = 'IN_PENDENCIAS_EMAIL'
          DataSource = datm_grupo.ds_grupo_
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 27
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_grupoChange
        end
      end
    end
    object tbsGestao: TTabSheet
      Caption = 'Gest'#227'o'
      ImageIndex = 10
      object Label73: TLabel
        Left = 11
        Top = 13
        Width = 140
        Height = 13
        Caption = 'Coordenador Importa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnCoordImpo: TSpeedButton
        Left = 379
        Top = 25
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
        OnClick = btnCoordImpoClick
      end
      object Label74: TLabel
        Left = 11
        Top = 59
        Width = 141
        Height = 13
        Caption = 'Coordenador Exporta'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnCoordExpo: TSpeedButton
        Left = 379
        Top = 71
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
        OnClick = btnCoordExpoClick
      end
      object Label80: TLabel
        Left = 12
        Top = 105
        Width = 99
        Height = 13
        Caption = 'Gestor de Contas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnGestorContas: TSpeedButton
        Left = 380
        Top = 117
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
        OnClick = btnGestorContasClick
      end
      object lblVigenciaContrato: TLabel
        Left = 12
        Top = 174
        Width = 120
        Height = 13
        Caption = 'Vig'#234'ncia do Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblIndiceReajusteAcordado: TLabel
        Left = 155
        Top = 174
        Width = 202
        Height = 13
        Caption = 'Nome '#205'ndice de Reajuste Acordado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedtCoordImpo: TDBEdit
        Left = 11
        Top = 26
        Width = 48
        Height = 21
        DataField = 'CD_COORDENADOR_IMPO'
        DataSource = datm_grupo.ds_grupo_
        TabOrder = 0
        OnChange = btnCoordImpoClick
      end
      object edtCoordImpo: TEdit
        Left = 58
        Top = 26
        Width = 319
        Height = 21
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
      end
      object dbedtCoordExpo: TDBEdit
        Left = 11
        Top = 72
        Width = 48
        Height = 21
        DataField = 'CD_COORDENADOR_EXPO'
        DataSource = datm_grupo.ds_grupo_
        TabOrder = 2
        OnChange = btnCoordExpoClick
      end
      object edtCoordExpo: TEdit
        Left = 58
        Top = 72
        Width = 319
        Height = 21
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
      end
      object edtCdGestorContas: TDBEdit
        Left = 12
        Top = 118
        Width = 48
        Height = 21
        DataField = 'CD_GESTOR_CONTAS'
        DataSource = datm_grupo.ds_grupo_
        TabOrder = 4
        OnChange = btnGestorContasClick
      end
      object edtGestorContas: TEdit
        Left = 59
        Top = 118
        Width = 319
        Height = 21
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 5
      end
      object edtIndiceReajusteAcordado: TDBEdit
        Left = 155
        Top = 187
        Width = 220
        Height = 21
        DataField = 'NM_INDICE_REAJUSTE_ACORDADO'
        DataSource = datm_grupo.ds_grupo_
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnChange = dbedt_nm_grupoChange
      end
      object chkContrato: TDBCheckBox
        Left = 12
        Top = 153
        Width = 97
        Height = 17
        Caption = 'Tem contrato'
        DataField = 'IN_CONTRATO'
        DataSource = datm_grupo.ds_grupo_
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object edtVigenciaContrato: TDBDateEdit
        Left = 12
        Top = 187
        Width = 125
        Height = 21
        DataField = 'DT_VIGENCIA_CONTRATO'
        DataSource = datm_grupo.ds_grupo_
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 7
        OnChange = dbedt_nm_grupoChange
      end
      object GroupBox4: TGroupBox
        Left = 13
        Top = 224
        Width = 804
        Height = 313
        Caption = ' Reajuste de contrato '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        object btn_incluir_reajuste: TSpeedButton
          Left = 12
          Top = 22
          Width = 75
          Height = 24
          Caption = 'Incluir'
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
          OnClick = btn_incluir_reajusteClick
        end
        object btn_salvar_reajuste: TSpeedButton
          Left = 90
          Top = 22
          Width = 75
          Height = 24
          Caption = 'Salvar'
          Enabled = False
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
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
          OnClick = btn_salvar_reajusteClick
        end
        object btn_cancelar_reajuste: TSpeedButton
          Left = 168
          Top = 22
          Width = 75
          Height = 24
          Hint = 'Cancelar Visita'
          Caption = 'Cancelar'
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
          OnClick = btn_cancelar_reajusteClick
        end
        object btn_excluir_reajuste: TSpeedButton
          Left = 246
          Top = 22
          Width = 75
          Height = 24
          Hint = 'Excluir'
          Caption = 'Excluir'
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
          OnClick = btn_excluir_reajusteClick
        end
        object dbgrd1: TDBGrid
          Left = 11
          Top = 120
          Width = 772
          Height = 145
          DataSource = datm_grupo.dsGrupoReajusteContr
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'DT_PEDIDO_REAJUSTE'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_INDICE_REAJUSTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_REAJUSTE_NEGOCIADO'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_REAJUSTE_INDICE_APROVADO'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_REAJUSTE_INICIO_APLICACAO'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_VENC_PROXIMO_REAJUSTE'
              Width = 120
              Visible = True
            end>
        end
        object pnlGrupoReajusteContr: TPanel
          Left = 6
          Top = 55
          Width = 784
          Height = 57
          BevelOuter = bvNone
          TabOrder = 1
          object Label83: TLabel
            Left = 7
            Top = 10
            Width = 112
            Height = 13
            Caption = 'Pedido de Reajuste'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label81: TLabel
            Left = 265
            Top = 10
            Width = 116
            Height = 13
            Caption = 'Reajuste Negociado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label84: TLabel
            Left = 656
            Top = 10
            Width = 99
            Height = 13
            Caption = 'Pr'#243'ximo Reajuste'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label88: TLabel
            Left = 523
            Top = 10
            Width = 119
            Height = 13
            Caption = 'Aplica'#231#227'o a partir de'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label89: TLabel
            Left = 394
            Top = 10
            Width = 118
            Height = 13
            Caption = #205'ndice Negociado(%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label90: TLabel
            Left = 135
            Top = 10
            Width = 53
            Height = 13
            Caption = #205'ndice(%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbePedidoReajuste: TDBDateEdit
            Left = 7
            Top = 25
            Width = 120
            Height = 21
            DataField = 'DT_PEDIDO_REAJUSTE'
            DataSource = datm_grupo.dsGrupoReajusteContr
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 0
            OnChange = dbePedidoReajusteChange
          end
          object edtReajusteNegociado: TDBDateEdit
            Left = 265
            Top = 25
            Width = 120
            Height = 21
            DataField = 'DT_REAJUSTE_NEGOCIADO'
            DataSource = datm_grupo.dsGrupoReajusteContr
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 2
            OnChange = dbePedidoReajusteChange
          end
          object edtReajusteInicioAplicacao: TDBDateEdit
            Left = 523
            Top = 25
            Width = 125
            Height = 21
            DataField = 'DT_REAJUSTE_INICIO_APLICACAO'
            DataSource = datm_grupo.dsGrupoReajusteContr
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 4
            OnChange = dbePedidoReajusteChange
          end
          object EdtProximoReajuste: TDBDateEdit
            Left = 656
            Top = 25
            Width = 120
            Height = 21
            DataField = 'DT_VENC_PROXIMO_REAJUSTE'
            DataSource = datm_grupo.dsGrupoReajusteContr
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 5
            OnChange = dbePedidoReajusteChange
          end
          object edtIndiceNegociado: TDBEdit
            Left = 394
            Top = 25
            Width = 120
            Height = 21
            DataField = 'VL_REAJUSTE_INDICE_APROVADO'
            DataSource = datm_grupo.dsGrupoReajusteContr
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnChange = dbePedidoReajusteChange
          end
          object DBEdit4: TDBEdit
            Left = 135
            Top = 25
            Width = 120
            Height = 21
            DataField = 'VL_INDICE_REAJUSTE'
            DataSource = datm_grupo.dsGrupoReajusteContr
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = dbePedidoReajusteChange
          end
        end
      end
    end
    object ts_Conta_Bancaria: TTabSheet
      Caption = 'Conta Banc'#225'ria'
      ImageIndex = 3
      object lbl_banco: TLabel
        Left = 12
        Top = 371
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape1: TShape
        Left = 0
        Top = 285
        Width = 828
        Height = 270
        Align = alBottom
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label9: TLabel
        Left = 12
        Top = 330
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'd'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 12
        Top = 370
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'd'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 53
        Top = 330
        Width = 272
        Height = 13
        Caption = 'Banco de Pagamento das Despesas pela Indaia'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 53
        Top = 370
        Width = 276
        Height = 13
        Caption = 'Banco de Pagamento das Despesas pelo Cliente'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 12
        Top = 251
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'd'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 12
        Top = 212
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'd'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 53
        Top = 212
        Width = 151
        Height = 13
        Caption = 'Banco Baixa de Numer'#225'rio'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 53
        Top = 251
        Width = 174
        Height = 13
        Caption = 'Banco de Pagamento do ICMS'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 53
        Top = 291
        Width = 310
        Height = 13
        Caption = 'Banco de Pagamento de Outros Impostos (Itens de DI)'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 12
        Top = 291
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'd'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 12
        Top = 164
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'd'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 236
        Top = 163
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'd'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 54
        Top = 163
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cliente'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 277
        Top = 163
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Servico'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_banco1: TLabel
        Left = 386
        Top = 229
        Width = 119
        Height = 13
        Caption = 'Banco do xxxxxxxxxx'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_banco2: TLabel
        Left = 386
        Top = 269
        Width = 119
        Height = 13
        Caption = 'Banco do xxxxxxxxxx'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_banco4: TLabel
        Left = 386
        Top = 349
        Width = 119
        Height = 13
        Caption = 'Banco do xxxxxxxxxx'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_banco3: TLabel
        Left = 386
        Top = 309
        Width = 119
        Height = 13
        Caption = 'Banco do xxxxxxxxxx'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_banco5: TLabel
        Left = 386
        Top = 389
        Width = 119
        Height = 13
        Caption = 'Banco do xxxxxxxxxx'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label30: TLabel
        Left = 459
        Top = 163
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'ICMS At'#233
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_Banco6: TLabel
        Left = 386
        Top = 437
        Width = 119
        Height = 13
        Caption = 'Banco do xxxxxxxxxx'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label69: TLabel
        Left = 53
        Top = 418
        Width = 170
        Height = 13
        Caption = 'Banco de Pagamento AFRMM'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label70: TLabel
        Left = 12
        Top = 418
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'd'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object db_contas_bancarias: TDBGrid
        Left = 0
        Top = 0
        Width = 828
        Height = 153
        Align = alTop
        DataSource = datm_grupo.ds_grupo_banco
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = db_contas_bancariasCellClick
        OnColEnter = db_contas_bancariasColEnter
        OnDblClick = db_contas_bancariasDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_CLIENTE'
            Title.Caption = 'Cliente'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_UNID_NEG'
            Title.Caption = 'Unidade'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_PRODUTO'
            Title.Caption = 'Produto'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_SERVICO'
            Title.Caption = 'Servi'#231'o'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_BANCO_ADIANTAMENTO'
            Title.Caption = 'Adiantamento'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_BANCO_ICMS'
            Title.Caption = 'ICMS'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_BANCO_PAGTO_IMPOSTOS'
            Title.Caption = 'Impostos'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_BANCTO_PAGTO_DESPESAS_INDAI'
            Title.Caption = 'Despesas Indaia'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_BANCTO_PAGTO_DESPESAS_CLIEN'
            Title.Caption = 'Despesas Cliente'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_AREA'
            Title.Caption = #193'rea'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ICMS_ATE'
            Title.Caption = 'ICMS At'#233
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_BANCO_IMP_CLIENTE'
            Title.Caption = 'Banco Impostos Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_BANCO_IMP_INDAIA'
            Title.Caption = 'Banco Impostos Indai'#225
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_BANCO_PGMTO_AFRMM'
            Title.Caption = 'Banco Pagamento AFRMM'
            Width = 64
            Visible = True
          end>
      end
      object db_cliente: TDBEdit
        Left = 54
        Top = 178
        Width = 169
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object db_cd_cliente: TDBEdit
        Left = 12
        Top = 178
        Width = 41
        Height = 21
        Color = clMenu
        DataField = 'CD_CLIENTE'
        DataSource = datm_grupo.ds_grupo_banco
        ReadOnly = True
        TabOrder = 1
        OnChange = db_cd_clienteChange
      end
      object db_cd_servico: TDBEdit
        Left = 234
        Top = 178
        Width = 41
        Height = 21
        Color = clMenu
        DataField = 'CD_SERVICO'
        DataSource = datm_grupo.ds_grupo_banco
        ReadOnly = True
        TabOrder = 3
        OnChange = db_cd_servicoChange
      end
      object db_servico: TDBEdit
        Left = 276
        Top = 178
        Width = 149
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 4
      end
      object db_cd_banco_adiantamento: TDBEdit
        Left = 12
        Top = 226
        Width = 41
        Height = 21
        Color = clMenu
        DataField = 'CD_BANCO_ADIANTAMENTO'
        DataSource = datm_grupo.ds_grupo_banco
        ReadOnly = True
        TabOrder = 6
        OnChange = db_cd_banco_adiantamentoChange
      end
      object db_banco_adiantamento: TDBEdit
        Left = 54
        Top = 226
        Width = 326
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 7
      end
      object db_cd_banco_icms: TDBEdit
        Left = 12
        Top = 265
        Width = 41
        Height = 21
        Color = clMenu
        DataField = 'CD_BANCO_ICMS'
        DataSource = datm_grupo.ds_grupo_banco
        ReadOnly = True
        TabOrder = 8
        OnChange = db_cd_banco_icmsChange
      end
      object db_banco_icms: TDBEdit
        Left = 54
        Top = 265
        Width = 326
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 9
      end
      object db_banco_impostos: TDBEdit
        Left = 54
        Top = 305
        Width = 326
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 10
      end
      object db_cd_banco_impostos: TDBEdit
        Left = 12
        Top = 305
        Width = 41
        Height = 21
        Color = clMenu
        DataField = 'CD_BANCO_PAGTO_IMPOSTOS'
        DataSource = datm_grupo.ds_grupo_banco
        ReadOnly = True
        TabOrder = 11
        OnChange = db_cd_banco_impostosChange
      end
      object db_cd_banco_despesa_indaia: TDBEdit
        Left = 12
        Top = 344
        Width = 41
        Height = 21
        Color = clMenu
        DataField = 'CD_BANCTO_PAGTO_DESPESAS_INDAI'
        DataSource = datm_grupo.ds_grupo_banco
        ReadOnly = True
        TabOrder = 12
        OnChange = db_cd_banco_despesa_indaiaChange
      end
      object db_banco_despesa_indaia: TDBEdit
        Left = 54
        Top = 344
        Width = 326
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 13
      end
      object db_cd_banco_despesa_cliente: TDBEdit
        Left = 12
        Top = 384
        Width = 41
        Height = 21
        Color = clMenu
        DataField = 'CD_BANCTO_PAGTO_DESPESAS_CLIEN'
        DataSource = datm_grupo.ds_grupo_banco
        ReadOnly = True
        TabOrder = 14
        OnChange = db_cd_banco_despesa_clienteChange
      end
      object db_banco_despesa_cliente: TDBEdit
        Left = 54
        Top = 384
        Width = 326
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 15
      end
      object dbedtICMS_ATE: TDBEdit
        Left = 456
        Top = 176
        Width = 105
        Height = 21
        DataField = 'ICMS_ATE'
        DataSource = datm_grupo.ds_grupo_banco
        TabOrder = 5
      end
      object db_DESC_BANCO_PGMTO_AFRMM: TDBEdit
        Left = 54
        Top = 432
        Width = 326
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 16
      end
      object db_CD_BANCO_PGMTO_AFRMM: TDBEdit
        Left = 12
        Top = 432
        Width = 41
        Height = 21
        Color = clMenu
        DataField = 'CD_BANCO_PGMTO_AFRMM'
        DataSource = datm_grupo.ds_grupo_banco
        ReadOnly = True
        TabOrder = 17
        OnChange = db_CD_BANCO_PGMTO_AFRMMChange
      end
    end
    object ts_disparo_automatico: TTabSheet
      Caption = 'Disparo Autom'#225'tico Email'
      ImageIndex = 4
      object pnl_disparo: TPanel
        Left = 0
        Top = 0
        Width = 828
        Height = 548
        Align = alClient
        TabOrder = 0
        object pgctrl_documento: TPageControl
          Left = 1
          Top = 1
          Width = 826
          Height = 546
          ActivePage = ts_dados_disparo
          Align = alClient
          TabOrder = 0
          OnChange = pgctrl_documentoChange
          object ts_lista_disparo: TTabSheet
            Caption = 'Lista'
            object DBGrid1: TDBGrid
              Left = 0
              Top = 35
              Width = 818
              Height = 417
              Align = alClient
              DataSource = datm_grupo.ds_relatorios_mail_aut
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGrid1DblClick
              OnTitleClick = DBGrid1TitleClick
              Columns = <
                item
                  Color = 15466470
                  Expanded = False
                  FieldName = 'CD_RELATORIO'
                  Title.Caption = 'C'#243'digo'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 51
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO'
                  Title.Caption = 'Nome'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 526
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'EVENTO'
                  Title.Alignment = taCenter
                  Title.Caption = 'Evento'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 47
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'calc_ATIVO'
                  Font.Charset = SYMBOL_CHARSET
                  Font.Color = clTeal
                  Font.Height = -19
                  Font.Name = 'Wingdings'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'Ativo'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 54
                  Visible = True
                end>
            end
            object pnl_filtro_disparo: TPanel
              Left = 0
              Top = 0
              Width = 818
              Height = 35
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvLowered
              TabOrder = 1
              object Label27: TLabel
                Left = 16
                Top = 11
                Width = 145
                Height = 13
                Caption = 'Exibir somente o produto:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object SpeedButton1: TSpeedButton
                Left = 561
                Top = 8
                Width = 22
                Height = 19
                Enabled = False
                Flat = True
                Glyph.Data = {
                  36060000424D3606000000000000360400002800000020000000100000000100
                  08000000000000020000C40E0000C40E000000010000000000005A6B7300AD7B
                  73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
                  8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
                  9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
                  A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
                  AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
                  BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
                  D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
                  E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
                  F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
                  42424242424242424242420010424242424242424242424242422B39180B4242
                  424242424242424242420500001342424242424242424242424243443C180B42
                  424242424242424242420510050013424242424242424242424242444438180B
                  4242424242424242424242101000001342424242424242424242424244433918
                  0A42424242424242424242421005000010424242424242424242424242444335
                  004201101A11424242424242421005000042052222224242424242424242453D
                  05072F343434291942424242424210280505313E3E3E28224242424242424222
                  1A2D34343437403E044242424242422222313E3E3E3E3E3E0542424242424206
                  231C30343740414628424242424242102828313E3E3E4146274242424242421B
                  210F30373A414140310D4242424242222827313E3E41413E311342424242421F
                  20032434373A3A3732134242424242272822283E3E3E3E3E312242424242421D
                  25030F2D3737373731104242424242272C2227313E3E3E3E312242424242420D
                  2D2D1C162430333429424242424242133131282728313E3E2842424242424242
                  1E463F0F0316252E084242424242424227463E2722272C310542424242424242
                  4227312D21252314424242424242424242273131282C28224242424242424242
                  42420E141B1B4242424242424242424242422222222242424242}
                NumGlyphs = 2
              end
              object dblkpProduto: TRxDBLookupCombo
                Left = 168
                Top = 7
                Width = 217
                Height = 21
                DropDownCount = 8
                DisplayEmpty = 'TODOS'
                EmptyValue = 'TODOS'
                ListStyle = lsDelimited
                LookupField = 'CD_PRODUTO'
                LookupDisplay = 'NM_PRODUTO'
                LookupSource = datm_grupo.dsProduto
                TabOrder = 0
                OnChange = dblkpProdutoChange
              end
              object chk_ativo_disparo: TCheckBox
                Left = 395
                Top = 10
                Width = 120
                Height = 17
                Caption = 'Somente Ativos'
                Checked = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                State = cbChecked
                TabOrder = 1
                OnClick = chk_ativo_disparoClick
              end
              object edt_chave_disparo: TEdit
                Left = 583
                Top = 7
                Width = 129
                Height = 21
                TabOrder = 2
                OnChange = edt_chave_disparoChange
              end
            end
            object pnl_aviso_generico: TPanel
              Left = 0
              Top = 452
              Width = 818
              Height = 66
              Align = alBottom
              BorderStyle = bsSingle
              Ctl3D = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
              Visible = False
              DesignSize = (
                816
                64)
              object Shape2: TShape
                Left = 1
                Top = 1
                Width = 814
                Height = 62
                Align = alClient
                Pen.Color = clRed
                Pen.Width = 2
              end
              object Memo1: TMemo
                Left = 4
                Top = 8
                Width = 808
                Height = 50
                Alignment = taCenter
                Anchors = [akLeft, akTop, akRight, akBottom]
                BorderStyle = bsNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Lines.Strings = (
                  
                    'ATEN'#199#195'O!!! ESTE CLIENTE '#201' UM CLIENTE N'#195'O CORPORATIVO, PORTANTO, ' +
                    'PARA O'
                  
                    'SISTEMA, OS ALERTAS S'#195'O GEN'#201'RICOS. QUALQUER ALTERA'#199#195'O NESSES ALE' +
                    'RTAS'
                  'SERVIR'#193' PARA TODOS OS CLIENTES N'#195'O CORPORATIVOS (GEN'#201'RICOS)')
                ParentFont = False
                TabOrder = 0
              end
            end
          end
          object ts_dados_disparo: TTabSheet
            Caption = 'Dados'
            ImageIndex = 1
            object PageControl1: TPageControl
              Left = 0
              Top = 0
              Width = 818
              Height = 518
              ActivePage = tbsDetalhes
              Align = alClient
              TabOrder = 0
              object tbsDadosEmail: TTabSheet
                Caption = 'Email'
                object Panel6: TPanel
                  Left = 0
                  Top = 0
                  Width = 810
                  Height = 417
                  Align = alTop
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  TabOrder = 0
                  object lblE01: TLabel
                    Left = 216
                    Top = 7
                    Width = 291
                    Height = 19
                    Alignment = taCenter
                    AutoSize = False
                    Caption = 'ESPEC'#205'FICO DO GRUPO'
                    Color = 12568780
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -12
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    Transparent = False
                    Layout = tlCenter
                  end
                  object Label28: TLabel
                    Left = 671
                    Top = 7
                    Width = 37
                    Height = 13
                    Caption = 'Status'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = True
                  end
                  object Shape3: TShape
                    Left = 662
                    Top = 21
                    Width = 58
                    Height = 26
                    Brush.Style = bsClear
                    Pen.Color = clGray
                  end
                  object Shape4: TShape
                    Left = 662
                    Top = 5
                    Width = 58
                    Height = 17
                    Brush.Style = bsClear
                    Pen.Color = clGray
                  end
                  object Label26: TLabel
                    Left = 12
                    Top = 47
                    Width = 47
                    Height = 13
                    AutoSize = False
                    Caption = 'C'#243'digo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label25: TLabel
                    Left = 68
                    Top = 46
                    Width = 211
                    Height = 13
                    AutoSize = False
                    Caption = 'Descri'#231#227'o'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label24: TLabel
                    Left = 12
                    Top = 218
                    Width = 211
                    Height = 13
                    AutoSize = False
                    Caption = 'Corpo do Email - Modelo ( .doc )  '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label23: TLabel
                    Left = 12
                    Top = 127
                    Width = 185
                    Height = 13
                    AutoSize = False
                    Caption = 'Assunto do Email'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label71: TLabel
                    Left = 12
                    Top = 273
                    Width = 151
                    Height = 13
                    Caption = 'Anexar Documento - Tipos'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object SpeedButton11: TSpeedButton
                    Left = 317
                    Top = 286
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
                    OnClick = SpeedButton11Click
                  end
                  object Label87: TLabel
                    Left = 392
                    Top = 273
                    Width = 38
                    Height = 13
                    Caption = 'Idioma'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object SpeedButton61: TSpeedButton
                    Left = 697
                    Top = 286
                    Width = 25
                    Height = 23
                    Flat = True
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
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
                    OnClick = SpeedButton61Click
                  end
                  object DBCheckBox7: TDBCheckBox
                    Left = 668
                    Top = 26
                    Width = 45
                    Height = 17
                    TabStop = False
                    Caption = 'Ativo'
                    Ctl3D = True
                    DataField = 'IN_ATIVO'
                    DataSource = datm_grupo.ds_relatorios_mail_aut
                    ParentCtl3D = False
                    TabOrder = 6
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                  end
                  object DBEdit1: TDBEdit
                    Left = 12
                    Top = 60
                    Width = 49
                    Height = 21
                    DataField = 'CD_RELATORIO'
                    DataSource = datm_grupo.ds_relatorios_mail_aut
                    TabOrder = 0
                    OnKeyDown = edicao
                  end
                  object file_path: TFilenameEdit
                    Left = 12
                    Top = 231
                    Width = 709
                    Height = 21
                    OnButtonClick = file_pathButtonClick
                    Filter = 'Documento do Microsoft Word|*.doc'
                    InitialDir = 'H:\DDBroker\DocumentosWORD'
                    CharCase = ecUpperCase
                    NumGlyphs = 1
                    TabOrder = 2
                    OnKeyDown = edicao
                  end
                  object GroupBox3: TGroupBox
                    Left = 8
                    Top = 337
                    Width = 785
                    Height = 58
                    Caption = 'Enviar e-mail ao:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 5
                    object chkAtendente: TCheckBox
                      Left = 7
                      Top = 27
                      Width = 79
                      Height = 17
                      Caption = 'Atendente'
                      TabOrder = 0
                      OnEnter = habilita_botoes
                    end
                    object chkTransportador: TCheckBox
                      Left = 89
                      Top = 27
                      Width = 91
                      Height = 17
                      Caption = 'Transportador'
                      TabOrder = 1
                      OnEnter = habilita_botoes
                    end
                    object chkContato: TCheckBox
                      Left = 188
                      Top = 27
                      Width = 64
                      Height = 17
                      Caption = 'Contato'
                      TabOrder = 2
                      OnEnter = habilita_botoes
                    end
                    object chkEmailExtraProcesso: TCheckBox
                      Left = 258
                      Top = 27
                      Width = 128
                      Height = 17
                      Caption = 'Email Extra (Processo)'
                      TabOrder = 3
                      OnEnter = habilita_botoes
                    end
                    object chkArmazemDescarga: TCheckBox
                      Left = 396
                      Top = 27
                      Width = 132
                      Height = 17
                      Caption = 'Armaz'#233'm de Descarga'
                      TabOrder = 4
                      OnEnter = habilita_botoes
                    end
                    object chkAgenteDeCarga: TCheckBox
                      Left = 536
                      Top = 27
                      Width = 109
                      Height = 17
                      Caption = 'Agente de Carga'
                      TabOrder = 5
                      OnEnter = habilita_botoes
                    end
                    object chkArmazemEstocagem: TCheckBox
                      Left = 650
                      Top = 27
                      Width = 123
                      Height = 17
                      Caption = 'Armaz'#233'm Estocagem'
                      TabOrder = 6
                      OnEnter = habilita_botoes
                    end
                  end
                  object edtTPDocto: TEdit
                    Left = 12
                    Top = 286
                    Width = 300
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 3
                    ReadOnly = True
                    TabOrder = 3
                    OnKeyDown = edicao
                  end
                  object btnAddVariavel: TBitBtn
                    Left = 698
                    Top = 143
                    Width = 22
                    Height = 23
                    TabOrder = 7
                    OnClick = btnAddVariavelClick
                    Glyph.Data = {
                      DE010000424DDE01000000000000760000002800000024000000120000000100
                      0400000000006801000000000000000000001000000010000000000000000000
                      80000080000000808000800000008000800080800000C0C0C000808080000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
                      6666666666666666666666660000666666666666666666666666666666666666
                      0000666666666666666666666666666666666666000066666666FFF666666666
                      666666FFF666666600006666666822F66666666666666877F666666600006666
                      666822F66666666666666877F666666600006666666822F66666666666666877
                      F666666600006666FFF622FFFFF6666666FFF777FFFFF6660000666822222222
                      22F66666687777777777F666000066682222222222F66666687777777777F666
                      000066688888226888666666688888777888666600006666666822F666666666
                      66666877F666666600006666666822F66666666666666877F666666600006666
                      666822F66666666666666877F666666600006666666888666666666666666888
                      6666666600006666666666666666666666666666666666660000666666666666
                      6666666666666666666666660000666666666666666666666666666666666666
                      0000}
                    NumGlyphs = 2
                  end
                  object dbedtIdioma: TDBEdit
                    Left = 392
                    Top = 286
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'TP_IDIOMA'
                    DataSource = datm_grupo.ds_relatorios_mail_aut
                    TabOrder = 4
                    OnChange = SpeedButton61Click
                    OnKeyDown = edicao
                  end
                  object Edit124: TEdit
                    Left = 449
                    Top = 286
                    Width = 247
                    Height = 21
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                    TabOrder = 8
                  end
                  object dbmNM_RELATORIO: TDBMemo
                    Left = 12
                    Top = 143
                    Width = 682
                    Height = 60
                    DataField = 'NM_RELATORIO'
                    DataSource = datm_grupo.ds_relatorios_mail_aut
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 500
                    ParentFont = False
                    TabOrder = 1
                    OnKeyDown = edicao
                  end
                  object dbMMTX_RELATORIO: TDBMemo
                    Left = 68
                    Top = 59
                    Width = 625
                    Height = 40
                    DataField = 'TX_RELATORIO'
                    DataSource = datm_grupo.ds_relatorios_mail_aut
                    TabOrder = 9
                    OnKeyDown = edicao
                  end
                end
              end
              object tbsDetalhes: TTabSheet
                Caption = 'Par'#226'metros'
                ImageIndex = 1
                object pnl_config_disparo: TPanel
                  Left = 0
                  Top = 0
                  Width = 810
                  Height = 417
                  Align = alTop
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  TabOrder = 0
                  object lbl17: TLabel
                    Left = 11
                    Top = 86
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
                  object btn14: TSpeedButton
                    Left = 316
                    Top = 99
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
                    OnClick = btn14Click
                  end
                  object lbl19: TLabel
                    Left = 11
                    Top = 119
                    Width = 71
                    Height = 13
                    Caption = #193'rea (grupo)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object btn16: TSpeedButton
                    Left = 316
                    Top = 132
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
                  end
                  object lbl20: TLabel
                    Left = 389
                    Top = 119
                    Width = 52
                    Height = 13
                    Caption = 'Sub-area'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object btn17: TSpeedButton
                    Left = 693
                    Top = 132
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
                    OnClick = btn17Click
                  end
                  object lbl21: TLabel
                    Left = 11
                    Top = 154
                    Width = 110
                    Height = 13
                    Caption = 'Analista Comiss'#225'ria'
                    Enabled = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object btn18: TSpeedButton
                    Left = 316
                    Top = 164
                    Width = 25
                    Height = 23
                    Enabled = False
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
                  end
                  object lbl22: TLabel
                    Left = 389
                    Top = 154
                    Width = 89
                    Height = 13
                    Caption = 'Analista Cliente'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object btn19: TSpeedButton
                    Left = 693
                    Top = 167
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
                    OnClick = btn19Click
                  end
                  object lbl16: TLabel
                    Left = 11
                    Top = 51
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
                  object btn20: TSpeedButton
                    Left = 316
                    Top = 64
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
                    OnClick = btn20Click
                  end
                  object Label86: TLabel
                    Left = 389
                    Top = 15
                    Width = 35
                    Height = 13
                    Caption = 'Modal'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object SpeedButton60: TSpeedButton
                    Left = 693
                    Top = 28
                    Width = 25
                    Height = 23
                    Flat = True
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
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
                    OnClick = SpeedButton60Click
                  end
                  object Label93: TLabel
                    Left = 389
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
                  object SpeedButton67: TSpeedButton
                    Left = 693
                    Top = 64
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
                    OnClick = SpeedButton67Click
                  end
                  object Label85: TLabel
                    Left = 11
                    Top = 15
                    Width = 199
                    Height = 13
                    Caption = 'Evento para Controle no Follow-Up'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object SpeedButton59: TSpeedButton
                    Left = 316
                    Top = 28
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
                    OnClick = SpeedButton59Click
                  end
                  object spd_urf_despacho: TSpeedButton
                    Left = 316
                    Top = 203
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
                    OnClick = spd_urf_despachoClick
                  end
                  object lbl_urf_despacho: TLabel
                    Left = 11
                    Top = 190
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
                  object lblE01_ExportadorImportador: TLabel
                    Left = 389
                    Top = 85
                    Width = 136
                    Height = 13
                    Caption = 'Exportador / Importador'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object btnE01_ExportadorImportador: TSpeedButton
                    Left = 693
                    Top = 99
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
                    OnClick = btnE01_ExportadorImportadorClick
                  end
                  object Label72: TLabel
                    Left = 389
                    Top = 189
                    Width = 148
                    Height = 13
                    Caption = 'Representante (Processo)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object btnRepresentante: TSpeedButton
                    Left = 693
                    Top = 203
                    Width = 23
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
                    OnClick = btnRepresentanteClick
                  end
                  object lblSql: TLabel
                    Left = 12
                    Top = 331
                    Width = 28
                    Height = 13
                    AutoSize = False
                    Caption = 'SQL:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label75: TLabel
                    Left = 11
                    Top = 225
                    Width = 44
                    Height = 13
                    Caption = 'Servi'#231'o'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object btnServico: TSpeedButton
                    Left = 316
                    Top = 238
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
                    OnClick = btnServicoClick
                  end
                  object Label76: TLabel
                    Left = 11
                    Top = 260
                    Width = 96
                    Height = 13
                    Caption = 'Agente de Carga'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object btnAgenteCarga: TSpeedButton
                    Left = 316
                    Top = 273
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
                    OnClick = btnAgenteCargaClick
                  end
                  object Label77: TLabel
                    Left = 389
                    Top = 225
                    Width = 125
                    Height = 13
                    Caption = 'Armaz'#233'm de descarga'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object btnArmazemDescarga: TSpeedButton
                    Left = 693
                    Top = 238
                    Width = 23
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
                    OnClick = btnArmazemDescargaClick
                  end
                  object Label78: TLabel
                    Left = 389
                    Top = 260
                    Width = 129
                    Height = 13
                    Caption = 'Local de desembarque'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object btnLocalDesembarque: TSpeedButton
                    Left = 694
                    Top = 273
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
                    OnClick = btnLocalDesembarqueClick
                  end
                  object Label91: TLabel
                    Left = 389
                    Top = 297
                    Width = 134
                    Height = 13
                    Caption = 'Armazem de estocagem'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object btnArmazemEstocagem: TSpeedButton
                    Left = 694
                    Top = 310
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
                    OnClick = btnArmazemEstocagemClick
                  end
                  object ed28: TEdit
                    Left = 68
                    Top = 99
                    Width = 247
                    Height = 21
                    TabStop = False
                    ParentColor = True
                    ParentShowHint = False
                    ReadOnly = True
                    ShowHint = False
                    TabOrder = 9
                  end
                  object ed29: TEdit
                    Left = 11
                    Top = 99
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 5
                    TabOrder = 8
                    OnChange = btn14Click
                    OnKeyDown = edicao
                  end
                  object ed32: TEdit
                    Left = 68
                    Top = 132
                    Width = 247
                    Height = 21
                    TabStop = False
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 13
                  end
                  object ed33: TEdit
                    Left = 11
                    Top = 132
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 2
                    TabOrder = 12
                    OnKeyDown = edicao
                  end
                  object ed34: TEdit
                    Left = 445
                    Top = 132
                    Width = 247
                    Height = 21
                    TabStop = False
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 15
                  end
                  object ed35: TEdit
                    Left = 389
                    Top = 132
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 2
                    TabOrder = 14
                    OnChange = btn17Click
                    OnKeyDown = edicao
                  end
                  object ed36: TEdit
                    Left = 68
                    Top = 167
                    Width = 247
                    Height = 21
                    TabStop = False
                    Enabled = False
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 17
                  end
                  object ed37: TEdit
                    Left = 11
                    Top = 167
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    Enabled = False
                    MaxLength = 4
                    TabOrder = 16
                    OnKeyDown = edicao
                  end
                  object ed38: TEdit
                    Left = 445
                    Top = 167
                    Width = 247
                    Height = 21
                    TabStop = False
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 19
                  end
                  object ed39: TEdit
                    Left = 389
                    Top = 167
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 4
                    TabOrder = 18
                    OnChange = btn19Click
                    OnKeyDown = edicao
                  end
                  object ed41: TEdit
                    Left = 68
                    Top = 64
                    Width = 247
                    Height = 21
                    TabStop = False
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 5
                  end
                  object ed40: TEdit
                    Left = 11
                    Top = 64
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 2
                    TabOrder = 4
                    OnChange = btn20Click
                    OnKeyDown = edicao
                  end
                  object dbedtModal: TDBEdit
                    Left = 389
                    Top = 28
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'CD_VIA_TRANSPORTE'
                    DataSource = datm_grupo.ds_relatorios_mail_aut
                    TabOrder = 2
                    OnChange = SpeedButton60Click
                    OnKeyDown = edicao
                  end
                  object Edit123: TEdit
                    Left = 445
                    Top = 27
                    Width = 247
                    Height = 21
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                    TabOrder = 3
                  end
                  object Edit135: TEdit
                    Left = 389
                    Top = 64
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 2
                    TabOrder = 6
                    OnChange = Edit135Change
                    OnKeyDown = edicao
                  end
                  object Edit136: TEdit
                    Left = 445
                    Top = 64
                    Width = 247
                    Height = 21
                    TabStop = False
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 7
                  end
                  object Edit121: TEdit
                    Left = 11
                    Top = 28
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 3
                    TabOrder = 0
                    OnChange = SpeedButton59Click
                    OnKeyDown = edicao
                  end
                  object Edit122: TEdit
                    Left = 68
                    Top = 28
                    Width = 247
                    Height = 21
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                    TabOrder = 1
                  end
                  object edt_cd_urf_despacho: TEdit
                    Left = 11
                    Top = 203
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 7
                    TabOrder = 20
                    OnChange = spd_urf_despachoClick
                    OnKeyDown = edicao
                  end
                  object edt_nm_urf_despacho: TEdit
                    Left = 68
                    Top = 203
                    Width = 247
                    Height = 21
                    TabStop = False
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 21
                  end
                  object edtE01_ExportadorImportador_Cod: TEdit
                    Left = 389
                    Top = 99
                    Width = 58
                    Height = 21
                    MaxLength = 5
                    TabOrder = 10
                    OnChange = btnE01_ExportadorImportadorClick
                    OnKeyDown = edicao
                  end
                  object edtE01_ExportadorImportador_Nome: TEdit
                    Left = 445
                    Top = 99
                    Width = 247
                    Height = 21
                    TabStop = False
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 11
                  end
                  object edtRepresentante: TEdit
                    Left = 389
                    Top = 203
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 5
                    TabOrder = 22
                    OnChange = btnRepresentanteClick
                    OnKeyDown = edicao
                  end
                  object edtRepresentanteDesc: TEdit
                    Left = 445
                    Top = 203
                    Width = 247
                    Height = 21
                    TabStop = False
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 23
                  end
                  object mmSql: TMemo
                    Left = 12
                    Top = 348
                    Width = 710
                    Height = 40
                    TabOrder = 24
                    OnChange = mmSqlChange
                  end
                  object edtcdServico: TEdit
                    Left = 11
                    Top = 238
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 4
                    TabOrder = 25
                    OnChange = btnServicoClick
                    OnKeyDown = edicao
                  end
                  object edtnmServico: TEdit
                    Left = 68
                    Top = 238
                    Width = 247
                    Height = 21
                    TabStop = False
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 26
                  end
                  object edtAgenteCarga: TEdit
                    Left = 11
                    Top = 273
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 4
                    TabOrder = 27
                    OnChange = btnAgenteCargaClick
                    OnKeyDown = edicao
                  end
                  object edtNmAgenteCarga: TEdit
                    Left = 68
                    Top = 273
                    Width = 247
                    Height = 21
                    TabStop = False
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 28
                  end
                  object edtArmazemDescarga: TEdit
                    Left = 389
                    Top = 238
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 5
                    TabOrder = 29
                    OnChange = btnArmazemDescargaClick
                    OnKeyDown = edicao
                  end
                  object edtNmArmazemDescarga: TEdit
                    Left = 445
                    Top = 238
                    Width = 247
                    Height = 21
                    TabStop = False
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 30
                  end
                  object edtCdLocalDesembarque: TEdit
                    Left = 389
                    Top = 273
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 4
                    TabOrder = 31
                    OnChange = btnLocalDesembarqueClick
                    OnKeyDown = edicao
                  end
                  object edtLocalDesembarque: TEdit
                    Left = 446
                    Top = 273
                    Width = 247
                    Height = 21
                    TabStop = False
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 32
                  end
                  object edtCdArmazemEstocagem: TEdit
                    Left = 389
                    Top = 310
                    Width = 57
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 4
                    TabOrder = 33
                    OnChange = btnArmazemEstocagemClick
                    OnKeyDown = edicao
                  end
                  object edtArmazemEstocagem: TEdit
                    Left = 446
                    Top = 310
                    Width = 247
                    Height = 21
                    TabStop = False
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 34
                  end
                end
              end
            end
          end
          object ts_usuarios: TTabSheet
            BorderWidth = 8
            Caption = 'Usu'#225'rios'
            ImageIndex = 2
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 802
              Height = 27
              Align = alTop
              BevelInner = bvLowered
              TabOrder = 0
              object Label124: TLabel
                Left = 8
                Top = 8
                Width = 83
                Height = 13
                Caption = 'Usu'#225'rios para:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText2: TDBText
                Left = 145
                Top = 8
                Width = 568
                Height = 15
                DataField = 'DESCRICAO'
                DataSource = datm_grupo.ds_relatorios_mail_aut
                Transparent = True
              end
              object DBText1: TDBText
                Left = 93
                Top = 8
                Width = 52
                Height = 15
                DataField = 'CD_RELATORIO'
                DataSource = datm_grupo.ds_relatorios_mail_aut
                Transparent = True
              end
              object Label125: TLabel
                Left = 139
                Top = 8
                Width = 3
                Height = 13
                Caption = '-'
              end
            end
            object DBGrid2: TDBGrid
              Left = 0
              Top = 84
              Width = 802
              Height = 322
              TabStop = False
              Align = alTop
              DataSource = datm_grupo.ds_relatorios_mail_aut_usuarios
              PopupMenu = popGridUsuarios
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CD_USUARIO'
                  Title.Caption = 'C'#243'digo Usu'#225'rio'
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
                  FieldName = 'calc_NM_USUARIO'
                  Title.Caption = 'Nome do Usu'#225'rio'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 191
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TX_HORARIOS_ENVIO'
                  Title.Caption = 'Horario de Envio'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 391
                  Visible = True
                end>
            end
            object Panel4: TPanel
              Left = 0
              Top = 410
              Width = 802
              Height = 4
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 4
            end
            object Panel15: TPanel
              Left = 0
              Top = 406
              Width = 802
              Height = 4
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 3
            end
            object pnlCampos: TPanel
              Left = 0
              Top = 27
              Width = 802
              Height = 57
              Align = alTop
              BevelOuter = bvNone
              BorderWidth = 4
              TabOrder = 1
              object Shape15: TShape
                Left = 4
                Top = 4
                Width = 794
                Height = 49
                Align = alClient
                Brush.Style = bsClear
                Pen.Color = clGray
              end
              object btn_co_usuario: TSpeedButton
                Left = 379
                Top = 25
                Width = 24
                Height = 23
                Enabled = False
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
                OnClick = btn_co_usuarioClick
              end
              object Label126: TLabel
                Left = 11
                Top = 13
                Width = 44
                Height = 13
                Caption = 'Usu'#225'rio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label127: TLabel
                Left = 415
                Top = 13
                Width = 101
                Height = 13
                Caption = 'Hor'#225'rios de envio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Edit2: TEdit
                Left = 58
                Top = 26
                Width = 319
                Height = 21
                TabStop = False
                ParentColor = True
                ReadOnly = True
                TabOrder = 2
              end
              object edt_horarios: TEdit
                Left = 458
                Top = 25
                Width = 251
                Height = 22
                TabStop = False
                AutoSize = False
                BevelInner = bvLowered
                BevelKind = bkFlat
                BevelOuter = bvNone
                Ctl3D = False
                ParentCtl3D = False
                TabOrder = 0
              end
              object MaskEdit1: TMaskEdit
                Left = 415
                Top = 26
                Width = 42
                Height = 21
                EditMask = '!90:00;1;_'
                MaxLength = 5
                TabOrder = 3
                Text = '  :  '
                OnKeyDown = DBEdit3KeyDown
                OnKeyPress = MaskEdit1KeyPress
              end
              object DBEdit3: TDBEdit
                Left = 11
                Top = 26
                Width = 48
                Height = 21
                DataField = 'CD_USUARIO'
                DataSource = datm_grupo.ds_relatorios_mail_aut_usuarios
                Enabled = False
                TabOrder = 1
                OnChange = btn_co_usuarioClick
                OnExit = DBEdit3Exit
                OnKeyDown = DBEdit3KeyDown
              end
            end
          end
        end
      end
    end
    object tbsRefCompDI: TTabSheet
      Caption = 'Ref Complementares DI'
      ImageIndex = 6
      object btnAdicionarRef: TSpeedButton
        Left = 344
        Top = 8
        Width = 38
        Height = 22
        Caption = 'u'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Wingdings 3'
        Font.Style = []
        ParentFont = False
        OnClick = btnAdicionarRefClick
      end
      object btnRemoverRef: TSpeedButton
        Left = 344
        Top = 40
        Width = 38
        Height = 22
        Caption = 't'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Wingdings 3'
        Font.Style = []
        ParentFont = False
        OnClick = btnRemoverRefClick
      end
      object btnRemoverTodasRef: TSpeedButton
        Left = 344
        Top = 72
        Width = 38
        Height = 22
        Caption = 'tt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Wingdings 3'
        Font.Style = []
        ParentFont = False
        OnClick = btnRemoverTodasRefClick
      end
      object DBGrid3: TDBGrid
        Left = 8
        Top = 8
        Width = 320
        Height = 489
        DataSource = datm_grupo.ds_Tipo_Referencia
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_REFERENCIA'
            Title.Caption = 'Refer'#234'ncia'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object DBGrid4: TDBGrid
        Left = 400
        Top = 8
        Width = 320
        Height = 489
        DataSource = datm_grupo.ds_Grupo_Ref_Comp_DI
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_REFERENCIA'
            ReadOnly = True
            Title.Caption = 'Refer'#234'ncia'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_ORDEM'
            Title.Caption = 'Ordem'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
    object tbsBaseICMS: TTabSheet
      Caption = 'Base ICMS'
      ImageIndex = 7
      object btnAdicionarDespesa: TSpeedButton
        Left = 344
        Top = 32
        Width = 38
        Height = 22
        Caption = 'u'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Wingdings 3'
        Font.Style = []
        ParentFont = False
        OnClick = btnAdicionarDespesaClick
      end
      object btnRemoverDespesa: TSpeedButton
        Left = 344
        Top = 64
        Width = 38
        Height = 22
        Caption = 't'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Wingdings 3'
        Font.Style = []
        ParentFont = False
        OnClick = btnRemoverDespesaClick
      end
      object btnRemoverTodasDespesas: TSpeedButton
        Left = 344
        Top = 96
        Width = 38
        Height = 22
        Caption = 'tt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Wingdings 3'
        Font.Style = []
        ParentFont = False
        OnClick = btnRemoverTodasDespesasClick
      end
      object Label62: TLabel
        Left = 8
        Top = 13
        Width = 319
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'Despesas Dispon'#237'veis'
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label63: TLabel
        Left = 400
        Top = 13
        Width = 319
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'Despesas Em Uso'
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object DBGrid5: TDBGrid
        Left = 8
        Top = 32
        Width = 320
        Height = 465
        DataSource = datm_grupo.ds_Despesas
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ITEM'
            Title.Caption = 'Nome'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 230
            Visible = True
          end>
      end
      object DBGrid6: TDBGrid
        Left = 400
        Top = 32
        Width = 320
        Height = 465
        DataSource = datm_grupo.ds_Grupo_Despesas
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ITEM'
            ReadOnly = True
            Title.Caption = 'Nome'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 230
            Visible = True
          end>
      end
    end
    object tbsEmail: TTabSheet
      Caption = 'Email'
      ImageIndex = 8
      object Label21: TLabel
        Left = 8
        Top = 11
        Width = 201
        Height = 13
        Caption = 'Email de Contato no Daily Followup'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label57: TLabel
        Left = 370
        Top = 10
        Width = 206
        Height = 13
        Caption = 'Email de Contato no Followup Di'#225'rio'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label64: TLabel
        Left = 8
        Top = 58
        Width = 95
        Height = 13
        Caption = 'Email de Avarias'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label65: TLabel
        Left = 370
        Top = 58
        Width = 141
        Height = 13
        Caption = 'Email Consulta Mercante'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label66: TLabel
        Left = 8
        Top = 106
        Width = 205
        Height = 13
        Caption = 'Email de Consulta LI - Em Exigencia'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label79: TLabel
        Left = 8
        Top = 324
        Width = 164
        Height = 13
        Caption = 'Email de Contato - Draft (BL)'
        FocusControl = dbedt_cd_grupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBCheckBox4: TDBCheckBox
        Left = 523
        Top = 57
        Width = 162
        Height = 17
        Caption = 'Consultar BLs Terceiros'
        DataField = 'IC_CONSULTA_MERCANTE_TERCEIROS'
        DataSource = datm_grupo.ds_grupo_
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = dbedt_nm_grupoChange
      end
      object dbedtNM_EMAIL_DAILY: TDBEdit
        Left = 8
        Top = 26
        Width = 319
        Height = 21
        DataField = 'NM_EMAIL_CONTATO_DAILY'
        DataSource = datm_grupo.ds_grupo_
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = dbedt_nm_grupoChange
      end
      object dbedtNM_EMAIL_FOLLOWUP: TDBEdit
        Left = 368
        Top = 26
        Width = 319
        Height = 21
        DataField = 'NM_EMAIL_CONTATO_FOLLOWUP'
        DataSource = datm_grupo.ds_grupo_
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = dbedt_nm_grupoChange
      end
      object dbedtEMAIL_AVARIAS: TDBEdit
        Left = 8
        Top = 73
        Width = 319
        Height = 21
        DataField = 'EMAIL_AVARIAS'
        DataSource = datm_grupo.ds_grupo_
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnChange = dbedt_nm_grupoChange
      end
      object dbedtNM_EMAIL_CONSULTA_MERCANTE: TDBEdit
        Left = 368
        Top = 74
        Width = 319
        Height = 21
        DataField = 'NM_EMAIL_CONSULTA_MERCANTE'
        DataSource = datm_grupo.ds_grupo_
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnChange = dbedt_nm_grupoChange
      end
      object dbedtNM_EMAIL_CONSULTA_LI: TDBEdit
        Left = 8
        Top = 121
        Width = 319
        Height = 21
        DataField = 'NM_EMAIL_CONSULTA_LI'
        DataSource = datm_grupo.ds_grupo_
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnChange = dbedt_nm_grupoChange
      end
      object Panel5: TPanel
        Left = 3
        Top = 160
        Width = 364
        Height = 152
        BevelOuter = bvNone
        TabOrder = 6
        object Label67: TLabel
          Left = 5
          Top = 5
          Width = 239
          Height = 13
          Caption = 'Email de Consulta LI - Mudan'#231'a de Status'
          FocusControl = dbedt_cd_grupo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtNovoEmail: TEdit
          Left = 5
          Top = 22
          Width = 319
          Height = 21
          TabOrder = 0
        end
        object dbgEmailsProcesso: TDBGrid
          Left = 5
          Top = 44
          Width = 319
          Height = 79
          DataSource = datm_grupo.dsEmailConsultaLiStatus
          Options = [dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
              FieldName = 'NM_EMAIL'
              Title.Caption = 'Emails'
              Width = 280
              Visible = True
            end>
        end
        object btnRemove: TBitBtn
          Left = 328
          Top = 44
          Width = 23
          Height = 22
          TabOrder = 2
          OnClick = btnRemoveClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000666666666666666666666666666666666666000066666666666666666666
            6666666666666666000066666666666666666666666666666666666600006666
            6666666666666666666666666666666600006666666666666666666666666666
            6666666600006666FFFFFFFFFFF6666666FFFFFFFFFFF6660000666822222222
            22F66666687777777777F666000066682222222222F66666687777777777F666
            0000666888888888886666666888888888886666000066666666666666666666
            6666666666666666000066666666666666666666666666666666666600006666
            6666666666666666666666666666666600006666666666666666666666666666
            6666666600006666666666666666666666666666666666660000666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000}
          NumGlyphs = 2
        end
        object btnAdd: TBitBtn
          Left = 329
          Top = 21
          Width = 22
          Height = 22
          TabOrder = 1
          OnClick = btnAddClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000666666666666666666666666666666666666000066666666FFF666666666
            666666FFF666666600006666666822F66666666666666877F666666600006666
            666822F66666666666666877F666666600006666666822F66666666666666877
            F666666600006666FFF622FFFFF6666666FFF777FFFFF6660000666822222222
            22F66666687777777777F666000066682222222222F66666687777777777F666
            000066688888226888666666688888777888666600006666666822F666666666
            66666877F666666600006666666822F66666666666666877F666666600006666
            666822F66666666666666877F666666600006666666888666666666666666888
            6666666600006666666666666666666666666666666666660000666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000}
          NumGlyphs = 2
        end
        object dbmmNM_EMAIL_CONSULTA_LI_STATUS: TDBMemo
          Left = 5
          Top = 100
          Width = 315
          Height = 21
          DataField = 'NM_EMAIL_CONSULTA_LI_STATUS'
          DataSource = datm_grupo.ds_grupo_
          TabOrder = 5
          Visible = False
          OnChange = dbmmNM_EMAIL_CONSULTA_LI_STATUSChange
        end
        object dbchkIN_STATUS_LI_INCLUIR_CONTATO: TDBCheckBox
          Left = 5
          Top = 131
          Width = 182
          Height = 17
          Caption = 'Adicionar Contato do Processo'
          DataField = 'IN_STATUS_LI_INCLUIR_CONTATO'
          DataSource = datm_grupo.ds_grupo_
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_grupoChange
        end
      end
      object edtEmailDraftBL: TDBEdit
        Left = 8
        Top = 339
        Width = 319
        Height = 21
        DataField = 'NM_EMAIL_DRAFT_BL'
        DataSource = datm_grupo.ds_grupo_
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnChange = dbedt_nm_grupoChange
      end
    end
    object tbsParametrosDi: TTabSheet
      Caption = 'DI - Parametros'
      ImageIndex = 9
      object Label68: TLabel
        Left = 8
        Top = 104
        Width = 105
        Height = 13
        Caption = 'C'#225'lculo do Seguro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label82: TLabel
        Left = 61
        Top = 172
        Width = 10
        Height = 13
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 167
        Width = 47
        Height = 21
        DataField = 'PC_SEGURO_MLE_DI'
        DataSource = datm_grupo.ds_grupo_
        TabOrder = 0
        OnChange = dbedt_nm_grupoChange
      end
      object DBRadioGroup3: TDBRadioGroup
        Left = 7
        Top = 120
        Width = 381
        Height = 41
        Caption = 'Base'
        Columns = 3
        DataField = 'CD_TIPO_BASE_SEGURO_DI'
        DataSource = datm_grupo.ds_grupo_
        Items.Strings = (
          'VMLE'
          'VMLE + Frete'
          'VMLE + Frete + L.E')
        TabOrder = 1
        Values.Strings = (
          '1'
          '2'
          '4')
        OnChange = dbedt_nm_grupoChange
      end
      object dbrgEmissaoDIExterna: TDBRadioGroup
        Left = 7
        Top = 16
        Width = 212
        Height = 69
        Caption = 'Emiss'#227'o de DI'
        DataField = 'IN_DI_EXTERNA'
        DataSource = datm_grupo.ds_grupo_
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'MyIndai'#225
          'Externa')
        ParentFont = False
        TabOrder = 2
        Values.Strings = (
          '0'
          '1')
        OnChange = dbedt_nm_grupoChange
      end
      object chkPreencheQuadroComplementarAd: TDBCheckBox
        Left = 10
        Top = 207
        Width = 367
        Height = 17
        Caption = 'Preenche quadro complementar por adi'#231#227'o (apenas CFOP).'
        DataField = 'IN_PREENCHE_COMPLEMENTAR_AD'
        DataSource = datm_grupo.ds_grupo_
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = dbedt_nm_grupoChange
      end
    end
    object tbsFatores: TTabSheet
      Caption = 'Fatores'
      ImageIndex = 5
      object pgcFatores: TPageControl
        Left = 0
        Top = 0
        Width = 828
        Height = 548
        ActivePage = tbsFatoresEventos
        Align = alClient
        TabOrder = 0
        OnChange = pgcFatoresChange
        OnChanging = pgcFatoresChanging
        object tbsFatoresLista: TTabSheet
          Caption = 'Lista'
          object dbgrdFatores: TDBGrid
            Left = 0
            Top = 0
            Width = 820
            Height = 527
            Align = alClient
            DataSource = datm_grupo.dsFatores
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
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
                FieldName = 'NM_GRUPO'
                Title.Caption = 'Grupo'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_PRODUTO'
                Title.Caption = 'Produto'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_FATOR'
                Title.Caption = 'Fator'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DS_FATOR'
                Title.Caption = 'Descri'#231#227'o'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 275
                Visible = True
              end>
          end
        end
        object tbsFatoresDadoBasicos: TTabSheet
          Caption = 'Dado B'#225'sicos'
          ImageIndex = 3
          object Nome: TLabel
            Left = 6
            Top = 7
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
          object Label31: TLabel
            Left = 6
            Top = 45
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descri'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label32: TLabel
            Left = 422
            Top = 4
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
          object btnFatoresUnidade: TSpeedButton
            Left = 681
            Top = 19
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
            OnClick = dbedtFatoresUnidadeCodigoChange
          end
          object Label33: TLabel
            Left = 422
            Top = 45
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
          object btnFatoresProduto: TSpeedButton
            Left = 681
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
            OnClick = dbedtFatoresProdutoCodigoChange
          end
          object Label34: TLabel
            Left = 422
            Top = 86
            Width = 35
            Height = 13
            Caption = 'Grupo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnFatoresGrupo: TSpeedButton
            Left = 681
            Top = 101
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
            OnClick = dbedtFatoresGrupoCodigoChange
          end
          object dbedtFatoresNome: TDBEdit
            Left = 6
            Top = 21
            Width = 400
            Height = 21
            Hint = #201' necess'#225'rio informar um nome para o Fator.'
            DataField = 'NM_FATOR'
            DataSource = datm_grupo.dsFatores
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = dbedt_nm_grupoChange
            OnExit = dbedtFatoresNomeExit
          end
          object dbmemFatoresDescricao: TDBMemo
            Left = 6
            Top = 62
            Width = 400
            Height = 79
            DataField = 'DS_FATOR'
            DataSource = datm_grupo.dsFatores
            ScrollBars = ssBoth
            TabOrder = 1
            OnExit = dbedtFatoresNomeExit
          end
          object edtFatoresUnidadeNome: TEdit
            Left = 449
            Top = 20
            Width = 232
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 2
          end
          object dbedtFatoresUnidadeCodigo: TDBEdit
            Tag = 2
            Left = 422
            Top = 20
            Width = 27
            Height = 21
            Hint = #201' necess'#225'rio informar uma unidade para o Fator.'
            DataField = 'CD_UNID_NEG'
            DataSource = datm_grupo.dsFatores
            TabOrder = 3
            OnChange = dbedtFatoresUnidadeCodigoChange
            OnExit = dbedtFatoresNomeExit
          end
          object edtFatoresProdutoNome: TEdit
            Left = 449
            Top = 61
            Width = 232
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 4
          end
          object dbedtFatoresProdutoCodigo: TDBEdit
            Tag = 2
            Left = 422
            Top = 61
            Width = 27
            Height = 21
            Hint = #201' necess'#225'rio informar um produto para o Fator.'
            DataField = 'CD_PRODUTO'
            DataSource = datm_grupo.dsFatores
            TabOrder = 5
            OnChange = dbedtFatoresProdutoCodigoChange
            OnExit = dbedtFatoresNomeExit
          end
          object edtFatoresGrupoNome: TEdit
            Left = 449
            Top = 102
            Width = 232
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 6
          end
          object dbedtFatoresGrupoCodigo: TDBEdit
            Tag = 3
            Left = 422
            Top = 102
            Width = 27
            Height = 21
            Hint = #201' necess'#225'rio informar um Grupo para o Fator.'
            CharCase = ecUpperCase
            DataField = 'CD_GRUPO'
            DataSource = datm_grupo.dsFatores
            TabOrder = 7
            OnChange = dbedtFatoresGrupoCodigoChange
            OnExit = dbedtFatoresNomeExit
          end
          object gbFatoresValidacao: TGroupBox
            Left = 8
            Top = 151
            Width = 705
            Height = 209
            Caption = 'Valida'#231#227'o do Fator'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
            object SpeedButton2: TSpeedButton
              Left = 209
              Top = 31
              Width = 25
              Height = 22
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
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
              OnClick = SpeedButton2Click
            end
            object Label35: TLabel
              Left = 9
              Top = 18
              Width = 95
              Height = 13
              Caption = 'Campo Processo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label36: TLabel
              Left = 241
              Top = 18
              Width = 107
              Height = 13
              Caption = 'Tabela de Retorno'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object SpeedButton3: TSpeedButton
              Left = 441
              Top = 31
              Width = 25
              Height = 22
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
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
              OnClick = SpeedButton3Click
            end
            object Label37: TLabel
              Left = 473
              Top = 18
              Width = 140
              Height = 13
              Caption = 'Campo Chave da Tabela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object SpeedButton4: TSpeedButton
              Left = 673
              Top = 31
              Width = 25
              Height = 22
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
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
              OnClick = SpeedButton4Click
            end
            object Label38: TLabel
              Left = 9
              Top = 56
              Width = 167
              Height = 13
              Caption = 'Campo de Retorno da Tabela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object SpeedButton5: TSpeedButton
              Left = 209
              Top = 69
              Width = 25
              Height = 22
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
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
              OnClick = SpeedButton5Click
            end
            object Label39: TLabel
              Left = 241
              Top = 56
              Width = 68
              Height = 13
              Caption = 'Comparador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label40: TLabel
              Left = 473
              Top = 56
              Width = 97
              Height = 13
              Caption = 'Valor de Retorno'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label41: TLabel
              Left = 9
              Top = 95
              Width = 74
              Height = 13
              Caption = 'SQL Retorno'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbmemNM_SQL: TDBMemo
              Left = 9
              Top = 112
              Width = 688
              Height = 89
              DataField = 'NM_SQL'
              DataSource = datm_grupo.dsFatores
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 1000
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 6
              OnExit = dbedtFatoresNomeExit
            end
            object dbedtNM_CAMPO_PROCESSO: TDBEdit
              Left = 9
              Top = 32
              Width = 200
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NM_CAMPO_PROCESSO'
              DataSource = datm_grupo.dsFatores
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = dbedtFatoresNomeExit
            end
            object dbedtNM_TABELA: TDBEdit
              Left = 241
              Top = 32
              Width = 200
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NM_TABELA'
              DataSource = datm_grupo.dsFatores
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnExit = dbedtFatoresNomeExit
            end
            object dbedtNM_CAMPO_CHAVE_TABELA: TDBEdit
              Left = 473
              Top = 32
              Width = 200
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NM_CAMPO_CHAVE_TABELA'
              DataSource = datm_grupo.dsFatores
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnExit = dbedtFatoresNomeExit
            end
            object dbedtNM_CAMPO_RETORNO_TABELA: TDBEdit
              Left = 9
              Top = 71
              Width = 200
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NM_CAMPO_RETORNO_TABELA'
              DataSource = datm_grupo.dsFatores
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnExit = dbedtFatoresNomeExit
            end
            object dblupFatoresComparador: TDBLookupComboBox
              Left = 241
              Top = 71
              Width = 224
              Height = 21
              DataField = 'CD_COMPARADOR'
              DataSource = datm_grupo.dsFatores
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CD_COMPARADOR'
              ListField = 'NM_COMPARADOR'
              ListSource = datm_grupo.dsComparadores
              ParentFont = False
              TabOrder = 4
              OnExit = dbedtFatoresNomeExit
            end
            object dbedtNM_RETORNO: TDBEdit
              Left = 473
              Top = 71
              Width = 224
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NM_RETORNO'
              DataSource = datm_grupo.dsFatores
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnExit = dbedtFatoresNomeExit
            end
          end
          object gbFatoresTrigger: TGroupBox
            Left = 8
            Top = 367
            Width = 705
            Height = 58
            Caption = 'Trigger do Fator'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
            object Label42: TLabel
              Left = 9
              Top = 17
              Width = 40
              Height = 13
              Caption = 'Tabela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object SpeedButton6: TSpeedButton
              Left = 209
              Top = 30
              Width = 25
              Height = 22
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
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
              OnClick = SpeedButton6Click
            end
            object Label43: TLabel
              Left = 241
              Top = 17
              Width = 45
              Height = 13
              Caption = 'Campos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedtNM_TABELA_TRIGGER: TDBEdit
              Left = 9
              Top = 31
              Width = 200
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NM_TABELA_TRIGGER'
              DataSource = datm_grupo.dsFatores
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = dbedtFatoresNomeExit
            end
            object dbedtNM_CAMPOS_CHAVE_TRIGGER: TDBEdit
              Left = 241
              Top = 31
              Width = 456
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NM_CAMPOS_CHAVE_TRIGGER'
              DataSource = datm_grupo.dsFatores
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnExit = dbedtFatoresNomeExit
            end
          end
          object dbchkOpcional: TDBCheckBox
            Left = 422
            Top = 128
            Width = 73
            Height = 17
            Caption = 'Opcional'
            DataField = 'IN_OPCIONAL'
            DataSource = datm_grupo.dsFatores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object tbsFatoresCampos: TTabSheet
          Caption = 'Campos'
          ImageIndex = 1
          object pgFatoresCampos: TPageControl
            Left = 0
            Top = 0
            Width = 820
            Height = 520
            ActivePage = tbsFatoresCamposLista
            Align = alClient
            TabOrder = 0
            object tbsFatoresCamposLista: TTabSheet
              Caption = 'Lista'
              object dbgrdFatoresCampos: TDBGrid
                Left = 0
                Top = 0
                Width = 812
                Height = 499
                Align = alClient
                DataSource = datm_grupo.dsFatoresCampos
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
                    FieldName = 'NM_FATOR_CAMPO'
                    Title.Caption = 'Nome'
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
            object tbsFatoresCamposDados: TTabSheet
              Caption = 'Dados B'#225'sicos'
              ImageIndex = 1
              object Label44: TLabel
                Left = 6
                Top = 7
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
              object Label45: TLabel
                Left = 6
                Top = 45
                Width = 95
                Height = 13
                Caption = 'Campo Processo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object SpeedButton10: TSpeedButton
                Left = 206
                Top = 58
                Width = 25
                Height = 22
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
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
              end
              object dbedtNM_FATOR_CAMPO: TDBEdit
                Left = 6
                Top = 21
                Width = 400
                Height = 21
                Hint = #201' necess'#225'rio informar um nome para o Campo do Fator.'
                DataField = 'NM_FATOR_CAMPO'
                DataSource = datm_grupo.dsFatoresCampos
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object dbedtCamposNM_CAMPO_PROCESSO: TDBEdit
                Left = 6
                Top = 59
                Width = 200
                Height = 21
                Hint = #201' necess'#225'rio informar um Campo para o Campo do Fator.'
                CharCase = ecUpperCase
                DataField = 'NM_CAMPO_PROCESSO'
                DataSource = datm_grupo.dsFatoresCampos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object gbFatoresCamposLookup: TGroupBox
                Left = 8
                Top = 88
                Width = 705
                Height = 209
                Caption = 'Lookup'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object Label46: TLabel
                  Left = 9
                  Top = 18
                  Width = 40
                  Height = 13
                  Caption = 'Tabela'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label47: TLabel
                  Left = 241
                  Top = 18
                  Width = 79
                  Height = 13
                  Caption = 'Campo Chave'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label48: TLabel
                  Left = 473
                  Top = 17
                  Width = 88
                  Height = 13
                  Caption = 'Campo Retorno'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object SpeedButton7: TSpeedButton
                  Left = 209
                  Top = 31
                  Width = 25
                  Height = 22
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
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
                end
                object SpeedButton8: TSpeedButton
                  Left = 441
                  Top = 31
                  Width = 25
                  Height = 22
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
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
                end
                object SpeedButton9: TSpeedButton
                  Left = 673
                  Top = 31
                  Width = 25
                  Height = 22
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
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
                end
                object Label49: TLabel
                  Left = 9
                  Top = 59
                  Width = 25
                  Height = 13
                  Caption = 'SQL'
                  FocusControl = dbedtFatoresNome
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object dbedtNM_LOOKUP_TABELA: TDBEdit
                  Left = 9
                  Top = 32
                  Width = 200
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'NM_LOOKUP_TABELA'
                  DataSource = datm_grupo.dsFatoresCampos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object dbedtNM_LOOKUP_CAMPO_CHAVE: TDBEdit
                  Left = 241
                  Top = 32
                  Width = 200
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'NM_LOOKUP_CAMPO_CHAVE'
                  DataSource = datm_grupo.dsFatoresCampos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object dbedtNM_LOOKUP_CAMPO_RETORNO: TDBEdit
                  Left = 473
                  Top = 32
                  Width = 200
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'NM_LOOKUP_CAMPO_RETORNO'
                  DataSource = datm_grupo.dsFatoresCampos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                end
                object dbmemNM_LOOKUP_SQL: TDBMemo
                  Left = 9
                  Top = 74
                  Width = 688
                  Height = 127
                  DataField = 'NM_LOOKUP_SQL'
                  DataSource = datm_grupo.dsFatoresCampos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  MaxLength = 1000
                  ParentFont = False
                  ScrollBars = ssBoth
                  TabOrder = 3
                end
              end
            end
          end
        end
        object tbsFatoresEventos: TTabSheet
          Caption = 'Eventos'
          ImageIndex = 2
          object pgFatoresEventos: TPageControl
            Left = 0
            Top = 0
            Width = 820
            Height = 520
            ActivePage = tbsFatoresEventosDados
            Align = alClient
            TabOrder = 0
            object tbsFatoresEventosLista: TTabSheet
              Caption = 'Lista'
              object dbgrdFatoresEventos: TDBGrid
                Left = 0
                Top = 0
                Width = 812
                Height = 499
                Align = alClient
                DataSource = datm_grupo.dsFatoresEventos
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
                    FieldName = 'CD_EVENTO'
                    Title.Caption = 'Evento'
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
                    FieldName = 'NM_EVENTO'
                    Title.Caption = 'Nome Evento'
                    Title.Color = clBlack
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWhite
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 155
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CD_EVENTO_BASE'
                    Title.Caption = 'Evento Base'
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
                    FieldName = 'NM_EVENTO_BASE'
                    Title.Caption = 'Nome Evento Base'
                    Title.Color = clBlack
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWhite
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 155
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CD_EVENTO_ANTERIOR'
                    Title.Caption = 'Evento Anteior'
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
                    FieldName = 'NM_EVENTO_ANTERIOR'
                    Title.Caption = 'Nome Evento Anteior'
                    Title.Color = clBlack
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWhite
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 155
                    Visible = True
                  end>
              end
            end
            object tbsFatoresEventosDados: TTabSheet
              Caption = 'Dados B'#225'sicos'
              ImageIndex = 1
              object Label50: TLabel
                Left = 6
                Top = 4
                Width = 41
                Height = 13
                Caption = 'Evento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object btnFatoresEvento: TSpeedButton
                Left = 273
                Top = 19
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
                OnClick = dbedtFatoresEventoCodigoChange
              end
              object Label51: TLabel
                Left = 6
                Top = 44
                Width = 73
                Height = 13
                Caption = 'Evento Base'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object btnFatoresEventoBase: TSpeedButton
                Left = 273
                Top = 59
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
                OnClick = dbedtFatoresEventoBaseCodigoChange
              end
              object Label53: TLabel
                Left = 6
                Top = 84
                Width = 33
                Height = 13
                Caption = 'Prazo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label52: TLabel
                Left = 6
                Top = 124
                Width = 150
                Height = 13
                Caption = 'Ordem - Depois do Evento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object btnFatoresEventoAnterior: TSpeedButton
                Left = 273
                Top = 139
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
              end
              object Label54: TLabel
                Left = 6
                Top = 164
                Width = 198
                Height = 13
                Caption = 'Prioridade (Do menor para o maior)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbedtFatoresEventoCodigo: TDBEdit
                Tag = 3
                Left = 6
                Top = 20
                Width = 35
                Height = 21
                Hint = #201' necess'#225'rio informar um evento.'
                DataField = 'CD_EVENTO'
                DataSource = datm_grupo.dsFatoresEventos
                TabOrder = 0
                OnChange = dbedtFatoresEventoCodigoChange
                OnExit = dbedtFatoresNomeExit
              end
              object edtFatoresEventoNome: TEdit
                Left = 41
                Top = 20
                Width = 232
                Height = 21
                TabStop = False
                ParentColor = True
                ReadOnly = True
                TabOrder = 1
              end
              object dbedtFatoresEventoBaseCodigo: TDBEdit
                Tag = 3
                Left = 6
                Top = 60
                Width = 35
                Height = 21
                Hint = #201' necess'#225'rio informar um evento base.'
                DataField = 'CD_EVENTO_BASE'
                DataSource = datm_grupo.dsFatoresEventos
                TabOrder = 2
                OnChange = dbedtFatoresEventoBaseCodigoChange
                OnExit = dbedtFatoresNomeExit
              end
              object edtFatoresEventoBaseNome: TEdit
                Left = 41
                Top = 60
                Width = 232
                Height = 21
                TabStop = False
                ParentColor = True
                ReadOnly = True
                TabOrder = 3
              end
              object dbedtFatoresEventoPrazo: TDBEdit
                Left = 6
                Top = 100
                Width = 51
                Height = 21
                Hint = #201' necess'#225'rio informar uma unidade para o Fator.'
                DataField = 'PZ_EVENTO_BASE'
                DataSource = datm_grupo.dsFatoresEventos
                TabOrder = 4
                OnExit = dbedtFatoresNomeExit
              end
              object dbedtFatoresEventoAnteriorCodigo: TDBEdit
                Tag = 3
                Left = 6
                Top = 140
                Width = 35
                Height = 21
                Hint = #201' necess'#225'rio informar um evento para indicar a ordem.'
                DataField = 'CD_EVENTO_ANTERIOR'
                DataSource = datm_grupo.dsFatoresEventos
                TabOrder = 5
                OnChange = dbedtFatoresEventoAnteriorCodigoChange
                OnExit = dbedtFatoresNomeExit
              end
              object edtFatoresEventoAnteriorNome: TEdit
                Left = 41
                Top = 140
                Width = 232
                Height = 21
                TabStop = False
                ParentColor = True
                ReadOnly = True
                TabOrder = 6
              end
              object dbedtFatoresEventoPrioridade: TDBEdit
                Left = 6
                Top = 180
                Width = 51
                Height = 21
                Hint = #201' necess'#225'rio informar uma unidade para o Fator.'
                DataField = 'NR_PRIORIDADE'
                DataSource = datm_grupo.dsFatoresEventos
                TabOrder = 7
                OnExit = dbedtFatoresNomeExit
              end
              object dbchkFatoresEventoExcluir: TDBCheckBox
                Left = 6
                Top = 224
                Width = 60
                Height = 17
                Caption = 'Excluir'
                DataField = 'IN_EXCLUIR'
                DataSource = datm_grupo.dsFatoresEventos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 9
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = dbedtFatoresNomeExit
              end
              object dbchkFatoresEventoAlterar: TDBCheckBox
                Left = 6
                Top = 208
                Width = 60
                Height = 17
                Caption = 'Alterar'
                DataField = 'IN_ALTERAR'
                DataSource = datm_grupo.dsFatoresEventos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 8
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = dbedtFatoresNomeExit
              end
              object Panel2: TPanel
                Left = 72
                Top = 208
                Width = 153
                Height = 33
                BevelOuter = bvNone
                BorderStyle = bsSingle
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 10
                object Label61: TLabel
                  Left = 0
                  Top = 0
                  Width = 150
                  Height = 26
                  Align = alClient
                  Caption = 'Desmarcar os dois para incluir o evento se n'#227'o existir.'
                  WordWrap = True
                end
              end
            end
          end
        end
      end
    end
    object ts_Itens: TTabSheet
      Caption = 'Itens'
      ImageIndex = 2
      object shp1: TShape
        Left = 0
        Top = 0
        Width = 828
        Height = 52
        Align = alTop
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lbl2: TLabel
        Left = 0
        Top = 52
        Width = 271
        Height = 13
        Align = alTop
        Caption = 'Listagem de Itens que n'#227'o podem ter numer'#225'rio solicitado'
        Color = clBtnFace
        ParentColor = False
      end
      object lbl_pais: TLabel
        Left = 16
        Top = 19
        Width = 25
        Height = 13
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_item: TSpeedButton
        Left = 435
        Top = 15
        Width = 25
        Height = 23
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
        OnClick = btn_itemClick
      end
      object dbgrdListaArm: TDBGrid
        Left = 0
        Top = 65
        Width = 828
        Height = 490
        Align = alClient
        DataSource = datm_grupo.dtsGrupoItem
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object dbedt_nm_item: TEdit
        Left = 97
        Top = 16
        Width = 336
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedt_cd_Item: TDBEdit
        Left = 56
        Top = 16
        Width = 42
        Height = 21
        DataField = 'CD_ITEM'
        DataSource = datm_grupo.dtsGrupoItem
        TabOrder = 2
        OnChange = btn_itemClick
        OnExit = dbedt_cd_ItemExit
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 836
    Height = 53
    Align = alTop
    BevelInner = bvLowered
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
      Left = 389
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
    object Panel1: TPanel
      Left = 525
      Top = 2
      Width = 309
      Height = 49
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 0
      TabStop = True
      object Label1: TLabel
        Left = 12
        Top = 9
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
        Top = 9
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
        Top = 24
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
      end
      object cb_ordem: TComboBox
        Left = 148
        Top = 24
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
    object dbnvg: TDBNavigator
      Left = 252
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_grupo.ds_grupo_
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
  object chk_grupo: TCheckBox
    Left = 644
    Top = 6
    Width = 97
    Height = 17
    Caption = 'Mostrar Inativos'
    TabOrder = 2
    OnClick = chk_grupoClick
  end
  object menu_cadastro: TMainMenu
    Left = 166
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
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
  object popGridUsuarios: TPopupMenu
    Left = 698
    Top = 82
    object Aplicarhorriosparatodososusurios1: TMenuItem
      Caption = '&Aplicar hor'#225'rios para todos os usu'#225'rios'
      OnClick = Aplicarhorriosparatodososusurios1Click
    end
  end
end
