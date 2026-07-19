object frm_RetificaDI_Adm_Temp: Tfrm_RetificaDI_Adm_Temp
  Left = 318
  Top = 230
  Width = 594
  Height = 550
  Caption = 'Retifica'#231#227'o de Admiss'#227'o Tempor'#225'ria'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_Transmissao: TPanel
    Left = 0
    Top = 0
    Width = 586
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      586
      49)
    object btn_sair: TSpeedButton
      Left = 383
      Top = 4
      Width = 39
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
    object btn_Retificar: TSpeedButton
      Left = 5
      Top = 4
      Width = 39
      Height = 41
      Hint = 'Retificar DI'
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000008080008080
        0080800080800080800080800080800080800080800080800000000080800080
        8000808000808000808000808000808000808000808000808000808000808000
        80800080800080807F7F7FFFFFFFFFFFFF008080008080008080008080008080
        0080800080800080800080800080800080800080800080800000FF0000000080
        8000808000808000808000808000808000808000808000808000808000808000
        80800080800080807F7F7F7F7F7FFFFFFFFFFFFF008080008080008080008080
        0080800080800080800080800080800080800080800080800000FF0000FF0000
        00008080008080008080008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7FFFFFFFFFFFFF008080000000000000
        0000000000000000000000000000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000000080800080807F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFF00000000FF00
        00FF0000FF0000FF000000000000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000000080807F7F7FFFFFFF0080800080800080807F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000FF00
        00FF0000FF0000FF000000000000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000007F7F7FFFFFFF008080FFFFFFFFFFFF7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00000000FF00
        00000000000000FF000000000000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000000080807F7F7FFFFFFF7F7F7F7F7F7F0080807F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00808000000000FF00
        00FF0000FF0000FF000000000000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000000080800080807F7F7FFFFFFF008080FFFFFFFFFFFF7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00808000808000000000FF00
        00000000000000FF0000FF0000FF0000FF0000FF000000000000FF0000FF0000
        000080800080800080807F7F7FFFFFFF7F7F7F7F7F7F00808000808000808000
        80800080807F7F7F7F7F7F7F7F7F7F7F7F00808000808000808000000000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FF0000000080
        800080800080800080807F7F7FFFFFFF008080FFFFFFFFFFFF008080FFFFFFFF
        FFFFFFFFFF7F7F7F7F7F7F7F7F7F00808000808000808000808000000000FF00
        00000000000000FF000000000000000000000000000000000000000080800080
        800080800080800080807F7F7FFFFFFF7F7F7F7F7F7F0080807F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F00808000808000808000808000808000000000FF00
        00FF0000FF0000FF0000000000FF0000FF000000000080800080800080800080
        800080800080800080807F7F7FFFFFFF008080FFFFFFFFFFFF7F7F7FFFFFFF00
        80807F7F7F00808000808000808000808000808000808000808000000000FF00
        000000BFBFBF00FF0000000000FF000000000080800080800080800080800080
        800080800080800080807F7F7FFFFFFF7F7F7F7F7F7F0080807F7F7FFFFFFF7F
        7F7F00808000808000808000808000808000808000808000808000000000FF00
        00FF0000FF0000FF000000000000000080800080800080800080800080800080
        800080800080800080807F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F00
        8080008080008080008080008080008080008080008080008080000000000000
        0000000000000000000000000080800080800080800080800080800080800080
        800080800080800080807F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00808000
        8080008080008080008080008080008080008080008080008080008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_RetificarClick
    end
    object btn_Cancelar: TSpeedButton
      Left = 44
      Top = 4
      Width = 39
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
    end
    object pnl_pesquisa: TPanel
      Left = 432
      Top = 2
      Width = 152
      Height = 45
      Align = alRight
      BevelInner = bvLowered
      ParentColor = True
      TabOrder = 0
      object lbl_pesquisa: TLabel
        Left = 6
        Top = 5
        Width = 112
        Height = 13
        Caption = 'Pesquisar Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_Processo: TEdit
        Left = 6
        Top = 19
        Width = 139
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = edt_ProcessoChange
      end
    end
  end
  object pnlOpcoes: TPanel
    Left = 0
    Top = 49
    Width = 586
    Height = 96
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object lbl_cd_cliente: TLabel
      Left = 248
      Top = 48
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
      Left = 554
      Top = 61
      Width = 20
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
    end
    object lblGrupo: TLabel
      Left = 248
      Top = 10
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
      Left = 554
      Top = 22
      Width = 20
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
    end
    object lbl_cd_unid_neg: TLabel
      Left = 12
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
    object btn_co_unid_neg: TSpeedButton
      Left = 211
      Top = 23
      Width = 24
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
    end
    object edt_nm_cliente: TEdit
      Left = 290
      Top = 62
      Width = 259
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 0
    end
    object edt_nm_grupo: TEdit
      Left = 284
      Top = 23
      Width = 265
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object msk_cd_cliente: TMaskEdit
      Left = 249
      Top = 62
      Width = 41
      Height = 21
      EditMask = '99999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 2
      OnChange = msk_cd_clienteChange
      OnExit = msk_cd_clienteExit
      OnKeyPress = msk_cd_unid_negKeyPress
    end
    object msk_cd_grupo: TMaskEdit
      Left = 249
      Top = 23
      Width = 35
      Height = 21
      EditMask = '999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 3
      OnChange = msk_cd_grupoChange
      OnExit = msk_cd_grupoExit
      OnKeyPress = msk_cd_unid_negKeyPress
    end
    object edt_nm_unid_neg: TEdit
      Left = 39
      Top = 23
      Width = 170
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 13
      Top = 23
      Width = 27
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 5
      OnChange = msk_cd_unid_negChange
      OnExit = msk_cd_unid_negExit
      OnKeyPress = msk_cd_unid_negKeyPress
    end
  end
  object dbgDI: TDBGrid
    Left = 0
    Top = 145
    Width = 586
    Height = 378
    Align = alClient
    DataSource = dsDI
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDIDrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CD_UNID_NEG'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NR_PROCESSO_SIMPLES'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_DECLARACAO_IMP'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_IMPORTADOR'
        Width = 240
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QTD_ADICOES'
        Visible = True
      end>
  end
  object qryDI: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DI.NR_PROCESSO,'
      '     DI.NR_DECLARACAO_IMP,'
      '     PR.CD_UNID_NEG,'
      
        '     SUBSTRING(DI.NR_PROCESSO, 5, LEN(DI.NR_PROCESSO)) AS NR_PRO' +
        'CESSO_SIMPLES,'
      '     EN.NM_EMPRESA AS NM_IMPORTADOR,'
      '     COUNT(*) AS QTD_ADICOES,'
      '       DI.IN_RETIFICADA'
      'FROM TDECLARACAO_IMPORTACAO         DI (NOLOCK)'
      
        '   INNER JOIN TADICAO_DE_IMPORTACAO AI (NOLOCK) ON AI.NR_PROCESS' +
        'O = DI.NR_PROCESSO'
      
        '   INNER JOIN TPROCESSO             PR (NOLOCK) ON PR.NR_PROCESS' +
        'O = DI.NR_PROCESSO'
      
        '   INNER JOIN TFOLLOWUP             FU (NOLOCK) ON FU.NR_PROCESS' +
        'O = DI.NR_PROCESSO'
      
        '   LEFT  JOIN TEMPRESA_NAC          EN (NOLOCK) ON EN.CD_EMPRESA' +
        '  = PR.CD_IMPORTADOR'
      'WHERE ISNULL(DI.NR_DECLARACAO_IMP, '#39#39') <> '#39#39
      '  AND PR.IN_CANCELADO  = '#39'0'#39
      '  AND FU.CD_EVENTO     = '#39'088'#39
      '  AND FU.DT_REALIZACAO IS NULL'
      '  AND AI.CD_REGIME_TRIBUTAR = '#39'5'#39
      '  AND AI.CD_FUND_LEG_REGIME = '#39'37'#39
      '  AND :NR_PROCESSO IN (DI.NR_PROCESSO, '#39#39')'
      '  AND :CD_UNID_NEG IN (PR.CD_UNID_NEG, '#39#39')'
      '  AND :CD_GRUPO    IN (PR.CD_GRUPO, '#39#39')'
      '  AND :CD_CLIENTE  IN (PR.CD_CLIENTE, '#39#39')'
      'GROUP BY DI.NR_PROCESSO,'
      '         DI.NR_DECLARACAO_IMP,'
      '         PR.CD_UNID_NEG,'
      '         EN.NM_EMPRESA,'
      '         PR.DT_ABERTURA,'
      '         DI.IN_RETIFICADA'
      'ORDER BY PR.DT_ABERTURA')
    UpdateObject = updDI
    Left = 192
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
        Value = ''
      end>
    object qryDINR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryDINR_DECLARACAO_IMP: TStringField
      DisplayLabel = 'Declara'#231#227'o'
      FieldName = 'NR_DECLARACAO_IMP'
      FixedChar = True
      Size = 10
    end
    object qryDICD_UNID_NEG: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qryDINR_PROCESSO_SIMPLES: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO_SIMPLES'
      FixedChar = True
      Size = 18
    end
    object qryDINM_IMPORTADOR: TStringField
      DisplayLabel = 'Importador'
      FieldName = 'NM_IMPORTADOR'
      FixedChar = True
      Size = 50
    end
    object qryDIQTD_ADICOES: TIntegerField
      DisplayLabel = 'Qtd Adi'#231#245'es'
      FieldName = 'QTD_ADICOES'
    end
    object qryDIIN_RETIFICADA: TBooleanField
      FieldName = 'IN_RETIFICADA'
    end
  end
  object dsDI: TDataSource
    DataSet = qryDI
    Left = 160
    Top = 216
  end
  object qryPagamentos: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT SUM(ROUND(CASE ISNULL(A.IN_SUSPENDE_PIS_COFINS_RETIFIC, 0' +
        ')'
      '                      WHEN 1 THEN 0'
      '                  ELSE A.VL_PIS'
      '                  END, 2)) AS VL_PIS,'
      
        '       SUM(ROUND(CASE ISNULL(A.IN_SUSPENDE_PIS_COFINS_RETIFIC, 0' +
        ')'
      '                     WHEN 1 THEN 0'
      '                 ELSE A.VL_COFINS'
      '                 END, 2)) AS VL_COFINS,'
      '       SUM(ROUND(CASE ISNULL(A.IN_SUSPENDE_IPI_RETIFIC, 0)'
      '                     WHEN 1 THEN 0'
      '                 ELSE IPI.VL_IPT_A_RECOLHER'
      '                 END, 2)) AS VL_IPI,'
      '       SUM(ROUND(CASE ISNULL(A.IN_SUSPENDE_II_RETIFIC, 0)'
      '                     WHEN 1 THEN 0'
      '                 ELSE II.VL_IPT_A_RECOLHER'
      '                 END, 2)) AS VL_II'
      
        'FROM TADICAO_DE_IMPORTACAO A LEFT JOIN TRIBUTO IPI ON IPI.NR_PRO' +
        'CESSO = A.NR_PROCESSO AND IPI.NR_ADICAO = A.NR_ADICAO AND IPI.CD' +
        '_RECEITA_IMPOSTO = '#39'0002'#39
      
        '    LEFT JOIN TRIBUTO II ON II.NR_PROCESSO = A.NR_PROCESSO AND I' +
        'I.NR_ADICAO = A.NR_ADICAO AND II.CD_RECEITA_IMPOSTO = '#39'0001'#39
      'WHERE A.NR_PROCESSO        = :NR_PROCESSO'
      '  AND A.CD_REGIME_TRIBUTAR = '#39'5'#39
      '  AND A.CD_FUND_LEG_REGIME = '#39'37'#39)
    Left = 192
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = ''
      end>
    object qryPagamentosVL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object qryPagamentosVL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object qryPagamentosVL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object qryPagamentosVL_II: TFloatField
      FieldName = 'VL_II'
    end
  end
  object tblPagamentos_Scx: TTable
    DatabaseName = 'DBIMPORT'
    IndexName = 'PrimaryKey'
    TableName = 'PAGAMENTO_TRIBUTOS'
    Left = 192
    Top = 368
    object tblPagamentos_ScxNR_DECL_IMP_MICRO: TStringField
      FieldName = 'NR_DECL_IMP_MICRO'
      Size = 8
    end
    object tblPagamentos_ScxNR_SEQ_PGTO_TRIB: TSmallintField
      FieldName = 'NR_SEQ_PGTO_TRIB'
    end
    object tblPagamentos_ScxCD_RECEITA_PGTO: TStringField
      FieldName = 'CD_RECEITA_PGTO'
      Size = 4
    end
    object tblPagamentos_ScxCD_BANCO_PGTO_TRIB: TStringField
      FieldName = 'CD_BANCO_PGTO_TRIB'
      Size = 3
    end
    object tblPagamentos_ScxNR_AGENC_PGTO_TRIB: TStringField
      FieldName = 'NR_AGENC_PGTO_TRIB'
      Size = 4
    end
    object tblPagamentos_ScxVL_TRIBUTO_PAGO: TFloatField
      FieldName = 'VL_TRIBUTO_PAGO'
    end
    object tblPagamentos_ScxDT_PGTO_TRIBUTO: TStringField
      FieldName = 'DT_PGTO_TRIBUTO'
      Size = 8
    end
    object tblPagamentos_ScxVL_MULTA_PGTO_TRIB: TFloatField
      FieldName = 'VL_MULTA_PGTO_TRIB'
    end
    object tblPagamentos_ScxVL_JUROS_PGTO_TRIB: TFloatField
      FieldName = 'VL_JUROS_PGTO_TRIB'
    end
  end
  object qryDI_Scx: TQuery
    CachedUpdates = True
    DatabaseName = 'DBIMPORT'
    SQL.Strings = (
      'SELECT NR_DECL_IMP_MICRO, TX_INFO_COMPL'
      'FROM DECLARA'#199#195'O_IMPORTA'#199#195'O'
      'WHERE NR_DECLARACAO_IMP = :NR_DECLARACAO_IMP')
    UpdateObject = updDI_Scx
    Left = 192
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_DECLARACAO_IMP'
        ParamType = ptInput
        Value = ''
      end>
    object qryDI_ScxNR_DECL_IMP_MICRO: TStringField
      FieldName = 'NR_DECL_IMP_MICRO'
      Origin = 'IMPORT.DECLARA'#199#195'O_IMPORTA'#199#195'O.NR_DECL_IMP_MICRO'
      Size = 8
    end
    object qryDI_ScxTX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      Origin = 'DBIMPORT.DECLARA'#199#195'O_IMPORTA'#199#195'O.TX_INFO_COMPL'
      BlobType = ftMemo
      Size = 1
    end
  end
  object qryBanco: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DI.NR_CONTA_PGTO_TRIB,'
      '       CASE CH.CD_RESPONSAVEL'
      '           WHEN '#39'D'#39' THEN CS.CD_BANCO_DEB_COM'
      '           WHEN '#39'C'#39' THEN CS.CD_BANCO_DEB_CC'
      '       END AS CD_BANCO'
      'FROM TDECLARACAO_IMPORTACAO        DI (NOLOCK)'
      
        '   INNER JOIN TPROCESSO            PR (NOLOCK) ON PR.NR_PROCESSO' +
        ' = DI.NR_PROCESSO'
      
        '   INNER JOIN TCLIENTE_SERVICO     CS (NOLOCK) ON CS.CD_CLIENTE ' +
        ' = PR.CD_CLIENTE'
      
        '                                              AND CS.CD_SERVICO ' +
        ' = PR.CD_SERVICO'
      
        '                                              AND CS.CD_UNID_NEG' +
        ' = PR.CD_UNID_NEG'
      
        '                                              AND CS.CD_PRODUTO ' +
        ' = PR.CD_PRODUTO'
      
        '   INNER JOIN TCLIENTE_HABILITACAO CH (NOLOCK) ON CH.CD_CLIENTE ' +
        ' = CS.CD_CLIENTE'
      
        '                                              AND CH.CD_UNID_NEG' +
        ' = CS.CD_UNID_NEG'
      
        '                                              AND CH.CD_PRODUTO ' +
        ' = CS.CD_PRODUTO'
      'WHERE DI.NR_PROCESSO = :NR_PROCESSO')
    Left = 192
    Top = 280
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = ''
      end>
    object qryBancoNR_CONTA_PGTO_TRIB: TStringField
      FieldName = 'NR_CONTA_PGTO_TRIB'
      FixedChar = True
      Size = 19
    end
    object qryBancoCD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      FixedChar = True
      Size = 3
    end
  end
  object qryMaxSequencia_Scx: TQuery
    DatabaseName = 'DBIMPORT'
    SQL.Strings = (
      'SELECT MAX(NR_SEQ_PGTO_TRIB) AS MAX_SEQ'
      'FROM PAGAMENTO_TRIBUTOS'
      'WHERE NR_DECL_IMP_MICRO = :NR_DECL_IMP_MICRO')
    Left = 192
    Top = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_DECL_IMP_MICRO'
        ParamType = ptInput
        Value = ''
      end>
    object qryMaxSequencia_ScxMAX_SEQ: TIntegerField
      FieldName = 'MAX_SEQ'
      Origin = 'IMPORT.PAGAMENTO_TRIBUTOS.NR_SEQ_PGTO_TRIB'
    end
  end
  object db_import: TDatabase
    AliasName = 'IMPORT'
    DatabaseName = 'DBIMPORT'
    KeepConnection = False
    LoginPrompt = False
    SessionName = 'Default'
    Left = 160
    Top = 336
  end
  object updDI: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE TDECLARACAO_IMPORTACAO'
      'SET IN_RETIFICADA = :IN_RETIFICADA'
      'WHERE NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 224
    Top = 216
  end
  object updDI_Scx: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE DECLARA'#199#195'O_IMPORTA'#199#195'O'
      'SET TX_INFO_COMPL = :TX_INFO_COMPL'
      'WHERE NR_DECL_IMP_MICRO = :OLD_NR_DECL_IMP_MICRO')
    Left = 224
    Top = 336
  end
end
