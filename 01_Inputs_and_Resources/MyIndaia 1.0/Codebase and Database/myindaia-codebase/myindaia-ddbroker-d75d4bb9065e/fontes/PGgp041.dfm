object frm_integra_jump: Tfrm_integra_jump
  Left = 168
  Top = 183
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Integração DDBroker x Jump'
  ClientHeight = 245
  ClientWidth = 569
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_integra: TPanel
    Left = 5
    Top = 0
    Width = 562
    Height = 41
    BevelOuter = bvLowered
    TabOrder = 1
    object btn_integrar: TSpeedButton
      Left = 6
      Top = 9
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
      OnClick = btn_integrarClick
    end
    object speed_sair_: TSpeedButton
      Left = 38
      Top = 9
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
  object Panel3: TPanel
    Left = 5
    Top = 48
    Width = 562
    Height = 193
    BevelOuter = bvLowered
    TabOrder = 0
    object Label7: TLabel
      Left = 243
      Top = 23
      Width = 8
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 15
      Top = 20
      Width = 125
      Height = 13
      Caption = 'Selecione um período'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object msk_dt_inicio: TMaskEdit
      Left = 155
      Top = 15
      Width = 73
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnExit = msk_dt_inicioExit
    end
    object msk_dt_fim: TMaskEdit
      Left = 265
      Top = 15
      Width = 73
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object menu_: TMainMenu
    Left = 464
    Top = 136
    object mi_integrar_: TMenuItem
      Caption = '&Integrar'
      OnClick = btn_integrarClick
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
    Left = 504
    Top = 136
  end
end
