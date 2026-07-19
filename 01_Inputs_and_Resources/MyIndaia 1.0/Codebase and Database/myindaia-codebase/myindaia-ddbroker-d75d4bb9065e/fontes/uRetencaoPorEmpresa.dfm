object FrmControleRetencao: TFrmControleRetencao
  Left = 361
  Top = 143
  Width = 749
  Height = 550
  Caption = 'Controle de Reten'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 53
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      741
      53)
    object btn_sair: TSpeedButton
      Left = 694
      Top = 6
      Width = 41
      Height = 40
      Hint = 'Sair'
      Anchors = [akRight, akBottom]
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
    object Label1: TLabel
      Left = 318
      Top = 7
      Width = 20
      Height = 13
      Caption = 'M'#234's'
    end
    object Label2: TLabel
      Left = 454
      Top = 7
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object BtnCalcular: TSpeedButton
      Left = 505
      Top = 24
      Width = 24
      Height = 20
      Hint = 'Calcular'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnCalcularClick
    end
    object lbl_cd_unid_neg: TLabel
      Left = 8
      Top = 10
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
    object btn_cd_unid_neg: TSpeedButton
      Left = 285
      Top = 22
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
      OnClick = btn_cd_unid_negClick
    end
    object CmbMes: TComboBox
      Left = 318
      Top = 23
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'Janeiro'
      OnChange = CmbAnoChange
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object CmbAno: TComboBox
      Left = 454
      Top = 23
      Width = 49
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '2003'
      OnChange = CmbAnoChange
      Items.Strings = (
        '2003'
        '2004'
        '2005'
        '2006'
        '2007'
        '2008'
        '2009'
        '2010'
        '2011'
        '2012'
        '2013'
        '2014'
        '2015')
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 8
      Top = 23
      Width = 22
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
      OnExit = msk_cd_unid_negExit
    end
    object edt_nm_unid_neg: TEdit
      Left = 32
      Top = 23
      Width = 252
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
  end
  object pgctrl_ct_contabil: TPageControl
    Left = 0
    Top = 53
    Width = 741
    Height = 451
    ActivePage = ts_dados_basicos
    Align = alClient
    HotTrack = True
    TabOrder = 1
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 733
        Height = 423
        Align = alClient
        DataSource = dtsRetencao
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'nm_empresa'
            Title.Caption = 'Cliente'
            Width = 239
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_TOT_TRIBUT'
            Title.Caption = 'Valor Tribut'#225'vel'
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_COFINS'
            Title.Caption = 'Valor Cofins'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_IR'
            Title.Caption = 'Valor I.R.R.F'
            Width = 91
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Detalhes'
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 56
        Width = 733
        Height = 367
        Align = alClient
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Panel1: TPanel
          Left = 1
          Top = 1
          Width = 731
          Height = 365
          Align = alClient
          Caption = 'Panel1'
          TabOrder = 0
          object DBGrid2: TDBGrid
            Left = 1
            Top = 1
            Width = 729
            Height = 363
            Align = alClient
            DataSource = dtsRetencaoDetalhe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = DBGrid2DrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'DT_FATURA'
                Title.Alignment = taCenter
                Title.Caption = 'Data Fatura'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_VENC'
                Title.Alignment = taCenter
                Title.Caption = 'Data Vencimento'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_NOTA'
                Title.Alignment = taCenter
                Title.Caption = 'N'#186' Nota'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_SOLICITACAO'
                Title.Alignment = taCenter
                Title.Caption = 'Solicita'#231#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_TRIBUTAVEL'
                Title.Alignment = taCenter
                Title.Caption = 'Valor Tribut'#225'vel'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 115
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_COFINS_RETIDO'
                Title.Alignment = taCenter
                Title.Caption = 'Valor Cofins'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 115
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_IR_RETIDO'
                Title.Alignment = taCenter
                Title.Caption = 'Valor I.R.F.F.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 115
                Visible = True
              end>
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 733
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object lbl_cd_cliente: TLabel
          Left = 10
          Top = 6
          Width = 32
          Height = 13
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbedt_cd_cliente: TDBEdit
          Left = 238
          Top = 19
          Width = 123
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clMenu
          Ctl3D = False
          DataField = 'CGC_EMPRESA'
          DataSource = dtsRetencao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nm_cliente: TDBEdit
          Left = 11
          Top = 19
          Width = 226
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_EMPRESA'
          DataSource = dtsRetencao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object Panel3: TPanel
          Left = 370
          Top = 3
          Width = 360
          Height = 41
          BevelInner = bvLowered
          BevelOuter = bvSpace
          TabOrder = 2
          object Label3: TLabel
            Left = 34
            Top = 13
            Width = 103
            Height = 13
            Caption = 'Pis/Cofins/IR Retidos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 307
            Top = 13
            Width = 45
            Height = 13
            Caption = 'IR Retido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 178
            Top = 13
            Width = 87
            Height = 13
            Caption = 'Pis/Cofins Retidos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Panel4: TPanel
            Left = 8
            Top = 9
            Width = 24
            Height = 20
            Color = 12778494
            TabOrder = 0
          end
          object Panel5: TPanel
            Left = 278
            Top = 9
            Width = 24
            Height = 20
            Color = 16773606
            TabOrder = 1
          end
          object Panel7: TPanel
            Left = 151
            Top = 9
            Width = 24
            Height = 20
            Color = 15004899
            TabOrder = 2
          end
        end
      end
    end
    object ts_grafico: TTabSheet
      Caption = '     Gr'#225'fico     '
      TabVisible = False
      object tvw_grafico: TTreeView
        Left = 0
        Top = 0
        Width = 733
        Height = 423
        Align = alClient
        Indent = 19
        TabOrder = 0
      end
    end
  end
  object dtsRetencao: TDataSource
    DataSet = SqlRetencao
    Left = 412
    Top = 337
  end
  object SqlRetencao: TQuery
    AfterScroll = SqlRetencaoAfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select'
      
        '  COF.CGC_EMPRESA, Sum(COF.VL_TRIBUTAVEL) VL_TOT_TRIBUT, Sum(COF' +
        '.VL_COFINS_RETIDO) VL_COFINS, ISNULL(Sum(IR.VL_IR_RETIDO),0) VL_' +
        'IR'
      'from'
      '  TRETENCAO_COFINS COF'
      
        '  LEFT join TRETENCAO_IR IR on COF.NR_SOLICITACAO = IR.NR_SOLICI' +
        'TACAO AND IR.CD_UNID_NEG = COF.CD_UNID_NEG AND IR.CD_PRODUTO = C' +
        'OF.CD_PRODUTO'
      'where COF.CD_UNID_NEG = :CD_UNID_NEG'
      'group by'
      '  COF.CGC_EMPRESA')
    Left = 284
    Top = 335
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object SqlRetencaocd_cliente: TStringField
      FieldKind = fkLookup
      FieldName = 'cd_cliente'
      LookupDataSet = sqlEmpresa
      LookupKeyFields = 'CGC_EMPRESA'
      LookupResultField = 'CD_EMPRESA'
      KeyFields = 'CGC_EMPRESA'
      Lookup = True
    end
    object SqlRetencaonm_empresa: TStringField
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'nm_empresa'
      LookupDataSet = sqlEmpresa
      LookupKeyFields = 'CGC_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CGC_EMPRESA'
      Size = 40
      Lookup = True
    end
    object SqlRetencaoCGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'DBBROKER.TRETENCAO_COFINS.CGC_EMPRESA'
      FixedChar = True
      Size = 8
    end
    object SqlRetencaoVL_TOT_TRIBUT: TFloatField
      FieldName = 'VL_TOT_TRIBUT'
      Origin = 'DBBROKER.TRETENCAO_COFINS.VL_TRIBUTAVEL'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object SqlRetencaoVL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
      Origin = 'DBBROKER.TRETENCAO_COFINS.VL_COFINS_RETIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object SqlRetencaoVL_IR: TFloatField
      FieldName = 'VL_IR'
      Origin = 'DBBROKER.TRETENCAO_IR.VL_IR_RETIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object SqlRetencaoDetalhe: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT F.DT_FATURA, COF.DT_FATURA AS DT_VENC, COF.NR_NOTA, COF.N' +
        'R_SOLICITACAO, COF.VL_TRIBUTAVEL,'
      
        'COF.VL_COFINS, COF.IN_COFINS_RETIDO, IN_COFINS_RETIDO_ATUAL, VL_' +
        'COFINS_RETIDO,'
      
        'ISNULL(IR.VL_IR,0) VL_IR, ISNULL(IR.IN_IR_RETIDO,'#39'0'#39') IN_IR_RETI' +
        'DO, ISNULL(IR.IN_IR_RETIDO_ATUAL,0) IN_IR_RETIDO_ATUAL, ISNULL(I' +
        'R.VL_IR_RETIDO,0) VL_IR_RETIDO'
      'FROM TRETENCAO_COFINS COF'
      
        '  LEFT JOIN TRETENCAO_IR IR ON COF.NR_SOLICITACAO = IR.NR_SOLICI' +
        'TACAO AND IR.CD_UNID_NEG = COF.CD_UNID_NEG AND IR.CD_PRODUTO = C' +
        'OF.CD_PRODUTO'
      
        ' INNER JOIN TS_FATURA F ON F.CD_PRODUTO = COF.CD_PRODUTO AND F.C' +
        'D_UNID_NEG = COF.CD_UNID_NEG AND F.NR_SOLICITACAO = COF.NR_SOLIC' +
        'ITACAO'
      'WHERE COF.CD_UNID_NEG = :CD_UNID_NEG'
      'ORDER BY  COF.DT_FATURA, COF.NR_NOTA')
    Left = 284
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object SqlRetencaoDetalheDT_FATURA: TDateTimeField
      Alignment = taCenter
      FieldName = 'DT_FATURA'
      Origin = 'DBBROKER.TRETENCAO_COFINS.DT_FATURA'
    end
    object SqlRetencaoDetalheDT_VENC: TDateTimeField
      Alignment = taCenter
      FieldName = 'DT_VENC'
      Origin = 'DBBROKER.TRETENCAO_COFINS.DT_FATURA'
    end
    object SqlRetencaoDetalheNR_NOTA: TStringField
      Alignment = taCenter
      FieldName = 'NR_NOTA'
      Origin = 'DBBROKER.TRETENCAO_COFINS.NR_NOTA'
      FixedChar = True
      Size = 6
    end
    object SqlRetencaoDetalheNR_SOLICITACAO: TStringField
      Alignment = taCenter
      FieldName = 'NR_SOLICITACAO'
      Origin = 'DBBROKER.TRETENCAO_COFINS.NR_SOLICITACAO'
      FixedChar = True
      Size = 6
    end
    object SqlRetencaoDetalheVL_TRIBUTAVEL: TFloatField
      FieldName = 'VL_TRIBUTAVEL'
      Origin = 'DBBROKER.TRETENCAO_COFINS.VL_TRIBUTAVEL'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object SqlRetencaoDetalheVL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
      Origin = 'DBBROKER.TRETENCAO_COFINS.VL_COFINS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object SqlRetencaoDetalheIN_COFINS_RETIDO: TStringField
      FieldName = 'IN_COFINS_RETIDO'
      Origin = 'DBBROKER.TRETENCAO_COFINS.IN_COFINS_RETIDO'
      FixedChar = True
      Size = 1
    end
    object SqlRetencaoDetalheIN_COFINS_RETIDO_ATUAL: TStringField
      FieldName = 'IN_COFINS_RETIDO_ATUAL'
      Origin = 'DBBROKER.TRETENCAO_COFINS.IN_COFINS_RETIDO_ATUAL'
      FixedChar = True
      Size = 1
    end
    object SqlRetencaoDetalheVL_COFINS_RETIDO: TFloatField
      FieldName = 'VL_COFINS_RETIDO'
      Origin = 'DBBROKER.TRETENCAO_COFINS.VL_COFINS_RETIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object SqlRetencaoDetalheVL_IR: TFloatField
      FieldName = 'VL_IR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object SqlRetencaoDetalheIN_IR_RETIDO: TStringField
      FieldName = 'IN_IR_RETIDO'
      FixedChar = True
      Size = 1
    end
    object SqlRetencaoDetalheIN_IR_RETIDO_ATUAL: TStringField
      FieldName = 'IN_IR_RETIDO_ATUAL'
      FixedChar = True
      Size = 1
    end
    object SqlRetencaoDetalheVL_IR_RETIDO: TFloatField
      FieldName = 'VL_IR_RETIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object dtsRetencaoDetalhe: TDataSource
    DataSet = SqlRetencaoDetalhe
    Left = 412
    Top = 392
  end
  object MainMenu1: TMainMenu
    Left = 340
    Top = 188
    object Sair1: TMenuItem
      Caption = '&Sair'
      OnClick = btn_sairClick
    end
  end
  object sqlEmpresa: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_EMPRESA, NM_EMPRESA, SUBSTRING (CGC_EMPRESA, 1,8) AS C' +
        'GC_EMPRESA'
      'FROM TEMPRESA_NAC')
    Left = 493
    Top = 326
  end
end
