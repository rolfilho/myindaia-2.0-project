object frmRelatorioBasico: TfrmRelatorioBasico
  Left = 474
  Top = 196
  Width = 470
  Height = 171
  Caption = 'Relat'#243'rio B'#225'sico'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object nbOpcoes: TNotebook
    Left = 0
    Top = 0
    Width = 454
    Height = 92
    Align = alClient
    PageIndex = 3
    TabOrder = 0
    OnPageChanged = nbOpcoesPageChanged
    object TPage
      Left = 0
      Top = 0
      Caption = 'Selecionar Relat'#243'rio'
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 56
        Height = 13
        Caption = 'Relat'#243'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxlucbRelatorios: TcxLookupComboBox
        Left = 76
        Top = 13
        Properties.KeyFieldNames = 'CD_RELATORIO'
        Properties.ListColumns = <
          item
            FieldName = 'NM_RELATORIO'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = datmRelatorioBasico.dsRelatorios
        TabOrder = 0
        Width = 365
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Filtros'
      object Label3: TLabel
        Left = 16
        Top = 16
        Width = 21
        Height = 13
        Caption = 'De:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 168
        Top = 16
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
      object cxdeInicial: TcxDateEdit
        Left = 42
        Top = 13
        TabOrder = 0
        Width = 121
      end
      object cxdeFinal: TcxDateEdit
        Left = 181
        Top = 13
        TabOrder = 1
        Width = 121
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Gerando Relat'#243'rio'
      object lblStatus: TLabel
        Left = 16
        Top = 16
        Width = 116
        Height = 13
        Caption = 'Gerando Relat'#243'rio...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ggProgresso: TGauge
        Left = 16
        Top = 32
        Width = 417
        Height = 17
        ForeColor = clBlue
        Progress = 0
        Visible = False
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Conclu'#237'do'
      object lblResultado: TLabel
        Left = 16
        Top = 16
        Width = 165
        Height = 13
        Caption = 'Relat'#243'rio gerado com suesso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblArquivo: TLabel
        Left = 16
        Top = 32
        Width = 74
        Height = 13
        Cursor = crHandPoint
        Caption = 'Abrir Arquivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = lblArquivoClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 92
    Width = 454
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      454
      41)
    object btnVoltar: TBitBtn
      Left = 190
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Voltar'
      Enabled = False
      TabOrder = 0
      OnClick = btnVoltarClick
      NumGlyphs = 2
    end
    object btnAvancar: TBitBtn
      Left = 278
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Avan'#231'ar'
      TabOrder = 1
      OnClick = btnAvancarClick
    end
    object btnConcluir: TBitBtn
      Left = 366
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Concluir'
      TabOrder = 2
      Visible = False
      OnClick = btnConcluirClick
    end
  end
end
