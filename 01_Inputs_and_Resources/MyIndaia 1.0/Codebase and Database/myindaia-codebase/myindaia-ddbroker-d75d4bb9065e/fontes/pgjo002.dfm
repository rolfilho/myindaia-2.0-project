object frm_LI: Tfrm_LI
  Left = 75
  Top = 52
  Width = 648
  Height = 488
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Licença de Importação'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 44
    Width = 632
    Height = 390
  end
  object Bevel1: TBevel
    Left = 4
    Top = 48
    Width = 621
    Height = 169
  end
  object lbl_nr_processo: TLabel
    Left = 26
    Top = 100
    Width = 53
    Height = 13
    Caption = 'Processo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_nr_processo: TSpeedButton
    Left = 202
    Top = 96
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
    OnClick = btn_nr_processoClick
  end
  object lbl_cd_unid_neg: TLabel
    Left = 31
    Top = 72
    Width = 48
    Height = 13
    Caption = 'Unidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_cd_cliente: TLabel
    Left = 36
    Top = 132
    Width = 44
    Height = 13
    Caption = 'Cliente:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_cd_servico: TLabel
    Left = 32
    Top = 162
    Width = 48
    Height = 13
    Caption = 'Serviço:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_unid_neg: TSpeedButton
    Left = 285
    Top = 68
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
    OnClick = btn_co_unid_negClick
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair_li: TSpeedButton
      Left = 173
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Saída'
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
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_sair_liClick
    end
    object btn_nova_li: TSpeedButton
      Left = 8
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Nova LI'
      Enabled = False
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
      Layout = blGlyphBottom
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_nova_liClick
    end
    object btn_capa_li: TSpeedButton
      Left = 40
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Capa LI'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_capa_liClick
    end
    object btn_itens_li: TSpeedButton
      Left = 72
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Itens LI'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FF666FFFF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FF6F666FF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FF66F6FFF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_itens_liClick
    end
    object btn_duplica_li: TSpeedButton
      Left = 105
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Duplicação de LI '
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_duplica_liClick
    end
    object btn_imprime_li: TSpeedButton
      Left = 141
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Imprime a Capa/Itens da LI'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888880000000
        000077777FFFFFFFFFFF888880EEEEEEEEE077777F777777777F888880EE5EE0
        000077777F77577FFFFF888880E0550EEEE077777F7F55F7777F88880EEE050E
        EEE07777F777F5F7777F8880EE0EE055EEE0777F77F77F55777F880EE0EE0E05
        5EE077F77F77F7F5577F80EE0EE0EEE055E07F77F77F777F557F0EE0EE0EE9EE
        0550F77F77F77B77F55F80EEE0EE9EE055E07F777F77B77F557F880EEEE9EE05
        5EE077F7777B77F5577F8889999EE055EEE0777BBBB77F55777F88980EEE055E
        000077B80777F557FFFF888980E055EE0EE0777B8F7F5577F77F888890EEEEEE
        0E087777BF777777F7F89999800000000088BBBB8FFFFFFFFF88}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_imprime_liClick
    end
  end
  object mskedt_nr_processo: TMaskEdit
    Left = 88
    Top = 96
    Width = 113
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = mskedt_nr_processoChange
    OnExit = mskedt_nr_processoExit
    OnKeyDown = mskedt_nr_processoKeyDown
  end
  object mskedt_cd_unid_neg: TMaskEdit
    Left = 88
    Top = 68
    Width = 21
    Height = 21
    EditMask = '99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 1
    OnExit = mskedt_cd_unid_negExit
  end
  object edt_nm_unid_neg: TEdit
    Left = 112
    Top = 68
    Width = 169
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 5
  end
  object edt_cd_cliente: TEdit
    Left = 88
    Top = 128
    Width = 37
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 3
  end
  object edt_nm_cliente: TEdit
    Left = 128
    Top = 128
    Width = 345
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 6
  end
  object edt_cd_servico: TEdit
    Left = 88
    Top = 159
    Width = 25
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 4
  end
  object edt_nm_servico: TEdit
    Left = 116
    Top = 159
    Width = 261
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 7
  end
  object Panel1: TPanel
    Left = 4
    Top = 220
    Width = 621
    Height = 209
    BevelOuter = bvLowered
    BevelWidth = 5
    Caption = 'Panel1'
    TabOrder = 8
    object dbgrd_LI: TDBGrid
      Left = 5
      Top = 5
      Width = 611
      Height = 198
      DataSource = datm_LI.ds_li
      Enabled = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgrd_LIDblClick
      OnEnter = dbgrd_LIEnter
      Columns = <
        item
          FieldName = 'calc_nr_proc'
          ReadOnly = True
          Title.Caption = 'Nº Processo LI'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 119
        end
        item
          FieldName = 'DT_PROCESSO_LI'
          ReadOnly = True
          Title.Caption = 'Data Abertura'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 125
        end
        item
          FieldName = 'NR_REGISTRO_LI'
          ReadOnly = True
          Title.Caption = 'Nº Registro'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 137
        end
        item
          FieldName = 'DT_REGISTRO_LI'
          ReadOnly = True
          Title.Caption = 'Data Registro'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 197
        end>
    end
  end
  object menu_cadastro: TMainMenu
    Left = 560
    Top = 112
    object mi_nova_li: TMenuItem
      Caption = '&Nova '
      Enabled = False
      Hint = ' '
      RadioItem = True
      OnClick = btn_nova_liClick
    end
    object mi_capa_li: TMenuItem
      Caption = '&Capa'
      Enabled = False
      Hint = ' '
      RadioItem = True
      OnClick = btn_capa_liClick
    end
    object mi_item_li: TMenuItem
      Caption = '&Item'
      Enabled = False
      Hint = ' '
      RadioItem = True
      OnClick = btn_itens_liClick
    end
    object mi_duplica_li: TMenuItem
      Caption = '&Duplica'
      Enabled = False
      OnClick = btn_duplica_liClick
    end
    object mi_saida: TMenuItem
      Caption = '&Saída'
      RadioItem = True
      OnClick = btn_sair_liClick
    end
  end
  object Crpe1: TCrpe
    WindowShowPrintSetupBtn = True
    LoadEngineOnUse = False
    Left = 560
    Top = 72
  end
end
