object frm_emissao_bl: Tfrm_emissao_bl
  Left = 258
  Top = 52
  Width = 712
  Height = 515
  Caption = 'Emiss'#227'o BL'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 172
      Top = 13
      Width = 42
      Height = 13
      Caption = 'B/L No'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_imprimir: TSpeedButton
      Left = 61
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
      Left = 136
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
      Left = 111
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
      Left = 34
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
    object lb_as_agreed: TLabel
      Left = 492
      Top = 6
      Width = 78
      Height = 26
      Caption = '    AS PER'#13#10'AGREEMENT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lb_carta_credito: TLabel
      Left = 586
      Top = 12
      Width = 105
      Height = 13
      Caption = 'CARTA  CR'#201'DITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btn_carta_cred: TSpeedButton
      Left = 86
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Carta de Cr'#233'dito'
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
    object DBEdit1: TDBEdit
      Left = 219
      Top = 10
      Width = 116
      Height = 21
      Color = clMenu
      DataField = 'NR_HOUSE'
      DataSource = ds_emissao
      ReadOnly = True
      TabOrder = 0
    end
    object rdgrp_original: TRadioGroup
      Left = 343
      Top = 1
      Width = 140
      Height = 32
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Original'
        'Copy')
      ParentFont = False
      TabOrder = 1
      OnClick = rdgrp_originalClick
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 40
    Width = 704
    Height = 448
    Align = alClient
    Color = clSilver
    ParentColor = False
    TabOrder = 1
    object Panel2: TPanel
      Left = 4
      Top = 5
      Width = 335
      Height = 90
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 0
      object Label23: TLabel
        Left = 6
        Top = 4
        Width = 44
        Height = 13
        Caption = 'Shipper'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbmemo_shipper: TDBMemo
        Left = 4
        Top = 18
        Width = 323
        Height = 69
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'END_SHIPPER'
        DataSource = ds_emissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        WordWrap = False
        OnChange = DBMemo6Change
      end
    end
    object Panel3: TPanel
      Left = 340
      Top = 5
      Width = 339
      Height = 90
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 1
      object Label3: TLabel
        Left = 6
        Top = 4
        Width = 123
        Height = 13
        Caption = 'Consigned to order of'
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
        DataField = 'END_CONSIGNED'
        DataSource = ds_emissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnChange = DBMemo6Change
      end
    end
    object Panel4: TPanel
      Left = 4
      Top = 96
      Width = 335
      Height = 90
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 2
      object Label4: TLabel
        Left = 6
        Top = 4
        Width = 82
        Height = 13
        Caption = 'Notify address'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbmemo_notify: TDBMemo
        Left = 4
        Top = 18
        Width = 323
        Height = 68
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'END_NOTIFY'
        DataSource = ds_emissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        WordWrap = False
        OnChange = DBMemo6Change
      end
    end
    object Panel5: TPanel
      Left = 4
      Top = 277
      Width = 206
      Height = 42
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 3
      object Label5: TLabel
        Left = 6
        Top = 2
        Width = 78
        Height = 13
        Caption = 'Ocean vessel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 7
        Top = 18
        Width = 193
        Height = 17
        DataField = 'VESSEL'
        DataSource = ds_emissao
      end
    end
    object Panel6: TPanel
      Left = 516
      Top = 225
      Width = 162
      Height = 48
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 4
      object Label6: TLabel
        Left = 3
        Top = 1
        Width = 91
        Height = 13
        Caption = 'Place of receipt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_port_receipt: TDBEdit
        Left = 4
        Top = 19
        Width = 155
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'PORT_RECEPT'
        DataSource = ds_emissao
        ReadOnly = True
        TabOrder = 0
        OnChange = DBMemo6Change
      end
    end
    object Panel7: TPanel
      Left = 341
      Top = 277
      Width = 174
      Height = 41
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 5
      object Label7: TLabel
        Left = 6
        Top = 4
        Width = 98
        Height = 13
        Caption = 'Port of discharge'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_port_discharge: TDBEdit
        Left = 4
        Top = 18
        Width = 165
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'PORT_DISCHARGE'
        DataSource = ds_emissao
        ReadOnly = True
        TabOrder = 0
        OnChange = DBMemo6Change
      end
    end
    object Panel8: TPanel
      Left = 517
      Top = 276
      Width = 162
      Height = 42
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 6
      object Label8: TLabel
        Left = 6
        Top = 4
        Width = 96
        Height = 13
        Caption = 'Place of delivery'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_port_delivery: TDBEdit
        Left = 4
        Top = 19
        Width = 155
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'PORT_DELYVERY'
        DataSource = ds_emissao
        ReadOnly = True
        TabOrder = 0
        OnChange = DBMemo6Change
      end
    end
    object Panel9: TPanel
      Left = 369
      Top = 187
      Width = 146
      Height = 37
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 7
      object Label9: TLabel
        Left = 3
        Top = 2
        Width = 141
        Height = 13
        Caption = 'Number of Original B/L'#180's'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_number_original: TDBEdit
        Left = 48
        Top = 16
        Width = 32
        Height = 21
        Color = clInfoBk
        DataField = 'NUMBER_ORIGINAL'
        DataSource = ds_emissao
        TabOrder = 0
        OnExit = dbedt_number_originalExit
      end
    end
    object Panel10: TPanel
      Left = 4
      Top = 320
      Width = 150
      Height = 225
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 8
      object Label11: TLabel
        Left = 6
        Top = 4
        Width = 113
        Height = 13
        Caption = 'Marks and Numbers'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBMemo7: TDBMemo
        Left = 4
        Top = 18
        Width = 141
        Height = 203
        Color = clInfoBk
        DataField = 'STR_MARKS'
        DataSource = ds_emissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DBMemo6Change
      end
    end
    object Panel11: TPanel
      Left = 157
      Top = 320
      Width = 183
      Height = 226
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 9
      object Label12: TLabel
        Left = 6
        Top = 4
        Width = 173
        Height = 13
        Caption = 'Number and Kind of Packages'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBMemo6: TDBMemo
        Left = 2
        Top = 18
        Width = 175
        Height = 203
        Color = clInfoBk
        DataField = 'NUMBER_PACKAGE'
        DataSource = ds_emissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DBMemo6Change
      end
    end
    object Panel12: TPanel
      Left = 595
      Top = 321
      Width = 85
      Height = 53
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 10
      object Label13: TLabel
        Left = 2
        Top = 4
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
      object DBText7: TDBText
        Left = 4
        Top = 20
        Width = 72
        Height = 17
        Alignment = taRightJustify
        DataField = 'GROSS_WEIGHT'
        DataSource = ds_emissao
      end
    end
    object Panel13: TPanel
      Left = 595
      Top = 376
      Width = 85
      Height = 53
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 11
      object Label14: TLabel
        Left = 3
        Top = 4
        Width = 76
        Height = 13
        Caption = 'Measurement'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText8: TDBText
        Left = 5
        Top = 20
        Width = 70
        Height = 17
        Alignment = taRightJustify
        DataField = 'CUBAGEM'
        DataSource = ds_emissao
      end
    end
    object Panel14: TPanel
      Left = 342
      Top = 320
      Width = 251
      Height = 226
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 12
      object Label15: TLabel
        Left = 6
        Top = 4
        Width = 118
        Height = 13
        Caption = 'Description of goods'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbmemo_desc: TDBMemo
        Left = 4
        Top = 18
        Width = 242
        Height = 203
        Color = clInfoBk
        DataField = 'DESCRIPTION_GOODS'
        DataSource = ds_emissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = dbmemo_descChange
      end
    end
    object Panel16: TPanel
      Left = 4
      Top = 547
      Width = 150
      Height = 161
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 13
      object Label17: TLabel
        Left = 17
        Top = 4
        Width = 115
        Height = 13
        Caption = 'Freight and Charges'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBMemo9: TDBMemo
        Left = 3
        Top = 18
        Width = 143
        Height = 138
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'FREIGHT_CHARGES'
        DataSource = ds_emissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Panel17: TPanel
      Left = 157
      Top = 547
      Width = 70
      Height = 161
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 14
      object Label18: TLabel
        Left = 9
        Top = 4
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
      object DBMemo10: TDBMemo
        Left = 5
        Top = 18
        Width = 59
        Height = 138
        Alignment = taCenter
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'CURRENCY'
        DataSource = ds_emissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Panel18: TPanel
      Left = 228
      Top = 547
      Width = 70
      Height = 161
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 15
      object Label19: TLabel
        Left = 12
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
      object DBMemo11: TDBMemo
        Left = 5
        Top = 18
        Width = 59
        Height = 138
        Alignment = taRightJustify
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'STR_PREPAID'
        DataSource = ds_emissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Panel19: TPanel
      Left = 300
      Top = 547
      Width = 70
      Height = 161
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 16
      object Label20: TLabel
        Left = 14
        Top = 2
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
      object DBMemo12: TDBMemo
        Left = 5
        Top = 18
        Width = 59
        Height = 138
        Alignment = taRightJustify
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'STR_COLLECT'
        DataSource = ds_emissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Panel20: TPanel
      Left = 516
      Top = 187
      Width = 117
      Height = 36
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 17
      object Label21: TLabel
        Left = 5
        Top = 2
        Width = 108
        Height = 13
        Caption = 'Freight Payable at:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 6
        Top = 17
        Width = 106
        Height = 16
        DataField = 'FREIGHT_PAY'
        DataSource = ds_emissao
      end
    end
    object Panel21: TPanel
      Left = 340
      Top = 96
      Width = 339
      Height = 90
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 18
      object Label22: TLabel
        Left = 6
        Top = 4
        Width = 222
        Height = 13
        Caption = 'For Delivery of Goods, please apply to:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbmemo_delivery: TDBMemo
        Left = 4
        Top = 18
        Width = 323
        Height = 68
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'END_AG_DELIVERY'
        DataSource = ds_emissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnChange = DBMemo6Change
      end
    end
    object Panel22: TPanel
      Left = 4
      Top = 186
      Width = 334
      Height = 90
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 19
      object Label2: TLabel
        Left = 6
        Top = 4
        Width = 57
        Height = 13
        Caption = 'Consignor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbmemo_consignor: TDBMemo
        Left = 4
        Top = 18
        Width = 323
        Height = 68
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'END_CONSIGNOR'
        DataSource = ds_emissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        WordWrap = False
        OnChange = DBMemo6Change
      end
    end
    object Panel23: TPanel
      Left = 211
      Top = 277
      Width = 128
      Height = 42
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 20
      object Label24: TLabel
        Left = 6
        Top = 4
        Width = 40
        Height = 13
        Caption = 'Voy N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 7
        Top = 20
        Width = 114
        Height = 17
        DataField = 'NR_VIAGEM'
        DataSource = ds_emissao
      end
    end
    object Panel24: TPanel
      Left = 372
      Top = 548
      Width = 309
      Height = 53
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 21
      object Label25: TLabel
        Left = 2
        Top = 1
        Width = 86
        Height = 13
        Caption = 'Freight Amount'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText13: TDBText
        Left = 3
        Top = 17
        Width = 207
        Height = 17
        DataField = 'FREIGHT_AMOUNT'
        DataSource = ds_emissao
      end
      object dbrgrp_st_insurance: TDBCheckBox
        Left = 176
        Top = 37
        Width = 137
        Height = 17
        Caption = 'AS PER AGREEMENT'
        DataField = 'ST_INSURANCE'
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
        Visible = False
        OnClick = DBMemo6Change
      end
    end
    object Panel25: TPanel
      Left = 372
      Top = 601
      Width = 145
      Height = 46
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 22
      object Label26: TLabel
        Left = 2
        Top = 4
        Width = 33
        Height = 13
        Caption = 'Place'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText9: TDBText
        Left = 4
        Top = 20
        Width = 136
        Height = 17
        DataField = 'PLACE'
        DataSource = ds_emissao
      end
    end
    object Panel26: TPanel
      Left = 518
      Top = 601
      Width = 146
      Height = 46
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 23
      object Label27: TLabel
        Left = 6
        Top = 4
        Width = 76
        Height = 13
        Caption = 'Date of issue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText11: TDBText
        Left = 8
        Top = 20
        Width = 72
        Height = 17
        DataField = 'DT_ISSUE'
        DataSource = ds_emissao
      end
    end
    object Panel27: TPanel
      Left = 372
      Top = 647
      Width = 145
      Height = 46
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 24
      object Label28: TLabel
        Left = 2
        Top = 4
        Width = 55
        Height = 13
        Caption = 'Signature'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText10: TDBText
        Left = 4
        Top = 20
        Width = 135
        Height = 17
        DataField = 'calc_nm_usuario'
        DataSource = ds_emissao
      end
    end
    object Panel28: TPanel
      Left = 340
      Top = 225
      Width = 175
      Height = 48
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 25
      object Label29: TLabel
        Left = 3
        Top = 1
        Width = 88
        Height = 13
        Caption = 'Port of Loading'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_port_load: TDBEdit
        Left = 4
        Top = 18
        Width = 165
        Height = 21
        BorderStyle = bsNone
        Color = clSilver
        DataField = 'PORT_LOAD'
        DataSource = ds_emissao
        ReadOnly = True
        TabOrder = 0
        OnChange = DBMemo6Change
      end
    end
    object Panel15: TPanel
      Left = 595
      Top = 431
      Width = 85
      Height = 51
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 26
      object lb_original: TLabel
        Left = 10
        Top = 6
        Width = 60
        Height = 13
        Alignment = taCenter
        Caption = 'ORIGINAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lb_not_neg: TLabel
        Left = 4
        Top = 20
        Width = 79
        Height = 26
        Caption = '      NOT '#13#10'NEGOTIABLE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
    end
  end
  object pp_conhecimento: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBROKER\conhecimento_BL.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 458
    Top = 202
    Version = '7.02'
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
  object ppDesigne: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pp_conhecimento
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 490
    Top = 202
  end
  object pp_emissao_bl: TppBDEPipeline
    DataSource = ds_emissao
    UserName = '_emissao_bl'
    Left = 522
    Top = 202
    object pp_emissao_blppField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pp_emissao_blppField2: TppField
      FieldAlias = 'CD_UNID_NEG'
      FieldName = 'CD_UNID_NEG'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object pp_emissao_blppField3: TppField
      FieldAlias = 'CD_PRODUTO'
      FieldName = 'CD_PRODUTO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 2
    end
    object pp_emissao_blppField4: TppField
      FieldAlias = 'CD_CLIENTE'
      FieldName = 'CD_CLIENTE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 3
    end
    object pp_emissao_blppField5: TppField
      FieldAlias = 'CGC_EMPRESA'
      FieldName = 'CGC_EMPRESA'
      FieldLength = 14
      DisplayWidth = 14
      Position = 4
    end
    object pp_emissao_blppField6: TppField
      FieldAlias = 'NM_CLIENTE'
      FieldName = 'NM_CLIENTE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object pp_emissao_blppField7: TppField
      FieldAlias = 'END_CLIENTE'
      FieldName = 'END_CLIENTE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object pp_emissao_blppField8: TppField
      FieldAlias = 'END_NR_CLIENTE'
      FieldName = 'END_NR_CLIENTE'
      FieldLength = 6
      DisplayWidth = 6
      Position = 7
    end
    object pp_emissao_blppField9: TppField
      FieldAlias = 'CIDADE_CLIENTE'
      FieldName = 'CIDADE_CLIENTE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
    object pp_emissao_blppField10: TppField
      FieldAlias = 'UF_CLIENTE'
      FieldName = 'UF_CLIENTE'
      FieldLength = 2
      DisplayWidth = 2
      Position = 9
    end
    object pp_emissao_blppField11: TppField
      FieldAlias = 'CD_AGENTE'
      FieldName = 'CD_AGENTE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 10
    end
    object pp_emissao_blppField12: TppField
      FieldAlias = 'NM_AGENTE'
      FieldName = 'NM_AGENTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 11
    end
    object pp_emissao_blppField13: TppField
      FieldAlias = 'END_AGENTE'
      FieldName = 'END_AGENTE'
      FieldLength = 255
      DisplayWidth = 255
      Position = 12
    end
    object pp_emissao_blppField14: TppField
      FieldAlias = 'FONE_AGENTE'
      FieldName = 'FONE_AGENTE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
    object pp_emissao_blppField15: TppField
      FieldAlias = 'FAX_AGENTE'
      FieldName = 'FAX_AGENTE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 14
    end
    object pp_emissao_blppField16: TppField
      FieldAlias = 'NM_IMP'
      FieldName = 'NM_IMP'
      FieldLength = 60
      DisplayWidth = 60
      Position = 15
    end
    object pp_emissao_blppField17: TppField
      FieldAlias = 'END_IMP'
      FieldName = 'END_IMP'
      FieldLength = 60
      DisplayWidth = 60
      Position = 16
    end
    object pp_emissao_blppField18: TppField
      FieldAlias = 'NR_IMP'
      FieldName = 'NR_IMP'
      FieldLength = 6
      DisplayWidth = 6
      Position = 17
    end
    object pp_emissao_blppField19: TppField
      FieldAlias = 'CIDADE_IMP'
      FieldName = 'CIDADE_IMP'
      FieldLength = 30
      DisplayWidth = 30
      Position = 18
    end
    object pp_emissao_blppField20: TppField
      FieldAlias = 'CD_PAIS'
      FieldName = 'CD_PAIS'
      FieldLength = 3
      DisplayWidth = 3
      Position = 19
    end
    object pp_emissao_blppField21: TppField
      FieldAlias = 'PAIS_IMP'
      FieldName = 'PAIS_IMP'
      FieldLength = 120
      DisplayWidth = 120
      Position = 20
    end
    object pp_emissao_blppField22: TppField
      FieldAlias = 'CD_ORIGEM'
      FieldName = 'CD_ORIGEM'
      FieldLength = 4
      DisplayWidth = 4
      Position = 21
    end
    object pp_emissao_blppField23: TppField
      FieldAlias = 'ORIGEM'
      FieldName = 'ORIGEM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 22
    end
    object pp_emissao_blppField24: TppField
      FieldAlias = 'PAIS_ORIGEM'
      FieldName = 'PAIS_ORIGEM'
      FieldLength = 120
      DisplayWidth = 120
      Position = 23
    end
    object pp_emissao_blppField25: TppField
      FieldAlias = 'CD_DESTINO'
      FieldName = 'CD_DESTINO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 24
    end
    object pp_emissao_blppField26: TppField
      FieldAlias = 'DESTINO'
      FieldName = 'DESTINO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 25
    end
    object pp_emissao_blppField27: TppField
      FieldAlias = 'PAIS_DESTINO'
      FieldName = 'PAIS_DESTINO'
      FieldLength = 120
      DisplayWidth = 120
      Position = 26
    end
    object pp_emissao_blppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTD_VOLUME'
      FieldName = 'QTD_VOLUME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pp_emissao_blppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'CUBAGEM'
      FieldName = 'CUBAGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pp_emissao_blppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_BRUTO'
      FieldName = 'VL_PESO_BRUTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pp_emissao_blppField31: TppField
      FieldAlias = 'TP_FRETE'
      FieldName = 'TP_FRETE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 30
    end
    object pp_emissao_blppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_FRETE'
      FieldName = 'VL_FRETE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object pp_emissao_blppField33: TppField
      FieldAlias = 'TX_DESCR'
      FieldName = 'TX_DESCR'
      FieldLength = 255
      DisplayWidth = 255
      Position = 32
    end
    object pp_emissao_blppField34: TppField
      FieldAlias = 'DESCR_INGLES'
      FieldName = 'DESCR_INGLES'
      FieldLength = 255
      DisplayWidth = 255
      Position = 33
    end
    object pp_emissao_blppField35: TppField
      FieldAlias = 'TX_DOC_EMISSA'
      FieldName = 'TX_DOC_EMISSA'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 34
      Searchable = False
      Sortable = False
    end
    object pp_emissao_blppField36: TppField
      FieldAlias = 'calc_end_cliente'
      FieldName = 'calc_end_cliente'
      FieldLength = 255
      DisplayWidth = 255
      Position = 35
    end
    object pp_emissao_blppField37: TppField
      FieldAlias = 'CEP_CLIENTE'
      FieldName = 'CEP_CLIENTE'
      FieldLength = 8
      DisplayWidth = 8
      Position = 36
    end
    object pp_emissao_blppField38: TppField
      FieldAlias = 'calc_end_imp'
      FieldName = 'calc_end_imp'
      FieldLength = 255
      DisplayWidth = 255
      Position = 37
    end
    object pp_emissao_blppField39: TppField
      FieldAlias = 'calc_end_agente'
      FieldName = 'calc_end_agente'
      FieldLength = 255
      DisplayWidth = 255
      Position = 38
    end
    object pp_emissao_blppField40: TppField
      FieldAlias = 'calc_tp_frete'
      FieldName = 'calc_tp_frete'
      FieldLength = 15
      DisplayWidth = 15
      Position = 39
    end
    object pp_emissao_blppField41: TppField
      FieldAlias = 'NR_HOUSE'
      FieldName = 'NR_HOUSE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 40
    end
    object pp_emissao_blppField42: TppField
      FieldAlias = 'NR_VOO'
      FieldName = 'NR_VOO'
      FieldLength = 14
      DisplayWidth = 14
      Position = 41
    end
    object pp_emissao_blppField43: TppField
      FieldAlias = 'NM_NAVIO'
      FieldName = 'NM_NAVIO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 42
    end
    object pp_emissao_blppField44: TppField
      FieldAlias = 'calc_frete'
      FieldName = 'calc_frete'
      FieldLength = 255
      DisplayWidth = 255
      Position = 43
    end
    object pp_emissao_blppField45: TppField
      FieldAlias = 'calc_moeda'
      FieldName = 'calc_moeda'
      FieldLength = 150
      DisplayWidth = 150
      Position = 44
    end
    object pp_emissao_blppField46: TppField
      FieldAlias = 'calc_collect'
      FieldName = 'calc_collect'
      FieldLength = 100
      DisplayWidth = 100
      Position = 45
    end
    object pp_emissao_blppField47: TppField
      FieldAlias = 'calc_prepaid'
      FieldName = 'calc_prepaid'
      FieldLength = 100
      DisplayWidth = 100
      Position = 46
    end
    object pp_emissao_blppField48: TppField
      FieldAlias = 'calc_nm_usuario'
      FieldName = 'calc_nm_usuario'
      FieldLength = 30
      DisplayWidth = 30
      Position = 47
    end
    object pp_emissao_blppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_HOUSE'
      FieldName = 'VL_HOUSE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object pp_emissao_blppField50: TppField
      FieldAlias = 'ST_INSURANCE'
      FieldName = 'ST_INSURANCE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 49
    end
    object pp_emissao_blppField51: TppField
      FieldAlias = 'calc_valor_acordado'
      FieldName = 'calc_valor_acordado'
      FieldLength = 20
      DisplayWidth = 20
      Position = 50
    end
    object pp_emissao_blppField52: TppField
      FieldAlias = 'calc_freight_amount'
      FieldName = 'calc_freight_amount'
      FieldLength = 20
      DisplayWidth = 20
      Position = 51
    end
    object pp_emissao_blppField53: TppField
      FieldAlias = 'AP_MOEDA_FRETE'
      FieldName = 'AP_MOEDA_FRETE'
      FieldLength = 6
      DisplayWidth = 6
      Position = 52
    end
    object pp_emissao_blppField54: TppField
      FieldAlias = 'calc_copy'
      FieldName = 'calc_copy'
      FieldLength = 80
      DisplayWidth = 80
      Position = 53
    end
  end
  object qry_texto_bl_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_emissao
    SQL.Strings = (
      'SELECT CHAVE, COUNTER, CAMPO_TEXTO'
      ' FROM TEMISSAO_BL_DOC'
      '   WHERE CHAVE = :NR_PROCESSO')
    Left = 499
    Top = 162
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_texto_bl_CHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'DBBROKER.TEMISSAO_BL_DOC.CHAVE'
      FixedChar = True
    end
    object qry_texto_bl_COUNTER: TIntegerField
      FieldName = 'COUNTER'
      Origin = 'DBBROKER.TEMISSAO_BL_DOC.COUNTER'
    end
    object qry_texto_bl_CAMPO_TEXTO: TMemoField
      FieldName = 'CAMPO_TEXTO'
      Origin = 'DBBROKER.TEMISSAO_BL_DOC.CAMPO_TEXTO'
      BlobType = ftMemo
    end
  end
  object ds_texto_bl: TDataSource
    DataSet = qry_texto_bl_
    Left = 531
    Top = 162
  end
  object pp_texto_bl: TppBDEPipeline
    DataSource = ds_texto_bl
    UserName = 'pp_texto_bl'
    Left = 466
    Top = 163
  end
  object sp_texto_bl: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_texto_bl'
    Left = 574
    Top = 162
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@chave'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@counter'
        ParamType = ptInput
      end
      item
        DataType = ftMemo
        Name = '@texto'
        ParamType = ptInput
      end>
  end
  object qry_emissao_bl: TQuery
    CachedUpdates = True
    AfterPost = qry_emissao_blAfterPost
    OnCalcFields = qry_emissao_blCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TEMISSAO_BL'
      ' WHERE NR_PROCESSO =:NR_PROCESSO')
    UpdateObject = UpdateSQL1
    Left = 518
    Top = 63
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_emissao_blNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TEMISSAO_BL.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_emissao_blEND_SHIPPER: TStringField
      FieldName = 'END_SHIPPER'
      Origin = 'DBBROKER.TEMISSAO_BL.END_SHIPPER'
      FixedChar = True
      Size = 255
    end
    object qry_emissao_blEND_CONSIGNED: TStringField
      FieldName = 'END_CONSIGNED'
      Origin = 'DBBROKER.TEMISSAO_BL.END_CONSIGNED'
      FixedChar = True
      Size = 255
    end
    object qry_emissao_blEND_NOTIFY: TStringField
      FieldName = 'END_NOTIFY'
      Origin = 'DBBROKER.TEMISSAO_BL.END_NOTIFY'
      FixedChar = True
      Size = 255
    end
    object qry_emissao_blEND_CONSIGNOR: TStringField
      FieldName = 'END_CONSIGNOR'
      Origin = 'DBBROKER.TEMISSAO_BL.END_CONSIGNOR'
      FixedChar = True
      Size = 255
    end
    object qry_emissao_blNUMBER_ORIGINAL: TStringField
      FieldName = 'NUMBER_ORIGINAL'
      Origin = 'DBBROKER.TEMISSAO_BL.NUMBER_ORIGINAL'
      FixedChar = True
      Size = 2
    end
    object qry_emissao_blFREIGHT_PAY: TStringField
      FieldName = 'FREIGHT_PAY'
      Origin = 'DBBROKER.TEMISSAO_BL.FREIGHT_PAY'
      FixedChar = True
      Size = 15
    end
    object qry_emissao_blVESSEL: TStringField
      FieldName = 'VESSEL'
      Origin = 'DBBROKER.TEMISSAO_BL.VESSEL'
      FixedChar = True
      Size = 50
    end
    object qry_emissao_blNR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'DBBROKER.TEMISSAO_BL.NR_VIAGEM'
      FixedChar = True
      Size = 25
    end
    object qry_emissao_blPORT_LOAD: TStringField
      FieldName = 'PORT_LOAD'
      Origin = 'DBBROKER.TEMISSAO_BL.PORT_LOAD'
      FixedChar = True
      Size = 60
    end
    object qry_emissao_blPORT_RECEPT: TStringField
      FieldName = 'PORT_RECEPT'
      Origin = 'DBBROKER.TEMISSAO_BL.PORT_RECEPT'
      FixedChar = True
      Size = 60
    end
    object qry_emissao_blPORT_DISCHARGE: TStringField
      FieldName = 'PORT_DISCHARGE'
      Origin = 'DBBROKER.TEMISSAO_BL.PORT_DISCHARGE'
      FixedChar = True
      Size = 60
    end
    object qry_emissao_blPORT_DELYVERY: TStringField
      FieldName = 'PORT_DELYVERY'
      Origin = 'DBBROKER.TEMISSAO_BL.PORT_DELYVERY'
      FixedChar = True
      Size = 60
    end
    object qry_emissao_blSTR_MARKS: TStringField
      FieldName = 'STR_MARKS'
      Origin = 'DBBROKER.TEMISSAO_BL.STR_MARKS'
      FixedChar = True
      Size = 255
    end
    object qry_emissao_blNUMBER_PACKAGE: TStringField
      FieldName = 'NUMBER_PACKAGE'
      Origin = 'DBBROKER.TEMISSAO_BL.NUMBER_PACKAGE'
      FixedChar = True
      Size = 255
    end
    object qry_emissao_blDESCRIPTION_GOODS: TMemoField
      FieldName = 'DESCRIPTION_GOODS'
      Origin = 'DBBROKER.TEMISSAO_BL.DESCRIPTION_GOODS'
      BlobType = ftMemo
    end
    object qry_emissao_blGROSS_WEIGHT: TFloatField
      FieldName = 'GROSS_WEIGHT'
      Origin = 'DBBROKER.TEMISSAO_BL.GROSS_WEIGHT'
      DisplayFormat = '0.00'
    end
    object qry_emissao_blCUBAGEM: TFloatField
      FieldName = 'CUBAGEM'
      Origin = 'DBBROKER.TEMISSAO_BL.CUBAGEM'
      DisplayFormat = '0.00'
    end
    object qry_emissao_blFREIGHT_CHARGES: TStringField
      FieldName = 'FREIGHT_CHARGES'
      Origin = 'DBBROKER.TEMISSAO_BL.FREIGHT_CHARGES'
      FixedChar = True
      Size = 255
    end
    object qry_emissao_blCURRENCY: TStringField
      FieldName = 'CURRENCY'
      Origin = 'DBBROKER.TEMISSAO_BL.CURRENCY'
      FixedChar = True
      Size = 255
    end
    object qry_emissao_blSTR_PREPAID: TStringField
      FieldName = 'STR_PREPAID'
      Origin = 'DBBROKER.TEMISSAO_BL.STR_PREPAID'
      FixedChar = True
      Size = 255
    end
    object qry_emissao_blSTR_COLLECT: TStringField
      FieldName = 'STR_COLLECT'
      Origin = 'DBBROKER.TEMISSAO_BL.STR_COLLECT'
      FixedChar = True
      Size = 255
    end
    object qry_emissao_blFREIGHT_AMOUNT: TStringField
      FieldName = 'FREIGHT_AMOUNT'
      Origin = 'DBBROKER.TEMISSAO_BL.FREIGHT_AMOUNT'
      FixedChar = True
      Size = 50
    end
    object qry_emissao_blPLACE: TStringField
      FieldName = 'PLACE'
      Origin = 'DBBROKER.TEMISSAO_BL.PLACE'
      FixedChar = True
      Size = 60
    end
    object qry_emissao_blDT_ISSUE: TDateTimeField
      FieldName = 'DT_ISSUE'
      Origin = 'DBBROKER.TEMISSAO_BL.DT_ISSUE'
    end
    object qry_emissao_blEND_AG_DELIVERY: TStringField
      FieldName = 'END_AG_DELIVERY'
      Origin = 'DBBROKER.TEMISSAO_BL.NR_PROCESSO'
      FixedChar = True
      Size = 255
    end
    object qry_emissao_blNR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      Origin = 'DBBROKER.TEMISSAO_BL.NR_PROCESSO'
      FixedChar = True
      Size = 25
    end
    object qry_emissao_blNR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      Origin = 'DBBROKER.TEMISSAO_BL.NR_PROCESSO'
      FixedChar = True
      Size = 25
    end
    object qry_emissao_blIN_CARTA_CRED: TStringField
      FieldName = 'IN_CARTA_CRED'
      Origin = 'DBBROKER.TEMISSAO_BL.NR_PROCESSO'
      FixedChar = True
      Size = 1
    end
    object qry_emissao_blCD_USUARIO_ALT: TStringField
      FieldName = 'CD_USUARIO_ALT'
      Origin = 'DBBROKER.TEMISSAO_BL.NR_PROCESSO'
      FixedChar = True
      Size = 4
    end
    object qry_emissao_blcalc_nm_usuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_usuario'
      Size = 60
      Calculated = True
    end
    object qry_emissao_blcalc_tp_documento: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_documento'
      Size = 40
      Calculated = True
    end
  end
  object ds_emissao: TDataSource
    DataSet = qry_emissao_bl
    Left = 550
    Top = 63
  end
  object sp_emissao_bl: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_emissao_bl'
    Left = 582
    Top = 63
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
      'update TEMISSAO_BL'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  END_SHIPPER = :END_SHIPPER,'
      '  END_CONSIGNED = :END_CONSIGNED,'
      '  END_NOTIFY = :END_NOTIFY,'
      '  END_CONSIGNOR = :END_CONSIGNOR,'
      '  NUMBER_ORIGINAL = :NUMBER_ORIGINAL,'
      '  FREIGHT_PAY = :FREIGHT_PAY,'
      '  VESSEL = :VESSEL,'
      '  NR_VIAGEM = :NR_VIAGEM,'
      '  PORT_LOAD = :PORT_LOAD,'
      '  PORT_RECEPT = :PORT_RECEPT,'
      '  PORT_DISCHARGE = :PORT_DISCHARGE,'
      '  PORT_DELYVERY = :PORT_DELYVERY,'
      '  STR_MARKS = :STR_MARKS,'
      '  NUMBER_PACKAGE = :NUMBER_PACKAGE,'
      '  DESCRIPTION_GOODS = :DESCRIPTION_GOODS,'
      '  GROSS_WEIGHT = :GROSS_WEIGHT,'
      '  CUBAGEM = :CUBAGEM,'
      '  FREIGHT_CHARGES = :FREIGHT_CHARGES,'
      '  CURRENCY = :CURRENCY,'
      '  STR_PREPAID = :STR_PREPAID,'
      '  STR_COLLECT = :STR_COLLECT,'
      '  FREIGHT_AMOUNT = :FREIGHT_AMOUNT,'
      '  PLACE = :PLACE,'
      '  DT_ISSUE = :DT_ISSUE,'
      '  END_AG_DELIVERY = :END_AG_DELIVERY,'
      '  NR_MASTER = :NR_MASTER,'
      '  NR_HOUSE = :NR_HOUSE,'
      '  IN_CARTA_CRED = :IN_CARTA_CRED,'
      '  CD_USUARIO_ALT = :CD_USUARIO_ALT'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TEMISSAO_BL'
      
        '  (NR_PROCESSO, END_SHIPPER, END_CONSIGNED, END_NOTIFY, END_CONS' +
        'IGNOR, '
      
        '   NUMBER_ORIGINAL, FREIGHT_PAY, VESSEL, NR_VIAGEM, PORT_LOAD, P' +
        'ORT_RECEPT, '
      
        '   PORT_DISCHARGE, PORT_DELYVERY, STR_MARKS, NUMBER_PACKAGE, DES' +
        'CRIPTION_GOODS, '
      
        '   GROSS_WEIGHT, CUBAGEM, FREIGHT_CHARGES, CURRENCY, STR_PREPAID' +
        ', STR_COLLECT, '
      
        '   FREIGHT_AMOUNT, PLACE, DT_ISSUE, END_AG_DELIVERY, NR_MASTER, ' +
        'NR_HOUSE, '
      '   IN_CARTA_CRED, CD_USUARIO_ALT)'
      'values'
      
        '  (:NR_PROCESSO, :END_SHIPPER, :END_CONSIGNED, :END_NOTIFY, :END' +
        '_CONSIGNOR, '
      
        '   :NUMBER_ORIGINAL, :FREIGHT_PAY, :VESSEL, :NR_VIAGEM, :PORT_LO' +
        'AD, :PORT_RECEPT, '
      
        '   :PORT_DISCHARGE, :PORT_DELYVERY, :STR_MARKS, :NUMBER_PACKAGE,' +
        ' :DESCRIPTION_GOODS, '
      
        '   :GROSS_WEIGHT, :CUBAGEM, :FREIGHT_CHARGES, :CURRENCY, :STR_PR' +
        'EPAID, '
      
        '   :STR_COLLECT, :FREIGHT_AMOUNT, :PLACE, :DT_ISSUE, :END_AG_DEL' +
        'IVERY, '
      '   :NR_MASTER, :NR_HOUSE, :IN_CARTA_CRED, :CD_USUARIO_ALT)')
    DeleteSQL.Strings = (
      'delete from TEMISSAO_BL'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 614
    Top = 63
  end
  object sp_emissao_draft: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_emissao_draft'
    Left = 582
    Top = 95
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_master'
        ParamType = ptInput
      end>
  end
end
