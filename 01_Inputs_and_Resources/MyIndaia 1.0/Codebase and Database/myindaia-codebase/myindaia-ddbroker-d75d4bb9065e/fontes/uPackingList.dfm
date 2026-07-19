object frmPackingList: TfrmPackingList
  Left = 330
  Top = 221
  Width = 350
  Height = 384
  BorderIcons = [biSystemMenu]
  Caption = 'Packing List - Paletiza'#231#227'o'
  Color = clBtnFace
  Constraints.MinHeight = 150
  Constraints.MinWidth = 350
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPackingList: TPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 346
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      334
      346)
    object shp1: TShape
      Left = 9
      Top = 11
      Width = 323
      Height = 338
      Anchors = [akLeft, akTop, akRight, akBottom]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lblSelQuebra: TLabel
      Left = 19
      Top = 100
      Width = 166
      Height = 13
      Caption = 'Selecione o n'#237'vel  da quebra'
      FocusControl = cmbTipoQuebra
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblUnidade: TLabel
      Left = 19
      Top = 16
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
    object lblProcesso: TLabel
      Left = 19
      Top = 58
      Width = 74
      Height = 13
      Caption = 'Nr. Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnUnidade: TSpeedButton
      Left = 300
      Top = 29
      Width = 25
      Height = 23
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
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
      OnClick = btnUnidadeClick
    end
    object btnProcesso: TSpeedButton
      Left = 146
      Top = 71
      Width = 25
      Height = 23
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
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
      OnClick = btnProcessoClick
    end
    object cmbTipoQuebra: TComboBox
      Left = 19
      Top = 114
      Width = 306
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnChange = cmbTipoQuebraChange
    end
    object btnPrint: TButton
      Left = 93
      Top = 313
      Width = 75
      Height = 25
      Caption = 'Im&primir'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btnPrintClick
    end
    object btnSair: TButton
      Left = 173
      Top = 313
      Width = 75
      Height = 25
      Caption = 'Sai&r'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = btnSairClick
    end
    object sgrdPackingList: TStringGrid
      Left = 19
      Top = 140
      Width = 306
      Height = 88
      TabStop = False
      ColCount = 2
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      TabOrder = 5
    end
    object mskUnidade: TMaskEdit
      Left = 19
      Top = 30
      Width = 35
      Height = 21
      TabOrder = 0
      OnChange = btnUnidadeClick
      OnExit = mskUnidadeExit
    end
    object mskNrProcesso: TMaskEdit
      Left = 19
      Top = 72
      Width = 125
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 14
      TabOrder = 2
      OnExit = mskNrProcessoExit
    end
    object edtUnidade: TEdit
      Left = 53
      Top = 30
      Width = 245
      Height = 21
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 1
    end
    object chkProcessos: TCheckBox
      Left = 177
      Top = 74
      Width = 148
      Height = 17
      TabStop = False
      Caption = #218'ltimos Processos'
      TabOrder = 3
    end
    object rgOpcoes: TRadioGroup
      Left = 19
      Top = 233
      Width = 306
      Height = 70
      Caption = 'Op'#231#245'es de Impress'#227'o'
      ItemIndex = 0
      Items.Strings = (
        'Total'
        'Parcial - volume selecionado'
        'Total com quebra por volume')
      TabOrder = 8
    end
  end
  object pnlPedido: TPanel
    Left = 28
    Top = 136
    Width = 281
    Height = 91
    BevelInner = bvLowered
    BorderWidth = 2
    Color = clBlack
    TabOrder = 1
    Visible = False
    object pnlpedido2: TPanel
      Left = 4
      Top = 4
      Width = 273
      Height = 83
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object btnPrintPedido: TSpeedButton
        Left = 159
        Top = 50
        Width = 110
        Height = 28
        Caption = '&Emitir Packing'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        OnClick = btnPrintPedidoClick
      end
      object lblFechar: TLabel
        Left = 254
        Top = 4
        Width = 15
        Height = 13
        Caption = '[x]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = lblFecharClick
      end
      object lbl1: TLabel
        Left = 4
        Top = 3
        Width = 181
        Height = 13
        Caption = 'Escolha a Fatura que deseja imprimir...'
      end
      object cbbPedido: TComboBox
        Left = 5
        Top = 24
        Width = 262
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  object qryPackingList: TQuery
    BeforeOpen = qryPackingListBeforeOpen
    OnCalcFields = qryPackingListCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT PP.NR_PROCESSO, PP.TX_CAMINHO,'
      
        '    CASE WHEN (SELECT CD_GRUPO FROM TPROCESSO WHERE NR_PROCESSO ' +
        '= PP.NR_PROCESSO) = '#39'209'#39' THEN'
      
        '       (SELECT REPLACE(PP2.TX_CAMINHO, '#39'|'#39','#39#39') FROM TPROCESSO_PA' +
        'LETIZACAO PP2 WHERE PP2.NR_PROCESSO = PP.NR_PROCESSO AND CD_MERC' +
        'ADORIA IS NULL)'
      '     ELSE'
      
        '       (SELECT PP2.TX_CAMINHO FROM TPROCESSO_PALETIZACAO PP2 WHE' +
        'RE PP2.NR_PROCESSO = PP.NR_PROCESSO AND CD_MERCADORIA IS NULL) E' +
        'ND TX_CAMINHO2,'
      '       PP.CD_MERCADORIA, PE.CD_MERCADORIA AS MERC_EXP,'
      
        '       SUM(PP.VL_QTDE) AS VL_QTDE, 0 as TARA, PE.NR_PEDIDO, PE.N' +
        'R_ORDER, LTRIM(RTRIM(ISNULL(PE.CD_FABRICANTE, '#39#39'))) AS CD_FABRIC' +
        'ANTE,'
      '       SUM(ISNULL(PP.VL_PESO_LIQUIDO, 0)) AS VL_PESO_LIQUIDO,'
      
        '       SUM(PE.VL_TOT_PESO_LIQ / PE.QT_MERCADORIA) AS VL_PESO_LIQ' +
        '_UNIT,'
      '       SUM(PE.VL_CUBAGEM / PE.QT_MERCADORIA) AS VL_M3_UNIT,'
      
        '       SUM(PE.VL_TOT_PESO_BRUTO / PE.QT_MERCADORIA) AS VL_PESO_B' +
        'RUTO_UNIT,'
      
        '       CONVERT(DECIMAL(16,3), SUM(PE.VL_TOT_PESO_LIQ)) AS VL_PES' +
        'O_LIQ_ITEM,'
      
        '       CONVERT(DECIMAL(16,3), SUM(PE.VL_TOT_PESO_BRUTO)) AS VL_P' +
        'ESO_BRUTO_ITEM,'
      
        '       CONVERT(DECIMAL(16,3), SUM(PE.VL_CUBAGEM)) AS VL_CUBAGEM_' +
        'ITEM,'
      
        '       CASE (SELECT P.CD_LINGUA_PEDIDO FROM TPROCESSO_EXP P (NOL' +
        'OCK) WHERE P.NR_PROCESSO = PP.NR_PROCESSO)'
      
        '         WHEN '#39'0'#39' THEN (SELECT UN.NM_UNID_MEDIDA     FROM TUNID_' +
        'MEDIDA_BROKER UN (NOLOCK) WHERE UN.CD_UNID_MEDIDA = PE.CD_UNID_M' +
        'EDIDA)'
      
        '         WHEN '#39'1'#39' THEN (SELECT UN.NM_UNID_MEDIDA_ING FROM TUNID_' +
        'MEDIDA_BROKER UN (NOLOCK) WHERE UN.CD_UNID_MEDIDA = PE.CD_UNID_M' +
        'EDIDA)'
      
        '         WHEN '#39'2'#39' THEN (SELECT UN.NM_UNID_MEDIDA_ESP FROM TUNID_' +
        'MEDIDA_BROKER UN (NOLOCK) WHERE UN.CD_UNID_MEDIDA = PE.CD_UNID_M' +
        'EDIDA)'
      '       END AS UNID,'
      
        '      CASE (SELECT P.CD_LINGUA_PEDIDO FROM TPROCESSO_EXP P (NOLO' +
        'CK) WHERE P.NR_PROCESSO = PP.NR_PROCESSO)'
      
        '         WHEN '#39'0'#39' THEN (SELECT UN.NM_SIGLA     FROM TUNID_MEDIDA' +
        '_BROKER UN (NOLOCK) WHERE UN.CD_UNID_MEDIDA = PE.CD_UNID_MEDIDA)'
      
        '         WHEN '#39'1'#39' THEN (SELECT UN.NM_SIGLA_ING FROM TUNID_MEDIDA' +
        '_BROKER UN (NOLOCK) WHERE UN.CD_UNID_MEDIDA = PE.CD_UNID_MEDIDA)'
      
        '         WHEN '#39'2'#39' THEN (SELECT UN.NM_SIGLA_ESP FROM TUNID_MEDIDA' +
        '_BROKER UN (NOLOCK) WHERE UN.CD_UNID_MEDIDA = PE.CD_UNID_MEDIDA)'
      '       END AS SIGLA_UNID,'
      
        '       SUBSTRING(EP.TX_INF_EMBALAGEM,1,250) TX_INF_EMBALAGEM, PE' +
        '.NR_PEDIDO_IMP AS REMESSA, PE.TX_BILLING_DOC, PE.TX_DELIVERY_NOT' +
        'E'
      '  FROM TPROCESSO_PALETIZACAO PP (NOLOCK)'
      
        '  LEFT JOIN TPROCESSO_EXP_ITEM PE (NOLOCK) ON PE.NR_PROCESSO = P' +
        'P.NR_PROCESSO AND PE.NR_ITEM = PP.NR_ITEM'
      
        '  LEFT JOIN TPROCESSO_EXP_PEDIDO EP (NOLOCK) ON EP.NR_PROCESSO =' +
        ' PE.NR_PROCESSO AND EP.NR_PEDIDO = PE.NR_PEDIDO'
      ' WHERE PP.NR_PROCESSO = :NR_PROCESSO'
      '   AND PP.TX_CAMINHO LIKE '#39'%'#39'+ :TX_CAMINHO +'#39'%'#39
      '   AND PP.NR_ITEM IS NOT NULL'
      '   AND PP.VL_QTDE > 0'
      ''
      
        'GROUP BY PP.NR_PROCESSO, PP.TX_CAMINHO, PP.CD_MERCADORIA, PE.CD_' +
        'MERCADORIA, PE.NR_PEDIDO, LTRIM(RTRIM(ISNULL(PE.CD_FABRICANTE,'#39#39 +
        '))), PE.CD_UNID_MEDIDA, SUBSTRING(EP.TX_INF_EMBALAGEM,1,250), PE' +
        '.NR_ORDER, PE.NR_PEDIDO_IMP, PE.TX_BILLING_DOC,PE.TX_DELIVERY_NO' +
        'TE'
      'ORDER BY PE.NR_PEDIDO, PE.CD_FABRICANTE, PP.TX_CAMINHO')
    Left = 292
    Top = 220
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftString
        Name = 'TX_CAMINHO'
        ParamType = ptInput
        Size = 255
      end>
    object qryPackingListNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryPackingListCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object qryPackingListVL_QTDE: TFloatField
      FieldName = 'VL_QTDE'
      DisplayFormat = '#0,.00'
    end
    object qryPackingListTX_CAMINHO: TStringField
      FieldName = 'TX_CAMINHO'
      FixedChar = True
      Size = 255
    end
    object qryPackingListcalcNivel: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNivel'
      Size = 50
      Calculated = True
    end
    object qryPackingListVL_PESO_LIQ_UNIT: TFloatField
      FieldName = 'VL_PESO_LIQ_UNIT'
    end
    object qryPackingListcalcPesoLiquido: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcPesoLiquido'
      DisplayFormat = '#0,.000'
      Calculated = True
    end
    object qryPackingListVL_PESO_LIQ_ITEM: TFloatField
      FieldName = 'VL_PESO_LIQ_ITEM'
    end
    object qryPackingListVL_PESO_BRUTO_ITEM: TFloatField
      FieldName = 'VL_PESO_BRUTO_ITEM'
    end
    object qryPackingListVL_CUBAGEM_ITEM: TFloatField
      FieldName = 'VL_CUBAGEM_ITEM'
    end
    object qryPackingListCD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qryPackingListcalcMarcas: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcMarcas'
      Size = 255
      Calculated = True
    end
    object qryPackingListcalcPacote: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcPacote'
      Size = 255
      Calculated = True
    end
    object qryPackingListMERC_EXP: TStringField
      FieldName = 'MERC_EXP'
      FixedChar = True
      Size = 40
    end
    object qryPackingListcalcMercadoria: TStringField
      DisplayWidth = 500
      FieldKind = fkCalculated
      FieldName = 'calcMercadoria'
      Size = 500
      Calculated = True
    end
    object qryPackingListVL_PESO_BRUTO_UNIT: TFloatField
      FieldName = 'VL_PESO_BRUTO_UNIT'
    end
    object qryPackingListVL_M3_UNIT: TFloatField
      FieldName = 'VL_M3_UNIT'
    end
    object qryPackingListTARA: TIntegerField
      FieldName = 'TARA'
    end
    object qryPackingListVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
    end
    object qryPackingListUNID: TStringField
      FieldName = 'UNID'
      FixedChar = True
      Size = 50
    end
    object qryPackingListcalcPackage: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcPackage'
      Size = 255
      Calculated = True
    end
    object qryPackingListMATERIALOLD: TStringField
      FieldKind = fkCalculated
      FieldName = 'MATERIALOLD'
      Size = 40
      Calculated = True
    end
    object qryPackingListTX_CAMINHO2: TStringField
      FieldName = 'TX_CAMINHO2'
      FixedChar = True
      Size = 255
    end
    object qryPackingListTX_INF_EMBALAGEM: TStringField
      FieldName = 'TX_INF_EMBALAGEM'
      FixedChar = True
      Size = 250
    end
    object qryPackingListNR_ORDER: TStringField
      FieldName = 'NR_ORDER'
      FixedChar = True
      Size = 30
    end
    object qryPackingListSIGLA_UNID: TStringField
      FieldName = 'SIGLA_UNID'
      FixedChar = True
      Size = 3
    end
    object qryPackingListNR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      FixedChar = True
      Size = 18
    end
    object qryPackingListREMESSA: TStringField
      FieldName = 'REMESSA'
      FixedChar = True
      Size = 18
    end
    object qryPackingListTX_BILLING_DOC: TStringField
      FieldName = 'TX_BILLING_DOC'
      FixedChar = True
      Size = 10
    end
    object qryPackingListTX_DELIVERY_NOTE: TStringField
      FieldName = 'TX_DELIVERY_NOTE'
      FixedChar = True
      Size = 10
    end
    object qryPackingListcalcREF: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcREF'
      Size = 255
      Calculated = True
    end
  end
  object dsPackingList: TDataSource
    DataSet = cdsPackingList
    Left = 298
    Top = 114
  end
  object dsBuscaNivel: TDataSource
    DataSet = qryBuscaNivel
    Left = 296
    Top = 95
  end
  object qryBuscaNivel: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT PP.TX_CAMINHO, PP.NR_ITEM, PP.VL_QTDE, ME.AP_MERCADORIA'
      'FROM TPROCESSO_PALETIZACAO PP (NOLOCK)'
      
        '  INNER JOIN TMERCADORIA_EXP ME (NOLOCK) ON (ME.CD_MERCADORIA = ' +
        'PP.CD_MERCADORIA)'
      'WHERE PP.NR_PROCESSO = :NR_PROCESSO'
      '  AND PP.NR_ITEM IS NOT NULL'
      'ORDER BY PP.TX_CAMINHO')
    Left = 179
    Top = 231
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end>
    object qryBuscaNivelTX_CAMINHO: TStringField
      FieldName = 'TX_CAMINHO'
      Origin = 'DBBROKER.TPROCESSO_PALETIZACAO.TX_CAMINHO'
      FixedChar = True
      Size = 255
    end
    object qryBuscaNivelNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'DBBROKER.TPROCESSO_PALETIZACAO.NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryBuscaNivelVL_QTDE: TFloatField
      FieldName = 'VL_QTDE'
      Origin = 'DBBROKER.TPROCESSO_PALETIZACAO.VL_QTDE'
      DisplayFormat = '#0,.00'
    end
    object qryBuscaNivelAP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      FixedChar = True
      Size = 25
    end
  end
  object dsProcesso: TDataSource
    DataSet = qryProcesso
    Left = 297
    Top = 101
  end
  object qryProcesso: TQuery
    OnCalcFields = qryProcessoCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT PR.NR_PROCESSO, PR.CD_GRUPO, PE.NR_FATURA, PE.DT_FATURA, ' +
        'PR.VL_PESO_LIQUIDO, PR.VL_PESO_BRUTO, 0 AS TARA,  ISNULL(PE.TX_M' +
        'ARCACAO_VOLUME, '#39#39') AS TX_MARK,'
      
        '  (SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CODIGO =' +
        ' PR.CD_LOCAL_EMBARQUE) AS NM_LOCAL_EMB,'
      
        '  (SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CODIGO =' +
        ' PR.CD_LOCAL_DESEMBARQUE) AS NM_LOCAL_DESEMB,'
      ''
      '  EN.NM_EMPRESA AS NM_EXPORTADOR,'
      
        '  ISNULL(EN.END_EMPRESA, '#39#39')+'#39', '#39'+ISNULL(EN.END_NUMERO, '#39#39') AS E' +
        'ND_EMPRESA_EXP,'
      
        '  ISNULL(EN.END_CIDADE, '#39#39')+'#39' - '#39'+ISNULL(EN.END_CEP, '#39#39')+'#39' - '#39'+I' +
        'SNULL(EN.END_UF, '#39#39')+'#39' - BRAZIL'#39' AS END_GERAL_EXP,'
      
        '  '#39'TEL: '#39'+ISNULL(EN.NR_TELEFONE, '#39#39')+'#39' - FAX: '#39'+ISNULL(EN.NR_FAX' +
        ', '#39#39') AS NR_PHONE_EXP,'
      
        '  '#39'CNPJ:'#39' +SUBSTRING(EN.CGC_EMPRESA,1,2)+'#39'.'#39'+SUBSTRING(EN.CGC_EM' +
        'PRESA,3,3)+'#39'.'#39'+SUBSTRING(EN.CGC_EMPRESA,6,3)+'#39'/'#39'+SUBSTRING(EN.CG' +
        'C_EMPRESA,9,4)+'#39'-'#39'+SUBSTRING(EN.CGC_EMPRESA,13,2) CGC_CLIENTE,  '
      ''
      '  EI.NM_EMPRESA AS NM_IMPORTADOR,'
      
        '  ISNULL(RTRIM(LTRIM(EI.END_EMPRESA)),'#39#39') + '#39', '#39' + ISNULL(RTRIM(' +
        'LTRIM(EI.END_NUMERO)), '#39#39') + '#39' '#39' + ISNULL(RTRIM(LTRIM(EI.END_COM' +
        'PL)),'#39#39')   AS END_EMPRESA_IMP,'
      '  ISNULL(EI.END_CIDADE, '#39#39') AS CIDADE_IMP,'
      '  ISNULL(EI.END_ESTADO, '#39#39') AS ESTADO_IMP,'
      '  ISNULL((CASE'
      
        '          WHEN PE.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_PAIS_PO' +
        'RT FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = EI.CD_PAIS)'
      
        '          WHEN PE.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_PAIS_IN' +
        'G FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = EI.CD_PAIS)'
      
        '          WHEN PE.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_PAIS_ES' +
        'P FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = EI.CD_PAIS)'
      '        END), '#39#39') AS PAIS_IMP,'
      ''
      '  CASE'
      
        '    WHEN TP_CONSIGNATARIO IN ('#39'0'#39','#39'1'#39','#39'3'#39') THEN (SELECT NM_EMPRE' +
        'SA FROM TEMPRESA_EST EE1 (NOLOCK) WHERE EE1.CD_EMPRESA = PE.CD_C' +
        'ONSIGNATARIO)'
      
        '    WHEN TP_CONSIGNATARIO = '#39'2'#39' THEN (SELECT DESCRICAO FROM TTRA' +
        'NSPORTADOR_ITL (NOLOCK) WHERE CODIGO = PE.CD_CONSIGNATARIO)'
      
        '    WHEN TP_CONSIGNATARIO = '#39'4'#39' THEN (SELECT NM_DESPACHANTE FROM' +
        ' TDESPACHANTE (NOLOCK) WHERE CD_DESPACHANTE = PE.CD_CONSIGNATARI' +
        'O)'
      '    ELSE '#39#39
      '  END AS NM_CONSIGNATARIO,'
      '  CASE'
      
        '    WHEN TP_CONSIGNATARIO IN ('#39'0'#39','#39'1'#39','#39'3'#39') THEN (SELECT ISNULL(R' +
        'TRIM(LTRIM(END_EMPRESA)),'#39#39') + '#39', '#39' + ISNULL(RTRIM(LTRIM(END_NUM' +
        'ERO)), '#39#39') + '#39' '#39'+ISNULL(RTRIM(LTRIM(END_COMPL)),'#39#39') FROM TEMPRES' +
        'A_EST EE2 (NOLOCK) WHERE EE2.CD_EMPRESA = PE.CD_CONSIGNATARIO)'
      
        '    WHEN TP_CONSIGNATARIO = '#39'2'#39' THEN (SELECT END_CIA_TRANSP FROM' +
        ' TTRANSPORTADOR_ITL (NOLOCK) WHERE CODIGO = PE.CD_CONSIGNATARIO)'
      '    WHEN TP_CONSIGNATARIO = '#39'4'#39' THEN '#39#39
      '    ELSE '#39#39
      '  END AS END_CONSIGNATARIO,'
      '   (CASE'
      '      WHEN PE.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39', '#39'3'#39') THEN'
      '        (CASE'
      
        '           WHEN PE.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_PAIS_P' +
        'ORT FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = (SELECT CD_PAIS F' +
        'ROM TEMPRESA_EST EE3 (NOLOCK) WHERE EE3.CD_EMPRESA = PE.CD_CONSI' +
        'GNATARIO))'
      
        '           WHEN PE.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_PAIS_I' +
        'NG FROM TPAIS_BROKER (NOLOCK)  WHERE CD_PAIS = (SELECT CD_PAIS F' +
        'ROM TEMPRESA_EST EE4 (NOLOCK) WHERE EE4.CD_EMPRESA = PE.CD_CONSI' +
        'GNATARIO))'
      
        '           WHEN PE.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_PAIS_E' +
        'SP FROM TPAIS_BROKER (NOLOCK)  WHERE CD_PAIS = (SELECT CD_PAIS F' +
        'ROM TEMPRESA_EST EE5 (NOLOCK) WHERE EE5.CD_EMPRESA = PE.CD_CONSI' +
        'GNATARIO))'
      '        END)'
      '      WHEN PE.TP_CONSIGNATARIO = '#39'2'#39' THEN'
      '       (CASE'
      
        '          WHEN PE.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_PAIS_PO' +
        'RT FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = (SELECT CD_PAIS FR' +
        'OM TTRANSPORTADOR_ITL TI1 (NOLOCK) WHERE TI1.CODIGO = PE.CD_CONS' +
        'IGNATARIO))'
      
        '          WHEN PE.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_PAIS_IN' +
        'G FROM TPAIS_BROKER (NOLOCK)  WHERE CD_PAIS = (SELECT CD_PAIS FR' +
        'OM TTRANSPORTADOR_ITL TI2 (NOLOCK) WHERE TI2.CODIGO = PE.CD_CONS' +
        'IGNATARIO))'
      
        '          WHEN PE.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_PAIS_ES' +
        'P FROM TPAIS_BROKER (NOLOCK)  WHERE CD_PAIS = (SELECT CD_PAIS FR' +
        'OM TTRANSPORTADOR_ITL TI3 (NOLOCK) WHERE TI3.CODIGO = PE.CD_CONS' +
        'IGNATARIO))'
      '        END)'
      '    END) AS PAIS_CONSIGNATARIO,'
      '   (CASE'
      
        '      WHEN PE.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39', '#39'3'#39') THEN (SELECT I' +
        'SNULL(END_CIDADE, '#39#39') FROM TEMPRESA_EST  EE6 (NOLOCK) WHERE EE6.' +
        'CD_EMPRESA = PE.CD_CONSIGNATARIO)'
      
        '      WHEN PE.TP_CONSIGNATARIO = '#39'2'#39' THEN (SELECT CD_CIDADE FROM' +
        ' TTRANSPORTADOR_ITL WHERE CODIGO = PE.CD_CONSIGNATARIO)'
      '    END) AS CIDADE_CONSIGNATARIO,'
      
        '   (SELECT ISNULL(END_ESTADO, '#39#39') FROM TEMPRESA_EST EE7 (NOLOCK)' +
        ' WHERE EE7.CD_EMPRESA = PE.CD_CONSIGNATARIO) AS ESTADO_CONSIGNAT' +
        'ARIO,'
      ''
      '  CASE'
      
        '    WHEN TP_NOTIFY1 IN ('#39'0'#39','#39'1'#39','#39'3'#39') THEN (SELECT NM_EMPRESA FRO' +
        'M TEMPRESA_EST EE8 (NOLOCK) WHERE EE8.CD_EMPRESA = PE.CD_NOTIFY1' +
        ')'
      
        '    WHEN TP_NOTIFY1 = '#39'2'#39' THEN (SELECT DESCRICAO FROM TTRANSPORT' +
        'ADOR_ITL (NOLOCK) WHERE CODIGO = PE.CD_NOTIFY1)'
      
        '    WHEN TP_NOTIFY1 = '#39'4'#39' THEN (SELECT NM_DESPACHANTE FROM TDESP' +
        'ACHANTE (NOLOCK) WHERE CD_DESPACHANTE = PE.CD_NOTIFY1)'
      '    ELSE '#39#39
      '  END AS NM_NOTIFY1,'
      '  CASE'
      
        '    WHEN TP_NOTIFY1 IN ('#39'0'#39','#39'1'#39','#39'3'#39') THEN (SELECT ISNULL(RTRIM(L' +
        'TRIM(END_EMPRESA)),'#39#39') + '#39', '#39' + ISNULL(RTRIM(LTRIM(END_NUMERO)),' +
        ' '#39#39') + '#39' '#39' + ISNULL(RTRIM(LTRIM(END_COMPL)),'#39#39')  FROM TEMPRESA_E' +
        'ST  EE9 (NOLOCK) WHERE EE9.CD_EMPRESA = PE.CD_NOTIFY1)'
      
        '    WHEN TP_NOTIFY1 = '#39'2'#39' THEN (SELECT END_CIA_TRANSP FROM TTRAN' +
        'SPORTADOR_ITL (NOLOCK) WHERE CODIGO = PE.CD_NOTIFY1)'
      '    WHEN TP_NOTIFY1 = '#39'4'#39' THEN '#39#39
      '    ELSE '#39#39
      '  END AS END_NOTIFY1,'
      ''
      ''
      
        '  (SELECT ISNULL(NM_CONTATO, '#39#39') FROM TEMPRESA_EST (NOLOCK) WHER' +
        'E CD_EMPRESA = PE.CD_NOTIFY1) AS CONTATO_NOTIFY,'
      ''
      ''
      '   (CASE'
      '      WHEN PE.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39') THEN'
      '        (CASE'
      
        '           WHEN PE.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_PAIS_P' +
        'ORT FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = (SELECT CD_PAIS F' +
        'ROM TEMPRESA_EST EE10 (NOLOCK) WHERE EE10.CD_EMPRESA = PE.CD_NOT' +
        'IFY1))'
      
        '           WHEN PE.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_PAIS_I' +
        'NG FROM TPAIS_BROKER (NOLOCK)  WHERE CD_PAIS = (SELECT CD_PAIS F' +
        'ROM TEMPRESA_EST EE11 (NOLOCK) WHERE EE11.CD_EMPRESA = PE.CD_NOT' +
        'IFY1))'
      
        '           WHEN PE.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_PAIS_E' +
        'SP FROM TPAIS_BROKER (NOLOCK)  WHERE CD_PAIS = (SELECT CD_PAIS F' +
        'ROM TEMPRESA_EST EE12 (NOLOCK) WHERE EE12.CD_EMPRESA = PE.CD_NOT' +
        'IFY1))'
      '        END)'
      '      WHEN PE.TP_NOTIFY1 = '#39'2'#39' THEN'
      '       (CASE'
      
        '          WHEN PE.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_PAIS_PO' +
        'RT FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = (SELECT CD_PAIS FR' +
        'OM TTRANSPORTADOR_ITL TI4 (NOLOCK) WHERE TI4.CODIGO = PE.CD_NOTI' +
        'FY1))'
      
        '          WHEN PE.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_PAIS_IN' +
        'G FROM TPAIS_BROKER (NOLOCK)  WHERE CD_PAIS = (SELECT CD_PAIS FR' +
        'OM TTRANSPORTADOR_ITL TI5 (NOLOCK) WHERE TI5.CODIGO = PE.CD_NOTI' +
        'FY1))'
      
        '          WHEN PE.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_PAIS_ES' +
        'P FROM TPAIS_BROKER (NOLOCK)  WHERE CD_PAIS = (SELECT CD_PAIS FR' +
        'OM TTRANSPORTADOR_ITL TI6 (NOLOCK) WHERE TI6.CODIGO = PE.CD_NOTI' +
        'FY1))'
      '        END)'
      '    END) AS PAIS_NOTIFY,'
      '   (CASE'
      
        '      WHEN PE.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39') THEN (SELECT ISNULL(' +
        'END_CIDADE, '#39#39') FROM TEMPRESA_EST EE13 (NOLOCK) WHERE EE13.CD_EM' +
        'PRESA = PE.CD_NOTIFY1)'
      
        '      WHEN PE.TP_NOTIFY1 = '#39'2'#39' THEN (SELECT CD_CIDADE FROM TTRAN' +
        'SPORTADOR_ITL WHERE CODIGO = PE.CD_NOTIFY1)'
      '    END) AS CIDADE_NOTIFY,'
      
        '   (SELECT ISNULL(END_ESTADO, '#39#39') FROM TEMPRESA_EST EE14 (NOLOCK' +
        ') WHERE EE14.CD_EMPRESA = PE.CD_NOTIFY1) AS ESTADO_NOTIFY,'
      ''
      '  CASE'
      
        '    WHEN TP_NOTIFY2 IN ('#39'0'#39','#39'1'#39','#39'3'#39') THEN (SELECT NM_EMPRESA FRO' +
        'M TEMPRESA_EST EE8 (NOLOCK) WHERE EE8.CD_EMPRESA = PE.CD_NOTIFY2' +
        ')'
      
        '    WHEN TP_NOTIFY2 = '#39'2'#39' THEN (SELECT DESCRICAO FROM TTRANSPORT' +
        'ADOR_ITL (NOLOCK) WHERE CODIGO = PE.CD_NOTIFY2)'
      
        '    WHEN TP_NOTIFY2 = '#39'4'#39' THEN (SELECT NM_DESPACHANTE FROM TDESP' +
        'ACHANTE (NOLOCK) WHERE CD_DESPACHANTE = PE.CD_NOTIFY2)'
      '    ELSE '#39#39
      '  END AS NM_NOTIFY2,'
      '  CASE'
      
        '    WHEN TP_NOTIFY2 IN ('#39'0'#39','#39'1'#39','#39'3'#39') THEN (SELECT ISNULL(RTRIM(L' +
        'TRIM(END_EMPRESA)),'#39#39') + '#39', '#39' + ISNULL(RTRIM(LTRIM(END_NUMERO)),' +
        ' '#39#39') +'#39' '#39'+ISNULL(RTRIM(LTRIM(END_COMPL)),'#39#39')  FROM TEMPRESA_EST ' +
        ' EE9 (NOLOCK) WHERE EE9.CD_EMPRESA = PE.CD_NOTIFY2)'
      
        '    WHEN TP_NOTIFY2 = '#39'2'#39' THEN (SELECT END_CIA_TRANSP FROM TTRAN' +
        'SPORTADOR_ITL (NOLOCK) WHERE CODIGO = PE.CD_NOTIFY2)'
      '    WHEN TP_NOTIFY2 = '#39'4'#39' THEN '#39#39
      '    ELSE '#39#39
      '  END AS END_NOTIFY2,'
      '   (CASE'
      '      WHEN PE.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39') THEN'
      '        (CASE'
      
        '           WHEN PE.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_PAIS_P' +
        'ORT FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = (SELECT CD_PAIS F' +
        'ROM TEMPRESA_EST EE10 (NOLOCK) WHERE EE10.CD_EMPRESA = PE.CD_NOT' +
        'IFY2))'
      
        '           WHEN PE.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_PAIS_I' +
        'NG FROM TPAIS_BROKER (NOLOCK)  WHERE CD_PAIS = (SELECT CD_PAIS F' +
        'ROM TEMPRESA_EST EE11 (NOLOCK) WHERE EE11.CD_EMPRESA = PE.CD_NOT' +
        'IFY2))'
      
        '           WHEN PE.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_PAIS_E' +
        'SP FROM TPAIS_BROKER (NOLOCK)  WHERE CD_PAIS = (SELECT CD_PAIS F' +
        'ROM TEMPRESA_EST EE12 (NOLOCK) WHERE EE12.CD_EMPRESA = PE.CD_NOT' +
        'IFY2))'
      '        END)'
      '      WHEN PE.TP_NOTIFY2 = '#39'2'#39' THEN'
      '       (CASE'
      
        '          WHEN PE.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_PAIS_PO' +
        'RT FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = (SELECT CD_PAIS FR' +
        'OM TTRANSPORTADOR_ITL TI4 (NOLOCK) WHERE TI4.CODIGO = PE.CD_NOTI' +
        'FY2))'
      
        '          WHEN PE.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_PAIS_IN' +
        'G FROM TPAIS_BROKER (NOLOCK)  WHERE CD_PAIS = (SELECT CD_PAIS FR' +
        'OM TTRANSPORTADOR_ITL TI5 (NOLOCK) WHERE TI5.CODIGO = PE.CD_NOTI' +
        'FY2))'
      
        '          WHEN PE.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_PAIS_ES' +
        'P FROM TPAIS_BROKER (NOLOCK)  WHERE CD_PAIS = (SELECT CD_PAIS FR' +
        'OM TTRANSPORTADOR_ITL TI6 (NOLOCK) WHERE TI6.CODIGO = PE.CD_NOTI' +
        'FY2))'
      '        END)'
      '    END) AS PAIS_NOTIFY2,'
      '   (CASE'
      
        '      WHEN PE.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39') THEN (SELECT ISNULL(' +
        'END_CIDADE, '#39#39') FROM TEMPRESA_EST EE13 (NOLOCK) WHERE EE13.CD_EM' +
        'PRESA = PE.CD_NOTIFY2)'
      
        '      WHEN PE.TP_NOTIFY2 = '#39'2'#39' THEN (SELECT CD_CIDADE FROM TTRAN' +
        'SPORTADOR_ITL WHERE CODIGO = PE.CD_NOTIFY2)'
      '    END) AS CIDADE_NOTIFY2,'
      
        '   (SELECT ISNULL(END_ESTADO, '#39#39') FROM TEMPRESA_EST EE14 (NOLOCK' +
        ') WHERE EE14.CD_EMPRESA = PE.CD_NOTIFY2) AS ESTADO_NOTIFY2,'
      ''
      '  PE.TX_INF_EMBALAGEM,'
      '  /* ( '#39'C:\DDBroker\'#39' + PE.TX_LOGOMARCA ) TX_LOGOMARCA,*/'
      '  /*         CASE ISNULL(CLI.PATH_LOGO, '#39#39')'
      '                WHEN '#39#39' '
      '                THEN ( '#39'C:\DDBroker\SG_ABRASIVES.bmp'#39' )'
      '                ELSE ( '#39'C:\DDBroker\'#39' + CLI.PATH_LOGO )'
      '         END AS TX_LOGOMARCA,    */    '
      '          '
      
        '  CASE WHEN ((CLI.CGC_EMPRESA = '#39'71587240000263'#39') OR (CLI.CGC_EM' +
        'PRESA = '#39'71587240000182'#39'))'
      '       THEN '#39'C:\DDBroker\doble_a.bmp'#39
      '       ELSE CASE WHEN PR.CD_GRUPO = '#39'895'#39
      '                 THEN ( '#39'C:\DDBroker\logo_airproducts.jpg'#39' )'
      '                 ELSE CASE ISNULL(TX_LOGOMARCA, '#39#39')'
      '                           WHEN '#39#39' '
      
        '                           THEN ( '#39'C:\DDBroker\SG_ABRASIVES.bmp'#39 +
        ' )'
      
        '                           ELSE ( '#39'C:\DDBroker\'#39' + PE.TX_LOGOMAR' +
        'CA )'
      '                      END '
      '            END              '
      '  END AS TX_LOGOMARCA,    '
      '  '
      '     CASE ISNULL(EN.PATH_LOGO, '#39#39')'
      '                WHEN '#39#39' '
      '                THEN ( '#39#39' )'
      '                ELSE ( '#39'C:\DDBROKER\'#39' + EN.PATH_LOGO )'
      '         END AS TX_LOGOMARCA_EMPRESA_NAC   ,      '
      '               '
      '       '
      ' '
      '  (CASE'
      '     WHEN PE.CD_LINGUA_PEDIDO = '#39'0'#39' THEN '#39'BRASIL'#39
      '     ELSE '#39'BRAZIL'#39
      '   END) AS NM_PAIS_ORIGEM,'
      '  (CASE'
      
        '     WHEN PE.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_PAIS_PORT FR' +
        'OM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = PE.CD_PAIS_DESTINO)'
      
        '     WHEN PE.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_PAIS_ING FRO' +
        'M TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = PE.CD_PAIS_DESTINO)'
      
        '     WHEN PE.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_PAIS_ESP FRO' +
        'M TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = PE.CD_PAIS_DESTINO)'
      '   END) NM_PAIS_DESTINO,'
      '   PE.TX_DECL_ADICIONAL, PR.TX_MERCADORIA,'
      '   DATEPART(DD, PE.DT_FATURA) DIA_FATURA,'
      '   DATEPART(MM, PE.DT_FATURA) MES_FATURA,'
      '   DATEPART(YYYY, PE.DT_FATURA) ANO_FATURA,'
      '   PE.CD_LINGUA_PEDIDO,'
      '   EC.TX_IMPORTADOR, EC.TX_EXPORTADOR, EC.TX_CONSIGNATARIO,'
      
        '   EC.TX_NOTIFY1, EC.TX_NOTIFY2, PE.CD_NOTIFY2, EC.NM_LOCAL_DEST' +
        'INO, EC.NM_LOCAL_ORIGEM,'
      ''
      ''
      
        'CASE WHEN ISNULL(EI.NR_TELEFONE, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'TEL: '#39'+I' +
        'SNULL(EI.NR_TELEFONE, '#39#39') END AS NR_TELEFONE,'
      
        '  CASE WHEN ISNULL(EI.NR_FAX, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'FAX: '#39'+ISNU' +
        'LL(EI.NR_FAX, '#39#39') END AS NR_FAX,'
      
        '  CASE WHEN ISNULL(EI.NR_RUC, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'RUC: '#39'+ISNU' +
        'LL(EI.NR_RUC, '#39#39') END AS NR_RUC,'
      
        '  CASE WHEN ISNULL(EI.NR_NIT, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'NIT: '#39'+ISNU' +
        'LL(EI.NR_NIT, '#39#39') END AS NR_NIT,'
      
        '  CASE WHEN ISNULL(EI.NR_CUIT, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'CUIT: '#39'+IS' +
        'NULL(EI.NR_CUIT, '#39#39') END AS NR_CUIT,'
      ''
      
        '  (SELECT CASE WHEN ISNULL(EE1.NR_TELEFONE, '#39#39') = '#39#39' THEN '#39#39' ELS' +
        'E '#39'TEL: '#39'+ISNULL(EE1.NR_TELEFONE, '#39#39') END AS TELEFONE_CONSIGNATA' +
        'RIO FROM TEMPRESA_EST EE1 (NOLOCK) WHERE EE1.CD_EMPRESA = PE.CD_' +
        'CONSIGNATARIO) AS TELEFONE_CONSIGNATARIO,'
      
        '  (SELECT CASE WHEN ISNULL(EE1.NR_FAX, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'FA' +
        'X: '#39'+ISNULL(EE1.NR_FAX, '#39#39') END AS FAX_CONSIGNATARIO FROM TEMPRE' +
        'SA_EST EE1 (NOLOCK) WHERE EE1.CD_EMPRESA = PE.CD_CONSIGNATARIO) ' +
        'AS FAX_CONSIGNATARIO,'
      
        '  (SELECT CASE WHEN ISNULL(EE1.NR_RUC, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'RU' +
        'C: '#39'+ISNULL(EE1.NR_RUC, '#39#39') END AS RUC_CONSIGNATARIO FROM TEMPRE' +
        'SA_EST EE1 (NOLOCK) WHERE EE1.CD_EMPRESA = PE.CD_CONSIGNATARIO) ' +
        'AS RUC_CONSIGNATARIO,'
      
        '  (SELECT CASE WHEN ISNULL(EE1.NR_NIT, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'NI' +
        'T: '#39'+ISNULL(EE1.NR_NIT, '#39#39') END AS NIT_CONSIGNATARIO FROM TEMPRE' +
        'SA_EST EE1 (NOLOCK) WHERE EE1.CD_EMPRESA = PE.CD_CONSIGNATARIO) ' +
        'AS NIT_CONSIGNATARIO,'
      
        '  (SELECT CASE WHEN ISNULL(EE1.NR_CUIT, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'C' +
        'UIT: '#39'+ISNULL(EE1.NR_CUIT, '#39#39') END AS CUIT_CONSIGNATARIO FROM TE' +
        'MPRESA_EST EE1 (NOLOCK) WHERE EE1.CD_EMPRESA = PE.CD_CONSIGNATAR' +
        'IO) AS CUIT_CONSIGNATARIO,'
      ''
      
        '  (SELECT CASE WHEN ISNULL(EE9.NR_TELEFONE, '#39#39') = '#39#39' THEN '#39#39' ELS' +
        'E '#39'TEL: '#39'+EE9.NR_TELEFONE END AS TELEFONE_NOTIFY1 FROM TEMPRESA_' +
        'EST EE9 (NOLOCK) WHERE EE9.CD_EMPRESA = PE.CD_CONSIGNATARIO) AS ' +
        'TELEFONE_NOTIFY1,'
      
        '  (SELECT CASE WHEN ISNULL(EE9.NR_FAX, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'FA' +
        'X: '#39'+ EE9.NR_FAX END AS FAX_NOTIFY1 FROM TEMPRESA_EST EE9 (NOLOC' +
        'K) WHERE EE9.CD_EMPRESA = PE.CD_NOTIFY1) AS FAX_NOTIFY1,'
      
        '  (SELECT CASE WHEN ISNULL(EE9.NR_RUC, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'RU' +
        'C: '#39'+ EE9.NR_RUC END AS RUC_NOTIFY1 FROM TEMPRESA_EST EE9 (NOLOC' +
        'K) WHERE EE9.CD_EMPRESA = PE.CD_NOTIFY1) AS RUC_NOTIFY1,'
      
        '  (SELECT CASE WHEN ISNULL(EE9.NR_NIT, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'NI' +
        'T: '#39'+ EE9.NR_NIT END AS NIT_NOTIFY1 FROM TEMPRESA_EST EE9 (NOLOC' +
        'K) WHERE EE9.CD_EMPRESA = PE.CD_NOTIFY1) AS NIT_NOTIFY1,'
      
        '  (SELECT CASE WHEN ISNULL(EE9.NR_CUIT, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'C' +
        'UIT: '#39'+ EE9.NR_CUIT END AS CUIT_NOTIFY1 FROM TEMPRESA_EST EE9 (N' +
        'OLOCK) WHERE EE9.CD_EMPRESA = PE.CD_NOTIFY1) AS CUIT_NOTIFY1,'
      ''
      ''
      
        '(SELECT CASE WHEN ISNULL(EE13.NR_TELEFONE, '#39#39') = '#39#39' THEN '#39#39' ELSE' +
        ' '#39'TEL '#39'+EE13.NR_TELEFONE END AS TELEFONE_NOTIFY2 FROM TEMPRESA_E' +
        'ST EE13 (NOLOCK) WHERE EE13.CD_EMPRESA = PE.CD_CONSIGNATARIO) AS' +
        ' TELEFONE_NOTIFY2,'
      
        '  (SELECT CASE WHEN ISNULL(EE13.NR_FAX, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'F' +
        'AX: '#39'+ EE13.NR_FAX END AS FAX_NOTIFY2 FROM TEMPRESA_EST EE13 (NO' +
        'LOCK) WHERE EE13.CD_EMPRESA = PE.CD_NOTIFY2) AS FAX_NOTIFY2,'
      
        '  (SELECT CASE WHEN ISNULL(EE13.NR_RUC, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'R' +
        'UC: '#39'+ EE13.NR_RUC END AS RUC_NOTIFY2 FROM TEMPRESA_EST EE13 (NO' +
        'LOCK) WHERE EE13.CD_EMPRESA = PE.CD_NOTIFY2) AS RUC_NOTIFY2,'
      
        '  (SELECT CASE WHEN ISNULL(EE13.NR_NIT, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39'N' +
        'IT: '#39'+ EE13.NR_NIT END AS NIT_NOTIFY2 FROM TEMPRESA_EST EE13 (NO' +
        'LOCK) WHERE EE13.CD_EMPRESA = PE.CD_NOTIFY2) AS NIT_NOTIFY2,'
      
        '  (SELECT CASE WHEN ISNULL(EE13.NR_CUIT, '#39#39') = '#39#39' THEN '#39#39' ELSE '#39 +
        'CUIT: '#39'+ EE13.NR_CUIT END AS CUIT_NOTIFY2 FROM TEMPRESA_EST EE13' +
        ' (NOLOCK) WHERE EE13.CD_EMPRESA = PE.CD_NOTIFY2) AS CUIT_NOTIFY2' +
        ','
      ''
      
        '  (SELECT DESCRICAO+'#39' - '#39'+ISNULL(CD_UF, '#39#39') FROM TLOCAL_EMBARQUE' +
        ' (NOLOCK) WHERE CODIGO = PR.CD_LOCAL_EMBARQUE) AS NM_LOCAL_EMB_A' +
        'JI,'
      
        '(SELECT C.NM_CONTATO FROM TCLIENTE_CONTATO C (NOLOCK) WHERE C.CD' +
        '_CLIENTE = PR.CD_CLIENTE AND PR.CD_UNID_NEG = C.CD_UNID_NEG AND ' +
        'PR.CD_PRODUTO = C.CD_PRODUTO AND PR.CD_CONTATO = C.CD_CONTATO) N' +
        'M_CONTATO,'
      '  (CASE'
      
        '     WHEN PE.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT TX_CARGO + '#39' - ' +
        #39' + TX_DEPARTAMENTO FROM TCLIENTE_CONTATO C (NOLOCK) WHERE C.CD_' +
        'CLIENTE = PR.CD_CLIENTE AND PR.CD_UNID_NEG = C.CD_UNID_NEG AND P' +
        'R.CD_PRODUTO = C.CD_PRODUTO AND PR.CD_CONTATO = C.CD_CONTATO)'
      
        '     WHEN PE.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT TX_CARGO_ING + ' +
        #39' - '#39' + TX_DEPARTAMENTO_ING FROM TCLIENTE_CONTATO C (NOLOCK) WHE' +
        'RE C.CD_CLIENTE = PR.CD_CLIENTE AND PR.CD_UNID_NEG = C.CD_UNID_N' +
        'EG AND PR.CD_PRODUTO = C.CD_PRODUTO AND PR.CD_CONTATO = C.CD_CON' +
        'TATO)'
      
        '     WHEN PE.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT TX_CARGO_ESP + ' +
        #39' - '#39' + TX_DEPARTAMENTO_ESP FROM TCLIENTE_CONTATO C (NOLOCK) WHE' +
        'RE C.CD_CLIENTE = PR.CD_CLIENTE AND PR.CD_UNID_NEG = C.CD_UNID_N' +
        'EG AND PR.CD_PRODUTO = C.CD_PRODUTO AND PR.CD_CONTATO = C.CD_CON' +
        'TATO)'
      '   END) AS CONTATO_CARGO,'
      '   PE.CD_IMPORTADOR'
      'FROM TPROCESSO              PR (NOLOCK)'
      
        '  INNER JOIN TPROCESSO_EXP  PE (NOLOCK)  ON (PE.NR_PROCESSO = PR' +
        '.NR_PROCESSO)'
      
        '  LEFT JOIN TEMPRESA_NAC    EN (NOLOCK)  ON (EN.CD_EMPRESA  = PE' +
        '.CD_EXPORTADOR)'
      
        '  LEFT JOIN TEMPRESA_EST    EI (NOLOCK)  ON (EI.CD_EMPRESA  = PE' +
        '.CD_IMPORTADOR)'
      
        '  LEFT JOIN TEXP_CARTA_CRED EC (NOLOCK)  ON EC.NR_PROCESSO  = PR' +
        '.NR_PROCESSO'
      
        '       JOIN TEMPRESA_NAC    CLI (NOLOCK) ON CLI.CD_EMPRESA  = PR' +
        '.CD_CLIENTE   '
      'WHERE PR.NR_PROCESSO = :NR_PROCESSO')
    Left = 227
    Top = 281
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryProcessoNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 15
    end
    object qryProcessoDT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
    end
    object qryProcessoVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      DisplayFormat = '#0,.000'
    end
    object qryProcessoVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      DisplayFormat = '#0,.000'
    end
    object qryProcessoTX_MARK: TMemoField
      FieldName = 'TX_MARK'
      BlobType = ftMemo
    end
    object qryProcessoNM_LOCAL_EMB: TStringField
      FieldName = 'NM_LOCAL_EMB'
      FixedChar = True
      Size = 50
    end
    object qryProcessoNM_LOCAL_DESEMB: TStringField
      FieldName = 'NM_LOCAL_DESEMB'
      FixedChar = True
      Size = 50
    end
    object qryProcessoNM_EXPORTADOR: TStringField
      FieldName = 'NM_EXPORTADOR'
      FixedChar = True
      Size = 50
    end
    object qryProcessoEND_EMPRESA_EXP: TStringField
      FieldName = 'END_EMPRESA_EXP'
      FixedChar = True
      Size = 57
    end
    object qryProcessoEND_GERAL_EXP: TStringField
      FieldName = 'END_GERAL_EXP'
      FixedChar = True
      Size = 55
    end
    object qryProcessoNR_PHONE_EXP: TStringField
      FieldName = 'NR_PHONE_EXP'
      FixedChar = True
      Size = 45
    end
    object qryProcessoNM_IMPORTADOR: TStringField
      FieldName = 'NM_IMPORTADOR'
      FixedChar = True
      Size = 60
    end
    object qryProcessoEND_EMPRESA_IMP: TStringField
      FieldName = 'END_EMPRESA_IMP'
      FixedChar = True
      Size = 67
    end
    object qryProcessoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryProcessoNM_CONSIGNATARIO: TStringField
      FieldName = 'NM_CONSIGNATARIO'
      FixedChar = True
      Size = 60
    end
    object qryProcessoNM_NOTIFY1: TStringField
      FieldName = 'NM_NOTIFY1'
      FixedChar = True
      Size = 60
    end
    object qryProcessoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qryProcessoEND_CONSIGNATARIO: TStringField
      FieldName = 'END_CONSIGNATARIO'
      FixedChar = True
      Size = 100
    end
    object qryProcessoEND_NOTIFY1: TStringField
      FieldName = 'END_NOTIFY1'
      FixedChar = True
      Size = 100
    end
    object qryProcessoCIDADE_IMP: TStringField
      FieldName = 'CIDADE_IMP'
      FixedChar = True
      Size = 30
    end
    object qryProcessoESTADO_IMP: TStringField
      FieldName = 'ESTADO_IMP'
      FixedChar = True
      Size = 30
    end
    object qryProcessoPAIS_IMP: TStringField
      FieldName = 'PAIS_IMP'
      FixedChar = True
      Size = 50
    end
    object qryProcessoPAIS_CONSIGNATARIO: TStringField
      FieldName = 'PAIS_CONSIGNATARIO'
      FixedChar = True
      Size = 50
    end
    object qryProcessoCIDADE_CONSIGNATARIO: TStringField
      FieldName = 'CIDADE_CONSIGNATARIO'
      FixedChar = True
      Size = 30
    end
    object qryProcessoESTADO_CONSIGNATARIO: TStringField
      FieldName = 'ESTADO_CONSIGNATARIO'
      FixedChar = True
      Size = 30
    end
    object qryProcessoPAIS_NOTIFY: TStringField
      FieldName = 'PAIS_NOTIFY'
      FixedChar = True
      Size = 50
    end
    object qryProcessoCIDADE_NOTIFY: TStringField
      FieldName = 'CIDADE_NOTIFY'
      FixedChar = True
      Size = 30
    end
    object qryProcessoESTADO_NOTIFY: TStringField
      FieldName = 'ESTADO_NOTIFY'
      FixedChar = True
      Size = 30
    end
    object qryProcessoTX_INF_EMBALAGEM: TMemoField
      FieldName = 'TX_INF_EMBALAGEM'
      BlobType = ftMemo
    end
    object qryProcessocalc_notify2: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_notify2'
      Size = 255
      Calculated = True
    end
    object qryProcessocalc_consig2: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_consig2'
      Size = 255
      Calculated = True
    end
    object qryProcessocalc_imp2: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_imp2'
      Size = 255
      Calculated = True
    end
    object qryProcessoTX_LOGOMARCA: TStringField
      FieldName = 'TX_LOGOMARCA'
      FixedChar = True
      Size = 37
    end
    object qryProcessoNM_PAIS_ORIGEM: TStringField
      FieldName = 'NM_PAIS_ORIGEM'
      FixedChar = True
      Size = 6
    end
    object qryProcessoNM_PAIS_DESTINO: TStringField
      FieldName = 'NM_PAIS_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qryProcessocalc_origem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_origem'
      Size = 255
      Calculated = True
    end
    object qryProcessocalc_destino: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_destino'
      Size = 255
      Calculated = True
    end
    object qryProcessoTX_DECL_ADICIONAL: TMemoField
      FieldName = 'TX_DECL_ADICIONAL'
      BlobType = ftMemo
    end
    object qryProcessoTX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qryProcessoDIA_FATURA: TIntegerField
      FieldName = 'DIA_FATURA'
    end
    object qryProcessoMES_FATURA: TIntegerField
      FieldName = 'MES_FATURA'
    end
    object qryProcessoANO_FATURA: TIntegerField
      FieldName = 'ANO_FATURA'
    end
    object qryProcessocalc_dt_fatura: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_dt_fatura'
      Size = 255
      Calculated = True
    end
    object qryProcessocalcNrOrder: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNrOrder'
      Size = 255
      Calculated = True
    end
    object qryProcessocalcImp: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcImp'
      Size = 255
      Calculated = True
    end
    object qryProcessoTARA: TIntegerField
      FieldName = 'TARA'
    end
    object qryProcessoCD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qryProcessoTX_IMPORTADOR: TMemoField
      FieldName = 'TX_IMPORTADOR'
      BlobType = ftMemo
    end
    object qryProcessoTX_EXPORTADOR: TMemoField
      FieldName = 'TX_EXPORTADOR'
      BlobType = ftMemo
    end
    object qryProcessoTX_CONSIGNATARIO: TMemoField
      FieldName = 'TX_CONSIGNATARIO'
      BlobType = ftMemo
    end
    object qryProcessoTX_NOTIFY1: TMemoField
      FieldName = 'TX_NOTIFY1'
      BlobType = ftMemo
    end
    object qryProcessoNM_LOCAL_DESTINO: TStringField
      FieldName = 'NM_LOCAL_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qryProcessoNM_LOCAL_ORIGEM: TStringField
      FieldName = 'NM_LOCAL_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qryProcessoNM_NOTIFY2: TStringField
      FieldName = 'NM_NOTIFY2'
      FixedChar = True
      Size = 60
    end
    object qryProcessoEND_NOTIFY2: TStringField
      FieldName = 'END_NOTIFY2'
      FixedChar = True
      Size = 109
    end
    object qryProcessoPAIS_NOTIFY2: TStringField
      FieldName = 'PAIS_NOTIFY2'
      FixedChar = True
      Size = 50
    end
    object qryProcessoCIDADE_NOTIFY2: TStringField
      FieldName = 'CIDADE_NOTIFY2'
      FixedChar = True
      Size = 30
    end
    object qryProcessoESTADO_NOTIFY2: TStringField
      FieldName = 'ESTADO_NOTIFY2'
      FixedChar = True
      Size = 30
    end
    object qryProcessocalc_notify2_2: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_notify2_2'
      Size = 255
      Calculated = True
    end
    object qryProcessoTX_NOTIFY2: TMemoField
      FieldName = 'TX_NOTIFY2'
      BlobType = ftMemo
    end
    object qryProcessoCD_NOTIFY2: TStringField
      FieldName = 'CD_NOTIFY2'
      FixedChar = True
      Size = 5
    end
    object qryProcessoNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 22
    end
    object qryProcessoNR_FAX: TStringField
      FieldName = 'NR_FAX'
      FixedChar = True
    end
    object qryProcessoNR_RUC: TStringField
      FieldName = 'NR_RUC'
      FixedChar = True
      Size = 30
    end
    object qryProcessoNR_NIT: TStringField
      FieldName = 'NR_NIT'
      FixedChar = True
      Size = 30
    end
    object qryProcessoTELEFONE_CONSIGNATARIO: TStringField
      FieldName = 'TELEFONE_CONSIGNATARIO'
      FixedChar = True
      Size = 22
    end
    object qryProcessoFAX_CONSIGNATARIO: TStringField
      FieldName = 'FAX_CONSIGNATARIO'
      FixedChar = True
    end
    object qryProcessoRUC_CONSIGNATARIO: TStringField
      FieldName = 'RUC_CONSIGNATARIO'
      FixedChar = True
      Size = 30
    end
    object qryProcessoNIT_CONSIGNATARIO: TStringField
      FieldName = 'NIT_CONSIGNATARIO'
      FixedChar = True
      Size = 30
    end
    object qryProcessoTELEFONE_NOTIFY1: TStringField
      FieldName = 'TELEFONE_NOTIFY1'
      FixedChar = True
      Size = 22
    end
    object qryProcessoFAX_NOTIFY1: TStringField
      FieldName = 'FAX_NOTIFY1'
      FixedChar = True
    end
    object qryProcessoRUC_NOTIFY1: TStringField
      FieldName = 'RUC_NOTIFY1'
      FixedChar = True
      Size = 30
    end
    object qryProcessoNIT_NOTIFY1: TStringField
      FieldName = 'NIT_NOTIFY1'
      FixedChar = True
      Size = 30
    end
    object qryProcessoTELEFONE_NOTIFY2: TStringField
      FieldName = 'TELEFONE_NOTIFY2'
      FixedChar = True
      Size = 22
    end
    object qryProcessoFAX_NOTIFY2: TStringField
      FieldName = 'FAX_NOTIFY2'
      FixedChar = True
    end
    object qryProcessoRUC_NOTIFY2: TStringField
      FieldName = 'RUC_NOTIFY2'
      FixedChar = True
      Size = 30
    end
    object qryProcessoNIT_NOTIFY2: TStringField
      FieldName = 'NIT_NOTIFY2'
      FixedChar = True
      Size = 30
    end
    object qryProcessoNM_LOCAL_EMB_AJI: TStringField
      FieldName = 'NM_LOCAL_EMB_AJI'
      FixedChar = True
      Size = 55
    end
    object qryProcessoNM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qryProcessoCONTATO_CARGO: TStringField
      FieldName = 'CONTATO_CARGO'
      FixedChar = True
      Size = 78
    end
    object qryProcessoCGC_CLIENTE: TStringField
      FieldName = 'CGC_CLIENTE'
      FixedChar = True
      Size = 23
    end
    object qryProcessoNR_CUIT: TStringField
      FieldName = 'NR_CUIT'
      FixedChar = True
      Size = 31
    end
    object qryProcessoCUIT_CONSIGNATARIO: TStringField
      FieldName = 'CUIT_CONSIGNATARIO'
      FixedChar = True
      Size = 31
    end
    object qryProcessoCUIT_NOTIFY1: TStringField
      FieldName = 'CUIT_NOTIFY1'
      FixedChar = True
      Size = 31
    end
    object qryProcessoCUIT_NOTIFY2: TStringField
      FieldName = 'CUIT_NOTIFY2'
      FixedChar = True
      Size = 31
    end
    object qryProcessoCD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qryProcessoCONTATO_NOTIFY: TStringField
      FieldName = 'CONTATO_NOTIFY'
      FixedChar = True
      Size = 50
    end
    object qryProcessoTX_LOGOMARCA_EMPRESA_NAC: TStringField
      FieldName = 'TX_LOGOMARCA_EMPRESA_NAC'
      FixedChar = True
      Size = 112
    end
  end
  object ppRtpPackingList: TppReport
    AutoStop = False
    DataPipeline = BDEPackingList
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBROKER\PackingCroda.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 258
    Top = 3
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'BDEPackingList'
    object ppHeBd1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDtBd1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppdbtxt2: TppDBText
        UserName = 'dbtxt2'
        DataField = 'calcPackage'
        DataPipeline = BDEPackingList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDEPackingList'
        mmHeight = 3175
        mmLeft = 24871
        mmTop = 1588
        mmWidth = 35190
        BandType = 4
      end
      object ppDBtxtNivel: TppDBText
        UserName = 'DBtxtNivel'
        DataField = 'calcNivel'
        DataPipeline = BDEPackingList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDEPackingList'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 1588
        mmWidth = 22225
        BandType = 4
      end
      object ppDBtxt26: TppDBText
        UserName = 'DBtxt26'
        DataField = 'calcPesoLiquido'
        DataPipeline = BDEPackingList
        DisplayFormat = '#0,.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEPackingList'
        mmHeight = 3175
        mmLeft = 168540
        mmTop = 1588
        mmWidth = 24871
        BandType = 4
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'calcMercadoria'
        DataPipeline = BDEPackingList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'BDEPackingList'
        mmHeight = 3175
        mmLeft = 60854
        mmTop = 1588
        mmWidth = 103981
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFtBd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape2'
        mmHeight = 14023
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 8
      end
      object ppDBText11: TppDBText
        UserName = 'DBText12'
        DataField = 'NM_EXPORTADOR'
        DataPipeline = ppBDEProcesso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEProcesso'
        mmHeight = 3704
        mmLeft = 156369
        mmTop = 265
        mmWidth = 40217
        BandType = 8
      end
      object ppDBText12: TppDBText
        UserName = 'DBText15'
        DataField = 'CRO04'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3704
        mmLeft = 118798
        mmTop = 9790
        mmWidth = 78317
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 265
        mmTop = 9260
        mmWidth = 196586
        BandType = 8
      end
      object ppDBText20: TppDBText
        UserName = 'DBText21'
        DataField = 'CRO03'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3704
        mmLeft = 144463
        mmTop = 265
        mmWidth = 11113
        BandType = 8
      end
    end
    object ppPageStyle2: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 284300
      mmPrintPosition = 0
      object ppshp3: TppShape
        UserName = 'shp3'
        mmHeight = 47096
        mmLeft = 0
        mmTop = 33602
        mmWidth = 197380
        BandType = 9
      end
      object ppShape6: TppShape
        UserName = 'Shape1'
        mmHeight = 203994
        mmLeft = 0
        mmTop = 80433
        mmWidth = 197380
        BandType = 9
      end
      object ppshp2: TppShape
        UserName = 'shp2'
        mmHeight = 21167
        mmLeft = 0
        mmTop = 16933
        mmWidth = 197380
        BandType = 9
      end
      object ppshp4: TppShape
        UserName = 'shp4'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 80433
        mmWidth = 197380
        BandType = 9
      end
      object ppLn2: TppLine
        UserName = 'Ln2'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 265
        mmTop = 66675
        mmWidth = 98425
        BandType = 9
      end
      object ppLn3: TppLine
        UserName = 'Ln3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 148167
        mmTop = 71173
        mmWidth = 265
        BandType = 9
      end
      object ppLn4: TppLine
        UserName = 'Ln4'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 98425
        mmTop = 70908
        mmWidth = 98690
        BandType = 9
      end
      object ppLn5: TppLine
        UserName = 'Ln5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 203730
        mmLeft = 23548
        mmTop = 80433
        mmWidth = 265
        BandType = 9
      end
      object ppLn6: TppLine
        UserName = 'Ln6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 203730
        mmLeft = 60325
        mmTop = 80433
        mmWidth = 265
        BandType = 9
      end
      object ppLn7: TppLine
        UserName = 'Ln7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 203465
        mmLeft = 165100
        mmTop = 80698
        mmWidth = 265
        BandType = 9
      end
      object ppLn1: TppLine
        UserName = 'Ln1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 63500
        mmLeft = 98425
        mmTop = 16933
        mmWidth = 265
        BandType = 9
      end
      object ppDBText9: TppDBText
        UserName = 'DBText1'
        DataField = 'TIT01'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3969
        mmLeft = 129911
        mmTop = 3704
        mmWidth = 48154
        BandType = 9
      end
      object ppDBText10: TppDBText
        UserName = 'DBText2'
        DataField = 'TIT02'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 131234
        mmTop = 8731
        mmWidth = 17198
        BandType = 9
      end
      object ppDBText13: TppDBText
        UserName = 'DBText3'
        DataField = 'TIT03'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 131234
        mmTop = 12435
        mmWidth = 17198
        BandType = 9
      end
      object ppDBText14: TppDBText
        UserName = 'DBText4'
        DataField = 'TIT04'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 529
        mmTop = 17727
        mmWidth = 96573
        BandType = 9
      end
      object ppDBText15: TppDBText
        UserName = 'DBText5'
        DataField = 'TIT05'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 99219
        mmTop = 17727
        mmWidth = 97102
        BandType = 9
      end
      object ppDBText16: TppDBText
        UserName = 'DBText6'
        DataField = 'TIT06'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 38894
        mmWidth = 42863
        BandType = 9
      end
      object ppDBText17: TppDBText
        UserName = 'DBText7'
        DataField = 'TIT07'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 39158
        mmWidth = 16140
        BandType = 9
      end
      object ppDBText18: TppDBText
        UserName = 'DBText8'
        DataField = 'TIT03'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 43921
        mmWidth = 14023
        BandType = 9
      end
      object ppDBText19: TppDBText
        UserName = 'DBText9'
        DataField = 'TIT11'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 98954
        mmTop = 38894
        mmWidth = 97631
        BandType = 9
      end
      object ppDBText21: TppDBText
        UserName = 'DBText13'
        DataField = 'TIT12'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 98954
        mmTop = 71967
        mmWidth = 48419
        BandType = 9
      end
      object ppDBText23: TppDBText
        UserName = 'DBText14'
        DataField = 'TIT13'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 149225
        mmTop = 71967
        mmWidth = 47361
        BandType = 9
      end
      object ppDBText24: TppDBText
        UserName = 'DBText16'
        DataField = 'TIT15'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 61119
        mmTop = 81227
        mmWidth = 102923
        BandType = 9
      end
      object ppDBText25: TppDBText
        UserName = 'DBText17'
        DataField = 'TIT16'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 166423
        mmTop = 81227
        mmWidth = 29898
        BandType = 9
      end
      object ppDBText51: TppDBText
        UserName = 'DBText101'
        DataField = 'TIT08'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 48419
        mmWidth = 26988
        BandType = 9
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        DataField = 'TIT09'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 52917
        mmWidth = 26988
        BandType = 9
      end
      object ppDBText26: TppDBText
        UserName = 'DBText53'
        DataField = 'TIT10'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 57415
        mmWidth = 26988
        BandType = 9
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 28840
        mmLeft = 47361
        mmTop = 37835
        mmWidth = 265
        BandType = 9
      end
      object ppDBText27: TppDBText
        UserName = 'DBText10'
        DataField = 'DUP06'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 67733
        mmWidth = 26988
        BandType = 9
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 185738
        mmTop = 284300
        mmWidth = 11303
        BandType = 9
      end
      object ppDBTxtNot2: TppDBText
        UserName = 'DBTxtNot2'
        DataField = 'TIT17'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 98954
        mmTop = 54504
        mmWidth = 97631
        BandType = 9
      end
      object ppDBText28: TppDBText
        UserName = 'DBText23'
        DataField = 'CRO02'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 265
        mmTop = 81227
        mmWidth = 23019
        BandType = 9
      end
      object ppDBText29: TppDBText
        UserName = 'DBText24'
        DataField = 'CRO01'
        DataPipeline = ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 24342
        mmTop = 81227
        mmWidth = 35454
        BandType = 9
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        DataField = 'TX_LOGOMARCA_EMPRESA_NAC'
        DataPipeline = ppBDEProcesso
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppBDEProcesso'
        mmHeight = 13229
        mmLeft = 529
        mmTop = 1588
        mmWidth = 47890
        BandType = 9
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NR_PEDIDO'
      DataPipeline = BDEPackingList
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEPackingList'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 115000
        mmPrintPosition = 0
        object ppDBText32: TppDBText
          UserName = 'DBText26'
          DataField = 'NIT_NOTIFY1'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3175
          mmLeft = 102129
          mmTop = 53975
          mmWidth = 88371
          BandType = 3
          GroupNo = 0
        end
        object ppDBText35: TppDBText
          UserName = 'DBText29'
          DataField = 'RUC_NOTIFY1'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3175
          mmLeft = 102394
          mmTop = 53711
          mmWidth = 88636
          BandType = 3
          GroupNo = 0
        end
        object ppDBText34: TppDBText
          UserName = 'DBText28'
          DataField = 'RUC_CONSIGNATARIO'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3175
          mmLeft = 102394
          mmTop = 33073
          mmWidth = 84402
          BandType = 3
          GroupNo = 0
        end
        object ppDBText37: TppDBText
          UserName = 'DBText37'
          DataField = 'CUIT_CONSIGNATARIO'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3175
          mmLeft = 103188
          mmTop = 32808
          mmWidth = 83608
          BandType = 3
          GroupNo = 0
        end
        object ppDBText30: TppDBText
          UserName = 'DBText22'
          DataField = 'NR_NIT'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3175
          mmLeft = 5556
          mmTop = 33602
          mmWidth = 80963
          BandType = 3
          GroupNo = 0
        end
        object ppDBText33: TppDBText
          UserName = 'DBText27'
          DataField = 'NR_RUC'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3175
          mmLeft = 5292
          mmTop = 33338
          mmWidth = 81227
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemoIMP: TppDBMemo
          UserName = 'DBMemoIMP'
          CharWrap = False
          DataField = 'TX_IMPORTADOR'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 18785
          mmLeft = 5292
          mmTop = 21696
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBtxt10: TppDBText
          UserName = 'DBtxt10'
          DataField = 'NM_IMPORTADOR'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 5292
          mmTop = 21960
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemoNOT: TppDBMemo
          UserName = 'DBMemoNOT'
          CharWrap = False
          DataField = 'TX_NOTIFY1'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 12435
          mmLeft = 102129
          mmTop = 42333
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText36: TppDBText
          UserName = 'DBText36'
          DataField = 'NR_CUIT'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3175
          mmLeft = 5556
          mmTop = 33602
          mmWidth = 81227
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemoCON: TppDBMemo
          UserName = 'DBMemoCON'
          CharWrap = False
          DataField = 'TX_CONSIGNATARIO'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 18785
          mmLeft = 102129
          mmTop = 21696
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBMemoNOT2: TppDBMemo
          UserName = 'DBMemoNOT2'
          CharWrap = False
          DataField = 'TX_NOTIFY2'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 12435
          mmLeft = 102394
          mmTop = 57150
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBMemoEXP: TppDBMemo
          UserName = 'DBMemoEXP'
          CharWrap = False
          DataField = 'TX_EXPORTADOR'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 19844
          mmLeft = 51858
          mmTop = 1058
          mmWidth = 90223
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBMemo1: TppDBMemo
          UserName = 'DBMemo1'
          CharWrap = False
          DataField = 'calcMarcas'
          DataPipeline = BDEPackingList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDEPackingList'
          mmHeight = 28046
          mmLeft = 529
          mmTop = 42598
          mmWidth = 46567
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBtxt1: TppDBText
          UserName = 'DBtxt1'
          DataField = 'NM_EXPORTADOR'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 51858
          mmTop = 1058
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt5: TppDBText
          UserName = 'DBtxt5'
          DataField = 'END_EMPRESA_EXP'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 51858
          mmTop = 5027
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt6: TppDBText
          UserName = 'DBtxt6'
          DataField = 'END_GERAL_EXP'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 51858
          mmTop = 8996
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt7: TppDBText
          UserName = 'DBtxt7'
          DataField = 'NR_PHONE_EXP'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 51858
          mmTop = 12965
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt9: TppDBText
          UserName = 'DBtxt9'
          DataField = 'DT_FATURA'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 145521
          mmTop = 12435
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt11: TppDBText
          UserName = 'DBtxt101'
          DataField = 'END_EMPRESA_IMP'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 2498
          mmLeft = 5292
          mmTop = 25135
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt12: TppDBText
          UserName = 'DBtxt12'
          DataField = 'calc_imp2'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3440
          mmLeft = 5292
          mmTop = 28046
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt13: TppDBText
          UserName = 'DBtxt102'
          DataField = 'NM_CONSIGNATARIO'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 102129
          mmTop = 21696
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt14: TppDBText
          UserName = 'DBtxt14'
          DataField = 'END_CONSIGNATARIO'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 2498
          mmLeft = 102129
          mmTop = 25135
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt15: TppDBText
          UserName = 'DBtxt15'
          DataField = 'calc_consig2'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3440
          mmLeft = 102129
          mmTop = 28046
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt18: TppDBText
          UserName = 'DBtxt18'
          DataField = 'calc_origem'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 100542
          mmTop = 75671
          mmWidth = 44979
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt19: TppDBText
          UserName = 'DBtxt19'
          DataField = 'calc_destino'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 150019
          mmTop = 75936
          mmWidth = 44979
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt23: TppDBText
          UserName = 'DBtxt23'
          DataField = 'NM_NOTIFY1'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 102129
          mmTop = 42333
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt24: TppDBText
          UserName = 'DBtxt24'
          DataField = 'END_NOTIFY1'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 2498
          mmLeft = 102129
          mmTop = 46038
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt25: TppDBText
          UserName = 'DBtxt25'
          DataField = 'calc_notify2'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 102129
          mmTop = 49477
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBText59: TppDBText
          UserName = 'DBText59'
          DataField = 'NR_PEDIDO'
          DataPipeline = BDEPackingList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEPackingList'
          mmHeight = 3704
          mmLeft = 75142
          mmTop = 38894
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppDBText60: TppDBText
          UserName = 'DBText60'
          DataField = 'DT_FATURA'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3704
          mmLeft = 75142
          mmTop = 42863
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo3: TppDBMemo
          UserName = 'DBMemo3'
          CharWrap = False
          DataField = 'calcPacote'
          DataPipeline = BDEPackingList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDEPackingList'
          mmHeight = 8996
          mmLeft = 529
          mmTop = 71438
          mmWidth = 94986
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppPesoLiq: TppLabel
          UserName = 'Label13'
          Caption = '6.075,0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 75142
          mmTop = 47625
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppPesoBruto: TppLabel
          UserName = 'Label15'
          Caption = '6.739,5000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 75142
          mmTop = 51858
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppCubagem: TppLabel
          UserName = 'Label16'
          Caption = '14,620'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 75142
          mmTop = 55827
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppPg: TppSystemVariable
          UserName = 'Pg'
          VarType = vtPageNo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          Visible = False
          mmHeight = 3969
          mmLeft = 192088
          mmTop = 2381
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppDBTextORIGEM: TppDBText
          UserName = 'DBText102'
          DataField = 'NM_LOCAL_ORIGEM'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 100542
          mmTop = 75936
          mmWidth = 44979
          BandType = 3
          GroupNo = 0
        end
        object ppDBTextDESTINO: TppDBText
          UserName = 'DBText11'
          DataField = 'NM_LOCAL_DESTINO'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 150019
          mmTop = 75936
          mmWidth = 44979
          BandType = 3
          GroupNo = 0
        end
        object ppMerc: TppMemo
          UserName = 'Merc'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 265
          mmLeft = 55298
          mmTop = 90000
          mmWidth = 103981
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBTxtNot2_1: TppDBText
          UserName = 'DBText18'
          DataField = 'NM_NOTIFY2'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 102394
          mmTop = 57150
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBTxtNot2_2: TppDBText
          UserName = 'DBText19'
          DataField = 'END_NOTIFY2'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 102394
          mmTop = 61119
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBTxtNot2_3: TppDBText
          UserName = 'DBText20'
          DataField = 'calc_notify2_2'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3969
          mmLeft = 102394
          mmTop = 65088
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBText31: TppDBText
          UserName = 'DBText25'
          DataField = 'NIT_CONSIGNATARIO'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 3175
          mmLeft = 102129
          mmTop = 33073
          mmWidth = 84402
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt8: TppDBText
          UserName = 'DBtxt8'
          DataField = 'NR_PEDIDO'
          DataPipeline = BDEPackingList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDEPackingList'
          mmHeight = 3260
          mmLeft = 145521
          mmTop = 8467
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object ppDBMemo5: TppDBMemo
          UserName = 'DBMemo5'
          CharWrap = False
          DataField = 'TX_DECL_ADICIONAL'
          DataPipeline = ppBDEProcesso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Stretch = True
          DataPipelineName = 'ppBDEProcesso'
          mmHeight = 7144
          mmLeft = 72496
          mmTop = 3440
          mmWidth = 90488
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'TX_CAMINHO'
      DataPipeline = BDEPackingList
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEPackingList'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3175
        mmPrintPosition = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryTexto: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT (CASE CD_LINGUA_PEDIDO WHEN '#39'2'#39' THEN '#39'LISTA DE EMPAQUE'#39' E' +
        'LSE '#39'PACKING LIST'#39' END) AS TIT01,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'N'#218'MERO:'#39' WHEN '#39'1'#39' T' +
        'HEN '#39'NUMBER:'#39' WHEN '#39'2'#39' THEN '#39'NUMERO:'#39' END) AS TIT02,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Data:'#39' WHEN '#39'1'#39' THE' +
        'N '#39'Date:'#39' WHEN '#39'2'#39' THEN '#39'Fecha:'#39' END) AS TIT03,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PARA:'#39' WHEN '#39'1'#39' THE' +
        'N '#39'BUYER:'#39' WHEN '#39'2'#39' THEN '#39'A'#39'END) AS TIT04,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'CONSIGNAT'#193'RIO:'#39' WHE' +
        'N '#39'1'#39' THEN '#39'CONSIGNEE:'#39' WHEN '#39'2'#39' THEN '#39'CONSIGNAT'#193'RIO:'#39' END) AS T' +
        'IT05,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'MARCA'#199#195'O:'#39' WHEN '#39'1'#39 +
        ' THEN '#39'MARKS:'#39' WHEN '#39'2'#39' THEN '#39'MARCAS:'#39' END) AS TIT06,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'FATURA:'#39' WHEN '#39'1'#39' T' +
        'HEN '#39'INVOICE:'#39' WHEN '#39'2'#39' THEN '#39'FACTURA:'#39' END) AS TIT07,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PESO L'#205'QUIDO:'#39' WHEN' +
        ' '#39'1'#39' THEN '#39'NET WEIGHT:'#39' WHEN '#39'2'#39' THEN '#39'PESO NETO:'#39' END) AS TIT08' +
        ','
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PESO BRUTO:'#39' WHEN '#39 +
        '1'#39' THEN '#39'GROSS WEIGHT:'#39' WHEN '#39'2'#39' THEN '#39'PESO BRUTO:'#39' END) AS TIT0' +
        '9,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'CUBAGEM:'#39' WHEN '#39'1'#39' ' +
        'THEN '#39'MEASUREMENT:'#39' WHEN '#39'2'#39' THEN '#39'CUBAJE M3:'#39' END) AS TIT10,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'NOTIFICADOR:'#39' WHEN ' +
        #39'1'#39' THEN '#39'NOTIFY:'#39' WHEN '#39'2'#39' THEN '#39'NOTIFICAR:'#39' END) AS TIT11,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PORTO DE EMBARQUE:'#39 +
        ' WHEN '#39'1'#39' THEN '#39'PORT OF LOADING:'#39' WHEN '#39'2'#39' THEN '#39'PUERTO EMBARQUE' +
        ':'#39' END) AS TIT12,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PORTO DE DESCARGA:'#39 +
        ' WHEN '#39'1'#39' THEN '#39'PORT OF UNLOADING:'#39' WHEN '#39'2'#39' THEN '#39'PUERTO DE DES' +
        'EMBARQUE:'#39' END) AS TIT13,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PRODUTO'#39' WHEN '#39'1'#39' T' +
        'HEN '#39'PRODUCT'#39' WHEN '#39'2'#39' THEN '#39'PRODUCTO'#39' END) AS TIT14,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'DESCRI'#199#195'O'#39' WHEN '#39'1'#39 +
        ' THEN '#39'DESCRIPTION'#39' WHEN '#39'2'#39' THEN '#39'DESCRIPCION'#39' END) AS TIT15,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PESO L'#205'QUIDO'#39' WHEN ' +
        #39'1'#39' THEN '#39'NET WEIGHT'#39' WHEN '#39'2'#39' THEN '#39'PESO NETO'#39' END) AS TIT16,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'NOTIFICADOR 2:'#39' WHE' +
        'N '#39'1'#39' THEN '#39'NOTIFY 2:'#39' WHEN '#39'2'#39' THEN '#39'NOTIFICAR 2:'#39' END) AS TIT1' +
        '7,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'AEROPORTO DE EMBARQ' +
        'UE:'#39' WHEN '#39'1'#39' THEN '#39'AIRPORT OF LOADING:'#39' WHEN '#39'2'#39' THEN '#39'AEROPUER' +
        'TO DE EMBARQUE:'#39' END) AS TIT18,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'AEROPORTO DE DESCAR' +
        'GA:'#39' WHEN '#39'1'#39' THEN '#39'AIRPORT OF UNLOADING:'#39' WHEN '#39'2'#39' THEN '#39'AEROPU' +
        'ERTO DE DESEMBARQUE:'#39' END) AS TIT19,'
      ''
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PACKING'#39' WHEN '#39'1'#39' T' +
        'HEN '#39'PACKING'#39' WHEN '#39'2'#39' THEN '#39'EMPAQUE'#39' END) AS DUP01,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'IMPORTADOR:'#39' WHEN '#39 +
        '1'#39' THEN '#39'CUSTOMER:'#39' WHEN '#39'2'#39' THEN '#39'IMPORTADOR:'#39' END) AS DUP02,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Ref. Exportador:'#39' W' +
        'HEN '#39'1'#39' THEN '#39'Shipper'#180's Reference:'#39' WHEN '#39'2'#39' THEN '#39'Shipper'#180's Ref' +
        'erence:'#39' END) AS DUP03,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'N'#250'mero de Ordem:'#39' W' +
        'HEN '#39'1'#39' THEN '#39'Customer'#180's Order Nr.:'#39' WHEN '#39'2'#39' THEN '#39'Numero Orden' +
        ':'#39' END) AS DUP04,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Nr. Fatura:'#39' WHEN '#39 +
        '1'#39' THEN '#39'Invoice No.:'#39' WHEN '#39'2'#39' THEN '#39'Nr. Factura:'#39' END) AS DUP0' +
        '5,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'EMBALAGEM'#39' WHEN '#39'1'#39 +
        ' THEN '#39'PACKING'#39' WHEN '#39'2'#39' THEN '#39'PAQUETES'#39' END) AS DUP06,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Qtd'#39' WHEN '#39'1'#39' THEN ' +
        #39'Qty'#39' WHEN '#39'2'#39' THEN '#39'Ctd'#39' END) AS DUP07,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Tipo'#39' WHEN '#39'1'#39' THEN' +
        ' '#39'Type'#39' WHEN '#39'2'#39' THEN '#39'Tipo'#39' END) AS DUP08,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'N'#250'mero'#39' WHEN '#39'1'#39' TH' +
        'EN '#39'Number'#39' WHEN '#39'2'#39' THEN '#39'Numero'#39' END) AS DUP09,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Conte'#250'do'#39' WHEN '#39'1'#39' ' +
        'THEN '#39'Contents'#39' WHEN '#39'2'#39' THEN '#39'Contenido'#39' END) AS DUP10,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'P. Bruto'#39' WHEN '#39'1'#39' ' +
        'THEN '#39'Gross'#39' WHEN '#39'2'#39' THEN '#39'P. Bruto'#39' END) AS DUP11,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Tara'#39' WHEN '#39'1'#39' THEN' +
        ' '#39'Tare'#39' WHEN '#39'2'#39' THEN '#39'Tara'#39' END) AS DUP12,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'P. L'#237'q.'#39' WHEN '#39'1'#39' T' +
        'HEN '#39'Net'#39' WHEN '#39'2'#39' THEN '#39'P. Neto'#39' END) AS DUP13,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Embal.'#39' WHEN '#39'1'#39' TH' +
        'EN '#39'Packages'#39' WHEN '#39'2'#39' THEN '#39'Paquetes'#39' END) AS DUP14,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Observa'#231#227'o'#39' WHEN '#39'1' +
        #39' THEN '#39'Remarks'#39' WHEN '#39'2'#39' THEN '#39'Observaciones'#39' END) AS DUP15,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'C'#211'PIA'#39' WHEN '#39'1'#39' THE' +
        'N '#39'COPY'#39' WHEN '#39'2'#39' THEN '#39'COPIA'#39' END) AS DUP16,'
      ''
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Fatura Nr:'#39' WHEN '#39'1' +
        #39' THEN '#39'Invoice Nr.:'#39' WHEN '#39'2'#39' THEN '#39'Fatura Nr:'#39' END) AS AJI01,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'ORDEM DE COMPRA'#39' WH' +
        'EN '#39'1'#39' THEN '#39'PURCHASE ORDER'#39' WHEN '#39'2'#39' THEN '#39'ORDEM DE COMPRA'#39' END' +
        ') AS AJI02,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'COMERCIALIZADO EM'#39' ' +
        'WHEN '#39'1'#39' THEN '#39'SHIPPED IN'#39' WHEN '#39'2'#39' THEN '#39'SHIPPED EN'#39' END) AS AJ' +
        'I03,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'DESTINO'#39' WHEN '#39'1'#39' T' +
        'HEN '#39'DESTINATION'#39' WHEN '#39'2'#39' THEN '#39'DESTINO'#39' END) AS AJI04,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'MARCAS'#39' WHEN '#39'1'#39' TH' +
        'EN '#39'MARKS AND NUMBERS'#39' WHEN '#39'2'#39' THEN '#39'MARCAS Y N'#218'MEROS'#39' END) AS ' +
        'AJI05,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'QUANTIDADE'#39' WHEN '#39'1' +
        #39' THEN '#39'QUANTITY'#39' WHEN '#39'2'#39' THEN '#39'CANTIDAD'#39' END) AS AJI06,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PESO LIQ. Kg.'#39' WHEN' +
        ' '#39'1'#39' THEN '#39'NET WEIGHT Kg.'#39' WHEN '#39'2'#39' THEN '#39'PESO NETO Kg.'#39' END) AS' +
        ' AJI07,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PESO BRUTO Kg.'#39' WHE' +
        'N '#39'1'#39' THEN '#39'GROSS WEIGHT Kg.'#39' WHEN '#39'2'#39' THEN '#39'PESO BRUTO Kg.'#39' END' +
        ') AS AJI08,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'C'#243'd. Material'#39' WHEN' +
        ' '#39'1'#39' THEN '#39'Material Code'#39' WHEN '#39'2'#39' THEN '#39'C'#243'd. Material'#39' END) AS ' +
        'AJI09,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'DESCRI'#199#195'O'#39' WHEN '#39'1'#39 +
        ' THEN '#39'DESCRIPTION OF GOODS'#39' WHEN '#39'2'#39' THEN '#39'DESCRIPCI'#211'N'#39' END) AS' +
        ' AJI10,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PARA'#39' WHEN '#39'1'#39' THEN' +
        ' '#39'BUYER'#39' WHEN '#39'2'#39' THEN '#39'A'#39'END) AS AJI11,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PESO LIQ.'#39' WHEN '#39'1'#39 +
        ' THEN '#39'NET WEIGHT'#39' WHEN '#39'2'#39' THEN '#39'PESO NETO'#39' END) AS AJI12,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'PESO BRUTO'#39' WHEN '#39'1' +
        #39' THEN '#39'GROSS WEIGHT'#39' WHEN '#39'2'#39' THEN '#39'PESO BRUTO'#39' END) AS AJI13,'
      '       (CASE CD_LINGUA_PEDIDO'
      
        '          WHEN '#39'0'#39' THEN '#39'Dimens'#245'es, medidas c'#250'bicas e pesos sepa' +
        'rados para cada Embalagem'#39
      
        '          WHEN '#39'1'#39' THEN '#39'Dimensions, Cubic Measurements and Weig' +
        'hts separately for each Package'#39
      
        '          WHEN '#39'2'#39' THEN '#39'Dimensiones, medidas c'#250'bicas y pesos po' +
        'r separado para cada paquete'#39
      '        END) AS DUP17,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'EMBALAGEM'#39' WHEN '#39'1'#39 +
        ' THEN '#39'PACKAGES'#39' WHEN '#39'2'#39' THEN '#39'ENVASE'#39' END) AS CRO01,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'N'#186' LOTE'#39' WHEN '#39'1'#39' T' +
        'HEN '#39'BATCH N'#186#39' WHEN '#39'2'#39' THEN '#39'LOTE N'#186#39' END) AS CRO02,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'POR: '#39' WHEN '#39'1'#39' THE' +
        'N '#39'FOR: '#39' WHEN '#39'2'#39' THEN '#39'POR: '#39' END) AS CRO03,'
      
        '       (CASE CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN '#39'Assinatura Autoriza' +
        'da'#39' WHEN '#39'1'#39' THEN '#39'Authorized Signature'#39' WHEN '#39'2'#39' THEN '#39'Firma Au' +
        'torizada'#39' END) AS CRO04'
      ''
      '  FROM TPROCESSO_EXP E (NOLOCK)'
      ' WHERE E.NR_PROCESSO = :processo')
    Left = 292
    Top = 283
    ParamData = <
      item
        DataType = ftString
        Name = 'processo'
        ParamType = ptInput
      end>
    object qryTextoTIT01: TStringField
      FieldName = 'TIT01'
      FixedChar = True
      Size = 16
    end
    object qryTextoTIT02: TStringField
      FieldName = 'TIT02'
      FixedChar = True
      Size = 7
    end
    object qryTextoTIT03: TStringField
      FieldName = 'TIT03'
      FixedChar = True
      Size = 6
    end
    object qryTextoTIT04: TStringField
      FieldName = 'TIT04'
      FixedChar = True
      Size = 6
    end
    object qryTextoTIT05: TStringField
      FieldName = 'TIT05'
      FixedChar = True
      Size = 14
    end
    object qryTextoTIT06: TStringField
      FieldName = 'TIT06'
      FixedChar = True
      Size = 9
    end
    object qryTextoTIT07: TStringField
      FieldName = 'TIT07'
      FixedChar = True
      Size = 8
    end
    object qryTextoTIT08: TStringField
      FieldName = 'TIT08'
      FixedChar = True
      Size = 13
    end
    object qryTextoTIT09: TStringField
      FieldName = 'TIT09'
      FixedChar = True
      Size = 13
    end
    object qryTextoTIT10: TStringField
      FieldName = 'TIT10'
      FixedChar = True
      Size = 12
    end
    object qryTextoTIT11: TStringField
      FieldName = 'TIT11'
      FixedChar = True
      Size = 12
    end
    object qryTextoTIT12: TStringField
      FieldName = 'TIT12'
      FixedChar = True
      Size = 18
    end
    object qryTextoTIT13: TStringField
      FieldName = 'TIT13'
      FixedChar = True
      Size = 22
    end
    object qryTextoTIT14: TStringField
      FieldName = 'TIT14'
      FixedChar = True
      Size = 8
    end
    object qryTextoTIT15: TStringField
      FieldName = 'TIT15'
      FixedChar = True
      Size = 11
    end
    object qryTextoTIT16: TStringField
      FieldName = 'TIT16'
      FixedChar = True
      Size = 12
    end
    object qryTextoTIT18: TStringField
      FieldName = 'TIT18'
      FixedChar = True
      Size = 22
    end
    object qryTextoTIT19: TStringField
      FieldName = 'TIT19'
      FixedChar = True
      Size = 26
    end
    object qryTextoDUP01: TStringField
      FieldName = 'DUP01'
      FixedChar = True
      Size = 28
    end
    object qryTextoDUP02: TStringField
      FieldName = 'DUP02'
      FixedChar = True
      Size = 11
    end
    object qryTextoDUP03: TStringField
      FieldName = 'DUP03'
      FixedChar = True
    end
    object qryTextoDUP04: TStringField
      FieldName = 'DUP04'
      FixedChar = True
      Size = 21
    end
    object qryTextoDUP05: TStringField
      FieldName = 'DUP05'
      FixedChar = True
      Size = 12
    end
    object qryTextoDUP06: TStringField
      FieldName = 'DUP06'
      FixedChar = True
      Size = 9
    end
    object qryTextoDUP07: TStringField
      FieldName = 'DUP07'
      FixedChar = True
      Size = 3
    end
    object qryTextoDUP08: TStringField
      FieldName = 'DUP08'
      FixedChar = True
      Size = 4
    end
    object qryTextoDUP09: TStringField
      FieldName = 'DUP09'
      FixedChar = True
      Size = 6
    end
    object qryTextoDUP10: TStringField
      FieldName = 'DUP10'
      FixedChar = True
      Size = 9
    end
    object qryTextoDUP11: TStringField
      FieldName = 'DUP11'
      FixedChar = True
      Size = 8
    end
    object qryTextoDUP12: TStringField
      FieldName = 'DUP12'
      FixedChar = True
      Size = 4
    end
    object qryTextoDUP13: TStringField
      FieldName = 'DUP13'
      FixedChar = True
      Size = 7
    end
    object qryTextoDUP14: TStringField
      FieldName = 'DUP14'
      FixedChar = True
      Size = 8
    end
    object qryTextoDUP15: TStringField
      FieldName = 'DUP15'
      FixedChar = True
      Size = 13
    end
    object qryTextoDUP16: TStringField
      FieldName = 'DUP16'
      FixedChar = True
      Size = 5
    end
    object qryTextoDUP17: TStringField
      FieldName = 'DUP17'
      FixedChar = True
      Size = 70
    end
    object qryTextoCRO01: TStringField
      FieldName = 'CRO01'
      FixedChar = True
      Size = 9
    end
    object qryTextoCRO02: TStringField
      FieldName = 'CRO02'
      FixedChar = True
      Size = 8
    end
    object qryTextoCRO03: TStringField
      FieldName = 'CRO03'
      FixedChar = True
      Size = 5
    end
    object qryTextoCRO04: TStringField
      FieldName = 'CRO04'
      FixedChar = True
      Size = 21
    end
    object qryTextoTIT17: TStringField
      FieldName = 'TIT17'
      FixedChar = True
      Size = 14
    end
    object qryTextoAJI01: TStringField
      FieldName = 'AJI01'
      FixedChar = True
      Size = 12
    end
    object qryTextoAJI02: TStringField
      FieldName = 'AJI02'
      FixedChar = True
      Size = 15
    end
    object qryTextoAJI03: TStringField
      FieldName = 'AJI03'
      FixedChar = True
      Size = 17
    end
    object qryTextoAJI04: TStringField
      FieldName = 'AJI04'
      FixedChar = True
      Size = 11
    end
    object qryTextoAJI05: TStringField
      FieldName = 'AJI05'
      FixedChar = True
      Size = 17
    end
    object qryTextoAJI06: TStringField
      FieldName = 'AJI06'
      FixedChar = True
      Size = 10
    end
    object qryTextoAJI07: TStringField
      FieldName = 'AJI07'
      FixedChar = True
      Size = 14
    end
    object qryTextoAJI08: TStringField
      FieldName = 'AJI08'
      FixedChar = True
      Size = 15
    end
    object qryTextoAJI09: TStringField
      FieldName = 'AJI09'
      FixedChar = True
      Size = 13
    end
    object qryTextoAJI10: TStringField
      FieldName = 'AJI10'
      FixedChar = True
    end
    object qryTextoAJI11: TStringField
      FieldName = 'AJI11'
      FixedChar = True
      Size = 5
    end
    object qryTextoAJI12: TStringField
      FieldName = 'AJI12'
      FixedChar = True
      Size = 10
    end
    object qryTextoAJI13: TStringField
      FieldName = 'AJI13'
      FixedChar = True
      Size = 12
    end
  end
  object dsTexto: TDataSource
    DataSet = qryTexto
    Left = 298
    Top = 103
  end
  object qryTotAjinomoto: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT (SELECT SUM(P1.VL_QTDE) FROM TPROCESSO_PALETIZACAO P1 WHE' +
        'RE P1.NR_PROCESSO = PP.NR_PROCESSO) AS TOT_QTDE,'
      
        '(SELECT SUM(P1.VL_PESO_LIQUIDO) FROM TPROCESSO_PALETIZACAO P1 WH' +
        'ERE P1.NR_PROCESSO = PP.NR_PROCESSO) AS TOT_PESOLIQUIDO,'
      
        '(SELECT SUM(P1.VL_PESO_BRUTO) FROM TPROCESSO_PALETIZACAO P1 WHER' +
        'E P1.NR_PROCESSO = PP.NR_PROCESSO) AS TOT_PESOBRUTO,'
      
        '(SELECT SUM(P1.VL_M3) FROM TPROCESSO_PALETIZACAO P1 WHERE P1.NR_' +
        'PROCESSO = PP.NR_PROCESSO) AS TOT_M3,'
      
        'SUM(PP.VL_QTDE) TOT_QTDE_ITEM, PP.CD_MERCADORIA, ME.AP_MERCADORI' +
        'A NM_MERCADORIA,'
      '(CASE'
      
        'WHEN PE.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_DESCR_DETALHADA F' +
        'ROM TEMBALAGEM EMB (NOLOCK) WHERE EMB.CD_EMBALAGEM = ME.CD_EMBAL' +
        'AGEM)'
      
        'WHEN PE.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_DESCR_DETALHADA_I' +
        'NGLES FROM TEMBALAGEM EMB (NOLOCK)  WHERE EMB.CD_EMBALAGEM = ME.' +
        'CD_EMBALAGEM)'
      
        'WHEN PE.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_DESCR_DETALHADA_E' +
        'SPANHOL FROM TEMBALAGEM EMB (NOLOCK)  WHERE EMB.CD_EMBALAGEM = M' +
        'E.CD_EMBALAGEM)'
      'END) EMBALAGEM'
      'FROM TPROCESSO_PALETIZACAO PP'
      'INNER JOIN TPROCESSO_EXP PE ON PE.NR_PROCESSO = PP.NR_PROCESSO'
      
        'INNER JOIN TPROCESSO_EXP_ITEM PEI ON PEI.NR_PROCESSO = PP.NR_PRO' +
        'CESSO'
      
        'INNER JOIN TMERCADORIA_EXP ME ON ME.CD_MERCADORIA = PP.CD_MERCAD' +
        'ORIA'
      'WHERE PP.NR_PROCESSO = :NR_PROCESSO'
      'AND PP.NR_ITEM IS NOT NULL'
      
        'GROUP BY PP.NR_PROCESSO, PP.CD_MERCADORIA, ME.AP_MERCADORIA, ME.' +
        'CD_EMBALAGEM, PE.CD_LINGUA_PEDIDO')
    Left = 238
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryTotAjinomotoTOT_QTDE: TFloatField
      FieldName = 'TOT_QTDE'
    end
    object qryTotAjinomotoTOT_PESOLIQUIDO: TFloatField
      FieldName = 'TOT_PESOLIQUIDO'
    end
    object qryTotAjinomotoTOT_PESOBRUTO: TFloatField
      FieldName = 'TOT_PESOBRUTO'
    end
    object qryTotAjinomotoTOT_M3: TFloatField
      FieldName = 'TOT_M3'
    end
    object qryTotAjinomotoTOT_QTDE_ITEM: TFloatField
      FieldName = 'TOT_QTDE_ITEM'
    end
    object qryTotAjinomotoCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
    end
    object qryTotAjinomotoNM_MERCADORIA: TStringField
      FieldName = 'NM_MERCADORIA'
      FixedChar = True
      Size = 150
    end
    object qryTotAjinomotoEMBALAGEM: TStringField
      FieldName = 'EMBALAGEM'
      FixedChar = True
      Size = 50
    end
  end
  object dsTotAjinomoto: TDataSource
    DataSet = qryTotAjinomoto
    Left = 296
    Top = 111
  end
  object ppBDETotAjinomoto: TppDBPipeline
    DataSource = dsTotAjinomoto
    UserName = 'BDETotAjinomoto'
    Left = 77
    Top = 16
    object ppBDETotAjinomotoppField1: TppField
      FieldAlias = 'TOT_QTDE'
      FieldName = 'TOT_QTDE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDETotAjinomotoppField2: TppField
      FieldAlias = 'TOT_PESOLIQUIDO'
      FieldName = 'TOT_PESOLIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDETotAjinomotoppField3: TppField
      FieldAlias = 'TOT_PESOBRUTO'
      FieldName = 'TOT_PESOBRUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDETotAjinomotoppField4: TppField
      FieldAlias = 'TOT_M3'
      FieldName = 'TOT_M3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDETotAjinomotoppField5: TppField
      FieldAlias = 'TOT_QTDE_ITEM'
      FieldName = 'TOT_QTDE_ITEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDETotAjinomotoppField6: TppField
      FieldAlias = 'CD_MERCADORIA'
      FieldName = 'CD_MERCADORIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDETotAjinomotoppField7: TppField
      FieldAlias = 'NM_MERCADORIA'
      FieldName = 'NM_MERCADORIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDETotAjinomotoppField8: TppField
      FieldAlias = 'EMBALAGEM'
      FieldName = 'EMBALAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
  end
  object ppBDETexto: TppBDEPipeline
    DataSource = dsTexto
    UserName = 'BDE_Texto'
    Left = 128
    Top = 20
    object ppBDETextoppField1: TppField
      FieldAlias = 'TIT01'
      FieldName = 'TIT01'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDETextoppField2: TppField
      FieldAlias = 'TIT02'
      FieldName = 'TIT02'
      FieldLength = 7
      DisplayWidth = 7
      Position = 1
    end
    object ppBDETextoppField3: TppField
      FieldAlias = 'TIT03'
      FieldName = 'TIT03'
      FieldLength = 6
      DisplayWidth = 6
      Position = 2
    end
    object ppBDETextoppField4: TppField
      FieldAlias = 'TIT04'
      FieldName = 'TIT04'
      FieldLength = 6
      DisplayWidth = 6
      Position = 3
    end
    object ppBDETextoppField5: TppField
      FieldAlias = 'TIT05'
      FieldName = 'TIT05'
      FieldLength = 14
      DisplayWidth = 14
      Position = 4
    end
    object ppBDETextoppField6: TppField
      FieldAlias = 'TIT06'
      FieldName = 'TIT06'
      FieldLength = 9
      DisplayWidth = 9
      Position = 5
    end
    object ppBDETextoppField7: TppField
      FieldAlias = 'TIT07'
      FieldName = 'TIT07'
      FieldLength = 8
      DisplayWidth = 8
      Position = 6
    end
    object ppBDETextoppField8: TppField
      FieldAlias = 'TIT08'
      FieldName = 'TIT08'
      FieldLength = 13
      DisplayWidth = 13
      Position = 7
    end
    object ppBDETextoppField9: TppField
      FieldAlias = 'TIT09'
      FieldName = 'TIT09'
      FieldLength = 13
      DisplayWidth = 13
      Position = 8
    end
    object ppBDETextoppField10: TppField
      FieldAlias = 'TIT10'
      FieldName = 'TIT10'
      FieldLength = 12
      DisplayWidth = 12
      Position = 9
    end
    object ppBDETextoppField11: TppField
      FieldAlias = 'TIT11'
      FieldName = 'TIT11'
      FieldLength = 12
      DisplayWidth = 12
      Position = 10
    end
    object ppBDETextoppField12: TppField
      FieldAlias = 'TIT12'
      FieldName = 'TIT12'
      FieldLength = 18
      DisplayWidth = 18
      Position = 11
    end
    object ppBDETextoppField13: TppField
      FieldAlias = 'TIT13'
      FieldName = 'TIT13'
      FieldLength = 22
      DisplayWidth = 22
      Position = 12
    end
    object ppBDETextoppField14: TppField
      FieldAlias = 'TIT14'
      FieldName = 'TIT14'
      FieldLength = 8
      DisplayWidth = 8
      Position = 13
    end
    object ppBDETextoppField15: TppField
      FieldAlias = 'TIT15'
      FieldName = 'TIT15'
      FieldLength = 11
      DisplayWidth = 11
      Position = 14
    end
    object ppBDETextoppField16: TppField
      FieldAlias = 'TIT16'
      FieldName = 'TIT16'
      FieldLength = 12
      DisplayWidth = 12
      Position = 15
    end
    object ppBDETextoppField17: TppField
      FieldAlias = 'TIT18'
      FieldName = 'TIT18'
      FieldLength = 22
      DisplayWidth = 22
      Position = 16
    end
    object ppBDETextoppField18: TppField
      FieldAlias = 'TIT19'
      FieldName = 'TIT19'
      FieldLength = 26
      DisplayWidth = 26
      Position = 17
    end
    object ppBDETextoppField19: TppField
      FieldAlias = 'DUP01'
      FieldName = 'DUP01'
      FieldLength = 28
      DisplayWidth = 28
      Position = 18
    end
    object ppBDETextoppField20: TppField
      FieldAlias = 'DUP02'
      FieldName = 'DUP02'
      FieldLength = 11
      DisplayWidth = 11
      Position = 19
    end
    object ppBDETextoppField21: TppField
      FieldAlias = 'DUP03'
      FieldName = 'DUP03'
      FieldLength = 20
      DisplayWidth = 20
      Position = 20
    end
    object ppBDETextoppField22: TppField
      FieldAlias = 'DUP04'
      FieldName = 'DUP04'
      FieldLength = 21
      DisplayWidth = 21
      Position = 21
    end
    object ppBDETextoppField23: TppField
      FieldAlias = 'DUP05'
      FieldName = 'DUP05'
      FieldLength = 12
      DisplayWidth = 12
      Position = 22
    end
    object ppBDETextoppField24: TppField
      FieldAlias = 'DUP06'
      FieldName = 'DUP06'
      FieldLength = 9
      DisplayWidth = 9
      Position = 23
    end
    object ppBDETextoppField25: TppField
      FieldAlias = 'DUP07'
      FieldName = 'DUP07'
      FieldLength = 3
      DisplayWidth = 3
      Position = 24
    end
    object ppBDETextoppField26: TppField
      FieldAlias = 'DUP08'
      FieldName = 'DUP08'
      FieldLength = 4
      DisplayWidth = 4
      Position = 25
    end
    object ppBDETextoppField27: TppField
      FieldAlias = 'DUP09'
      FieldName = 'DUP09'
      FieldLength = 6
      DisplayWidth = 6
      Position = 26
    end
    object ppBDETextoppField28: TppField
      FieldAlias = 'DUP10'
      FieldName = 'DUP10'
      FieldLength = 9
      DisplayWidth = 9
      Position = 27
    end
    object ppBDETextoppField29: TppField
      FieldAlias = 'DUP11'
      FieldName = 'DUP11'
      FieldLength = 8
      DisplayWidth = 8
      Position = 28
    end
    object ppBDETextoppField30: TppField
      FieldAlias = 'DUP12'
      FieldName = 'DUP12'
      FieldLength = 4
      DisplayWidth = 4
      Position = 29
    end
    object ppBDETextoppField31: TppField
      FieldAlias = 'DUP13'
      FieldName = 'DUP13'
      FieldLength = 7
      DisplayWidth = 7
      Position = 30
    end
    object ppBDETextoppField32: TppField
      FieldAlias = 'DUP14'
      FieldName = 'DUP14'
      FieldLength = 8
      DisplayWidth = 8
      Position = 31
    end
    object ppBDETextoppField33: TppField
      FieldAlias = 'DUP15'
      FieldName = 'DUP15'
      FieldLength = 13
      DisplayWidth = 13
      Position = 32
    end
    object ppBDETextoppField34: TppField
      FieldAlias = 'DUP16'
      FieldName = 'DUP16'
      FieldLength = 5
      DisplayWidth = 5
      Position = 33
    end
    object ppBDETextoppField35: TppField
      FieldAlias = 'DUP17'
      FieldName = 'DUP17'
      FieldLength = 70
      DisplayWidth = 70
      Position = 34
    end
    object ppBDETextoppField36: TppField
      FieldAlias = 'CRO01'
      FieldName = 'CRO01'
      FieldLength = 9
      DisplayWidth = 9
      Position = 35
    end
    object ppBDETextoppField37: TppField
      FieldAlias = 'CRO02'
      FieldName = 'CRO02'
      FieldLength = 8
      DisplayWidth = 8
      Position = 36
    end
    object ppBDETextoppField38: TppField
      FieldAlias = 'CRO03'
      FieldName = 'CRO03'
      FieldLength = 5
      DisplayWidth = 5
      Position = 37
    end
    object ppBDETextoppField39: TppField
      FieldAlias = 'CRO04'
      FieldName = 'CRO04'
      FieldLength = 21
      DisplayWidth = 21
      Position = 38
    end
    object ppBDETextoppField40: TppField
      FieldAlias = 'TIT17'
      FieldName = 'TIT17'
      FieldLength = 14
      DisplayWidth = 14
      Position = 39
    end
    object ppBDETextoppField41: TppField
      FieldAlias = 'AJI01'
      FieldName = 'AJI01'
      FieldLength = 12
      DisplayWidth = 12
      Position = 40
    end
    object ppBDETextoppField42: TppField
      FieldAlias = 'AJI02'
      FieldName = 'AJI02'
      FieldLength = 15
      DisplayWidth = 15
      Position = 41
    end
    object ppBDETextoppField43: TppField
      FieldAlias = 'AJI03'
      FieldName = 'AJI03'
      FieldLength = 17
      DisplayWidth = 17
      Position = 42
    end
    object ppBDETextoppField44: TppField
      FieldAlias = 'AJI04'
      FieldName = 'AJI04'
      FieldLength = 11
      DisplayWidth = 11
      Position = 43
    end
    object ppBDETextoppField45: TppField
      FieldAlias = 'AJI05'
      FieldName = 'AJI05'
      FieldLength = 17
      DisplayWidth = 17
      Position = 44
    end
    object ppBDETextoppField46: TppField
      FieldAlias = 'AJI06'
      FieldName = 'AJI06'
      FieldLength = 10
      DisplayWidth = 10
      Position = 45
    end
    object ppBDETextoppField47: TppField
      FieldAlias = 'AJI07'
      FieldName = 'AJI07'
      FieldLength = 14
      DisplayWidth = 14
      Position = 46
    end
    object ppBDETextoppField48: TppField
      FieldAlias = 'AJI08'
      FieldName = 'AJI08'
      FieldLength = 15
      DisplayWidth = 15
      Position = 47
    end
    object ppBDETextoppField49: TppField
      FieldAlias = 'AJI09'
      FieldName = 'AJI09'
      FieldLength = 13
      DisplayWidth = 13
      Position = 48
    end
    object ppBDETextoppField50: TppField
      FieldAlias = 'AJI10'
      FieldName = 'AJI10'
      FieldLength = 20
      DisplayWidth = 20
      Position = 49
    end
    object ppBDETextoppField51: TppField
      FieldAlias = 'AJI11'
      FieldName = 'AJI11'
      FieldLength = 5
      DisplayWidth = 5
      Position = 50
    end
    object ppBDETextoppField52: TppField
      FieldAlias = 'AJI12'
      FieldName = 'AJI12'
      FieldLength = 10
      DisplayWidth = 10
      Position = 51
    end
    object ppBDETextoppField53: TppField
      FieldAlias = 'AJI13'
      FieldName = 'AJI13'
      FieldLength = 12
      DisplayWidth = 12
      Position = 52
    end
  end
  object ppBDEProcesso: TppBDEPipeline
    DataSource = dsProcesso
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'BDEProcesso'
    Left = 65
    Top = 40
    object ppBDEProcessoppField1: TppField
      FieldAlias = 'NR_FATURA'
      FieldName = 'NR_FATURA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDEProcessoppField2: TppField
      FieldAlias = 'DT_FATURA'
      FieldName = 'DT_FATURA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object ppBDEProcessoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_LIQUIDO'
      FieldName = 'VL_PESO_LIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppBDEProcessoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_BRUTO'
      FieldName = 'VL_PESO_BRUTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBDEProcessoppField5: TppField
      FieldAlias = 'TX_MARK'
      FieldName = 'TX_MARK'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDEProcessoppField6: TppField
      FieldAlias = 'NM_LOCAL_EMB'
      FieldName = 'NM_LOCAL_EMB'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppBDEProcessoppField7: TppField
      FieldAlias = 'NM_LOCAL_DESEMB'
      FieldName = 'NM_LOCAL_DESEMB'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppBDEProcessoppField8: TppField
      FieldAlias = 'NM_EXPORTADOR'
      FieldName = 'NM_EXPORTADOR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppBDEProcessoppField9: TppField
      FieldAlias = 'END_EMPRESA_EXP'
      FieldName = 'END_EMPRESA_EXP'
      FieldLength = 57
      DisplayWidth = 57
      Position = 8
    end
    object ppBDEProcessoppField10: TppField
      FieldAlias = 'END_GERAL_EXP'
      FieldName = 'END_GERAL_EXP'
      FieldLength = 55
      DisplayWidth = 55
      Position = 9
    end
    object ppBDEProcessoppField11: TppField
      FieldAlias = 'NR_PHONE_EXP'
      FieldName = 'NR_PHONE_EXP'
      FieldLength = 45
      DisplayWidth = 45
      Position = 10
    end
    object ppBDEProcessoppField12: TppField
      FieldAlias = 'NM_IMPORTADOR'
      FieldName = 'NM_IMPORTADOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 11
    end
    object ppBDEProcessoppField13: TppField
      FieldAlias = 'END_EMPRESA_IMP'
      FieldName = 'END_EMPRESA_IMP'
      FieldLength = 67
      DisplayWidth = 67
      Position = 12
    end
    object ppBDEProcessoppField14: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 13
    end
    object ppBDEProcessoppField15: TppField
      FieldAlias = 'NM_CONSIGNATARIO'
      FieldName = 'NM_CONSIGNATARIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
    object ppBDEProcessoppField16: TppField
      FieldAlias = 'NM_NOTIFY1'
      FieldName = 'NM_NOTIFY1'
      FieldLength = 60
      DisplayWidth = 60
      Position = 15
    end
    object ppBDEProcessoppField17: TppField
      FieldAlias = 'CD_GRUPO'
      FieldName = 'CD_GRUPO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 16
    end
    object ppBDEProcessoppField18: TppField
      FieldAlias = 'END_CONSIGNATARIO'
      FieldName = 'END_CONSIGNATARIO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 17
    end
    object ppBDEProcessoppField19: TppField
      FieldAlias = 'END_NOTIFY1'
      FieldName = 'END_NOTIFY1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 18
    end
    object ppBDEProcessoppField20: TppField
      FieldAlias = 'CIDADE_IMP'
      FieldName = 'CIDADE_IMP'
      FieldLength = 30
      DisplayWidth = 30
      Position = 19
    end
    object ppBDEProcessoppField21: TppField
      FieldAlias = 'ESTADO_IMP'
      FieldName = 'ESTADO_IMP'
      FieldLength = 30
      DisplayWidth = 30
      Position = 20
    end
    object ppBDEProcessoppField22: TppField
      FieldAlias = 'PAIS_IMP'
      FieldName = 'PAIS_IMP'
      FieldLength = 50
      DisplayWidth = 50
      Position = 21
    end
    object ppBDEProcessoppField23: TppField
      FieldAlias = 'PAIS_CONSIGNATARIO'
      FieldName = 'PAIS_CONSIGNATARIO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 22
    end
    object ppBDEProcessoppField24: TppField
      FieldAlias = 'CIDADE_CONSIGNATARIO'
      FieldName = 'CIDADE_CONSIGNATARIO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 23
    end
    object ppBDEProcessoppField25: TppField
      FieldAlias = 'ESTADO_CONSIGNATARIO'
      FieldName = 'ESTADO_CONSIGNATARIO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 24
    end
    object ppBDEProcessoppField26: TppField
      FieldAlias = 'PAIS_NOTIFY'
      FieldName = 'PAIS_NOTIFY'
      FieldLength = 50
      DisplayWidth = 50
      Position = 25
    end
    object ppBDEProcessoppField27: TppField
      FieldAlias = 'CIDADE_NOTIFY'
      FieldName = 'CIDADE_NOTIFY'
      FieldLength = 30
      DisplayWidth = 30
      Position = 26
    end
    object ppBDEProcessoppField28: TppField
      FieldAlias = 'ESTADO_NOTIFY'
      FieldName = 'ESTADO_NOTIFY'
      FieldLength = 30
      DisplayWidth = 30
      Position = 27
    end
    object ppBDEProcessoppField29: TppField
      FieldAlias = 'TX_INF_EMBALAGEM'
      FieldName = 'TX_INF_EMBALAGEM'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppBDEProcessoppField30: TppField
      FieldAlias = 'calc_notify2'
      FieldName = 'calc_notify2'
      FieldLength = 255
      DisplayWidth = 255
      Position = 29
    end
    object ppBDEProcessoppField31: TppField
      FieldAlias = 'calc_consig2'
      FieldName = 'calc_consig2'
      FieldLength = 255
      DisplayWidth = 255
      Position = 30
    end
    object ppBDEProcessoppField32: TppField
      FieldAlias = 'calc_imp2'
      FieldName = 'calc_imp2'
      FieldLength = 255
      DisplayWidth = 255
      Position = 31
    end
    object ppBDEProcessoppField33: TppField
      FieldAlias = 'TX_LOGOMARCA'
      FieldName = 'TX_LOGOMARCA'
      FieldLength = 37
      DisplayWidth = 37
      Position = 32
    end
    object ppBDEProcessoppField34: TppField
      FieldAlias = 'NM_PAIS_ORIGEM'
      FieldName = 'NM_PAIS_ORIGEM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 33
    end
    object ppBDEProcessoppField35: TppField
      FieldAlias = 'NM_PAIS_DESTINO'
      FieldName = 'NM_PAIS_DESTINO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 34
    end
    object ppBDEProcessoppField36: TppField
      FieldAlias = 'calc_origem'
      FieldName = 'calc_origem'
      FieldLength = 255
      DisplayWidth = 255
      Position = 35
    end
    object ppBDEProcessoppField37: TppField
      FieldAlias = 'calc_destino'
      FieldName = 'calc_destino'
      FieldLength = 255
      DisplayWidth = 255
      Position = 36
    end
    object ppBDEProcessoppField38: TppField
      FieldAlias = 'TX_DECL_ADICIONAL'
      FieldName = 'TX_DECL_ADICIONAL'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppBDEProcessoppField39: TppField
      FieldAlias = 'TX_MERCADORIA'
      FieldName = 'TX_MERCADORIA'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppBDEProcessoppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIA_FATURA'
      FieldName = 'DIA_FATURA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 39
    end
    object ppBDEProcessoppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'MES_FATURA'
      FieldName = 'MES_FATURA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 40
    end
    object ppBDEProcessoppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANO_FATURA'
      FieldName = 'ANO_FATURA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 41
    end
    object ppBDEProcessoppField43: TppField
      FieldAlias = 'calc_dt_fatura'
      FieldName = 'calc_dt_fatura'
      FieldLength = 255
      DisplayWidth = 255
      Position = 42
    end
    object ppBDEProcessoppField44: TppField
      FieldAlias = 'calcNrOrder'
      FieldName = 'calcNrOrder'
      FieldLength = 255
      DisplayWidth = 255
      Position = 43
    end
    object ppBDEProcessoppField45: TppField
      FieldAlias = 'calcImp'
      FieldName = 'calcImp'
      FieldLength = 255
      DisplayWidth = 255
      Position = 44
    end
    object ppBDEProcessoppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'TARA'
      FieldName = 'TARA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 45
    end
    object ppBDEProcessoppField47: TppField
      FieldAlias = 'CD_LINGUA_PEDIDO'
      FieldName = 'CD_LINGUA_PEDIDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 46
    end
    object ppBDEProcessoppField48: TppField
      FieldAlias = 'TX_IMPORTADOR'
      FieldName = 'TX_IMPORTADOR'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppBDEProcessoppField49: TppField
      FieldAlias = 'TX_EXPORTADOR'
      FieldName = 'TX_EXPORTADOR'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppBDEProcessoppField50: TppField
      FieldAlias = 'TX_CONSIGNATARIO'
      FieldName = 'TX_CONSIGNATARIO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppBDEProcessoppField51: TppField
      FieldAlias = 'TX_NOTIFY1'
      FieldName = 'TX_NOTIFY1'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppBDEProcessoppField52: TppField
      FieldAlias = 'NM_LOCAL_DESTINO'
      FieldName = 'NM_LOCAL_DESTINO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 51
    end
    object ppBDEProcessoppField53: TppField
      FieldAlias = 'NM_LOCAL_ORIGEM'
      FieldName = 'NM_LOCAL_ORIGEM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 52
    end
    object ppBDEProcessoppField54: TppField
      FieldAlias = 'NM_NOTIFY2'
      FieldName = 'NM_NOTIFY2'
      FieldLength = 60
      DisplayWidth = 60
      Position = 53
    end
    object ppBDEProcessoppField55: TppField
      FieldAlias = 'END_NOTIFY2'
      FieldName = 'END_NOTIFY2'
      FieldLength = 109
      DisplayWidth = 109
      Position = 54
    end
    object ppBDEProcessoppField56: TppField
      FieldAlias = 'PAIS_NOTIFY2'
      FieldName = 'PAIS_NOTIFY2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 55
    end
    object ppBDEProcessoppField57: TppField
      FieldAlias = 'CIDADE_NOTIFY2'
      FieldName = 'CIDADE_NOTIFY2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 56
    end
    object ppBDEProcessoppField58: TppField
      FieldAlias = 'ESTADO_NOTIFY2'
      FieldName = 'ESTADO_NOTIFY2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 57
    end
    object ppBDEProcessoppField59: TppField
      FieldAlias = 'calc_notify2_2'
      FieldName = 'calc_notify2_2'
      FieldLength = 255
      DisplayWidth = 255
      Position = 58
    end
    object ppBDEProcessoppField60: TppField
      FieldAlias = 'TX_NOTIFY2'
      FieldName = 'TX_NOTIFY2'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 59
      Searchable = False
      Sortable = False
    end
    object ppBDEProcessoppField61: TppField
      FieldAlias = 'CD_NOTIFY2'
      FieldName = 'CD_NOTIFY2'
      FieldLength = 5
      DisplayWidth = 5
      Position = 60
    end
    object ppBDEProcessoppField62: TppField
      FieldAlias = 'NR_TELEFONE'
      FieldName = 'NR_TELEFONE'
      FieldLength = 22
      DisplayWidth = 22
      Position = 61
    end
    object ppBDEProcessoppField63: TppField
      FieldAlias = 'NR_FAX'
      FieldName = 'NR_FAX'
      FieldLength = 20
      DisplayWidth = 20
      Position = 62
    end
    object ppBDEProcessoppField64: TppField
      FieldAlias = 'NR_RUC'
      FieldName = 'NR_RUC'
      FieldLength = 30
      DisplayWidth = 30
      Position = 63
    end
    object ppBDEProcessoppField65: TppField
      FieldAlias = 'NR_NIT'
      FieldName = 'NR_NIT'
      FieldLength = 30
      DisplayWidth = 30
      Position = 64
    end
    object ppBDEProcessoppField66: TppField
      FieldAlias = 'TELEFONE_CONSIGNATARIO'
      FieldName = 'TELEFONE_CONSIGNATARIO'
      FieldLength = 22
      DisplayWidth = 22
      Position = 65
    end
    object ppBDEProcessoppField67: TppField
      FieldAlias = 'FAX_CONSIGNATARIO'
      FieldName = 'FAX_CONSIGNATARIO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 66
    end
    object ppBDEProcessoppField68: TppField
      FieldAlias = 'RUC_CONSIGNATARIO'
      FieldName = 'RUC_CONSIGNATARIO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 67
    end
    object ppBDEProcessoppField69: TppField
      FieldAlias = 'NIT_CONSIGNATARIO'
      FieldName = 'NIT_CONSIGNATARIO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 68
    end
    object ppBDEProcessoppField70: TppField
      FieldAlias = 'TELEFONE_NOTIFY1'
      FieldName = 'TELEFONE_NOTIFY1'
      FieldLength = 22
      DisplayWidth = 22
      Position = 69
    end
    object ppBDEProcessoppField71: TppField
      FieldAlias = 'FAX_NOTIFY1'
      FieldName = 'FAX_NOTIFY1'
      FieldLength = 20
      DisplayWidth = 20
      Position = 70
    end
    object ppBDEProcessoppField72: TppField
      FieldAlias = 'RUC_NOTIFY1'
      FieldName = 'RUC_NOTIFY1'
      FieldLength = 30
      DisplayWidth = 30
      Position = 71
    end
    object ppBDEProcessoppField73: TppField
      FieldAlias = 'NIT_NOTIFY1'
      FieldName = 'NIT_NOTIFY1'
      FieldLength = 30
      DisplayWidth = 30
      Position = 72
    end
    object ppBDEProcessoppField74: TppField
      FieldAlias = 'TELEFONE_NOTIFY2'
      FieldName = 'TELEFONE_NOTIFY2'
      FieldLength = 22
      DisplayWidth = 22
      Position = 73
    end
    object ppBDEProcessoppField75: TppField
      FieldAlias = 'FAX_NOTIFY2'
      FieldName = 'FAX_NOTIFY2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 74
    end
    object ppBDEProcessoppField76: TppField
      FieldAlias = 'RUC_NOTIFY2'
      FieldName = 'RUC_NOTIFY2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 75
    end
    object ppBDEProcessoppField77: TppField
      FieldAlias = 'NIT_NOTIFY2'
      FieldName = 'NIT_NOTIFY2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 76
    end
    object ppBDEProcessoppField78: TppField
      FieldAlias = 'NM_LOCAL_EMB_AJI'
      FieldName = 'NM_LOCAL_EMB_AJI'
      FieldLength = 55
      DisplayWidth = 55
      Position = 77
    end
    object ppBDEProcessoppField79: TppField
      FieldAlias = 'NM_CONTATO'
      FieldName = 'NM_CONTATO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 78
    end
    object ppBDEProcessoppField80: TppField
      FieldAlias = 'CONTATO_CARGO'
      FieldName = 'CONTATO_CARGO'
      FieldLength = 78
      DisplayWidth = 78
      Position = 79
    end
    object ppBDEProcessoppField81: TppField
      FieldAlias = 'CGC_CLIENTE'
      FieldName = 'CGC_CLIENTE'
      FieldLength = 23
      DisplayWidth = 23
      Position = 80
    end
    object ppBDEProcessoppField82: TppField
      FieldAlias = 'NR_CUIT'
      FieldName = 'NR_CUIT'
      FieldLength = 31
      DisplayWidth = 31
      Position = 81
    end
    object ppBDEProcessoppField83: TppField
      FieldAlias = 'CUIT_CONSIGNATARIO'
      FieldName = 'CUIT_CONSIGNATARIO'
      FieldLength = 31
      DisplayWidth = 31
      Position = 82
    end
    object ppBDEProcessoppField84: TppField
      FieldAlias = 'CUIT_NOTIFY1'
      FieldName = 'CUIT_NOTIFY1'
      FieldLength = 31
      DisplayWidth = 31
      Position = 83
    end
    object ppBDEProcessoppField85: TppField
      FieldAlias = 'CUIT_NOTIFY2'
      FieldName = 'CUIT_NOTIFY2'
      FieldLength = 31
      DisplayWidth = 31
      Position = 84
    end
    object ppBDEProcessoppField86: TppField
      FieldAlias = 'CD_IMPORTADOR'
      FieldName = 'CD_IMPORTADOR'
      FieldLength = 5
      DisplayWidth = 5
      Position = 85
    end
    object ppBDEProcessoppField87: TppField
      FieldAlias = 'CONTATO_NOTIFY'
      FieldName = 'CONTATO_NOTIFY'
      FieldLength = 50
      DisplayWidth = 50
      Position = 86
    end
    object ppBDEProcessoTX_LOGOMARCA_EMPRESA_NAC: TppField
      FieldAlias = 'TX_LOGOMARCA_EMPRESA_NAC'
      FieldName = 'TX_LOGOMARCA_EMPRESA_NAC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 87
    end
  end
  object BDEPackingList: TppBDEPipeline
    DataSource = dsPackingList
    UserName = 'BDEPackingList'
    Left = 117
    Top = 47
    object BDEPackingListppField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object BDEPackingListppField2: TppField
      FieldAlias = 'CD_MERCADORIA'
      FieldName = 'CD_MERCADORIA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 1
    end
    object BDEPackingListppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_QTDE'
      FieldName = 'VL_QTDE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object BDEPackingListppField4: TppField
      FieldAlias = 'TX_CAMINHO'
      FieldName = 'TX_CAMINHO'
      FieldLength = 255
      DisplayWidth = 255
      Position = 3
    end
    object BDEPackingListppField5: TppField
      FieldAlias = 'calcNivel'
      FieldName = 'calcNivel'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object BDEPackingListppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_LIQ_UNIT'
      FieldName = 'VL_PESO_LIQ_UNIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object BDEPackingListppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'calcPesoLiquido'
      FieldName = 'calcPesoLiquido'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object BDEPackingListppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_LIQ_ITEM'
      FieldName = 'VL_PESO_LIQ_ITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object BDEPackingListppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_BRUTO_ITEM'
      FieldName = 'VL_PESO_BRUTO_ITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object BDEPackingListppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_CUBAGEM_ITEM'
      FieldName = 'VL_CUBAGEM_ITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object BDEPackingListppField11: TppField
      FieldAlias = 'CD_FABRICANTE'
      FieldName = 'CD_FABRICANTE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 10
    end
    object BDEPackingListppField12: TppField
      FieldAlias = 'calcMarcas'
      FieldName = 'calcMarcas'
      FieldLength = 255
      DisplayWidth = 255
      Position = 11
    end
    object BDEPackingListppField13: TppField
      FieldAlias = 'calcPacote'
      FieldName = 'calcPacote'
      FieldLength = 255
      DisplayWidth = 255
      Position = 12
    end
    object BDEPackingListppField14: TppField
      FieldAlias = 'MERC_EXP'
      FieldName = 'MERC_EXP'
      FieldLength = 40
      DisplayWidth = 40
      Position = 13
    end
    object BDEPackingListppField15: TppField
      FieldAlias = 'calcMercadoria'
      FieldName = 'calcMercadoria'
      FieldLength = 500
      DisplayWidth = 500
      Position = 14
    end
    object BDEPackingListppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_BRUTO_UNIT'
      FieldName = 'VL_PESO_BRUTO_UNIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object BDEPackingListppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_M3_UNIT'
      FieldName = 'VL_M3_UNIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object BDEPackingListppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'TARA'
      FieldName = 'TARA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object BDEPackingListppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_LIQUIDO'
      FieldName = 'VL_PESO_LIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object BDEPackingListppField20: TppField
      FieldAlias = 'UNID'
      FieldName = 'UNID'
      FieldLength = 50
      DisplayWidth = 50
      Position = 19
    end
    object BDEPackingListppField21: TppField
      FieldAlias = 'calcPackage'
      FieldName = 'calcPackage'
      FieldLength = 255
      DisplayWidth = 255
      Position = 20
    end
    object BDEPackingListppField22: TppField
      FieldAlias = 'MATERIALOLD'
      FieldName = 'MATERIALOLD'
      FieldLength = 40
      DisplayWidth = 40
      Position = 21
    end
    object BDEPackingListppField23: TppField
      FieldAlias = 'TX_CAMINHO2'
      FieldName = 'TX_CAMINHO2'
      FieldLength = 255
      DisplayWidth = 255
      Position = 22
    end
    object BDEPackingListppField24: TppField
      FieldAlias = 'TX_INF_EMBALAGEM'
      FieldName = 'TX_INF_EMBALAGEM'
      FieldLength = 250
      DisplayWidth = 250
      Position = 23
    end
    object BDEPackingListppField25: TppField
      FieldAlias = 'NR_ORDER'
      FieldName = 'NR_ORDER'
      FieldLength = 30
      DisplayWidth = 30
      Position = 24
    end
    object BDEPackingListppField26: TppField
      FieldAlias = 'SIGLA_UNID'
      FieldName = 'SIGLA_UNID'
      FieldLength = 3
      DisplayWidth = 3
      Position = 25
    end
    object BDEPackingListppField27: TppField
      FieldAlias = 'NR_PEDIDO'
      FieldName = 'NR_PEDIDO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 26
    end
    object BDEPackingListppField28: TppField
      FieldAlias = 'REMESSA'
      FieldName = 'REMESSA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 27
    end
    object BDEPackingListppField29: TppField
      FieldAlias = 'TX_BILLING_DOC'
      FieldName = 'TX_BILLING_DOC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 28
    end
    object BDEPackingListppField30: TppField
      FieldAlias = 'TX_DELIVERY_NOTE'
      FieldName = 'TX_DELIVERY_NOTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 29
    end
    object BDEPackingListppField31: TppField
      FieldAlias = 'calcREF'
      FieldName = 'calcREF'
      FieldLength = 255
      DisplayWidth = 255
      Position = 30
    end
    object BDEPackingListppField32: TppField
      FieldAlias = 'Qtd'
      FieldName = 'Qtd'
      FieldLength = 10
      DisplayWidth = 10
      Position = 31
    end
  end
  object cdsPackingList: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 175
    Top = 20
    object cdsPackingListNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object cdsPackingListCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object cdsPackingListVL_QTDE: TFloatField
      FieldName = 'VL_QTDE'
      DisplayFormat = '#0,.00'
    end
    object cdsPackingListTX_CAMINHO: TStringField
      FieldName = 'TX_CAMINHO'
      FixedChar = True
      Size = 255
    end
    object cdsPackingListcalcNivel: TStringField
      FieldName = 'calcNivel'
      Size = 50
    end
    object cdsPackingListVL_PESO_LIQ_UNIT: TFloatField
      FieldName = 'VL_PESO_LIQ_UNIT'
    end
    object cdsPackingListcalcPesoLiquido: TFloatField
      FieldName = 'calcPesoLiquido'
      DisplayFormat = '#0,.000'
    end
    object cdsPackingListVL_PESO_LIQ_ITEM: TFloatField
      FieldName = 'VL_PESO_LIQ_ITEM'
    end
    object cdsPackingListVL_PESO_BRUTO_ITEM: TFloatField
      FieldName = 'VL_PESO_BRUTO_ITEM'
    end
    object cdsPackingListVL_CUBAGEM_ITEM: TFloatField
      FieldName = 'VL_CUBAGEM_ITEM'
    end
    object cdsPackingListCD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object cdsPackingListcalcMarcas: TStringField
      FieldName = 'calcMarcas'
      Size = 255
    end
    object cdsPackingListcalcPacote: TStringField
      FieldName = 'calcPacote'
      Size = 255
    end
    object cdsPackingListMERC_EXP: TStringField
      FieldName = 'MERC_EXP'
      FixedChar = True
      Size = 40
    end
    object cdsPackingListcalcMercadoria: TStringField
      DisplayWidth = 500
      FieldName = 'calcMercadoria'
      Size = 500
    end
    object cdsPackingListVL_PESO_BRUTO_UNIT: TFloatField
      FieldName = 'VL_PESO_BRUTO_UNIT'
    end
    object cdsPackingListVL_M3_UNIT: TFloatField
      FieldName = 'VL_M3_UNIT'
    end
    object cdsPackingListTARA: TIntegerField
      FieldName = 'TARA'
    end
    object cdsPackingListVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
    end
    object cdsPackingListUNID: TStringField
      FieldName = 'UNID'
      FixedChar = True
      Size = 50
    end
    object cdsPackingListcalcPackage: TStringField
      FieldName = 'calcPackage'
      Size = 255
    end
    object cdsPackingListMATERIALOLD: TStringField
      FieldName = 'MATERIALOLD'
      Size = 40
    end
    object cdsPackingListTX_CAMINHO2: TStringField
      FieldName = 'TX_CAMINHO2'
      FixedChar = True
      Size = 255
    end
    object cdsPackingListTX_INF_EMBALAGEM: TStringField
      FieldName = 'TX_INF_EMBALAGEM'
      FixedChar = True
      Size = 250
    end
    object cdsPackingListNR_ORDER: TStringField
      FieldName = 'NR_ORDER'
      FixedChar = True
      Size = 30
    end
    object cdsPackingListSIGLA_UNID: TStringField
      FieldName = 'SIGLA_UNID'
      FixedChar = True
      Size = 3
    end
    object cdsPackingListNR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      FixedChar = True
      Size = 18
    end
    object cdsPackingListREMESSA: TStringField
      FieldName = 'REMESSA'
      FixedChar = True
      Size = 18
    end
    object cdsPackingListTX_BILLING_DOC: TStringField
      FieldName = 'TX_BILLING_DOC'
      FixedChar = True
      Size = 10
    end
    object cdsPackingListTX_DELIVERY_NOTE: TStringField
      FieldName = 'TX_DELIVERY_NOTE'
      FixedChar = True
      Size = 10
    end
    object cdsPackingListcalcREF: TStringField
      FieldName = 'calcREF'
      Size = 255
    end
    object cdsPackingListQtd: TStringField
      FieldName = 'Qtd'
      Size = 5
    end
  end
end
