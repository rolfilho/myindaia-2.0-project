object frm_DI_PreCalculo: Tfrm_DI_PreCalculo
  Left = 372
  Top = 150
  Width = 750
  Height = 550
  Caption = 'Pr'#233' Calculo - DI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 385
    Width = 742
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object pnlOpcoes: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 31
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      31)
    object btnCalcular: TSpeedButton
      Left = 69
      Top = 3
      Width = 25
      Height = 25
      Hint = 'Calcular'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337444444444
        73333337777777773F333348888888884333337F3F3F3FFF7F33334848489998
        4333337F737377737F333348888888884333337F3F3F3F3F7F33334848484848
        4333337F737373737F333348888888884333337F3F3F3F3F7F33334848484848
        4333337F737373737F333348888888884333337F3F3F3F3F7F33334848484848
        4333337F737373737F333348888888884333337F3FFFFFFF7F33334844444448
        4333337F7777777F7F333348444E4E484333337F7FFFFF7F7F33334844444448
        4333337F777777737F333348888888884333337F333333337F33334888888888
        43333373FFFFFFFF733333744444444473333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btnCalcularClick
    end
    object SpeedButton3: TSpeedButton
      Left = 714
      Top = 3
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
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
      OnClick = SpeedButton3Click
    end
    object btnSalvar: TSpeedButton
      Left = 3
      Top = 3
      Width = 25
      Height = 25
      Hint = 'Salvar Altera'#231#245'es'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSalvarClick
    end
    object btnCancelar: TSpeedButton
      Left = 30
      Top = 3
      Width = 25
      Height = 25
      Hint = 'Cancelar Altera'#231#245'es'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
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
      OnClick = btnCancelarClick
    end
    object DBText1: TDBText
      Left = 537
      Top = 4
      Width = 166
      Height = 26
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      DataField = 'NR_PROCESSO_SIMPLES'
      DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -21
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object DBText2: TDBText
      Left = 534
      Top = 3
      Width = 166
      Height = 26
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      DataField = 'NR_PROCESSO_SIMPLES'
      DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object pnlCapa: TPanel
    Left = 0
    Top = 31
    Width = 742
    Height = 199
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 36
      Width = 54
      Height = 13
      Caption = 'Incoterm:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 14
      Top = 59
      Width = 85
      Height = 13
      Caption = 'Taxa do Dolar:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 2
      Top = 2
      Width = 738
      Height = 21
      Align = alTop
      AutoSize = False
      Caption = '  Capa'
      Color = clHotLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object gbSeguro: TGroupBox
      Left = 7
      Top = 100
      Width = 241
      Height = 93
      Caption = 'Seguro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object Label10: TLabel
        Left = 9
        Top = 19
        Width = 43
        Height = 13
        Caption = 'Moeda:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 9
        Top = 67
        Width = 34
        Height = 13
        Caption = 'Valor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 9
        Top = 43
        Width = 33
        Height = 13
        Caption = 'Taxa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_VL_SEGURO_MOEDA: TDBEdit
        Left = 57
        Top = 64
        Width = 97
        Height = 21
        DataField = 'VL_SEGURO_MOEDA'
        DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnEnter = dbedt_INCOTERMEnter
        OnExit = dbedt_INCOTERMExit
      end
      object dbedt_CD_MOEDA_SEGURO: TDBEdit
        Left = 57
        Top = 16
        Width = 34
        Height = 21
        DataField = 'CD_MOEDA_SEGURO'
        DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = dbedt_INCOTERMEnter
        OnExit = dbedt_INCOTERMExit
      end
      object dblkcb_NM_MOEDA_SEGURO: TDBLookupComboBox
        Left = 91
        Top = 16
        Width = 144
        Height = 21
        DataField = 'CD_MOEDA_SEGURO'
        DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'CD_MOEDA'
        ListField = 'NM_MOEDA'
        ListSource = datm_DI_PreCalculo.dsMoedas
        ParentFont = False
        TabOrder = 1
        OnEnter = dbedt_INCOTERMEnter
        OnExit = dbedt_INCOTERMExit
      end
      object dbedt_TX_SEGURO: TDBEdit
        Left = 57
        Top = 40
        Width = 97
        Height = 21
        DataField = 'TX_SEGURO'
        DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnEnter = dbedt_INCOTERMEnter
        OnExit = dbedt_INCOTERMExit
      end
    end
    object gbFrete: TGroupBox
      Left = 495
      Top = 26
      Width = 242
      Height = 93
      Caption = 'Frete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object Label3: TLabel
        Left = 9
        Top = 19
        Width = 43
        Height = 13
        Caption = 'Moeda:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 9
        Top = 67
        Width = 34
        Height = 13
        Caption = 'Valor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 9
        Top = 43
        Width = 33
        Height = 13
        Caption = 'Taxa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_CD_MOEDA_FRETE: TDBEdit
        Left = 57
        Top = 16
        Width = 34
        Height = 21
        DataField = 'CD_MOEDA_FRETE'
        DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = dbedt_INCOTERMEnter
        OnExit = dbedt_INCOTERMExit
      end
      object dblkcb_NM_MOEDA_FRETE: TDBLookupComboBox
        Left = 91
        Top = 16
        Width = 144
        Height = 21
        DataField = 'CD_MOEDA_FRETE'
        DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'CD_MOEDA'
        ListField = 'NM_MOEDA'
        ListSource = datm_DI_PreCalculo.dsMoedas
        ParentFont = False
        TabOrder = 1
        OnEnter = dbedt_INCOTERMEnter
        OnExit = dbedt_INCOTERMExit
      end
      object dbedt_VL_FRETE_MOEDA: TDBEdit
        Left = 57
        Top = 64
        Width = 97
        Height = 21
        DataField = 'VL_FRETE_MOEDA'
        DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnEnter = dbedt_INCOTERMEnter
        OnExit = dbedt_INCOTERMExit
      end
      object dbedt_TX_FRETE: TDBEdit
        Left = 57
        Top = 40
        Width = 97
        Height = 21
        DataField = 'TX_FRETE'
        DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnEnter = dbedt_INCOTERMEnter
        OnExit = dbedt_INCOTERMExit
      end
    end
    object gbFOB: TGroupBox
      Left = 250
      Top = 26
      Width = 242
      Height = 93
      Caption = 'MLE'
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      object Label5: TLabel
        Left = 9
        Top = 19
        Width = 43
        Height = 13
        Caption = 'Moeda:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 9
        Top = 67
        Width = 34
        Height = 13
        Caption = 'Valor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 9
        Top = 43
        Width = 33
        Height = 13
        Caption = 'Taxa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_CD_MOEDA_MLE: TDBEdit
        Left = 57
        Top = 16
        Width = 34
        Height = 21
        DataField = 'CD_MOEDA_MLE'
        DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = dbedt_INCOTERMEnter
        OnExit = dbedt_INCOTERMExit
      end
      object dblkcb_NM_MOEDA_MLE: TDBLookupComboBox
        Left = 91
        Top = 16
        Width = 144
        Height = 21
        DataField = 'CD_MOEDA_MLE'
        DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'CD_MOEDA'
        ListField = 'NM_MOEDA'
        ListSource = datm_DI_PreCalculo.dsMoedas
        ParentFont = False
        TabOrder = 1
        OnEnter = dbedt_INCOTERMEnter
        OnExit = dbedt_INCOTERMExit
      end
      object dbedt_VL_MLE_MOEDA: TDBEdit
        Left = 57
        Top = 64
        Width = 97
        Height = 21
        DataField = 'VL_MLE_MOEDA'
        DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnEnter = dbedt_INCOTERMEnter
        OnExit = dbedt_INCOTERMExit
      end
      object dbedt_TX_MLE: TDBEdit
        Left = 57
        Top = 40
        Width = 97
        Height = 21
        DataField = 'TX_MLE'
        DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnEnter = dbedt_INCOTERMEnter
        OnExit = dbedt_INCOTERMExit
      end
    end
    object dbedt_INCOTERM: TDBEdit
      Left = 103
      Top = 32
      Width = 39
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CD_INCOTERM'
      DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
      TabOrder = 0
      OnEnter = dbedt_INCOTERMEnter
      OnExit = dbedt_INCOTERMExit
    end
    object dbedt_TX_DOLAR: TDBEdit
      Left = 102
      Top = 56
      Width = 97
      Height = 21
      DataField = 'TX_DOLAR'
      DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = dbedt_TX_DOLARChange
      OnEnter = dbedt_INCOTERMEnter
      OnExit = dbedt_INCOTERMExit
    end
    object gbAcrescimosDeducoes: TGroupBox
      Left = 251
      Top = 120
      Width = 242
      Height = 73
      Caption = 'Acr'#233'scimos e Dedu'#231#245'es em Reais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object Label27: TLabel
        Left = 9
        Top = 23
        Width = 69
        Height = 13
        Caption = 'Acr'#233'scimos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 9
        Top = 47
        Width = 62
        Height = 13
        Caption = 'Dedu'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_VL_ACRESCIMOS_REAIS: TDBEdit
        Left = 81
        Top = 20
        Width = 152
        Height = 21
        DataField = 'VL_ACRESCIMOS_REAIS'
        DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = dbedt_INCOTERMEnter
        OnExit = dbedt_INCOTERMExit
      end
      object dbedt_VL_DEDUCOES_REAIS: TDBEdit
        Left = 81
        Top = 44
        Width = 152
        Height = 21
        DataField = 'VL_DEDUCOES_REAIS'
        DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnEnter = dbedt_INCOTERMEnter
        OnExit = dbedt_INCOTERMExit
      end
    end
    object gbCIF: TGroupBox
      Left = 496
      Top = 120
      Width = 241
      Height = 73
      Caption = 'CIF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object Label16: TLabel
        Left = 20
        Top = 23
        Width = 29
        Height = 13
        Caption = 'US$:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label26: TLabel
        Left = 20
        Top = 47
        Width = 21
        Height = 13
        Caption = 'R$:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_VL_CIF_DOLAR: TDBEdit
        Left = 57
        Top = 20
        Width = 176
        Height = 21
        DataField = 'VL_CIF_DOLAR'
        DataSource = datm_DI_PreCalculo.dsPreCalculoCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnChange = dbedt_TX_DOLARChange
        OnEnter = dbedt_INCOTERMEnter
        OnExit = dbedt_INCOTERMExit
      end
      object cedt_CIF_REAIS: TCurrencyEdit
        Left = 57
        Top = 44
        Width = 176
        Height = 21
        AutoSize = False
        DisplayFormat = '#0,.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        ZeroEmpty = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 230
    Width = 742
    Height = 155
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      742
      155)
    object Label8: TLabel
      Left = 2
      Top = 2
      Width = 738
      Height = 21
      Align = alTop
      AutoSize = False
      Caption = '  Adi'#231#245'es'
      Color = clHotLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label9: TLabel
      Left = 529
      Top = 0
      Width = 5
      Height = 24
      Anchors = [akTop, akRight]
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object btnExcluirAdicao: TSpeedButton
      Left = 437
      Top = 3
      Width = 25
      Height = 20
      Hint = 'Excluir Adi'#231#227'o'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnExcluirAdicaoClick
    end
    object DBNavigator1: TDBNavigator
      Left = 584
      Top = 4
      Width = 152
      Height = 18
      DataSource = datm_DI_PreCalculo.dsPreCalculoAdicao
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      TabOrder = 0
    end
    object edtAdicaoAtual: TEdit
      Left = 490
      Top = 3
      Width = 35
      Height = 19
      Anchors = [akTop, akRight]
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Text = '0'
      OnChange = edtAdicaoAtualChange
      OnExit = edtAdicaoAtualExit
      OnKeyPress = edtAdicaoAtualKeyPress
    end
    object edtAdicaoTotal: TEdit
      Left = 538
      Top = 3
      Width = 35
      Height = 19
      Anchors = [akTop, akRight]
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '0'
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 23
      Width = 738
      Height = 130
      Align = alClient
      Ctl3D = True
      DataSource = datm_DI_PreCalculo.dsPreCalculoAdicao
      ParentCtl3D = False
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEnter = dbedt_INCOTERMEnter
      OnExit = dbedt_INCOTERMExit
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Color = clMenu
          Expanded = False
          FieldName = 'NR_ADICAO'
          ReadOnly = True
          Title.Caption = 'Adi'#231#227'o'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_CIF_REAIS'
          Title.Caption = 'CIF em Reais'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_ALIQUOTA_II'
          Title.Caption = 'Al'#237'quota II'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_ALIQUOTA_IPI'
          Title.Caption = 'Al'#237'quota IPI'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_ALIQUOTA_PIS'
          Title.Caption = 'Al'#237'quota PIS'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_ALIQUOTA_ESPECIFICA_PIS'
          Title.Caption = 'Al'#237'quota Esp PIS'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_UNID_ESPECIFICA_PIS'
          Title.Caption = 'Qtd Unid PIS'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_ALIQUOTA_COFINS'
          Title.Caption = 'Al'#237'quota COFINS'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_ALIQUOTA_ESPECIFICA_COFINS'
          Title.Caption = 'Al'#237'quota Esp COFINS'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_UNID_ESPECIFICA_COFINS'
          Title.Caption = 'Qtd Und COFINS'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_ALIQUOTA_ICMS'
          Title.Caption = 'Al'#237'quota ICMS'
          Width = 90
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 388
    Width = 742
    Height = 135
    Align = alBottom
    TabOrder = 3
    object Label15: TLabel
      Left = 1
      Top = 1
      Width = 740
      Height = 21
      Align = alTop
      AutoSize = False
      Caption = '  Totais'
      Color = clHotLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label17: TLabel
      Left = 8
      Top = 29
      Width = 343
      Height = 14
      Caption = 'II.............................................R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 8
      Top = 40
      Width = 343
      Height = 14
      Caption = 'IPI............................................R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 8
      Top = 62
      Width = 343
      Height = 14
      Caption = 'PIS............................................R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 8
      Top = 73
      Width = 343
      Height = 14
      Caption = 'COFINS.........................................R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 8
      Top = 95
      Width = 343
      Height = 14
      Caption = 'ICMS...........................................R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 8
      Top = 106
      Width = 343
      Height = 14
      Caption = 'OUTRAS DESPESAS................................R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 8
      Top = 117
      Width = 343
      Height = 14
      Caption = 'VALOR TOTAL P/ D'#201'BITO NA C/C - CLIENTE.........R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtxtVL_II: TDBText
      Left = 354
      Top = 29
      Width = 217
      Height = 13
      Alignment = taRightJustify
      DataField = 'VL_II_REAIS'
      DataSource = datm_DI_PreCalculo.dsTotais
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object dbtxtVL_IPI: TDBText
      Left = 354
      Top = 40
      Width = 217
      Height = 13
      Alignment = taRightJustify
      DataField = 'VL_IPI_REAIS'
      DataSource = datm_DI_PreCalculo.dsTotais
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object dbtxt_VL_PIS: TDBText
      Left = 354
      Top = 62
      Width = 217
      Height = 13
      Alignment = taRightJustify
      DataField = 'VL_PIS_REAIS'
      DataSource = datm_DI_PreCalculo.dsTotais
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object dbtxt_VL_COFINS: TDBText
      Left = 354
      Top = 73
      Width = 217
      Height = 13
      Alignment = taRightJustify
      DataField = 'VL_COFINS_REAIS'
      DataSource = datm_DI_PreCalculo.dsTotais
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object dbtxt_VL_ICMS: TDBText
      Left = 354
      Top = 95
      Width = 217
      Height = 13
      Alignment = taRightJustify
      DataField = 'VL_ICMS_REAIS'
      DataSource = datm_DI_PreCalculo.dsTotais
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object dbtxt_VL_OUTRAS_DESP_REAIS: TDBText
      Left = 354
      Top = 106
      Width = 217
      Height = 13
      Alignment = taRightJustify
      DataField = 'VL_OUTRAS_DESP_REAIS'
      DataSource = datm_DI_PreCalculo.dsTotais
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object dbtxt_VL_TOTAL: TDBText
      Left = 355
      Top = 117
      Width = 98
      Height = 14
      AutoSize = True
      DataField = 'VL_TOTAL'
      DataSource = datm_DI_PreCalculo.dsTotais
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 8
      Top = 51
      Width = 343
      Height = 14
      Caption = 'BASE PIS/COFINS................................R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object dbedt_VL_BASE_PIS_COFINS: TDBText
      Left = 354
      Top = 51
      Width = 217
      Height = 13
      Alignment = taRightJustify
      DataField = 'VL_BASE_PIS_COFINS'
      DataSource = datm_DI_PreCalculo.dsTotais
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 8
      Top = 84
      Width = 343
      Height = 14
      Caption = 'BASE ICMS......................................R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object dbtxt_VL_BASE_ICMS: TDBText
      Left = 354
      Top = 84
      Width = 217
      Height = 13
      Alignment = taRightJustify
      DataField = 'VL_BASE_ICMS'
      DataSource = datm_DI_PreCalculo.dsTotais
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
  end
end
