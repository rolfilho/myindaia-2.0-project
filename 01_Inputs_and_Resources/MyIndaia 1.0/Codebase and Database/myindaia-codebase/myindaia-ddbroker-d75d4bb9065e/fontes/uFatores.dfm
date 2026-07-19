object frmFatores: TfrmFatores
  Left = 264
  Top = 96
  Width = 750
  Height = 550
  Caption = 'Fatores'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  DesignSize = (
    734
    512)
  PixelsPerInch = 96
  TextHeight = 13
  object pgcFatores: TPageControl
    Left = 0
    Top = 0
    Width = 734
    Height = 512
    ActivePage = tbsEventos
    Align = alClient
    Style = tsButtons
    TabHeight = 30
    TabOrder = 0
    OnChange = pgcFatoresChange
    OnChanging = pgcFatoresChanging
    object tbsFatores: TTabSheet
      Caption = 'Fatores'
      object cxgFatores: TcxGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 483
        Align = alClient
        TabOrder = 0
        object cxgdbtvFatores: TcxGridDBTableView
          DataController.DataSource = datmFatores.dsFatores
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.Header = cxsCaption
          object cxgdbtvFatoresCD_FATOR: TcxGridDBColumn
            DataBinding.FieldName = 'CD_FATOR'
            Width = 125
          end
          object cxgdbtvFatoresNM_FATOR: TcxGridDBColumn
            DataBinding.FieldName = 'NM_FATOR'
            Width = 655
          end
          object cxgdbtvFatoresLK_NM_GRUPO: TcxGridDBColumn
            Caption = 'Grupo de Clientes'
            DataBinding.FieldName = 'LK_NM_GRUPO'
            Width = 230
          end
          object cxgdbtvFatoresLK_NM_PRODUTO: TcxGridDBColumn
            Caption = 'Produto'
            DataBinding.FieldName = 'LK_NM_PRODUTO'
            Width = 180
          end
        end
        object cxglFatores: TcxGridLevel
          GridView = cxgdbtvFatores
        end
      end
    end
    object tbsDadosBasicosFator: TTabSheet
      Caption = 'Dados B'#225'sicos'
      ImageIndex = 5
      DesignSize = (
        726
        472)
      object Label1: TLabel
        Left = 8
        Top = 18
        Width = 37
        Height = 13
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 42
        Width = 62
        Height = 13
        Caption = 'Descri'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 67
        Width = 52
        Height = 13
        Caption = 'Unidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 235
        Top = 67
        Width = 49
        Height = 13
        Caption = 'Produto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 456
        Top = 67
        Width = 39
        Height = 13
        Caption = 'Grupo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 85
        Width = 57
        Height = 26
        Caption = 'Campo'#13#10'Processo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 8
        Top = 124
        Width = 72
        Height = 13
        Caption = 'Comparador:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 8
        Top = 148
        Width = 50
        Height = 13
        Caption = 'Retorno:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 596
        Top = 18
        Width = 55
        Height = 13
        Caption = 'Opcional:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 8
        Top = 188
        Width = 29
        Height = 13
        Caption = 'SQL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxdbtxtNM_FATOR: TcxDBTextEdit
        Left = 72
        Top = 15
        DataBinding.DataField = 'NM_FATOR'
        DataBinding.DataSource = datmFatores.dsFatores
        ParentFont = False
        TabOrder = 0
        Width = 305
      end
      object cxdbtxtDS_FATOR: TcxDBTextEdit
        Left = 72
        Top = 38
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'DS_FATOR'
        DataBinding.DataSource = datmFatores.dsFatores
        ParentFont = False
        TabOrder = 2
        Width = 661
      end
      object cxdblcbCD_UNID_NEG: TcxDBLookupComboBox
        Left = 83
        Top = 63
        DataBinding.DataField = 'CD_UNID_NEG'
        DataBinding.DataSource = datmFatores.dsFatores
        ParentFont = False
        Properties.KeyFieldNames = 'CD_UNID_NEG'
        Properties.ListColumns = <
          item
            Caption = 'C'#243'digo'
            FieldName = 'CD_UNID_NEG'
          end
          item
            Caption = 'Nome'
            FieldName = 'NM_UNID_NEG'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListSource = datmFatores.dsUnidades
        TabOrder = 3
        Width = 147
      end
      object cxdblcbCD_PRODUTO: TcxDBLookupComboBox
        Left = 291
        Top = 63
        DataBinding.DataField = 'CD_PRODUTO'
        DataBinding.DataSource = datmFatores.dsFatores
        ParentFont = False
        Properties.KeyFieldNames = 'CD_PRODUTO'
        Properties.ListColumns = <
          item
            Caption = 'C'#243'digo'
            FieldName = 'CD_PRODUTO'
          end
          item
            Caption = 'Nome'
            Width = 64
            FieldName = 'NM_PRODUTO'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListSource = datmFatores.dsProdutos
        TabOrder = 4
        Width = 159
      end
      object cxdblcbCD_GRUPO: TcxDBLookupComboBox
        Left = 514
        Top = 63
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'CD_GRUPO'
        DataBinding.DataSource = datmFatores.dsFatores
        ParentFont = False
        Properties.KeyFieldNames = 'CD_GRUPO'
        Properties.ListColumns = <
          item
            Caption = 'C'#243'digo'
            FieldName = 'CD_GRUPO'
          end
          item
            Caption = 'Nome'
            Width = 64
            FieldName = 'NM_GRUPO'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListSource = datmFatores.dsGrupos
        TabOrder = 5
        Width = 219
      end
      object cxdblcbNM_CAMPO_PROCESSO: TcxDBLookupComboBox
        Left = 83
        Top = 88
        DataBinding.DataField = 'NM_CAMPO_PROCESSO'
        DataBinding.DataSource = datmFatores.dsFatores
        ParentFont = False
        Properties.KeyFieldNames = 'NM_COLUNA'
        Properties.ListColumns = <
          item
            Caption = 'Campo'
            FieldName = 'NM_COLUNA'
          end>
        Properties.ListSource = datmFatores.dsCamposProcesso
        TabOrder = 6
        Width = 146
      end
      object cxdblcbCD_COMPARADOR: TcxDBLookupComboBox
        Left = 83
        Top = 121
        DataBinding.DataField = 'CD_COMPARADOR'
        DataBinding.DataSource = datmFatores.dsFatores
        ParentFont = False
        Properties.KeyFieldNames = 'CD_COMPARADOR'
        Properties.ListColumns = <
          item
            Caption = 'S'#237'mbolo'
            FieldName = 'CD_COMPARADOR'
          end
          item
            Caption = 'Descri'#231#227'o'
            FieldName = 'NM_COMPARADOR'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListSource = datmFatores.dsComparadores
        TabOrder = 7
        Width = 146
      end
      object cxdbtxtNM_RETORNO: TcxDBTextEdit
        Left = 83
        Top = 145
        DataBinding.DataField = 'NM_RETORNO'
        DataBinding.DataSource = datmFatores.dsFatores
        ParentFont = False
        TabOrder = 8
        Width = 146
      end
      object cxdblcbIN_OPCIONAL: TcxDBLookupComboBox
        Left = 654
        Top = 15
        DataBinding.DataField = 'IN_OPCIONAL'
        DataBinding.DataSource = datmFatores.dsFatores
        ParentFont = False
        Properties.KeyFieldNames = 'CD_OPCIONAL'
        Properties.ListColumns = <
          item
            Caption = 'Opcional'
            FieldName = 'NM_OPCIONAL'
          end>
        Properties.ListSource = datmFatores.dsOpcional
        TabOrder = 1
        Width = 79
      end
      object dbadvmNM_SQL: TDBAdvMemo
        Left = 41
        Top = 188
        Width = 692
        Height = 293
        Cursor = crIBeam
        ActiveLineSettings.ShowActiveLine = False
        ActiveLineSettings.ShowActiveLineIndicator = False
        Anchors = [akLeft, akTop, akRight]
        AutoCompletion.Font.Charset = DEFAULT_CHARSET
        AutoCompletion.Font.Color = clWindowText
        AutoCompletion.Font.Height = -11
        AutoCompletion.Font.Name = 'MS Sans Serif'
        AutoCompletion.Font.Style = []
        AutoCorrect.Active = True
        AutoHintParameterPosition = hpBelowCode
        BorderStyle = bsSingle
        CodeFolding.Enabled = False
        CodeFolding.LineColor = clGray
        Ctl3D = False
        DelErase = True
        EnhancedHomeKey = False
        Gutter.DigitCount = 4
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -13
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'COURIER NEW'
        Font.Style = []
        HiddenCaret = False
        Lines.Strings = (
          '')
        MarkerList.UseDefaultMarkerImageIndex = False
        MarkerList.DefaultMarkerImageIndex = -1
        MarkerList.ImageTransparentColor = 33554432
        PrintOptions.MarginLeft = 0
        PrintOptions.MarginRight = 0
        PrintOptions.MarginTop = 0
        PrintOptions.MarginBottom = 0
        PrintOptions.PageNr = False
        PrintOptions.PrintLineNumbers = False
        ReadOnly = False
        RightMarginColor = 14869218
        ScrollHint = False
        SelColor = clWhite
        SelBkColor = clNavy
        ShowRightMargin = True
        SmartTabs = False
        SyntaxStyles = AdvSQLMemoStyler1
        TabOrder = 9
        TabSize = 4
        TabStop = True
        TrimTrailingSpaces = False
        UndoLimit = 100
        UrlStyle.TextColor = clBlue
        UrlStyle.BkColor = clWhite
        UrlStyle.Style = [fsUnderline]
        UseStyler = True
        Version = '2.2.7.5'
        WordWrap = wwNone
        DataField = 'NM_SQL'
        DataSource = datmFatores.dsFatores
      end
      object cxgbTabela: TcxGroupBox
        Left = 240
        Top = 83
        Alignment = alTopCenter
        Caption = 'Tabela'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 10
        Height = 98
        Width = 494
        object Label7: TLabel
          Left = 11
          Top = 23
          Width = 44
          Height = 13
          Caption = 'Tabela:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 11
          Top = 49
          Width = 83
          Height = 13
          Caption = 'Campo Chave:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 11
          Top = 75
          Width = 92
          Height = 13
          Caption = 'Campo Retorno:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cxdblcbNM_TABELA: TcxDBLookupComboBox
          Left = 105
          Top = 19
          DataBinding.DataField = 'NM_TABELA'
          DataBinding.DataSource = datmFatores.dsFatores
          ParentFont = False
          Properties.KeyFieldNames = 'NM_TABELA'
          Properties.ListColumns = <
            item
              Caption = 'Tabela'
              FieldName = 'NM_TABELA'
            end>
          Properties.ListSource = datmFatores.dsTabelas
          TabOrder = 0
          Width = 230
        end
        object cxdblcbNM_CAMPO_CHAVE_TABELA: TcxDBLookupComboBox
          Left = 105
          Top = 45
          DataBinding.DataField = 'NM_CAMPO_CHAVE_TABELA'
          DataBinding.DataSource = datmFatores.dsFatores
          ParentFont = False
          Properties.KeyFieldNames = 'NM_COLUNA'
          Properties.ListColumns = <
            item
              Caption = 'Campo'
              FieldName = 'NM_COLUNA'
            end>
          Properties.ListSource = datmFatores.dsCamposTabela
          TabOrder = 1
          Width = 230
        end
        object cxdblcbNM_CAMPO_RETORNO_TABELA: TcxDBLookupComboBox
          Left = 105
          Top = 71
          DataBinding.DataField = 'NM_CAMPO_RETORNO_TABELA'
          DataBinding.DataSource = datmFatores.dsFatores
          ParentFont = False
          Properties.KeyFieldNames = 'NM_COLUNA'
          Properties.ListColumns = <
            item
              Caption = 'Campo'
              FieldName = 'NM_COLUNA'
            end>
          Properties.ListSource = datmFatores.dsCamposTabela
          TabOrder = 2
          Width = 230
        end
      end
    end
    object tbsServicos: TTabSheet
      Caption = 'Servicos'
      ImageIndex = 2
      object Label13: TLabel
        Left = 8
        Top = 21
        Width = 48
        Height = 13
        Caption = 'Servi'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgrdFatoresServicos: TDBGrid
        Left = 8
        Top = 58
        Width = 359
        Height = 143
        Ctl3D = False
        DataSource = datmFatores.dsFatoresServicos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'LK_NM_SERVICO'
            Title.Alignment = taCenter
            Title.Caption = 'Servi'#231'os'
            Width = 335
            Visible = True
          end>
      end
      object cxdblcbCD_SERVICO_FATOR: TcxDBLookupComboBox
        Left = 59
        Top = 18
        DataBinding.DataField = 'CD_SERVICO'
        DataBinding.DataSource = datmFatores.dsFatoresServicos
        ParentFont = False
        Properties.KeyFieldNames = 'CD_SERVICO'
        Properties.ListColumns = <
          item
            Caption = 'C'#243'digo'
            FieldName = 'CD_SERVICO'
          end
          item
            Caption = 'Nome'
            FieldName = 'NM_SERVICO'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListSource = datmFatores.dsServicos
        TabOrder = 1
        Width = 309
      end
    end
    object tbsCampos: TTabSheet
      Caption = 'Campos'
      ImageIndex = 3
    end
    object tbsTriggers: TTabSheet
      Caption = 'Triggers'
      ImageIndex = 4
    end
    object tbsEventos: TTabSheet
      Caption = 'Eventos'
      ImageIndex = 5
      object cxgEventos: TcxGrid
        Left = 0
        Top = 0
        Width = 726
        Height = 377
        Align = alClient
        TabOrder = 0
        object cxgdbbtvEventos: TcxGridDBBandedTableView
          DataController.DataSource = datmFatores.dsFatoresEvento
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsView.GroupByBox = False
          Styles.Header = cxsCaption
          Styles.BandHeader = cxsCaption
          Bands = <
            item
              Caption = 'Evento'
            end
            item
              Caption = 'Evento Anterior'
            end
            item
              Caption = 'Evento Base'
            end
            item
              Caption = 'Opera'#231#227'o'
            end
            item
              Caption = 'Servi'#231'o'
            end>
          object cxgdbbtvEventosCD_EVENTO: TcxGridDBBandedColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CD_EVENTO'
            Width = 75
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxgdbbtvEventosLK_NM_EVENTO: TcxGridDBBandedColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'LK_NM_EVENTO'
            Width = 250
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxgdbbtvEventosCD_EVENTO_ANTERIOR: TcxGridDBBandedColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CD_EVENTO_ANTERIOR'
            Width = 75
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxgdbbtvEventosLK_NM_EVENTO_ANTERIOR: TcxGridDBBandedColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'LK_NM_EVENTO_ANTERIOR'
            Width = 250
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxgdbbtvEventosCD_EVENTO_BASE: TcxGridDBBandedColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CD_EVENTO_BASE'
            Width = 75
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxgdbbtvEventosLK_NM_EVENTO_BASE: TcxGridDBBandedColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'LK_NM_EVENTO_BASE'
            Width = 250
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxgdbbtvEventosPZ_EVENTO_BASE: TcxGridDBBandedColumn
            Caption = 'Prazo'
            DataBinding.FieldName = 'PZ_EVENTO_BASE'
            Width = 75
            Position.BandIndex = 2
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxgdbbtvEventosNM_OPERACAO: TcxGridDBBandedColumn
            Caption = 'Opera'#231#227'o'
            DataBinding.FieldName = 'NM_OPERACAO'
            Width = 90
            Position.BandIndex = 3
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxgdbbtvEventosCD_SERVICO: TcxGridDBBandedColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CD_SERVICO'
            Width = 75
            Position.BandIndex = 4
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxgdbbtvEventosLK_NM_SERVICO: TcxGridDBBandedColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'LK_NM_SERVICO'
            Width = 250
            Position.BandIndex = 4
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
        end
        object cxglEventos: TcxGridLevel
          GridView = cxgdbbtvEventos
        end
      end
      object pnlDadosEventos: TPanel
        Left = 0
        Top = 377
        Width = 726
        Height = 95
        Align = alBottom
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object Label15: TLabel
          Left = 8
          Top = 11
          Width = 45
          Height = 13
          Caption = 'Evento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 8
          Top = 34
          Width = 49
          Height = 26
          Caption = 'Evento'#13#10'Anterior:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 344
          Top = 34
          Width = 41
          Height = 26
          Caption = 'Evento'#13#10'Base:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 6
          Top = 71
          Width = 37
          Height = 13
          Caption = 'Prazo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 116
          Top = 72
          Width = 26
          Height = 13
          Caption = 'horas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 344
          Top = 68
          Width = 48
          Height = 13
          Caption = 'Servi'#231'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cxdblcbCD_EVENTO: TcxDBLookupComboBox
          Left = 59
          Top = 7
          DataBinding.DataField = 'CD_EVENTO'
          DataBinding.DataSource = datmFatores.dsFatoresEvento
          ParentFont = False
          Properties.KeyFieldNames = 'CD_EVENTO'
          Properties.ListColumns = <
            item
              Caption = 'C'#243'digo'
              Width = 60
              FieldName = 'CD_EVENTO'
            end
            item
              Caption = 'Nome'
              FieldName = 'NM_EVENTO'
            end>
          Properties.ListFieldIndex = 1
          Properties.ListSource = datmFatores.dsEventos
          TabOrder = 0
          Width = 270
        end
        object cxdblcbCD_EVENTO_ANTERIOR: TcxDBLookupComboBox
          Left = 61
          Top = 37
          DataBinding.DataField = 'CD_EVENTO_ANTERIOR'
          DataBinding.DataSource = datmFatores.dsFatoresEvento
          ParentFont = False
          Properties.KeyFieldNames = 'CD_EVENTO'
          Properties.ListColumns = <
            item
              Caption = 'C'#243'digo'
              Width = 60
              FieldName = 'CD_EVENTO'
            end
            item
              Caption = 'Nome'
              FieldName = 'NM_EVENTO'
            end>
          Properties.ListFieldIndex = 1
          Properties.ListSource = datmFatores.dsEventos
          TabOrder = 4
          Width = 270
        end
        object cxdblcbCD_EVENTO_BASE: TcxDBLookupComboBox
          Left = 395
          Top = 37
          DataBinding.DataField = 'CD_EVENTO_BASE'
          DataBinding.DataSource = datmFatores.dsFatoresEvento
          ParentFont = False
          Properties.KeyFieldNames = 'CD_EVENTO'
          Properties.ListColumns = <
            item
              Caption = 'C'#243'digo'
              Width = 60
              FieldName = 'CD_EVENTO'
            end
            item
              Caption = 'Nome'
              FieldName = 'NM_EVENTO'
            end>
          Properties.ListFieldIndex = 1
          Properties.ListSource = datmFatores.dsEventos
          TabOrder = 5
          Width = 270
        end
        object cxdbspePZ_EVENTO_BASE: TcxDBSpinEdit
          Left = 59
          Top = 67
          DataBinding.DataField = 'PZ_EVENTO_BASE'
          DataBinding.DataSource = datmFatores.dsFatoresEvento
          TabOrder = 6
          Width = 52
        end
        object cxdblcbCD_SERVICO: TcxDBLookupComboBox
          Left = 397
          Top = 65
          DataBinding.DataField = 'CD_SERVICO'
          DataBinding.DataSource = datmFatores.dsFatoresEvento
          ParentFont = False
          Properties.KeyFieldNames = 'CD_SERVICO'
          Properties.ListColumns = <
            item
              Caption = 'C'#243'digo'
              Width = 60
              FieldName = 'CD_SERVICO'
            end
            item
              Caption = 'Nome'
              Width = 150
              FieldName = 'NM_SERVICO'
            end>
          Properties.ListFieldIndex = 1
          Properties.ListSource = datmFatores.dsServicos
          TabOrder = 9
          Width = 270
        end
        object cxdbchkIN_INCLUIR: TcxDBCheckBox
          Left = 341
          Top = 8
          Caption = 'Incluir'
          DataBinding.DataField = 'IN_INCLUIR'
          DataBinding.DataSource = datmFatores.dsFatoresEvento
          ParentFont = False
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 1
          OnMouseUp = cxdbchkIN_INCLUIRMouseUp
          Width = 62
        end
        object cxdbchkIN_ALTERAR: TcxDBCheckBox
          Left = 413
          Top = 8
          Caption = 'Alterar'
          DataBinding.DataField = 'IN_ALTERAR'
          DataBinding.DataSource = datmFatores.dsFatoresEvento
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 2
          Width = 62
        end
        object cxdbchkIN_EXCLUIR: TcxDBCheckBox
          Left = 493
          Top = 8
          Caption = 'Excluir'
          DataBinding.DataField = 'IN_EXCLUIR'
          DataBinding.DataSource = datmFatores.dsFatoresEvento
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 62
        end
        object cxdbchkIN_PRAZO_UTIL: TcxDBCheckBox
          Left = 149
          Top = 57
          Caption = 'Descontar Final de Semana'
          DataBinding.DataField = 'IN_PRAZO_UTIL'
          DataBinding.DataSource = datmFatores.dsFatoresEvento
          ParentFont = False
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 7
          OnMouseUp = cxdbchkIN_INCLUIRMouseUp
          Width = 180
        end
        object cxdbchkIN_PRAZO_FERIADO: TcxDBCheckBox
          Left = 149
          Top = 74
          Caption = 'Descontar Feriados'
          DataBinding.DataField = 'IN_PRAZO_FERIADO'
          DataBinding.DataSource = datmFatores.dsFatoresEvento
          ParentFont = False
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 8
          OnMouseUp = cxdbchkIN_INCLUIRMouseUp
          Width = 135
        end
      end
    end
  end
  object pnlBotoes: TPanel
    Left = 513
    Top = 0
    Width = 224
    Height = 32
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    DesignSize = (
      222
      30)
    object btnIncluir: TSpeedButton
      Left = 2
      Top = 1
      Width = 28
      Height = 28
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
      OnClick = btnIncluirClick
    end
    object btnSalvar: TSpeedButton
      Left = 34
      Top = 1
      Width = 28
      Height = 28
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
      OnClick = btnSalvarClick
    end
    object btnCancelar: TSpeedButton
      Left = 66
      Top = 1
      Width = 28
      Height = 28
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
      OnClick = btnCancelarClick
    end
    object btnExcluir: TSpeedButton
      Left = 98
      Top = 1
      Width = 28
      Height = 28
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
      OnClick = btnExcluirClick
    end
    object btnSair: TSpeedButton
      Left = 193
      Top = 1
      Width = 28
      Height = 28
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
      OnClick = btnSairClick
    end
    object btnFollowup: TSpeedButton
      Left = 146
      Top = 1
      Width = 28
      Height = 28
      Hint = 'Realiza'#231#227'o por Processo - <CTRL+F2>'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnFollowupClick
    end
  end
  object AdvSQLMemoStyler1: TAdvSQLMemoStyler
    AutoCompletion.Strings = (
      'SELECT'
      'WHERE')
    HintParameter.TextColor = clBlack
    HintParameter.BkColor = clInfoBk
    HintParameter.HintCharStart = '('
    HintParameter.HintCharEnd = ')'
    HintParameter.HintCharDelimiter = ';'
    HintParameter.HintCharWriteDelimiter = ','
    LineComment = '--'
    MultiCommentLeft = '/*'
    MultiCommentRight = '*/'
    CommentStyle.TextColor = clGreen
    CommentStyle.BkColor = clWhite
    CommentStyle.Style = [fsItalic]
    NumberStyle.TextColor = clBlack
    NumberStyle.BkColor = clWhite
    NumberStyle.Style = []
    AllStyles = <
      item
        KeyWords.Strings = (
          'and'
          'begin'
          'break'
          'by'
          'case'
          'close'
          'continue'
          'create'
          'deallocate'
          'declare'
          'delete'
          'do'
          'else'
          'end'
          'exec'
          'fetch'
          'for'
          'from'
          'group'
          'having'
          'if'
          'inner'
          'insert'
          'join'
          'left'
          'like'
          'not'
          'on'
          'open'
          'or'
          'order'
          'outer'
          'proc'
          'procedure'
          'repeat'
          'return'
          'right'
          'rollback'
          'select'
          'set'
          'to'
          'trans'
          'transaction'
          'until'
          'update'
          'values'
          'when'
          'where'
          'while')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'SQL Standard Default'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = '"'
        BracketEnd = '"'
        Info = 'Double Quote'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stSymbol
        BracketStart = #0
        BracketEnd = #0
        Symbols = ' ,;:.(){}[]=-*/^%<>#'#13#10
        Info = 'Symbols Delimiters'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = #39
        BracketEnd = #39
        Symbols = #39
        Info = 'Single Quote'
      end
      item
        KeyWords.Strings = (
          '$partition'
          '@@connections'
          '@@cpu_busy'
          '@@cursor_rows'
          '@@datefirst'
          '@@dbts'
          '@@error'
          '@@fetch_status'
          '@@identity'
          '@@idle'
          '@@io_busy'
          '@@langid'
          '@@language'
          '@@lock_timeout'
          '@@max_connections'
          '@@max_precision'
          '@@nestlevel'
          '@@options'
          '@@pack_received'
          '@@pack_sent'
          '@@packet_errors'
          '@@procid'
          '@@remserver'
          '@@servername'
          '@@servicename'
          '@@spid'
          '@@textsize'
          '@@timeticks'
          '@@total_errors'
          '@@total_read'
          '@@total_write'
          '@@trancount'
          '@@version'
          'abs'
          'acos'
          'app_name'
          'applock_mode'
          'applock_test'
          'ascii'
          'asin'
          'assemblyproperty'
          'atan'
          'atn2'
          'avg'
          'binary_checksum'
          'cast'
          'ceiling'
          'certencoded'
          'certprivatekey'
          'char'
          'charindex'
          'checksum'
          'checksum_agg'
          'choose'
          'col_length'
          'col_name'
          'columnproperty'
          'concat'
          'connectionproperty'
          'context_info'
          'convert'
          'cos'
          'cot'
          'count'
          'count_big'
          'current_request_id'
          'current_timestamp'
          'current_user'
          'cursor_status'
          'database_principal_id'
          'databasepropertyex'
          'dateadd'
          'datediff'
          'datefirst'
          'dateformat'
          'datefromparts'
          'datename'
          'datepart'
          'datetime2fromparts'
          'datetimefromparts'
          'datetimeoffsetfromparts'
          'day'
          'db_id'
          'db_name'
          'degrees'
          'dense_rank'
          'difference'
          'eomonth'
          'error_line'
          'error_message'
          'error_number'
          'error_procedure'
          'error_severity'
          'error_state'
          'exp'
          'file_id'
          'file_idex'
          'file_name'
          'filegroup_id'
          'filegroup_name'
          'filegroupproperty'
          'fileproperty'
          'floor'
          'fn_virtualfilestats'
          'format'
          'formatmessage'
          'fulltextcatalogproperty'
          'fulltextserviceproperty'
          'get_filestream_transaction_context'
          'getansinull'
          'getdate'
          'getutcdate'
          'grouping'
          'grouping_id'
          'has_perms_by_name'
          'host_id'
          'host_name'
          'iif'
          'index_col'
          'indexkey_property'
          'indexproperty'
          'is_member'
          'is_rolemember'
          'is_srvrolemember'
          'isdate'
          'isnull'
          'isnumeric'
          'left'
          'len'
          'log'
          'log10'
          'lower'
          'ltrim'
          'max'
          'min'
          'min_active_rowversion'
          'month'
          'nchar'
          'newid'
          'newsequentialid'
          'next value for'
          'ntile'
          'object_definition'
          'object_id'
          'object_name'
          'object_schema_name'
          'objectproperty'
          'objectpropertyex'
          'opendatasource'
          'openquery'
          'openrowset'
          'openxml'
          'original_db_name'
          'original_login'
          'original_login'
          'parse'
          'parsename'
          'patindex'
          'permissions'
          'pi'
          'power'
          'pwdcompare'
          'pwdencrypt'
          'quotename'
          'radians'
          'rand'
          'rank'
          'replace'
          'replicate'
          'reverse'
          'right'
          'round'
          'row_number'
          'rowcount_big'
          'rtrim'
          'schema_id'
          'schema_name'
          'scope_identity'
          'serverproperty'
          'session_user'
          'set language'
          'sign'
          'sin'
          'smalldatetimefromparts'
          'soundex'
          'space'
          'sqrt'
          'square'
          'stats_date'
          'stdev'
          'stdevp'
          'str'
          'stuff'
          'substring'
          'sum'
          'suser_id'
          'suser_name'
          'suser_sid'
          'suser_sname'
          'switchoffset'
          'sysdatetime'
          'sysdatetimeoffset'
          'system_user'
          'sysutcdatetime'
          'tan'
          'textptr'
          'textvalid'
          'timefromparts'
          'todatetimeoffset'
          'try_cast'
          'try_convert'
          'try_parse'
          'type_id'
          'type_name'
          'typeproperty'
          'unicode'
          'upper'
          'user_id'
          'user_name'
          'var'
          'varp'
          'xact_state'
          'year')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clFuchsia
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'Functions'
      end>
    Description = 'SQL'
    Filter = 'SQL Files (*.sql)|*.sql'
    DefaultExtension = '.sql'
    StylerName = 'SQL'
    Extensions = 'sql'
    Left = 204
    Top = 224
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 300
    Top = 220
    PixelsPerInch = 96
    object cxsCaption: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
end
