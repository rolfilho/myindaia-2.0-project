object frmCartaConfig: TfrmCartaConfig
  Left = 346
  Top = 271
  AutoScroll = False
  Caption = 'M'#243'dulo de Configura'#231#227'o das Cartas'
  ClientHeight = 364
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 46
    Width = 449
    Height = 318
    Align = alClient
    TabOrder = 0
    object dbgrdVariaveis: TDBGrid
      Left = 1
      Top = 50
      Width = 447
      Height = 229
      Align = alClient
      Ctl3D = False
      DataSource = dsCartasConfig
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrdVariaveisDrawColumnCell
      OnTitleClick = dbgrdVariaveisTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'calcNomeVariavel'
          Title.Caption = 'Nome Vari'#225'vel'
          Width = 290
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calcTabela'
          Title.Caption = 'Tabela Base'
          Width = 117
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 447
      Height = 49
      Align = alTop
      TabOrder = 1
      object lbl3: TLabel
        Left = 358
        Top = 3
        Width = 53
        Height = 13
        Caption = 'Importa'#231#227'o'
      end
      object lbl4: TLabel
        Left = 359
        Top = 18
        Width = 54
        Height = 13
        Caption = 'Exporta'#231#227'o'
      end
      object lbl5: TLabel
        Left = 359
        Top = 33
        Width = 32
        Height = 13
        Caption = 'Ambos'
      end
      object shp4: TShape
        Left = 343
        Top = 18
        Width = 12
        Height = 12
        Brush.Color = 16773060
      end
      object shp5: TShape
        Left = 343
        Top = 33
        Width = 12
        Height = 12
      end
      object Shape2: TShape
        Left = 343
        Top = 3
        Width = 12
        Height = 12
        Brush.Color = 12058623
      end
      object Label1: TLabel
        Left = 6
        Top = 3
        Width = 69
        Height = 13
        Caption = 'Nome Vari'#225'vel'
      end
      object edtVariavelSelecionada: TEdit
        Left = 421
        Top = 3
        Width = 24
        Height = 14
        TabOrder = 0
        Visible = False
      end
      object lblFiltro: TEdit
        Left = 6
        Top = 19
        Width = 213
        Height = 21
        TabOrder = 1
      end
      object btnPesquisar: TBitBtn
        Left = 221
        Top = 17
        Width = 30
        Height = 25
        TabOrder = 2
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
    end
    object Panel5: TPanel
      Left = 1
      Top = 279
      Width = 447
      Height = 38
      Align = alBottom
      TabOrder = 2
      DesignSize = (
        447
        38)
      object btnInserir: TSpeedButton
        Left = 342
        Top = 3
        Width = 94
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Inserir Variavel'
        Enabled = False
        OnClick = btnInserirClick
      end
      object lbl2: TLabel
        Left = 6
        Top = 2
        Width = 229
        Height = 33
        Caption = 
          '1. Selecione a variavel desejada'#13#10'2. Posicione onde dever'#225' apare' +
          'cer no docto.'#13#10'3. Click em "Inserir Vari'#225'vel"'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Small Fonts'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 46
    Align = alTop
    Alignment = taLeftJustify
    Caption = '     Selecionar Vari'#225'vel  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Panel4: TPanel
      Left = 406
      Top = 1
      Width = 42
      Height = 44
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btn_sair: TSpeedButton
        Left = 5
        Top = 8
        Width = 33
        Height = 34
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
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 405
      Height = 44
      Align = alClient
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        405
        44)
      object btnOpen: TSpeedButton
        Left = 323
        Top = 7
        Width = 33
        Height = 34
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
        OnClick = btnOpenClick
      end
      object btnSave: TSpeedButton
        Left = 358
        Top = 7
        Width = 33
        Height = 34
        Anchors = [akTop, akRight]
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        OnClick = btnSaveClick
      end
      object lblArquivo: TLabel
        Left = 4
        Top = 2
        Width = 277
        Height = 13
        Caption = 'Digite o arquivo desejado. Deixe em branco para um novo.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object docArquivos: TFilenameEdit
        Left = 4
        Top = 17
        Width = 304
        Height = 21
        FileEditStyle = fsComboBox
        Filter = 'WORD Files (*.doc)|*.doc'
        InitialDir = 'H:\DDBroker\DocumentosWORD'
        DialogTitle = 'Arquivos de Cartas'
        Ctl3D = False
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 1
        ParentCtl3D = False
        TabOrder = 0
      end
    end
  end
  object qryCartasConfig: TQuery
    OnCalcFields = qryCartasConfigCalcFields
    DatabaseName = 'DBBROKER'
    Left = 261
    Top = 223
    object qryCartasConfigcalcNomeVariavel: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNomeVariavel'
      Size = 80
      Calculated = True
    end
    object qryCartasConfigCD_CARTAS_CONFIG: TIntegerField
      FieldName = 'CD_CARTAS_CONFIG'
      Origin = 'BROKER.TCARTAS_CONFIG.CD_CARTAS_CONFIG'
    end
    object qryCartasConfigTX_CARTAS_CONFIG: TStringField
      FieldName = 'TX_CARTAS_CONFIG'
      Origin = 'BROKER.TCARTAS_CONFIG.TX_CARTAS_CONFIG'
      FixedChar = True
      Size = 50
    end
    object qryCartasConfigNM_CAMPO: TStringField
      FieldName = 'NM_CAMPO'
      Origin = 'BROKER.TCARTAS_CONFIG.NM_CAMPO'
      FixedChar = True
      Size = 50
    end
    object qryCartasConfigNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      Origin = 'BROKER.TCARTAS_CONFIG.NM_TABELA'
      FixedChar = True
      Size = 50
    end
    object qryCartasConfigNM_JOIN: TStringField
      FieldName = 'NM_JOIN'
      Origin = 'BROKER.TCARTAS_CONFIG.NM_JOIN'
      FixedChar = True
      Size = 80
    end
    object qryCartasConfigIN_TABELA: TStringField
      FieldName = 'IN_TABELA'
      Origin = 'DBBROKER.TCARTAS_CONFIG.IN_TABELA'
      FixedChar = True
      Size = 1
    end
    object qryCartasConfigcalcTabela: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcTabela'
      Calculated = True
    end
    object qryCartasConfigIN_VARIOS_REGISTROS: TStringField
      FieldName = 'IN_VARIOS_REGISTROS'
      Origin = 'DBBROKER.TCARTAS_CONFIG.IN_VARIOS_REGISTROS'
      FixedChar = True
      Size = 1
    end
    object qryCartasConfigTP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      Origin = 'DBBROKER.TCARTAS_CONFIG.TP_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryCartasConfigcalcProduto: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcProduto'
      Calculated = True
    end
    object qryCartasConfigcalcVarios: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcVarios'
      Size = 3
      Calculated = True
    end
    object qryCartasConfigNM_SQL_MANUAL: TMemoField
      FieldName = 'NM_SQL_MANUAL'
      Origin = 'DBBROKER.TCARTAS_CONFIG.NM_SQL_MANUAL'
      BlobType = ftMemo
    end
  end
  object dsCartasConfig: TDataSource
    DataSet = cdsCartasConfig
    Left = 32
    Top = 226
  end
  object cdsCartasConfig: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCartasConfig'
    Left = 108
    Top = 223
    object cdsCartasConfigcalcNomeVariavel: TStringField
      FieldName = 'calcNomeVariavel'
      ReadOnly = True
      Size = 80
    end
    object cdsCartasConfigCD_CARTAS_CONFIG: TIntegerField
      FieldName = 'CD_CARTAS_CONFIG'
      Origin = 'BROKER.TCARTAS_CONFIG.CD_CARTAS_CONFIG'
    end
    object cdsCartasConfigTX_CARTAS_CONFIG: TStringField
      FieldName = 'TX_CARTAS_CONFIG'
      Origin = 'BROKER.TCARTAS_CONFIG.TX_CARTAS_CONFIG'
      FixedChar = True
      Size = 50
    end
    object cdsCartasConfigNM_CAMPO: TStringField
      FieldName = 'NM_CAMPO'
      Origin = 'BROKER.TCARTAS_CONFIG.NM_CAMPO'
      FixedChar = True
      Size = 50
    end
    object cdsCartasConfigNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      Origin = 'BROKER.TCARTAS_CONFIG.NM_TABELA'
      FixedChar = True
      Size = 50
    end
    object cdsCartasConfigNM_JOIN: TStringField
      FieldName = 'NM_JOIN'
      Origin = 'BROKER.TCARTAS_CONFIG.NM_JOIN'
      FixedChar = True
      Size = 80
    end
    object cdsCartasConfigIN_TABELA: TStringField
      FieldName = 'IN_TABELA'
      Origin = 'DBBROKER.TCARTAS_CONFIG.IN_TABELA'
      FixedChar = True
      Size = 1
    end
    object cdsCartasConfigcalcTabela: TStringField
      FieldName = 'calcTabela'
      ReadOnly = True
    end
    object cdsCartasConfigIN_VARIOS_REGISTROS: TStringField
      FieldName = 'IN_VARIOS_REGISTROS'
      Origin = 'DBBROKER.TCARTAS_CONFIG.IN_VARIOS_REGISTROS'
      FixedChar = True
      Size = 1
    end
    object cdsCartasConfigTP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      Origin = 'DBBROKER.TCARTAS_CONFIG.TP_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object cdsCartasConfigcalcProduto: TStringField
      FieldName = 'calcProduto'
      ReadOnly = True
    end
    object cdsCartasConfigcalcVarios: TStringField
      FieldName = 'calcVarios'
      ReadOnly = True
      Size = 3
    end
    object cdsCartasConfigNM_SQL_MANUAL: TMemoField
      FieldName = 'NM_SQL_MANUAL'
      Origin = 'DBBROKER.TCARTAS_CONFIG.NM_SQL_MANUAL'
      BlobType = ftMemo
    end
  end
  object dspCartasConfig: TDataSetProvider
    DataSet = qryCartasConfig
    Left = 190
    Top = 228
  end
end
