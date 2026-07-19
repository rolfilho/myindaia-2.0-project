object frmIntegracaoExcel: TfrmIntegracaoExcel
  Left = 0
  Top = 0
  Caption = 'Integra'#231#227'o Excel'
  ClientHeight = 525
  ClientWidth = 986
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 986
    Height = 49
    Align = alTop
    TabOrder = 0
    object lblProgresso: TLabel
      Left = 337
      Top = 7
      Width = 48
      Height = 13
      Caption = 'Progresso'
    end
    object lblLinhas: TLabel
      Left = 816
      Top = 24
      Width = 37
      Height = 13
      Caption = 'Linhas: '
    end
    object btnSelecionarArquivo: TBitBtn
      Left = 16
      Top = 13
      Width = 185
      Height = 25
      Caption = 'Selecionar Arquivo'
      TabOrder = 0
      OnClick = btnSelecionarArquivoClick
    end
    object ProgressBar1: TProgressBar
      Left = 336
      Top = 21
      Width = 449
      Height = 17
      TabOrder = 1
    end
    object btnDeleteNaoEnviados: TBitBtn
      Left = 207
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Apagar todos'
      TabOrder = 2
      OnClick = btnDeleteNaoEnviadosClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 986
    Height = 476
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 984
      Height = 474
      Align = alClient
      DataSource = dsDrawbackIsencaoItensView
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
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_ITEM'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_ATO_CONCESSORIO'
          Width = 120
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
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJ'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENQUADRAMENTO_1'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENQUADRAMENTO_2'
          Width = 100
          Visible = True
        end>
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 440
    Top = 96
  end
  object qryDrawbackIsencaoItens: TFDQuery
    Connection = dmMain.FDConnection1
    Left = 536
    Top = 73
  end
  object qryDrawbackIsencaoFila: TFDQuery
    Connection = dmMain.FDConnection1
    Left = 536
    Top = 177
  end
  object qryDrawbackIsencaoItensView: TFDQuery
    Connection = dmMain.FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 200000
    SQL.Strings = (
      'SELECT ITENS.* FROM DRAWBACK_ISENCAO_ITENS ITENS'
      
        'INNER JOIN DRAWBACK_ISENCAO_FILA FILA ON FILA.NR_DUE = ITENS.NR_' +
        'DUE AND FILA.DATA_INCLUSAO = ITENS.DATA_INCLUSAO'
      
        'WHERE (FILA.NR_DUE IS NULL) OR ISNULL(FILA.IN_XML_ENVIADO, 0) = ' +
        '0 '
      '')
    Left = 163
    Top = 127
    object qryDrawbackIsencaoItensViewNR_DUE: TStringField
      DisplayLabel = 'Nr. Due'
      FieldName = 'NR_DUE'
      Origin = 'NR_DUE'
      Size = 14
    end
    object qryDrawbackIsencaoItensViewNR_ITEM: TStringField
      DisplayLabel = 'Nr. Item'
      FieldName = 'NR_ITEM'
      Origin = 'NR_ITEM'
      Size = 3
    end
    object qryDrawbackIsencaoItensViewNR_ATO_CONCESSORIO: TStringField
      DisplayLabel = 'Nr. Ato Concess'#243'rio'
      FieldName = 'NR_ATO_CONCESSORIO'
      Origin = 'NR_ATO_CONCESSORIO'
      Size = 15
    end
    object qryDrawbackIsencaoItensViewQTD_ESTATISTICA: TStringField
      DisplayLabel = 'Qtde. Estat'#237'stica'
      FieldName = 'QTD_ESTATISTICA'
      Origin = 'QTD_ESTATISTICA'
    end
    object qryDrawbackIsencaoItensViewTOTAL_MLE: TStringField
      DisplayLabel = 'Total MLE'
      FieldName = 'TOTAL_MLE'
      Origin = 'TOTAL_MLE'
    end
    object qryDrawbackIsencaoItensViewNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 8
    end
    object qryDrawbackIsencaoItensViewCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 14
    end
    object qryDrawbackIsencaoItensViewENQUADRAMENTO_1: TStringField
      DisplayLabel = 'Enquadramento 1'
      FieldName = 'ENQUADRAMENTO_1'
      Origin = 'ENQUADRAMENTO_1'
      Size = 5
    end
    object qryDrawbackIsencaoItensViewENQUADRAMENTO_2: TStringField
      DisplayLabel = 'Enquadramento 2'
      FieldName = 'ENQUADRAMENTO_2'
      Origin = 'ENQUADRAMENTO_2'
      Size = 5
    end
    object qryDrawbackIsencaoItensViewDATA_INCLUSAO: TStringField
      FieldName = 'DATA_INCLUSAO'
      Origin = 'DATA_INCLUSAO'
      Size = 17
    end
  end
  object dsDrawbackIsencaoItensView: TDataSource
    DataSet = qryDrawbackIsencaoItensView
    Left = 72
    Top = 145
  end
end
