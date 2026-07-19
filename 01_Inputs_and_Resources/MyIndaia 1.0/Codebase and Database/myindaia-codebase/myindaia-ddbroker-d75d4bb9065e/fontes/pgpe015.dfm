object frm_pe_consulta_prod: Tfrm_pe_consulta_prod
  Left = 215
  Top = 138
  Width = 640
  Height = 480
  Caption = 'Consulta Saldos dos Produtos'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = main_cons_produtos
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_pe_consulta: TPanel
    Left = 1
    Top = 2
    Width = 629
    Height = 431
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 0
    object lbl_nr_processo: TLabel
      Left = 360
      Top = 43
      Width = 64
      Height = 13
      Caption = 'Mercadoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_produto: TSpeedButton
      Left = 491
      Top = 59
      Width = 25
      Height = 21
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
    object lbl_importador2: TLabel
      Left = 9
      Top = 43
      Width = 40
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton6: TSpeedButton
      Left = 261
      Top = 58
      Width = 25
      Height = 22
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
      OnClick = SpeedButton6Click
    end
    object dbgrd_consulta_prod: TDBGrid
      Left = 8
      Top = 88
      Width = 614
      Height = 329
      Ctl3D = True
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          FieldName = 'NR_PROCESSO'
          Title.Caption = 'Processo'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 111
        end
        item
          FieldName = 'CD_EXPORTADOR'
          Title.Caption = 'Cód.Cliente'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 80
        end
        item
          FieldName = 'QT_MERCADORIA'
          Title.Caption = 'Qtde Inicial'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 127
        end
        item
          FieldName = 'NR_ITEM'
          Title.Caption = 'Item'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 74
        end
        item
          FieldName = 'CD_NCM'
          Title.Caption = 'NCM'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 142
        end>
    end
    object mskedt_cd_cliente: TMaskEdit
      Left = 9
      Top = 59
      Width = 39
      Height = 21
      EditMask = '99999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 0
      Text = 'mskedt cd cliente'
      OnExit = mskedt_cd_clienteExit
      OnKeyDown = mskedt_cd_mercadoriaKeyDown
    end
    object edt_nm_cliente: TEdit
      Left = 49
      Top = 59
      Width = 210
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
      Text = 'edt_nm_cliente'
    end
    object mskedt_cd_mercadoria: TMaskEdit
      Left = 361
      Top = 59
      Width = 127
      Height = 21
      TabOrder = 1
      OnExit = mskedt_cd_mercadoriaExit
      OnKeyDown = mskedt_cd_mercadoriaKeyDown
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 625
      Height = 33
      BevelOuter = bvLowered
      TabOrder = 4
      object SpeedButton1: TSpeedButton
        Left = 11
        Top = 4
        Width = 25
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
        OnClick = btn_fecharClick
      end
    end
  end
  object main_cons_produtos: TMainMenu
    Left = 385
    Top = 234
    object mi_sair: TMenuItem
      Caption = '&Sair'
      OnClick = btn_fecharClick
    end
  end
end
