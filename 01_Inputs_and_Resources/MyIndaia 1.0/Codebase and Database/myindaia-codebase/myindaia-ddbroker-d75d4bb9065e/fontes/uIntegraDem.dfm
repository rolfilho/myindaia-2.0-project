object frm_integra_dem: Tfrm_integra_dem
  Left = 198
  Top = 251
  Width = 714
  Height = 368
  Caption = 'Integra'#231#227'o Demonstrativo Despesas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      706
      47)
    object btn_sair: TSpeedButton
      Left = 662
      Top = 4
      Width = 38
      Height = 39
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
    object btn_integrar: TSpeedButton
      Left = 4
      Top = 4
      Width = 38
      Height = 39
      Hint = 'Integra Demonstrativo'
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
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_integrarClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 47
    Width = 706
    Height = 275
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object Shape1: TShape
      Left = 7
      Top = 48
      Width = 693
      Height = 218
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label19: TLabel
      Left = 39
      Top = 58
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
    object btn_co_grupo: TSpeedButton
      Left = 422
      Top = 70
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
      OnClick = btn_co_grupoClick
    end
    object Label1: TLabel
      Left = 39
      Top = 107
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
    object btn_co_cliente: TSpeedButton
      Left = 424
      Top = 119
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
      OnClick = btn_co_clienteClick
    end
    object Label31: TLabel
      Left = 39
      Top = 159
      Width = 46
      Height = 13
      Caption = 'Per'#237'odo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 136
      Top = 180
      Width = 8
      Height = 13
      Caption = #224
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object shp1: TShape
      Left = 8
      Top = 6
      Width = 692
      Height = 39
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lbl1: TLabel
      Left = 36
      Top = 17
      Width = 156
      Height = 13
      Caption = 'Informe o nome do arquivo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSpeed_file: TSpeedButton
      Left = 414
      Top = 13
      Width = 25
      Height = 23
      Hint = 'Novo'
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSpeed_fileClick
    end
    object msk_cd_grupo: TMaskEdit
      Left = 39
      Top = 71
      Width = 37
      Height = 21
      MaxLength = 3
      TabOrder = 0
      OnChange = msk_cd_grupoChange
      OnExit = msk_cd_grupoExit
      OnKeyDown = msk_cd_grupoKeyDown
    end
    object edt_nm_grupo: TEdit
      Left = 80
      Top = 71
      Width = 340
      Height = 21
      TabStop = False
      Color = clMenu
      TabOrder = 1
    end
    object msk_cd_cliente: TMaskEdit
      Left = 39
      Top = 120
      Width = 50
      Height = 21
      MaxLength = 5
      TabOrder = 2
      OnChange = msk_cd_clienteChange
      OnExit = msk_cd_clienteExit
      OnKeyDown = msk_cd_grupoKeyDown
    end
    object edt_nm_cliente: TEdit
      Left = 93
      Top = 120
      Width = 329
      Height = 21
      TabStop = False
      Color = clMenu
      TabOrder = 3
    end
    object msk_dt_inicio: TDateTimePicker
      Left = 39
      Top = 174
      Width = 89
      Height = 21
      Date = 38635.000000000000000000
      Time = 38635.000000000000000000
      TabOrder = 4
    end
    object msk_dt_fim: TDateTimePicker
      Left = 155
      Top = 174
      Width = 89
      Height = 21
      Date = 38635.000000000000000000
      Time = 38635.000000000000000000
      TabOrder = 5
    end
    object edt_nm_file_: TEdit
      Left = 195
      Top = 14
      Width = 216
      Height = 21
      TabOrder = 6
      OnKeyDown = edt_nm_file_KeyDown
    end
  end
  object MainMenu1: TMainMenu
    Left = 484
    Top = 7
    object mi_integrar: TMenuItem
      Caption = '&Integrar'
      OnClick = btn_integrarClick
    end
    object mi_sair: TMenuItem
      Caption = '&Sair'
      OnClick = btn_sairClick
    end
  end
  object qry_integra_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DISTINCT F.NR_NOTA_FATURA, F.DT_FATURA, SUBSTRING( FP.NR_' +
        'PROCESSO, 5, 10 ) AS PROCESSO,'
      
        '       E.END_CIDADE AS LOCAL_ENTREGA, P.NR_PROCESSO, P.CD_UNID_N' +
        'EG, P.CD_PRODUTO,'
      
        '       F.NR_SOLICITACAO, D.NR_DECLARACAO_IMP, P.NR_CONHECIMENTO,' +
        ' D.TX_DOLAR, EE.NM_EMPRESA, F.TP_TIPO_FAT'
      'FROM TS_FATURA F (NOLOCK)'
      
        'INNER JOIN TS_FATURA_PROCESSO FP (NOLOCK) ON ( F.CD_UNID_NEG = F' +
        'P.CD_UNID_NEG AND F.CD_PRODUTO = FP.CD_PRODUTO AND F.NR_SOLICITA' +
        'CAO = FP.NR_SOLICITACAO )'
      
        'INNER JOIN TPROCESSO P (NOLOCK) ON ( FP.NR_PROCESSO = P.NR_PROCE' +
        'SSO )'
      
        'LEFT JOIN TDECLARACAO_IMPORTACAO D (NOLOCK) ON ( D.NR_PROCESSO =' +
        ' P.NR_PROCESSO )'
      
        'LEFT JOIN TADICAO_DE_IMPORTACAO A (NOLOCK) ON ( D.NR_PROCESSO = ' +
        'A.NR_PROCESSO AND A.NR_ADICAO = '#39'001'#39' )'
      
        'LEFT JOIN TEMPRESA_EST EE (NOLOCK) ON ( A.CD_FORNECEDOR = EE.CD_' +
        'EMPRESA )'
      
        'LEFT JOIN TEMPRESA_NAC E (NOLOCK) ON ( E.CD_EMPRESA = D.CD_IMPOR' +
        'TADOR )'
      'WHERE F.TP_TIPO_FAT IN ( '#39'D'#39', '#39'C'#39' )'
      '  AND ( ( P.CD_GRUPO = :CD_GRUPO ) OR ( '#39'X'#39' = :CD_GRUPO ) )'
      
        '  AND ( ( P.CD_CLIENTE = :CD_CLIENTE ) OR ( '#39'X'#39' = :CD_CLIENTE ) ' +
        ')'
      '  AND F.DT_FATURA BETWEEN :DT_INICIAL AND :DT_FINAL'
      '  AND F.IN_CANCELADO = '#39'0'#39
      '  AND F.IN_IMPRESSO = '#39'1'#39
      'ORDER BY F.NR_NOTA_FATURA')
    Left = 550
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FINAL'
        ParamType = ptInput
      end>
    object qry_integra_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_integra_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_integra_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_integra_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      FixedChar = True
      Size = 6
    end
    object qry_integra_NR_NOTA_FATURA: TStringField
      FieldName = 'NR_NOTA_FATURA'
      FixedChar = True
      Size = 6
    end
    object qry_integra_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
    end
    object qry_integra_PROCESSO: TStringField
      FieldName = 'PROCESSO'
      FixedChar = True
      Size = 10
    end
    object qry_integra_LOCAL_ENTREGA: TStringField
      FieldName = 'LOCAL_ENTREGA'
      FixedChar = True
      Size = 30
    end
    object qry_integra_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_integra_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      FixedChar = True
      Size = 10
    end
    object qry_integra_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qry_integra_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
    end
    object qry_integra_TP_TIPO_FAT: TStringField
      FieldName = 'TP_TIPO_FAT'
      FixedChar = True
      Size = 1
    end
  end
  object ds_integra: TDataSource
    DataSet = qry_integra_
    Left = 534
    Top = 159
  end
  object ds_ref: TDataSource
    DataSet = qry_ref_
    Left = 464
    Top = 239
  end
  object qry_ref_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_integra
    SQL.Strings = (
      'SELECT CD_REFERENCIA'
      'FROM TREF_CLIENTE (NOLOCK)'
      'WHERE TP_REFERENCIA = '#39'01'#39
      'AND NR_PROCESSO = :NR_PROCESSO')
    Left = 480
    Top = 223
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end>
  end
  object ds_documentos: TDataSource
    DataSet = qry_documentos_
    Left = 532
    Top = 239
  end
  object qry_documentos_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_integra
    SQL.Strings = (
      'SELECT DESCRICAO, NR_DOCTO'
      'FROM   TS_FATURA_DOCUMENTO F (NOLOCK)'
      
        '       INNER JOIN TTP_DOCUMENTO D (NOLOCK) ON ( F.CD_UNID_NEG = ' +
        'D.CD_UNID_NEG AND F.CD_PRODUTO = D.CD_PRODUTO AND F.CD_DOCUMENTO' +
        ' = D.CODIGO )'
      'WHERE  F.CD_UNID_NEG = :CD_UNID_NEG'
      '  AND  F.CD_PRODUTO = :CD_PRODUTO'
      '  AND  F.NR_SOLICITACAO = :NR_SOLICITACAO'
      '  AND  D.CODIGO NOT IN ( '#39'001'#39', '#39'012'#39', '#39'015'#39' )'
      'ORDER BY F.CD_DOCUMENTO')
    Left = 546
    Top = 223
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftFixedChar
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
        Size = 7
      end>
  end
  object ds_item: TDataSource
    DataSet = qry_item_
    Left = 595
    Top = 239
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_integra
    SQL.Strings = (
      
        'SELECT DISTINCT DP.CD_EXTERNO AS CD_ITEM, I.IN_TRIBUTAVEL, I.CD_' +
        'ITEM AS ITEM, P.TP_DESTINO AS TP_DESTINO,'
      
        ' ( (  SELECT ISNULL( SUM( F1.VL_ITEM ), 0 ) FROM TFATURAMENTO_CC' +
        ' F1 (NOLOCK)'
      '  WHERE F1.NR_PROCESSO = F.NR_PROCESSO'
      '    AND F1.NR_SOLIC_FAT = F.NR_SOLIC_FAT'
      '    AND F1.CD_ITEM = F.CD_ITEM'
      '    AND F1.IN_CANCELADO = '#39'0'#39
      '    AND F1.IN_FATURADO IN ( '#39'0'#39', '#39'2'#39' )'
      '    AND F1.IN_RESTITUI = '#39'0'#39' ) -'
      
        ' (  SELECT ISNULL( SUM( F2.VL_ITEM ), 0 ) FROM TFATURAMENTO_CC F' +
        '2 (NOLOCK)'
      '  WHERE F2.NR_PROCESSO = F.NR_PROCESSO'
      '    AND F2.NR_SOLIC_FAT = F.NR_SOLIC_FAT'
      '    AND F2.CD_ITEM = F.CD_ITEM'
      '    AND F2.IN_CANCELADO = '#39'0'#39
      '    AND F2.IN_FATURADO = '#39'0'#39
      '    AND F2.IN_RESTITUI = '#39'1'#39' ) ) AS VL_ITEM'
      'FROM TFATURAMENTO_CC F (NOLOCK)'
      '     INNER JOIN TITEM I (NOLOCK) ON ( F.CD_ITEM = I.CD_ITEM )'
      
        '     LEFT JOIN TDE_PARA DP (NOLOCK) ON ( I.CD_ITEM = DP.CD_DDBRO' +
        'KER AND CD_TABELA = '#39'13'#39' AND DP.CD_UNID_NEG = F.CD_UNID_NEG AND ' +
        'DP.CD_PRODUTO = F.CD_PRODUTO )'
      
        '     INNER JOIN TSOLIC_PAGTO P (NOLOCK) ON ( F.NR_PROCESSO = P.N' +
        'R_PROCESSO AND F.CD_ITEM = P.CD_ITEM )'
      'WHERE F.NR_PROCESSO = :NR_PROCESSO'
      '  AND F.NR_SOLIC_FAT = :NR_SOLICITACAO'
      '  AND F.IN_CANCELADO = '#39'0'#39
      '  AND F.IN_FATURADO IN ( '#39'0'#39', '#39'2'#39' ) '
      '  AND P.TP_DESTINO IN ( '#39'5'#39', '#39'2'#39' )'
      
        '  AND F.CD_ITEM NOT IN ( SELECT CD_ITEM_RECEB_NUM  FROM TPARAMET' +
        'ROS (NOLOCK))'
      
        '  AND F.CD_ITEM NOT IN ( SELECT CD_ITEM_DEVOL_NUM  FROM TPARAMET' +
        'ROS (NOLOCK))'
      
        '  AND F.CD_ITEM NOT IN ( SELECT CD_ITEM_EXTOR_NUM  FROM TPARAMET' +
        'ROS (NOLOCK))'
      
        '  AND F.CD_ITEM NOT IN ( SELECT CD_ITEM_SALDO_CRE  FROM TPARAMET' +
        'ROS (NOLOCK))'
      
        '  AND F.CD_ITEM NOT IN ( SELECT CD_ITEM_RECEB_SD   FROM TPARAMET' +
        'ROS (NOLOCK))'
      
        '  AND F.CD_ITEM NOT IN ( SELECT CD_ITEM_PAGTO_SD   FROM TPARAMET' +
        'ROS (NOLOCK))'
      
        '  AND F.CD_ITEM NOT IN ( SELECT CD_ITEM_EXT_RECEB  FROM TPARAMET' +
        'ROS (NOLOCK))'
      
        '  AND F.CD_ITEM NOT IN ( SELECT CD_ITEM_EXT_PAGTO  FROM TPARAMET' +
        'ROS (NOLOCK))'
      
        '  AND F.CD_ITEM NOT IN ( SELECT CD_ITEM_NAO_FAT    FROM TPARAMET' +
        'ROS (NOLOCK))'
      
        '  AND F.CD_ITEM NOT IN ( SELECT CD_ITEM_IR         FROM TPARAMET' +
        'ROS (NOLOCK))'
      
        '  AND F.CD_ITEM NOT IN ( SELECT CD_ITEM_COFINS_RETENCAO FROM TPA' +
        'RAMETROS (NOLOCK))'
      
        '  AND F.CD_ITEM NOT IN ( SELECT CD_ITEM_COMISSAO   FROM TPARAMET' +
        'ROS (NOLOCK))'
      
        '  AND F.CD_ITEM NOT IN ( SELECT CD_ITEM_PAGO_CLI   FROM TPARAMET' +
        'ROS (NOLOCK))'
      
        '  AND F.CD_ITEM NOT IN ( SELECT CD_ITEM_PIS_COFINS FROM TPARAMET' +
        'ROS (NOLOCK))'
      'ORDER BY CD_ITEM')
    Left = 610
    Top = 223
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end>
  end
  object ds_com: TDataSource
    DataSet = qry_com_
    Left = 401
    Top = 240
  end
  object qry_com_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_integra
    SQL.Strings = (
      'SELECT TOP 1 RI.VL_NUM_TAXA'
      '  FROM TPROCESSO P (NOLOCK),'
      '       TRECEITAS_IMP RI (NOLOCK)'
      ' WHERE P.NR_PROCESSO = :NR_PROCESSO AND'
      '       RI.CD_CLIENTE = P.CD_CLIENTE AND'
      '       RI.CD_UNID_NEG = P.CD_UNID_NEG AND'
      '       RI.CD_PRODUTO = P.CD_PRODUTO AND'
      '       RI.CD_SERVICO = P.CD_SERVICO AND'
      '       RI.CD_ITEM = '#39'822'#39' AND'
      '       RI.CD_REGIME_TRIB = '#39'0'#39)
    Left = 416
    Top = 223
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end>
  end
  object dlgOpen_file: TOpenDialog
    Filter = 'Arquivo texto|*.TXT;'
    InitialDir = 'C:\'
    Title = 'Informe o arquivo de integra'#231#227'o...'
    Left = 488
    Top = 151
  end
  object dscom_exp: TDataSource
    DataSet = qry_com_exp
    Left = 336
    Top = 240
  end
  object qry_com_exp: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_integra
    SQL.Strings = (
      'SELECT TOP 1 RI.VL_NUM_TAXA'
      '  FROM TPROCESSO P (NOLOCK),'
      '       TRECEITAS_EXP RI (NOLOCK)'
      ' WHERE P.NR_PROCESSO = :NR_PROCESSO AND'
      '       RI.CD_CLIENTE = P.CD_CLIENTE AND'
      '       RI.CD_UNID_NEG = P.CD_UNID_NEG AND'
      '       RI.CD_PRODUTO = P.CD_PRODUTO AND'
      '       RI.CD_SERVICO = P.CD_SERVICO AND'
      '       RI.CD_ITEM = '#39'822'#39)
    Left = 351
    Top = 223
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end>
  end
end
