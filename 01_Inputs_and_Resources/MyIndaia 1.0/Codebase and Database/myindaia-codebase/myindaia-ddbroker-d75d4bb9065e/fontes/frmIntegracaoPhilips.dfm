object FormIntegracaoPhilips: TFormIntegracaoPhilips
  Left = 533
  Top = 216
  BorderStyle = bsDialog
  Caption = 'Integra'#231#227'o Philips'
  ClientHeight = 526
  ClientWidth = 614
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 614
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 6
      Top = 3
      Width = 365
      Height = 61
      Caption = ' Pesquisa '
      TabOrder = 0
      object lbl_nr_processo: TLabel
        Left = 9
        Top = 18
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
      object msk_nr_processo: TMaskEdit
        Left = 10
        Top = 34
        Width = 156
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = msk_nr_processoChange
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 614
    Height = 420
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 8
    Caption = 'Panel2'
    TabOrder = 1
    object Label1: TLabel
      Left = 336
      Top = 104
      Width = 72
      Height = 13
      Caption = 'DATA ENVIAR'
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 8
      Width = 598
      Height = 404
      Align = alClient
      DataSource = dsMain
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROCESSO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TP_PROCESSO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENVIAR'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Width = 100
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 485
    Width = 614
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      614
      41)
    object BtnReenviar: TBitBtn
      Left = 440
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Reenviar'
      TabOrder = 0
      OnClick = BtnReenviarClick
    end
    object btnEnviar: TBitBtn
      Left = 528
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Enviar'
      TabOrder = 1
      OnClick = btnEnviarClick
    end
  end
  object dsMain: TDataSource
    DataSet = qryMain
    Left = 136
    Top = 188
  end
  object qryMain: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT '
      'TP.NR_PROCESSO AS PROCESSO, '
      'IPH.TP_PROCESSO,'
      'IPH.CD_INSTRUCAO_DESEMBARACO AS ID,'
      '(CASE IPH.IN_ENVIADO WHEN 1 '
      #9'THEN '#39'ENVIADO'#39
      #9'ELSE '#39#39' '
      ' END) AS STATUS,'
      'IPH.DT_ENVIAR_ARQUIVO AS ENVIAR  '
      'FROM TPROCESSO TP WITH (NOLOCK) '
      
        'LEFT JOIN TFOLLOWUP EV088 WITH (NOLOCK) ON EV088.NR_PROCESSO = T' +
        'P.NR_PROCESSO AND EV088.CD_EVENTO = '#39'088'#39' '
      
        'LEFT JOIN INTEGRACAO_PHILIPS IPH WITH (NOLOCK) ON IPH.CD_INSTRUC' +
        'AO_DESEMBARACO = TP.ID_CODIGO_INSTR_DESEMB '
      
        'LEFT JOIN TINSTRUCAO_DESEMBARACO ID ON ID.ID_CODIGO = IPH.CD_INS' +
        'TRUCAO_DESEMBARACO'
      'WHERE CD_GRUPO = '#39'B94'#39' AND EV088.DT_REALIZACAO IS NOT NULL'
      'AND DT_CRIACAO BETWEEN (GETDATE() - 180) AND GETDATE()'
      'ORDER BY STATUS, ENVIAR, PROCESSO ASC')
    Left = 212
    Top = 200
    object qryMainID: TStringField
      FieldName = 'ID'
      FixedChar = True
      Size = 18
    end
    object qryMainPROCESSO: TStringField
      FieldName = 'PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryMainTP_PROCESSO: TStringField
      DisplayLabel = 'TIPO PROCESSO'
      FieldName = 'TP_PROCESSO'
      Size = 4
    end
    object qryMainSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 7
    end
    object qryMainENVIAR: TDateTimeField
      FieldName = 'ENVIAR'
    end
  end
end
