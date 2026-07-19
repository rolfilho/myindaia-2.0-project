object frm_ver_query: Tfrm_ver_query
  Left = 248
  Top = 216
  Width = 804
  Height = 533
  Caption = 'Verifica SQL Query'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_background: TPanel
    Left = 0
    Top = 36
    Width = 796
    Height = 470
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 794
      Height = 22
      Align = alTop
      AutoSize = False
      Caption = '  SQL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlBottom
    end
    object memo_sql: TMemo
      Left = 1
      Top = 23
      Width = 794
      Height = 214
      Align = alClient
      Ctl3D = False
      ParentCtl3D = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnChange = memo_sqlChange
    end
    object pnl_Resultado: TPanel
      Left = 1
      Top = 237
      Width = 794
      Height = 232
      Align = alBottom
      TabOrder = 1
      Visible = False
      DesignSize = (
        794
        232)
      object Label6: TLabel
        Left = 1
        Top = 1
        Width = 792
        Height = 37
        Align = alTop
        AutoSize = False
        Caption = '  Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlBottom
      end
      object btn_fechar_result: TSpeedButton
        Left = 768
        Top = 11
        Width = 20
        Height = 19
        Cursor = crHandPoint
        Hint = 'fechar'
        Anchors = [akTop, akRight]
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_fechar_resultClick
      end
      object dbGrid_Resultado: TDBGrid
        Left = 1
        Top = 39
        Width = 792
        Height = 192
        Align = alBottom
        Ctl3D = False
        DataSource = dsTemp
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object sgParams: TStringGrid
        Left = 97
        Top = 2
        Width = 643
        Height = 36
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = 7895160
        ColCount = 2
        Ctl3D = False
        DefaultColWidth = 310
        DefaultRowHeight = 15
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [goVertLine, goColSizing, goAlwaysShowEditor]
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
  end
  object pnl_topo: TPanel
    Left = 0
    Top = 0
    Width = 796
    Height = 36
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      796
      36)
    object btn_executa_query: TSpeedButton
      Left = 369
      Top = 8
      Width = 22
      Height = 20
      Cursor = crHandPoint
      Hint = 'executa query'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF003B00003B00003700002D00002800002800FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006804006804347E386E9C6F82
        AA857BA17B4F7C500F4510002800002800FF00FFFF00FFFF00FFFF00FFFF00FF
        007A072C8E32B7D7BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EBE2668E680031
        00012C03FF00FFFF00FFFF00FF0086083C9F43E9F4EAFFFFFFEBF3ECA3C3A47E
        A67F8BAC8BCCDACCFFFFFFFFFFFF84A584003200002E00FF00FFFF00FF1A9A25
        E1F2E2FFFFFF9AC69D136B17065308064A07024403064607568456F3F7F3FFFF
        FF668E67002E00FF00FF009B0B8BD090FFFFFFB0D8B210781511671491B69316
        5E17084F09054806023F03578658FFFFFFE4ECE40F4B1000400011A41ED5EFD6
        FFFFFF36A13E1A801E17771BFFFFFFBCD4BD216A230A540C084D08024803CDDC
        CEFFFFFF5085520040002BAD36F2FAF3DFF3E1209A281F8E251D8622F2F8F3FF
        FFFFD1E3D24183430C5B0E0851098CAE8EFFFFFF7DAB7F0050004AB952FFFFFF
        CDECD026A22D249C2C219428F2F8F2FFFFFFFFFFFFC4DCC51269150F61117CA7
        7EFFFFFF87B68A005C0057BF60FFFFFEEEF9EF2AAB3228A73026A02EF3F9F3FF
        FFFFC6E1C73B934017791C106D13A3C6A5FFFFFF72AD7500600047B950F0F9F1
        FFFFFF55BE5C2BAD3329AA31FCFEFDB2DDB52C9C322090261D88231B8020EBF3
        EBFFFFFF39923E006000FF00FFC6E9C9FFFFFFD8F0D932B03B2BAD3390D4952D
        AA3328A32F259E2C19911F9DCDA0FFFFFFBDDEC0037909FF00FFFF00FF6BC671
        FAFDFAFFFFFFD9F0DA54BE5C2BAD332AAD3225AA2E3BB043B0DDB4FFFFFFEBF6
        EB2E9C36037909FF00FFFF00FFFF00FF9BD8A0FDFEFDFFFFFFFFFFFFECF8EDCB
        EBCEDAF1DDFFFFFFFFFFFFDFF1E03EAD47008907FF00FFFF00FFFF00FFFF00FF
        FF00FF89D28FDFF3E1FFFFFFFFFFFFFFFFFFFFFFFFF6FBF6ABDFB027AC320089
        07FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF76CB7C82D088A3DBA8AB
        DFAE90D49559BF6218A824FF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_executa_queryClick
    end
    object SpeedButton1: TSpeedButton
      Left = 767
      Top = 6
      Width = 22
      Height = 23
      Cursor = crHandPoint
      Hint = 'Sair'
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
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
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object pnl_field: TPanel
      Left = 416
      Top = 7
      Width = 329
      Height = 22
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 4
        Width = 32
        Height = 13
        Caption = 'Field:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_Field: TEdit
        Left = 42
        Top = 4
        Width = 281
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '----'
      end
    end
    object pnl_query: TPanel
      Left = 8
      Top = 7
      Width = 353
      Height = 22
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object Label4: TLabel
        Left = 8
        Top = 4
        Width = 38
        Height = 13
        Caption = 'Query:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_Query: TEdit
        Left = 49
        Top = 4
        Width = 296
        Height = 14
        AutoSize = False
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '----'
      end
    end
  end
  object qTemp: TQuery
    DatabaseName = 'DBBROKER'
    Left = 648
    Top = 432
  end
  object dsTemp: TDataSource
    DataSet = qTemp
    Left = 696
    Top = 432
  end
end
