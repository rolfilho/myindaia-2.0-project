object frm_po_leitura: Tfrm_po_leitura
  Left = 239
  Top = 223
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Leitura Padr'#227'o para o PO'
  ClientHeight = 188
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_integra: TPanel
    Left = 0
    Top = 0
    Width = 519
    Height = 53
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_integrar: TSpeedButton
      Left = 5
      Top = 4
      Width = 42
      Height = 45
      Hint = 'Integrar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_integrarClick
    end
    object speed_sair_: TSpeedButton
      Left = 133
      Top = 4
      Width = 42
      Height = 45
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
      OnClick = speed_sair_Click
    end
    object pnl_file_: TPanel
      Left = 178
      Top = 2
      Width = 339
      Height = 49
      Align = alRight
      BevelInner = bvLowered
      ParentColor = True
      TabOrder = 0
      object Speed_file_: TSpeedButton
        Left = 305
        Top = 19
        Width = 25
        Height = 24
        Hint = 'Novo'
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
        ParentShowHint = False
        ShowHint = True
        OnClick = Speed_file_Click
      end
      object Label1: TLabel
        Left = 9
        Top = 7
        Width = 156
        Height = 13
        Caption = 'Informe o nome do arquivo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_nm_file_: TEdit
        Left = 9
        Top = 20
        Width = 295
        Height = 21
        TabOrder = 0
        OnKeyDown = edt_nm_file_KeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 164
    Width = 519
    Height = 24
    Align = alBottom
    BorderWidth = 3
    TabOrder = 1
    object progress_file_: TProgressBar
      Left = 4
      Top = 4
      Width = 511
      Height = 16
      Align = alClient
      Step = 1
      TabOrder = 0
    end
  end
  object menu_: TMainMenu
    Left = 544
    Top = 80
    object mi_integrar_: TMenuItem
      Caption = '&Integrar'
      OnClick = mi_integrar_Click
    end
    object mi_sair_: TMenuItem
      Caption = '&Sair'
      OnClick = mi_sair_Click
    end
  end
  object open_file_: TOpenDialog
    Filter = 'Arquivo texto|*.TXT;'
    InitialDir = 'C:\'
    Title = 'Informe o arquivo de integra'#231#227'o...'
    Left = 544
    Top = 144
  end
end
