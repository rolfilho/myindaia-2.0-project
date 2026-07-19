object frmControleRecibo: TfrmControleRecibo
  Left = 327
  Top = 230
  Width = 923
  Height = 517
  Caption = 'Controle de Recibos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 915
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbl_unid_neg: TLabel
      Left = 9
      Top = 9
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_produto: TLabel
      Left = 151
      Top = 9
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 115
      Top = 22
      Width = 23
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
      OnClick = btn_co_unid_negClick
    end
    object btn_co_produto: TSpeedButton
      Left = 261
      Top = 22
      Width = 23
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
    object btnExecutar: TSpeedButton
      Left = 793
      Top = 12
      Width = 35
      Height = 35
      Hint = 'Executar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnExecutarClick
    end
    object lblFavorecido: TLabel
      Left = 383
      Top = 9
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Favorecido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 297
      Top = 10
      Width = 57
      Height = 13
      Caption = 'Processo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 704
      Top = 10
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Soma Valor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_nm_unid_neg: TEdit
      Left = 37
      Top = 23
      Width = 76
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object edt_nm_produto: TEdit
      Left = 183
      Top = 23
      Width = 76
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 8
      Top = 24
      Width = 29
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      OnChange = btn_co_unid_negClick
      OnExit = msk_cd_unid_negExit
    end
    object msk_cd_produto: TMaskEdit
      Left = 151
      Top = 23
      Width = 33
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 2
      OnChange = btn_co_produtoClick
      OnExit = msk_cd_produtoExit
    end
    object dbnvg: TDBNavigator
      Left = 612
      Top = 21
      Width = 88
      Height = 23
      DataSource = ds_ControleRecibos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object Panel4: TPanel
      Left = 869
      Top = 0
      Width = 46
      Height = 55
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 7
      DesignSize = (
        46
        55)
      object btn_sair: TSpeedButton
        Left = 5
        Top = 12
        Width = 35
        Height = 35
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
    object cbFavorecido: TComboBox
      Left = 382
      Top = 22
      Width = 222
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Text = 'Todos'
      OnChange = cbFavorecidoChange
      Items.Strings = (
        'Todos')
    end
    object msk_nr_processo_filtro: TMaskEdit
      Left = 295
      Top = 23
      Width = 77
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 14
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      OnExit = msk_nr_processo_filtroExit
    end
    object DBEdit1: TDBEdit
      Left = 704
      Top = 24
      Width = 85
      Height = 21
      DataField = 'VL_TOTAL'
      DataSource = ds_ControleRecibos
      TabOrder = 8
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 451
    Width = 915
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object lblStatus: TLabel
      Left = 158
      Top = 0
      Width = 140
      Height = 39
      Align = alLeft
      Alignment = taCenter
      Caption = 'Atualizando Registros ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlBottom
      Visible = False
    end
    object pnl_localiza_processo: TPanel
      Left = 0
      Top = 0
      Width = 158
      Height = 39
      Align = alLeft
      BevelOuter = bvNone
      Color = clSilver
      TabOrder = 0
      object lbl_nr_processo: TLabel
        Left = 5
        Top = 2
        Width = 112
        Height = 13
        Caption = 'Localizar Processo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object btn_co_processo: TSpeedButton
        Left = 120
        Top = 13
        Width = 23
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
        Visible = False
        OnClick = btn_co_processoClick
      end
      object msk_nr_processo: TMaskEdit
        Left = 6
        Top = 16
        Width = 109
        Height = 21
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        BevelKind = bkSoft
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 14
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnChange = msk_nr_processoChange
        OnExit = msk_nr_processoExit
      end
    end
  end
  object pnlMemo: TPanel
    Left = 0
    Top = 345
    Width = 915
    Height = 106
    Align = alBottom
    BevelInner = bvLowered
    BorderStyle = bsSingle
    TabOrder = 2
    Visible = False
    object Memo1: TMemo
      Left = 2
      Top = 2
      Width = 907
      Height = 98
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 16776176
      Lines.Strings = (
        
          'Os seguintes processos n'#227'o foram atualizados(No processo existem' +
          ' lan'#231'amentos do mesmo Favorecido sem o Recimento):')
      TabOrder = 0
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 55
    Width = 915
    Height = 290
    Align = alClient
    TabOrder = 3
    object cxgridrecibos: TcxGridDBTableView
      DataController.DataSource = ds_ControleRecibos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Filter.Enabled = False
      Filtering.CustomizeDialog = False
      Filtering.Visible = fvNever
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnSorting = False
      OptionsView.GroupByBox = False
      object cxgridrecibosIN_RECIBO: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ImmediatePost = True
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Properties.OnEditValueChanged = cxGrid1DBTableView1IN_RECIBOPropertiesEditValueChanged
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 20
        DataBinding.FieldName = 'IN_RECIBO'
        IsCaptionAssigned = True
      end
      object cxgridrecibosPROCESSO: TcxGridDBColumn
        Caption = 'Processo'
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 94
        DataBinding.FieldName = 'PROCESSO'
      end
      object cxgridrecibosNR_CONHECIMENTO: TcxGridDBColumn
        Caption = 'Conhecimento'
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.Sorting = False
        Width = 127
        DataBinding.FieldName = 'NR_CONHECIMENTO'
      end
      object cxgridrecibosNM_ITEM: TcxGridDBColumn
        Caption = 'Item'
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.Sorting = False
        Width = 142
        DataBinding.FieldName = 'NM_ITEM'
      end
      object cxgridrecibosVL_PAGTO: TcxGridDBColumn
        Caption = 'Valor'
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.Sorting = False
        Width = 95
        DataBinding.FieldName = 'VL_PAGTO'
      end
      object cxgridrecibosDT_PAGTO: TcxGridDBColumn
        Caption = 'Data'
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.Sorting = False
        Width = 103
        DataBinding.FieldName = 'DT_PAGTO'
      end
      object cxgridrecibosNM_EMPRESA: TcxGridDBColumn
        Caption = 'Cliente'
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.Sorting = False
        Width = 142
        DataBinding.FieldName = 'NM_EMPRESA'
      end
      object cxgridrecibosNM_FAVORECIDO: TcxGridDBColumn
        Caption = 'Favorecido'
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.Sorting = False
        Width = 210
        DataBinding.FieldName = 'NM_FAVORECIDO'
      end
      object cxgridrecibosDIAS_ATRASADO: TcxGridDBColumn
        Caption = 'Atraso'
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.Sorting = False
        Width = 73
        DataBinding.FieldName = 'DIAS_ATRASADO'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxgridrecibos
    end
  end
  object qry_ControleRecibos: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT S.NR_PROCESSO, S.NR_LANCAMENTO, SUBSTRING(S.NR_PROCESSO, ' +
        '5,10) PROCESSO, ISNULL(P.NR_CONHECIMENTO, '#39#39') NR_CONHECIMENTO,'
      
        '  I.NM_ITEM, S.VL_PAGTO, CONVERT(VARCHAR, S.DT_PAGTO, 103) DT_PA' +
        'GTO, E.NM_EMPRESA, F.NM_FAVORECIDO, ISNULL(convert(int,S.IN_RECI' +
        'BO),0) IN_RECIBO,'
      
        '  DATEDIFF(DAY, S.DT_PAGTO, CONVERT(DATETIME, CONVERT(VARCHAR, G' +
        'ETDATE(),103),103)) DIAS_ATRASADO'
      'FROM TSOLIC_PAGTO S'
      
        '  INNER JOIN TPROCESSO P ON P.NR_PROCESSO = S.NR_PROCESSO AND P.' +
        'IN_CANCELADO = '#39'0'#39
      
        '  INNER JOIN TITEM I ON I.CD_ITEM = S.CD_ITEM AND I.IN_RECIBO = ' +
        #39'1'#39' AND I.IN_ATIVO = '#39'1'#39
      
        '  INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_CLIENTE AND E' +
        '.IN_ATIVO = '#39'1'#39
      
        '  INNER JOIN TFAVORECIDO F ON F.CD_FAVORECIDO = S.CD_FAVORECIDO ' +
        'AND F.IN_ATIVO = '#39'1'#39
      'WHERE ISNULL(S.IN_RECIBO, '#39'0'#39') = '#39'0'#39
      '  AND DATEPART(YEAR,S.DT_PAGTO ) > '#39'2010'#39
      '  AND P.CD_UNID_NEG = :CD_UNID_NEG'
      '  AND P.CD_PRODUTO = :CD_PRODUTO'
      '  AND (P.NR_PROCESSO = :NR_PROCESSO or :NR_PROCESSO = '#39#39')  '
      
        '  AND ( ( F.NM_FAVORECIDO = :NM_FAVORECIDO ) OR ( :NM_FAVORECIDO' +
        ' = '#39'Todos'#39' ) )      '
      '  AND ISNULL(DT_PAGTO, '#39#39') <> '#39#39' AND S.CD_STATUS IN ('#39'7'#39','#39'16'#39')'
      'ORDER BY S.NR_PROCESSO, S.DT_PAGTO, I.NM_ITEM')
    Left = 424
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NM_FAVORECIDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NM_FAVORECIDO'
        ParamType = ptInput
      end>
    object qry_ControleRecibosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_ControleRecibosNR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      FixedChar = True
      Size = 3
    end
    object qry_ControleRecibosNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_ControleRecibosVL_PAGTO: TFloatField
      FieldName = 'VL_PAGTO'
      DisplayFormat = '0.,00'
      EditFormat = '0.,00'
    end
    object qry_ControleRecibosDT_PAGTO: TStringField
      FieldName = 'DT_PAGTO'
      FixedChar = True
      Size = 30
    end
    object qry_ControleRecibosNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_ControleRecibosNM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      FixedChar = True
      Size = 50
    end
    object qry_ControleRecibosDIAS_ATRASADO: TIntegerField
      FieldName = 'DIAS_ATRASADO'
    end
    object qry_ControleRecibosPROCESSO: TStringField
      FieldName = 'PROCESSO'
      FixedChar = True
      Size = 10
    end
    object qry_ControleRecibosNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qry_ControleRecibosIN_RECIBO: TIntegerField
      FieldName = 'IN_RECIBO'
    end
  end
  object ds_ControleRecibos: TDataSource
    DataSet = cds_ControleRecibos
    Left = 552
    Top = 112
  end
  object cds_ControleRecibos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NM_FAVORECIDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NM_FAVORECIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_ControleRecibos'
    Left = 400
    Top = 192
    object cds_ControleRecibosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object cds_ControleRecibosNR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      FixedChar = True
      Size = 3
    end
    object cds_ControleRecibosNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object cds_ControleRecibosVL_PAGTO: TFloatField
      FieldName = 'VL_PAGTO'
      DisplayFormat = '0.,00'
      EditFormat = '0.,00'
    end
    object cds_ControleRecibosDT_PAGTO: TStringField
      FieldName = 'DT_PAGTO'
      FixedChar = True
      Size = 30
    end
    object cds_ControleRecibosNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object cds_ControleRecibosNM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      FixedChar = True
      Size = 50
    end
    object cds_ControleRecibosDIAS_ATRASADO: TIntegerField
      FieldName = 'DIAS_ATRASADO'
    end
    object cds_ControleRecibosPROCESSO: TStringField
      FieldName = 'PROCESSO'
      FixedChar = True
      Size = 10
    end
    object cds_ControleRecibosNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object cds_ControleRecibosIN_RECIBO: TIntegerField
      FieldName = 'IN_RECIBO'
    end
    object cds_ControleRecibosVL_TOTAL: TAggregateField
      FieldName = 'VL_TOTAL'
      ReadOnly = True
      Active = True
      currency = True
      Expression = 'SUM(IN_RECIBO * VL_PAGTO)'
    end
  end
  object dsp_ControleRecibos: TDataSetProvider
    DataSet = qry_ControleRecibos
    Options = [poAutoRefresh]
    Left = 552
    Top = 160
  end
  object qry_FavorecidosControle: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT F.CD_FAVORECIDO, F.NM_FAVORECIDO'
      'FROM TSOLIC_PAGTO S'
      
        '  INNER JOIN TPROCESSO P ON P.NR_PROCESSO = S.NR_PROCESSO AND P.' +
        'IN_CANCELADO = '#39'0'#39
      
        '  INNER JOIN TITEM I ON I.CD_ITEM = S.CD_ITEM AND I.IN_RECIBO = ' +
        #39'1'#39' AND I.IN_ATIVO = '#39'1'#39
      
        '  INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_CLIENTE AND E' +
        '.IN_ATIVO = '#39'1'#39
      
        '  INNER JOIN TFAVORECIDO F ON F.CD_FAVORECIDO = S.CD_FAVORECIDO ' +
        'AND F.IN_ATIVO = '#39'1'#39
      'WHERE ISNULL(S.IN_RECIBO, '#39'0'#39') = '#39'0'#39
      '  AND S.DT_PAGTO > CONVERT(DATETIME, '#39'13/11/2009'#39', 103)'
      '  AND P.CD_UNID_NEG = :CD_UNID_NEG'
      '  AND P.CD_PRODUTO  = :CD_PRODUTO'
      '  AND (P.NR_PROCESSO = :NR_PROCESSO or :NR_PROCESSO = '#39#39') '
      
        '  AND ISNULL(DT_PAGTO, '#39#39') <> '#39#39' AND S.CD_STATUS NOT IN ('#39'4'#39', '#39'1' +
        '7'#39')'
      'ORDER BY F.NM_FAVORECIDO')
    Left = 288
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_FavorecidosControleCD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      FixedChar = True
      Size = 5
    end
    object qry_FavorecidosControleNM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      FixedChar = True
      Size = 50
    end
  end
end
