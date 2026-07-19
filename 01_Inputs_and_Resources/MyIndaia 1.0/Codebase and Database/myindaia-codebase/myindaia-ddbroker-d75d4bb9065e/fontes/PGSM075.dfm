object frm_cliente_servico: Tfrm_cliente_servico
  Left = 367
  Top = 179
  Width = 772
  Height = 561
  Caption = 'Cliente X Servi'#231'os '
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
  object pgctrl_cliente_servico: TPageControl
    Left = 0
    Top = 50
    Width = 756
    Height = 420
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_cliente_servicoChange
    OnChanging = pgctrl_cliente_servicoChanging
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 125
        Width = 748
        Height = 267
        Align = alClient
        Color = clWhite
        DataSource = datm_cliente_servico.ds_cliente_servico
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
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
            FieldName = 'CD_SERVICO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookServico'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookAtivo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end>
      end
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 748
        Height = 125
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object lbl_Cliente: TLabel
          Left = 7
          Top = 6
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
          Left = 7
          Top = 44
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
          Left = 7
          Top = 80
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
        object dbedt_cd_cliente: TDBEdit
          Left = 7
          Top = 22
          Width = 43
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_CLIENTE'
          DataSource = datm_cliente_servico.ds_cliente_servico
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 7
          Top = 58
          Width = 43
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_UNID_NEG'
          DataSource = datm_cliente_servico.ds_cliente_servico
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_produto: TDBEdit
          Left = 7
          Top = 95
          Width = 43
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_PRODUTO'
          DataSource = datm_cliente_servico.ds_cliente_servico
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_nm_produto: TDBEdit
          Left = 52
          Top = 95
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookProduto'
          DataSource = datm_cliente_servico.ds_cliente_servico
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 52
          Top = 58
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidNeg'
          DataSource = datm_cliente_servico.ds_cliente_servico
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_razao_social: TDBEdit
          Left = 52
          Top = 22
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCliente'
          DataSource = datm_cliente_servico.ds_cliente_servico
          ReadOnly = True
          TabOrder = 5
        end
        object chk_hab_ativa: TCheckBox
          Left = 392
          Top = 100
          Width = 115
          Height = 17
          Caption = 'Mostrar Inativos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = chk_hab_ativaClick
        end
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos   '
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 748
        Height = 392
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        DesignSize = (
          748
          392)
        object pnlFrete: TPanel
          Left = 404
          Top = 1
          Width = 351
          Height = 386
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvNone
          BorderWidth = 2
          TabOrder = 1
          DesignSize = (
            351
            386)
          object shp2: TShape
            Left = 2
            Top = 0
            Width = 340
            Height = 212
            Anchors = [akLeft, akTop, akRight, akBottom]
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Label3: TLabel
            Left = 6
            Top = 7
            Width = 163
            Height = 13
            Caption = 'Cadastro de Tabela de Frete'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl1: TLabel
            Left = 7
            Top = 8
            Width = 322
            Height = 35
            Alignment = taCenter
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 
              'O Cadastro de Tabela de Frete ser'#225' exibido ap'#243's salvar as altera' +
              #231#245'es feitas!'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
            WordWrap = True
          end
          object dbgrdTabFrete: TDBGrid
            Left = 5
            Top = 39
            Width = 332
            Height = 170
            Hint = 
              'F5 ou Duplo-clique abrem consulta Online'#13#10'Ctrl + Delete exclui r' +
              'egistro'
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = datm_cliente_servico.dsClienteServicoFrete
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnColExit = dbgrdTabFreteColExit
            OnDblClick = dbgrdTabFreteDblClick
            OnEnter = dbgrdTabFreteEnter
            OnKeyDown = dbgrdTabFreteKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_TAB_FRETE'
                Title.Caption = 'C'#243'd.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calcFRETE'
                Title.Caption = 'Descri'#231#227'o Frete'
                Width = 245
                Visible = True
              end>
          end
          object pnl3: TPanel
            Left = 2
            Top = 224
            Width = 325
            Height = 154
            Align = alCustom
            BevelOuter = bvNone
            TabOrder = 0
            object lbl_in_ativo: TLabel
              Left = 145
              Top = 19
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
            object lbl_in_incide_sda: TLabel
              Left = 4
              Top = 19
              Width = 65
              Height = 13
              Caption = 'Incide SDA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_prefixo: TLabel
              Left = 4
              Top = 59
              Width = 113
              Height = 13
              Caption = 'Prefixo p/ Processo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel
              Left = 145
              Top = 59
              Width = 95
              Height = 13
              Caption = 'CPMF Numer'#225'rio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_cd_tab_sda: TLabel
              Left = 4
              Top = 114
              Width = 52
              Height = 13
              Caption = 'Tab.SDA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_tab_sda: TSpeedButton
              Left = 273
              Top = 128
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
              OnClick = btn_co_tab_sdaClick
            end
            object dblkpcbox_ativo: TDBLookupComboBox
              Left = 145
              Top = 34
              Width = 50
              Height = 21
              DataField = 'IN_ATIVO'
              DataSource = datm_cliente_servico.ds_cliente_servico
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente_servico.ds_yesno
              TabOrder = 2
              OnClick = dbedt_cd_servicoChange
            end
            object dblkpcbox_in_incide_sda: TDBLookupComboBox
              Left = 4
              Top = 34
              Width = 50
              Height = 21
              DataField = 'IN_INCIDE_SDA'
              DataSource = datm_cliente_servico.ds_cliente_servico
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente_servico.ds_yesno
              TabOrder = 1
              OnClick = dbedt_cd_servicoChange
            end
            object dbedt_cd_prefixo: TDBEdit
              Left = 4
              Top = 73
              Width = 29
              Height = 21
              DataField = 'CD_PREFIXO'
              DataSource = datm_cliente_servico.ds_cliente_servico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnChange = dbedt_cd_servicoChange
              OnExit = dbedt_cd_prefixoExit
            end
            object dblkpcbox_in_cpmf_num: TDBLookupComboBox
              Left = 145
              Top = 73
              Width = 57
              Height = 21
              DataField = 'LookCpmfNum'
              DataSource = datm_cliente_servico.ds_cliente_servico
              TabOrder = 4
              OnClick = dbedt_cd_servicoChange
            end
            object dbedt_cd_tab_sda: TDBEdit
              Left = 4
              Top = 128
              Width = 41
              Height = 21
              DataField = 'CD_TAB_SDA'
              DataSource = datm_cliente_servico.ds_cliente_servico
              TabOrder = 6
              OnChange = dbedt_cd_servicoChange
              OnExit = dbedt_cd_tab_sdaExit
              OnKeyDown = dbedt_cd_servicoKeyDown
            end
            object dbedt_nm_tab_sda: TDBEdit
              Left = 45
              Top = 128
              Width = 225
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookSDA'
              DataSource = datm_cliente_servico.ds_cliente_servico
              ReadOnly = True
              TabOrder = 7
            end
            object dbchk_volumes_mod2: TDBCheckBox
              Left = 4
              Top = -1
              Width = 125
              Height = 18
              Caption = 'Rel Volumes Mod2'
              DataField = 'IN_REL_VOL_MOD2'
              DataSource = datm_cliente_servico.ds_cliente_servico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbchk_volumes_mod2Click
            end
            object dbchk_lanca_solic: TDBCheckBox
              Left = 4
              Top = 96
              Width = 259
              Height = 19
              Caption = 'Lan'#231'a Impostos na Solic Faturamento'
              DataField = 'IN_LANCA_SOLIC'
              DataSource = datm_cliente_servico.ds_cliente_servico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbchk_lanca_solicClick
            end
          end
        end
        object pnl2: TPanel
          Left = 2
          Top = 2
          Width = 403
          Height = 388
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object lbl_cliente2: TLabel
            Left = 11
            Top = 6
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
            Left = 11
            Top = 44
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
            Left = 11
            Top = 80
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
          object lbl_servico: TLabel
            Left = 11
            Top = 116
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
          object btn_co_servico: TSpeedButton
            Left = 372
            Top = 131
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
            OnClick = btn_co_servicoClick
          end
          object lbl_banco_deb_cc: TLabel
            Left = 8
            Top = 242
            Width = 214
            Height = 13
            Caption = 'Banco para D'#233'bito em Conta (cliente)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_banco_deb_cc: TSpeedButton
            Left = 372
            Top = 256
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
            OnClick = btn_co_banco_deb_ccClick
          end
          object lbl_banco_com: TLabel
            Left = 8
            Top = 277
            Width = 119
            Height = 13
            Caption = 'Banco da Comiss'#225'ria'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_banco_com: TSpeedButton
            Left = 372
            Top = 291
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
            OnClick = btn_co_banco_comClick
          end
          object lbl_banco_deb_com: TLabel
            Left = 8
            Top = 313
            Width = 212
            Height = 13
            Caption = 'Banco para D'#233'b Conta da Comiss'#225'ria'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_banco_deb_com: TSpeedButton
            Left = 372
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
            OnClick = btn_co_banco_deb_comClick
          end
          object dbedt_cd_cliente2: TDBEdit
            Left = 11
            Top = 22
            Width = 43
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_CLIENTE'
            DataSource = datm_cliente_servico.ds_cliente_servico
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_nm_cliente2: TDBEdit
            Left = 56
            Top = 22
            Width = 313
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookCliente'
            DataSource = datm_cliente_servico.ds_cliente_servico
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_cd_unid_neg2: TDBEdit
            Left = 11
            Top = 58
            Width = 43
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_UNID_NEG'
            DataSource = datm_cliente_servico.ds_cliente_servico
            ReadOnly = True
            TabOrder = 2
          end
          object dbedt_nm_unid_neg2: TDBEdit
            Left = 56
            Top = 58
            Width = 313
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookUnidNeg'
            DataSource = datm_cliente_servico.ds_cliente_servico
            ReadOnly = True
            TabOrder = 3
          end
          object dbedt_cd_produto2: TDBEdit
            Left = 11
            Top = 95
            Width = 43
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_PRODUTO'
            DataSource = datm_cliente_servico.ds_cliente_servico
            ReadOnly = True
            TabOrder = 4
          end
          object dbedt_nm_produto2: TDBEdit
            Left = 56
            Top = 95
            Width = 313
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookProduto'
            DataSource = datm_cliente_servico.ds_cliente_servico
            ReadOnly = True
            TabOrder = 5
          end
          object dbedt_cd_servico: TDBEdit
            Left = 11
            Top = 131
            Width = 43
            Height = 21
            Color = clWhite
            DataField = 'CD_SERVICO'
            DataSource = datm_cliente_servico.ds_cliente_servico
            TabOrder = 6
            OnChange = dbedt_cd_servicoChange
            OnEnter = dbedt_cd_servicoEnter
            OnExit = dbedt_cd_servicoExit
            OnKeyDown = dbedt_cd_servicoKeyDown
          end
          object dbedt_nm_servico: TDBEdit
            Left = 56
            Top = 131
            Width = 313
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookServico'
            DataSource = datm_cliente_servico.ds_cliente_servico
            ReadOnly = True
            TabOrder = 7
          end
          object gbox_proposta: TGroupBox
            Left = 8
            Top = 160
            Width = 387
            Height = 69
            Caption = 'Proposta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
            object lbl_pz_proposta: TLabel
              Left = 308
              Top = 19
              Width = 50
              Height = 13
              Caption = 'Validade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_dt_captacao: TLabel
              Left = 105
              Top = 19
              Width = 55
              Height = 13
              Caption = 'Capta'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_dias: TLabel
              Left = 344
              Top = 39
              Width = 24
              Height = 13
              Caption = 'dias'
            end
            object lbl_nr_dps: TLabel
              Left = 6
              Top = 19
              Width = 56
              Height = 13
              Caption = 'D.P.S. N'#186
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label1: TLabel
              Left = 204
              Top = 19
              Width = 68
              Height = 13
              Caption = 'Autoriza'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_pz_proposta: TDBEdit
              Left = 308
              Top = 35
              Width = 29
              Height = 21
              DataField = 'PZ_PROPOSTA'
              DataSource = datm_cliente_servico.ds_cliente_servico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 3
              ParentFont = False
              TabOrder = 3
              OnChange = dbedt_cd_servicoChange
            end
            object dbedt_dt_captacao: TDBEdit
              Left = 105
              Top = 35
              Width = 89
              Height = 21
              DataField = 'DT_CAPTACAO'
              DataSource = datm_cliente_servico.ds_cliente_servico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = dbedt_cd_servicoChange
            end
            object dbedt_nr_dps: TDBEdit
              Left = 6
              Top = 35
              Width = 89
              Height = 21
              DataField = 'NR_DPS'
              DataSource = datm_cliente_servico.ds_cliente_servico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = dbedt_cd_servicoChange
            end
            object dbedt_dt_autorizacao: TDBEdit
              Left = 204
              Top = 35
              Width = 89
              Height = 21
              DataField = 'DT_AUTORIZACAO'
              DataSource = datm_cliente_servico.ds_cliente_servico
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnChange = dbedt_cd_servicoChange
            end
          end
          object dbedt_cd_banco_deb_cc: TDBEdit
            Left = 8
            Top = 256
            Width = 34
            Height = 21
            DataField = 'CD_BANCO_DEB_CC'
            DataSource = datm_cliente_servico.ds_cliente_servico
            TabOrder = 9
            OnChange = dbedt_cd_servicoChange
            OnExit = dbedt_cd_banco_deb_ccExit
            OnKeyDown = dbedt_cd_servicoKeyDown
          end
          object dbedt_nm_banco_deb_cc: TDBEdit
            Left = 44
            Top = 256
            Width = 325
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookBancoDebCC'
            DataSource = datm_cliente_servico.ds_cliente_servico
            ReadOnly = True
            TabOrder = 10
          end
          object dbedt_cd_banco_com: TDBEdit
            Left = 8
            Top = 291
            Width = 34
            Height = 21
            DataField = 'CD_BANCO_COM'
            DataSource = datm_cliente_servico.ds_cliente_servico
            TabOrder = 11
            OnChange = dbedt_cd_servicoChange
            OnExit = dbedt_cd_banco_comExit
            OnKeyDown = dbedt_cd_servicoKeyDown
          end
          object dbedt_nm_banco_com: TDBEdit
            Left = 44
            Top = 291
            Width = 325
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookBancoCom'
            DataSource = datm_cliente_servico.ds_cliente_servico
            ReadOnly = True
            TabOrder = 12
          end
          object dbedt_cd_banco_deb_com: TDBEdit
            Left = 8
            Top = 327
            Width = 34
            Height = 21
            DataField = 'CD_BANCO_DEB_COM'
            DataSource = datm_cliente_servico.ds_cliente_servico
            TabOrder = 13
            OnChange = dbedt_cd_servicoChange
            OnExit = dbedt_cd_banco_deb_comExit
            OnKeyDown = dbedt_cd_servicoKeyDown
          end
          object dbedt_nm_banco_deb_com: TDBEdit
            Left = 44
            Top = 327
            Width = 325
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookBancoDebCom'
            DataSource = datm_cliente_servico.ds_cliente_servico
            ReadOnly = True
            TabOrder = 14
          end
          object DBCheckBox2: TDBCheckBox
            Left = 8
            Top = 355
            Width = 169
            Height = 17
            Caption = 'Permitir hora nos eventos'
            DataField = 'IN_HORA_EVENTOS'
            DataSource = datm_cliente_servico.ds_cliente_servico
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 15
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbchk_lanca_solicClick
          end
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 756
    Height = 50
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      756
      50)
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
    object btn_sair: TSpeedButton
      Left = 412
      Top = 4
      Width = 38
      Height = 41
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
    object btn_excluir: TSpeedButton
      Left = 118
      Top = 4
      Width = 38
      Height = 41
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
    object pnl_pesquisa: TPanel
      Left = 445
      Top = 2
      Width = 309
      Height = 46
      Align = alRight
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      BorderWidth = 2
      TabOrder = 0
      object shp1: TShape
        Left = 2
        Top = 2
        Width = 305
        Height = 42
        Align = alClient
        Pen.Color = clGray
      end
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
        Transparent = True
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
        Transparent = True
      end
      object edt_chave: TEdit
        Left = 12
        Top = 20
        Width = 129
        Height = 21
        TabStop = False
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
        TabStop = False
      end
    end
    object dbnvg: TDBNavigator
      Left = 300
      Top = 13
      Width = 100
      Height = 25
      DataSource = datm_cliente_servico.ds_cliente_servico
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
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
  object pnlBotoes: TPanel
    Left = 0
    Top = 470
    Width = 756
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btn_numerario: TButton
      Left = 3
      Top = 8
      Width = 90
      Height = 21
      Caption = '&Numer'#225'rio'
      Enabled = False
      TabOrder = 0
      OnClick = btn_numerarioClick
    end
    object btn_armazenagem: TButton
      Left = 111
      Top = 8
      Width = 90
      Height = 21
      Caption = '&Armazenagem'
      Enabled = False
      TabOrder = 1
      OnClick = btn_armazenagemClick
    end
    object btn_faturamento: TButton
      Left = 219
      Top = 8
      Width = 90
      Height = 21
      Caption = '&Faturamento'
      Enabled = False
      TabOrder = 2
      OnClick = btn_faturamentoClick
    end
    object btn_fat_compl: TButton
      Left = 327
      Top = 8
      Width = 90
      Height = 21
      Caption = 'Fat. Itens Compl.'
      Enabled = False
      TabOrder = 3
      Visible = False
      OnClick = btn_fat_complClick
    end
    object btn_itens_por_ton: TButton
      Left = 435
      Top = 8
      Width = 90
      Height = 21
      Caption = '&Itens por Ton'
      Enabled = False
      TabOrder = 4
      Visible = False
      OnClick = btn_itens_por_tonClick
    end
    object btn_repres: TButton
      Left = 543
      Top = 8
      Width = 90
      Height = 21
      Caption = 'Representante'
      TabOrder = 5
      OnClick = btn_represClick
    end
    object btn_duplicacao: TButton
      Left = 651
      Top = 8
      Width = 90
      Height = 21
      Caption = '&Duplica'#231#227'o'
      Enabled = False
      TabOrder = 6
      OnClick = btn_duplicacaoClick
    end
  end
  object menu_cadastro: TMainMenu
    Left = 320
    Top = 240
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
      OnClick = btn_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
