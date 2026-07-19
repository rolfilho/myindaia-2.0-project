object frm_integracao_numerario_mattel: Tfrm_integracao_numerario_mattel
  Left = 1699
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Numer'#225'rio'
  ClientHeight = 318
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 388
    Height = 318
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 384
      Height = 127
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object shpTitulo: TShape
        Left = 8
        Top = 10
        Width = 472
        Height = 25
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lblTitulo: TLabel
        Left = 16
        Top = 15
        Width = 265
        Height = 16
        Caption = 'Relat'#243'rio Integra'#231#227'o Numerario Mattel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_nr_processo: TLabel
        Left = 8
        Top = 84
        Width = 53
        Height = 13
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object btn_co_processo: TSpeedButton
        Left = 110
        Top = 96
        Width = 23
        Height = 19
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = btn_co_processoClick
      end
      object btnAdd: TSpeedButton
        Left = 145
        Top = 97
        Width = 33
        Height = 19
        Flat = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000666666666666666666666666666666666666000066666666FFF666666666
          666666FFF666666600006666666844F66666666666666888F666666600006666
          666844F66666666666666888F666666600006666666844F66666666666666888
          F666666600006666FFF644FFFFF6666666FFF888FFFFF6660000666844444444
          44F66666688888888888F666000066684444444444F66666688888888888F666
          000066688888446888666666688888888888666600006666666844F666666666
          66666888F666666600006666666844F66666666666666888F666666600006666
          666844F66666666666666888F666666600006666666888666666666666666888
          6666666600006666666666666666666666666666666666660000666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000}
        NumGlyphs = 2
        OnClick = btnAddClick
      end
      object btn5: TSpeedButton
        Left = 182
        Top = 97
        Width = 33
        Height = 19
        Flat = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000666666666666666666666666666666666666000066666666666666666666
          6666666666666666000066666666666666666666666666666666666600006666
          6666666666666666666666666666666600006666666666666666666666666666
          6666666600006666FFFFFFFFFFF6666666FFFFFFFFFFF6660000666800000000
          00F66666687777777777F666000066680000000000F66666687777777777F666
          0000666888888888886666666888888888886666000066666666666666666666
          6666666666666666000066666666666666666666666666666666666600006666
          6666666666666666666666666666666600006666666666666666666666666666
          6666666600006666666666666666666666666666666666660000666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000}
        NumGlyphs = 2
        OnClick = btn5Click
      end
      object lbl_cd_produto: TLabel
        Left = 195
        Top = 46
        Width = 45
        Height = 13
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object btn_co_produto: TSpeedButton
        Left = 350
        Top = 58
        Width = 23
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = btn_co_produtoClick
      end
      object lbl_cd_unid_neg: TLabel
        Left = 8
        Top = 45
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object btn_co_unid_neg: TSpeedButton
        Left = 163
        Top = 57
        Width = 23
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = btn_co_unid_negClick
      end
      object msk_nr_processo: TMaskEdit
        Left = 8
        Top = 96
        Width = 100
        Height = 21
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        BevelKind = bkSoft
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 14
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnKeyDown = msk_nr_processoKeyDown
      end
      object msk_cd_produto: TMaskEdit
        Left = 195
        Top = 58
        Width = 29
        Height = 21
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        BevelKind = bkSoft
        Ctl3D = False
        EditMask = '!99;0; '
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 1
        OnChange = btn_co_produtoClick
      end
      object edt_nm_produto: TEdit
        Left = 225
        Top = 58
        Width = 123
        Height = 21
        TabStop = False
        AutoSize = False
        BevelInner = bvLowered
        BevelKind = bkSoft
        BevelOuter = bvNone
        Ctl3D = False
        ParentColor = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object msk_cd_unid_neg: TMaskEdit
        Left = 8
        Top = 57
        Width = 29
        Height = 21
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        BevelKind = bkSoft
        Ctl3D = False
        EditMask = '!99;0; '
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 0
        OnChange = btn_co_unid_negClick
      end
      object edt_nm_unid_neg: TEdit
        Left = 38
        Top = 57
        Width = 123
        Height = 21
        TabStop = False
        AutoSize = False
        BevelInner = bvLowered
        BevelKind = bkSoft
        BevelOuter = bvNone
        Ctl3D = False
        ParentColor = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 129
      Width = 384
      Height = 146
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 8
      Caption = 'Panel2'
      TabOrder = 1
      object dbgProcessos: TDBGrid
        Left = 8
        Top = 8
        Width = 368
        Height = 130
        Align = alClient
        DataSource = dsMain
        FixedColor = clBtnShadow
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_PROCESSO'
            Title.Caption = 'Processos'
            Title.Color = clWindow
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 150
            Visible = True
          end>
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 275
      Width = 384
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        384
        41)
      object btnGeraPlanilha: TSpeedButton
        Left = 183
        Top = 3
        Width = 83
        Height = 30
        Hint = 'Sair'
        Anchors = [akRight, akBottom]
        Caption = 'Gerar'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btnGeraPlanilhaClick
      end
      object btn_sair: TSpeedButton
        Left = 281
        Top = 3
        Width = 83
        Height = 30
        Hint = 'Sair'
        Anchors = [akRight, akBottom]
        Caption = '&Sair'
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
    end
  end
  object cdsMain: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 208
    object cdsMainNR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
  end
  object dsMain: TDataSource
    DataSet = cdsMain
    Left = 272
    Top = 208
  end
end
