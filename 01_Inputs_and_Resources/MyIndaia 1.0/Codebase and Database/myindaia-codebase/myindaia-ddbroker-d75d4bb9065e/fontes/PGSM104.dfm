object frm_cliente_co: Tfrm_cliente_co
  Left = 81
  Top = 59
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Clientes [Consulta On Line]'
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
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 276
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
    object dbnvg: TDBNavigator
      Left = 152
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_cliente_co.ds_empresa_nac
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      TabOrder = 0
    end
  end
  object pnl_pesquisa: TPanel
    Left = 320
    Top = 0
    Width = 309
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 1
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
  object pgctrl_cliente: TPageControl
    Left = 0
    Top = 52
    Width = 629
    Height = 381
    ActivePage = ts_lista
    TabOrder = 2
    object ts_lista: TTabSheet
      Caption = '    Lista    '
      object dbg_cadastro: TDBGrid
        Left = 4
        Top = 4
        Width = 613
        Height = 345
        DataSource = datm_cliente_co.ds_empresa_nac
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
            FieldName = 'CD_EMPRESA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'NM_EMPRESA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'CalcCNPJ'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'LookCliente'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'LookImportador'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'LookExportador'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'LookRepresentante'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'LookOutros'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '   Dados Básicos   '
      object pnl_entrada_de_dados: TPanel
        Left = 4
        Top = 7
        Width = 613
        Height = 339
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_cd_empresa: TLabel
          Left = 16
          Top = 9
          Width = 40
          Height = 13
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nm_empresa: TLabel
          Left = 66
          Top = 9
          Width = 76
          Height = 13
          Caption = 'Razão Social'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ap_empresa: TLabel
          Left = 424
          Top = 9
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
        object lbl_end_empresa: TLabel
          Left = 16
          Top = 55
          Width = 55
          Height = 13
          Caption = 'Endereço'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_end_numero: TLabel
          Left = 424
          Top = 55
          Width = 44
          Height = 13
          Caption = 'Número'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_end_bairro: TLabel
          Left = 16
          Top = 102
          Width = 34
          Height = 13
          Caption = 'Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_end_cidade: TLabel
          Left = 220
          Top = 102
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
        object lbl_end_uf: TLabel
          Left = 424
          Top = 102
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
        object lbl_end_cep: TLabel
          Left = 484
          Top = 102
          Width = 37
          Height = 13
          Caption = 'C.E.P.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_tipo_pessoa: TLabel
          Left = 16
          Top = 144
          Width = 89
          Height = 13
          Caption = 'Tipo de Pessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cnpj_empresa: TLabel
          Left = 161
          Top = 144
          Width = 48
          Height = 13
          Caption = 'C.N.P.J.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cpf_empresa: TLabel
          Left = 306
          Top = 144
          Width = 36
          Height = 13
          Caption = 'C.P.F.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ie_empresa: TLabel
          Left = 16
          Top = 193
          Width = 105
          Height = 13
          Caption = 'Inscrição estadual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_outro_doc: TLabel
          Left = 161
          Top = 193
          Width = 74
          Height = 13
          Caption = 'Outro Docto.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_dt_inclusao: TLabel
          Left = 306
          Top = 193
          Width = 49
          Height = 13
          Caption = 'Inclusão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_in_faturamento: TLabel
          Left = 16
          Top = 238
          Width = 71
          Height = 13
          Caption = 'Faturamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_grupo: TLabel
          Left = 16
          Top = 283
          Width = 35
          Height = 13
          Caption = 'Grupo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_in_ativo: TLabel
          Left = 161
          Top = 238
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
        object dbedt_cd_empresa: TDBEdit
          Left = 16
          Top = 25
          Width = 41
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_EMPRESA'
          DataSource = datm_cliente_co.ds_empresa_nac
          MaxLength = 5
          ReadOnly = True
          TabOrder = 18
        end
        object dbedt_nm_empresa: TDBEdit
          Left = 66
          Top = 25
          Width = 313
          Height = 21
          DataField = 'NM_EMPRESA'
          DataSource = datm_cliente_co.ds_empresa_nac
          MaxLength = 50
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_ap_empresa: TDBEdit
          Left = 424
          Top = 25
          Width = 73
          Height = 21
          DataField = 'AP_EMPRESA'
          DataSource = datm_cliente_co.ds_empresa_nac
          MaxLength = 10
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_end_empresa: TDBEdit
          Left = 16
          Top = 71
          Width = 313
          Height = 21
          DataField = 'END_EMPRESA'
          DataSource = datm_cliente_co.ds_empresa_nac
          MaxLength = 50
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_end_numero: TDBEdit
          Left = 424
          Top = 71
          Width = 49
          Height = 21
          DataField = 'END_NUMERO'
          DataSource = datm_cliente_co.ds_empresa_nac
          MaxLength = 6
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_end_bairro: TDBEdit
          Left = 16
          Top = 118
          Width = 193
          Height = 21
          DataField = 'END_BAIRRO'
          DataSource = datm_cliente_co.ds_empresa_nac
          MaxLength = 30
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_end_cidade: TDBEdit
          Left = 220
          Top = 118
          Width = 193
          Height = 21
          DataField = 'END_CIDADE'
          DataSource = datm_cliente_co.ds_empresa_nac
          MaxLength = 30
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_end_uf: TDBEdit
          Left = 424
          Top = 118
          Width = 25
          Height = 21
          DataField = 'END_UF'
          DataSource = datm_cliente_co.ds_empresa_nac
          MaxLength = 2
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_end_cep: TDBEdit
          Left = 484
          Top = 118
          Width = 84
          Height = 21
          DataField = 'END_CEP'
          DataSource = datm_cliente_co.ds_empresa_nac
          MaxLength = 8
          ReadOnly = True
          TabOrder = 7
        end
        object dblkpcbox_tipo_pessoa: TDBLookupComboBox
          Left = 16
          Top = 160
          Width = 89
          Height = 21
          DataField = 'CD_TIPO_PESSOA'
          DataSource = datm_cliente_co.ds_empresa_nac
          DropDownRows = 4
          DropDownWidth = 120
          KeyField = 'CD_TIPO_PESSOA'
          ListField = 'NM_TIPO_PESSOA'
          ListSource = datm_cliente_co.ds_tipo_pessoa
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_cnpj_empresa: TDBEdit
          Left = 161
          Top = 160
          Width = 109
          Height = 21
          DataField = 'CGC_EMPRESA'
          DataSource = datm_cliente_co.ds_empresa_nac
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_cpf_empresa: TDBEdit
          Left = 306
          Top = 160
          Width = 85
          Height = 21
          DataField = 'CPF_EMPRESA'
          DataSource = datm_cliente_co.ds_empresa_nac
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_ie_empresa: TDBEdit
          Left = 16
          Top = 209
          Width = 133
          Height = 21
          DataField = 'IE_EMPRESA'
          DataSource = datm_cliente_co.ds_empresa_nac
          MaxLength = 20
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_outro_doc: TDBEdit
          Left = 161
          Top = 209
          Width = 133
          Height = 21
          DataField = 'OUTRO_DOC'
          DataSource = datm_cliente_co.ds_empresa_nac
          MaxLength = 20
          ReadOnly = True
          TabOrder = 12
        end
        object dbedt_dt_inclusao: TDBEdit
          Left = 306
          Top = 209
          Width = 73
          Height = 21
          DataField = 'DT_INCLUSAO'
          DataSource = datm_cliente_co.ds_empresa_nac
          ReadOnly = True
          TabOrder = 13
        end
        object dblkpcbox_in_faturamento: TDBLookupComboBox
          Left = 16
          Top = 254
          Width = 50
          Height = 21
          DataField = 'IN_FATURAMENTO'
          DataSource = datm_cliente_co.ds_empresa_nac
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_cliente_co.ds_yesno
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_cd_grupo: TDBEdit
          Left = 16
          Top = 299
          Width = 45
          Height = 21
          DataField = 'CD_GRUPO'
          DataSource = datm_cliente_co.ds_empresa_nac
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
        end
        object dbedt_nm_grupo: TDBEdit
          Left = 65
          Top = 299
          Width = 185
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookGrupo'
          DataSource = datm_cliente_co.ds_empresa_nac
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
        object Panel2: TPanel
          Left = 424
          Top = 180
          Width = 137
          Height = 149
          TabOrder = 17
          object dbchkbox_in_cliente: TDBCheckBox
            Left = 20
            Top = 12
            Width = 57
            Height = 17
            Caption = 'Cliente'
            DataField = 'IN_CLIENTE'
            DataSource = datm_cliente_co.ds_empresa_nac
            ReadOnly = True
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object dbchkbox_in_importador: TDBCheckBox
            Left = 20
            Top = 30
            Width = 73
            Height = 17
            Caption = 'Importador'
            DataField = 'IN_IMPORTADOR'
            DataSource = datm_cliente_co.ds_empresa_nac
            ReadOnly = True
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object dbchkbox_in_exportador: TDBCheckBox
            Left = 20
            Top = 48
            Width = 81
            Height = 17
            Caption = 'Exportador'
            DataField = 'IN_EXPORTADOR'
            DataSource = datm_cliente_co.ds_empresa_nac
            ReadOnly = True
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object dbchkbox_in_outros: TDBCheckBox
            Left = 20
            Top = 120
            Width = 60
            Height = 17
            Caption = 'Outros'
            DataField = 'IN_OUTROS'
            DataSource = datm_cliente_co.ds_empresa_nac
            ReadOnly = True
            TabOrder = 6
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object dbchkbox_in_representante: TDBCheckBox
            Left = 20
            Top = 66
            Width = 97
            Height = 17
            Caption = 'Representante'
            DataField = 'IN_REPRESENTANTE'
            DataSource = datm_cliente_co.ds_empresa_nac
            ReadOnly = True
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object dbchkbox_in_comprador: TDBCheckBox
            Left = 20
            Top = 102
            Width = 79
            Height = 17
            Caption = 'Comprador'
            DataField = 'IN_COMPRADOR'
            DataSource = datm_cliente_co.ds_empresa_nac
            ReadOnly = True
            TabOrder = 5
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object dbchkbox_in_seguradora: TDBCheckBox
            Left = 20
            Top = 84
            Width = 80
            Height = 17
            Caption = 'Seguradora'
            DataField = 'IN_SEGURADORA'
            DataSource = datm_cliente_co.ds_empresa_nac
            ReadOnly = True
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object dblkpcbox_in_ativo: TDBLookupComboBox
          Left = 161
          Top = 254
          Width = 50
          Height = 21
          DataField = 'IN_ATIVO'
          DataSource = datm_cliente_co.ds_empresa_nac
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_cliente_co.ds_yesno
          ReadOnly = True
          TabOrder = 15
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 28
    Top = 4
    object mi_sair: TMenuItem
      Caption = '&Sair'
      OnClick = btn_sairClick
    end
  end
end
