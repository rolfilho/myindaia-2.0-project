object frm_emissao_awb: Tfrm_emissao_awb
  Left = 215
  Top = 62
  Width = 724
  Height = 480
  Caption = 'Conhecimento AWB'
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
    Width = 716
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 222
      Top = 11
      Width = 39
      Height = 13
      Caption = 'Master'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_imprimir: TSpeedButton
      Left = 73
      Top = 7
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
      Left = 143
      Top = 7
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
      Left = 107
      Top = 7
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
      Left = 12
      Top = 7
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
      Left = 40
      Top = 7
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
    object DBEdit1: TDBEdit
      Left = 269
      Top = 8
      Width = 137
      Height = 21
      Color = clMenu
      DataField = 'NR_MASTER'
      DataSource = ds_conhecimento
      ReadOnly = True
      TabOrder = 0
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 40
    Width = 716
    Height = 394
    Align = alClient
    BorderStyle = bsNone
    Color = clSilver
    ParentColor = False
    TabOrder = 1
    object Panel6: TPanel
      Left = 1
      Top = 183
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
      object DBMemo4: TDBMemo
        Left = 4
        Top = 17
        Width = 323
        Height = 74
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'calc_end_emissor'
        DataSource = ds_conhecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel7: TPanel
      Left = 334
      Top = 183
      Width = 357
      Height = 136
      BevelOuter = bvLowered
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
        Top = 92
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
        Width = 342
        Height = 73
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'calc_account_inf'
        DataSource = ds_conhecimento
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
        Top = 108
        Width = 344
        Height = 21
        Color = clInfoBk
        DataField = 'TYPE_SERVICE'
        DataSource = ds_conhecimento
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
      Left = 2
      Top = 278
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
        DataField = 'CD_IATA'
        DataSource = ds_conhecimento
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
      Left = 166
      Top = 278
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
        DataSource = ds_conhecimento
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
      Left = 0
      Top = 319
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
      object DBEdit5: TDBEdit
        Left = 6
        Top = 17
        Width = 322
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'calc_rota'
        DataSource = ds_conhecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel11: TPanel
      Left = 333
      Top = 319
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
      Left = 446
      Top = 319
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
      Left = 628
      Top = 319
      Width = 64
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 7
    end
    object Panel14: TPanel
      Left = 2
      Top = 364
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
        DataField = 'calc_escala1'
        DataSource = ds_conhecimento
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
      Left = 44
      Top = 364
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
        DataField = 'APELIDO'
        DataSource = ds_conhecimento
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
      Left = 335
      Top = 364
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
        DataField = 'AP_MOEDA'
        DataSource = ds_conhecimento
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
      Left = 195
      Top = 364
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
        DataField = 'calc_escala2'
        DataSource = ds_conhecimento
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
      Left = 230
      Top = 364
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
        DataField = 'SIGLA_CIA_TRANSP'
        DataSource = ds_conhecimento
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
      Left = 264
      Top = 364
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
        DataField = 'calc_escala3'
        DataSource = ds_conhecimento
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
      Left = 299
      Top = 364
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
        DataSource = ds_conhecimento
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
      Left = 392
      Top = 364
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
        DataField = 'calc_tp_frete'
        DataSource = ds_conhecimento
      end
    end
    object Panel22: TPanel
      Left = 432
      Top = 364
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
      Left = 547
      Top = 364
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
        DataField = 'VL_CARRIAGE'
        DataSource = ds_conhecimento
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
      Left = 616
      Top = 364
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
        DataField = 'VL_CUSTOMS'
        DataSource = ds_conhecimento
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
      Left = 1
      Top = 415
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
      object DBEdit25: TDBEdit
        Left = 4
        Top = 19
        Width = 161
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'NM_PORTO'
        DataSource = ds_conhecimento
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
      Left = 170
      Top = 415
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
        DataField = 'calc_voo_data'
        DataSource = ds_conhecimento
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
      Left = 253
      Top = 415
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
        DataField = 'calc_voo_data2'
        DataSource = ds_conhecimento
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
      Left = 336
      Top = 415
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
        DataSource = ds_conhecimento
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
      Left = 469
      Top = 415
      Width = 223
      Height = 45
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 23
    end
    object Panel31: TPanel
      Left = 2
      Top = 461
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
        DataField = 'DESCR_INGLES'
        DataSource = ds_conhecimento
        TabOrder = 0
        OnChange = DBMemo5Change
      end
    end
    object Panel32: TPanel
      Left = 3
      Top = 543
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
        DataField = 'QTD_VOLUME'
        DataSource = ds_conhecimento
        TabOrder = 0
      end
    end
    object Panel33: TPanel
      Left = 98
      Top = 543
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
        DataField = 'VL_PESO_BRUTO'
        DataSource = ds_conhecimento
        TabOrder = 0
      end
    end
    object Panel34: TPanel
      Left = 194
      Top = 542
      Width = 127
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
        DataField = 'CHARGEABLE'
        DataSource = ds_conhecimento
        TabOrder = 0
      end
    end
    object Panel35: TPanel
      Left = 4
      Top = 588
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
        DataField = 'VL_TARIFA_FRETE'
        DataSource = ds_conhecimento
        TabOrder = 0
      end
    end
    object Panel36: TPanel
      Left = 133
      Top = 588
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
        DataField = 'calc_tt_frete_master'
        DataSource = ds_conhecimento
        TabOrder = 0
      end
    end
    object Panel37: TPanel
      Left = 404
      Top = 544
      Width = 289
      Height = 208
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
        OnClick = SpeedButton2Click
      end
      object dbmemo_nature: TDBMemo
        Left = 4
        Top = 18
        Width = 280
        Height = 186
        Color = clInfoBk
        DataField = 'TX_DESCR'
        DataSource = ds_conhecimento
        ScrollBars = ssVertical
        TabOrder = 0
        OnChange = DBMemo5Change
      end
    end
    object Panel38: TPanel
      Left = 4
      Top = 633
      Width = 256
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
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'calc_tt_frete_pp'
        DataSource = ds_conhecimento
        TabOrder = 0
      end
      object dbedt_frete_cc: TDBEdit
        Left = 134
        Top = 33
        Width = 114
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'calc_tt_frete_cc'
        DataSource = ds_conhecimento
        TabOrder = 1
      end
      object DBEdit8: TDBEdit
        Left = 133
        Top = 68
        Width = 115
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        DataSource = ds_conhecimento
        TabOrder = 2
      end
      object DBEdit9: TDBEdit
        Left = 7
        Top = 69
        Width = 114
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        DataSource = ds_conhecimento
        TabOrder = 3
      end
      object DBEdit10: TDBEdit
        Left = 133
        Top = 104
        Width = 115
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        DataSource = ds_conhecimento
        TabOrder = 4
      end
      object DBEdit11: TDBEdit
        Left = 6
        Top = 104
        Width = 115
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        DataSource = ds_conhecimento
        TabOrder = 5
      end
      object dbedt_collect_cia: TDBEdit
        Left = 137
        Top = 181
        Width = 112
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'calc_due_carrier_cc'
        DataSource = ds_conhecimento
        TabOrder = 6
      end
      object dbedt_prepaid_cia: TDBEdit
        Left = 6
        Top = 181
        Width = 115
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'calc_due_carrier_pp'
        DataSource = ds_conhecimento
        TabOrder = 7
      end
      object dbedt_collect_ag: TDBEdit
        Left = 135
        Top = 141
        Width = 114
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'calc_cc_agente'
        DataSource = ds_conhecimento
        TabOrder = 8
      end
      object dbedt_prepaid_ag: TDBEdit
        Left = 6
        Top = 142
        Width = 115
        Height = 21
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'calc_pp_agente'
        DataSource = ds_conhecimento
        TabOrder = 9
      end
    end
    object Panel39: TPanel
      Left = 5
      Top = 845
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
        DataField = 'calc_master_pp'
        DataSource = ds_conhecimento
        TabOrder = 0
      end
      object DBEdit13: TDBEdit
        Left = 137
        Top = 17
        Width = 112
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'calc_master_cc'
        DataSource = ds_conhecimento
        TabOrder = 1
      end
    end
    object Panel40: TPanel
      Left = 263
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
        DataField = 'calc_item'
        DataSource = ds_conhecimento
        TabOrder = 0
      end
    end
    object Panel41: TPanel
      Left = 264
      Top = 845
      Width = 430
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
      object DBText4: TDBText
        Left = 182
        Top = 4
        Width = 243
        Height = 17
        DataField = 'NM_CLIENTE'
        DataSource = ds_conhecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 40
        Top = 35
        Width = 333
        Height = 17
        DataField = 'NM_CLIENTE'
        DataSource = ds_conhecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label69: TLabel
        Left = 39
        Top = 44
        Width = 336
        Height = 13
        Caption = 
          '................................................................' +
          '................................................'
        Transparent = True
      end
      object Label70: TLabel
        Left = 14
        Top = 66
        Width = 92
        Height = 13
        Caption = 'AS AGENTS FOR: '
      end
      object DBText6: TDBText
        Left = 110
        Top = 62
        Width = 301
        Height = 17
        DataField = 'DESCRICAO'
        DataSource = ds_conhecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText9: TDBText
        Left = 18
        Top = 83
        Width = 65
        Height = 17
        DataField = 'DT_EMISSAO_DTA'
        DataSource = ds_conhecimento
      end
    end
    object Panel42: TPanel
      Left = 432
      Top = 381
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
        DataField = 'calc_frete_confir_pp'
        DataSource = ds_conhecimento
      end
    end
    object Panel43: TPanel
      Left = 462
      Top = 381
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
        DataField = 'calc_frete_confir_cc'
        DataSource = ds_conhecimento
      end
    end
    object Panel23: TPanel
      Left = 490
      Top = 364
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
      Left = 490
      Top = 380
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
        Color = clSilver
        DataField = 'calc_tp_other_pp'
        DataSource = ds_conhecimento
        ParentColor = False
      end
    end
    object Panel45: TPanel
      Left = 520
      Top = 380
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
        DataField = 'calc_tp_other_cc'
        DataSource = ds_conhecimento
      end
    end
    object Panel46: TPanel
      Left = 262
      Top = 589
      Width = 142
      Height = 162
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
        DataSource = ds_conhecimento
        TabOrder = 0
        OnChange = DBMemo5Change
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 93
      Width = 332
      Height = 89
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 41
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
      object DBMemo3: TDBMemo
        Left = 4
        Top = 18
        Width = 323
        Height = 68
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'calc_end_agente'
        DataSource = ds_conhecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 335
      Top = 93
      Width = 357
      Height = 89
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 42
    end
    object Panel3: TPanel
      Left = 335
      Top = 1
      Width = 357
      Height = 90
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 43
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
      object DBMemo2: TDBMemo
        Left = 5
        Top = 16
        Width = 340
        Height = 69
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'calc_end_cia'
        DataSource = ds_conhecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 332
      Height = 90
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 44
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
      object DBMemo1: TDBMemo
        Left = 4
        Top = 22
        Width = 323
        Height = 63
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'calc_end_shipper'
        DataSource = ds_conhecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel47: TPanel
      Left = 321
      Top = 542
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
      end
    end
  end
  object qry_conhecimento_: TQuery
    CachedUpdates = True
    AfterPost = qry_conhecimento_AfterPost
    OnCalcFields = qry_conhecimento_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.NR_PROCESSO,'
      
        '  TM.CD_MASTER, TM.CD_UNID_NEG, TM.CD_PRODUTO, TM.CD_VIA_TRANSP,' +
        '  TI.SIGLA_CIA_TRANSP,'
      
        '  TM.NR_MASTER, TM.CD_AGENTE, TM.CD_MOEDA, TM.CD_CIA_TRANSP, P.S' +
        'T_INSURANCE, P.VL_CARRIAGE, P.VL_CUSTOMS,'
      
        '  TM.CD_ORIGEM, TM.NR_VOO, TM.CD_DESTINO, TM.ESCALA1, TM.ESCALA2' +
        ',  TM.DT_EMBARQUE,'
      
        '  P.TP_FRETE, P.QTD_VOLUME, P.VL_PESO_BRUTO, P.CHARGEABLE, P.DES' +
        'CR_INGLES, P.VL_FRETE,'
      
        '  P.VL_TARIFA_FRETE, TM.DT_PREV_SAIDA,TMO.AP_MOEDA, TM.DT_EMISSA' +
        'O_DTA, P.TYPE_SERVICE,  TM.ESCALA1_NR_VOO,'
      
        '  TU.NM_UNID_NEG, TU.CGC_UNID_NEG, TU.END_UNID_NEG, TU.END_NUMER' +
        'O, TU.END_COMPL, TU.CD_IATA,'
      
        '  TU.END_CIDADE, TU.END_UF,  TA.DS_ENDERECO,   TPA.NM_PAIS_ING, ' +
        'P.TX_DESCR,TI.END_COMPL_CIA_TRANSP,'
      
        '  TI.DESCRICAO, TI.END_CIA_TRANSP, TI.APELIDO, TDE.NM_PORTO, P.T' +
        'X_DOC_EMISSA, TI.NR_ACCOUNT AS ACCOUNT_TRANSP,'
      
        '  (SELECT TL.DESCRICAO FROM TLOCAL_EMBARQUE TL WHERE TL.CODIGO =' +
        ' TI.CD_CIDADE)NM_CID_CIA, TM.DT_PREV_ESCALA1,'
      
        '  (SELECT TPC.NM_PAIS_ING FROM TPAIS_BROKER TPC WHERE TPC.CD_PAI' +
        'S = TI.CD_PAIS)NM_PAIS_CIA,'
      
        '  TN.NM_EMPRESA AS NM_CLIENTE, TN.END_EMPRESA AS END_CLIENTE, TN' +
        '.END_NUMERO AS NUMERO_CLIENTE, TN.NR_ACCOUNT AS ACCOUNT_CLIENTE,'
      
        '  TN.END_CIDADE AS CIDADE_CLIENTE, TN.END_CEP AS CEP_CLIENTE, TN' +
        '.END_UF AS UF_CLIENTE, TN.CGC_EMPRESA AS CGC_CLIENTE,'
      
        '  TOR.CD_SIGLA, TOR.NM_PORTO AS NM_ORIGEM, TDE.CD_SIGLA, TESC1.C' +
        'D_SIGLA, TESC2.CD_SIGLA,'
      
        '  TE.NM_EMPRESA AS NM_IMP, TE.END_EMPRESA AS END_IMP, TE.END_NUM' +
        'ERO AS NUMERO_IMP, TE.END_COMPL AS COMPL_IMP,'
      
        '  TE.END_CIDADE AS CIDADE_IMP,TE.NR_ACCOUNT AS ACCOUNT_EST, TE.E' +
        'ND_ESTADO AS ESTADO_IMP, TE.CD_PAIS,TPE.NM_PAIS AS PAIS_IMP'
      'FROM TPROCESSO P'
      '  LEFT JOIN  THOUSE H ON (H.NR_PROCESSO = P.NR_PROCESSO)'
      '  LEFT JOIN TMASTER TM ON (TM.CD_MASTER = H.CD_MASTER)'
      '  LEFT JOIN TEMPRESA_NAC TN ON (TN.CD_EMPRESA = P.CD_CLIENTE)'
      '  LEFT JOIN TAGENTE TA ON (TA.CD_AGENTE = P.CD_AGENTE)'
      '  LEFT JOIN TEMPRESA_EST TE ON (TE.CD_EMPRESA = P.CD_EMP_EST)'
      
        '  LEFT JOIN TTRANSPORTADOR_ITL TI ON (TI.CODIGO = TM.CD_CIA_TRAN' +
        'SP)'
      
        '  LEFT JOIN TMOEDA_BROKER TMO ON (TMO.CD_MOEDA = P.CD_MOEDA_FRET' +
        'E)'
      '  LEFT JOIN TUNID_NEG TU ON (TU.CD_UNID_NEG = '#39'01'#39')'
      '  LEFT JOIN TPORTO TOR ON (TOR.CD_PORTO = P.CD_ORIGEM)'
      '  LEFT JOIN TPORTO TDE ON (TDE.CD_PORTO = P.CD_DESTINO)'
      '  LEFT JOIN TPORTO TESC1 ON (TESC1.CD_PORTO =TM.ESCALA1)'
      '  LEFT JOIN TPORTO TESC2 ON (TESC2.CD_PORTO = TM.ESCALA2)'
      '  LEFT JOIN TPAIS_BROKER TPA ON(TU.CD_PAIS = TPA.CD_PAIS)'
      '  LEFT JOIN TPAIS_BROKER TPE ON(TPE.CD_PAIS = TE.CD_PAIS)'
      '   WHERE  P.NR_PROCESSO = :NR_PROCESSO'
      
        '     AND P.CD_UNID_NEG=:CD_UNID_NEG AND P.CD_PRODUTO = :CD_PRODU' +
        'TO'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpDateMas
    Left = 576
    Top = 313
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_conhecimento_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_conhecimento_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_conhecimento_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_conhecimento_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 14
    end
    object qry_conhecimento_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_conhecimento_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_conhecimento_CD_CIA_TRANSP: TStringField
      FieldName = 'CD_CIA_TRANSP'
      FixedChar = True
      Size = 4
    end
    object qry_conhecimento_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_conhecimento_NR_VOO: TStringField
      FieldName = 'NR_VOO'
      FixedChar = True
      Size = 14
    end
    object qry_conhecimento_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_conhecimento_ESCALA1: TStringField
      FieldName = 'ESCALA1'
      FixedChar = True
      Size = 4
    end
    object qry_conhecimento_ESCALA2: TStringField
      FieldName = 'ESCALA2'
      FixedChar = True
      Size = 4
    end
    object qry_conhecimento_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_conhecimento_DT_PREV_SAIDA: TDateTimeField
      FieldName = 'DT_PREV_SAIDA'
    end
    object qry_conhecimento_calc_voo_data: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_voo_data'
      Size = 15
      Calculated = True
    end
    object qry_conhecimento_calc_tp_master: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_master'
      Size = 2
      Calculated = True
    end
    object qry_conhecimento_calc_tp_other_cc: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_other_cc'
      Size = 2
      Calculated = True
    end
    object qry_conhecimento_calc_tp_other_pp: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_other_pp'
      Size = 2
      Calculated = True
    end
    object qry_conhecimento_calc_tp_frete: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_frete'
      Size = 2
      Calculated = True
    end
    object qry_conhecimento_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_conhecimento_CGC_UNID_NEG: TStringField
      FieldName = 'CGC_UNID_NEG'
      FixedChar = True
      Size = 14
    end
    object qry_conhecimento_END_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_conhecimento_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_conhecimento_END_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
    end
    object qry_conhecimento_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_conhecimento_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_conhecimento_NM_PAIS_ING: TStringField
      FieldName = 'NM_PAIS_ING'
      FixedChar = True
      Size = 50
    end
    object qry_conhecimento_DS_ENDERECO: TStringField
      FieldName = 'DS_ENDERECO'
      FixedChar = True
      Size = 255
    end
    object qry_conhecimento_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qry_conhecimento_END_CIA_TRANSP: TStringField
      FieldName = 'END_CIA_TRANSP'
      FixedChar = True
      Size = 100
    end
    object qry_conhecimento_APELIDO: TStringField
      FieldName = 'APELIDO'
      FixedChar = True
    end
    object qry_conhecimento_NM_CID_CIA: TStringField
      FieldName = 'NM_CID_CIA'
      FixedChar = True
      Size = 50
    end
    object qry_conhecimento_NM_PAIS_CIA: TStringField
      FieldName = 'NM_PAIS_CIA'
      FixedChar = True
      Size = 50
    end
    object qry_conhecimento_CD_SIGLA: TStringField
      FieldName = 'CD_SIGLA'
      FixedChar = True
      Size = 3
    end
    object qry_conhecimento_CD_SIGLA_1: TStringField
      FieldName = 'CD_SIGLA_1'
      FixedChar = True
      Size = 3
    end
    object qry_conhecimento_CD_SIGLA_2: TStringField
      FieldName = 'CD_SIGLA_2'
      FixedChar = True
      Size = 3
    end
    object qry_conhecimento_CD_SIGLA_3: TStringField
      FieldName = 'CD_SIGLA_3'
      FixedChar = True
      Size = 3
    end
    object qry_conhecimento_calc_end_shipper: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_end_shipper'
      Size = 200
      Calculated = True
    end
    object qry_conhecimento_calc_end_agente: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_end_agente'
      Size = 200
      Calculated = True
    end
    object qry_conhecimento_calc_end_emissor: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_end_emissor'
      Size = 200
      Calculated = True
    end
    object qry_conhecimento_calc_rota: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_rota'
      Size = 50
      Calculated = True
    end
    object qry_conhecimento_NM_PORTO: TStringField
      FieldName = 'NM_PORTO'
      FixedChar = True
      Size = 50
    end
    object qry_conhecimento_calc_tt_frete_master: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_tt_frete_master'
      DisplayFormat = '0.0'
      Calculated = True
    end
    object qry_conhecimento_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_conhecimento_calc_item: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_item'
      Size = 150
      Calculated = True
    end
    object qry_conhecimento_calc_account_inf: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_account_inf'
      Size = 80
      Calculated = True
    end
    object qry_conhecimento_calc_pp_agente: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_pp_agente'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qry_conhecimento_calc_cc_agente: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_cc_agente'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qry_conhecimento_calc_st_insurance: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_st_insurance'
      Size = 10
      Calculated = True
    end
    object qry_conhecimento_calc_vl_carriage: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_carriage'
      Size = 6
      Calculated = True
    end
    object qry_conhecimento_calc_vl_customs: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_customs'
      Size = 6
      Calculated = True
    end
    object qry_conhecimento_calc_end_cia: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_end_cia'
      Size = 80
      Calculated = True
    end
    object qry_conhecimento_ST_INSURANCE: TStringField
      FieldName = 'ST_INSURANCE'
      FixedChar = True
    end
    object qry_conhecimento_VL_CARRIAGE: TStringField
      FieldName = 'VL_CARRIAGE'
      FixedChar = True
      Size = 10
    end
    object qry_conhecimento_VL_CUSTOMS: TStringField
      FieldName = 'VL_CUSTOMS'
      FixedChar = True
      Size = 10
    end
    object qry_conhecimento_CD_IATA: TStringField
      FieldName = 'CD_IATA'
      FixedChar = True
      Size = 15
    end
    object qry_conhecimento_DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
    end
    object qry_conhecimento_calc_escala1: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_escala1'
      Size = 3
      Calculated = True
    end
    object qry_conhecimento_calc_escala2: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_escala2'
      Size = 3
      Calculated = True
    end
    object qry_conhecimento_calc_escala3: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_escala3'
      Size = 3
      Calculated = True
    end
    object qry_conhecimento_calc_frete_confir_cc: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_frete_confir_cc'
      Size = 2
      Calculated = True
    end
    object qry_conhecimento_calc_frete_confir_pp: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_frete_confir_pp'
      Size = 2
      Calculated = True
    end
    object qry_conhecimento_calc_due_carrier_cc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_due_carrier_cc'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qry_conhecimento_calc_due_carrier_pp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_due_carrier_pp'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qry_conhecimento_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_conhecimento_TX_DESCR: TStringField
      FieldName = 'TX_DESCR'
      FixedChar = True
      Size = 255
    end
    object qry_conhecimento_DESCR_INGLES: TStringField
      FieldName = 'DESCR_INGLES'
      FixedChar = True
      Size = 255
    end
    object qry_conhecimento_QTD_VOLUME: TFloatField
      FieldName = 'QTD_VOLUME'
    end
    object qry_conhecimento_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qry_conhecimento_CHARGEABLE: TFloatField
      FieldName = 'CHARGEABLE'
    end
    object qry_conhecimento_VL_TARIFA_FRETE: TFloatField
      FieldName = 'VL_TARIFA_FRETE'
    end
    object qry_conhecimento_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_conhecimento_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_conhecimento_END_CLIENTE: TStringField
      FieldName = 'END_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_conhecimento_NUMERO_CLIENTE: TStringField
      FieldName = 'NUMERO_CLIENTE'
      FixedChar = True
      Size = 6
    end
    object qry_conhecimento_CIDADE_CLIENTE: TStringField
      FieldName = 'CIDADE_CLIENTE'
      FixedChar = True
      Size = 30
    end
    object qry_conhecimento_CEP_CLIENTE: TStringField
      FieldName = 'CEP_CLIENTE'
      FixedChar = True
      Size = 8
    end
    object qry_conhecimento_UF_CLIENTE: TStringField
      FieldName = 'UF_CLIENTE'
      FixedChar = True
      Size = 2
    end
    object qry_conhecimento_CGC_CLIENTE: TStringField
      FieldName = 'CGC_CLIENTE'
      FixedChar = True
      Size = 14
    end
    object qry_conhecimento_NM_IMP: TStringField
      FieldName = 'NM_IMP'
      FixedChar = True
      Size = 60
    end
    object qry_conhecimento_END_IMP: TStringField
      FieldName = 'END_IMP'
      FixedChar = True
      Size = 60
    end
    object qry_conhecimento_NUMERO_IMP: TStringField
      FieldName = 'NUMERO_IMP'
      FixedChar = True
      Size = 6
    end
    object qry_conhecimento_COMPL_IMP: TStringField
      FieldName = 'COMPL_IMP'
      FixedChar = True
      Size = 41
    end
    object qry_conhecimento_CIDADE_IMP: TStringField
      FieldName = 'CIDADE_IMP'
      FixedChar = True
      Size = 30
    end
    object qry_conhecimento_ESTADO_IMP: TStringField
      FieldName = 'ESTADO_IMP'
      FixedChar = True
      Size = 30
    end
    object qry_conhecimento_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_conhecimento_PAIS_IMP: TStringField
      FieldName = 'PAIS_IMP'
      FixedChar = True
      Size = 120
    end
    object qry_conhecimento_TX_DOC_EMISSA: TMemoField
      FieldName = 'TX_DOC_EMISSA'
      BlobType = ftMemo
    end
    object qry_conhecimento_NM_ORIGEM: TStringField
      FieldName = 'NM_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qry_conhecimento_calc_tt_frete_cc: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'calc_tt_frete_cc'
      Size = 10
      Calculated = True
    end
    object qry_conhecimento_calc_tt_frete_pp: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'calc_tt_frete_pp'
      Size = 10
      Calculated = True
    end
    object qry_conhecimento_calc_master_pp: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'calc_master_pp'
      Size = 10
      Calculated = True
    end
    object qry_conhecimento_calc_master_cc: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'calc_master_cc'
      Size = 10
      Calculated = True
    end
    object qry_conhecimento_calc_class_rate: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_class_rate'
      Size = 1
      Calculated = True
    end
    object qry_conhecimento_calc_nm_usuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_usuario'
      Size = 50
      Calculated = True
    end
    object qry_conhecimento_ACCOUNT_TRANSP: TStringField
      FieldName = 'ACCOUNT_TRANSP'
      FixedChar = True
      Size = 14
    end
    object qry_conhecimento_ACCOUNT_CLIENTE: TStringField
      FieldName = 'ACCOUNT_CLIENTE'
      FixedChar = True
      Size = 14
    end
    object qry_conhecimento_ACCOUNT_EST: TStringField
      FieldName = 'ACCOUNT_EST'
      FixedChar = True
      Size = 14
    end
    object qry_conhecimento_END_COMPL_CIA_TRANSP: TStringField
      FieldName = 'END_COMPL_CIA_TRANSP'
      FixedChar = True
      Size = 100
    end
    object qry_conhecimento_DT_EMISSAO_DTA: TDateTimeField
      FieldName = 'DT_EMISSAO_DTA'
    end
    object qry_conhecimento_TYPE_SERVICE: TStringField
      FieldName = 'TYPE_SERVICE'
      FixedChar = True
      Size = 40
    end
    object qry_conhecimento_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      DisplayFormat = '0.00'
    end
    object qry_conhecimento_calc_voo_data2: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_voo_data2'
      Size = 10
      Calculated = True
    end
    object qry_conhecimento_ESCALA1_NR_VOO: TStringField
      FieldName = 'ESCALA1_NR_VOO'
      FixedChar = True
      Size = 14
    end
    object qry_conhecimento_DT_PREV_ESCALA1: TDateTimeField
      FieldName = 'DT_PREV_ESCALA1'
    end
    object qry_conhecimento_SIGLA_CIA_TRANSP: TStringField
      FieldName = 'SIGLA_CIA_TRANSP'
      FixedChar = True
      Size = 3
    end
    object qry_conhecimento_calc_tt_reais: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_tt_reais'
      Calculated = True
    end
  end
  object ds_conhecimento: TDataSource
    DataSet = qry_conhecimento_
    Left = 632
    Top = 313
  end
  object font_meno: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 644
    Top = 283
  end
  object UpDateMas: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  NR_VOO = :NR_VOO,'
      '  DT_EMBARQUE = :DT_EMBARQUE,'
      '  VL_PESO_BRUTO = :VL_PESO_BRUTO,'
      '  TP_FRETE = :TP_FRETE,'
      '  CD_ORIGEM = :CD_ORIGEM,'
      '  CD_DESTINO = :CD_DESTINO,'
      '  DESCR_INGLES = :DESCR_INGLES,'
      '  CD_CIA_TRANSP = :CD_CIA_TRANSP,'
      '  QTD_VOLUME = :QTD_VOLUME,'
      '  CHARGEABLE = :CHARGEABLE,'
      '  TX_DESCR = :TX_DESCR,'
      '  VL_TARIFA_FRETE = :VL_TARIFA_FRETE,'
      '  ST_INSURANCE = :ST_INSURANCE,'
      '  VL_CARRIAGE = :VL_CARRIAGE,'
      '  VL_CUSTOMS = :VL_CUSTOMS,'
      '  TX_DOC_EMISSA = :TX_DOC_EMISSA,'
      '  TYPE_SERVICE = :TYPE_SERVICE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPROCESSO'
      
        '  (NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_AGENTE, NR_VOO, DT_E' +
        'MBARQUE, '
      
        '   VL_PESO_BRUTO, TP_FRETE, CD_ORIGEM, CD_DESTINO, DESCR_INGLES,' +
        ' CD_CIA_TRANSP, '
      
        '   QTD_VOLUME, CHARGEABLE, TX_DESCR, VL_TARIFA_FRETE, ST_INSURAN' +
        'CE, VL_CARRIAGE, '
      '   VL_CUSTOMS, TX_DOC_EMISSA, TYPE_SERVICE)'
      'values'
      
        '  (:NR_PROCESSO, :CD_UNID_NEG, :CD_PRODUTO, :CD_AGENTE, :NR_VOO,' +
        ' :DT_EMBARQUE, '
      
        '   :VL_PESO_BRUTO, :TP_FRETE, :CD_ORIGEM, :CD_DESTINO, :DESCR_IN' +
        'GLES, :CD_CIA_TRANSP, '
      
        '   :QTD_VOLUME, :CHARGEABLE, :TX_DESCR, :VL_TARIFA_FRETE, :ST_IN' +
        'SURANCE, '
      '   :VL_CARRIAGE, :VL_CUSTOMS, :TX_DOC_EMISSA, :TYPE_SERVICE)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 530
    Top = 309
  end
  object MainMenu1: TMainMenu
    Left = 656
    Top = 180
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
    Left = 536
    Top = 244
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
    Left = 576
    Top = 244
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = ds_conhecimento
    UserName = 'BDEPipeline1'
    Left = 616
    Top = 244
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 644
    Top = 283
  end
  object MainMenu2: TMainMenu
    Left = 656
    Top = 180
    object MenuItem1: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = btn_salvarClick
    end
    object MenuItem2: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
    end
    object MenuItem3: TMenuItem
      Caption = '&Imprimir'
    end
    object MenuItem4: TMenuItem
      Caption = '&Designe'
    end
    object TMenuItem
    end
    object MenuItem5: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object ppReport2: TppReport
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
    Left = 536
    Top = 244
    Version = '5.56'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    Position = poScreenCenter
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.SQLType = sqBDELocal
    Report = ppReport2
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 576
    Top = 244
  end
  object ppBDEPipeline2: TppBDEPipeline
    UserName = 'BDEPipeline2'
    Left = 616
    Top = 244
  end
end
