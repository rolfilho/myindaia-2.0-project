object frmConsultaMercante: TfrmConsultaMercante
  Left = 120
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Mercante'
  ClientHeight = 554
  ClientWidth = 1221
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 1221
    Height = 554
    Align = alClient
    TabOrder = 0
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 1219
      Height = 118
      Align = alTop
      TabOrder = 0
      object pnlFiltros: TPanel
        Left = 1
        Top = 1
        Width = 1217
        Height = 116
        Align = alClient
        TabOrder = 0
        DesignSize = (
          1217
          116)
        object Label1: TLabel
          Left = 56
          Top = 4
          Width = 29
          Height = 13
          Caption = 'Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 264
          Top = 4
          Width = 41
          Height = 13
          Caption = 'Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 437
          Top = 4
          Width = 100
          Height = 13
          Caption = 'Porto - Carregamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 594
          Top = 4
          Width = 118
          Height = 13
          Caption = 'Porto - Descarregamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 755
          Top = 4
          Width = 53
          Height = 13
          Caption = 'N'#250'mero BL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 909
          Top = 4
          Width = 85
          Height = 13
          Caption = 'N'#250'mero Mercante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 989
          Top = 49
          Width = 61
          Height = 13
          Caption = 'Qt. Registros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 5
          Top = 45
          Width = 113
          Height = 13
          Caption = '*CTRL para limpar filtros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblDataConsulta: TLabel
          Left = 7
          Top = 68
          Width = 67
          Height = 13
          Caption = 'Data Consulta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 230
          Top = 68
          Width = 73
          Height = 13
          Caption = 'Data Opera'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 230
          Top = 90
          Width = 14
          Height = 13
          Caption = 'De'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 326
          Top = 90
          Width = 16
          Height = 13
          Caption = 'At'#233
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 6
          Top = 90
          Width = 14
          Height = 13
          Caption = 'De'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 102
          Top = 90
          Width = 16
          Height = 13
          Caption = 'At'#233
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cbGrupo: TDBLookupComboBox
          Left = 56
          Top = 20
          Width = 153
          Height = 21
          DropDownWidth = 200
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_GRUPO'
          ListField = 'NM_GRUPO'
          ListSource = dsGrupo
          ParentFont = False
          TabOrder = 1
          OnCloseUp = cbGrupoCloseUp
          OnExit = cbGrupoExit
          OnKeyDown = cbGrupoKeyDown
        end
        object cbPortoCarregamento: TDBLookupComboBox
          Left = 437
          Top = 20
          Width = 145
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'DS_PORTO_CARREGAMENTO'
          ListField = 'DS_PORTO_CARREGAMENTO'
          ListSource = dsCarregamento
          ParentFont = False
          TabOrder = 4
          OnKeyDown = cbPortoCarregamentoKeyDown
        end
        object cbPortoDescarregamento: TDBLookupComboBox
          Left = 594
          Top = 20
          Width = 145
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'DS_PORTO_DESCARREGAMENTO'
          ListField = 'DS_PORTO_DESCARREGAMENTO'
          ListSource = dsDescarregamento
          ParentFont = False
          TabOrder = 5
          OnKeyDown = cbPortoDescarregamentoKeyDown
        end
        object edtNumeroBL: TEdit
          Left = 754
          Top = 20
          Width = 137
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object edtNrMercante: TEdit
          Left = 909
          Top = 20
          Width = 137
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object cbEmpresa: TDBLookupComboBox
          Left = 264
          Top = 20
          Width = 153
          Height = 21
          DropDownWidth = 200
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_EMPRESA'
          ListField = 'NM_EMPRESA'
          ListSource = dsEmpresa
          ParentFont = False
          TabOrder = 3
          OnCloseUp = cbEmpresaCloseUp
          OnExit = cbEmpresaExit
          OnKeyDown = cbEmpresaKeyDown
        end
        object edrQtRegistros: TEdit
          Left = 1058
          Top = 44
          Width = 35
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Text = '100'
          OnKeyPress = edrQtRegistrosKeyPress
        end
        object btnPesquisar: TBitBtn
          Left = 1056
          Top = 16
          Width = 39
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnClick = btnPesquisarClick
          Glyph.Data = {
            52020000424D5202000000000000520100002800000010000000100000000100
            08000000000000010000340B0000340B00004700000047000000405058009860
            580031486000EAAB6A00A17373008F7B7300B67B7300A1847300AB847300F4AB
            7300AB7B7B00B67B7B00C07B7B00B6847B00C0987B00F4C07B00B68F8400C08F
            8400CA8F8400B6988400C0988400CA988400F4C08400F4CA840031608F00C098
            8F00CAA18F00D4AB8F00F4CA8F00D4AB9800D4B69800E0B69800FFD49800FFE0
            9800C0A1A100F4D4A100F4E0A100FFE0A100FFEAA100CAABAB00D4CAAB00E0D4
            AB00FFE0AB005084B600EAD4B600FFEAB600FFF4B600F4E0C000FFF4C000F4EA
            CA00F4F4CA00FFF4CA00FFFFCA00116AD400F4F4D400FFFFD4000B6AE0000B73
            E000FFFFE0000B73EA001173EA00A1CAEA00F4F4EA00FFF4EA00FFFFEA00FFFF
            F400FF00FF0031A1FF0038A1FF0038ABFF00FFFFFF0042020A42424242424242
            4242424242422B39180B42424242424242424242424243443C180B4242424242
            42424242424242444438180B424242424242424242424242444339180A424242
            424242424242424242444335004201101A114242424242424242453D05072F34
            3434291942424242424242221A2D34343437403E0442424242424206231C3034
            37404146284242424242421B210F30373A414140310D42424242421F20032434
            373A3A37321342424242421D25030F2D37373737311042424242420D2D2D1C16
            2430333429424242424242421E463F0F0316252E08424242424242424227312D
            21252314424242424242424242420E141B1B42424242}
        end
        object edtGrupo: TEdit
          Left = 8
          Top = 20
          Width = 41
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnExit = edtGrupoExit
          OnKeyDown = edtGrupoKeyDown
        end
        object edtEmpresa: TEdit
          Left = 216
          Top = 20
          Width = 41
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnExit = edtEmpresaExit
          OnKeyDown = edtEmpresaKeyDown
        end
        object rgStatus: TRadioGroup
          Left = 1101
          Top = 3
          Width = 101
          Height = 67
          Anchors = [akTop, akRight]
          Caption = 'Status'
          ItemIndex = 1
          Items.Strings = (
            'Todos'
            'Consultados'
            'Terceiros')
          TabOrder = 10
          OnClick = rgStatusClick
        end
        object edtDataConsultaInicial: TMaskEdit
          Left = 26
          Top = 84
          Width = 69
          Height = 21
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 11
          Text = '  /  /    '
        end
        object edtDataConsultaFinal: TMaskEdit
          Left = 123
          Top = 84
          Width = 69
          Height = 21
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 12
          Text = '  /  /    '
        end
        object edtDataOperacaoInicial: TMaskEdit
          Left = 250
          Top = 84
          Width = 68
          Height = 21
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 13
          Text = '  /  /    '
        end
        object edtDataOperacaoFinal: TMaskEdit
          Left = 346
          Top = 84
          Width = 69
          Height = 21
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 14
          Text = '  /  /    '
        end
      end
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 119
      Width = 1219
      Height = 398
      Align = alClient
      TabOrder = 1
      object pnlBlsEncontrados: TPanel
        Left = 640
        Top = 208
        Width = 292
        Height = 120
        BorderWidth = 1
        BorderStyle = bsSingle
        TabOrder = 0
        Visible = False
        object Panel3: TPanel
          Left = 2
          Top = 2
          Width = 284
          Height = 37
          Align = alTop
          Color = cl3DLight
          TabOrder = 0
          DesignSize = (
            284
            37)
          object Label9: TLabel
            Left = 8
            Top = 12
            Width = 81
            Height = 13
            Caption = 'BLs Encontrados'
          end
          object btn_sair: TSpeedButton
            Left = 250
            Top = 4
            Width = 28
            Height = 30
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
        end
        object sgrdBlsEncontrados: TStringGrid
          Left = 2
          Top = 39
          Width = 284
          Height = 75
          Align = alClient
          ColCount = 2
          DefaultColWidth = 130
          DefaultRowHeight = 20
          FixedCols = 0
          RowCount = 2
          TabOrder = 1
        end
      end
      object pgcDados: TPageControl
        Left = 1
        Top = 1
        Width = 1217
        Height = 396
        ActivePage = tbTerceiros
        Align = alClient
        TabOrder = 1
        OnChange = pgcDadosChange
        object tbTerceiros: TTabSheet
          Caption = 'Terceiros'
          object cxGrid: TcxGrid
            Left = 0
            Top = 0
            Width = 1209
            Height = 249
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            LockedStateImageOptions.AssignedValues = [lsiavFont, lsiavColor]
            LockedStateImageOptions.Font.Charset = DEFAULT_CHARSET
            LockedStateImageOptions.Font.Color = clWindowText
            LockedStateImageOptions.Font.Height = -11
            LockedStateImageOptions.Font.Name = 'MS Sans Serif'
            LockedStateImageOptions.Font.Style = []
            LookAndFeel.Kind = lfStandard
            LookAndFeel.NativeStyle = False
            object cxGridDBTableView1: TcxGridDBTableView
              OnCustomDrawCell = cxGridDBTableView1CustomDrawCell
              DataController.DataSource = dsDados
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              object cxGridDBTableView1DT_CONSULTA: TcxGridDBColumn
                DataBinding.FieldName = 'DT_CONSULTA'
                Options.Editing = False
                Width = 114
              end
              object cxGridDBTableView1CD_GRUPO: TcxGridDBColumn
                DataBinding.FieldName = 'CD_GRUPO'
                Options.Editing = False
                Width = 30
              end
              object cxGridDBTableView1NM_GRUPO: TcxGridDBColumn
                DataBinding.FieldName = 'NM_GRUPO'
                Options.Editing = False
                Width = 218
              end
              object cxGridDBTableView1CGC_EMPRESA: TcxGridDBColumn
                DataBinding.FieldName = 'CGC_EMPRESA'
                Visible = False
                Options.Editing = False
              end
              object cxGridDBTableView1NR_CE_MERCANTE: TcxGridDBColumn
                DataBinding.FieldName = 'NR_CE_MERCANTE'
                Options.Editing = False
              end
              object cxGridDBTableView1NR_BL: TcxGridDBColumn
                DataBinding.FieldName = 'NR_BL'
                Options.Editing = False
                Width = 126
              end
              object cxGridDBTableView1NR_MANIFESTO: TcxGridDBColumn
                DataBinding.FieldName = 'NR_MANIFESTO'
                Options.Editing = False
              end
              object cxGridDBTableView1DS_EMBARCACAO: TcxGridDBColumn
                DataBinding.FieldName = 'DS_EMBARCACAO'
                Options.Editing = False
                Width = 156
              end
              object cxGridDBTableView1DS_PORTO_CARREGAMENTO: TcxGridDBColumn
                DataBinding.FieldName = 'DS_PORTO_CARREGAMENTO'
                Options.Editing = False
                Width = 126
              end
              object cxGridDBTableView1DS_PORTO_DESCARREGAMENTO: TcxGridDBColumn
                DataBinding.FieldName = 'DS_PORTO_DESCARREGAMENTO'
                Options.Editing = False
                Width = 151
              end
              object cxGridDBTableView1DT_OPERACAO: TcxGridDBColumn
                DataBinding.FieldName = 'DT_OPERACAO'
                Options.Editing = False
                Width = 116
              end
              object cxGridDBTableView1NM_NOTIFY_IDENTIFICACAO: TcxGridDBColumn
                DataBinding.FieldName = 'NM_NOTIFY_IDENTIFICACAO'
                Options.Editing = False
                Width = 142
              end
              object cxGridDBTableView1NM_NOTIFY_CNPJ: TcxGridDBColumn
                DataBinding.FieldName = 'NM_NOTIFY_CNPJ'
                Options.Editing = False
              end
              object cxGridDBTableView1NM_TERMINAL_DESCARGA: TcxGridDBColumn
                DataBinding.FieldName = 'NM_TERMINAL_DESCARGA'
                Options.Editing = False
                Width = 136
              end
              object cxGridDBTableView1IC_STATUS: TcxGridDBColumn
                DataBinding.FieldName = 'IC_STATUS'
                Visible = False
                Options.Editing = False
              end
              object cxGridDBTableView1DS_CPF_CNPJ_CONSIGNATARIO: TcxGridDBColumn
                DataBinding.FieldName = 'DS_CPF_CNPJ_CONSIGNATARIO'
                Width = 200
              end
              object cxGridDBTableView1DS_OBSERVACOES: TcxGridDBColumn
                DataBinding.FieldName = 'DS_OBSERVACOES'
                Width = 200
              end
              object cxGridDBTableView1DS_MERCADORIA: TcxGridDBColumn
                DataBinding.FieldName = 'DS_MERCADORIA'
                Width = 396
              end
              object cxDetalhamento: TcxGridDBColumn
                DataBinding.FieldName = 'DS_DETALHAMENTO'
                VisibleForCustomization = False
                Width = 456
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxGridDBTableView1
            end
          end
          object cxGrid2: TcxGrid
            Left = 0
            Top = 249
            Width = 1209
            Height = 119
            Align = alBottom
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            LockedStateImageOptions.AssignedValues = [lsiavFont, lsiavColor]
            LockedStateImageOptions.Font.Charset = DEFAULT_CHARSET
            LockedStateImageOptions.Font.Color = clWindowText
            LockedStateImageOptions.Font.Height = -11
            LockedStateImageOptions.Font.Name = 'MS Sans Serif'
            LockedStateImageOptions.Font.Style = []
            LookAndFeel.Kind = lfStandard
            LookAndFeel.NativeStyle = False
            object cxGridDBTableView3: TcxGridDBTableView
              DataController.DataSource = dsDadosDetail
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsView.GroupByBox = False
              object cxGridDBTableView3DS_DETALHAMENTO: TcxGridDBColumn
                DataBinding.FieldName = 'DS_DETALHAMENTO'
                Options.Editing = False
                Width = 812
              end
            end
            object cxGridLevel3: TcxGridLevel
              GridView = cxGridDBTableView3
            end
          end
        end
        object tbDivergenciaData: TTabSheet
          Caption = 'Diverg'#234'ncias - Data Opera'#231#227'o'
          ImageIndex = 1
          object cxGrid1: TcxGrid
            Left = 0
            Top = 0
            Width = 1209
            Height = 368
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            LockedStateImageOptions.AssignedValues = [lsiavFont]
            LockedStateImageOptions.Font.Charset = DEFAULT_CHARSET
            LockedStateImageOptions.Font.Color = clWindowText
            LockedStateImageOptions.Font.Height = -11
            LockedStateImageOptions.Font.Name = 'MS Sans Serif'
            LockedStateImageOptions.Font.Style = []
            LookAndFeel.Kind = lfStandard
            LookAndFeel.NativeStyle = False
            object cxGridDBTableView2: TcxGridDBTableView
              DataController.DataSource = dsDadosDivergencias
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              object cxGridDBTableView2DT_CONSULTA: TcxGridDBColumn
                DataBinding.FieldName = 'DT_CONSULTA'
                Options.Editing = False
                Width = 124
              end
              object cxGridDBTableView2NR_PROCESSO: TcxGridDBColumn
                DataBinding.FieldName = 'NR_PROCESSO'
                Options.Editing = False
                Width = 102
              end
              object cxGridDBTableView2DT_OPERACAO_BROKER: TcxGridDBColumn
                DataBinding.FieldName = 'DT_OPERACAO_BROKER'
                Options.Editing = False
                Width = 150
              end
              object cxGridDBTableView2DT_OPERACAO: TcxGridDBColumn
                DataBinding.FieldName = 'DT_OPERACAO'
                Options.Editing = False
                Width = 110
              end
              object cxGridDBTableView2CD_GRUPO: TcxGridDBColumn
                DataBinding.FieldName = 'CD_GRUPO'
                Options.Editing = False
                Width = 60
              end
              object cxGridDBTableView2NM_GRUPO: TcxGridDBColumn
                DataBinding.FieldName = 'NM_GRUPO'
                Options.Editing = False
                Width = 157
              end
              object cxGridDBTableView2CGC_EMPRESA: TcxGridDBColumn
                DataBinding.FieldName = 'CGC_EMPRESA'
                Options.Editing = False
              end
              object cxGridDBTableView2NR_CE_MERCANTE: TcxGridDBColumn
                DataBinding.FieldName = 'NR_CE_MERCANTE'
                Options.Editing = False
              end
              object cxGridDBTableView2NR_MANIFESTO: TcxGridDBColumn
                DataBinding.FieldName = 'NR_MANIFESTO'
                Options.Editing = False
              end
              object cxGridDBTableView2NR_BL: TcxGridDBColumn
                DataBinding.FieldName = 'NR_BL'
                Options.Editing = False
                Width = 100
              end
              object cxGridDBTableView2DS_EMBARCACAO: TcxGridDBColumn
                DataBinding.FieldName = 'DS_EMBARCACAO'
                Options.Editing = False
                Width = 128
              end
              object cxGridDBTableView2DS_PORTO_CARREGAMENTO: TcxGridDBColumn
                DataBinding.FieldName = 'DS_PORTO_CARREGAMENTO'
                Options.Editing = False
                Width = 125
              end
              object cxGridDBTableView2DS_PORTO_DESCARREGAMENTO: TcxGridDBColumn
                DataBinding.FieldName = 'DS_PORTO_DESCARREGAMENTO'
                Options.Editing = False
                Width = 150
              end
            end
            object cxGridLevel2: TcxGridLevel
              GridView = cxGridDBTableView2
            end
          end
        end
      end
    end
    object pnlBottom: TPanel
      Left = 1
      Top = 517
      Width = 1219
      Height = 36
      Align = alBottom
      TabOrder = 2
      DesignSize = (
        1219
        36)
      object lblResultados: TLabel
        Left = 1127
        Top = 8
        Width = 53
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Resultados'
      end
      object btnTerceiros: TButton
        Left = 8
        Top = 5
        Width = 145
        Height = 25
        Caption = 'Outro Prestador de Servi'#231'o'
        TabOrder = 0
        OnClick = btnTerceirosClick
      end
      object btnBlsCadastrados: TButton
        Left = 200
        Top = 5
        Width = 145
        Height = 25
        Caption = 'Verificar BLs Cadastrados'
        TabOrder = 1
        OnClick = btnBlsCadastradosClick
      end
      object btnExcel: TBitBtn
        Left = 1005
        Top = 4
        Width = 95
        Height = 25
        Caption = 'Gerar Excel'
        TabOrder = 2
        OnClick = btnExcelClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007777777777777777770000007777777777770007770000007444
          4400000006007700000074FFFF08880600080700000074F008000060EE070700
          000074FFFFF8060EE0047700000074F0088060EE00F47700000074FFFF060EE0
          00747700000074F00800EE0EE0047700000074FFFF0EE0F0EE047700000074F0
          080000F000047700000074FFFFFFFFFFFFF47700000074444444444444447700
          000074F444F444F444F477000000744444444444444477000000777777777777
          777777000000777777777777777777000000}
      end
    end
  end
  object qryGrupo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = datm_main.SQLConnection
    Left = 588
    Top = 250
    object strngfldqry1CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object strngfldqry1NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      FixedChar = True
      Size = 50
    end
  end
  object dspGrupo: TDataSetProvider
    DataSet = qryGrupo
    Left = 583
    Top = 298
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 583
    Top = 362
    object strngfldGrupoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object strngfldGrupoNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      FixedChar = True
      Size = 50
    end
  end
  object dsGrupo: TDataSource
    DataSet = cdsGrupo
    Left = 583
    Top = 420
  end
  object qryEmpresa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = datm_main.SQLConnection
    Left = 668
    Top = 250
    object qryEmpresaCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Required = True
      FixedChar = True
      Size = 5
    end
    object qryEmpresaNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qryEmpresa
    Left = 663
    Top = 298
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    Left = 663
    Top = 362
    object cdsEmpresaCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsEmpresaNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
  end
  object dsEmpresa: TDataSource
    DataSet = cdsEmpresa
    Left = 665
    Top = 419
  end
  object cdsCarregamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCarregamento'
    Left = 472
    Top = 363
    object cdsCarregamentoDS_PORTO_CARREGAMENTO: TStringField
      FieldName = 'DS_PORTO_CARREGAMENTO'
      FixedChar = True
      Size = 10
    end
  end
  object dspCarregamento: TDataSetProvider
    DataSet = qryCarregamento
    Left = 472
    Top = 299
  end
  object dsCarregamento: TDataSource
    DataSet = cdsCarregamento
    Left = 473
    Top = 424
  end
  object qryCarregamento: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = datm_main.SQLConnection
    Left = 472
    Top = 250
    object qryCarregamentoDS_PORTO_CARREGAMENTO: TStringField
      FieldName = 'DS_PORTO_CARREGAMENTO'
      FixedChar = True
      Size = 10
    end
  end
  object qryDescarregamento: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      '')
    SQLConnection = datm_main.SQLConnection
    Left = 368
    Top = 250
    object qryDescarregamentoDS_PORTO_DESCARREGAMENTO: TStringField
      FieldName = 'DS_PORTO_DESCARREGAMENTO'
      FixedChar = True
      Size = 10
    end
  end
  object dspDescarregamento: TDataSetProvider
    DataSet = qryDescarregamento
    Left = 368
    Top = 299
  end
  object cdsDescarregamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDescarregamento'
    Left = 368
    Top = 363
    object cdsDescarregamentoDS_PORTO_DESCARREGAMENTO: TStringField
      FieldName = 'DS_PORTO_DESCARREGAMENTO'
      FixedChar = True
      Size = 10
    end
  end
  object dsDescarregamento: TDataSource
    DataSet = cdsDescarregamento
    Left = 368
    Top = 419
  end
  object qryDados: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = datm_main.SQLConnection
    Left = 120
    Top = 250
    object qryDadosDT_CONSULTA: TSQLTimeStampField
      DisplayLabel = 'Data Consulta'
      FieldName = 'DT_CONSULTA'
    end
    object qryDadosCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qryDadosNM_GRUPO: TStringField
      DisplayLabel = 'Nome Grupo'
      FieldName = 'NM_GRUPO'
      Required = True
      FixedChar = True
      Size = 50
    end
    object qryDadosCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qryDadosNM_EMPRESA: TStringField
      DisplayLabel = 'Nome Empresa'
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object qryDadosNR_CE_MERCANTE: TStringField
      DisplayLabel = 'CE Mercante'
      FieldName = 'NR_CE_MERCANTE'
      FixedChar = True
    end
    object qryDadosNR_BL: TStringField
      DisplayLabel = 'N'#250'mero BL'
      FieldName = 'NR_BL'
      FixedChar = True
      Size = 60
    end
    object qryDadosNR_MANIFESTO: TStringField
      DisplayLabel = 'N'#250'mero Manifesto'
      FieldName = 'NR_MANIFESTO'
      FixedChar = True
    end
    object qryDadosCD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      FixedChar = True
      Size = 10
    end
    object qryDadosDS_EMBARCACAO: TStringField
      DisplayLabel = 'Embarca'#231#227'o'
      FieldName = 'DS_EMBARCACAO'
      FixedChar = True
      Size = 60
    end
    object qryDadosDS_PORTO_CARREGAMENTO: TStringField
      DisplayLabel = 'Porto - Carregamento'
      FieldName = 'DS_PORTO_CARREGAMENTO'
      FixedChar = True
      Size = 10
    end
    object qryDadosDS_PORTO_DESCARREGAMENTO: TStringField
      DisplayLabel = 'Porto - Descarregamento'
      FieldName = 'DS_PORTO_DESCARREGAMENTO'
      FixedChar = True
      Size = 10
    end
    object qryDadosCGC_EMPRESA: TStringField
      DisplayLabel = 'CNPJ Empresa'
      FieldName = 'CGC_EMPRESA'
      FixedChar = True
      Size = 14
    end
    object qryDadosIC_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'IC_STATUS'
      Size = 1
    end
    object qryDadosCD_DADOS_CON_SITE_TER: TIntegerField
      FieldName = 'CD_DADOS_CON_SITE_TER'
    end
    object qryDadosIC_STATUS_DESC: TStringField
      FieldName = 'IC_STATUS_DESC'
    end
    object qryDadosNM_NOTIFY_IDENTIFICACAO: TStringField
      FieldName = 'NM_NOTIFY_IDENTIFICACAO'
      Size = 150
    end
    object qryDadosNM_NOTIFY_CNPJ: TStringField
      FieldName = 'NM_NOTIFY_CNPJ'
    end
    object qryDadosDT_OPERACAO: TSQLTimeStampField
      FieldName = 'DT_OPERACAO'
    end
    object qryDadosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
    end
    object qryDadosDT_OPERACAO_BROKER: TSQLTimeStampField
      FieldName = 'DT_OPERACAO_BROKER'
    end
    object qryDadosNM_TERMINAL_DESCARGA: TStringField
      FieldName = 'NM_TERMINAL_DESCARGA'
      FixedChar = True
      Size = 100
    end
    object qryDadosDS_CPF_CNPJ_CONSIGNATARIO: TStringField
      FieldName = 'DS_CPF_CNPJ_CONSIGNATARIO'
      Size = 100
    end
    object qryDadosDS_MERCADORIA: TStringField
      FieldName = 'DS_MERCADORIA'
      Size = 1000
    end
    object qryDadosDS_OBSERVACOES: TStringField
      FieldName = 'DS_OBSERVACOES'
      Size = 1000
    end
    object qryDadosDS_DETALHAMENTO: TStringField
      FieldName = 'DS_DETALHAMENTO'
      FixedChar = True
      Size = 8000
    end
    object qryDadosDS_DETALHAMENTO_QUEBRA_ITEM: TStringField
      FieldName = 'DS_DETALHAMENTO_QUEBRA_ITEM'
      FixedChar = True
      Size = 2000
    end
  end
  object dspDados: TDataSetProvider
    DataSet = qryDados
    Left = 120
    Top = 299
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDados'
    AfterScroll = cdsDadosAfterScroll
    Left = 123
    Top = 361
    object cdsDadosDT_CONSULTA: TSQLTimeStampField
      DisplayLabel = 'Data Consulta'
      FieldName = 'DT_CONSULTA'
    end
    object cdsDadosCD_GRUPO: TStringField
      DisplayLabel = 'Cod. Grupo'
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object cdsDadosNM_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      FieldName = 'NM_GRUPO'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsDadosCD_EMPRESA: TStringField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object cdsDadosCGC_EMPRESA: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'CGC_EMPRESA'
      FixedChar = True
      Size = 14
    end
    object cdsDadosNM_EMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object cdsDadosNR_CE_MERCANTE: TStringField
      DisplayLabel = 'CE Mercante'
      FieldName = 'NR_CE_MERCANTE'
      FixedChar = True
    end
    object cdsDadosNR_BL: TStringField
      DisplayLabel = 'Nr BL'
      FieldName = 'NR_BL'
      FixedChar = True
      Size = 60
    end
    object cdsDadosNR_MANIFESTO: TStringField
      DisplayLabel = 'Manifesto'
      FieldName = 'NR_MANIFESTO'
      FixedChar = True
    end
    object cdsDadosCD_EMBARCACAO: TStringField
      DisplayLabel = 'Cod. Embarca'#231#227'o'
      FieldName = 'CD_EMBARCACAO'
      FixedChar = True
      Size = 10
    end
    object cdsDadosDS_EMBARCACAO: TStringField
      DisplayLabel = 'Embarca'#231#227'o'
      FieldName = 'DS_EMBARCACAO'
      FixedChar = True
      Size = 60
    end
    object cdsDadosDS_PORTO_CARREGAMENTO: TStringField
      DisplayLabel = 'Porto Carregamento'
      FieldName = 'DS_PORTO_CARREGAMENTO'
      FixedChar = True
      Size = 10
    end
    object cdsDadosDS_PORTO_DESCARREGAMENTO: TStringField
      DisplayLabel = 'Porto Descarregamento'
      FieldName = 'DS_PORTO_DESCARREGAMENTO'
      FixedChar = True
      Size = 10
    end
    object cdsDadosNM_NOTIFY_IDENTIFICACAO: TStringField
      DisplayLabel = 'Notify'
      FieldName = 'NM_NOTIFY_IDENTIFICACAO'
      Size = 150
    end
    object cdsDadosNM_NOTIFY_CNPJ: TStringField
      DisplayLabel = 'Notify CNPJ'
      FieldName = 'NM_NOTIFY_CNPJ'
    end
    object cdsDadosDT_OPERACAO: TSQLTimeStampField
      DisplayLabel = 'Data Opera'#231#227'o'
      FieldName = 'DT_OPERACAO'
    end
    object cdsDadosNR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      FixedChar = True
    end
    object cdsDadosDT_OPERACAO_BROKER: TSQLTimeStampField
      DisplayLabel = 'Data Opera'#231#227'o Broker'
      FieldName = 'DT_OPERACAO_BROKER'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object cdsDadosNM_TERMINAL_DESCARGA: TStringField
      DisplayLabel = 'Terminal Descarga'
      FieldName = 'NM_TERMINAL_DESCARGA'
      FixedChar = True
      Size = 100
    end
    object cdsDadosCD_DADOS_CON_SITE_TER: TIntegerField
      DisplayLabel = 'Cod. Dados Conhecimento'
      FieldName = 'CD_DADOS_CON_SITE_TER'
      Visible = False
    end
    object cdsDadosIC_STATUS: TStringField
      FieldName = 'IC_STATUS'
      Visible = False
      Size = 1
    end
    object cdsDadosIC_STATUS_DESC: TStringField
      FieldName = 'IC_STATUS_DESC'
      Visible = False
    end
    object cdsDadosDS_CPF_CNPJ_CONSIGNATARIO: TStringField
      DisplayLabel = 'CNPJ Consignat'#225'rio'
      FieldName = 'DS_CPF_CNPJ_CONSIGNATARIO'
      Size = 100
    end
    object cdsDadosDS_OBSERVACOES: TStringField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'DS_OBSERVACOES'
      Size = 1000
    end
    object cdsDadosDS_MERCADORIA: TStringField
      DisplayLabel = 'Mercadoria'
      FieldName = 'DS_MERCADORIA'
      Size = 1000
    end
    object cdsDadosDS_DETALHAMENTO: TStringField
      DisplayLabel = 'Detalhamento'
      FieldName = 'DS_DETALHAMENTO'
      FixedChar = True
      Size = 8000
    end
    object cdsDadosDS_DETALHAMENTO_QUEBRA_ITEM: TStringField
      FieldName = 'DS_DETALHAMENTO_QUEBRA_ITEM'
      FixedChar = True
      Size = 2000
    end
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 120
    Top = 419
  end
  object qryVerifica: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = datm_main.SQLConnection
    Left = 40
    Top = 250
  end
  object dspVerifica: TDataSetProvider
    DataSet = qryVerifica
    Left = 40
    Top = 299
  end
  object cdsVerifica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVerifica'
    Left = 40
    Top = 363
  end
  object dsVerifica: TDataSource
    DataSet = cdsVerifica
    Left = 40
    Top = 419
  end
  object dspDadosDivergencias: TDataSetProvider
    DataSet = qryDadosDivergencias
    Left = 224
    Top = 299
  end
  object qryDadosDivergencias: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = datm_main.SQLConnection
    Left = 224
    Top = 250
    object qryDadosDivergenciasCD_DADOS_CON_SITE_TER: TIntegerField
      FieldName = 'CD_DADOS_CON_SITE_TER'
      Required = True
    end
    object qryDadosDivergenciasDT_CONSULTA: TSQLTimeStampField
      FieldName = 'DT_CONSULTA'
    end
    object qryDadosDivergenciasCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qryDadosDivergenciasNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Required = True
      FixedChar = True
      Size = 50
    end
    object qryDadosDivergenciasCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qryDadosDivergenciasNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object qryDadosDivergenciasNR_CE_MERCANTE: TStringField
      FieldName = 'NR_CE_MERCANTE'
      FixedChar = True
    end
    object qryDadosDivergenciasNR_BL: TStringField
      FieldName = 'NR_BL'
      FixedChar = True
      Size = 60
    end
    object qryDadosDivergenciasNR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      FixedChar = True
    end
    object qryDadosDivergenciasDT_OPERACAO: TSQLTimeStampField
      FieldName = 'DT_OPERACAO'
    end
    object qryDadosDivergenciasCD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      FixedChar = True
      Size = 10
    end
    object qryDadosDivergenciasDS_EMBARCACAO: TStringField
      FieldName = 'DS_EMBARCACAO'
      FixedChar = True
      Size = 71
    end
    object qryDadosDivergenciasDS_PORTO_CARREGAMENTO: TStringField
      FieldName = 'DS_PORTO_CARREGAMENTO'
      FixedChar = True
      Size = 10
    end
    object qryDadosDivergenciasDS_PORTO_DESCARREGAMENTO: TStringField
      FieldName = 'DS_PORTO_DESCARREGAMENTO'
      FixedChar = True
      Size = 10
    end
    object qryDadosDivergenciasIC_STATUS: TStringField
      FieldName = 'IC_STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryDadosDivergenciasCGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      FixedChar = True
      Size = 18
    end
    object qryDadosDivergenciasIC_STATUS_DESC: TStringField
      FieldName = 'IC_STATUS_DESC'
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryDadosDivergenciasNM_NOTIFY_IDENTIFICACAO: TStringField
      FieldName = 'NM_NOTIFY_IDENTIFICACAO'
      FixedChar = True
      Size = 150
    end
    object qryDadosDivergenciasNM_NOTIFY_CNPJ: TStringField
      FieldName = 'NM_NOTIFY_CNPJ'
      FixedChar = True
    end
    object qryDadosDivergenciasNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
    end
    object qryDadosDivergenciasDT_OPERACAO_BROKER: TSQLTimeStampField
      FieldName = 'DT_OPERACAO_BROKER'
    end
  end
  object cdsDadosDivergencias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDadosDivergencias'
    Left = 224
    Top = 363
    object cdsDadosDivergenciasCD_DADOS_CON_SITE_TER: TIntegerField
      DisplayLabel = 'Cod Dados Consulta'
      FieldName = 'CD_DADOS_CON_SITE_TER'
      Required = True
    end
    object cdsDadosDivergenciasDT_CONSULTA: TSQLTimeStampField
      DisplayLabel = 'Data Consulta'
      FieldName = 'DT_CONSULTA'
    end
    object cdsDadosDivergenciasCD_GRUPO: TStringField
      DisplayLabel = 'Cod. Grupo'
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object cdsDadosDivergenciasNM_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      FieldName = 'NM_GRUPO'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsDadosDivergenciasCD_EMPRESA: TStringField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object cdsDadosDivergenciasNM_EMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object cdsDadosDivergenciasNR_CE_MERCANTE: TStringField
      DisplayLabel = 'CE Mercante'
      FieldName = 'NR_CE_MERCANTE'
      FixedChar = True
    end
    object cdsDadosDivergenciasNR_BL: TStringField
      DisplayLabel = 'Nr BL'
      FieldName = 'NR_BL'
      FixedChar = True
      Size = 60
    end
    object cdsDadosDivergenciasNR_MANIFESTO: TStringField
      DisplayLabel = 'Manifesto'
      FieldName = 'NR_MANIFESTO'
      FixedChar = True
    end
    object cdsDadosDivergenciasDT_OPERACAO: TSQLTimeStampField
      DisplayLabel = 'Data Opera'#231#227'o'
      FieldName = 'DT_OPERACAO'
    end
    object cdsDadosDivergenciasCD_EMBARCACAO: TStringField
      DisplayLabel = 'Cod. Embarca'#231#227'o'
      FieldName = 'CD_EMBARCACAO'
      FixedChar = True
      Size = 10
    end
    object cdsDadosDivergenciasDS_EMBARCACAO: TStringField
      DisplayLabel = 'Embarca'#231#227'o'
      FieldName = 'DS_EMBARCACAO'
      FixedChar = True
      Size = 71
    end
    object cdsDadosDivergenciasDS_PORTO_CARREGAMENTO: TStringField
      DisplayLabel = 'Porto Carregamento'
      FieldName = 'DS_PORTO_CARREGAMENTO'
      FixedChar = True
      Size = 10
    end
    object cdsDadosDivergenciasIC_STATUS: TStringField
      FieldName = 'IC_STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDadosDivergenciasDS_PORTO_DESCARREGAMENTO: TStringField
      DisplayLabel = 'Porto Descarregamento'
      FieldName = 'DS_PORTO_DESCARREGAMENTO'
      FixedChar = True
      Size = 10
    end
    object cdsDadosDivergenciasCGC_EMPRESA: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'CGC_EMPRESA'
      FixedChar = True
      Size = 18
    end
    object cdsDadosDivergenciasIC_STATUS_DESC: TStringField
      FieldName = 'IC_STATUS_DESC'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsDadosDivergenciasNM_NOTIFY_IDENTIFICACAO: TStringField
      DisplayLabel = 'Notify'
      FieldName = 'NM_NOTIFY_IDENTIFICACAO'
      FixedChar = True
      Size = 150
    end
    object cdsDadosDivergenciasNM_NOTIFY_CNPJ: TStringField
      DisplayLabel = 'Notify CNPJ'
      FieldName = 'NM_NOTIFY_CNPJ'
      FixedChar = True
    end
    object cdsDadosDivergenciasNR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      FixedChar = True
    end
    object cdsDadosDivergenciasDT_OPERACAO_BROKER: TSQLTimeStampField
      DisplayLabel = 'Data Opera'#231#227'o Broker'
      FieldName = 'DT_OPERACAO_BROKER'
      DisplayFormat = 'DD/MM/YYYY'
    end
  end
  object dsDadosDivergencias: TDataSource
    DataSet = cdsDadosDivergencias
    Left = 224
    Top = 419
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.csv'
    Filter = 'Arquivo CSV (*.csv)|*.csv'
    Title = 'Salvar como'
    Left = 868
    Top = 257
  end
  object cdsDadosDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 775
    Top = 370
    object cdsDadosDetailDS_DETALHAMENTO: TStringField
      DisplayLabel = 'Detalhamento'
      FieldName = 'DS_DETALHAMENTO'
      Size = 1000
    end
  end
  object dsDadosDetail: TDataSource
    DataSet = cdsDadosDetail
    Left = 775
    Top = 424
  end
end
