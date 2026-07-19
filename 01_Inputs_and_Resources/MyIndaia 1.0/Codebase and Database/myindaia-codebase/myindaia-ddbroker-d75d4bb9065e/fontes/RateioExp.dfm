object frm_rateio_exp: Tfrm_rateio_exp
  Left = 277
  Top = 273
  BorderStyle = bsNone
  Caption = 'Rateio - [M'#243'dulo de Exporta'#231#227'o]'
  ClientHeight = 218
  ClientWidth = 391
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 391
    Height = 218
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Bevel2: TBevel
      Left = 120
      Top = 167
      Width = 254
      Height = 42
      Shape = bsFrame
      Style = bsRaised
    end
    object Bevel1: TBevel
      Left = 10
      Top = 46
      Width = 365
      Height = 116
      Shape = bsFrame
    end
    object Label5: TLabel
      Left = 151
      Top = 62
      Width = 72
      Height = 13
      Caption = 'Peso L'#237'q. Itens'
    end
    object Label6: TLabel
      Left = 151
      Top = 108
      Width = 78
      Height = 13
      Caption = 'Peso Bruto Itens'
    end
    object Label7: TLabel
      Left = 267
      Top = 62
      Width = 90
      Height = 13
      Caption = 'Peso L'#237'q. a Ratear'
    end
    object Label8: TLabel
      Left = 267
      Top = 108
      Width = 96
      Height = 13
      Caption = 'Peso Bruto a Ratear'
    end
    object Label9: TLabel
      Left = 253
      Top = 79
      Width = 12
      Height = 13
      Caption = '->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 253
      Top = 125
      Width = 12
      Height = 13
      Caption = '->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 310
      Top = 175
      Width = 58
      Height = 25
      Caption = 'Sair'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
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
      OnClick = SpeedButton1Click
    end
    object BitBtn1: TBitBtn
      Left = 127
      Top = 174
      Width = 87
      Height = 27
      Caption = 'Executar Rateio'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 218
      Top = 174
      Width = 87
      Height = 27
      Caption = 'Estornar Rateio'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object Edit3: TDBEdit
      Left = 151
      Top = 76
      Width = 100
      Height = 21
      DataField = 'VL_TOT_PESO_LIQ'
      DataSource = dsItens1
      ReadOnly = True
      TabOrder = 2
    end
    object Edit4: TDBEdit
      Left = 151
      Top = 122
      Width = 100
      Height = 21
      DataField = 'VL_TOT_PESO_BRUTO'
      DataSource = dsItens2
      ReadOnly = True
      TabOrder = 3
    end
    object Panel3: TPanel
      Left = 11
      Top = 167
      Width = 102
      Height = 41
      BevelOuter = bvNone
      BorderWidth = 1
      Color = clBlack
      TabOrder = 4
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 100
        Height = 39
        Align = alClient
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 0
        object Label2: TLabel
          Left = 4
          Top = 2
          Width = 81
          Height = 13
          Caption = 'Forma de Rateio:'
        end
        object DBText2: TDBText
          Left = 5
          Top = 18
          Width = 60
          Height = 16
          AutoSize = True
          DataField = 'PADRAO_RATEIO_EXP'
          DataSource = dsCapa1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object Panel4: TPanel
      Left = 11
      Top = 10
      Width = 364
      Height = 28
      BevelOuter = bvNone
      BorderWidth = 1
      Color = clBlack
      TabOrder = 5
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 362
        Height = 26
        Align = alClient
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 0
        object Label1: TLabel
          Left = 7
          Top = 6
          Width = 102
          Height = 13
          Caption = 'N'#250'mero do Processo:'
        end
        object DBText1: TDBText
          Left = 114
          Top = 5
          Width = 190
          Height = 13
          DataField = 'NR_PROCESSO'
          DataSource = dsCapa1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object Edit5: TDBEdit
      Left = 267
      Top = 122
      Width = 100
      Height = 21
      DataField = 'BRU_A_RATEAR'
      DataSource = dsItens2
      ReadOnly = True
      TabOrder = 6
    end
    object Edit6: TDBEdit
      Left = 267
      Top = 76
      Width = 100
      Height = 21
      DataField = 'LIQ_A_RATEAR'
      DataSource = dsItens1
      ReadOnly = True
      TabOrder = 7
    end
    object Panel6: TPanel
      Left = 19
      Top = 56
      Width = 125
      Height = 97
      BevelOuter = bvNone
      BorderWidth = 1
      Caption = 'Panel6'
      Color = clGray
      TabOrder = 8
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 123
        Height = 95
        Align = alClient
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 0
        object Label3: TLabel
          Left = 11
          Top = 5
          Width = 90
          Height = 13
          Caption = 'Peso L'#237'quido Total'
        end
        object Label4: TLabel
          Left = 11
          Top = 51
          Width = 79
          Height = 13
          Caption = 'Peso Bruto Total'
        end
        object Edit2: TDBEdit
          Left = 11
          Top = 65
          Width = 100
          Height = 21
          DataField = 'VL_PESO_BRUTO'
          DataSource = dsCapa2
          TabOrder = 0
        end
        object Edit1: TDBEdit
          Left = 11
          Top = 19
          Width = 100
          Height = 21
          DataField = 'VL_PESO_LIQUIDO'
          DataSource = dsCapa1
          TabOrder = 1
        end
      end
    end
  end
  object qry_capa1: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, VL_PESO_LIQUIDO, PADRAO_RATEIO_EXP,'
      
        '       (SELECT SUM(QT_MERCADORIA) FROM TPE_ITEM WHERE ISNULL(VL_' +
        'TOT_PESO_LIQ,0) = 0 AND NR_PROCESSO = '#39'TESTE DE HOJE'#39') QT_TOTAL,' +
        ' VL_TOT_MCV'
      'FROM   TPE'
      'WHERE  NR_PROCESSO = '#39'TESTE DE HOJE'#39
      ''
      ' ')
    Left = 176
    Top = 15
    object qry_capa1NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPE.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_capa1VL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      Origin = 'DBBROKER.TPE.VL_PESO_LIQUIDO'
      DisplayFormat = '0.00000'
    end
    object qry_capa1PADRAO_RATEIO_EXP: TStringField
      FieldName = 'PADRAO_RATEIO_EXP'
      Origin = 'DBBROKER.TPE.PADRAO_RATEIO_EXP'
      FixedChar = True
      Size = 5
    end
    object qry_capa1VL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
      Origin = 'DBBROKER.TPE.VL_TOT_MCV'
    end
    object qry_capa1QT_TOTAL: TFloatField
      FieldName = 'QT_TOTAL'
    end
  end
  object qry_itens1: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM(VL_TOT_PESO_LIQ) VL_TOT_PESO_LIQ,'
      
        '       (SUM(CAPA.VL_PESO_LIQUIDO) - SUM(VL_TOT_PESO_LIQ)) LIQ_A_' +
        'RATEAR,'
      '       SUM(VL_TOT_PESO_BRUTO) VL_TOT_PESO_BRUTO,'
      
        '       (SUM(CAPA.VL_PESO_BRUTO)   - SUM(VL_TOT_PESO_BRUTO)) BRU_' +
        'A_RATEAR'
      'FROM   TPE_ITEM ITEM, TPE CAPA'
      'WHERE  ITEM.NR_PROCESSO = :NR_PROCESSO AND'
      '       CAPA.NR_PROCESSO = ITEM.NR_PROCESSO')
    Left = 224
    Top = 15
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_itens1LIQ_A_RATEAR: TFloatField
      FieldName = 'LIQ_A_RATEAR'
      Origin = 'DBBROKER.TPE.VL_PESO_LIQUIDO'
      DisplayFormat = '0.00000'
    end
    object qry_itens1VL_TOT_PESO_LIQ: TFloatField
      FieldName = 'VL_TOT_PESO_LIQ'
      Origin = 'DBBROKER.TPE_ITEM.VL_TOT_PESO_LIQ'
      DisplayFormat = '0.00000'
    end
  end
  object dsCapa1: TDataSource
    DataSet = qry_capa1
    Left = 184
    Top = 24
  end
  object dsItens1: TDataSource
    DataSet = qry_itens1
    Left = 232
    Top = 24
  end
  object qry_capa2: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, VL_PESO_LIQUIDO,'
      '       VL_PESO_BRUTO, PADRAO_RATEIO_EXP,'
      
        '       (SELECT SUM(QT_MERCADORIA) FROM TPE_ITEM WHERE ISNULL(VL_' +
        'TOT_PESO_LIQ,0) = 0 AND NR_PROCESSO = '#39'TESTE DE HOJE'#39') QT_TOTAL,' +
        ' VL_TOT_MCV'
      'FROM   TPE'
      'WHERE  NR_PROCESSO = '#39'TESTE DE HOJE'#39
      '')
    Left = 176
    Top = 63
    object StringField1: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPE.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object FloatField2: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      Origin = 'DBBROKER.TPE.VL_PESO_BRUTO'
      DisplayFormat = '0.00000'
    end
    object StringField2: TStringField
      FieldName = 'PADRAO_RATEIO_EXP'
      Origin = 'DBBROKER.TPE.PADRAO_RATEIO_EXP'
      FixedChar = True
      Size = 5
    end
    object FloatField3: TFloatField
      FieldName = 'VL_TOT_MCV'
      Origin = 'DBBROKER.TPE.VL_TOT_MCV'
    end
    object FloatField4: TFloatField
      FieldName = 'QT_TOTAL'
    end
  end
  object dsCapa2: TDataSource
    DataSet = qry_capa2
    Left = 184
    Top = 72
  end
  object qry_itens2: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM(VL_TOT_PESO_LIQ) VL_TOT_PESO_LIQ,'
      
        '       (SUM(CAPA.VL_PESO_LIQUIDO) - SUM(VL_TOT_PESO_LIQ)) LIQ_A_' +
        'RATEAR,'
      '       SUM(VL_TOT_PESO_BRUTO) VL_TOT_PESO_BRUTO,'
      
        '       (SUM(CAPA.VL_PESO_BRUTO)   - SUM(VL_TOT_PESO_BRUTO)) BRU_' +
        'A_RATEAR'
      'FROM   TPE_ITEM ITEM, TPE CAPA'
      'WHERE  ITEM.NR_PROCESSO = :NR_PROCESSO AND'
      '       CAPA.NR_PROCESSO = ITEM.NR_PROCESSO')
    Left = 224
    Top = 63
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object FloatField6: TFloatField
      FieldName = 'BRU_A_RATEAR'
      Origin = 'DBBROKER.TPE.VL_PESO_BRUTO'
      DisplayFormat = '0.00000'
    end
    object FloatField8: TFloatField
      FieldName = 'VL_TOT_PESO_BRUTO'
      Origin = 'DBBROKER.TPE_ITEM.VL_TOT_PESO_BRUTO'
      DisplayFormat = '0.00000'
    end
  end
  object dsItens2: TDataSource
    DataSet = qry_itens2
    Left = 232
    Top = 72
  end
end
