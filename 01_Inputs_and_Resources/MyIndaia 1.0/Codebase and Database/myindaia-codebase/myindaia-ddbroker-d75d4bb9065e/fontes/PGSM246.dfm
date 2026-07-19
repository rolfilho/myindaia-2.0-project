object frm_atualiza_ncm: Tfrm_atualiza_ncm
  Left = 148
  Top = 180
  ActiveControl = edt_nm_file_
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Atualização NCM - Importação'
  ClientHeight = 249
  ClientWidth = 597
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_file_: TPanel
    Left = 86
    Top = 0
    Width = 504
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 0
    object Speed_file_: TSpeedButton
      Left = 470
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Novo'
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
      Left = 7
      Top = 17
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
      Left = 168
      Top = 13
      Width = 295
      Height = 21
      TabOrder = 0
      OnKeyDown = edt_nm_file_KeyDown
    end
  end
  object pnl_integra: TPanel
    Left = 0
    Top = 0
    Width = 81
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 1
    object btn_atualizar: TSpeedButton
      Left = 9
      Top = 12
      Width = 25
      Height = 25
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
      OnClick = btn_atualizarClick
    end
    object speed_sair_: TSpeedButton
      Left = 46
      Top = 12
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
      OnClick = speed_sair_Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 209
    Width = 593
    Height = 33
    TabOrder = 2
    object progress_file_: TProgressBar
      Left = 4
      Top = 4
      Width = 584
      Height = 26
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
    end
  end
  object menu_: TMainMenu
    Left = 544
    Top = 80
    object mi_atualizar_: TMenuItem
      Caption = '&Atualizar'
      OnClick = mi_atualizar_Click
    end
    object mi_sair_: TMenuItem
      Caption = '&Sair'
      OnClick = mi_sair_Click
    end
  end
  object open_file_: TOpenDialog
    Filter = 'Arquivo texto|*.TXT;'
    InitialDir = 'C:\'
    Title = 'Informe o arquivo de integração...'
    Left = 544
    Top = 144
  end
end
