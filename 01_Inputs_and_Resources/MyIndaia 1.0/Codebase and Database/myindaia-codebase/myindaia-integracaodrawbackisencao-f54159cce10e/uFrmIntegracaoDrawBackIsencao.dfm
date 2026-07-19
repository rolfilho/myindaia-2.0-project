object FrmIntegracaoDrawBackIsencao: TFrmIntegracaoDrawBackIsencao
  Left = 0
  Top = 0
  Caption = 'Integra'#231#227'o Drawback Isen'#231#227'o'
  ClientHeight = 586
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 586
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 510
    object Label2: TLabel
      Left = 32
      Top = 99
      Width = 60
      Height = 13
      Caption = 'Fila de envio'
    end
    object Label3: TLabel
      Left = 502
      Top = 99
      Width = 60
      Height = 13
      Caption = 'Transmitidos'
    end
    object Label4: TLabel
      Left = 502
      Top = 314
      Width = 44
      Height = 13
      Caption = 'Com Erro'
    end
    object lblStatus1: TLabel
      Left = 502
      Top = 44
      Width = 41
      Height = 16
      Caption = 'Status:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 32
      Top = 46
      Width = 79
      Height = 13
      Caption = 'Data de inclus'#227'o'
    end
    object Label5: TLabel
      Left = 32
      Top = 314
      Width = 25
      Height = 13
      Caption = 'Itens'
    end
    object lblLinhasFila: TLabel
      Left = 128
      Top = 99
      Width = 45
      Height = 13
      Caption = '(Linhas: )'
    end
    object lblLinhasTransmitidos: TLabel
      Left = 603
      Top = 98
      Width = 45
      Height = 13
      Caption = '(Linhas: )'
    end
    object lblLinhasItens: TLabel
      Left = 128
      Top = 314
      Width = 45
      Height = 13
      Caption = '(Linhas: )'
    end
    object lblLinhasErro: TLabel
      Left = 603
      Top = 314
      Width = 45
      Height = 13
      Caption = '(Linhas: )'
    end
    object DBGrid2: TDBGrid
      Left = 30
      Top = 117
      Width = 331
      Height = 180
      DataSource = dsDrawbackIsencaoFila
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NR_DUE'
          Title.Caption = 'Nr. Due'
          Width = 150
          Visible = True
        end>
    end
    object btnTransmitirFila: TBitBtn
      Left = 379
      Top = 117
      Width = 103
      Height = 25
      Caption = 'Iniciar Integra'#231#227'o'
      TabOrder = 1
      OnClick = btnTransmitirFilaClick
    end
    object DBGrid1: TDBGrid
      Left = 502
      Top = 117
      Width = 427
      Height = 180
      DataSource = dsEnviado
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NR_DUE'
          Title.Caption = 'Nr. Due'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STR_RESPOSTA'
          Title.Caption = 'Resposta'
          Width = 300
          Visible = True
        end>
    end
    object DBGrid3: TDBGrid
      Left = 502
      Top = 333
      Width = 427
      Height = 180
      DataSource = dsErro
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NR_DUE'
          Title.Caption = 'Nr. Due'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STR_RESPOSTA'
          Title.Caption = 'Resposta'
          Width = 300
          Visible = True
        end>
    end
    object cmbDataInclusao: TComboBox
      Left = 30
      Top = 61
      Width = 243
      Height = 21
      TabOrder = 4
      OnChange = cmbDataInclusaoChange
    end
    object DBGrid4: TDBGrid
      Left = 30
      Top = 333
      Width = 331
      Height = 180
      DataSource = dsDrawbackIsencaoItens
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NR_DUE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_ITEM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_ATO_CONCESSORIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_ESTATISTICA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_MLE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NCM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENQUADRAMENTO_1'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENQUADRAMENTO_2'
          Visible = True
        end>
    end
    object chkCertificado: TRadioGroup
      Left = 30
      Top = 4
      Width = 146
      Height = 38
      Caption = ' Certificado '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Fabricio'
        'Edgar')
      TabOrder = 6
    end
  end
  object dsDrawbackIsencaoFila: TDataSource
    DataSet = qryDrawbackIsencaoFila
    Left = 223
    Top = 172
  end
  object qryDrawbackIsencaoFila: TFDQuery
    Connection = dmMain.FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 2000
    SQL.Strings = (
      'SELECT * FROM DRAWBACK_ISENCAO_FILA '
      'WHERE ISNULL(IN_FILA, 0) = 1'
      'AND ISNULL(IN_XML_ENVIADO, 0) = 0'
      'AND DATA_INCLUSAO = :DATA_INCLUSAO'
      'ORDER BY NR_DUE')
    Left = 223
    Top = 120
    ParamData = <
      item
        Name = 'DATA_INCLUSAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryDrawbackIsencaoFilaNR_DUE: TStringField
      FieldName = 'NR_DUE'
      Origin = 'NR_DUE'
      Size = 14
    end
  end
  object dsEnviado: TDataSource
    DataSet = qryEnviado
    Left = 791
    Top = 173
  end
  object qryEnviado: TFDQuery
    Connection = dmMain.FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 2000
    SQL.Strings = (
      
        'SELECT *, CAST(RESPOSTA AS VARCHAR(1000)) AS STR_RESPOSTA FROM D' +
        'RAWBACK_ISENCAO_FILA'
      'WHERE ISNULL(IN_XML_ENVIADO, 0) = 1'
      'AND DATA_INCLUSAO = :DATA_INCLUSAO'
      'ORDER BY NR_DUE')
    Left = 791
    Top = 121
    ParamData = <
      item
        Name = 'DATA_INCLUSAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryEnviadoNR_DUE: TStringField
      FieldName = 'NR_DUE'
      Origin = 'NR_DUE'
      Size = 14
    end
    object qryEnviadoIN_XML_GERADO: TBooleanField
      FieldName = 'IN_XML_GERADO'
      Origin = 'IN_XML_GERADO'
    end
    object qryEnviadoIN_XML_ENVIADO: TBooleanField
      FieldName = 'IN_XML_ENVIADO'
      Origin = 'IN_XML_ENVIADO'
    end
    object qryEnviadoIN_FILA: TBooleanField
      FieldName = 'IN_FILA'
      Origin = 'IN_FILA'
    end
    object qryEnviadoIN_ERRO: TBooleanField
      FieldName = 'IN_ERRO'
      Origin = 'IN_ERRO'
    end
    object qryEnviadoRESPOSTA: TMemoField
      FieldName = 'RESPOSTA'
      Origin = 'RESPOSTA'
      BlobType = ftMemo
      Size = 2147483647
    end
    object qryEnviadoSTR_RESPOSTA: TStringField
      FieldName = 'STR_RESPOSTA'
      Origin = 'STR_RESPOSTA'
      ReadOnly = True
      Size = 1000
    end
  end
  object dsErro: TDataSource
    DataSet = qryErro
    Left = 792
    Top = 365
  end
  object qryErro: TFDQuery
    Connection = dmMain.FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 2000
    SQL.Strings = (
      
        'SELECT *, CAST(RESPOSTA AS VARCHAR(1000)) AS STR_RESPOSTA FROM D' +
        'RAWBACK_ISENCAO_FILA'
      'WHERE ISNULL(IN_ERRO, 0) = 1'
      'AND ISNULL(IN_XML_ENVIADO, 0) = 0'
      'AND DATA_INCLUSAO = :DATA_INCLUSAO'
      'ORDER BY NR_DUE')
    Left = 792
    Top = 313
    ParamData = <
      item
        Name = 'DATA_INCLUSAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryErroNR_DUE: TStringField
      FieldName = 'NR_DUE'
      Origin = 'NR_DUE'
      Size = 14
    end
    object qryErroSTR_RESPOSTA: TStringField
      FieldName = 'STR_RESPOSTA'
      Origin = 'STR_RESPOSTA'
      ReadOnly = True
      Size = 1000
    end
  end
  object qryDataInclusao: TFDQuery
    Connection = dmMain.FDConnection1
    SQL.Strings = (
      'SELECT * FROM ('
      #9'SELECT DATA_INCLUSAO,'
      #9'CAST(SUBSTRING(DATA_INCLUSAO, 7, 4) AS INT) AS Ano,'
      #9'CAST(SUBSTRING(DATA_INCLUSAO, 4, 2) AS INT) AS Mes,'
      #9'CAST(SUBSTRING(DATA_INCLUSAO, 1, 2) AS INT) AS Dia,'
      #9'CAST(SUBSTRING(DATA_INCLUSAO, 12, 2) AS INT) AS Hora,'
      #9'CAST(SUBSTRING(DATA_INCLUSAO, 14, 2) AS INT) AS Minuto'
      #9' FROM '
      #9'('
      #9'  SELECT DISTINCT DATA_INCLUSAO'
      #9'  FROM DRAWBACK_ISENCAO_FILA '
      #9') SUB'
      ') SUBFINAL'
      'ORDER BY Ano DESC, Mes DESC, Dia DESC, Hora DESC, Minuto DESC')
    Left = 472
    object qryDataInclusaoDATA_INCLUSAO: TStringField
      FieldName = 'DATA_INCLUSAO'
      Origin = 'DATA_INCLUSAO'
      Size = 17
    end
  end
  object dsDataInclusao: TDataSource
    DataSet = qryDataInclusao
    Left = 432
    Top = 8
  end
  object dsDrawbackIsencaoItens: TDataSource
    DataSet = qryDrawbackIsencaoItens
    Left = 303
    Top = 364
  end
  object qryDrawbackIsencaoItens: TFDQuery
    Connection = dmMain.FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 2000
    SQL.Strings = (
      'SELECT ITENS.* FROM DRAWBACK_ISENCAO_ITENS ITENS'
      
        'LEFT JOIN DRAWBACK_ISENCAO_FILA FILA ON FILA.NR_DUE = ITENS.NR_D' +
        'UE  AND FILA.DATA_INCLUSAO = ITENS.DATA_INCLUSAO'
      'WHERE ISNULL(FILA.IN_FILA, 0) = 1'
      'AND ISNULL(FILA.IN_XML_ENVIADO, 0) = 0'
      'AND FILA.DATA_INCLUSAO = :DATA_INCLUSAO'
      'ORDER BY FILA.NR_DUE, CAST(ITENS.NR_ITEM AS INTEGER)'
      '')
    Left = 303
    Top = 312
    ParamData = <
      item
        Name = 'DATA_INCLUSAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryDrawbackIsencaoItensNR_DUE: TStringField
      DisplayLabel = 'Nr. Due'
      FieldName = 'NR_DUE'
      Origin = 'NR_DUE'
      Size = 14
    end
    object qryDrawbackIsencaoItensNR_ITEM: TStringField
      DisplayLabel = 'Nr. Itens'
      FieldName = 'NR_ITEM'
      Origin = 'NR_ITEM'
      Size = 3
    end
    object qryDrawbackIsencaoItensNR_ATO_CONCESSORIO: TStringField
      DisplayLabel = 'Ato Concess'#243'rio'
      FieldName = 'NR_ATO_CONCESSORIO'
      Origin = 'NR_ATO_CONCESSORIO'
      Size = 15
    end
    object qryDrawbackIsencaoItensQTD_ESTATISTICA: TStringField
      DisplayLabel = 'Qtd. Estat'#237'stica'
      FieldName = 'QTD_ESTATISTICA'
      Origin = 'QTD_ESTATISTICA'
    end
    object qryDrawbackIsencaoItensTOTAL_MLE: TStringField
      DisplayLabel = 'Total MLE'
      FieldName = 'TOTAL_MLE'
      Origin = 'TOTAL_MLE'
    end
    object qryDrawbackIsencaoItensNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 8
    end
    object qryDrawbackIsencaoItensCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 14
    end
    object qryDrawbackIsencaoItensENQUADRAMENTO_1: TStringField
      DisplayLabel = 'Enquadramento 1'
      FieldName = 'ENQUADRAMENTO_1'
      Origin = 'ENQUADRAMENTO_1'
      Size = 5
    end
    object qryDrawbackIsencaoItensENQUADRAMENTO_2: TStringField
      DisplayLabel = 'Enquadramento 2'
      FieldName = 'ENQUADRAMENTO_2'
      Origin = 'ENQUADRAMENTO_2'
      Size = 5
    end
  end
  object qryUpdateTransmissao: TFDQuery
    Connection = dmMain.FDConnection1
    SQL.Strings = (
      'UPDATE DRAWBACK_ISENCAO_FILA'
      
        'SET IN_XML_ENVIADO = :IN_XML_ENVIADO, IN_FILA = :IN_FILA, IN_ERR' +
        'O = :IN_ERRO, RESPOSTA = :RESPOSTA'
      'WHERE NR_DUE = :NR_DUE')
    Left = 855
    Top = 23
    ParamData = <
      item
        Name = 'IN_XML_ENVIADO'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IN_FILA'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IN_ERRO'
        DataType = ftBoolean
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RESPOSTA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NR_DUE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
