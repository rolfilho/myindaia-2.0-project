object frmExpIntegraRAP: TfrmExpIntegraRAP
  Left = 369
  Top = 240
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 471
  ClientWidth = 637
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 87
    Width = 637
    Height = 336
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 8
    Caption = 'Panel2'
    TabOrder = 2
    object Button1: TButton
      Left = 520
      Top = 240
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      Visible = False
      OnClick = Button1Click
    end
    object cxGrid: TcxGrid
      Left = 8
      Top = 8
      Width = 621
      Height = 320
      Align = alClient
      TabOrder = 1
      object cxGridDBTableView: TcxGridDBTableView
        DataController.DataSource = dsAutorizados
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object cxGridDBTableViewEMBARQUE: TcxGridDBColumn
          Caption = 'Embarque'
          DataBinding.FieldName = 'EMBARQUE'
          Width = 70
        end
        object cxGridDBTableViewcalcRapsEnvolvidas: TcxGridDBColumn
          Caption = 'Faturas Autorizadas para o Embarque'
          DataBinding.FieldName = 'calcRapsEnvolvidas'
          Width = 320
        end
        object cxGridDBTableViewDT_INSERCAO: TcxGridDBColumn
          Caption = 'Inserido em:'
          DataBinding.FieldName = 'DT_INSERCAO'
        end
        object cxGridDBTableViewCD_EMBARQUE: TcxGridDBColumn
          DataBinding.FieldName = 'CD_EMBARQUE'
          Visible = False
        end
        object cxGridDBTableViewCD_EMBARQUE_ANO: TcxGridDBColumn
          DataBinding.FieldName = 'CD_EMBARQUE_ANO'
          Visible = False
        end
        object cxGridDBTableViewCD_GRUPO: TcxGridDBColumn
          DataBinding.FieldName = 'CD_GRUPO'
          Visible = False
        end
        object cxGridDBTableViewFORNECIMENTOS: TcxGridDBColumn
          Caption = 'Fornecimentos'
          DataBinding.FieldName = 'FORNECIMENTOS'
          Width = 83
        end
      end
      object cxGridLevel: TcxGridLevel
        GridView = cxGridDBTableView
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 29
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object lblTit: TLabel
      Left = 9
      Top = 7
      Width = 255
      Height = 16
      Caption = 'Instru'#231#245'es de Embarque Autorizadas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_sair: TSpeedButton
      Left = 595
      Top = 3
      Width = 24
      Height = 23
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
  object pnl2: TPanel
    Left = 0
    Top = 29
    Width = 637
    Height = 58
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 396
      Top = 9
      Width = 53
      Height = 13
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label43: TLabel
      Left = 10
      Top = 9
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
    object Label84: TLabel
      Left = 202
      Top = 9
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
    object edtProcesso: TEdit
      Left = 396
      Top = 23
      Width = 93
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = 'edtProcesso'
    end
    object edtNmUnidade: TEdit
      Left = 45
      Top = 23
      Width = 144
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edtNmProduto: TEdit
      Left = 239
      Top = 23
      Width = 144
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object edtCdUnidade: TEdit
      Left = 11
      Top = 23
      Width = 35
      Height = 21
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 2
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnChange = edtCdUnidadeChange
    end
    object mskCdProduto: TMaskEdit
      Left = 203
      Top = 23
      Width = 37
      Height = 21
      Color = clBtnFace
      EditMask = '!99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 2
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      OnChange = mskCdProdutoChange
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 423
    Width = 637
    Height = 48
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    object btnEstornar: TSpeedButton
      Left = 325
      Top = 7
      Width = 146
      Height = 32
      Caption = 'Estornar Embarque'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      Visible = False
      OnClick = btnEstornarClick
    end
    object btnEstornarDoc: TSpeedButton
      Left = 30
      Top = 7
      Width = 146
      Height = 32
      Caption = 'Estornar Documentos'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      Visible = False
      OnClick = btnEstornarDocClick
    end
    object btnIntegrarDoc: TSpeedButton
      Left = 178
      Top = 7
      Width = 146
      Height = 32
      Caption = 'Integrar Documentos'
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
      Visible = False
      OnClick = btnIntegrarDocClick
    end
    object btnIntegrar: TSpeedButton
      Left = 472
      Top = 7
      Width = 146
      Height = 32
      Caption = 'Integrar Embarque'
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
      Visible = False
      OnClick = btnIntegrarClick
    end
  end
  object qryAutorizados: TQuery
    OnCalcFields = qryAutorizadosCalcFields
    DatabaseName = 'DBBROKER'
    Left = 544
    Top = 135
    object qryAutorizadoscalcRapsEnvolvidas: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcRapsEnvolvidas'
      Size = 100
      Calculated = True
    end
    object qryAutorizadosEMBARQUE: TStringField
      FieldName = 'EMBARQUE'
      FixedChar = True
    end
    object qryAutorizadosDT_INSERCAO: TDateTimeField
      FieldName = 'DT_INSERCAO'
      Origin = 'MYINDAIA.DBO.TRAP_EMBARQUE.DT_INSERCAO'
    end
    object qryAutorizadosCD_EMBARQUE: TStringField
      DisplayWidth = 8
      FieldName = 'CD_EMBARQUE'
      FixedChar = True
      Size = 8
    end
    object qryAutorizadosCD_EMBARQUE_ANO: TStringField
      FieldName = 'CD_EMBARQUE_ANO'
      FixedChar = True
      Size = 2
    end
    object qryAutorizadosCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qryAutorizadosFORNECIMENTOS: TStringField
      FieldName = 'FORNECIMENTOS'
      Size = 200
    end
  end
  object dsAutorizados: TDataSource
    DataSet = qryAutorizados
    Left = 545
    Top = 185
  end
  object qryAutorizadosDoc: TQuery
    OnCalcFields = qryAutorizadosDocCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DISTINCT NR_AUT_DOCTO + '#39'/'#39' + NR_AUT_DOCTO_ANO AS EMBARQU' +
        'E, DT_INSERCAO, NR_AUT_DOCTO, NR_AUT_DOCTO_ANO, CD_GRUPO'
      'FROM MYINDAIA.DBO.TRAP_DOCUMENTACAO (NOLOCK)'
      'WHERE CD_STATUS = '#39'2'#39' '
      '     AND CD_GRUPO=:GRUPO'
      'GROUP BY  NR_AUT_DOCTO, NR_AUT_DOCTO_ANO, DT_INSERCAO, CD_GRUPO'
      '')
    Left = 448
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'GRUPO'
        ParamType = ptInput
      end>
    object qryAutorizadosDocEMBARQUE: TStringField
      FieldName = 'EMBARQUE'
      Origin = 'MYINDAIA.DBO.TRAP_DOCUMENTACAO.NR_AUT_DOCTO'
      FixedChar = True
      Size = 18
    end
    object qryAutorizadosDocDT_INSERCAO: TDateTimeField
      FieldName = 'DT_INSERCAO'
      Origin = 'MYINDAIA.DBO.TRAP_DOCUMENTACAO.DT_INSERCAO'
    end
    object qryAutorizadosDocNR_AUT_DOCTO: TStringField
      FieldName = 'NR_AUT_DOCTO'
      Origin = 'MYINDAIA.DBO.TRAP_DOCUMENTACAO.NR_AUT_DOCTO'
      FixedChar = True
      Size = 4
    end
    object qryAutorizadosDocNR_AUT_DOCTO_ANO: TStringField
      FieldName = 'NR_AUT_DOCTO_ANO'
      Origin = 'MYINDAIA.DBO.TRAP_DOCUMENTACAO.NR_AUT_DOCTO_ANO'
      FixedChar = True
      Size = 2
    end
    object qryAutorizadosDoccalcRapsEnvolvidas: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcRapsEnvolvidas'
      Size = 255
      Calculated = True
    end
    object qryAutorizadosDocCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'MYINDAIA.DBO.TRAP_DOCUMENTACAO.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
  end
  object dsAutorizadosDoc: TDataSource
    DataSet = qryAutorizadosDoc
    Left = 440
    Top = 288
  end
  object qry_acordos_normas: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '
      '  pan.CD_PAIS'
      ' ,pan.CD_ACORDO'
      ' ,pan.CD_NORMA'
      ' ,pan.CD_IDIOMA'
      ' ,p.NM_PAIS Pais'
      ' ,i.DESCRICAO Idioma'
      ' ,n.NM_DESCRICAO Norma'
      ' FROM TCONFIG_PAIS_ACORDO_NORMA_PADRAO pan'
      ' join Tpais_Broker p on p.CD_PAIS = pan.CD_PAIS'
      ' join tIdioma i on i.CODIGO = pan.CD_IDIOMA'
      ' left join tNormas n on n.CODIGO=pan.CD_NORMA'
      ' where pan.CD_PAIS = :CD_PAIS'
      ''
      'ORDER BY CD_ACORDO')
    Left = 312
    Top = 131
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PAIS'
        ParamType = ptUnknown
      end>
    object qry_acordos_normasCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TCONFIG_PAIS_ACORDO_NORMA_PADRAO.CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_acordos_normasCD_ACORDO: TStringField
      FieldName = 'CD_ACORDO'
      Origin = 'DBBROKER.TCONFIG_PAIS_ACORDO_NORMA_PADRAO.CD_ACORDO'
      FixedChar = True
      Size = 10
    end
    object qry_acordos_normasCD_NORMA: TStringField
      FieldName = 'CD_NORMA'
      Origin = 'DBBROKER.TCONFIG_PAIS_ACORDO_NORMA_PADRAO.CD_NORMA'
      FixedChar = True
      Size = 10
    end
    object qry_acordos_normasCD_IDIOMA: TStringField
      FieldName = 'CD_IDIOMA'
      Origin = 'DBBROKER.TCONFIG_PAIS_ACORDO_NORMA_PADRAO.CD_IDIOMA'
      FixedChar = True
      Size = 1
    end
    object qry_acordos_normasPais: TStringField
      FieldName = 'Pais'
      FixedChar = True
      Size = 120
    end
    object qry_acordos_normasIdioma: TStringField
      FieldName = 'Idioma'
      FixedChar = True
      Size = 30
    end
    object qry_acordos_normasNorma: TStringField
      FieldName = 'Norma'
      FixedChar = True
      Size = 200
    end
  end
  object ds_acordos_normas: TDataSource
    DataSet = qry_acordos_normas
    Left = 312
    Top = 179
  end
  object qryGeral: TQuery
    Left = 16
    Top = 131
  end
  object qryTemp: TQuery
    DatabaseName = 'DBBROKER'
    Left = 343
    Top = 339
  end
end
