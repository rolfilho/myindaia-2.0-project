object frm_emissao_house: Tfrm_emissao_house
  Left = 195
  Top = 41
  Width = 721
  Height = 480
  Caption = 'Conhecimento HAWB'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    Color = clSilver
    TabOrder = 0
    object lb_conhecimento: TLabel
      Left = 215
      Top = 12
      Width = 38
      Height = 13
      Caption = 'HAWB'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_imprimir: TSpeedButton
      Left = 62
      Top = 8
      Width = 25
      Height = 25
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_imprimirClick
    end
    object btn_sair: TSpeedButton
      Left = 162
      Top = 8
      Width = 27
      Height = 25
      Hint = 'Sair'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_sairClick
    end
    object btn_design: TSpeedButton
      Left = 116
      Top = 8
      Width = 25
      Height = 25
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_designClick
    end
    object btn_salvar: TSpeedButton
      Left = 7
      Top = 8
      Width = 27
      Height = 25
      Hint = 'Salvar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
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
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 35
      Top = 8
      Width = 27
      Height = 25
      Hint = 'Cancelar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
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
      OnClick = btn_cancelarClick
    end
    object btn_carta_cred: TSpeedButton
      Left = 87
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Carta de Crédito'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
        555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
        05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
        FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
        FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
        FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
        05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
        555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
        9055575757575757775505050505055505557575757575557555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_carta_credClick
    end
    object lb_carta_credito: TLabel
      Left = 543
      Top = 12
      Width = 148
      Height = 16
      Caption = 'CARTA DE CRÉDITO'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object DBText4: TDBText
      Left = 392
      Top = 12
      Width = 112
      Height = 17
      DataField = 'NM_AS_AGREED'
      DataSource = ds_conhec
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 256
      Top = 9
      Width = 119
      Height = 21
      Color = clMenu
      DataField = 'NR_HOUSE'
      DataSource = ds_conhec
      ReadOnly = True
      TabOrder = 0
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 40
    Width = 713
    Height = 394
    HorzScrollBar.Visible = False
    Align = alClient
    BorderStyle = bsNone
    Color = clSilver
    ParentColor = False
    TabOrder = 1
    object Panel6: TPanel
      Left = 3
      Top = 184
      Width = 332
      Height = 94
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 0
      object Label6: TLabel
        Left = 8
        Top = 2
        Width = 222
        Height = 13
        Caption = 'Issuingg Carrier´s Agent Name and City'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dmemo_emissor: TDBMemo
        Left = 4
        Top = 17
        Width = 323
        Height = 74
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'END_AGENT'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DBMemo5Change
      end
    end
    object Panel7: TPanel
      Left = 337
      Top = 184
      Width = 358
      Height = 136
      BevelInner = bvLowered
      Color = clSilver
      TabOrder = 1
      object Label7: TLabel
        Left = 8
        Top = 2
        Width = 132
        Height = 13
        Caption = 'Accounting Information'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label76: TLabel
        Left = 8
        Top = 91
        Width = 76
        Height = 13
        Caption = 'Type Service'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBMemo8: TDBMemo
        Left = 5
        Top = 16
        Width = 344
        Height = 72
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'ACCOUNT_INFO'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 7
        Top = 107
        Width = 344
        Height = 21
        Color = clInfoBk
        DataField = 'TYPE_SERVICE'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = DBMemo5Change
      end
    end
    object Panel8: TPanel
      Left = 3
      Top = 279
      Width = 163
      Height = 40
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 2
      object Label8: TLabel
        Left = 8
        Top = 2
        Width = 109
        Height = 13
        Caption = 'Agent´s IATA Code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit3: TDBEdit
        Left = 7
        Top = 14
        Width = 112
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'NR_IATA_CODE'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel9: TPanel
      Left = 168
      Top = 279
      Width = 166
      Height = 40
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 3
      object Label9: TLabel
        Left = 8
        Top = 2
        Width = 68
        Height = 13
        Caption = 'Account No'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit4: TDBEdit
        Left = 7
        Top = 14
        Width = 112
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'NR_ACCOUNT'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel10: TPanel
      Left = 2
      Top = 320
      Width = 332
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 4
      object Label10: TLabel
        Left = 8
        Top = 2
        Width = 292
        Height = 13
        Caption = 
          'Airport of Departure(Addr. of First Carrier) and Request routing' +
          ')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbedt_rota: TDBEdit
        Left = 6
        Top = 17
        Width = 322
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'ROTA'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DBMemo5Change
      end
    end
    object Panel11: TPanel
      Left = 335
      Top = 320
      Width = 113
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 5
      object Label11: TLabel
        Left = 8
        Top = 2
        Width = 96
        Height = 13
        Caption = 'Refence Number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel12: TPanel
      Left = 448
      Top = 320
      Width = 181
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 6
      object Label12: TLabel
        Left = 4
        Top = 2
        Width = 168
        Height = 13
        Caption = 'Optional Shipping Information'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel13: TPanel
      Left = 629
      Top = 320
      Width = 64
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 7
    end
    object Panel14: TPanel
      Left = 3
      Top = 366
      Width = 40
      Height = 50
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 8
      object Label13: TLabel
        Left = -51
        Top = 2
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = -51
        Top = 10
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 8
        Top = 2
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit18: TDBEdit
        Left = 4
        Top = 25
        Width = 35
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'STR_TO1'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel15: TPanel
      Left = 45
      Top = 366
      Width = 151
      Height = 50
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 9
      object Label16: TLabel
        Left = 8
        Top = 2
        Width = 84
        Height = 13
        Caption = 'By First Carrier'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit19: TDBEdit
        Left = 4
        Top = 25
        Width = 144
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'CARRIER'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel16: TPanel
      Left = 336
      Top = 366
      Width = 57
      Height = 50
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 10
      object Label29: TLabel
        Left = 2
        Top = 2
        Width = 51
        Height = 13
        Caption = 'Currency'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit24: TDBEdit
        Left = 4
        Top = 25
        Width = 45
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'MOEDA'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel17: TPanel
      Left = 196
      Top = 366
      Width = 35
      Height = 50
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 11
      object Label17: TLabel
        Left = -51
        Top = 2
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = -51
        Top = 10
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 8
        Top = 2
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit20: TDBEdit
        Left = 2
        Top = 25
        Width = 30
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'STR_TO2'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel18: TPanel
      Left = 231
      Top = 366
      Width = 34
      Height = 50
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 12
      object Label20: TLabel
        Left = -51
        Top = 2
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = -51
        Top = 10
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 8
        Top = 2
        Width = 15
        Height = 13
        Caption = 'By'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit21: TDBEdit
        Left = 2
        Top = 25
        Width = 29
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel19: TPanel
      Left = 265
      Top = 366
      Width = 34
      Height = 50
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 13
      object Label23: TLabel
        Left = -51
        Top = 2
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label24: TLabel
        Left = -51
        Top = 10
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 8
        Top = 2
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit22: TDBEdit
        Left = 2
        Top = 25
        Width = 30
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'STR_TO3'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel20: TPanel
      Left = 300
      Top = 366
      Width = 35
      Height = 50
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 14
      object Label26: TLabel
        Left = -51
        Top = 2
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label27: TLabel
        Left = -51
        Top = 10
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 8
        Top = 2
        Width = 15
        Height = 13
        Caption = 'By'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit23: TDBEdit
        Left = 2
        Top = 25
        Width = 30
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel21: TPanel
      Left = 393
      Top = 366
      Width = 40
      Height = 50
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 15
      object Label30: TLabel
        Left = 4
        Top = 2
        Width = 29
        Height = 13
        Caption = 'Chgs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 5
        Top = 25
        Width = 28
        Height = 17
        DataField = 'TP_FRETE'
        DataSource = ds_conhec
      end
    end
    object Panel22: TPanel
      Left = 433
      Top = 366
      Width = 57
      Height = 16
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 16
      object Label31: TLabel
        Left = 4
        Top = 0
        Width = 50
        Height = 13
        Caption = 'WT/VAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel24: TPanel
      Left = 548
      Top = 366
      Width = 68
      Height = 50
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 17
      object Label33: TLabel
        Left = 3
        Top = 2
        Width = 65
        Height = 13
        Caption = 'DVCarriage'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_dvcarriage: TDBEdit
        Left = 5
        Top = 24
        Width = 57
        Height = 21
        Color = clInfoBk
        DataField = 'DVCARRIAGE'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DBMemo5Change
      end
    end
    object Panel25: TPanel
      Left = 617
      Top = 366
      Width = 76
      Height = 50
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 18
      object Label34: TLabel
        Left = 4
        Top = 2
        Width = 65
        Height = 13
        Caption = 'DVCustoms'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_dvcustoms: TDBEdit
        Left = 5
        Top = 24
        Width = 64
        Height = 21
        Color = clInfoBk
        DataField = 'DVCUSTOMS'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DBMemo5Change
      end
    end
    object Panel26: TPanel
      Left = 2
      Top = 417
      Width = 169
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 19
      object Label35: TLabel
        Left = 8
        Top = 2
        Width = 121
        Height = 13
        Caption = 'Airport of Destination'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_destination: TDBEdit
        Left = 4
        Top = 19
        Width = 161
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'DESTINATION'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel27: TPanel
      Left = 171
      Top = 417
      Width = 83
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 20
      object Label36: TLabel
        Left = 5
        Top = 2
        Width = 65
        Height = 13
        Caption = 'Flight/Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit26: TDBEdit
        Left = 3
        Top = 19
        Width = 77
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'DATA1'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel28: TPanel
      Left = 254
      Top = 417
      Width = 83
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 21
      object Label37: TLabel
        Left = 5
        Top = 2
        Width = 65
        Height = 13
        Caption = 'Flight/Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit27: TDBEdit
        Left = 2
        Top = 18
        Width = 77
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'DATA2'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel29: TPanel
      Left = 337
      Top = 417
      Width = 131
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 22
      object Label38: TLabel
        Left = 8
        Top = 2
        Width = 118
        Height = 13
        Caption = 'Amount of Insurance'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_insurance: TDBEdit
        Left = 33
        Top = 19
        Width = 57
        Height = 21
        Color = clInfoBk
        DataField = 'ST_INSURANCE'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DBMemo5Change
      end
    end
    object Panel30: TPanel
      Left = 470
      Top = 417
      Width = 223
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 23
    end
    object Panel31: TPanel
      Left = 3
      Top = 463
      Width = 691
      Height = 81
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 24
      object Label39: TLabel
        Left = 8
        Top = 2
        Width = 118
        Height = 13
        Caption = 'Handling Information'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBMemo5: TDBMemo
        Left = 5
        Top = 16
        Width = 680
        Height = 60
        Color = clInfoBk
        DataField = 'HAND_INF'
        DataSource = ds_conhec
        TabOrder = 0
        OnChange = DBMemo5Change
      end
    end
    object Panel32: TPanel
      Left = 4
      Top = 545
      Width = 95
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 25
      object Label40: TLabel
        Left = -51
        Top = 2
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label41: TLabel
        Left = -51
        Top = 10
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label42: TLabel
        Left = 8
        Top = 2
        Width = 74
        Height = 13
        Caption = 'No of Pieces'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit28: TDBEdit
        Left = 20
        Top = 18
        Width = 51
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'QTDE'
        DataSource = ds_conhec
        TabOrder = 0
      end
    end
    object Panel33: TPanel
      Left = 99
      Top = 545
      Width = 95
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 26
      object Label43: TLabel
        Left = -51
        Top = 2
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label44: TLabel
        Left = -51
        Top = 10
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label45: TLabel
        Left = 8
        Top = 2
        Width = 77
        Height = 13
        Caption = 'Gross Weight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit29: TDBEdit
        Left = 11
        Top = 18
        Width = 69
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'GROSS_WEIGHT'
        DataSource = ds_conhec
        TabOrder = 0
      end
    end
    object Panel34: TPanel
      Left = 195
      Top = 545
      Width = 124
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 27
      object Label46: TLabel
        Left = -51
        Top = 2
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label47: TLabel
        Left = -51
        Top = 10
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label48: TLabel
        Left = 8
        Top = 2
        Width = 109
        Height = 13
        Caption = 'Chargeable Weight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit30: TDBEdit
        Left = 18
        Top = 18
        Width = 89
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'CHARG_WEIGHT'
        DataSource = ds_conhec
        TabOrder = 0
      end
    end
    object Panel35: TPanel
      Left = 4
      Top = 591
      Width = 127
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 28
      object Label49: TLabel
        Left = -51
        Top = 2
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label50: TLabel
        Left = -51
        Top = 10
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label51: TLabel
        Left = 8
        Top = 2
        Width = 78
        Height = 13
        Caption = 'Rate/ Charge'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit32: TDBEdit
        Left = 18
        Top = 18
        Width = 89
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'VL_TAR_FRETE'
        DataSource = ds_conhec
        TabOrder = 0
      end
    end
    object Panel36: TPanel
      Left = 132
      Top = 591
      Width = 127
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 29
      object Label52: TLabel
        Left = -51
        Top = 2
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label53: TLabel
        Left = -51
        Top = 10
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label54: TLabel
        Left = 8
        Top = 1
        Width = 30
        Height = 13
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit31: TDBEdit
        Left = 14
        Top = 17
        Width = 99
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'VL_FRETE'
        DataSource = ds_conhec
        TabOrder = 0
      end
    end
    object Panel37: TPanel
      Left = 403
      Top = 545
      Width = 291
      Height = 207
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 30
      object Label63: TLabel
        Left = 47
        Top = 3
        Width = 170
        Height = 13
        Caption = 'Nature and Quantity of Goods'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton2: TSpeedButton
        Left = 265
        Top = 3
        Width = 18
        Height = 15
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00559999999995
          5555557777777775F5555559999999505555555777777757FFF5555555555550
          0955555555555FF7775F55555555995501955555555577557F75555555555555
          01995555555555557F5755555555555501905555555555557F57555555555555
          0F905555555555557FF75555555555500005555555555557777555555555550F
          F05555555555557F57F5555555555008F05555555555F775F755555555570000
          05555555555775577555555555700007555555555F755F775555555570000755
          55555555775F77555555555700075555555555F75F7755555555570007555555
          5555577F77555555555500075555555555557777555555555555}
        NumGlyphs = 2
        Visible = False
      end
      object dbmemo_nature: TDBMemo
        Left = 4
        Top = 18
        Width = 280
        Height = 186
        Color = clInfoBk
        DataField = 'NATURE_GOOD'
        DataSource = ds_conhec
        ScrollBars = ssVertical
        TabOrder = 0
        OnChange = DBMemo5Change
      end
    end
    object Panel38: TPanel
      Left = 4
      Top = 638
      Width = 255
      Height = 209
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 31
      object Label61: TLabel
        Left = 116
        Top = 91
        Width = 22
        Height = 13
        Caption = 'Tax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label71: TLabel
        Left = 37
        Top = 129
        Width = 179
        Height = 13
        Caption = 'Total Other Charges Due Agent'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label55: TLabel
        Left = 32
        Top = 4
        Width = 44
        Height = 13
        Caption = 'Prepaid'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label56: TLabel
        Left = 168
        Top = 4
        Width = 40
        Height = 13
        Caption = 'Collect'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label57: TLabel
        Left = 80
        Top = 20
        Width = 85
        Height = 13
        Caption = 'Weight Charge'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label58: TLabel
        Left = 81
        Top = 55
        Width = 97
        Height = 13
        Caption = 'Valuation charge'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label59: TLabel
        Left = 37
        Top = 167
        Width = 183
        Height = 13
        Caption = 'Total Other Charges Due Carrier'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_frete_pp: TDBEdit
        Left = 7
        Top = 33
        Width = 114
        Height = 21
        BiDiMode = bdRightToLeft
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'VL_FRETE_PP'
        DataSource = ds_conhec
        ParentBiDiMode = False
        TabOrder = 0
      end
      object dbedt_frete_cc: TDBEdit
        Left = 134
        Top = 33
        Width = 114
        Height = 21
        BiDiMode = bdRightToLeft
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'VL_FRETE_CC'
        DataSource = ds_conhec
        ParentBiDiMode = False
        TabOrder = 1
      end
      object DBEdit8: TDBEdit
        Left = 133
        Top = 68
        Width = 115
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        TabOrder = 2
      end
      object DBEdit9: TDBEdit
        Left = 7
        Top = 69
        Width = 114
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        TabOrder = 3
      end
      object DBEdit10: TDBEdit
        Left = 133
        Top = 104
        Width = 115
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        TabOrder = 4
      end
      object DBEdit11: TDBEdit
        Left = 6
        Top = 104
        Width = 115
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        TabOrder = 5
      end
      object dbedt_collect_cia: TDBEdit
        Left = 137
        Top = 181
        Width = 112
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'VL_CARRIER_CC'
        DataSource = ds_conhec
        TabOrder = 6
      end
      object dbedt_prepaid_cia: TDBEdit
        Left = 6
        Top = 181
        Width = 115
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'VL_CARRIER_PP'
        DataSource = ds_conhec
        TabOrder = 7
      end
      object dbedt_collect_ag: TDBEdit
        Left = 135
        Top = 141
        Width = 114
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'VL_AGENTE_CC'
        DataSource = ds_conhec
        TabOrder = 8
      end
      object dbedt_prepaid_ag: TDBEdit
        Left = 6
        Top = 142
        Width = 115
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'VL_AGENTE_PP'
        DataSource = ds_conhec
        TabOrder = 9
      end
    end
    object Panel39: TPanel
      Left = 5
      Top = 847
      Width = 255
      Height = 43
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 32
      object Label60: TLabel
        Left = 20
        Top = 4
        Width = 77
        Height = 13
        Caption = 'Total Prepaid'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label62: TLabel
        Left = 156
        Top = 4
        Width = 73
        Height = 13
        Caption = 'Total Collect'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit12: TDBEdit
        Left = 6
        Top = 17
        Width = 115
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'VL_TOT_PP'
        DataSource = ds_conhec
        TabOrder = 0
      end
      object DBEdit13: TDBEdit
        Left = 137
        Top = 17
        Width = 112
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'VL_TOT_CC'
        DataSource = ds_conhec
        TabOrder = 1
      end
    end
    object Panel40: TPanel
      Left = 260
      Top = 753
      Width = 431
      Height = 90
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 33
      object Label64: TLabel
        Left = 8
        Top = 2
        Width = 82
        Height = 13
        Caption = 'Other Charges'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBMemo7: TDBMemo
        Left = 3
        Top = 15
        Width = 418
        Height = 71
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'OTHER_CHARG'
        DataSource = ds_conhec
        TabOrder = 0
      end
    end
    object Panel41: TPanel
      Left = 261
      Top = 844
      Width = 431
      Height = 107
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 34
      object Label2: TLabel
        Left = 16
        Top = 7
        Width = 163
        Height = 13
        Caption = 'AS AUTHORIZED AGENTS FOR:'
      end
      object Label69: TLabel
        Left = 39
        Top = 44
        Width = 351
        Height = 13
        Caption = 
          '----------------------------------------------------------------' +
          '-----------------------------------------------------'
        Transparent = True
      end
      object Label70: TLabel
        Left = 14
        Top = 66
        Width = 92
        Height = 13
        Caption = 'AS AGENTS FOR: '
      end
      object DBText9: TDBText
        Left = 18
        Top = 83
        Width = 65
        Height = 17
        DataField = 'DT_EMISSAO'
        DataSource = ds_conhec
      end
      object dbedt_ag_autorizado: TDBEdit
        Left = 181
        Top = 5
        Width = 245
        Height = 18
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'FOR_AGENT_AUT'
        DataSource = ds_conhec
        ReadOnly = True
        TabOrder = 0
        OnChange = DBMemo5Change
      end
      object dbedt_for_agent: TDBEdit
        Left = 41
        Top = 32
        Width = 360
        Height = 18
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'FOR_AGENT'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnChange = DBMemo5Change
      end
      object dbedt_as_agent: TDBEdit
        Left = 106
        Top = 63
        Width = 315
        Height = 18
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'AS_AGENT'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnChange = DBMemo5Change
      end
    end
    object Panel42: TPanel
      Left = 433
      Top = 383
      Width = 29
      Height = 33
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 35
      object Label65: TLabel
        Left = 3
        Top = 2
        Width = 26
        Height = 13
        Caption = 'PPD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 3
        Top = 15
        Width = 23
        Height = 13
        DataField = 'FRETE_CONF_PP'
        DataSource = ds_conhec
      end
    end
    object Panel43: TPanel
      Left = 463
      Top = 383
      Width = 27
      Height = 33
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 36
      object Label66: TLabel
        Left = 6
        Top = 2
        Width = 17
        Height = 13
        Caption = 'CC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText7: TDBText
        Left = 3
        Top = 15
        Width = 23
        Height = 13
        DataField = 'FRETE_CONF_CC'
        DataSource = ds_conhec
      end
    end
    object Panel23: TPanel
      Left = 491
      Top = 366
      Width = 57
      Height = 16
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 37
      object Label32: TLabel
        Left = 11
        Top = 0
        Width = 32
        Height = 13
        Caption = 'Other'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel44: TPanel
      Left = 491
      Top = 382
      Width = 29
      Height = 34
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 38
      object Label67: TLabel
        Left = 6
        Top = 2
        Width = 17
        Height = 13
        Caption = 'PP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 4
        Top = 16
        Width = 19
        Height = 17
        DataField = 'TP_OTHER_PP'
        DataSource = ds_conhec
      end
    end
    object Panel45: TPanel
      Left = 521
      Top = 382
      Width = 27
      Height = 34
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 39
      object Label68: TLabel
        Left = 6
        Top = 2
        Width = 17
        Height = 13
        Caption = 'CC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText8: TDBText
        Left = 5
        Top = 17
        Width = 17
        Height = 15
        DataField = 'TP_OTHER_CC'
        DataSource = ds_conhec
      end
    end
    object Panel46: TPanel
      Left = 260
      Top = 591
      Width = 142
      Height = 161
      BevelOuter = bvLowered
      Caption = 'Panel46'
      Color = clSilver
      TabOrder = 40
      object Label72: TLabel
        Left = 8
        Top = 2
        Width = 111
        Height = 13
        Caption = 'Observação Compl.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBMemo6: TDBMemo
        Left = 3
        Top = 17
        Width = 136
        Height = 139
        Color = clInfoBk
        DataField = 'TX_DOC_EMISSA'
        DataSource = ds_conhec
        TabOrder = 0
        OnChange = DBMemo5Change
      end
    end
    object Panel5: TPanel
      Left = 337
      Top = 94
      Width = 357
      Height = 89
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 41
    end
    object Panel4: TPanel
      Left = 3
      Top = 93
      Width = 332
      Height = 89
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 42
      object Label5: TLabel
        Left = 8
        Top = 2
        Width = 177
        Height = 13
        Caption = 'Consigneer´s Name and Adress'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbmemo_consigne: TDBMemo
        Left = 4
        Top = 18
        Width = 323
        Height = 68
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'END_CONSIGNE'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DBMemo5Change
      end
    end
    object Panel2: TPanel
      Left = 3
      Top = 2
      Width = 332
      Height = 90
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 43
      object Label3: TLabel
        Left = 8
        Top = 2
        Width = 157
        Height = 13
        Caption = 'Shipper´s Name and Adress'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbmemo_shipper: TDBMemo
        Left = 4
        Top = 17
        Width = 323
        Height = 67
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'END_SHIPPER'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DBMemo5Change
      end
    end
    object Panel3: TPanel
      Left = 337
      Top = 2
      Width = 357
      Height = 90
      BevelInner = bvLowered
      Color = clSilver
      TabOrder = 44
      object Label4: TLabel
        Left = 8
        Top = 2
        Width = 55
        Height = 13
        Caption = 'Issued by'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbmemo_issued: TDBMemo
        Left = 5
        Top = 16
        Width = 340
        Height = 69
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'END_ISSUED'
        DataSource = ds_conhec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DBMemo5Change
      end
    end
    object Panel53: TPanel
      Left = 321
      Top = 544
      Width = 81
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 45
      object Label73: TLabel
        Left = -51
        Top = 2
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label74: TLabel
        Left = -51
        Top = 10
        Width = 16
        Height = 13
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label75: TLabel
        Left = 8
        Top = 2
        Width = 62
        Height = 13
        Caption = 'Class Rate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rdgrp_class_rate: TRadioGroup
        Left = 0
        Top = 15
        Width = 79
        Height = 28
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'A'
          'N')
        TabOrder = 0
        Visible = False
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 0
        Top = 14
        Width = 77
        Height = 30
        Columns = 2
        DataField = 'CLASS_RATE'
        DataSource = ds_conhec
        Items.Strings = (
          'A'
          'N')
        TabOrder = 1
        Values.Strings = (
          'A'
          'N')
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 638
    Top = 62
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = btn_salvarClick
    end
    object mi_Cancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
    end
    object Emisso1: TMenuItem
      Caption = '&Imprimir'
    end
    object mi_Designe: TMenuItem
      Caption = '&Designe'
      Visible = False
    end
    object TMenuItem
    end
    object Sair1: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object pp_conhecimento: TppReport
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
    DeviceType = 'Screen'
    Left = 352
    Top = 188
    Version = '5.56'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppDesigner: TppDesigner
    Caption = 'ReportBuilder'
    Position = poScreenCenter
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.SQLType = sqBDELocal
    Report = pp_conhecimento
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 392
    Top = 188
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = ds_conhec
    UserName = 'BDEPipeline1'
    Left = 432
    Top = 188
  end
  object qry_conhecimento: TQuery
    CachedUpdates = True
    AfterPost = qry_conhecimentoAfterPost
    OnCalcFields = qry_conhecimentoCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TEMISSAO_CONHECIMENTO'
      ' WHERE NR_PROCESSO = :NR_PROCESSO')
    UpdateObject = UpdateSQL1
    Left = 551
    Top = 62
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_conhecimentoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_conhecimentoEND_SHIPPER: TStringField
      FieldName = 'END_SHIPPER'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.END_SHIPPER'
      FixedChar = True
      Size = 255
    end
    object qry_conhecimentoEND_CONSIGNE: TStringField
      FieldName = 'END_CONSIGNE'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.END_CONSIGNE'
      FixedChar = True
      Size = 255
    end
    object qry_conhecimentoEND_ISSUED: TStringField
      FieldName = 'END_ISSUED'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.END_ISSUED'
      FixedChar = True
      Size = 255
    end
    object qry_conhecimentoEND_AGENT: TStringField
      FieldName = 'END_AGENT'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.END_AGENT'
      FixedChar = True
      Size = 255
    end
    object qry_conhecimentoACCOUNT_INFO: TStringField
      FieldName = 'ACCOUNT_INFO'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.ACCOUNT_INFO'
      Size = 150
    end
    object qry_conhecimentoNR_IATA_CODE: TStringField
      FieldName = 'NR_IATA_CODE'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.NR_IATA_CODE'
      FixedChar = True
    end
    object qry_conhecimentoNR_ACCOUNT: TStringField
      FieldName = 'NR_ACCOUNT'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.NR_ACCOUNT'
      FixedChar = True
    end
    object qry_conhecimentoTYPE_SERVICE: TStringField
      FieldName = 'TYPE_SERVICE'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.TYPE_SERVICE'
      FixedChar = True
      Size = 40
    end
    object qry_conhecimentoROTA: TStringField
      FieldName = 'ROTA'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.ROTA'
      FixedChar = True
      Size = 100
    end
    object qry_conhecimentoSTR_TO1: TStringField
      FieldName = 'STR_TO1'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.STR_TO1'
      FixedChar = True
      Size = 3
    end
    object qry_conhecimentoSTR_TO2: TStringField
      FieldName = 'STR_TO2'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.STR_TO2'
      FixedChar = True
      Size = 3
    end
    object qry_conhecimentoSTR_TO3: TStringField
      FieldName = 'STR_TO3'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.STR_TO3'
      FixedChar = True
      Size = 3
    end
    object qry_conhecimentoCARRIER: TStringField
      FieldName = 'CARRIER'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.CARRIER'
      FixedChar = True
      Size = 50
    end
    object qry_conhecimentoMOEDA: TStringField
      FieldName = 'MOEDA'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.MOEDA'
      FixedChar = True
      Size = 5
    end
    object qry_conhecimentoTP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.TP_FRETE'
      FixedChar = True
      Size = 2
    end
    object qry_conhecimentoFRETE_CONF_PP: TStringField
      FieldName = 'FRETE_CONF_PP'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.FRETE_CONF_PP'
      FixedChar = True
      Size = 2
    end
    object qry_conhecimentoFRETE_CONF_CC: TStringField
      FieldName = 'FRETE_CONF_CC'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.FRETE_CONF_CC'
      FixedChar = True
      Size = 2
    end
    object qry_conhecimentoTP_OTHER_PP: TStringField
      FieldName = 'TP_OTHER_PP'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.TP_OTHER_PP'
      FixedChar = True
      Size = 2
    end
    object qry_conhecimentoTP_OTHER_CC: TStringField
      FieldName = 'TP_OTHER_CC'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.TP_OTHER_CC'
      FixedChar = True
      Size = 2
    end
    object qry_conhecimentoDVCARRIAGE: TStringField
      FieldName = 'DVCARRIAGE'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.DVCARRIAGE'
      FixedChar = True
      Size = 12
    end
    object qry_conhecimentoDVCUSTOMS: TStringField
      FieldName = 'DVCUSTOMS'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.DVCUSTOMS'
      FixedChar = True
      Size = 12
    end
    object qry_conhecimentoDESTINATION: TStringField
      FieldName = 'DESTINATION'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.DESTINATION'
      FixedChar = True
      Size = 40
    end
    object qry_conhecimentoDATA1: TStringField
      FieldName = 'DATA1'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.DATA1'
      FixedChar = True
      Size = 25
    end
    object qry_conhecimentoDATA2: TStringField
      FieldName = 'DATA2'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.DATA2'
      FixedChar = True
      Size = 25
    end
    object qry_conhecimentoST_INSURANCE: TStringField
      FieldName = 'ST_INSURANCE'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.ST_INSURANCE'
      FixedChar = True
      Size = 12
    end
    object qry_conhecimentoQTDE: TFloatField
      FieldName = 'QTDE'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.QTDE'
    end
    object qry_conhecimentoGROSS_WEIGHT: TFloatField
      FieldName = 'GROSS_WEIGHT'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.GROSS_WEIGHT'
    end
    object qry_conhecimentoCHARG_WEIGHT: TFloatField
      FieldName = 'CHARG_WEIGHT'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.CHARG_WEIGHT'
    end
    object qry_conhecimentoCLASS_RATE: TStringField
      FieldName = 'CLASS_RATE'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.CLASS_RATE'
      FixedChar = True
      Size = 1
    end
    object qry_conhecimentoVL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.VL_FRETE'
      DisplayFormat = '0.00'
    end
    object qry_conhecimentoVL_TAR_FRETE: TFloatField
      FieldName = 'VL_TAR_FRETE'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.VL_TAR_FRETE'
      DisplayFormat = '0.00'
    end
    object qry_conhecimentoVL_FRETE_CC: TFloatField
      FieldName = 'VL_FRETE_CC'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.VL_FRETE_CC'
      DisplayFormat = '0.00'
    end
    object qry_conhecimentoVL_FRETE_PP: TFloatField
      FieldName = 'VL_FRETE_PP'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.VL_FRETE_PP'
      DisplayFormat = '0.00'
    end
    object qry_conhecimentoVL_CARRIER_PP: TFloatField
      FieldName = 'VL_CARRIER_PP'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.VL_CARRIER_PP'
      DisplayFormat = '0.00'
    end
    object qry_conhecimentoVL_CARRIER_CC: TFloatField
      FieldName = 'VL_CARRIER_CC'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.VL_CARRIER_CC'
      DisplayFormat = '0.00'
    end
    object qry_conhecimentoVL_AGENTE_PP: TFloatField
      FieldName = 'VL_AGENTE_PP'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.VL_AGENTE_PP'
      DisplayFormat = '0.00'
    end
    object qry_conhecimentoVL_AGENTE_CC: TFloatField
      FieldName = 'VL_AGENTE_CC'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.VL_AGENTE_CC'
      DisplayFormat = '0.00'
    end
    object qry_conhecimentoVL_TOT_PP: TFloatField
      FieldName = 'VL_TOT_PP'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.VL_TOT_PP'
      DisplayFormat = '0.00'
    end
    object qry_conhecimentoVL_TOT_CC: TFloatField
      FieldName = 'VL_TOT_CC'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.VL_TOT_CC'
      DisplayFormat = '0.00'
    end
    object qry_conhecimentoHAND_INF: TStringField
      FieldName = 'HAND_INF'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.HAND_INF'
      FixedChar = True
      Size = 255
    end
    object qry_conhecimentoNATURE_GOOD: TStringField
      FieldName = 'NATURE_GOOD'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.NATURE_GOOD'
      FixedChar = True
      Size = 255
    end
    object qry_conhecimentoOTHER_CHARG: TStringField
      FieldName = 'OTHER_CHARG'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.OTHER_CHARG'
      FixedChar = True
      Size = 255
    end
    object qry_conhecimentoTX_DOC_EMISSA: TMemoField
      FieldName = 'TX_DOC_EMISSA'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.TX_DOC_EMISSA'
      BlobType = ftMemo
    end
    object qry_conhecimentoFOR_AGENT_AUT: TStringField
      FieldName = 'FOR_AGENT_AUT'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.FOR_AGENT_AUT'
      FixedChar = True
      Size = 100
    end
    object qry_conhecimentoFOR_AGENT: TStringField
      FieldName = 'FOR_AGENT'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.FOR_AGENT'
      FixedChar = True
      Size = 100
    end
    object qry_conhecimentoAS_AGENT: TStringField
      FieldName = 'AS_AGENT'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.AS_AGENT'
      FixedChar = True
      Size = 100
    end
    object qry_conhecimentoDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.DT_EMISSAO'
    end
    object qry_conhecimentoIN_CARTA_CRED: TStringField
      FieldName = 'IN_CARTA_CRED'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.IN_CARTA_CRED'
      FixedChar = True
      Size = 1
    end
    object qry_conhecimentoCD_USUARIO_ALT: TStringField
      FieldName = 'CD_USUARIO_ALT'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.CD_USUARIO_ALT'
      FixedChar = True
      Size = 4
    end
    object qry_conhecimentoIN_IMPRESSAO: TStringField
      FieldName = 'IN_IMPRESSAO'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.IN_IMPRESSAO'
      FixedChar = True
      Size = 1
    end
    object qry_conhecimentoNR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_conhecimentoNR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_conhecimentocalc_nm_usuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_usuario'
      Size = 80
      Calculated = True
    end
    object qry_conhecimentoNM_AS_AGREED: TStringField
      FieldName = 'NM_AS_AGREED'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.NR_PROCESSO'
      FixedChar = True
      Size = 25
    end
    object qry_conhecimentocalc_cidade: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_cidade'
      Size = 30
      Calculated = True
    end
    object qry_conhecimentocalc_nr_account_cliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nr_account_cliente'
      Calculated = True
    end
    object qry_conhecimentocalc_nr_account_emp_est: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nr_account_emp_est'
      Calculated = True
    end
    object qry_conhecimentoORIGEM: TStringField
      FieldName = 'ORIGEM'
      Origin = 'DBBROKER.TEMISSAO_CONHECIMENTO.ORIGEM'
      FixedChar = True
      Size = 3
    end
  end
  object ds_conhec: TDataSource
    DataSet = qry_conhecimento
    Left = 579
    Top = 62
  end
  object sp_emissao_conhecimento_: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_emissao_hawb'
    Left = 522
    Top = 62
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object UpdateSQL1: TUpdateSQL
    ModifySQL.Strings = (
      'update TEMISSAO_CONHECIMENTO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  END_SHIPPER = :END_SHIPPER,'
      '  END_CONSIGNE = :END_CONSIGNE,'
      '  END_ISSUED = :END_ISSUED,'
      '  END_AGENT = :END_AGENT,'
      '  ACCOUNT_INFO = :ACCOUNT_INFO,'
      '  NR_IATA_CODE = :NR_IATA_CODE,'
      '  NR_ACCOUNT = :NR_ACCOUNT,'
      '  TYPE_SERVICE = :TYPE_SERVICE,'
      '  ROTA = :ROTA,'
      '  STR_TO1 = :STR_TO1,'
      '  STR_TO2 = :STR_TO2,'
      '  STR_TO3 = :STR_TO3,'
      '  CARRIER = :CARRIER,'
      '  MOEDA = :MOEDA,'
      '  TP_FRETE = :TP_FRETE,'
      '  FRETE_CONF_PP = :FRETE_CONF_PP,'
      '  FRETE_CONF_CC = :FRETE_CONF_CC,'
      '  TP_OTHER_PP = :TP_OTHER_PP,'
      '  TP_OTHER_CC = :TP_OTHER_CC,'
      '  DVCARRIAGE = :DVCARRIAGE,'
      '  DVCUSTOMS = :DVCUSTOMS,'
      '  DESTINATION = :DESTINATION,'
      '  DATA1 = :DATA1,'
      '  DATA2 = :DATA2,'
      '  ST_INSURANCE = :ST_INSURANCE,'
      '  QTDE = :QTDE,'
      '  GROSS_WEIGHT = :GROSS_WEIGHT,'
      '  CHARG_WEIGHT = :CHARG_WEIGHT,'
      '  CLASS_RATE = :CLASS_RATE,'
      '  VL_FRETE = :VL_FRETE,'
      '  VL_TAR_FRETE = :VL_TAR_FRETE,'
      '  VL_FRETE_CC = :VL_FRETE_CC,'
      '  VL_FRETE_PP = :VL_FRETE_PP,'
      '  VL_CARRIER_PP = :VL_CARRIER_PP,'
      '  VL_CARRIER_CC = :VL_CARRIER_CC,'
      '  VL_AGENTE_PP = :VL_AGENTE_PP,'
      '  VL_AGENTE_CC = :VL_AGENTE_CC,'
      '  VL_TOT_PP = :VL_TOT_PP,'
      '  VL_TOT_CC = :VL_TOT_CC,'
      '  HAND_INF = :HAND_INF,'
      '  NATURE_GOOD = :NATURE_GOOD,'
      '  OTHER_CHARG = :OTHER_CHARG,'
      '  TX_DOC_EMISSA = :TX_DOC_EMISSA,'
      '  FOR_AGENT_AUT = :FOR_AGENT_AUT,'
      '  FOR_AGENT = :FOR_AGENT,'
      '  AS_AGENT = :AS_AGENT,'
      '  DT_EMISSAO = :DT_EMISSAO,'
      '  IN_CARTA_CRED = :IN_CARTA_CRED,'
      '  CD_USUARIO_ALT = :CD_USUARIO_ALT,'
      '  IN_IMPRESSAO = :IN_IMPRESSAO,'
      '  NR_MASTER = :NR_MASTER,'
      '  NR_HOUSE = :NR_HOUSE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TEMISSAO_CONHECIMENTO'
      
        '  (NR_PROCESSO, END_SHIPPER, END_CONSIGNE, END_ISSUED, END_AGENT' +
        ', ACCOUNT_INFO, '
      
        '   NR_IATA_CODE, NR_ACCOUNT, TYPE_SERVICE, ROTA, STR_TO1, STR_TO' +
        '2, STR_TO3, '
      
        '   CARRIER, MOEDA, TP_FRETE, FRETE_CONF_PP, FRETE_CONF_CC, TP_OT' +
        'HER_PP, '
      
        '   TP_OTHER_CC, DVCARRIAGE, DVCUSTOMS, DESTINATION, DATA1, DATA2' +
        ', ST_INSURANCE, '
      
        '   QTDE, GROSS_WEIGHT, CHARG_WEIGHT, CLASS_RATE, VL_FRETE, VL_TA' +
        'R_FRETE, '
      
        '   VL_FRETE_CC, VL_FRETE_PP, VL_CARRIER_PP, VL_CARRIER_CC, VL_AG' +
        'ENTE_PP, '
      
        '   VL_AGENTE_CC, VL_TOT_PP, VL_TOT_CC, HAND_INF, NATURE_GOOD, OT' +
        'HER_CHARG, '
      
        '   TX_DOC_EMISSA, FOR_AGENT_AUT, FOR_AGENT, AS_AGENT, DT_EMISSAO' +
        ', IN_CARTA_CRED, '
      '   CD_USUARIO_ALT, IN_IMPRESSAO, NR_MASTER, NR_HOUSE)'
      'values'
      
        '  (:NR_PROCESSO, :END_SHIPPER, :END_CONSIGNE, :END_ISSUED, :END_' +
        'AGENT, '
      
        '   :ACCOUNT_INFO, :NR_IATA_CODE, :NR_ACCOUNT, :TYPE_SERVICE, :RO' +
        'TA, :STR_TO1, '
      
        '   :STR_TO2, :STR_TO3, :CARRIER, :MOEDA, :TP_FRETE, :FRETE_CONF_' +
        'PP, :FRETE_CONF_CC, '
      
        '   :TP_OTHER_PP, :TP_OTHER_CC, :DVCARRIAGE, :DVCUSTOMS, :DESTINA' +
        'TION, :DATA1, '
      
        '   :DATA2, :ST_INSURANCE, :QTDE, :GROSS_WEIGHT, :CHARG_WEIGHT, :' +
        'CLASS_RATE, '
      
        '   :VL_FRETE, :VL_TAR_FRETE, :VL_FRETE_CC, :VL_FRETE_PP, :VL_CAR' +
        'RIER_PP, '
      
        '   :VL_CARRIER_CC, :VL_AGENTE_PP, :VL_AGENTE_CC, :VL_TOT_PP, :VL' +
        '_TOT_CC, '
      
        '   :HAND_INF, :NATURE_GOOD, :OTHER_CHARG, :TX_DOC_EMISSA, :FOR_A' +
        'GENT_AUT, '
      
        '   :FOR_AGENT, :AS_AGENT, :DT_EMISSAO, :IN_CARTA_CRED, :CD_USUAR' +
        'IO_ALT, '
      '   :IN_IMPRESSAO, :NR_MASTER, :NR_HOUSE)')
    DeleteSQL.Strings = (
      'delete from TEMISSAO_CONHECIMENTO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 609
    Top = 62
  end
end
