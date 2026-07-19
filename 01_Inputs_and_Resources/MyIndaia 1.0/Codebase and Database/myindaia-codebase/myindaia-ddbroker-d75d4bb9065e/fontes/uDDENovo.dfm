object frm_dde_novo: Tfrm_dde_novo
  Left = 380
  Top = 225
  Width = 770
  Height = 570
  AlphaBlend = True
  Caption = 
    'DDE - Declara'#231#227'o de Despacho de Exporta'#231#227'o - [M'#243'dulo de Exporta'#231 +
    #227'o]'
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = mnuDDE
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 43
    Width = 754
    Height = 469
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 0
    object pgDDE: TcxPageControl
      Left = 2
      Top = 43
      Width = 750
      Height = 424
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = tabDadosGerais
      LookAndFeel.SkinName = 'UserSkin'
      OnChange = pgDDEChange
      OnPageChanging = pgDDEChanging
      ClientRectBottom = 418
      ClientRectLeft = 3
      ClientRectRight = 744
      ClientRectTop = 26
      object tabListaDE: TcxTabSheet
        Caption = 'Lista'
        ImageIndex = 7
        object cxGroupBox8: TcxGroupBox
          Left = 0
          Top = 0
          Align = alTop
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsFlat
          TabOrder = 0
          DesignSize = (
            741
            41)
          Height = 41
          Width = 741
          object Label92: TLabel
            Left = 15
            Top = 18
            Width = 40
            Height = 13
            Caption = 'Unidade'
          end
          object sb_unidade: TSpeedButton
            Left = 345
            Top = 14
            Width = 24
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
            OnClick = sb_unidadeClick
          end
          object dbtxt_situacao_dde: TDBText
            Left = 609
            Top = 17
            Width = 112
            Height = 13
            Alignment = taRightJustify
            Anchors = [akRight, akBottom]
            AutoSize = True
            DataField = 'TX_STATUS_CAPA'
            DataSource = datm_dde_novo.ds_dde_lista
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edt_unidade: TEdit
            Left = 58
            Top = 14
            Width = 33
            Height = 21
            AutoSize = False
            BevelInner = bvLowered
            BevelKind = bkSoft
            BevelOuter = bvNone
            Color = clGradientInactiveCaption
            MaxLength = 2
            TabOrder = 0
            OnChange = sb_unidadeClick
            OnExit = edt_unidadeExit
          end
          object edt_nome_unidade: TEdit
            Left = 92
            Top = 14
            Width = 252
            Height = 21
            TabStop = False
            AutoSize = False
            BevelInner = bvLowered
            BevelKind = bkSoft
            BevelOuter = bvNone
            Color = clGradientActiveCaption
            ReadOnly = True
            TabOrder = 1
          end
        end
        object cxgbListaDE: TcxGroupBox
          Left = 0
          Top = 41
          Align = alClient
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsFlat
          TabOrder = 1
          DesignSize = (
            741
            351)
          Height = 351
          Width = 741
          object Shape31: TShape
            Left = 314
            Top = 330
            Width = 15
            Height = 15
            Anchors = [akRight, akBottom]
            Pen.Color = clGray
          end
          object Label94: TLabel
            Left = 333
            Top = 331
            Width = 74
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = 'N'#227'o Registrada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Shape32: TShape
            Left = 527
            Top = 330
            Width = 15
            Height = 15
            Anchors = [akRight, akBottom]
            Brush.Color = clMoneyGreen
            Pen.Color = clGray
          end
          object Label95: TLabel
            Left = 546
            Top = 331
            Width = 51
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = 'Registrada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label97: TLabel
            Left = 630
            Top = 331
            Width = 106
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = 'Problemas no Registro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Shape34: TShape
            Left = 612
            Top = 330
            Width = 15
            Height = 15
            Anchors = [akRight, akBottom]
            Brush.Color = 11777023
            Pen.Color = clGray
          end
          object Shape2: TShape
            Left = 418
            Top = 330
            Width = 15
            Height = 15
            Anchors = [akRight, akBottom]
            Brush.Color = clGradientActiveCaption
            Pen.Color = clGray
          end
          object Label2: TLabel
            Left = 437
            Top = 331
            Width = 79
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = 'XML Transmitido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object cxgListaDE: TcxGrid
            Left = 2
            Top = 5
            Width = 737
            Height = 321
            Align = alTop
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            object cxtbListaDE: TcxGridDBTableView
              DataController.DataSource = datm_dde_novo.ds_dde_lista
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.Appending = True
              OptionsView.NoDataToDisplayInfoText = 'Sem Dados'
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              OptionsView.Indicator = True
              OptionsView.IndicatorWidth = 10
              Styles.OnGetContentStyle = cxtbListaDEStylesGetContentStyle
              object cxtbListaDENR_SD_REDUZIDO: TcxGridDBColumn
                Caption = 'Processo'
                DataBinding.FieldName = 'NR_SD_REDUZIDO'
                Width = 93
              end
              object cxtbListaDENM_EXPORTADOR: TcxGridDBColumn
                Caption = 'Exportador'
                DataBinding.FieldName = 'NM_EXPORTADOR'
                Width = 354
              end
              object cxtbListaDENR_REGISTRO_SD: TcxGridDBColumn
                Caption = 'DE'
                DataBinding.FieldName = 'NR_REGISTRO_SD'
                Width = 116
              end
              object cxtbListaDEDT_DATA_SD: TcxGridDBColumn
                Caption = 'Data'
                DataBinding.FieldName = 'DT_DATA_SD'
                Width = 168
              end
              object cxtbListaDEMAX_IDENT_TRANSMISSAO: TcxGridDBColumn
                Caption = 'N'#250'm. Transmiss'#227'o'
                DataBinding.FieldName = 'MAX_IDENT_TRANSMISSAO'
                Width = 120
              end
              object cxtbListaDECD_STATUS: TcxGridDBColumn
                Caption = 'Status'
                DataBinding.FieldName = 'CD_STATUS'
                Width = 50
              end
            end
            object cxlListaDE: TcxGridLevel
              GridView = cxtbListaDE
            end
          end
          object cxdbchk_exibir_tudo: TcxCheckBox
            Left = 0
            Top = 328
            Anchors = [akLeft, akBottom]
            Caption = 'Exibir todos os processos'
            Style.BorderStyle = ebsSingle
            TabOrder = 1
            OnClick = cxdbchk_exibir_tudoClick
            Width = 153
          end
        end
      end
      object tabDadosGerais: TcxTabSheet
        Caption = 'Dados Gerais'
        ImageIndex = 4
        object Label91: TLabel
          Left = 209
          Top = 24
          Width = 15
          Height = 13
          Caption = 'DE'
        end
        object cxdbrgTipoOperacao: TcxDBRadioGroup
          Left = 0
          Top = 82
          Align = alTop
          Caption = 'Tipo de Opera'#231#227'o'
          DataBinding.DataField = 'TP_OPERACAO'
          DataBinding.DataSource = datm_dde_novo.ds_dde
          Properties.DefaultValue = 1
          Properties.Items = <
            item
              Caption = 'Normal'
              Value = 1
            end>
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsFlat
          TabOrder = 0
          Height = 50
          Width = 741
        end
        object cxdbrgLocalDespacho: TcxDBRadioGroup
          Left = 0
          Top = 132
          Align = alTop
          Caption = 'Local de Despacho da Opera'#231#227'o Normal'
          DataBinding.DataField = 'TP_DETALHE_OPERACAO'
          DataBinding.DataSource = datm_dde_novo.ds_dde
          Properties.Columns = 4
          Properties.DefaultValue = 1
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Caption = 'Recinto Alf'#226'ndegado'
              Value = 1
            end
            item
              Caption = 'REDEX'
              Value = 2
            end
            item
              Caption = 'Estabelecimento do Exportador'
              Value = 3
            end
            item
              Caption = 'Situa'#231#245'es Especiais'
              Value = 9
            end>
          Properties.OnEditValueChanged = cxdbrgLocalDespachoPropertiesEditValueChanged
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsFlat
          TabOrder = 1
          Height = 53
          Width = 741
        end
        object cxgbTransporte: TcxGroupBox
          Left = 0
          Top = 337
          Align = alTop
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsFlat
          TabOrder = 5
          Height = 75
          Width = 741
          object Label57: TLabel
            Left = 8
            Top = 12
            Width = 81
            Height = 13
            Caption = 'UL de Despacho'
          end
          object Label58: TLabel
            Left = 205
            Top = 12
            Width = 80
            Height = 13
            Caption = 'UL de Embarque'
          end
          object Label59: TLabel
            Left = 400
            Top = 12
            Width = 84
            Height = 13
            Caption = 'Via de Transporte'
          end
          object cxdblcUlDespacho: TcxDBLookupComboBox
            Left = 8
            Top = 27
            DataBinding.DataField = 'CD_URF_DESPACHO'
            DataBinding.DataSource = datm_dde_novo.ds_dde
            Properties.CharCase = ecUpperCase
            Properties.KeyFieldNames = 'CODIGO'
            Properties.ListColumns = <
              item
                FieldName = 'TEXTO'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = datm_dde_novo.ds_urf
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = clInfoBk
            StyleFocused.Color = clInfoBk
            StyleHot.Color = clInfoBk
            TabOrder = 0
            Width = 190
          end
          object cxdblcUlEmbarque: TcxDBLookupComboBox
            Left = 204
            Top = 27
            DataBinding.DataField = 'CD_URF_EMBARQUE'
            DataBinding.DataSource = datm_dde_novo.ds_dde
            Properties.CharCase = ecUpperCase
            Properties.KeyFieldNames = 'CODIGO'
            Properties.ListColumns = <
              item
                FieldName = 'TEXTO'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = datm_dde_novo.ds_urf
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = clInfoBk
            StyleFocused.Color = clInfoBk
            StyleHot.Color = clInfoBk
            TabOrder = 1
            Width = 190
          end
          object cxdblcViaTransporte: TcxDBLookupComboBox
            Left = 400
            Top = 27
            DataBinding.DataField = 'CD_VIA_TRANSPORTE'
            DataBinding.DataSource = datm_dde_novo.ds_dde
            Properties.CharCase = ecUpperCase
            Properties.KeyFieldNames = 'CODIGO'
            Properties.ListColumns = <
              item
                FieldName = 'TEXTO'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = datm_dde_novo.ds_via_transporte
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = clInfoBk
            StyleFocused.Color = clInfoBk
            StyleHot.Color = clInfoBk
            TabOrder = 2
            Width = 190
          end
          object cxDBCheckBox1: TcxDBCheckBox
            Left = 597
            Top = 27
            Caption = 'Ser'#225' realizado tr'#226'nsito?'
            DataBinding.DataField = 'IN_REALIZA_TRANSITO'
            DataBinding.DataSource = datm_dde_novo.ds_dde
            ParentColor = False
            Properties.NullStyle = nssUnchecked
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = clBtnFace
            StyleHot.Color = clBtnFace
            TabOrder = 3
            Width = 137
          end
        end
        object cxgbEstExportador: TcxGroupBox
          Left = 0
          Top = 233
          Align = alTop
          Caption = 
            'Solicita'#231#227'o de Despacho em Estabelecimento Indicado pelo Exporta' +
            'dor'
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsFlat
          TabOrder = 4
          Height = 104
          Width = 741
          object Label60: TLabel
            Left = 8
            Top = 20
            Width = 165
            Height = 13
            Caption = 'Per'#237'odo proposto para confer'#234'ncia'
          end
          object Label61: TLabel
            Left = 8
            Top = 59
            Width = 46
            Height = 13
            Caption = 'Endere'#231'o'
          end
          object Label62: TLabel
            Left = 377
            Top = 20
            Width = 55
            Height = 13
            Caption = 'Justificativa'
          end
          object Label63: TLabel
            Left = 378
            Top = 61
            Width = 58
            Height = 13
            Caption = 'Observa'#231#227'o'
          end
          object dbedt_periodo: TDBEdit
            Left = 8
            Top = 36
            Width = 305
            Height = 19
            Color = clInfoBk
            DataField = 'NM_PERIODO_CONFERENCIA'
            DataSource = datm_dde_novo.ds_dde
            TabOrder = 0
            OnClick = dbedt_ele_chave_acessoEnter
            OnEnter = dbedt_ele_chave_acessoEnter
          end
          object dbedt_endereco: TDBEdit
            Left = 8
            Top = 76
            Width = 305
            Height = 19
            Color = clInfoBk
            DataField = 'END_CONFERENCIA'
            DataSource = datm_dde_novo.ds_dde
            TabOrder = 2
            OnClick = dbedt_ele_chave_acessoEnter
            OnEnter = dbedt_ele_chave_acessoEnter
          end
          object dbedt_justificativa: TDBEdit
            Left = 377
            Top = 36
            Width = 314
            Height = 19
            Color = clInfoBk
            DataField = 'NM_JUSTIFICATIVA_CONFERENCIA'
            DataSource = datm_dde_novo.ds_dde
            TabOrder = 1
            OnClick = dbedt_ele_chave_acessoEnter
            OnEnter = dbedt_ele_chave_acessoEnter
          end
          object dbedt_obs: TDBEdit
            Left = 377
            Top = 76
            Width = 314
            Height = 19
            Color = clInfoBk
            DataField = 'TX_OBS_CONFERENCIA'
            DataSource = datm_dde_novo.ds_dde
            TabOrder = 3
            OnClick = dbedt_ele_chave_acessoEnter
            OnEnter = dbedt_ele_chave_acessoEnter
          end
        end
        object cxgbSituacoesEspeciais: TcxGroupBox
          Left = 0
          Top = 185
          Align = alTop
          Caption = 'Situa'#231#245'es Especiais'
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsFlat
          TabOrder = 2
          Height = 48
          Width = 741
          object cxdblcSituacoesEspeciais: TcxDBLookupComboBox
            Left = 10
            Top = 18
            DataBinding.DataField = 'CD_TP_SITUACOES_ESPECIAIS'
            DataBinding.DataSource = datm_dde_novo.ds_dde
            Properties.CharCase = ecUpperCase
            Properties.KeyFieldNames = 'CODIGO'
            Properties.ListColumns = <
              item
                FieldName = 'TEXTO'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = datm_dde_novo.ds_situacoes_especiais
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = clInfoBk
            TabOrder = 0
            Width = 263
          end
        end
        object cxGroupBox4: TcxGroupBox
          Left = 0
          Top = 0
          Align = alTop
          Caption = 'Informa'#231#245'es Gerais'
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsFlat
          TabOrder = 3
          DesignSize = (
            741
            82)
          Height = 82
          Width = 741
          object Label86: TLabel
            Left = 70
            Top = 33
            Width = 64
            Height = 13
            Caption = 'Despachante'
          end
          object Label87: TLabel
            Left = 79
            Top = 57
            Width = 51
            Height = 13
            Caption = 'Exportador'
          end
          object sb_exportador: TSpeedButton
            Left = 641
            Top = 50
            Width = 22
            Height = 22
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
            OnClick = sb_exportadorClick
          end
          object sb_despachante: TSpeedButton
            Left = 641
            Top = 26
            Width = 22
            Height = 22
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
            Visible = False
            OnClick = sb_despachanteClick
          end
          object dbedt_exportador: TDBEdit
            Left = 140
            Top = 53
            Width = 51
            Height = 19
            AutoSize = False
            Color = clInfoBk
            DataField = 'CD_EXPORTADOR'
            DataSource = datm_dde_novo.ds_dde
            TabOrder = 2
            OnChange = sb_exportadorClick
            OnExit = dbedt_exportadorExit
          end
          object edt_nome_exportador: TEdit
            Left = 194
            Top = 53
            Width = 337
            Height = 19
            TabStop = False
            AutoSize = False
            Color = clSilver
            ReadOnly = True
            TabOrder = 1
          end
          object mskedt_cnpj_exportador: TMaskEdit
            Left = 533
            Top = 53
            Width = 107
            Height = 19
            TabStop = False
            AutoSize = False
            Color = clSilver
            EditMask = '99.999.999/9999-99;0;_'
            MaxLength = 18
            ReadOnly = True
            TabOrder = 3
          end
          object edt_nome_despachante: TEdit
            Left = 239
            Top = 29
            Width = 401
            Height = 19
            TabStop = False
            AutoSize = False
            Color = clSilver
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object dbedt_despachante: TDBEdit
            Left = 140
            Top = 29
            Width = 96
            Height = 19
            AutoSize = False
            Color = clInfoBk
            DataField = 'CPF_USUARIO'
            DataSource = datm_dde_novo.ds_dde
            Enabled = False
            TabOrder = 0
            OnChange = sb_despachanteClick
          end
          object cxdbchk_externa: TcxDBCheckBox
            Left = 636
            Top = 5
            Anchors = [akTop, akRight]
            Caption = 'DE feita por fora'
            DataBinding.DataField = 'IN_EXTERNA'
            DataBinding.DataSource = datm_dde_novo.ds_dde
            ParentColor = False
            ParentFont = False
            Properties.DisplayGrayed = 'False'
            Properties.NullStyle = nssUnchecked
            Style.BorderColor = clNavy
            Style.BorderStyle = ebsSingle
            Style.Color = clBtnFace
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TextColor = clNavy
            Style.IsFontAssigned = True
            StyleHot.Color = clBtnFace
            TabOrder = 5
            OnClick = cxdbchk_externaClick
            Width = 102
          end
          object cxdbchk_consulta: TcxDBCheckBox
            Left = 527
            Top = 5
            Anchors = [akTop, akRight]
            Caption = 'Consultar Status'
            DataBinding.DataField = 'IN_CONSULTA_STATUS'
            DataBinding.DataSource = datm_dde_novo.ds_dde
            ParentColor = False
            ParentFont = False
            Properties.DisplayGrayed = 'False'
            Properties.NullStyle = nssUnchecked
            Style.BorderColor = clGreen
            Style.BorderStyle = ebsSingle
            Style.Color = clBtnFace
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TextColor = clGreen
            Style.IsFontAssigned = True
            StyleHot.Color = clBtnFace
            TabOrder = 6
            Width = 102
          end
        end
      end
      object tabAdicoes: TcxTabSheet
        Caption = 'Adi'#231#245'es'
        ImageIndex = 5
        object cxgbRE: TcxGroupBox
          Left = 0
          Top = 0
          Align = alTop
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsFlat
          TabOrder = 0
          DesignSize = (
            741
            81)
          Height = 81
          Width = 741
          object Label65: TLabel
            Left = 9
            Top = 20
            Width = 196
            Height = 13
            Caption = 'Total do Peso L'#237'quido do Despacho (KG)'
          end
          object Label67: TLabel
            Left = 236
            Top = 19
            Width = 288
            Height = 13
            Caption = 'Total Condi'#231#227'o de Venda do Despacho (Moeda Negociada) '
          end
          object Label68: TLabel
            Left = 639
            Top = 61
            Width = 90
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = 'Valores Calculados'
          end
          object dbedt_peso_liquido: TDBEdit
            Left = 9
            Top = 34
            Width = 201
            Height = 19
            Color = clMoneyGreen
            DataField = 'VL_TOTAL_PESO_LIQUIDO'
            DataSource = datm_dde_novo.ds_dde
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_vl_cond_venda: TDBEdit
            Left = 237
            Top = 34
            Width = 300
            Height = 19
            Color = clMoneyGreen
            DataField = 'VL_TOTAL_COND_VENDA'
            DataSource = datm_dde_novo.ds_dde
            ReadOnly = True
            TabOrder = 1
          end
          object Panel3: TPanel
            Left = 619
            Top = 60
            Width = 15
            Height = 15
            Anchors = [akRight, akBottom]
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Color = clMoneyGreen
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 2
          end
        end
        object cxGroupBox1: TcxGroupBox
          Left = 0
          Top = 291
          Align = alClient
          Caption = 'Mercadoria Perigosa'
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsFlat
          TabOrder = 1
          Height = 101
          Width = 741
          object cxGroupBox6: TcxGroupBox
            Left = 2
            Top = 18
            Align = alTop
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsNone
            TabOrder = 0
            Height = 2
            Width = 737
          end
          object cxgMercPerigosa: TcxGrid
            Left = 2
            Top = 20
            Width = 737
            Height = 79
            Align = alClient
            TabOrder = 1
            object cxtbMercPerigosa: TcxGridDBTableView
              DataController.DataSource = datm_dde_novo.ds_dde_merc_perigosa
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.CellHints = True
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsView.NoDataToDisplayInfoText = 'Sem Dados'
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object cxtbMercPerigosaNR_RE_SISCOMEX: TcxGridDBColumn
                Caption = 'N'#250'mero do RE'
                DataBinding.FieldName = 'NR_RE_SISCOMEX'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.ReadOnly = True
                Styles.Content = cxsRegistroRE
                Width = 104
              end
              object cxtbMercPerigosaNR_ANEXO: TcxGridDBColumn
                Caption = 'Anexo'
                DataBinding.FieldName = 'NR_ANEXO'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.ReadOnly = True
                Styles.Content = cxsAnexos
                Width = 70
              end
              object cxtbMercPerigosaNM_CLASSE: TcxGridDBColumn
                Caption = 'Classe'
                DataBinding.FieldName = 'NM_CLASSE'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.ReadOnly = True
                Width = 157
              end
              object cxtbMercPerigosaNM_INDICADOR: TcxGridDBColumn
                Caption = 'C'#243'digo Indicador'
                DataBinding.FieldName = 'NM_INDICADOR'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.ReadOnly = True
                Width = 300
              end
              object cxtbMercPerigosaNM_TIPO_CARGA: TcxGridDBColumn
                Caption = 'Tipo de Carga'
                DataBinding.FieldName = 'NM_TIPO_CARGA'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.ReadOnly = True
                Width = 84
              end
              object cxtbMercPerigosaIN_EXCLUIR: TcxGridDBColumn
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Default = True
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FDFDFDD9D9D9
                      C5B0826756315B4C2A64542E64542E604F2B5B4C2A5748275245254E41245C4E
                      2CB5A274CBCBCBFDFDFDFFFFFFFFFFFF7E663098804CC2AB76D5C296D6C499CE
                      BA8CC6B180BBA573B09965A28A55816E4482692EFFFFFFFFFFFFFFFFFFFFFFFF
                      685325B69A5BA08C5FCFC2A6F2E5C7A99973C2B390DECCA28F7946AB986FC4B5
                      93665225FFFFFFFFFFFFFFFFFFFFFFFF6A5526BEA05C907D51E1CD9FF4E8CD98
                      8864CEB479E2D2AC7E6938A78944CFC2A4685326FFFFFFFFFFFFFFFFFFFFFFFF
                      6B5628BFA15B907D51EDD59DF4E8CD988864D6B66EE2D2AC7E6938A78331D0C3
                      A5695427FFFFFFFFFFFFFFFFFFFFFFFF6C5829BFA15B907D51EDD59DF4E8CD98
                      8864D6B66EE2D2AC7E6938A78331CFC2A46A5629FFFFFFFFFFFFFFFFFFFFFFFF
                      6E592ABFA15B907D51EDD59DF4E8CD988864D6B66EE2D2AC7E6938A78331D0C2
                      A46C5729FFFFFFFFFFFFFFFFFFFFFFFF6F5A2CBFA15B907D51EDD59DF4E8CD98
                      8864D6B66EE2D2AC7E6938A78331D0C3A56D592CFFFFFFFFFFFFFFFFFFFFFFFF
                      715C2DBFA15B907D51EDD59DF4E8CD988864D6B66EE2D2AC7E6938A78331D0C3
                      A56F5A2CFFFFFFFFFFFFFFFFFFFFFFFF725D2FBFA15B907D51E1CD9FF4E8CD98
                      8864CEB479E2D2AC7E6938A78944D1C3A5705B2EFFFFFFFFFFFFFFFFFFFFFFFF
                      735F30AB925A93825DC6BDA6EBE0C89D9072B8AB8FD3C4A2806E459F906FBCB0
                      95715D2FFFFFFFFFFFFFFFFFFF7760307C663489703A987D3FA285439D804097
                      7A3E90753C88703A816B387B65357460336F5C31876B2FFFFFFFFFFFFF6D582B
                      B19557B58926BF890ECD9412C68F11BC870EB4810CA978099F7106976B089A75
                      21A58E576D582CFFFFFFFFFFFF9F8449998455C7AD74D5B978DDC07CD8BC79D3
                      B778CEB375C7AE74C2AA72BDA570B5A06F85734AB19353FFFFFFFFFFFFFBF4E6
                      AD92539A7E40A68947B0914A9A7E40947A3E8E753C88713A92783E8D743B876E
                      38A88D54F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6B77099
                      7D40997D40D6B770FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    Hint = 'Excluir Carga Perigosa'
                    Kind = bkGlyph
                  end>
                Properties.OnButtonClick = cxtbMercPerigosaIN_EXCLUIRPropertiesButtonClick
                Options.ShowEditButtons = isebAlways
                Options.HorzSizing = False
                Width = 20
              end
            end
            object cxlMercPerigosa: TcxGridLevel
              GridView = cxtbMercPerigosa
            end
          end
        end
        object cxGroupBox16: TcxGroupBox
          Left = 0
          Top = 81
          Align = alTop
          Caption = 'RE'
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsFlat
          TabOrder = 2
          Height = 210
          Width = 741
          object cxGroupBox17: TcxGroupBox
            Left = 2
            Top = 18
            Align = alTop
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsNone
            TabOrder = 0
            Height = 3
            Width = 737
          end
          object cxRE: TcxGrid
            Left = 2
            Top = 21
            Width = 737
            Height = 187
            Align = alClient
            TabOrder = 1
            object cxtbRE: TcxGridDBTableView
              OnKeyDown = cxtbREKeyDown
              DataController.DataSource = datm_dde_novo.ds_dde_re
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.CellHints = True
              OptionsBehavior.FocusCellOnTab = True
              OptionsData.Appending = True
              OptionsData.CancelOnExit = False
              OptionsView.NoDataToDisplayInfoText = 'Sem Dados'
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object cxtbRENR_REGISTRO_RE: TcxGridDBColumn
                Caption = 'N'#250'mero do RE'
                DataBinding.FieldName = 'NR_RE_SISCOMEX'
                Styles.Content = cxsRegistroRE
                Width = 189
              end
              object cxtbRENR_ANEXO_INICIAL: TcxGridDBColumn
                Caption = 'In'#237'cio'
                DataBinding.FieldName = 'NR_ANEXO_INICIAL'
                Styles.Content = cxsAnexos
                Width = 75
              end
              object cxtbRENR_ANEXO_FINAL: TcxGridDBColumn
                Caption = 'Fim'
                DataBinding.FieldName = 'NR_ANEXO_FINAL'
                Styles.Content = cxsAnexos
                Width = 65
              end
              object cxtbREVL_SOMA_COND_VENDA: TcxGridDBColumn
                Caption = 'Valor'
                DataBinding.FieldName = 'VL_SOMA_COND_VENDA'
                Width = 159
              end
              object cxtbREVL_SOMA_PESO_LIQUIDO: TcxGridDBColumn
                Caption = 'Peso'
                DataBinding.FieldName = 'VL_SOMA_PESO_LIQUIDO'
                Width = 103
              end
              object cxtbREIN_MERCADORIA_PERIGOSA: TcxGridDBColumn
                Caption = 'Informar Mercadoria Perigosa'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Properties.Buttons = <
                  item
                    Default = True
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E000000000000000000006868AD020294
                      00009F00009F00009F00009F00009F00009F00009F00009F00009F00009F0000
                      9F00009F0202946868AD0101990000D10000D60000D60000D60000D60000D600
                      00D60000D60000D60000D60000D60000D60000D60000D10101991414800000C4
                      9393E6F2F2F2F1F1F1F0F0F0EFEFEFEEEEEEEEEEEEEFEFEFF0F0F0F1F1F1F2F2
                      F29393E60000C41414809C9CC80606972F2FDCECECF0F0F0F0EFEFEFEEEEEE5A
                      5A5A5A5A5AEEEEEEEFEFEFF0F0F0ECECF02F2FDC0606979C9CC8FCFCFD0D0D91
                      0000C0A4A4E7EFEFEFEEEEEEEDEDED434343434343EDEDEDEEEEEEEFEFEFA4A4
                      E70000C00D0D91FCFCFDFFFFFFA7A7CE0606953333DCEAEAEDEDEDEDECECECE1
                      E1E1E1E1E1ECECECEDEDEDEAEAED3333DC060695A7A7CEFFFFFFFFFFFFFEFEFE
                      2222880000BCA7A7E5ECECECEBEBEB686868686868EBEBEBECECECA7A7E50000
                      BC222288FEFEFEFFFFFFFFFFFFFFFFFFB2B2D40606933939DBE8E8EAEAEAEA5B
                      5B5B5B5B5BEAEAEAE8E8EA3939DB060693B2B2D4FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFF2A2A8D0000B8AAAAE4E9E9E94D4D4D4D4D4DE9E9E9AAAAE40000B82A2A
                      8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCD90606913C3CDAE7E7E840
                      4040404040E7E7E83C3CDA060691BCBCD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF3434930101B4ABABE2313131313131ABABE20101B4343493FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5DE05058E4141D9E5
                      E5E5E5E5E54141D905058EC5C5DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFF3F3F990101AFAEAEE1AEAEE10101AF3F3F99FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECEE405058D29
                      29D71414BB05058DCECEE4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFF4A4A9E02029F02029F4A4A9EFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7F249
                      499D49499DE7E7F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    Hint = 'Informar Mercadoria Perigosa'
                    Kind = bkGlyph
                  end>
                Properties.OnButtonClick = cxtbREIN_MERCADORIA_PERIGOSAPropertiesButtonClick
                MinWidth = 144
                Options.ShowEditButtons = isebAlways
                Width = 144
              end
            end
            object cxlRE: TcxGridLevel
              GridView = cxtbRE
            end
          end
        end
      end
      object tabDocsInstrutivos: TcxTabSheet
        Caption = 'Documentos Instrutivos'
        ImageIndex = 6
        object pgDocsInstrutivos: TcxPageControl
          Left = 0
          Top = 0
          Width = 741
          Height = 392
          Align = alClient
          TabOrder = 0
          Properties.ActivePage = tabNotasFiscais
          LookAndFeel.SkinName = 'UserSkin'
          OnChange = pgDocsInstrutivosChange
          OnPageChanging = pgDocsInstrutivosPageChanging
          ClientRectBottom = 386
          ClientRectLeft = 3
          ClientRectRight = 735
          ClientRectTop = 26
          object tabNotasFiscais: TcxTabSheet
            Caption = 'Notas Fiscais'
            ImageIndex = 0
            object cxgbNotasFiscais: TcxGroupBox
              Left = 0
              Top = 0
              Align = alClient
              Style.BorderColor = clBlack
              Style.BorderStyle = ebsNone
              TabOrder = 0
              Transparent = True
              Height = 360
              Width = 732
              object cxgbObrigatoria: TcxGroupBox
                Left = 2
                Top = 69
                Align = alClient
                Style.BorderColor = clBlack
                Style.BorderStyle = ebsFlat
                TabOrder = 1
                Height = 289
                Width = 728
                object Label108: TLabel
                  Left = 2
                  Top = 5
                  Width = 724
                  Height = 15
                  Align = alTop
                  AutoSize = False
                  Transparent = True
                end
                object pgNF: TcxPageControl
                  Left = 2
                  Top = 20
                  Width = 724
                  Height = 267
                  Align = alClient
                  TabOrder = 0
                  Properties.ActivePage = tabEletronica
                  LookAndFeel.Kind = lfUltraFlat
                  LookAndFeel.SkinName = 'UserSkin'
                  OnChange = pgNFChange
                  ClientRectBottom = 261
                  ClientRectLeft = 3
                  ClientRectRight = 718
                  ClientRectTop = 26
                  object tabEletronica: TcxTabSheet
                    Caption = 'Eletr'#244'nica'
                    ImageIndex = 0
                    object cxNFE: TcxGrid
                      Left = 0
                      Top = 65
                      Width = 715
                      Height = 170
                      Align = alClient
                      TabOrder = 0
                      object cxtbNFE: TcxGridDBTableView
                        DataController.DataSource = datm_dde_novo.ds_dde_nota_fiscal
                        DataController.Summary.DefaultGroupSummaryItems = <>
                        DataController.Summary.FooterSummaryItems = <>
                        DataController.Summary.SummaryGroups = <>
                        OptionsData.Appending = True
                        OptionsData.Deleting = False
                        OptionsData.Editing = False
                        OptionsData.Inserting = False
                        OptionsView.NoDataToDisplayInfoText = 'Sem Dados'
                        OptionsView.ColumnAutoWidth = True
                        OptionsView.GroupByBox = False
                        object cxtbNFENM_TP_NF: TcxGridDBColumn
                          Caption = 'Tipo'
                          DataBinding.FieldName = 'NM_TP_NF'
                          PropertiesClassName = 'TcxTextEditProperties'
                          Properties.ReadOnly = False
                          Visible = False
                          Styles.Content = cxsProblemas
                          Width = 62
                        end
                        object cxtbNFEANO_EMISSAO_NF: TcxGridDBColumn
                          Caption = 'Ano de Emiss'#227'o da NF'
                          DataBinding.FieldName = 'ANO_EMISSAO_NF'
                          Visible = False
                          Width = 112
                        end
                        object cxtbNFENR_SERIE_NF: TcxGridDBColumn
                          Caption = 'S'#233'rie'
                          DataBinding.FieldName = 'NR_SERIE_NF'
                          Visible = False
                          Width = 73
                        end
                        object cxtbNFENR_CHAVE_ACESSO: TcxGridDBColumn
                          Caption = 'Chave do Acesso'
                          DataBinding.FieldName = 'NR_CHAVE_ACESSO'
                          Styles.Content = cxsRegistroRE
                          Width = 290
                        end
                        object cxtbNFENR_NF: TcxGridDBColumn
                          Caption = 'N'#250'mero da Nota'
                          DataBinding.FieldName = 'NR_NF'
                          Visible = False
                          Styles.Content = cxsRegistroRE
                          Width = 127
                        end
                        object cxtbNFECGC_EMPRESA_NF: TcxGridDBColumn
                          Caption = 'CNPJ do Emitente'
                          DataBinding.FieldName = 'CGC_EMPRESA_NF'
                          PropertiesClassName = 'TcxMaskEditProperties'
                          Properties.EditMask = '00.000.000/0000-00;1;_'
                          Visible = False
                          Width = 111
                        end
                      end
                      object cxlNFE: TcxGridLevel
                        GridView = cxtbNFE
                      end
                    end
                    object cxGroupBox13: TcxGroupBox
                      Left = 0
                      Top = 0
                      Align = alTop
                      Style.BorderStyle = ebsNone
                      TabOrder = 1
                      Height = 65
                      Width = 715
                      object Label73: TLabel
                        Left = 8
                        Top = 15
                        Width = 83
                        Height = 13
                        Caption = 'Chave de acesso'
                        Transparent = True
                      end
                      object dbedt_ele_chave_acesso: TDBEdit
                        Left = 8
                        Top = 30
                        Width = 548
                        Height = 19
                        Color = clInfoBk
                        DataField = 'NR_CHAVE_ACESSO'
                        DataSource = datm_dde_novo.ds_dde_nota_fiscal
                        TabOrder = 0
                        OnClick = dbedt_ele_chave_acessoEnter
                        OnEnter = dbedt_ele_chave_acessoEnter
                      end
                    end
                  end
                  object tabFormulario: TcxTabSheet
                    Caption = 'Formul'#225'rio'
                    ImageIndex = 1
                    object cxgNF: TcxGrid
                      Left = 0
                      Top = 105
                      Width = 715
                      Height = 130
                      Align = alClient
                      TabOrder = 0
                      object cxtbNF: TcxGridDBTableView
                        DataController.DataSource = datm_dde_novo.ds_dde_nota_fiscal
                        DataController.Summary.DefaultGroupSummaryItems = <>
                        DataController.Summary.FooterSummaryItems = <>
                        DataController.Summary.SummaryGroups = <>
                        OptionsData.CancelOnExit = False
                        OptionsData.Deleting = False
                        OptionsData.DeletingConfirmation = False
                        OptionsData.Editing = False
                        OptionsData.Inserting = False
                        OptionsView.NoDataToDisplayInfoText = 'Sem Dados'
                        OptionsView.ColumnAutoWidth = True
                        OptionsView.GroupByBox = False
                        object cxtbNFCD_TP_NF: TcxGridDBColumn
                          Caption = 'Tipo'
                          DataBinding.FieldName = 'CD_TP_NF'
                          Visible = False
                          Styles.Content = cxsProblemas
                          Width = 62
                        end
                        object cxtbNFANO_EMISSAO_NF: TcxGridDBColumn
                          Caption = 'Ano de Emiss'#227'o da NF'
                          DataBinding.FieldName = 'ANO_EMISSAO_NF'
                          Width = 127
                        end
                        object cxtbNFNR_SERIE_NF: TcxGridDBColumn
                          Caption = 'S'#233'rie'
                          DataBinding.FieldName = 'NR_SERIE_NF'
                          Width = 56
                        end
                        object cxtbNFNR_NF: TcxGridDBColumn
                          Caption = 'N'#250'mero da Nota/Faixa de Notas'
                          DataBinding.FieldName = 'NR_NF'
                          Styles.Content = cxsRegistroRE
                          Width = 271
                        end
                        object cxtbNFCGC_EMPRESA_NF: TcxGridDBColumn
                          Caption = 'CNPJ do Emitente'
                          DataBinding.FieldName = 'CGC_EMPRESA_NF'
                          PropertiesClassName = 'TcxMaskEditProperties'
                          Properties.EditMask = '00.000.000/0000-00;1;_'
                          Width = 259
                        end
                      end
                      object cxlNF: TcxGridLevel
                        GridView = cxtbNF
                      end
                    end
                    object cxGroupBox3: TcxGroupBox
                      Left = 0
                      Top = 0
                      Align = alTop
                      Style.BorderStyle = ebsNone
                      TabOrder = 1
                      Height = 105
                      Width = 715
                      object Label79: TLabel
                        Left = 12
                        Top = 16
                        Width = 197
                        Height = 13
                        Caption = 'CNPJ do estabelecimento emitente da NF'
                        Transparent = True
                      end
                      object Label80: TLabel
                        Left = 12
                        Top = 56
                        Width = 108
                        Height = 13
                        Caption = 'Ano de Emiss'#227'o da NF'
                        Transparent = True
                      end
                      object Label81: TLabel
                        Left = 140
                        Top = 56
                        Width = 24
                        Height = 13
                        Caption = 'S'#233'rie'
                        Transparent = True
                      end
                      object lblCNPJForm: TLabel
                        Left = 17
                        Top = 33
                        Width = 18
                        Height = 13
                        Caption = '      '
                      end
                      object dbedt_form_ano_emissao: TDBEdit
                        Left = 12
                        Top = 70
                        Width = 108
                        Height = 19
                        DataField = 'ANO_EMISSAO_NF'
                        DataSource = datm_dde_novo.ds_dde_nota_fiscal
                        TabOrder = 1
                        OnClick = dbedt_ele_chave_acessoEnter
                        OnEnter = dbedt_ele_chave_acessoEnter
                      end
                      object dbedt_form_serie: TDBEdit
                        Left = 140
                        Top = 70
                        Width = 73
                        Height = 19
                        DataField = 'NR_SERIE_NF'
                        DataSource = datm_dde_novo.ds_dde_nota_fiscal
                        TabOrder = 2
                        OnClick = dbedt_ele_chave_acessoEnter
                        OnEnter = dbedt_ele_chave_acessoEnter
                      end
                      object cxGroupBox5: TcxGroupBox
                        Left = 227
                        Top = 15
                        Caption = 'Por N'#250'mero'
                        Style.BorderColor = clBlack
                        Style.BorderStyle = ebsFlat
                        TabOrder = 3
                        Transparent = True
                        Height = 76
                        Width = 182
                        object Label83: TLabel
                          Left = 8
                          Top = 27
                          Width = 37
                          Height = 13
                          Caption = 'N'#250'mero'
                        end
                        object dbedt_form_numero: TDBEdit
                          Left = 8
                          Top = 42
                          Width = 161
                          Height = 19
                          DataField = 'NR_NF'
                          DataSource = datm_dde_novo.ds_dde_nota_fiscal
                          TabOrder = 0
                          OnClick = dbedt_ele_chave_acessoEnter
                          OnEnter = dbedt_ele_chave_acessoEnter
                        end
                      end
                      object cxGroupBox14: TcxGroupBox
                        Left = 412
                        Top = 15
                        Caption = 'Por Faixa'
                        Style.BorderColor = clBlack
                        Style.BorderStyle = ebsFlat
                        TabOrder = 4
                        Transparent = True
                        Height = 76
                        Width = 193
                        object Label84: TLabel
                          Left = 8
                          Top = 27
                          Width = 14
                          Height = 13
                          Caption = 'De'
                        end
                        object Label85: TLabel
                          Left = 102
                          Top = 27
                          Width = 16
                          Height = 13
                          Caption = 'At'#233
                        end
                        object dbedt_form_nf_inicial: TDBEdit
                          Left = 8
                          Top = 42
                          Width = 65
                          Height = 19
                          DataField = 'NR_NF_INICIAL'
                          DataSource = datm_dde_novo.ds_dde_nota_fiscal
                          TabOrder = 0
                          OnClick = dbedt_ele_chave_acessoEnter
                          OnEnter = dbedt_ele_chave_acessoEnter
                        end
                        object dbedt_form_nf_final: TDBEdit
                          Left = 102
                          Top = 42
                          Width = 65
                          Height = 19
                          DataField = 'NR_NF_FINAL'
                          DataSource = datm_dde_novo.ds_dde_nota_fiscal
                          TabOrder = 1
                          OnClick = dbedt_ele_chave_acessoEnter
                          OnEnter = dbedt_ele_chave_acessoEnter
                        end
                      end
                      object cxdbmsk_form_cnpj: TcxDBMaskEdit
                        Left = 77
                        Top = 30
                        DataBinding.DataField = 'CNPJ_CLIENTE'
                        DataBinding.DataSource = datm_dde_novo.ds_dde_nota_fiscal
                        Properties.AlwaysShowBlanksAndLiterals = True
                        Properties.EditMask = '0000-00;0;_'
                        Properties.MaxLength = 0
                        Style.BorderStyle = ebsSingle
                        TabOrder = 0
                        OnClick = dbedt_ele_chave_acessoEnter
                        OnEnter = dbedt_ele_chave_acessoEnter
                        Width = 93
                      end
                    end
                  end
                end
              end
              object cxgbDispensada: TcxGroupBox
                Left = 2
                Top = 5
                Align = alTop
                Style.BorderColor = clBlack
                Style.BorderStyle = ebsFlat
                TabOrder = 0
                Height = 64
                Width = 728
                object Label74: TLabel
                  Left = 10
                  Top = 20
                  Width = 53
                  Height = 13
                  Caption = 'Base Legal'
                end
                object dbedt_base_legal: TDBEdit
                  Left = 10
                  Top = 34
                  Width = 687
                  Height = 19
                  Color = clInfoBk
                  DataField = 'TX_BASE_LEGAL'
                  DataSource = datm_dde_novo.ds_dde
                  TabOrder = 0
                  OnClick = dbedt_ele_chave_acessoEnter
                  OnEnter = dbedt_ele_chave_acessoEnter
                end
              end
              object cxrbObrigatoria: TcxRadioButton
                Left = 13
                Top = 71
                Width = 73
                Height = 17
                Caption = 'Obrigat'#243'ria'
                TabOrder = 2
                OnClick = cxrbObrigatoriaClick
                LookAndFeel.Kind = lfFlat
              end
              object cxrbDispensada: TcxRadioButton
                Left = 13
                Top = 5
                Width = 77
                Height = 17
                Caption = 'Dispensada'
                TabOrder = 3
                OnClick = cxrbDispensadaClick
                LookAndFeel.Kind = lfFlat
              end
            end
          end
          object tabOutrosDocumentos: TcxTabSheet
            Caption = 'Outros Documentos'
            ImageIndex = 1
            object cxgbOutrosDocumentos: TcxGroupBox
              Left = 0
              Top = 0
              Align = alClient
              Style.BorderColor = clBlack
              Style.BorderStyle = ebsFlat
              TabOrder = 0
              Height = 360
              Width = 732
              object cxgOutrosDocumentos: TcxGrid
                Left = 2
                Top = 57
                Width = 728
                Height = 301
                Align = alClient
                TabOrder = 0
                object cxtbOutrosDocumentos: TcxGridDBTableView
                  DataController.DataSource = datm_dde_novo.ds_dde_doctos
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsBehavior.AlwaysShowEditor = True
                  OptionsBehavior.CellHints = True
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Inserting = False
                  OptionsView.NoDataToDisplayInfoText = 'Sem Dados'
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.GroupByBox = False
                  object cxtbOutrosDocumentosCD_TIPO_DOCTO: TcxGridDBColumn
                    Caption = 'Tipo'
                    DataBinding.FieldName = 'NM_TIPO_DOCTO'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.ReadOnly = True
                    Styles.Content = cxsAnexos
                    Width = 579
                  end
                  object cxtbOutrosDocumentosNR_DOCTO: TcxGridDBColumn
                    Caption = 'Identificador'
                    DataBinding.FieldName = 'NR_DOCTO'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.ReadOnly = True
                    Width = 719
                  end
                  object cxtbOutrosDocumentosBOTOES: TcxGridDBColumn
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Default = True
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000C40E0000C40E00000000000000000000FDFDFDD9D9D9
                          C5B0826756315B4C2A64542E64542E604F2B5B4C2A5748275245254E41245C4E
                          2CB5A274CBCBCBFDFDFDFFFFFFFFFFFF7E663098804CC2AB76D5C296D6C499CE
                          BA8CC6B180BBA573B09965A28A55816E4482692EFFFFFFFFFFFFFFFFFFFFFFFF
                          685325B69A5BA08C5FCFC2A6F2E5C7A99973C2B390DECCA28F7946AB986FC4B5
                          93665225FFFFFFFFFFFFFFFFFFFFFFFF6A5526BEA05C907D51E1CD9FF4E8CD98
                          8864CEB479E2D2AC7E6938A78944CFC2A4685326FFFFFFFFFFFFFFFFFFFFFFFF
                          6B5628BFA15B907D51EDD59DF4E8CD988864D6B66EE2D2AC7E6938A78331D0C3
                          A5695427FFFFFFFFFFFFFFFFFFFFFFFF6C5829BFA15B907D51EDD59DF4E8CD98
                          8864D6B66EE2D2AC7E6938A78331CFC2A46A5629FFFFFFFFFFFFFFFFFFFFFFFF
                          6E592ABFA15B907D51EDD59DF4E8CD988864D6B66EE2D2AC7E6938A78331D0C2
                          A46C5729FFFFFFFFFFFFFFFFFFFFFFFF6F5A2CBFA15B907D51EDD59DF4E8CD98
                          8864D6B66EE2D2AC7E6938A78331D0C3A56D592CFFFFFFFFFFFFFFFFFFFFFFFF
                          715C2DBFA15B907D51EDD59DF4E8CD988864D6B66EE2D2AC7E6938A78331D0C3
                          A56F5A2CFFFFFFFFFFFFFFFFFFFFFFFF725D2FBFA15B907D51E1CD9FF4E8CD98
                          8864CEB479E2D2AC7E6938A78944D1C3A5705B2EFFFFFFFFFFFFFFFFFFFFFFFF
                          735F30AB925A93825DC6BDA6EBE0C89D9072B8AB8FD3C4A2806E459F906FBCB0
                          95715D2FFFFFFFFFFFFFFFFFFF7760307C663489703A987D3FA285439D804097
                          7A3E90753C88703A816B387B65357460336F5C31876B2FFFFFFFFFFFFF6D582B
                          B19557B58926BF890ECD9412C68F11BC870EB4810CA978099F7106976B089A75
                          21A58E576D582CFFFFFFFFFFFF9F8449998455C7AD74D5B978DDC07CD8BC79D3
                          B778CEB375C7AE74C2AA72BDA570B5A06F85734AB19353FFFFFFFFFFFFFBF4E6
                          AD92539A7E40A68947B0914A9A7E40947A3E8E753C88713A92783E8D743B876E
                          38A88D54F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6B77099
                          7D40997D40D6B770FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                        Hint = 'Excluir Documento'
                        Kind = bkGlyph
                      end
                      item
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000220B0000220B00000001000000000000E78C3100B56B
                          4A00E79C52008C635A0094635A00A5635A00A56B5A00BD7B5A00FFB55A004A52
                          630094636300A5636B00A5736B00AD7B6B00BD846B00C6846B00D6946B00AD7B
                          7300B58C7300DE9C7300AD847B00B58C7B00E7AD7B00EFBD7B00EFC67B005A63
                          8400636B84006B6B8400B58C8400CEA58400EFBD8400EFC68400F7C68400AD8C
                          8C00EFC68C00F7CE8C00BD949400B5AD9400EFC69400EFCE9400F7CE9400CEA5
                          9C00D6B59C00EFCE9C00DEBDA500EFCEA500F7D6A500427BAD00EFD6AD00F7D6
                          AD00DEC6B500DECEB500EFD6B500F7D6B500F7DEB500D6BDBD00DEC6BD00F7DE
                          BD00186BC600DEC6C600DECEC600F7E7C600FFEFC600F7E7CE001073D600FFFF
                          D600F7EFDE00FFEFDE00F7EFE700FFEFE700FFF7E700F7F7EF00FFF7EF00FFFF
                          EF00FFF7F700FFFFF700FF00FF0031A5FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4E0B0B0B0B
                          0B0B0B0B0B0B0B0B0B4E4E4E093E35302B27221E171E1E1F0B4E4E1A3A1A3930
                          2D2B26221E17171F0B4E4E4E4D401B39342D2B26221E171F0B4E4E4E054D4019
                          39302D2B26221E1F0B4E4E4E0C484D2F0311040D1D26221F0B4E4E4E0C4E4421
                          1C2C342A121D26220B4E4E4E0E4E4814323F3D4B2A0D2B270B4E4E4E0E4E4E0A
                          42423F4934042D2E0B4E4E4E104E4E1C3B4442412C11312D0B4E4E4E104E4E37
                          243B42321C1533250B4E4E4E134E4E4E371C0A14290606060B4E4E4E134E4E4E
                          4E4E4B4B37060200014E4E4E164E4E4E4E4E4E4E3B0608074E4E4E4E16474747
                          4747474737060E4E4E4E4E4E161010101010101010064E4E4E4E}
                        Hint = 'Visualizar Documento'
                        Kind = bkGlyph
                        Visible = False
                      end>
                    Properties.ReadOnly = False
                    Properties.OnButtonClick = cxtbOutrosDocumentosBOTOESPropertiesButtonClick
                    MinWidth = 40
                    Options.ShowEditButtons = isebAlways
                    Options.HorzSizing = False
                    Width = 40
                  end
                end
                object cxlOutrosDocumentos: TcxGridLevel
                  GridView = cxtbOutrosDocumentos
                end
              end
              object cxGroupBox7: TcxGroupBox
                Left = 2
                Top = 5
                Align = alTop
                Style.BorderColor = clBlack
                Style.BorderStyle = ebsNone
                TabOrder = 1
                Transparent = True
                DesignSize = (
                  728
                  52)
                Height = 52
                Width = 728
                object Label70: TLabel
                  Left = 248
                  Top = 7
                  Width = 58
                  Height = 13
                  Caption = 'Identificador'
                end
                object Label69: TLabel
                  Left = 7
                  Top = 8
                  Width = 21
                  Height = 13
                  Caption = 'Tipo'
                end
                object Label66: TLabel
                  Left = 306
                  Top = 6
                  Width = 6
                  Height = 13
                  Caption = '*'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label103: TLabel
                  Left = 606
                  Top = 30
                  Width = 6
                  Height = 13
                  Anchors = [akRight, akBottom]
                  Caption = '*'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label104: TLabel
                  Left = 612
                  Top = 34
                  Width = 97
                  Height = 13
                  Anchors = [akRight, akBottom]
                  Caption = 'Campos Obrigat'#243'rios'
                end
                object dbedt_docto_identificador: TDBEdit
                  Left = 248
                  Top = 23
                  Width = 241
                  Height = 19
                  Color = clInfoBk
                  DataField = 'NR_DOCTO'
                  DataSource = datm_dde_novo.ds_dde_doctos
                  TabOrder = 0
                  OnClick = dbedt_ele_chave_acessoEnter
                  OnEnter = dbedt_ele_chave_acessoEnter
                end
                object cxdblcDoctoIdentificador: TcxDBLookupComboBox
                  Left = 7
                  Top = 22
                  DataBinding.DataField = 'CD_TIPO_DOCTO'
                  DataBinding.DataSource = datm_dde_novo.ds_dde_doctos
                  Properties.CharCase = ecUpperCase
                  Properties.KeyFieldNames = 'CODIGO'
                  Properties.ListColumns = <
                    item
                      FieldName = 'TEXTO'
                    end>
                  Properties.ListOptions.ShowHeader = False
                  Properties.ListSource = datm_dde_novo.ds_combo_tipo_documento
                  Style.BorderColor = clWindowFrame
                  Style.BorderStyle = ebsSingle
                  Style.Color = clInfoBk
                  TabOrder = 1
                  Width = 226
                end
                object btnSelecionarArquivos: TcxButton
                  Left = 512
                  Top = 19
                  Width = 65
                  Height = 25
                  Caption = 'Vincular Arquivo'
                  TabOrder = 2
                  Visible = False
                  OnClick = btnSelecionarArquivosClick
                  NumGlyphs = 2
                  OptionsImage.Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000130B0000130B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300033300000
                    00003777FF377777777707070330FFFFFFF077777F37F3FF3FF707370330F00F
                    00F077F77F37F773773707370330FFFFFFF077F77F37F3FFFF3707070330F000
                    0FF077777337F777733730003330FFFFFFF037773337F3FF3FF733033330F00F
                    0000337FFF37F773777733000330FFFF0FF033777FF7F3FF7F3733007030F08F
                    0F03337777F7F7737F7330703700FFFF003337773777FFFF7733307333700000
                    0333377FF37777777FFF33073070333000033377F777FF37777F333077000307
                    7770333777777F7777773333003300003300333377337777FF77333333333307
                    7770333333333377777733333333333000033333333333377773}
                  OptionsImage.NumGlyphs = 2
                end
              end
            end
          end
        end
      end
      object tabCarga: TcxTabSheet
        Caption = 'Cargas'
        ImageIndex = 6
        object cxGroupBox10: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsFlat
          TabOrder = 0
          Height = 392
          Width = 741
          object pgCarga: TcxPageControl
            Left = 2
            Top = 61
            Width = 737
            Height = 329
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = tabSolta
            LookAndFeel.SkinName = 'UserSkin'
            OnChange = pgCargaChange
            ClientRectBottom = 323
            ClientRectLeft = 3
            ClientRectRight = 731
            ClientRectTop = 26
            object tabSolta: TcxTabSheet
              Caption = 'Solta'
              ImageIndex = 0
              object cxgCargaSolta: TcxGrid
                Left = 0
                Top = 53
                Width = 728
                Height = 244
                Align = alClient
                TabOrder = 0
                object cxtbCargaSolta: TcxGridDBTableView
                  DataController.DataSource = datm_dde_novo.ds_dde_espec
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsView.NoDataToDisplayInfoText = 'Sem Dados'
                  OptionsView.ColumnAutoWidth = True
                  OptionsView.GroupByBox = False
                  object cxtbCargaSoltaNR_SEQUENCIAL: TcxGridDBColumn
                    Caption = 'Sequencial'
                    DataBinding.FieldName = 'NR_SEQUENCIAL'
                    Visible = False
                    Styles.Content = cxsRegistroRE
                    Width = 58
                  end
                  object cxtbCargaSoltaNM_ESPECIE: TcxGridDBColumn
                    Caption = 'Tipo de Embalagem'
                    DataBinding.FieldName = 'NM_ESPECIE'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Styles.Content = cxsAnexos
                    Width = 247
                  end
                  object cxtbCargaSoltaQT_ESPECIE: TcxGridDBColumn
                    Caption = 'Quantidade'
                    DataBinding.FieldName = 'QT_ESPECIE'
                    Width = 94
                  end
                  object cxtbCargaSoltaPB_ESPECIE: TcxGridDBColumn
                    Caption = 'Peso Bruto (Kg)'
                    DataBinding.FieldName = 'PB_ESPECIE'
                    Styles.Content = cxsRegistrada
                    Width = 103
                  end
                  object cxtbCargaSoltaTX_MARCACAO_VOLUME: TcxGridDBColumn
                    Caption = 'Marca'
                    DataBinding.FieldName = 'TX_MARCACAO_VOLUME'
                    Width = 138
                  end
                  object cxtbCargaSoltaIN_MERCADORIA_PERIGOSA: TcxGridDBColumn
                    Caption = 'Outras Informa'#231#245'es'
                    DataBinding.FieldName = 'IN_MERC_PERIGOSA'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Alignment.Horz = taCenter
                    Properties.Images = ImgList
                    Properties.Items = <
                      item
                        Value = 0
                      end
                      item
                        ImageIndex = 0
                        Value = 1
                      end>
                    Properties.ReadOnly = True
                    MinWidth = 100
                    Options.HorzSizing = False
                    Width = 100
                  end
                end
                object cxlCargaSolta: TcxGridLevel
                  GridView = cxtbCargaSolta
                end
              end
              object cxGroupBox11: TcxGroupBox
                Left = 0
                Top = 0
                Align = alTop
                Style.BorderColor = clBlack
                Style.BorderStyle = ebsNone
                TabOrder = 1
                Transparent = True
                Height = 53
                Width = 728
                object Label88: TLabel
                  Left = 157
                  Top = 8
                  Width = 55
                  Height = 13
                  Caption = 'Quantidade'
                end
                object Label93: TLabel
                  Left = 5
                  Top = 9
                  Width = 94
                  Height = 13
                  Caption = 'Tipo de Embalagem'
                end
                object Label98: TLabel
                  Left = 273
                  Top = 8
                  Width = 127
                  Height = 13
                  Caption = 'Peso Bruto do Volume (Kg)'
                end
                object Label99: TLabel
                  Left = 450
                  Top = 8
                  Width = 30
                  Height = 13
                  Caption = 'Marca'
                end
                object Label64: TLabel
                  Left = 608
                  Top = 8
                  Width = 97
                  Height = 13
                  Caption = 'Mercadoria Perigosa'
                end
                object dbedt_solta_qtde: TDBEdit
                  Left = 157
                  Top = 24
                  Width = 104
                  Height = 19
                  Color = clInfoBk
                  DataField = 'QT_ESPECIE'
                  DataSource = datm_dde_novo.ds_dde_espec
                  TabOrder = 1
                  OnClick = dbedt_ele_chave_acessoEnter
                  OnEnter = dbedt_ele_chave_acessoEnter
                end
                object cxdblcTipoEmbalagem: TcxDBLookupComboBox
                  Left = 5
                  Top = 23
                  DataBinding.DataField = 'CD_ESPECIE'
                  DataBinding.DataSource = datm_dde_novo.ds_dde_espec
                  Properties.CharCase = ecUpperCase
                  Properties.KeyFieldNames = 'CODIGO'
                  Properties.ListColumns = <
                    item
                      FieldName = 'TEXTO'
                    end>
                  Properties.ListOptions.ShowHeader = False
                  Properties.ListSource = datm_dde_novo.ds_embalagem
                  Style.BorderColor = clWindowFrame
                  Style.BorderStyle = ebsSingle
                  Style.Color = clInfoBk
                  TabOrder = 0
                  Width = 140
                end
                object dbedt_solta_marca: TDBEdit
                  Left = 450
                  Top = 24
                  Width = 145
                  Height = 19
                  Color = clInfoBk
                  DataField = 'TX_MARCACAO_VOLUME'
                  DataSource = datm_dde_novo.ds_dde_espec
                  TabOrder = 3
                  OnClick = dbedt_ele_chave_acessoEnter
                  OnEnter = dbedt_ele_chave_acessoEnter
                end
                object cxdbmsk_solta_pb: TcxDBMaskEdit
                  Left = 273
                  Top = 23
                  DataBinding.DataField = 'PB_ESPECIE'
                  DataBinding.DataSource = datm_dde_novo.ds_dde_espec
                  Style.BorderStyle = ebsSingle
                  Style.Color = clInfoBk
                  TabOrder = 2
                  OnClick = dbedt_ele_chave_acessoEnter
                  OnEnter = dbedt_ele_chave_acessoEnter
                  Width = 162
                end
                object cxdblcMercadoriaPerigosaSolta: TcxDBLookupComboBox
                  Left = 607
                  Top = 23
                  DataBinding.DataField = 'CD_MERC_PERIGOSA'
                  DataBinding.DataSource = datm_dde_novo.ds_dde_espec
                  Properties.CharCase = ecUpperCase
                  Properties.DropDownAutoSize = True
                  Properties.KeyFieldNames = 'CD_MERC_PERIGOSA'
                  Properties.ListColumns = <
                    item
                      Caption = 'ID'
                      Fixed = True
                      Width = 20
                      FieldName = 'CD_MERC_PERIGOSA'
                    end
                    item
                      Caption = 'N'#250'mero do RE'
                      Fixed = True
                      MinWidth = 100
                      Width = 100
                      FieldName = 'NR_RE_SISCOMEX'
                    end
                    item
                      Caption = 'Anexo'
                      Fixed = True
                      MinWidth = 40
                      Width = 40
                      FieldName = 'NR_ANEXO'
                    end
                    item
                      Caption = 'Classe'
                      Fixed = True
                      MinWidth = 250
                      Width = 250
                      FieldName = 'NM_CLASSE'
                    end
                    item
                      Caption = 'C'#243'digo Indicador'
                      Fixed = True
                      MinWidth = 250
                      Width = 250
                      FieldName = 'NM_ID_MERCADORIA'
                    end>
                  Properties.ListSource = datm_dde_novo.ds_merc_perigosa
                  Style.BorderColor = clWindowFrame
                  Style.BorderStyle = ebsSingle
                  Style.Color = clInfoBk
                  TabOrder = 4
                  Width = 106
                end
              end
            end
            object TabGranel: TcxTabSheet
              Caption = 'Granel'
              ImageIndex = 1
              object cxgGranel: TcxGrid
                Left = 0
                Top = 53
                Width = 728
                Height = 244
                Align = alClient
                TabOrder = 0
                object cxtbGranel: TcxGridDBTableView
                  DataController.DataSource = datm_dde_novo.ds_dde_espec
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsView.NoDataToDisplayInfoText = 'Sem Dados'
                  OptionsView.GroupByBox = False
                  object cxGridDBColumn7: TcxGridDBColumn
                    Caption = 'Sequencial'
                    DataBinding.FieldName = 'NR_SEQUENCIAL'
                    Visible = False
                    Styles.Content = cxsRegistroRE
                    Width = 74
                  end
                  object cxGridDBColumn10: TcxGridDBColumn
                    Caption = 'Peso Bruto (Kg)'
                    DataBinding.FieldName = 'PB_ESPECIE'
                    Styles.Content = cxsRegistrada
                    Width = 114
                  end
                  object cxtbGranelIN_MERCADORIA_PERIGOSA: TcxGridDBColumn
                    Caption = 'Outras Informa'#231#245'es'
                    DataBinding.FieldName = 'IN_MERC_PERIGOSA'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Images = ImgList
                    Properties.Items = <
                      item
                        ImageIndex = 0
                        Value = 1
                      end
                      item
                        ImageIndex = 1
                        Value = 0
                      end>
                    MinWidth = 100
                    Options.HorzSizing = False
                    Width = 100
                  end
                end
                object cxlGranel: TcxGridLevel
                  GridView = cxtbGranel
                end
              end
              object cxGroupBox15: TcxGroupBox
                Left = 0
                Top = 0
                Align = alTop
                Style.BorderColor = clBlack
                Style.BorderStyle = ebsNone
                TabOrder = 1
                Transparent = True
                Height = 53
                Width = 728
                object Label102: TLabel
                  Left = 5
                  Top = 9
                  Width = 127
                  Height = 13
                  Caption = 'Peso Bruto do Volume (Kg)'
                end
                object Label100: TLabel
                  Left = 173
                  Top = 9
                  Width = 97
                  Height = 13
                  Caption = 'Mercadoria Perigosa'
                end
                object cxdbmsk_granel_pb: TcxDBMaskEdit
                  Left = 4
                  Top = 24
                  DataBinding.DataField = 'PB_ESPECIE'
                  DataBinding.DataSource = datm_dde_novo.ds_dde_espec
                  Style.BorderStyle = ebsSingle
                  Style.Color = clInfoBk
                  TabOrder = 0
                  OnClick = dbedt_ele_chave_acessoEnter
                  Width = 152
                end
                object cxdblcMercadoriaPerigosaGranel: TcxDBLookupComboBox
                  Left = 173
                  Top = 24
                  DataBinding.DataField = 'CD_MERC_PERIGOSA'
                  DataBinding.DataSource = datm_dde_novo.ds_dde_espec
                  Properties.CharCase = ecUpperCase
                  Properties.DropDownAutoSize = True
                  Properties.KeyFieldNames = 'CD_MERC_PERIGOSA'
                  Properties.ListColumns = <
                    item
                      Caption = 'ID'
                      Fixed = True
                      Width = 20
                      FieldName = 'CD_MERC_PERIGOSA'
                    end
                    item
                      Caption = 'N'#250'mero do RE'
                      MinWidth = 100
                      Width = 100
                      FieldName = 'NR_RE_SISCOMEX'
                    end
                    item
                      Caption = 'Anexo'
                      MinWidth = 40
                      Width = 40
                      FieldName = 'NR_ANEXO'
                    end
                    item
                      Caption = 'Classe'
                      MinWidth = 250
                      Width = 250
                      FieldName = 'NM_CLASSE'
                    end
                    item
                      Caption = 'C'#243'digo Indicador'
                      MinWidth = 250
                      Width = 250
                      FieldName = 'NM_ID_MERCADORIA'
                    end>
                  Properties.ListSource = datm_dde_novo.ds_merc_perigosa
                  Style.BorderColor = clWindowFrame
                  Style.BorderStyle = ebsSingle
                  Style.Color = clInfoBk
                  TabOrder = 1
                  Width = 108
                end
              end
            end
          end
          object cxGroupBox12: TcxGroupBox
            Left = 2
            Top = 5
            Align = alTop
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsNone
            TabOrder = 1
            Transparent = True
            Height = 56
            Width = 737
            object Label101: TLabel
              Left = 8
              Top = 8
              Width = 204
              Height = 13
              Caption = 'Totalizador Peso Bruto da Ficha Carga (Kg)'
            end
            object lblCubagem: TLabel
              Left = 235
              Top = 8
              Width = 59
              Height = 13
              Caption = 'Cubagem m'#179
            end
            object cxmsk_totalizador_pb: TcxTextEdit
              Left = 8
              Top = 24
              Style.BorderStyle = ebsSingle
              Style.Color = clMoneyGreen
              TabOrder = 0
              Width = 217
            end
            object dbeCubagem: TDBEdit
              Left = 236
              Top = 24
              Width = 145
              Height = 19
              Color = clMoneyGreen
              DataField = 'VL_M3'
              DataSource = datm_dde_novo.ds_dde
              TabOrder = 1
              OnClick = dbedt_ele_chave_acessoEnter
              OnEnter = dbedt_ele_chave_acessoEnter
            end
          end
        end
      end
      object tabInfoComplementares: TcxTabSheet
        Caption = 'Informa'#231#245'es Complementares'
        ImageIndex = 7
        object cxgbInformacoesComplementares: TcxGroupBox
          Left = 0
          Top = 0
          Align = alTop
          Style.BorderStyle = ebsFlat
          TabOrder = 0
          DesignSize = (
            741
            218)
          Height = 218
          Width = 741
          object Label109: TLabel
            Left = 17
            Top = 21
            Width = 139
            Height = 13
            Caption = 'Informa'#231#245'es Complementares'
          end
          object cxdbmemo_info_complementar: TcxDBMemo
            Left = 16
            Top = 35
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataBinding.DataField = 'TX_COMPLEMENTAR'
            DataBinding.DataSource = datm_dde_novo.ds_dde
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = clInfoBk
            StyleHot.Color = clInfoBk
            TabOrder = 0
            Height = 150
            Width = 710
          end
        end
        object cxGroupBox2: TcxGroupBox
          Left = 0
          Top = 218
          Align = alClient
          Caption = 'Processos'
          Style.BorderStyle = ebsFlat
          TabOrder = 1
          Height = 174
          Width = 741
          object cxGroupBox9: TcxGroupBox
            Left = 2
            Top = 18
            Align = alTop
            Style.BorderColor = clBlack
            Style.BorderStyle = ebsNone
            TabOrder = 0
            Transparent = True
            Height = 52
            Width = 737
            object Label110: TLabel
              Left = 262
              Top = 8
              Width = 99
              Height = 13
              Caption = 'N'#250'mero do Processo'
            end
            object Label111: TLabel
              Left = 7
              Top = 8
              Width = 83
              Height = 13
              Caption = 'Tipo de Processo'
            end
            object Label112: TLabel
              Left = 509
              Top = 8
              Width = 110
              Height = 13
              Caption = 'Descri'#231#227'o do Processo'
            end
            object cxdblcTipoProcesso: TcxDBLookupComboBox
              Left = 7
              Top = 22
              DataBinding.DataField = 'CD_TIPO_PROCESSO'
              DataBinding.DataSource = datm_dde_novo.ds_dde_processos
              Properties.CharCase = ecUpperCase
              Properties.KeyFieldNames = 'CODIGO'
              Properties.ListColumns = <
                item
                  FieldName = 'TEXTO'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = datm_dde_novo.ds_tipo_processos
              Properties.OnEditValueChanged = cxdblcTipoProcessoPropertiesEditValueChanged
              Style.BorderColor = clWindowFrame
              Style.BorderStyle = ebsSingle
              Style.Color = clInfoBk
              TabOrder = 0
              Width = 218
            end
            object dbedt_nm_processo: TDBEdit
              Left = 509
              Top = 24
              Width = 211
              Height = 19
              Color = clInfoBk
              DataField = 'NM_PROCESSO'
              DataSource = datm_dde_novo.ds_dde_processos
              TabOrder = 2
              OnClick = dbedt_ele_chave_acessoEnter
              OnEnter = dbedt_ele_chave_acessoEnter
            end
            object cxdbmsk_nr_processo: TcxDBMaskEdit
              Left = 263
              Top = 22
              DataBinding.DataField = 'NR_PROCESSO'
              DataBinding.DataSource = datm_dde_novo.ds_dde_processos
              Properties.EditMask = '00000.000000/0000-00;1;_'
              Properties.MaxLength = 0
              Style.BorderStyle = ebsSingle
              Style.Color = clInfoBk
              TabOrder = 1
              OnClick = dbedt_ele_chave_acessoEnter
              OnEnter = dbedt_ele_chave_acessoEnter
              Width = 210
            end
          end
          object cxgProcessos: TcxGrid
            Left = 2
            Top = 70
            Width = 737
            Height = 102
            Align = alClient
            TabOrder = 1
            object cxtbProcessos: TcxGridDBTableView
              DataController.DataSource = datm_dde_novo.ds_dde_processos
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.NoDataToDisplayInfoText = 'Sem Dados'
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object cxtbProcessosNM_TIPO_PROCESSO: TcxGridDBColumn
                Caption = 'Tipo'
                DataBinding.FieldName = 'NM_TIPO_PROCESSO'
                Styles.Content = cxsAnexos
              end
              object cxtbProcessosNR_PROCESSO: TcxGridDBColumn
                Caption = 'N'#250'mero'
                DataBinding.FieldName = 'NR_PROCESSO'
                Width = 274
              end
              object cxtbProcessosNM_PROCESSO: TcxGridDBColumn
                Caption = 'Descri'#231#227'o'
                DataBinding.FieldName = 'NM_PROCESSO'
                Width = 273
              end
            end
            object cxlProcessos: TcxGridLevel
              GridView = cxtbProcessos
            end
          end
        end
      end
      object tabStatusErros: TcxTabSheet
        Caption = 'Hist'#243'rico/Erros'
        ImageIndex = 6
        object cxGroupBox18: TcxGroupBox
          Left = 0
          Top = 0
          Align = alTop
          Caption = 'Hist'#243'rico da DE'
          Style.BorderStyle = ebsFlat
          StyleDisabled.BorderStyle = ebsFlat
          TabOrder = 0
          DesignSize = (
            741
            323)
          Height = 323
          Width = 741
          object Label1: TLabel
            Left = 524
            Top = 300
            Width = 208
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = 'Existe Arquivo (clique duas vezes para abrir)'
          end
          object cxHistorico: TcxGrid
            Left = 2
            Top = 18
            Width = 737
            Height = 274
            Align = alTop
            TabOrder = 0
            object cxtbHistorico: TcxGridDBTableView
              OnCellDblClick = cxtbHistoricoCellDblClick
              DataController.DataSource = datm_dde_novo.ds_dde_historico
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.NoDataToDisplayInfoText = 'Sem Dados'
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              Styles.OnGetContentStyle = cxtbHistoricoStylesGetContentStyle
              object cxtbHistoricoNM_ESTAGIO_SISCOMEX: TcxGridDBColumn
                Caption = 'Status'
                DataBinding.FieldName = 'NM_ESTAGIO_SISCOMEX'
                Width = 661
              end
              object cxtbHistoricoDT_CONCLUSAO: TcxGridDBColumn
                Caption = 'Data de Realiza'#231#227'o'
                DataBinding.FieldName = 'DT_CONCLUSAO'
                Width = 431
              end
              object cxtbHistoricoTX_ARQUIVO: TcxGridDBColumn
                DataBinding.FieldName = 'TX_ARQUIVO'
                Visible = False
                Width = 74
              end
            end
            object cxlHistorico: TcxGridLevel
              GridView = cxtbHistorico
            end
          end
          object Panel4: TPanel
            Left = 504
            Top = 299
            Width = 15
            Height = 15
            Anchors = [akRight, akBottom]
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Color = clGradientInactiveCaption
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 1
          end
          object cxdbchkUrgente: TcxDBCheckBox
            Left = 5
            Top = 295
            Caption = 'Processo Urgente'
            DataBinding.DataField = 'IN_REALIZA_TRANSITO'
            DataBinding.DataSource = datm_dde_novo.ds_dde
            ParentColor = False
            ParentFont = False
            Properties.NullStyle = nssUnchecked
            Style.BorderColor = clRed
            Style.BorderStyle = ebsSingle
            Style.Color = clBtnFace
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clRed
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.TextColor = clRed
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleHot.Color = clBtnFace
            TabOrder = 2
            Width = 157
          end
        end
        object cxGroupBox19: TcxGroupBox
          Left = 0
          Top = 323
          Align = alClient
          Caption = 'Erros encontrados no SISCOMEX'
          Style.BorderStyle = ebsFlat
          StyleDisabled.BorderStyle = ebsFlat
          TabOrder = 1
          DesignSize = (
            741
            69)
          Height = 69
          Width = 741
          object cxdbmemo_erros: TcxDBMemo
            Left = 15
            Top = 26
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataBinding.DataField = 'TX_ERRO'
            DataBinding.DataSource = datm_dde_novo.ds_dde
            Properties.ReadOnly = True
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Color = 11777023
            TabOrder = 0
            Height = 24
            Width = 710
          end
        end
      end
    end
    object cxgbDadosGerais: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      Style.BorderColor = clBlack
      Style.BorderStyle = ebsFlat
      TabOrder = 1
      DesignSize = (
        750
        41)
      Height = 41
      Width = 750
      object btn_processo: TSpeedButton
        Left = 197
        Top = 12
        Width = 22
        Height = 22
        Enabled = False
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
        OnClick = btn_processoClick
      end
      object Label82: TLabel
        Left = 55
        Top = 18
        Width = 44
        Height = 13
        Caption = 'Processo'
      end
      object Label89: TLabel
        Left = 233
        Top = 18
        Width = 15
        Height = 13
        Caption = 'DE'
      end
      object Label90: TLabel
        Left = 443
        Top = 18
        Width = 41
        Height = 13
        Caption = 'Data DE'
      end
      object dbedt_processo: TDBEdit
        Left = 111
        Top = 14
        Width = 85
        Height = 19
        AutoSize = False
        CharCase = ecUpperCase
        Color = clGradientInactiveCaption
        DataField = 'NR_SD_REDUZIDO'
        DataSource = datm_dde_novo.ds_dde
        TabOrder = 0
        OnExit = dbedt_processoExit
      end
      object dbedt_de: TDBEdit
        Left = 252
        Top = 14
        Width = 180
        Height = 19
        AutoSize = False
        Color = clGradientInactiveCaption
        DataField = 'NR_REGISTRO_SD'
        DataSource = datm_dde_novo.ds_dde
        TabOrder = 1
        OnExit = dbedt_deExit
      end
      object cxdbd_dt_de: TcxDBDateEdit
        Left = 487
        Top = 13
        DataBinding.DataField = 'DT_DATA_SD'
        DataBinding.DataSource = datm_dde_novo.ds_dde
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebsSingle
        Style.Color = clGradientInactiveCaption
        StyleHot.Color = clGradientInactiveCaption
        TabOrder = 2
        Width = 146
      end
      object txt_idarquivo: TcxLabel
        Left = 730
        Top = 5
        Anchors = [akTop, akRight]
        Style.TextColor = clBlue
        Style.TextStyle = [fsBold]
        Properties.Alignment.Horz = taRightJustify
        AnchorX = 739
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 43
    Align = alTop
    BevelInner = bvLowered
    Color = clSilver
    TabOrder = 1
    DesignSize = (
      754
      43)
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 4
      Width = 33
      Height = 34
      Hint = 'Novo'
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
    object btn_salvar: TSpeedButton
      Left = 37
      Top = 4
      Width = 33
      Height = 34
      Hint = 'Salvar'
      Caption = ' '
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
      OnClick = btn_salvar_novoClick
    end
    object btn_cancelar: TSpeedButton
      Left = 70
      Top = 4
      Width = 33
      Height = 34
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
      Left = 103
      Top = 4
      Width = 33
      Height = 34
      Hint = 'Excluir item'
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
      OnClick = btn_excluir_novoClick
    end
    object btn_sair: TSpeedButton
      Left = 360
      Top = 4
      Width = 33
      Height = 34
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
    object Shape1: TShape
      Left = 396
      Top = 3
      Width = 362
      Height = 36
      Anchors = [akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object BtnGeraXML: TSpeedButton
      Left = 136
      Top = 4
      Width = 32
      Height = 34
      Hint = 'Gerar/Enviar XML'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnGeraXMLClick
    end
    object noteNavegacao: TNotebook
      Left = 398
      Top = 7
      Width = 357
      Height = 29
      Anchors = [akTop, akRight]
      PageIndex = 1
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Capa'
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Lista'
        object Label71: TLabel
          Left = 15
          Top = 8
          Width = 46
          Height = 13
          Caption = 'Pesquisar'
        end
        object Label72: TLabel
          Left = 205
          Top = 8
          Width = 38
          Height = 13
          Caption = 'Ordenar'
        end
        object edt_chave: TEdit
          Left = 67
          Top = 4
          Width = 131
          Height = 19
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edt_chaveChange
        end
        object cb_ordem: TComboBox
          Left = 248
          Top = 4
          Width = 107
          Height = 21
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 1
          OnClick = cb_ordemClick
        end
      end
    end
  end
  object cxrsListaDE: TcxStyleRepository
    Left = 93
    Top = 608
    PixelsPerInch = 96
    object cxsRegistrada: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxsNaFila: TcxStyle
      AssignedValues = [svColor]
      Color = 8454143
    end
    object cxsProblemas: TcxStyle
      AssignedValues = [svColor]
      Color = 11777023
    end
    object cxsNaoRegistrada: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxsRegistroRE: TcxStyle
      AssignedValues = [svColor]
      Color = clGradientInactiveCaption
    end
    object cxsAnexos: TcxStyle
      AssignedValues = [svColor]
      Color = clActiveCaption
    end
    object cxsTransmitido: TcxStyle
      AssignedValues = [svColor]
      Color = clGradientInactiveCaption
    end
  end
  object ImgList: TImageList
    Left = 154
    Top = 367
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000000000000202940000009F000000
      9F0000009F0000009F0000009F0000009F0000009F0000009F0000009F000000
      9F0000009F0000009F0002029400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000010199000000D1000000D6000000
      D6000000D6000000D6000000D6000000D6000000D6000000D6000000D6000000
      D6000000D6000000D6000000D100010199000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000141480000000C4009393E600F2F2
      F200F1F1F100F0F0F000EFEFEF00EEEEEE00EEEEEE00EFEFEF00F0F0F000F1F1
      F100F2F2F2009393E6000000C400141480000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9CC800060697002F2FDC00ECEC
      F000F0F0F000EFEFEF00EEEEEE005A5A5A005A5A5A00EEEEEE00EFEFEF00F0F0
      F000ECECF0002F2FDC00060697009C9CC8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFD000D0D91000000C000A4A4
      E700EFEFEF00EEEEEE00EDEDED004343430043434300EDEDED00EEEEEE00EFEF
      EF00A4A4E7000000C0000D0D9100FCFCFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00A7A7CE00060695003333
      DC00EAEAED00EDEDED00ECECEC00E1E1E100E1E1E100ECECEC00EDEDED00EAEA
      ED003333DC0006069500A7A7CE00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FEFEFE00222288000000
      BC00A7A7E500ECECEC00EBEBEB006868680068686800EBEBEB00ECECEC00A7A7
      E5000000BC0022228800FEFEFE00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00B2B2D4000606
      93003939DB00E8E8EA00EAEAEA005B5B5B005B5B5B00EAEAEA00E8E8EA003939
      DB0006069300B2B2D400FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF002A2A
      8D000000B800AAAAE400E9E9E9004D4D4D004D4D4D00E9E9E900AAAAE4000000
      B8002A2A8D00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00BCBC
      D900060691003C3CDA00E7E7E8004040400040404000E7E7E8003C3CDA000606
      9100BCBCD900FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00343493000101B400ABABE2003131310031313100ABABE2000101B4003434
      9300FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C5C5DE0005058E004141D900E5E5E500E5E5E5004141D90005058E00C5C5
      DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003F3F99000101AF00AEAEE100AEAEE1000101AF003F3F9900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CECEE40005058D002929D7001414BB0005058D00CECEE400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF004A4A9E0002029F0002029F004A4A9E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E7F20049499D0049499D00E7E7F200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0080010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object tmrSelecionarArquivo: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrSelecionarArquivoTimer
    Left = 709
    Top = 355
  end
  object tmrXML: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = tmrXMLTimer
    Left = 646
    Top = 312
  end
  object tmrErroWeb2: TTimer
    Enabled = False
    Interval = 50
    OnTimer = tmrErroWeb2Timer
    Left = 696
    Top = 312
  end
  object mnuDDE: TMainMenu
    Left = 213
    Top = 9
    object ApenasGerarXML1: TMenuItem
      Caption = 'Menu'
      object mnuGeraXML: TMenuItem
        Caption = 'Apenas gerar o XML'
        OnClick = mnuGeraXMLClick
      end
      object mnuConsultaNumeroDE: TMenuItem
        Caption = 'Consulta N'#250'mero DDE'
        OnClick = mnuConsultaNumeroDEClick
      end
    end
  end
  object tmrPreencheNumeroDE: TTimer
    Enabled = False
    OnTimer = tmrPreencheNumeroDETimer
    Left = 645
    Top = 361
  end
end
