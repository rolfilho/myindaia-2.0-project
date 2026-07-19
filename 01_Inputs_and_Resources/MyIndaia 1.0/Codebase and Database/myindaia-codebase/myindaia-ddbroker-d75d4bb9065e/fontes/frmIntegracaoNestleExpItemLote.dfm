object FormIntegracaoNestleExpItemLote: TFormIntegracaoNestleExpItemLote
  Left = 897
  Top = 300
  BorderStyle = bsDialog
  Caption = 'Integra'#231#227'o Nestle Item Lote'
  ClientHeight = 534
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
      object BitBtn1: TBitBtn
        Left = 183
        Top = 31
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 1
        OnClick = BitBtn1Click
      end
    end
    object gbxStatus: TGroupBox
      Left = 377
      Top = 4
      Width = 192
      Height = 61
      Caption = ' Status '
      TabOrder = 1
      Visible = False
      object lblStatus: TLabel
        Left = 8
        Top = 27
        Width = 52
        Height = 16
        Caption = 'Status: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 614
    Height = 428
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
      Height = 337
      Align = alCustom
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
          FieldName = 'PROCESSO'
          Visible = True
        end>
    end
    object Memo1: TMemo
      Left = 8
      Top = 248
      Width = 598
      Height = 172
      Align = alBottom
      ScrollBars = ssBoth
      TabOrder = 1
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 493
    Width = 614
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      614
      41)
    object btnIntegrarPlanilha: TBitBtn
      Left = 528
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Integrar'
      TabOrder = 0
      OnClick = btnIntegrarPlanilhaClick
    end
    object btn_fechar: TButton
      Left = 402
      Top = 8
      Width = 100
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 1
      OnClick = btn_fecharClick
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
      'TP.NR_PROCESSO AS PROCESSO '
      'FROM TPROCESSO TP WITH (NOLOCK) '
      'INNER JOIN TPROCESSO_EXP PE ON PE.NR_PROCESSO = TP.NR_PROCESSO'
      'WHERE CD_GRUPO = '#39'155'#39' AND '
      '--TP.DT_ABERTURA  BETWEEN (GETDATE() - 180) AND GETDATE()'
      'TP.NR_PROCESSO LIKE '#39'%:NR_PROCESSO'#39
      'ORDER BY TP.NR_PROCESSO ASC')
    Left = 212
    Top = 200
    object qryMainPROCESSO: TStringField
      FieldName = 'PROCESSO'
      FixedChar = True
      Size = 18
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 392
    Top = 201
  end
end
