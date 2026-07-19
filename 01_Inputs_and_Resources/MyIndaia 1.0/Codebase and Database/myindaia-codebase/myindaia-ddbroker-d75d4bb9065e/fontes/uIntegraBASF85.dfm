object frmIntegraBASF85: TfrmIntegraBASF85
  Left = 399
  Top = 360
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Integra'#231#227'o BASF'
  ClientHeight = 153
  ClientWidth = 335
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
  object panel: TPanel
    Left = 0
    Top = 0
    Width = 335
    Height = 153
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object lbl_nr_processo: TLabel
      Left = 15
      Top = 110
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
    object btn_co_processo: TSpeedButton
      Left = 185
      Top = 123
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
      OnClick = btn_co_processoClick
    end
    object btn_envio: TSpeedButton
      Left = 232
      Top = 120
      Width = 89
      Height = 25
      Caption = 'Integrar'
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
      OnClick = btn_envioClick
    end
    object lbl_cd_unid_neg: TLabel
      Left = 14
      Top = 41
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
    object lbl_cd_produto: TLabel
      Left = 16
      Top = 75
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
    object btn_co_unid_neg: TSpeedButton
      Left = 185
      Top = 51
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
      OnClick = btn_co_unid_negClick
    end
    object msk_nr_processo: TMaskEdit
      Left = 15
      Top = 124
      Width = 168
      Height = 19
      Hint = ' N'#250'mero do Processo'
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 16
      Top = 54
      Width = 36
      Height = 19
      Ctl3D = False
      EditMask = '!99;0; '
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 1
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_produto: TMaskEdit
      Left = 16
      Top = 88
      Width = 36
      Height = 19
      Color = clMenu
      Ctl3D = False
      EditMask = '!99;0; '
      MaxLength = 2
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
    end
    object edt_nm_produto: TEdit
      Left = 53
      Top = 88
      Width = 154
      Height = 19
      TabStop = False
      Color = clMenu
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
    end
    object edt_nm_unid_neg: TEdit
      Left = 53
      Top = 54
      Width = 129
      Height = 19
      TabStop = False
      Color = clMenu
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
    end
    object pnlTopo: TPanel
      Left = 2
      Top = 2
      Width = 331
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      object shp1: TShape
        Left = 0
        Top = 0
        Width = 331
        Height = 36
        Align = alClient
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lbl1: TLabel
        Left = 14
        Top = 10
        Width = 169
        Height = 16
        Caption = 'BASF - Registro Tipo 85'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object dsProcesso: TDataSource
    DataSet = qryProcesso
    Left = 225
    Top = 45
  end
  object qryProcesso: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT P.NR_PROCESSO, ISNULL(P.NR_DDE, '#39#39') AS NR_DDE,'
      '       CONVERT(VARCHAR, DATEPART(YEAR, P.DT_REG_DDE)) +'
      
        '       RIGHT('#39'00'#39' + CONVERT(VARCHAR, DATEPART(MONTH, P.DT_REG_DD' +
        'E)), 2) +'
      
        '       RIGHT('#39'00'#39' + CONVERT(VARCHAR, DATEPART(DAY,   P.DT_REG_DD' +
        'E)), 2) AS DT_DDE,'
      '       CASE RTRIM(LTRIM(ISNULL(P.NR_CONHECIMENTO_MASTER, '#39#39')))'
      '         WHEN '#39#39' THEN RTRIM(LTRIM(P.NR_CONHECIMENTO))'
      '         ELSE  RTRIM(LTRIM(P.NR_CONHECIMENTO_MASTER))'
      '       END AS CONHEC,'
      
        '       CASE (SELECT S.CD_VIA_TRANSPORTE FROM TSERVICO S (NOLOCK)' +
        ' WHERE S.CD_SERVICO = P.CD_SERVICO)'
      
        '         WHEN '#39'01'#39' THEN (CASE RTRIM(LTRIM(ISNULL(P.NR_CONHECIMEN' +
        'TO_MASTER, '#39#39'))) WHEN '#39#39' THEN '#39'10'#39' ELSE '#39'11'#39' END)'
      
        '         WHEN '#39'02'#39' THEN (CASE RTRIM(LTRIM(ISNULL(P.NR_CONHECIMEN' +
        'TO_MASTER, '#39#39'))) WHEN '#39#39' THEN '#39'10'#39' ELSE '#39'11'#39' END)'
      
        '         WHEN '#39'03'#39' THEN (CASE RTRIM(LTRIM(ISNULL(P.NR_CONHECIMEN' +
        'TO_MASTER, '#39#39'))) WHEN '#39#39' THEN '#39'10'#39' ELSE '#39'11'#39' END)'
      
        '         WHEN '#39'04'#39' THEN (CASE RTRIM(LTRIM(ISNULL(P.NR_CONHECIMEN' +
        'TO_MASTER, '#39#39'))) WHEN '#39#39' THEN '#39'01'#39' ELSE '#39'02'#39' END)'
      '         WHEN '#39'07'#39' THEN '#39'13'#39
      '         ELSE '#39'  '#39
      '       END AS TP_CONHEC,  '
      '       CONVERT(VARCHAR, DATEPART(YEAR, P.DT_CONHECIMENTO)) +'
      
        '       RIGHT('#39'00'#39' + CONVERT(VARCHAR, DATEPART(MONTH, P.DT_CONHEC' +
        'IMENTO)), 2) +'
      
        '       RIGHT('#39'00'#39' + CONVERT(VARCHAR, DATEPART(DAY,   P.DT_CONHEC' +
        'IMENTO)), 2) AS DT_CONHEC,'
      
        '       (SELECT ISNULL(CD_SCX_EXP, '#39#39') FROM TPAIS_BROKER WHERE CD' +
        '_PAIS = P.CD_PAIS_DESTINO) AS DEST,'
      '       CONVERT(VARCHAR, DATEPART(YEAR, F1.DT_REALIZACAO)) + '
      
        '       RIGHT('#39'00'#39' + CONVERT(VARCHAR, DATEPART(MONTH, F1.DT_REALI' +
        'ZACAO)), 2) +'
      
        '       RIGHT('#39'00'#39' + CONVERT(VARCHAR, DATEPART(DAY,   F1.DT_REALI' +
        'ZACAO)), 2) AS DT_AVERBACAO'
      '  FROM TPROCESSO P (NOLOCK)'
      
        '  LEFT JOIN TFOLLOWUP F1 (NOLOCK) ON F1.NR_PROCESSO = P.NR_PROCE' +
        'SSO AND F1.CD_EVENTO = '#39'141'#39
      
        ' INNER JOIN TPROCESSO_EXP_NF NF (NOLOCK) ON NF.NR_PROCESSO = P.N' +
        'R_PROCESSO'
      ' WHERE ISNULL(NF.DT_NOTA, '#39#39') <> '#39#39
      
        '   AND NF.DT_NOTA BETWEEN CONVERT(DATETIME, '#39'01/02/2006'#39', 103) A' +
        'ND CONVERT(DATETIME, '#39'28/02/2006'#39', 103)'
      '   AND P.CD_CLIENTE = '#39'00007'#39
      '   AND P.IN_CANCELADO = '#39'0'#39
      ' ORDER BY P.NR_PROCESSO, P.NR_DDE'
      '')
    Left = 259
    Top = 46
    object qryProcessoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryProcessoNR_DDE: TStringField
      FieldName = 'NR_DDE'
      FixedChar = True
      Size = 11
    end
    object qryProcessoDT_DDE: TStringField
      FieldName = 'DT_DDE'
      FixedChar = True
      Size = 34
    end
    object qryProcessoCONHEC: TStringField
      FieldName = 'CONHEC'
      FixedChar = True
      Size = 30
    end
    object qryProcessoDT_CONHEC: TStringField
      FieldName = 'DT_CONHEC'
      FixedChar = True
      Size = 34
    end
    object qryProcessoDEST: TStringField
      FieldName = 'DEST'
      FixedChar = True
      Size = 4
    end
    object qryProcessoDT_AVERBACAO: TStringField
      FieldName = 'DT_AVERBACAO'
      FixedChar = True
      Size = 34
    end
    object qryProcessoTP_CONHEC: TStringField
      FieldName = 'TP_CONHEC'
      FixedChar = True
      Size = 2
    end
  end
  object dsRE: TDataSource
    DataSet = qryRE
    Left = 225
    Top = 74
  end
  object qryRE: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = dsProcesso
    SQL.Strings = (
      'SELECT SUBSTRING(RE.NR_RE, 1, 9) AS NR_RE,'
      '       RTRIM(LTRIM(MAX(SUBSTRING(RE.NR_RE, 10, 3)))) AS SULFIXO,'
      '       CONVERT(VARCHAR, DATEPART(YEAR, RE.DT_RE)) +'
      
        '       RIGHT('#39'00'#39' + CONVERT(VARCHAR, DATEPART(MONTH, RE.DT_RE)),' +
        ' 2) +'
      
        '       RIGHT('#39'00'#39' + CONVERT(VARCHAR, DATEPART(DAY,   RE.DT_RE)),' +
        ' 2) AS DT_RE'
      '  FROM TPROCESSO_EXP_RE RE (NOLOCK)'
      ' WHERE RE.NR_PROCESSO = :NR_PROCESSO'
      '   AND ISNULL(RE.NR_RE, '#39#39') <> '#39#39
      'GROUP BY RE.NR_PROCESSO, SUBSTRING(RE.NR_RE, 1, 9), RE.DT_RE   ')
    Left = 259
    Top = 75
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object qryRENR_RE: TStringField
      FieldName = 'NR_RE'
      FixedChar = True
      Size = 12
    end
    object qryREDT_RE: TStringField
      FieldName = 'DT_RE'
      FixedChar = True
      Size = 34
    end
    object qryRESULFIXO: TStringField
      FieldName = 'SULFIXO'
      FixedChar = True
      Size = 3
    end
  end
  object dsNF: TDataSource
    DataSet = qryNF
    Left = 226
    Top = 104
  end
  object qryNF: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = dsProcesso
    SQL.Strings = (
      'SELECT RTRIM(LTRIM(ISNULL(NF.NR_NF, '#39#39'))) AS NF,'
      '       CONVERT(VARCHAR, DATEPART(YEAR, NF.DT_NOTA)) + '
      
        '       RIGHT('#39'00'#39' + CONVERT(VARCHAR, DATEPART(MONTH, NF.DT_NOTA)' +
        '), 2) +'
      
        '       RIGHT('#39'00'#39' + CONVERT(VARCHAR, DATEPART(DAY,   NF.DT_NOTA)' +
        '), 2) AS DT_NF'
      '  FROM TPROCESSO_EXP_NF NF (NOLOCK) '
      ' WHERE NF.NR_PROCESSO = :NR_PROCESSO')
    Left = 259
    Top = 105
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object qryNFNF: TStringField
      FieldName = 'NF'
      FixedChar = True
      Size = 10
    end
    object qryNFDT_NF: TStringField
      FieldName = 'DT_NF'
      FixedChar = True
      Size = 34
    end
  end
end
