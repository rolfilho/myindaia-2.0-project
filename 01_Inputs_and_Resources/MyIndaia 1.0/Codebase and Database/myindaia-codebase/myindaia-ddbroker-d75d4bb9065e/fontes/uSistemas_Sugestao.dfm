object frm_dicas_sugestao: Tfrm_dicas_sugestao
  Left = 489
  Top = 197
  BorderStyle = bsNone
  Caption = 'Sugest'#227'o de Dicas'
  ClientHeight = 256
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape2: TShape
    Left = 249
    Top = 222
    Width = 79
    Height = 29
    Pen.Color = clGray
  end
  object SpeedButton1: TSpeedButton
    Left = 252
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Confirmar Dica'
    Flat = True
    OnClick = btn_confirmarClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 256
    Align = alClient
    Caption = 'Panel1'
    Color = clBtnHighlight
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 105
      Height = 13
      Caption = 'Voc'#234' sabia que ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 33
      Height = 13
      Caption = 'Titulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 72
      Width = 27
      Height = 13
      Caption = 'Dica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape4: TShape
      Left = 1
      Top = 1
      Width = 339
      Height = 254
      Align = alClient
      Pen.Color = clGray
    end
    object Shape3: TShape
      Left = 171
      Top = 222
      Width = 79
      Height = 29
      Pen.Color = clGray
    end
    object btn_sugestao: TSpeedButton
      Left = 174
      Top = 224
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Flat = True
      OnClick = btn_sugestaoClick
    end
    object Shape1: TShape
      Left = 249
      Top = 222
      Width = 79
      Height = 29
      Pen.Color = clGray
    end
    object btn_confirmar: TSpeedButton
      Left = 252
      Top = 224
      Width = 75
      Height = 25
      Caption = 'Confirmar Dica'
      Flat = True
      OnClick = btn_confirmarClick
    end
    object Label4: TLabel
      Left = 16
      Top = 32
      Width = 33
      Height = 13
      Caption = 'Titulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 72
      Width = 27
      Height = 13
      Caption = 'Dica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 18
      Top = 9
      Width = 109
      Height = 13
      Caption = 'Voc'#234' sabia que ....'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object edt_titulo: TEdit
    Left = 16
    Top = 48
    Width = 313
    Height = 21
    TabOrder = 0
  end
  object mem_dica: TMemo
    Left = 16
    Top = 88
    Width = 313
    Height = 129
    Lines.Strings = (
      'mem_dica')
    TabOrder = 1
  end
  object qry_ult_preOcor_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT ISNULL(MAX(SUBSTRING(CD_OCORRENCIA, 1, 8)), '#39'00000000'#39') A' +
        'S nr_ocor'
      'FROM SUPORTE.dbo.TPRE_OCORRENCIA'
      
        'WHERE SUBSTRING(CD_OCORRENCIA, 9, 10) = RIGHT(CONVERT(VARCHAR, D' +
        'ATEPART(YEAR, GETDATE())), 2)')
    Left = 164
    Top = 96
    object qry_ult_preOcor_nr_ocor: TStringField
      FieldName = 'nr_ocor'
      FixedChar = True
      Size = 8
    end
  end
  object qry_preOcorrencia: TQuery
    AfterPost = qry_preOcorrenciaAfterPost
    AfterDelete = qry_preOcorrenciaAfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM SUPORTE.dbo.TPRE_OCORRENCIA'
      'WHERE CD_OCORRENCIA = :CD_PRE_OCORRENCIA')
    Left = 248
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRE_OCORRENCIA'
        ParamType = ptInput
      end>
    object qry_preOcorrenciaCD_OCORRENCIA: TStringField
      FieldName = 'CD_OCORRENCIA'
      FixedChar = True
      Size = 12
    end
    object qry_preOcorrenciaCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_preOcorrenciaDT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
    end
    object qry_preOcorrenciaDT_FINALIZACAO: TDateTimeField
      FieldName = 'DT_FINALIZACAO'
    end
    object qry_preOcorrenciaCD_CAMINHO_1: TStringField
      FieldName = 'CD_CAMINHO_1'
      FixedChar = True
      Size = 2
    end
    object qry_preOcorrenciaCD_CAMINHO_2: TStringField
      FieldName = 'CD_CAMINHO_2'
      FixedChar = True
      Size = 3
    end
    object qry_preOcorrenciaCD_CAMINHO_3: TStringField
      FieldName = 'CD_CAMINHO_3'
      FixedChar = True
      Size = 4
    end
    object qry_preOcorrenciaNM_MOTIVO: TMemoField
      FieldName = 'NM_MOTIVO'
      BlobType = ftMemo
    end
    object qry_preOcorrenciaCD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      FixedChar = True
      Size = 4
    end
    object qry_preOcorrenciaCD_OCORRENCIA_SUPORTE: TStringField
      FieldName = 'CD_OCORRENCIA_SUPORTE'
      FixedChar = True
      Size = 7
    end
    object qry_preOcorrenciaIN_URGENTE: TStringField
      FieldName = 'IN_URGENTE'
      FixedChar = True
      Size = 1
    end
  end
  object qry_ult_ocor_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT   TOP 1 SUBSTRING(CD_OCORRENCIA, 1, 5) AS nr_ocor, SUBSTR' +
        'ING(CD_OCORRENCIA, 6, 2) AS ano_ocor'
      'FROM SUPORTE.dbo.TOCORRENCIA'
      
        'ORDER BY SUBSTRING(CD_OCORRENCIA, 6, 2) DESC, SUBSTRING(CD_OCORR' +
        'ENCIA, 1, 5) DESC'
      '')
    Left = 168
    Top = 152
    object qry_ult_ocor_nr_ocor: TStringField
      FieldName = 'nr_ocor'
      FixedChar = True
      Size = 5
    end
    object qry_ult_ocor_ano_ocor: TStringField
      FieldName = 'ano_ocor'
      FixedChar = True
      Size = 2
    end
  end
  object qry_pendente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM SUPORTE.dbo.TOCORRENCIA'
      'WHERE  (DT_FINALIZACAO IS NULL)'
      '  AND CD_USUARIO =:usuario'
      'ORDER BY CD_OCORRENCIA')
    Left = 250
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Precision = 4
        Name = 'usuario'
        ParamType = ptInput
        Size = 4
      end>
    object qry_pendente_CD_OCORRENCIA: TStringField
      FieldName = 'CD_OCORRENCIA'
      FixedChar = True
      Size = 7
    end
    object qry_pendente_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_pendente_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
    end
    object qry_pendente_DT_FINALIZACAO: TDateTimeField
      FieldName = 'DT_FINALIZACAO'
    end
    object qry_pendente_CD_CAMINHO_1: TStringField
      FieldName = 'CD_CAMINHO_1'
      FixedChar = True
      Size = 2
    end
    object qry_pendente_CD_CAMINHO_2: TStringField
      FieldName = 'CD_CAMINHO_2'
      FixedChar = True
      Size = 3
    end
    object qry_pendente_CD_CAMINHO_3: TStringField
      FieldName = 'CD_CAMINHO_3'
      FixedChar = True
      Size = 4
    end
    object qry_pendente_CD_CAMINHO_4: TStringField
      FieldName = 'CD_CAMINHO_4'
      FixedChar = True
      Size = 5
    end
    object qry_pendente_CD_CAMINHO_5: TStringField
      FieldName = 'CD_CAMINHO_5'
      FixedChar = True
      Size = 5
    end
    object qry_pendente_NM_MOTIVO: TMemoField
      FieldName = 'NM_MOTIVO'
      BlobType = ftMemo
    end
    object qry_pendente_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      FixedChar = True
      Size = 4
    end
    object qry_pendente_CD_DELEGADO: TStringField
      FieldName = 'CD_DELEGADO'
      FixedChar = True
      Size = 4
    end
    object qry_pendente_NM_PRIORIDADE: TStringField
      FieldName = 'NM_PRIORIDADE'
      FixedChar = True
      Size = 50
    end
    object qry_pendente_NM_COMENT: TMemoField
      FieldName = 'NM_COMENT'
      BlobType = ftMemo
    end
    object qry_pendente_NM_PRIORIDADE_S: TStringField
      FieldName = 'NM_PRIORIDADE_S'
      FixedChar = True
      Size = 50
    end
    object qry_pendente_DT_DURACAO: TStringField
      FieldName = 'DT_DURACAO'
      FixedChar = True
      Size = 50
    end
    object qry_pendente_DT_ULT_MODIF: TDateTimeField
      FieldName = 'DT_ULT_MODIF'
    end
    object qry_pendente_CD_OCOR_ORIGEM: TStringField
      FieldName = 'CD_OCOR_ORIGEM'
      FixedChar = True
      Size = 7
    end
    object qry_pendente_TX_TITULO: TStringField
      FieldName = 'TX_TITULO'
      FixedChar = True
      Size = 80
    end
    object qry_pendente_IN_PROCESSO_PARADO: TIntegerField
      FieldName = 'IN_PROCESSO_PARADO'
    end
    object qry_pendente_TX_JUSTIFICA_RETRAB: TStringField
      FieldName = 'TX_JUSTIFICA_RETRAB'
      FixedChar = True
      Size = 255
    end
    object qry_pendente_TX_JUSTIFICA_ATRASO: TStringField
      FieldName = 'TX_JUSTIFICA_ATRASO'
      FixedChar = True
      Size = 255
    end
    object qry_pendente_QT_MINUTOS_GASTOS: TIntegerField
      FieldName = 'QT_MINUTOS_GASTOS'
    end
  end
end
